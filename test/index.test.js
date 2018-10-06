process.env.NODE_ENV = 'test';

const chai = require('chai');
const chaiHttp = require('chai-http');
const index = require('../index');
const should = chai.should();

chai.use(chaiHttp);

describe('Index test', () => {
  // test /GET route
  describe('/GET main route', () => {
    it('It should get 200 and json object', done => {
      chai
        .request(index)
        .get('/')
        .end((err, res) => {
          res.should.have.status(200);
          res.body.should.be.a('object');
          done();
        });
    });
  });
});
