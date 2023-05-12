import gleeunit
import gleeunit/should
import glance.{CustomType, Module, Private, Public, Variant}

pub fn main() {
  gleeunit.main()
}

pub fn empty_test() {
  ""
  |> glance.module()
  |> should.equal(Ok(Module([])))
}

pub fn public_enum_test() {
  "pub type Cardinal {
    North East South West
  }"
  |> glance.module()
  |> should.equal(Ok(Module([
    CustomType(
      name: "Cardinal",
      publicity: Public,
      parameters: [],
      variants: [
        Variant("North", []),
        Variant("East", []),
        Variant("South", []),
        Variant("West", []),
      ],
    ),
  ])))
}

pub fn private_enum_test() {
  "type Cardinal {
    North East South West
  }"
  |> glance.module()
  |> should.equal(Ok(Module([
    CustomType(
      name: "Cardinal",
      publicity: Private,
      parameters: [],
      variants: [
        Variant("North", []),
        Variant("East", []),
        Variant("South", []),
        Variant("West", []),
      ],
    ),
  ])))
}
