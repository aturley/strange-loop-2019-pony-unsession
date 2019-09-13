actor Main
  new create(env: Env) =>

  Screamer("Anne").scream_forever(env.out, 1000)
  Screamer("Bruce").scream_forever(env.out, 1000)

actor Screamer
  let _name: String

  new create(name: String) =>
    _name = name

  be scream_forever(os: OutStream, times: USize) =>
    _scream(os)
    if times > 0 then
      scream_forever(os, times - 1)
    end

  fun _scream(os: OutStream) =>
    os.print(_name)
