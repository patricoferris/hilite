let read_file path =
  let rec loop ic acc =
    match input_line ic with
    | line -> loop ic (line :: acc)
    | exception End_of_file -> List.rev acc
  in
  let ic = open_in path in
  Fun.protect ~finally:(fun () -> close_in ic) (fun () -> loop ic [])
  |> String.concat "\n"
