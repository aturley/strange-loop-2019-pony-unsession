actor Main
  new create(env: Env) =>
    let alias1: String iso = recover String end
    alias1 .> append("a") .> append("b") .> append("c")

    // `print` is a behavior, Main must give up the reference to `alias1`
    env.out.print(consume alias1)
