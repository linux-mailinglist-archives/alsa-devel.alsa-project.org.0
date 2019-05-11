Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8161A789
	for <lists+alsa-devel@lfdr.de>; Sat, 11 May 2019 12:21:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8594D185A;
	Sat, 11 May 2019 12:20:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8594D185A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557570098;
	bh=RTX/bAL6PqZ06r6VvUUwLZOpJzlAm9WMbQJVTeqVsO8=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iDOnZ7/o98/CI+1TopUMEqgO1ZxI/gmmpE9bfjDdNwxeeymWlAs653DvN/h8QKHtb
	 vwtUZ9FeLMAq8kdkNK8kAtn0/dSL6NZr67adz2pzvPFwFyQAQvl8OB/YkcMgncmhNA
	 GkkejP8HhVExvSpOu8xKi1zl0UEvZ2euwEAOTpgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63D4FF896DF;
	Sat, 11 May 2019 12:19:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF7F5F89682; Sat, 11 May 2019 12:19:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 7605DF89616
 for <alsa-devel@alsa-project.org>; Sat, 11 May 2019 12:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7605DF89616
MIME-Version: 1.0
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1557569983874177933-webhooks-bot@alsa-project.org>
References: <1557569983874177933-webhooks-bot@alsa-project.org>
Message-Id: <20190511101949.AF7F5F89682@alsa1.perex.cz>
Date: Sat, 11 May 2019 12:19:49 +0200 (CEST)
Subject: [alsa-devel] 1.1.9: test suite issue: axfer/test -> container-test
	loops forever
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-utils issue #19 was opened from kloczek:

