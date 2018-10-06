# ---- BASE --- #
FROM node:10.11-alpine AS base
# set working directory
WORKDIR /usr/src/simplified-kubernetes
COPY package.json .

# --- DEPEDENCIES ---#
FROM base AS dependencies
RUN yarn install --production
# copy production node to prod_node_modules
RUN cp -R node_modules prod_node_modules
# install all modules
RUN yarn install


# --- TEST --- #
FROM dependencies AS test
COPY . .
RUN yarn run test

# --- RELEASE --- #
FROM base AS release
# copy production node_modules
COPY --from=dependencies /usr/src/simplified-kubernetes/prod_node_modules ./node_modules
# copy source file to prod dir
COPY . .
# expose container apps
EXPOSE 5000
# rune node
CMD node index.js