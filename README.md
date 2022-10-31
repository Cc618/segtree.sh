![](res/segtree.png)

[Segtree.sh](src/segtree.sh) is a Bash library providing a [Segment Tree](https://en.wikipedia.org/wiki/Segment_tree) data structure.

The binary operation is the sum operation.

## Usage
First, source the library :
```sh
. ./segtree.sh
```

Then, here is the workflow to create, update and query the tree :
```sh
values=(1 3 5 6 7)

# Create the segment tree
seg=($(make_seg "${values[@]}"))

# Update: Set value at index 2 to 8, values=(1 3 8 6 7)
seg=($(update_seg 2 8 "${seg[@]}"))

# Query: Get sum from index 1 to 4 (left inclusive, right exclusive)
query_seg 1 4 "${seg[@]}"

# Output:
# 17
```

## Test
A test suite is available [here](test.sh).

## License
This code is uses the [MIT](LICENSE) license.
