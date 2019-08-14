import argparse
import functools

if __name__ == "__main__":
    p = argparse.ArgumentParser(description="Convert edgeweights in edge list file to -1.")
    p.add_argument('edge_list_file', help="Edge list file to convert.")
    args = p.parse_args()

    with open(args.edge_list_file, "r") as el_file:
        for line in el_file.readlines():
            words = line.split()
            words[2] = "-1"
            out = " ".join(words)
            print(out)

