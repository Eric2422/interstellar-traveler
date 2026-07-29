let c = 299789458

let () =
    if Array.length Sys.argv < 2 then raise (Failure "Missing input filepath");

    let json = Yojson.Basic.from_file Sys.argv.(1) in

    let open Yojson.Basic.Util in
    let age = json |> member "age" |> to_float in
    let max_speed = json |> member "max_speed" |> to_float in
    let proper_mass = json |> member "proper_mass" |> to_float in

    print_endline "Greetings, traveler.";
    print_endline "Provided information:";
    Printf.printf "    Age: %f years\n" age;
    Printf.printf "    Maximum speed: %f c (%f m/s)\n"
      (max_speed /. float c)
      max_speed;
    Printf.printf "    Proper mass: %f kg\n" proper_mass
