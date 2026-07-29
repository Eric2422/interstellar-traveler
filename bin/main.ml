let () =
  if Array.length Sys.argv < 2 then raise (Failure "Missing input filepath");

  let json = Yojson.Basic.from_file Sys.argv.(1) in

  let open Yojson.Basic.Util in
  let age = json |> member "age" |> to_float in
  let max_speed = json |> member "max_speed" |> to_float in

  print_endline "Greetings, traveler.";
  print_endline "Provided information:";
  Printf.printf "\tAge: %f years" age;
  Printf.printf "\tMaximum speed: %f m/s" max_speed
