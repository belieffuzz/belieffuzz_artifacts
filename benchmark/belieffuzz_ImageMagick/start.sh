./afl-fuzz -m none -p -r -d -c ./edge_potential.txt  -i fuzz_in -o fuzz_out/$(date +%m%d%H%M) -- ./fuzz_bin/magick-belieffuzz convert @@ jpeg:-