Looks like it is some issue with axfer/test -> container-test.
This test cannot finishe and looks like it is looping and cannot finish.
Just in case: nothing is written on stdout/stderr or container-test.log. axfer/test/hoge file is constantly written and deleted.
<pre>[tkloczko@domek test]$ strace -f /bin/sh ../../test-driver --test-name container-test --log-file container-test.log --trs-file container-test.trs --color-tests yes --enable-hard-errors yes --expect-failure no -- ./container-test
execve(&quot;/bin/sh&quot;, [&quot;/bin/sh&quot;, &quot;../../test-driver&quot;, &quot;--test-name&quot;, &quot;container-test&quot;, &quot;--log-file&quot;, &quot;container-test.log&quot;, &quot;--trs-file&quot;, &quot;container-test.trs&quot;, &quot;--color-tests&quot;, &quot;yes&quot;, &quot;--enable-hard-errors&quot;, &quot;yes&quot;, &quot;--expect-failure&quot;, &quot;no&quot;, &quot;--&quot;, &quot;./container-test&quot;], 0x7fff8aab0350 /* 67 vars */) = 0
brk(NULL)                               = 0x559a60017000
arch_prctl(0x3001 /* ARCH_??? */, 0x7ffce069bb50) = -1 EINVAL (Invalid argument)
access(&quot;/etc/ld.so.preload&quot;, R_OK)      = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, &quot;/etc/ld.so.cache&quot;, O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=188179, ...}) = 0
mmap(NULL, 188179, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7fd3e422c000
close(3)                                = 0
openat(AT_FDCWD, &quot;/lib64/libtinfo.so.6&quot;, O_RDONLY|O_CLOEXEC) = 3
read(3, &quot;\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0&gt;\0\1\0\0\0\320\363\0\0\0\0\0\0&quot;..., 832) = 832
lseek(3, 169216, SEEK_SET)              = 169216
read(3, &quot;\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0&quot;, 32) = 32
fstat(3, {st_mode=S_IFREG|0755, st_size=285768, ...}) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7fd3e422a000
lseek(3, 169216, SEEK_SET)              = 169216
read(3, &quot;\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0&quot;, 32) = 32
mmap(NULL, 190848, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fd3e41fb000
mmap(0x7fd3e4209000, 61440, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xe000) = 0x7fd3e4209000
mmap(0x7fd3e4218000, 53248, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1d000) = 0x7fd3e4218000
mmap(0x7fd3e4225000, 20480, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x29000) = 0x7fd3e4225000
close(3)                                = 0
openat(AT_FDCWD, &quot;/lib64/libdl.so.2&quot;, O_RDONLY|O_CLOEXEC) = 3
read(3, &quot;\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0&gt;\0\1\0\0\0p\&quot;\0\0\0\0\0\0&quot;..., 832) = 832
fstat(3, {st_mode=S_IFREG|0755, st_size=56640, ...}) = 0
mmap(NULL, 24688, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fd3e41f4000
mmap(0x7fd3e41f6000, 8192, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0x7fd3e41f6000
mmap(0x7fd3e41f8000, 4096, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) = 0x7fd3e41f8000
mmap(0x7fd3e41f9000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) = 0x7fd3e41f9000
mmap(0x7fd3e41fa000, 112, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7fd3e41fa000
close(3)                                = 0
openat(AT_FDCWD, &quot;/lib64/libc.so.6&quot;, O_RDONLY|O_CLOEXEC) = 3
read(3, &quot;\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0&gt;\0\1\0\0\0\200p\2\0\0\0\0\0&quot;..., 832) = 832
lseek(3, 64, SEEK_SET)                  = 64
read(3, &quot;\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0&quot;..., 784) = 784
lseek(3, 848, SEEK_SET)                 = 848
read(3, &quot;\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0&quot;, 32) = 32
lseek(3, 880, SEEK_SET)                 = 880
read(3, &quot;\4\0\0\0\24\0\0\0\3\0\0\0GNU\0\0052`U\224\217\3&lt;\204\4\231e\235\313\324 &quot;..., 68) = 68
fstat(3, {st_mode=S_IFREG|0755, st_size=5577040, ...}) = 0
lseek(3, 64, SEEK_SET)                  = 64
read(3, &quot;\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0&quot;..., 784) = 784
lseek(3, 848, SEEK_SET)                 = 848
read(3, &quot;\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0&quot;, 32) = 32
lseek(3, 880, SEEK_SET)                 = 880
read(3, &quot;\4\0\0\0\24\0\0\0\3\0\0\0GNU\0\0052`U\224\217\3&lt;\204\4\231e\235\313\324 &quot;..., 68) = 68
mmap(NULL, 1852600, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7fd3e402f000
mprotect(0x7fd3e4054000, 1662976, PROT_NONE) = 0
mmap(0x7fd3e4054000, 1359872, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x25000) = 0x7fd3e4054000
mmap(0x7fd3e41a0000, 299008, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x171000) = 0x7fd3e41a0000
mmap(0x7fd3e41ea000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1ba000) = 0x7fd3e41ea000
mmap(0x7fd3e41f0000, 13496, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7fd3e41f0000
close(3)                                = 0
mmap(NULL, 12288, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7fd3e402c000
arch_prctl(ARCH_SET_FS, 0x7fd3e402c740) = 0
mprotect(0x7fd3e41ea000, 12288, PROT_READ) = 0
mprotect(0x7fd3e41f9000, 4096, PROT_READ) = 0
mprotect(0x7fd3e4225000, 16384, PROT_READ) = 0
mprotect(0x559a5eca6000, 16384, PROT_READ) = 0
mprotect(0x7fd3e4284000, 4096, PROT_READ) = 0
munmap(0x7fd3e422c000, 188179)          = 0
openat(AT_FDCWD, &quot;/dev/tty&quot;, O_RDWR|O_NONBLOCK) = 3
close(3)                                = 0
brk(NULL)                               = 0x559a60017000
brk(0x559a60038000)                     = 0x559a60038000
brk(NULL)                               = 0x559a60038000
openat(AT_FDCWD, &quot;/usr/lib/locale/locale-archive&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, &quot;/usr/share/locale/locale.alias&quot;, O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=2997, ...}) = 0
read(3, &quot;# Locale name alias data base.\n#&quot;..., 4096) = 2997
read(3, &quot;&quot;, 4096)                       = 0
close(3)                                = 0
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.UTF-8/LC_IDENTIFICATION&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.utf8/LC_IDENTIFICATION&quot;, O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=373, ...}) = 0
mmap(NULL, 373, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7fd3e4283000
close(3)                                = 0
openat(AT_FDCWD, &quot;/usr/lib64/gconv/gconv-modules.cache&quot;, O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=26998, ...}) = 0
mmap(NULL, 26998, PROT_READ, MAP_SHARED, 3, 0) = 0x7fd3e4253000
close(3)                                = 0
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.utf8/LC_MEASUREMENT&quot;, O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=23, ...}) = 0
mmap(NULL, 23, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7fd3e4252000
close(3)                                = 0
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.UTF-8/LC_TELEPHONE&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.utf8/LC_TELEPHONE&quot;, O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=56, ...}) = 0
mmap(NULL, 56, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7fd3e4251000
close(3)                                = 0
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.UTF-8/LC_ADDRESS&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.utf8/LC_ADDRESS&quot;, O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=158, ...}) = 0
mmap(NULL, 158, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7fd3e4250000
close(3)                                = 0
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.UTF-8/LC_NAME&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.utf8/LC_NAME&quot;, O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=77, ...}) = 0
mmap(NULL, 77, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7fd3e424f000
close(3)                                = 0
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.utf8/LC_PAPER&quot;, O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=34, ...}) = 0
mmap(NULL, 34, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7fd3e424e000
close(3)                                = 0
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.UTF-8/LC_MESSAGES&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.utf8/LC_MESSAGES&quot;, O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFDIR|0755, st_size=30, ...}) = 0
close(3)                                = 0
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.utf8/LC_MESSAGES/SYS_LC_MESSAGES&quot;, O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=57, ...}) = 0
mmap(NULL, 57, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7fd3e424d000
close(3)                                = 0
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.utf8/LC_MONETARY&quot;, O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=290, ...}) = 0
mmap(NULL, 290, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7fd3e424c000
close(3)                                = 0
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.UTF-8/LC_COLLATE&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.utf8/LC_COLLATE&quot;, O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=2586930, ...}) = 0
mmap(NULL, 2586930, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7fd3e3db4000
close(3)                                = 0
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.utf8/LC_TIME&quot;, O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=3332, ...}) = 0
mmap(NULL, 3332, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7fd3e424b000
close(3)                                = 0
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.utf8/LC_NUMERIC&quot;, O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=54, ...}) = 0
mmap(NULL, 54, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7fd3e424a000
close(3)                                = 0
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.UTF-8/LC_CTYPE&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.utf8/LC_CTYPE&quot;, O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=340008, ...}) = 0
mmap(NULL, 340008, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7fd3e3d60000
close(3)                                = 0
getuid()                                = 1000
getgid()                                = 1000
geteuid()                               = 1000
getegid()                               = 1000
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  = 0
ioctl(-1, TIOCGPGRP, 0x7ffce069b9b4)    = -1 EBADF (Bad file descriptor)
sysinfo({uptime=447376, loads=[64256, 115168, 149856], totalram=8272330752, freeram=130670592, sharedram=986529792, bufferram=106496, totalswap=0, freeswap=0, procs=1208, totalhigh=0, freehigh=0, mem_unit=1}) = 0
rt_sigaction(SIGCHLD, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigaction(SIGCHLD, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7fd3e4069f40}, 8) = 0
rt_sigaction(SIGINT, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigaction(SIGINT, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, 8) = 0
rt_sigaction(SIGQUIT, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigaction(SIGQUIT, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, 8) = 0
rt_sigaction(SIGTSTP, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigaction(SIGTSTP, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, 8) = 0
rt_sigaction(SIGTTIN, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigaction(SIGTTIN, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, 8) = 0
rt_sigaction(SIGTTOU, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigaction(SIGTTOU, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, 8) = 0
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  = 0
rt_sigaction(SIGQUIT, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, 8) = 0
uname({sysname=&quot;Linux&quot;, nodename=&quot;domek&quot;, ...}) = 0
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  = 0
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  = 0
stat(&quot;/home/tkloczko/rpmbuild/BUILD/alsa-utils-1.1.9/axfer/test&quot;, {st_mode=S_IFDIR|0755, st_size=532, ...}) = 0
stat(&quot;.&quot;, {st_mode=S_IFDIR|0755, st_size=532, ...}) = 0
stat(&quot;/home&quot;, {st_mode=S_IFDIR|0755, st_size=16, ...}) = 0
stat(&quot;/home/tkloczko&quot;, {st_mode=S_IFDIR|0755, st_size=2148, ...}) = 0
stat(&quot;/home/tkloczko/rpmbuild&quot;, {st_mode=S_IFDIR|0755, st_size=1464, ...}) = 0
stat(&quot;/home/tkloczko/rpmbuild/BUILD&quot;, {st_mode=S_IFDIR|0755, st_size=2344, ...}) = 0
stat(&quot;/home/tkloczko/rpmbuild/BUILD/alsa-utils-1.1.9&quot;, {st_mode=S_IFDIR|0755, st_size=966, ...}) = 0
stat(&quot;/home/tkloczko/rpmbuild/BUILD/alsa-utils-1.1.9/axfer&quot;, {st_mode=S_IFDIR|0755, st_size=1634, ...}) = 0
stat(&quot;/home/tkloczko/rpmbuild/BUILD/alsa-utils-1.1.9/axfer/test&quot;, {st_mode=S_IFDIR|0755, st_size=532, ...}) = 0
stat(&quot;/home/tkloczko/rpmbuild/BUILD/alsa-utils-1.1.9/axfer&quot;, {st_mode=S_IFDIR|0755, st_size=1634, ...}) = 0
getpid()                                = 24893
getppid()                               = 24890
getpid()                                = 24893
getpgrp()                               = 24890
ioctl(2, TIOCGPGRP, [24890])            = 0
rt_sigaction(SIGCHLD, {sa_handler=0x559a5ebecd60, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7fd3e4069f40}, 8) = 0
prlimit64(0, RLIMIT_NPROC, NULL, {rlim_cur=31438, rlim_max=31438}) = 0
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.UTF-8/LC_MEASUREMENT&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.UTF-8/LC_PAPER&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.UTF-8/LC_MONETARY&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.UTF-8/LC_TIME&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, &quot;/usr/lib/locale/en_GB.UTF-8/LC_NUMERIC&quot;, O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  = 0
openat(AT_FDCWD, &quot;../../test-driver&quot;, O_RDONLY) = 3
stat(&quot;../../test-driver&quot;, {st_mode=S_IFREG|0755, st_size=4645, ...}) = 0
ioctl(3, TCGETS, 0x7ffce069b940)        = -1 ENOTTY (Inappropriate ioctl for device)
lseek(3, 0, SEEK_CUR)                   = 0
read(3, &quot;#!/usr/bin/sh\n# test-driver - ba&quot;..., 80) = 80
lseek(3, 0, SEEK_SET)                   = 0
prlimit64(0, RLIMIT_NOFILE, NULL, {rlim_cur=1024, rlim_max=512*1024}) = 0
fcntl(255, F_GETFD)                     = -1 EBADF (Bad file descriptor)
dup2(3, 255)                            = 255
close(3)                                = 0
fcntl(255, F_SETFD, FD_CLOEXEC)         = 0
fcntl(255, F_GETFL)                     = 0x8000 (flags O_RDONLY|O_LARGEFILE)
fstat(255, {st_mode=S_IFREG|0755, st_size=4645, ...}) = 0
lseek(255, 0, SEEK_CUR)                 = 0
read(255, &quot;#!/usr/bin/sh\n# test-driver - ba&quot;..., 4645) = 4645
rt_sigaction(SIGHUP, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigaction(SIGHUP, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, 8) = 0
rt_sigprocmask(SIG_BLOCK, [HUP], [], 8) = 0
rt_sigaction(SIGHUP, {sa_handler=0x559a5ec06c40, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, [INT], [], 8) = 0
rt_sigaction(SIGINT, {sa_handler=0x559a5ec06c40, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, 8) = 0
rt_sigprocmask(SIG_BLOCK, [PIPE], [], 8) = 0
rt_sigaction(SIGPIPE, {sa_handler=0x559a5ec06c40, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigaction(SIGTERM, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigaction(SIGTERM, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, 8) = 0
rt_sigprocmask(SIG_BLOCK, [TERM], [], 8) = 0
rt_sigaction(SIGTERM, {sa_handler=0x559a5ec06c40, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, [INT CHLD], [], 8) = 0
lseek(255, -1344, SEEK_CUR)             = 3301
clone(strace: Process 24894 attached
child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x7fd3e402ca10) = 24894
[pid 24894] getpid( &lt;unfinished ...&gt;
[pid 24893] rt_sigprocmask(SIG_SETMASK, [],  &lt;unfinished ...&gt;
[pid 24894] &lt;... getpid resumed&gt;)       = 24894
[pid 24893] &lt;... rt_sigprocmask resumed&gt;NULL, 8) = 0
[pid 24894] close(255 &lt;unfinished ...&gt;
[pid 24893] rt_sigprocmask(SIG_BLOCK, [CHLD],  &lt;unfinished ...&gt;
[pid 24894] &lt;... close resumed&gt;)        = 0
[pid 24893] &lt;... rt_sigprocmask resumed&gt;[], 8) = 0
[pid 24894] rt_sigprocmask(SIG_SETMASK, [],  &lt;unfinished ...&gt;
[pid 24893] rt_sigprocmask(SIG_SETMASK, [],  &lt;unfinished ...&gt;
[pid 24894] &lt;... rt_sigprocmask resumed&gt;NULL, 8) = 0
[pid 24893] &lt;... rt_sigprocmask resumed&gt;NULL, 8) = 0
[pid 24894] rt_sigaction(SIGTSTP, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40},  &lt;unfinished ...&gt;
[pid 24893] rt_sigprocmask(SIG_BLOCK, [CHLD],  &lt;unfinished ...&gt;
[pid 24894] &lt;... rt_sigaction resumed&gt;{sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, 8) = 0
[pid 24893] &lt;... rt_sigprocmask resumed&gt;[], 8) = 0
[pid 24894] rt_sigaction(SIGTTIN, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40},  &lt;unfinished ...&gt;
[pid 24893] rt_sigaction(SIGINT, {sa_handler=0x559a5ebe9810, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40},  &lt;unfinished ...&gt;
[pid 24894] &lt;... rt_sigaction resumed&gt;{sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, 8) = 0
[pid 24893] &lt;... rt_sigaction resumed&gt;{sa_handler=0x559a5ec06c40, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, 8) = 0
[pid 24894] rt_sigaction(SIGTTOU, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40},  &lt;unfinished ...&gt;
[pid 24893] wait4(-1,  &lt;unfinished ...&gt;
[pid 24894] &lt;... rt_sigaction resumed&gt;{sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, 8) = 0
[pid 24894] rt_sigaction(SIGHUP, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=0x559a5ec06c40, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, 8) = 0
[pid 24894] rt_sigaction(SIGINT, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=0x559a5ec06c40, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, 8) = 0
[pid 24894] rt_sigaction(SIGQUIT, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, 8) = 0
[pid 24894] rt_sigaction(SIGPIPE, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=0x559a5ec06c40, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, 8) = 0
[pid 24894] rt_sigaction(SIGTERM, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, {sa_handler=0x559a5ec06c40, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7fd3e4069f40}, 8) = 0
[pid 24894] rt_sigaction(SIGCHLD, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7fd3e4069f40}, {sa_handler=0x559a5ebecd60, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7fd3e4069f40}, 8) = 0
[pid 24894] openat(AT_FDCWD, &quot;container-test.log&quot;, O_WRONLY|O_CREAT|O_TRUNC, 0666) = 3
[pid 24894] dup2(3, 1)                  = 1
[pid 24894] close(3)                    = 0
[pid 24894] dup2(1, 2)                  = 2
[pid 24894] fcntl(1, F_GETFD)           = 0
[pid 24894] execve(&quot;./container-test&quot;, [&quot;./container-test&quot;], 0x559a60029510 /* 67 vars */) = 0
[pid 24894] brk(NULL)                   = 0x55711c860000
[pid 24894] arch_prctl(0x3001 /* ARCH_??? */, 0x7ffff5c380a0) = -1 EINVAL (Invalid argument)
[pid 24894] access(&quot;/etc/ld.so.preload&quot;, R_OK) = -1 ENOENT (No such file or directory)
[pid 24894] openat(AT_FDCWD, &quot;/etc/ld.so.cache&quot;, O_RDONLY|O_CLOEXEC) = 3
[pid 24894] fstat(3, {st_mode=S_IFREG|0644, st_size=188179, ...}) = 0
[pid 24894] mmap(NULL, 188179, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f302eae3000
[pid 24894] close(3)                    = 0
[pid 24894] openat(AT_FDCWD, &quot;/lib64/libc.so.6&quot;, O_RDONLY|O_CLOEXEC) = 3
[pid 24894] read(3, &quot;\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0&gt;\0\1\0\0\0\200p\2\0\0\0\0\0&quot;..., 832) = 832
[pid 24894] lseek(3, 64, SEEK_SET)      = 64
[pid 24894] read(3, &quot;\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0&quot;..., 784) = 784
[pid 24894] lseek(3, 848, SEEK_SET)     = 848
[pid 24894] read(3, &quot;\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0&quot;, 32) = 32
[pid 24894] lseek(3, 880, SEEK_SET)     = 880
[pid 24894] read(3, &quot;\4\0\0\0\24\0\0\0\3\0\0\0GNU\0\0052`U\224\217\3&lt;\204\4\231e\235\313\324 &quot;..., 68) = 68
[pid 24894] fstat(3, {st_mode=S_IFREG|0755, st_size=5577040, ...}) = 0
[pid 24894] mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f302eae1000
[pid 24894] lseek(3, 64, SEEK_SET)      = 64
[pid 24894] read(3, &quot;\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0&quot;..., 784) = 784
[pid 24894] lseek(3, 848, SEEK_SET)     = 848
[pid 24894] read(3, &quot;\4\0\0\0\20\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0&quot;, 32) = 32
[pid 24894] lseek(3, 880, SEEK_SET)     = 880
[pid 24894] read(3, &quot;\4\0\0\0\24\0\0\0\3\0\0\0GNU\0\0052`U\224\217\3&lt;\204\4\231e\235\313\324 &quot;..., 68) = 68
[pid 24894] mmap(NULL, 1852600, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f302e91c000
[pid 24894] mprotect(0x7f302e941000, 1662976, PROT_NONE) = 0
[pid 24894] mmap(0x7f302e941000, 1359872, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x25000) = 0x7f302e941000
[pid 24894] mmap(0x7f302ea8d000, 299008, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x171000) = 0x7f302ea8d000
[pid 24894] mmap(0x7f302ead7000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1ba000) = 0x7f302ead7000
[pid 24894] mmap(0x7f302eadd000, 13496, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f302eadd000
[pid 24894] close(3)                    = 0
[pid 24894] openat(AT_FDCWD, &quot;/lib64/libasound.so.2&quot;, O_RDONLY|O_CLOEXEC) = 3
[pid 24894] read(3, &quot;\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0&gt;\0\1\0\0\0\260&apos;\3\0\0\0\0\0&quot;..., 832) = 832
[pid 24894] fstat(3, {st_mode=S_IFREG|0755, st_size=1157768, ...}) = 0
[pid 24894] mmap(NULL, 955152, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f302e832000
[pid 24894] mmap(0x7f302e85f000, 552960, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2d000) = 0x7f302e85f000
[pid 24894] mmap(0x7f302e8e6000, 184320, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xb4000) = 0x7f302e8e6000
[pid 24894] mmap(0x7f302e913000, 36864, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xe0000) = 0x7f302e913000
[pid 24894] close(3)                    = 0
[pid 24894] openat(AT_FDCWD, &quot;/lib64/libm.so.6&quot;, O_RDONLY|O_CLOEXEC) = 3
[pid 24894] read(3, &quot;\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0&gt;\0\1\0\0\0\220\363\0\0\0\0\0\0&quot;..., 832) = 832
[pid 24894] fstat(3, {st_mode=S_IFREG|0755, st_size=3315312, ...}) = 0
[pid 24894] mmap(NULL, 1331216, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f302e6ec000
[pid 24894] mmap(0x7f302e6fb000, 638976, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xf000) = 0x7f302e6fb000
[pid 24894] mmap(0x7f302e797000, 626688, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xab000) = 0x7f302e797000
[pid 24894] mmap(0x7f302e830000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x143000) = 0x7f302e830000
[pid 24894] close(3)                    = 0
[pid 24894] openat(AT_FDCWD, &quot;/lib64/libdl.so.2&quot;, O_RDONLY|O_CLOEXEC) = 3
[pid 24894] read(3, &quot;\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0&gt;\0\1\0\0\0p\&quot;\0\0\0\0\0\0&quot;..., 832) = 832
[pid 24894] fstat(3, {st_mode=S_IFREG|0755, st_size=56640, ...}) = 0
[pid 24894] mmap(NULL, 24688, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f302e6e5000
[pid 24894] mmap(0x7f302e6e7000, 8192, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0x7f302e6e7000
[pid 24894] mmap(0x7f302e6e9000, 4096, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) = 0x7f302e6e9000
[pid 24894] mmap(0x7f302e6ea000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) = 0x7f302e6ea000
[pid 24894] mmap(0x7f302e6eb000, 112, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f302e6eb000
[pid 24894] close(3)                    = 0
[pid 24894] openat(AT_FDCWD, &quot;/lib64/libpthread.so.0&quot;, O_RDONLY|O_CLOEXEC) = 3
[pid 24894] read(3, &quot;\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0&gt;\0\1\0\0\0\0\202\0\0\0\0\0\0&quot;..., 832) = 832
[pid 24894] lseek(3, 824, SEEK_SET)     = 824
[pid 24894] read(3, &quot;\4\0\0\0\24\0\0\0\3\0\0\0GNU\0=K\6\363\272\306&lt;\320\35\37vOsr\212\341&quot;..., 68) = 68
[pid 24894] fstat(3, {st_mode=S_IFREG|0755, st_size=695360, ...}) = 0
[pid 24894] lseek(3, 824, SEEK_SET)     = 824
[pid 24894] read(3, &quot;\4\0\0\0\24\0\0\0\3\0\0\0GNU\0=K\6\363\272\306&lt;\320\35\37vOsr\212\341&quot;..., 68) = 68
[pid 24894] mmap(NULL, 131552, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f302e6c4000
[pid 24894] mmap(0x7f302e6cb000, 61440, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x7000) = 0x7f302e6cb000
[pid 24894] mmap(0x7f302e6da000, 20480, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x16000) = 0x7f302e6da000
[pid 24894] mmap(0x7f302e6df000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1a000) = 0x7f302e6df000
[pid 24894] mmap(0x7f302e6e1000, 12768, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f302e6e1000
[pid 24894] close(3)                    = 0
[pid 24894] mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f302e6c2000
[pid 24894] arch_prctl(ARCH_SET_FS, 0x7f302e6c32c0) = 0
[pid 24894] mprotect(0x7f302ead7000, 12288, PROT_READ) = 0
[pid 24894] mprotect(0x7f302e6df000, 4096, PROT_READ) = 0
[pid 24894] mprotect(0x7f302e6ea000, 4096, PROT_READ) = 0
[pid 24894] mprotect(0x7f302e830000, 4096, PROT_READ) = 0
[pid 24894] mprotect(0x7f302e913000, 32768, PROT_READ) = 0
[pid 24894] mprotect(0x55711c760000, 4096, PROT_READ) = 0
[pid 24894] mprotect(0x7f302eb3b000, 4096, PROT_READ) = 0
[pid 24894] munmap(0x7f302eae3000, 188179) = 0
[pid 24894] set_tid_address(0x7f302e6c3590) = 24894
[pid 24894] set_robust_list(0x7f302e6c35a0, 24) = 0
[pid 24894] rt_sigaction(SIGRTMIN, {sa_handler=0x7f302e6cbc50, sa_mask=[], sa_flags=SA_RESTORER|SA_SIGINFO, sa_restorer=0x7f302e6d7d40}, NULL, 8) = 0
[pid 24894] rt_sigaction(SIGRT_1, {sa_handler=0x7f302e6cbcf0, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART|SA_SIGINFO, sa_restorer=0x7f302e6d7d40}, NULL, 8) = 0
[pid 24894] rt_sigprocmask(SIG_UNBLOCK, [RTMIN RT_1], NULL, 8) = 0
[pid 24894] prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=8192*1024, rlim_max=RLIM64_INFINITY}) = 0
[pid 24894] openat(AT_FDCWD, &quot;/dev/urandom&quot;, O_RDONLY) = 3
[pid 24894] brk(NULL)                   = 0x55711c860000
[pid 24894] brk(0x55711c881000)         = 0x55711c881000
[pid 24894] brk(NULL)                   = 0x55711c881000
[pid 24894] read(3, &quot;\346\317xj\341.\354\2\213C9\370\240\320\216\3340=\366\27#\257\25\246\334W\337\222RK\262\200&quot;..., 4500) = 4500
[pid 24894] unlink(&quot;hoge&quot;)              = 0
[pid 24894] openat(AT_FDCWD, &quot;hoge&quot;, O_RDWR|O_CREAT|O_TRUNC|O_NONBLOCK, 0644) = 4
[pid 24894] write(4, &quot;RIFF\377\377\377\377&quot;, 8) = 8
[pid 24894] write(4, &quot;WAVE&quot;, 4)         = 4
[pid 24894] write(4, &quot;fmt \20\0\0\0\1\0\1\0D\254\0\0D\254\0\0\1\0\10\0&quot;, 24) = 24
[pid 24894] write(4, &quot;data\333\377\377\377&quot;, 8) = 8
[pid 24894] write(4, &quot;\346\317xj\341.\354\2\213C9\370\240\320\216\3340=\366\27#\257\25&quot;, 23) = 23
[pid 24894] lseek(4, 0, SEEK_SET)       = 0
[pid 24894] write(4, &quot;RIFF_\0\0\0&quot;, 8)  = 8
[pid 24894] write(4, &quot;WAVE&quot;, 4)         = 4
[pid 24894] write(4, &quot;fmt \20\0\0\0\1\0\1\0D\254\0\0D\254\0\0\1\0\10\0&quot;, 24) = 24
[pid 24894] write(4, &quot;data\27\0\0\0&quot;, 8) = 8
[pid 24894] fsync(4)                    = 0
[pid 24894] close(4)                    = 0
[pid 24894] openat(AT_FDCWD, &quot;hoge&quot;, O_RDONLY|O_NONBLOCK) = 4
[pid 24894] read(4, &quot;RIFF&quot;, 4)          = 4
[pid 24894] read(4, &quot;_\0\0\0&quot;, 4)       = 4
[pid 24894] read(4, &quot;WAVE&quot;, 4)          = 4
[pid 24894] read(4, &quot;fmt \20\0\0\0&quot;, 8) = 8
[pid 24894] read(4, &quot;\1\0\1\0D\254\0\0D\254\0\0\1\0\10\0&quot;, 16) = 16
[pid 24894] read(4, &quot;data\27\0\0\0&quot;, 8) = 8
[pid 24894] read(4, &quot;\346\317xj\341.\354\2\213C9\370\240\320\216\3340=\366\27#\257\25&quot;, 23) = 23
[pid 24894] close(4)                    = 0
[pid 24894] unlink(&quot;hoge&quot;)              = 0
[pid 24894] openat(AT_FDCWD, &quot;hoge&quot;, O_RDWR|O_CREAT|O_TRUNC|O_NONBLOCK, 0644) = 4
[pid 24894] write(4, &quot;RIFF\377\377\377\377&quot;, 8) = 8
[pid 24894] write(4, &quot;WAVE&quot;, 4)         = 4
[pid 24894] write(4, &quot;fmt \20\0\0\0\1\0\1\0\200\273\0\0\200\273\0\0\1\0\10\0&quot;, 24) = 24
[pid 24894] write(4, &quot;data\333\377\377\377&quot;, 8) = 8
[pid 24894] write(4, &quot;\346\317xj\341.\354\2\213C9\370\240\320\216\3340=\366\27#\257\25&quot;, 23) = 23
[pid 24894] lseek(4, 0, SEEK_SET)       = 0
[pid 24894] write(4, &quot;RIFF_\0\0\0&quot;, 8)  = 8
[pid 24894] write(4, &quot;WAVE&quot;, 4)         = 4
[pid 24894] write(4, &quot;fmt \20\0\0\0\1\0\1\0\200\273\0\0\200\273\0\0\1\0\10\0&quot;, 24) = 24
[pid 24894] write(4, &quot;data\27\0\0\0&quot;, 8) = 8
[pid 24894] fsync(4)                    = 0
[pid 24894] close(4)                    = 0
[pid 24894] openat(AT_FDCWD, &quot;hoge&quot;, O_RDONLY|O_NONBLOCK) = 4
[pid 24894] read(4, &quot;RIFF&quot;, 4)          = 4
[pid 24894] read(4, &quot;_\0\0\0&quot;, 4)       = 4
[pid 24894] read(4, &quot;WAVE&quot;, 4)          = 4
[pid 24894] read(4, &quot;fmt \20\0\0\0&quot;, 8) = 8
[pid 24894] read(4, &quot;\1\0\1\0\200\273\0\0\200\273\0\0\1\0\10\0&quot;, 16) = 16
[pid 24894] read(4, &quot;data\27\0\0\0&quot;, 8) = 8
[pid 24894] read(4, &quot;\346\317xj\341.\354\2\213C9\370\240\320\216\3340=\366\27#\257\25&quot;, 23) = 23
[pid 24894] close(4)                    = 0
[pid 24894] unlink(&quot;hoge&quot;)              = 0
[pid 24894] openat(AT_FDCWD, &quot;hoge&quot;, O_RDWR|O_CREAT|O_TRUNC|O_NONBLOCK, 0644) = 4
[pid 24894] write(4, &quot;RIFF\377\377\377\377&quot;, 8) = 8
[pid 24894] write(4, &quot;WAVE&quot;, 4)         = 4
[pid 24894] write(4, &quot;fmt \20\0\0\0\1\0\1\0\210X\1\0\210X\1\0\1\0\10\0&quot;, 24) = 24
[pid 24894] write(4, &quot;data\333\377\377\377&quot;, 8) = 8
[pid 24894] write(4, &quot;\346\317xj\341.\354\2\213C9\370\240\320\216\3340=\366\27#\257\25&quot;, 23) = 23
[pid 24894] lseek(4, 0, SEEK_SET)       = 0
[pid 24894] write(4, &quot;RIFF_\0\0\0&quot;, 8)  = 8
[pid 24894] write(4, &quot;WAVE&quot;, 4)         = 4
[pid 24894] write(4, &quot;fmt \20\0\0\0\1\0\1\0\210X\1\0\210X\1\0\1\0\10\0&quot;, 24) = 24
[pid 24894] write(4, &quot;data\27\0\0\0&quot;, 8) = 8
[pid 24894] fsync(4)                    = 0
[pid 24894] close(4)                    = 0
[pid 24894] openat(AT_FDCWD, &quot;hoge&quot;, O_RDONLY|O_NONBLOCK) = 4
[pid 24894] read(4, &quot;RIFF&quot;, 4)          = 4
[pid 24894] read(4, &quot;_\0\0\0&quot;, 4)       = 4
[pid 24894] read(4, &quot;WAVE&quot;, 4)          = 4
[pid 24894] read(4, &quot;fmt \20\0\0\0&quot;, 8) = 8
[pid 24894] read(4, &quot;\1\0\1\0\210X\1\0\210X\1\0\1\0\10\0&quot;, 16) = 16
[pid 24894] read(4, &quot;data\27\0\0\0&quot;, 8) = 8
[pid 24894] read(4, &quot;\346\317xj\341.\354\2\213C9\370\240\320\216\3340=\366\27#\257\25&quot;, 23) = 23
[pid 24894] close(4)                    = 0
[pid 24894] unlink(&quot;hoge&quot;)              = 0
[pid 24894] openat(AT_FDCWD, &quot;hoge&quot;, O_RDWR|O_CREAT|O_TRUNC|O_NONBLOCK, 0644) = 4
[pid 24894] write(4, &quot;RIFF\377\377\377\377&quot;, 8) = 8
[pid 24894] write(4, &quot;WAVE&quot;, 4)         = 4
[pid 24894] write(4, &quot;fmt \20\0\0\0\1\0\1\0\0w\1\0\0w\1\0\1\0\10\0&quot;, 24) = 24
[pid 24894] write(4, &quot;data\333\377\377\377&quot;, 8) = 8
[pid 24894] write(4, &quot;\346\317xj\341.\354\2\213C9\370\240\320\216\3340=\366\27#\257\25&quot;, 23) = 23
[pid 24894] lseek(4, 0, SEEK_SET)       = 0
[pid 24894] write(4, &quot;RIFF_\0\0\0&quot;, 8)  = 8
[pid 24894] write(4, &quot;WAVE&quot;, 4)         = 4
[pid 24894] write(4, &quot;fmt \20\0\0\0\1\0\1\0\0w\1\0\0w\1\0\1\0\10\0&quot;, 24) = 24
[pid 24894] write(4, &quot;data\27\0\0\0&quot;, 8) = 8
[pid 24894] fsync(4)                    = 0
[pid 24894] close(4)                    = 0
[pid 24894] openat(AT_FDCWD, &quot;hoge&quot;, O_RDONLY|O_NONBLOCK) = 4
[pid 24894] read(4, &quot;RIFF&quot;, 4)          = 4
[pid 24894] read(4, &quot;_\0\0\0&quot;, 4)       = 4
[pid 24894] read(4, &quot;WAVE&quot;, 4)          = 4
[pid 24894] read(4, &quot;fmt \20\0\0\0&quot;, 8) = 8
[pid 24894] read(4, &quot;\1\0\1\0\0w\1\0\0w\1\0\1\0\10\0&quot;, 16) = 16
[pid 24894] read(4, &quot;data\27\0\0\0&quot;, 8) = 8
[pid 24894] read(4, &quot;\346\317xj\341.\354\2\213C9\370\240\320\216\3340=\366\27#\257\25&quot;, 23) = 23
[pid 24894] close(4)                    = 0
[pid 24894] unlink(&quot;hoge&quot;)              = 0
[pid 24894] openat(AT_FDCWD, &quot;hoge&quot;, O_RDWR|O_CREAT|O_TRUNC|O_NONBLOCK, 0644) = 4
[pid 24894] write(4, &quot;RIFF\377\377\377\377&quot;, 8) = 8
[pid 24894] write(4, &quot;WAVE&quot;, 4)         = 4
[pid 24894] write(4, &quot;fmt \20\0\0\0\1\0\1\0\20\261\2\0\20\261\2\0\1\0\10\0&quot;, 24) = 24
[pid 24894] write(4, &quot;data\333\377\377\377&quot;, 8) = 8
[pid 24894] write(4, &quot;\346\317xj\341.\354\2\213C9\370\240\320\216\3340=\366\27#\257\25&quot;, 23) = 23
[pid 24894] lseek(4, 0, SEEK_SET)       = 0
[pid 24894] write(4, &quot;RIFF_\0\0\0&quot;, 8)  = 8
[pid 24894] write(4, &quot;WAVE&quot;, 4)         = 4
[pid 24894] write(4, &quot;fmt \20\0\0\0\1\0\1\0\20\261\2\0\20\261\2\0\1\0\10\0&quot;, 24) = 24
[pid 24894] write(4, &quot;data\27\0\0\0&quot;, 8) = 8
[pid 24894] fsync(4)                    = 0
[pid 24894] close(4)                    = 0
[pid 24894] openat(AT_FDCWD, &quot;hoge&quot;, O_RDONLY|O_NONBLOCK) = 4
[pid 24894] read(4, &quot;RIFF&quot;, 4)          = 4
[pid 24894] read(4, &quot;_\0\0\0&quot;, 4)       = 4
[pid 24894] read(4, &quot;WAVE&quot;, 4)          = 4
[pid 24894] read(4, &quot;fmt \20\0\0\0&quot;, 8) = 8
[pid 24894] read(4, &quot;\1\0\1\0\20\261\2\0\20\261\2\0\1\0\10\0&quot;, 16) = 16
[pid 24894] read(4, &quot;data\27\0\0\0&quot;, 8) = 8
[pid 24894] read(4, &quot;\346\317xj\341.\354\2\213C9\370\240\320\216\3340=\366\27#\257\25&quot;, 23) = 23
[pid 24894] close(4)                    = 0
[pid 24894] unlink(&quot;hoge&quot;)              = 0
[pid 24894] openat(AT_FDCWD, &quot;hoge&quot;, O_RDWR|O_CREAT|O_TRUNC|O_NONBLOCK, 0644) = 4
[pid 24894] write(4, &quot;RIFF\377\377\377\377&quot;, 8) = 8
[pid 24894] write(4, &quot;WAVE&quot;, 4)         = 4
[pid 24894] write(4, &quot;fmt \20\0\0\0\1\0\1\0\0\356\2\0\0\356\2\0\1\0\10\0&quot;, 24) = 24
[pid 24894] write(4, &quot;data\333\377\377\377&quot;, 8) = 8
[pid 24894] write(4, &quot;\346\317xj\341.\354\2\213C9\370\240\320\216\3340=\366\27#\257\25&quot;, 23) = 23
[pid 24894] lseek(4, 0, SEEK_SET)       = 0
[pid 24894] write(4, &quot;RIFF_\0\0\0&quot;, 8)  = 8
[pid 24894] write(4, &quot;WAVE&quot;, 4)         = 4
[pid 24894] write(4, &quot;fmt \20\0\0\0\1\0\1\0\0\356\2\0\0\356\2\0\1\0\10\0&quot;, 24) = 24
[pid 24894] write(4, &quot;data\27\0\0\0&quot;, 8) = 8
[pid 24894] fsync(4)                    = 0
[pid 24894] close(4)                    = 0
[pid 24894] openat(AT_FDCWD, &quot;hoge&quot;, O_RDONLY|O_NONBLOCK) = 4
[pid 24894] read(4, &quot;RIFF&quot;, 4)          = 4
[pid 24894] read(4, &quot;_\0\0\0&quot;, 4)       = 4
[pid 24894] read(4, &quot;WAVE&quot;, 4)          = 4
[pid 24894] read(4, &quot;fmt \20\0\0\0&quot;, 8) = 8
[pid 24894] read(4, &quot;\1\0\1\0\0\356\2\0\0\356\2\0\1\0\10\0&quot;, 16) = 16
[pid 24894] read(4, &quot;data\27\0\0\0&quot;, 8) = 8
[pid 24894] read(4, &quot;\346\317xj\341.\354\2\213C9\370\240\320\216\3340=\366\27#\257\25&quot;, 23) = 23
[pid 24894] close(4)                    = 0
[pid 24894] unlink(&quot;hoge&quot;)              = 0
[pid 24894] unlink(&quot;hoge&quot;)              = -1 ENOENT (No such file or directory)
[pid 24894] openat(AT_FDCWD, &quot;hoge&quot;, O_RDWR|O_CREAT|O_TRUNC|O_NONBLOCK, 0644) = 4
[pid 24894] write(4, &quot;RIFF\377\377\377\377&quot;, 8) = 8
[pid 24894] write(4, &quot;WAVE&quot;, 4)         = 4
[pid 24894] write(4, &quot;fmt \20\0\0\0\1\0\1\0D\254\0\0D\254\0\0\1\0\10\0&quot;, 24) = 24
[pid 24894] write(4, &quot;data\333\377\377\377&quot;, 8) = 8
[pid 24894] write(4, &quot;\346\317xj\341.\354\2\213C9\370\240\320\216\3340=\366\27#\257\25\246\334W\337\222RK\262\200&quot;..., 1047) = 1047
[pid 24894] lseek(4, 0, SEEK_SET)       = 0
[pid 24894] write(4, &quot;RIFF_\4\0\0&quot;, 8)  = 8
[pid 24894] write(4, &quot;WAVE&quot;, 4)         = 4
[pid 24894] write(4, &quot;fmt \20\0\0\0\1\0\1\0D\254\0\0D\254\0\0\1\0\10\0&quot;, 24) = 24
[pid 24894] write(4, &quot;data\27\4\0\0&quot;, 8) = 8
[pid 24894] fsync(4)                    = 0
[pid 24894] close(4)                    = 0
[pid 24894] openat(AT_FDCWD, &quot;hoge&quot;, O_RDONLY|O_NONBLOCK) = 4
[pid 24894] read(4, &quot;RIFF&quot;, 4)          = 4
[pid 24894] read(4, &quot;_\4\0\0&quot;, 4)       = 4
[pid 24894] read(4, &quot;WAVE&quot;, 4)          = 4
[pid 24894] read(4, &quot;fmt \20\0\0\0&quot;, 8) = 8
[pid 24894] read(4, &quot;\1\0\1\0D\254\0\0D\254\0\0\1\0\10\0&quot;, 16) = 16
[pid 24894] read(4, &quot;data\27\4\0\0&quot;, 8) = 8
[pid 24894] read(4, &quot;\346\317xj\341.\354\2\213C9\370\240\320\216\3340=\366\27#\257\25\246\334W\337\222RK\262\200&quot;..., 1047) = 1047
[pid 24894] close(4)                    = 0
[pid 24894] unlink(&quot;hoge&quot;)              = 0
[pid 24894] openat(AT_FDCWD, &quot;hoge&quot;, O_RDWR|O_CREAT|O_TRUNC|O_NONBLOCK, 0644) = 4
[pid 24894] write(4, &quot;RIFF\377\377\377\377&quot;, 8) = 8
[pid 24894] write(4, &quot;WAVE&quot;, 4)         = 4
[pid 24894] write(4, &quot;fmt \20\0\0\0\1\0\1\0\200\273\0\0\200\273\0\0\1\0\10\0&quot;, 24) = 24
[pid 24894] write(4, &quot;data\333\377\377\377&quot;, 8) = 8
[pid 24894] write(4, &quot;\346\317xj\341.\354\2\213C9\370\240\320\216\3340=\366\27#\257\25\246\334W\337\222RK\262\200&quot;..., 1047) = 1047
[pid 24894] lseek(4, 0, SEEK_SET)       = 0
[pid 24894] write(4, &quot;RIFF_\4\0\0&quot;, 8)  = 8
[pid 24894] write(4, &quot;WAVE&quot;, 4)         = 4
[pid 24894] write(4, &quot;fmt \20\0\0\0\1\0\1\0\200\273\0\0\200\273\0\0\1\0\10\0&quot;, 24) = 24
[pid 24894] write(4, &quot;data\27\4\0\0&quot;, 8) = 8
[pid 24894] fsync(4)                    = 0
[pid 24894] close(4)                    = 0
[pid 24894] openat(AT_FDCWD, &quot;hoge&quot;, O_RDONLY|O_NONBLOCK) = 4
[pid 24894] read(4, &quot;RIFF&quot;, 4)          = 4
[pid 24894] read(4, &quot;_\4\0\0&quot;, 4)       = 4
[pid 24894] read(4, &quot;WAVE&quot;, 4)          = 4
[pid 24894] read(4, &quot;fmt \20\0\0\0&quot;, 8) = 8
[pid 24894] read(4, &quot;\1\0\1\0\200\273\0\0\200\273\0\0\1\0\10\0&quot;, 16) = 16
[pid 24894] read(4, &quot;data\27\4\0\0&quot;, 8) = 8
[pid 24894] read(4, &quot;\346\317xj\341.\354\2\213C9\370\240\320\216\3340=\366\27#\257\25\246\334W\337\222RK\262\200&quot;..., 1047) = 1047
[pid 24894] close(4)                    = 0
[pid 24894] unlink(&quot;hoge&quot;)              = 0
[pid 24894] openat(AT_FDCWD, &quot;hoge&quot;, O_RDWR|O_CREAT|O_TRUNC|O_NONBLOCK, 0644) = 4
[pid 24894] write(4, &quot;RIFF\377\377\377\377&quot;, 8) = 8
[pid 24894] write(4, &quot;WAVE&quot;, 4)         = 4
[pid 24894] write(4, &quot;fmt \20\0\0\0\1\0\1\0\210X\1\0\210X\1\0\1\0\10\0&quot;, 24) = 24
[pid 24894] write(4, &quot;data\333\377\377\377&quot;, 8) = 8
[pid 24894] write(4, &quot;\346\317xj\341.\354\2\213C9\370\240\320\216\3340=\366\27#\257\25\246\334W\337\222RK\262\200&quot;..., 1047) = 1047
[pid 24894] lseek(4, 0, SEEK_SET)       = 0
[pid 24894] write(4, &quot;RIFF_\4\0\0&quot;, 8)  = 8
[pid 24894] write(4, &quot;WAVE&quot;, 4)         = 4
[pid 24894] write(4, &quot;fmt \20\0\0\0\1\0\1\0\210X\1\0\210X\1\0\1\0\10\0&quot;, 24) = 24
[pid 24894] write(4, &quot;data\27\4\0\0&quot;, 8) = 8
[pid 24894] fsync(4)                    = 0
[pid 24894] close(4)                    = 0
[pid 24894] openat(AT_FDCWD, &quot;hoge&quot;, O_RDONLY|O_NONBLOCK) = 4
[pid 24894] read(4, &quot;RIFF&quot;, 4)          = 4
[pid 24894] read(4, &quot;_\4\0\0&quot;, 4)       = 4
[pid 24894] read(4, &quot;WAVE&quot;, 4)          = 4
[pid 24894] read(4, &quot;fmt \20\0\0\0&quot;, 8) = 8
[pid 24894] read(4, &quot;\1\0\1\0\210X\1\0\210X\1\0\1\0\10\0&quot;, 16) = 16
[pid 24894] read(4, &quot;data\27\4\0\0&quot;, 8) = 8
[pid 24894] read(4, &quot;\346\317xj\341.\354\2\213C9\370\240\320\216\3340=\366\27#\257\25\246\334W\337\222RK\262\200&quot;..., 1047) = 1047
[pid 24894] close(4)                    = 0
[pid 24894] unlink(&quot;hoge&quot;)              = 0
[pid 24894] openat(AT_FDCWD, &quot;hoge&quot;, O_RDWR|O_CREAT|O_TRUNC|O_NONBLOCK, 0644) = 4
[pid 24894] write(4, &quot;RIFF\377\377\377\377&quot;, 8) = 8
[pid 24894] write(4, &quot;WAVE&quot;, 4)         = 4
[pid 24894] write(4, &quot;fmt \20\0\0\0\1\0\1\0\0w\1\0\0w\1\0\1\0\10\0&quot;, 24) = 24
[pid 24894] write(4, &quot;data\333\377\377\377&quot;, 8) = 8
[pid 24894] write(4, &quot;\346\317xj\341.\354\2\213C9\370\240\320\216\3340=\366\27#\257\25\246\334W\337\222RK\262\200&quot;..., 1047) = 1047
[pid 24894] lseek(4, 0, SEEK_SET)       = 0
[pid 24894] write(4, &quot;RIFF_\4\0\0&quot;, 8)  = 8
[pid 24894] write(4, &quot;WAVE&quot;, 4)         = 4
[pid 24894] write(4, &quot;fmt \20\0\0\0\1\0\1\0\0w\1\0\0w\1\0\1\0\10\0&quot;, 24) = 24
[pid 24894] write(4, &quot;data\27\4\0\0&quot;, 8) = 8
[pid 24894] fsync(4)                    = 0
[pid 24894] close(4)                    = 0
[pid 24894] openat(AT_FDCWD, &quot;hoge&quot;, O_RDONLY|O_NONBLOCK) = 4
[pid 24894] read(4, &quot;RIFF&quot;, 4)          = 4
[pid 24894] read(4, &quot;_\4\0\0&quot;, 4)       = 4
[pid 24894] read(4, &quot;WAVE&quot;, 4)          = 4
[pid 24894] read(4, &quot;fmt \20\0\0\0&quot;, 8) = 8
[pid 24894] read(4, &quot;\1\0\1\0\0w\1\0\0w\1\0\1\0\10\0&quot;, 16) = 16
[pid 24894] read(4, &quot;data\27\4\0\0&quot;, 8) = 8
[pid 24894] read(4, &quot;\346\317xj\341.\354\2\213C9\370\240\320\216\3340=\366\27#\257\25\246\334W\337\222RK\262\200&quot;..., 1047) = 1047
[pid 24894] close(4)                    = 0
[pid 24894] unlink(&quot;hoge&quot;)              = 0
[pid 24894] openat(AT_FDCWD, &quot;hoge&quot;, O_RDWR|O_CREAT|O_TRUNC|O_NONBLOCK, 0644) = 4
[pid 24894] write(4, &quot;RIFF\377\377\377\377&quot;, 8) = 8
[pid 24894] write(4, &quot;WAVE&quot;, 4)         = 4
[pid 24894] write(4, &quot;fmt \20\0\0\0\1\0\1\0\20\261\2\0\20\261\2\0\1\0\10\0&quot;, 24) = 24
[pid 24894] write(4, &quot;data\333\377\377\377&quot;, 8) = 8
[pid 24894] write(4, &quot;\346\317xj\341.\354\2\213C9\370\240\320\216\3340=\366\27#\257\25\246\334W\337\222RK\262\200&quot;..., 1047) = 1047
[pid 24894] lseek(4, 0, SEEK_SET)       = 0
[pid 24894] write(4, &quot;RIFF_\4\0\0&quot;, 8)  = 8
[pid 24894] write(4, &quot;WAVE&quot;, 4)         = 4
[pid 24894] write(4, &quot;fmt \20\0\0\0\1\0\1\0\20\261\2\0\20\261\2\0\1\0\10\0&quot;, 24) = 24
[pid 24894] write(4, &quot;data\27\4\0\0&quot;, 8) = 8
[pid 24894] fsync(4)                    = 0
[pid 24894] close(4)                    = 0
</pre>

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/19
Repository URL: https://github.com/alsa-project/alsa-utils
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
