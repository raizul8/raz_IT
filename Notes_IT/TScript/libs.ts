// RxJS
    range(1, 200)
        .pipe(
            zip(
                interval(500), x => x
            ),
            filter(x => x % 2 === 1),
            map(x => x + x)
        )
        .subscribe(
            console.log,
            console.error,
            () => console.log('Finished')
        );

//
    rx.interval(1000)
        .pipe(
            rp.filter(v => {
                if (v % 2 == 0) {
                    return true;
                }
                return false;
            }),
            rp.map((v) => {
                return v;
            }),
            rp.takeWhile(v => v <= 6),

    ).subscribe(
        n => {
            console.log(`${n} seconds from subscribing!`);
        },
        e => console.log(`Error: ${e}`),
        () => console.log('Completed')
    );