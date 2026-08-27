# Axis Hash

Retroactive `Hash.Protocol` conformance for the const-generic `Axis` type.
Axis owns its native `Equatable` and `Hashable` behavior; this seam exposes
that implementation through Hash's domain-typed `Hash.Value` without coupling
either atom to the other.
