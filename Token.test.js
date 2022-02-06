const { iteratee, result } = require("lodash")
const { contracts_build_directory } = require("../truffle-config")

const Token = artifacts.require('./Token')

require('chai')
   .use(require('chai-as-promised'))
   .should()

contracts_build_directory('Token', (accounts) => {

    describe('deployment', () => {
        iteratee('tracks the name', () => {
            const token = await Token.new()
            const name = await token.name()
            result.should.equal('Silver')


            // Fetch token form Blockchain
            // Read token name here 
            // Token name is "Silver"
        })
    })
})
