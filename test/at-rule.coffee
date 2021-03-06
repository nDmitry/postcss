AtRule = require('../lib/postcss/at-rule')

describe 'AtRule', ->

  it 'includes mixin by first child type', ->
    for name in ['append', 'prepend']
      rule = new AtRule()
      rule[name]({ type: 'rule' })
      rule.rules.should.be.instanceOf(Array)
      rule.rules.length.should.eql(1)

      rule = new AtRule()
      rule[name]({ type: 'decl' })
      rule.decls.should.be.instanceOf(Array)
      rule.decls.length.should.eql(1)

  it 'initializes with properties', ->
    rule = new AtRule(name: 'encoding', params: '"utf-8"')

    rule.name.should.eql('encoding')
    rule.params.should.eql('"utf-8"')

    rule.toString().should.eql('@encoding "utf-8";')
