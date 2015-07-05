BEGIN {
    l = 0;
    m = 0;
}

/\\acro\{[A-Za-z0-9]+\}\{.+\}/ {
    if (m == 0) {
        key[l++] = $0;
        next;
    }
}

{
    if (l == 0) {
        print $0
    } else {
        after[m++] = $0
    }
}

END {
    asort(key);
    for (i=0;i<=l;i++)
        print key[i];
    for (i=0;i<=m;i++)
        print after[i]
}
