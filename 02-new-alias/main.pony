actor Main
  new create(env: Env) =>
    // alias assigned from new object
    let alias1 = String
    alias1 .> append("a") .> append("b") .> append("c")

    // alias assigned from existing alias
    let alias2 = alias1

    let alias3 = alias2.clone()

    // alias assigned from consumed alias
    // `alias3` no longer exists, cannot be used
    var alias4: String = consume alias3

    // `alias4` gets new value, `alias5` get old value of `alias4`
    // this is called a "destructive read"
    let alias5 = alias4 = "efg"

    env.out.print(alias5)
