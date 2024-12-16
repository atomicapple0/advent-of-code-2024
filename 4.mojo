fn search(data: List[String], r: Int, c: Int, dr: Int, dc: Int) raises:
    target = String("XMAS")
    for i in range(len(target)):
        x = target[i]
        rr = r + i * dr
        cc = c + i * dc
        if not (0 <= rr < len(data) and 0 <= cc < len(data[0])):
            raise Error()
        if not data[rr][cc] == x:
            raise Error()


fn search_mas(data: List[String], r: Int, c: Int, dr: Int, dc: Int) raises:
    target = String("MAS")
    parity = List[Int](1, -1)
    succeeded = False
    for p in parity:
        pp = p[]
        ddr = pp * dr
        ddc = pp * dc
        rr = r - ddr
        cc = c - ddc
        failed = False
        for i in range(len(target)):
            x = target[i]
            rrr = rr + i * ddr
            ccc = cc + i * ddc
            if not (0 <= rrr < len(data) and 0 <= ccc < len(data[0])):
                failed = True
                continue
            if not data[rrr][ccc] == x:
                failed = True
        if not failed:
            succeeded = True
    if not succeeded:
        raise Error()


fn part_one() raises:
    data = List[String]()
    with open("./inputs/4.input", "r") as f:
        lines = f.read().splitlines(keepends=False)
        for line in lines:
            # row = List[String]()
            # for c in range(line):
            if line[]:
                data.append(line[])

    height = len(data)
    width = len(data[0])

    DIR_R = List[Int](
        -1,
        -1,
        -1,
        0,
        0,
        1,
        1,
        1,
    )
    DIR_C = List[Int](-1, 0, 1, -1, 1, -1, 0, 1)
    yay = 0
    for r in range(height):
        for c in range(width):
            for j in range(len(DIR_R)):
                dr = DIR_R[j]
                dc = DIR_C[j]
                # print(r, c, dr, dc)
                try:
                    search(data, r, c, dr, dc)
                    yay += 1
                except:
                    pass
    print(yay)


fn part_two() raises:
    data = List[String]()
    with open("./inputs/4.input", "r") as f:
        lines = f.read().splitlines(keepends=False)
        for line in lines:
            # row = List[String]()
            # for c in range(line):
            if line[]:
                data.append(line[])

    height = len(data)
    width = len(data[0])

    yay = 0
    for r in range(height):
        for c in range(width):
            try:
                search_mas(data, r, c, 1, 1)
                search_mas(data, r, c, -1, 1)
                yay += 1
            except:
                pass
    print(yay)


fn main() raises:
    part_one()
    part_two()
