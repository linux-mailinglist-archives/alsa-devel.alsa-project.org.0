Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C10C9184E6F
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 19:14:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35BE61857;
	Fri, 13 Mar 2020 19:13:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35BE61857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584123283;
	bh=hfmdYh7nC4KEpyUKgbxyUdvCbPmd56o4WZU98eSiCcA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C/pJ2PRPhVr4n4ih7XWJ3CCa38iuxEuuxoups2rpW5/n1QbXhiAfSnuV27uB2Ng73
	 lhzaieqncTeqEUcBKAXDd6hHMIeY40cGugxtil7aOofBoai157xC3cFK/HbHSUEmrZ
	 b1UW4volgG2bQ6sOEyd0aLzHBUvqEyvs+s2Ll9kg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E7CAF80086;
	Fri, 13 Mar 2020 19:13:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E363CF801A3; Fri, 13 Mar 2020 19:12:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E6BCDF80086
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 19:12:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6BCDF80086
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1584123173741833925-webhooks-bot@alsa-project.org>
References: <1584123173741833925-webhooks-bot@alsa-project.org>
Subject: alsatplg (libasound.a) segmentation fault using AFL
Message-Id: <20200313181259.E363CF801A3@alsa1.perex.cz>
Date: Fri, 13 Mar 2020 19:12:59 +0100 (CET)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-lib issue #37 was opened from tysonite:

I was playing around with [AFL](https://fuzzing-project.org/tutorial3.html) tonight on one of my pet projects. And after it found few crashes, I've decided to fuzz one of open-source projects. The `alsatplg` tool just looked simple enough to exercise it with fuzzing tool.

I made a simple Dockerfile that runs AFL on `alsatplg`:
```
FROM ubuntu:18.04

ENV LANG C.UTF-8

RUN apt-get update && \
    apt-get install -y apt-utils && \
    apt-get install -y afl git build-essential m4 autoconf automake libtool

RUN cd /

RUN git clone https://github.com/alsa-project/alsa-lib.git
RUN cd alsa-lib && \
    	libtoolize --force --copy --automake && \
    	aclocal && \
    	autoheader && \
   		automake --foreign --copy --add-missing && \
    	autoconf && \
    	export CFLAGS="-O2 -Wall -W -Wunused-const-variable=0 -pipe -g" && \
    	export CC=afl-gcc && \
    	./configure --disable-aload && \
    	make && \
    	make install \
    && cd /

RUN apt-get install -y gettext ncurses-base libncurses5 libncurses5-dev pkg-config
RUN git clone https://github.com/alsa-project/alsa-utils.git
RUN cd alsa-utils && \
    	export CC=afl-gcc && \
        ./gitcompile && \
        make install && \
    cd /

RUN mkdir in

#RUN cp alsa-utils/speaker-test/samples/Noise.wav in
RUN echo "Hello" > in/input.txt

CMD ["afl-fuzz", "-i", "in", "-o", "out", "alsatplg", "-c", "@@", "-o", "/output"]
```

After around 10-15 minutes running on my core i7 laptop, it generated a sequence of bytes that leads to crash. If you want to try it by yourself just run `docker build -t alsa/dev .` followed by `docker run alsa/dev`, and wait a bit. When crash happened, the input data can be copied from the container by running `docker cp <container_id>:/out .`.

An example of input data that lead to SIGSEGV: 
[id:000000,sig:11,src:000325,op:arith8,pos:48,val:-26.txt](https://github.com/alsa-project/alsa-lib/files/4330943/id.000000.sig.11.src.000325.op.arith8.pos.48.val.-26.txt)

And stack trace based on it:
```
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
Core was generated by `alsatplg -c out/crashes/id:000000,sig:11,src:000325,op:arith8,pos:48,val:-26 -o'.
Program terminated with signal SIGSEGV, Segmentation fault.
#0  0x00007fcb65e05ca8 in snd_config_delete () from /usr/lib/x86_64-linux-gnu/libasound.so.2
(gdb) bt
#0  0x00007fcb65e05ca8 in snd_config_delete () from /usr/lib/x86_64-linux-gnu/libasound.so.2
#1  0x00007fcb65e06479 in ?? () from /usr/lib/x86_64-linux-gnu/libasound.so.2
#2  0x00007fcb65e064ba in ?? () from /usr/lib/x86_64-linux-gnu/libasound.so.2
#3  0x00007fcb65e0661c in ?? () from /usr/lib/x86_64-linux-gnu/libasound.so.2
#4  0x00007fcb65e818c4 in snd_tplg_build_file () from /usr/lib/x86_64-linux-gnu/libasound.so.2
#5  0x00005587bce0ab6a in ?? ()
#6  0x00007fcb65a07b97 in __libc_start_main (main=0x5587bce0aa10, argc=5, argv=0x7ffcfa707628, init=<optimized out>, fini=<optimized out>, rtld_fini=<optimized out>, 
    stack_end=0x7ffcfa707618) at ../csu/libc-start.c:310
#7  0x00005587bce0ac4a in ?? ()
(gdb) bt full
#0  0x00007fcb65e05ca8 in snd_config_delete () from /usr/lib/x86_64-linux-gnu/libasound.so.2
No symbol table info available.
#1  0x00007fcb65e06479 in ?? () from /usr/lib/x86_64-linux-gnu/libasound.so.2
No symbol table info available.
#2  0x00007fcb65e064ba in ?? () from /usr/lib/x86_64-linux-gnu/libasound.so.2
No symbol table info available.
#3  0x00007fcb65e0661c in ?? () from /usr/lib/x86_64-linux-gnu/libasound.so.2
No symbol table info available.
#4  0x00007fcb65e818c4 in snd_tplg_build_file () from /usr/lib/x86_64-linux-gnu/libasound.so.2
No symbol table info available.
#5  0x00005587bce0ab6a in ?? ()
No symbol table info available.
#6  0x00007fcb65a07b97 in __libc_start_main (main=0x5587bce0aa10, argc=5, argv=0x7ffcfa707628, init=<optimized out>, fini=<optimized out>, rtld_fini=<optimized out>, 
    stack_end=0x7ffcfa707618) at ../csu/libc-start.c:310
        self = <optimized out>
        __self = <optimized out>
        result = <optimized out>
        unwind_buf = {cancel_jmp_buf = {{jmp_buf = {0, -5452963434713232627, 94041477786656, 140724510160416, 0, 0, -2259219850243519731, -2248813385476519155}, 
              mask_was_saved = 0}}, priv = {pad = {0x0, 0x0, 0x7fcb660ee733 <_dl_init+259>, 0x7fcb660d6370}, data = {prev = 0x0, cleanup = 0x0, canceltype = 1712252723}}}
        not_first_call = <optimized out>
#7  0x00005587bce0ac4a in ?? ()
No symbol table info available.
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/37
Repository URL: https://github.com/alsa-project/alsa-lib
