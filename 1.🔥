def part_one():
    with open("./inputs/1.input", "r") as file:
        s = file.read()
    lines = s.splitlines(keepends=False)

    var ls = List[Int]()
    var rs = List[Int]()
    for line in lines:
        words = line[].split("   ")
        l = int(words[0])
        r = int(words[1])
        ls.append(int(l))
        rs.append(int(r))
        # print(str(l) + "  " + str(rs[i]))

    sort(ls)
    sort(rs)

    acc = 0
    for i in range(len(ls)):
        acc += abs(ls[i] - rs[i])

    print(acc)


def part_two():
    with open("./inputs/1.input", "r") as file:
        s = file.read()
    lines = s.splitlines(keepends=False)

    var ls = List[Int]()
    var rs = List[Int]()
    for line in lines:
        words = line[].split("   ")
        l = int(words[0])
        r = int(words[1])
        ls.append(int(l))
        rs.append(int(r))

    from collections import Dict

    var counter = Dict[Int, Int]()
    for r in rs:
        rr = r[]
        if rr not in counter:
            counter[rr] = 0
        counter[rr] += 1

    acc = 0
    for l in ls:
        ll = l[]
        if ll not in counter:
            counter[ll] = 0
        acc += ll * counter[ll]

    print(acc)

    # var d = Dict[String, Float64]()
    # d["plasticity"] = 3.1
    # d["elasticity"] = 1.3
    # d["electricity"] = 9.7


def main():
    part_one()
    part_two()
