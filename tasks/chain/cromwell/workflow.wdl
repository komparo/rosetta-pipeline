workflow concatenate {
    File A = "A.txt"
    File B = "B.txt"
    File C = "C.txt"

    call ab {
        input:
            A=A, B=B
    }
    call abc {
        input:
            C=C,
            AB = ab.AB
    }
}

task ab {
    File A
    File B

    command {
        cat ${A} ${B} > "AB.txt"
    }
    output {
        File AB = "AB.txt"
    }
}

task abc {
    File AB
    File C

    command {
        cat ${AB} ${C} > "ABC.txt"
    }
    output {
        File ABC = "ABC.txt"
    }
}