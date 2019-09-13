actor Main
  new create(env: Env) =>

  Screamer("Anne").scream_forever(env.out)
  Screamer("Bruce").scream_forever(env.out)

actor Screamer
  let _name: String

  new create(name: String) =>
    _name = name

  be scream_forever(os: OutStream tag) =>
    _scream(os)
    scream_forever(os)

  fun _scream(os: OutStream tag) =>
    os.print(_name)
