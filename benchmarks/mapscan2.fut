-- ==
-- compiled input @ mapscan-data/mapscan2-1.in
-- auto output
-- compiled input @ mapscan-data/mapscan2-2.in
-- auto output
-- compiled input @ mapscan-data/mapscan2-3.in
-- auto output

-- compiled input @ mapscan-data/mapscan2-4.in
-- auto output
let main [k] (ns: []i32) (xs: [k]i32)
             : [k]i32 =
  loop xs for n in ns do
  let m = k / i64.i32 n
  let xss' = unflatten m (i64.i32 n) xs
  let xss =
    map2 (\row i ->
            loop row for _ in 0..<64 do
              let row' = map (+ (i32.i64 i)) row
              in scan (+) 0 row'
         )
         xss' (iota m)
  in flatten_to k xss
