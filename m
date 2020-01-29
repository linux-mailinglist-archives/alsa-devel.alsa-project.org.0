Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D6714D00E
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jan 2020 19:01:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B6E916AB;
	Wed, 29 Jan 2020 19:01:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B6E916AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580320919;
	bh=TaDDvh0Vkknb+LwLdurxjeGcfKJUQG/Q2TcFaeFMQCc=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mq7Az0APTCKuitghylWmpYEHKQcDh+HGir1lfQA8NkgmSZuKPTQ2LteH4oaNtsjg8
	 krE38nTBW92lOUxq27b9pEfo9FamOcUz4pr9Kl/NEMIdEyex6lC+Rq4NQG+hDt+TGY
	 Snr7akH8ljn+rw4t23WBB97ThswhrMe2ioRrGQa4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48685F80122;
	Wed, 29 Jan 2020 19:00:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8579BF8021E; Wed, 29 Jan 2020 17:06:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ****
X-Spam-Status: No, score=4.1 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1B5BF80122
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 17:06:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1B5BF80122
Received: by mail-il1-f199.google.com with SMTP id h18so193328ilc.2
 for <alsa-devel@alsa-project.org>; Wed, 29 Jan 2020 08:06:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=fEUlUjM8SEojeOk6pwtcSTQDu8D7nALBWF21TUkUjFQ=;
 b=XiO9mRQduQN2+H5JxE1NOK1tgmf3nYcGZUSZiiGRP3GR2ybMifSnKnkfX4KqD8qrmD
 1ToVfJS8Rw8wvFPEaYt9yANhB0Oas+zMdcHgxtiycUzn69xjmrDvMmTZTPM1yoHIdPNO
 7aPPfnWn143hVeEigdmE3JehV+oHSfYLKxh+zgrbteZo8JTDJYHi6nWLzeK9XfIVTxfj
 4stMBcElnMRPwb63bDqR3VvnheeQQLvDKFpXjWkoU478yMiJEv/7g0/wyc58Uh146RBa
 DcUKxTGaNxOWWJHbQWwK8KV+2WnCiQ2KRMK6v0HL/OGnXVUpdemqDPOiV933aTMQxZ2O
 q5ng==
X-Gm-Message-State: APjAAAVEX2nkAksw3P1cz4IVCtoa7fgCWuJVXYC+K9hZX7DyU3RtrHSY
 ya1d5eWEe7jsF/JwldhyQNaHQOjdxpRB7r7auQ6IFBoDn8iR
X-Google-Smtp-Source: APXvYqxRd2se19n9AMGBF0tsd+V/QMOOXynWF3G0Gosz8cItmjCbMWlTR4gOeDt0e9z2keIjwUnyAv5NoJ294QR5X7nnb81NTilm
MIME-Version: 1.0
X-Received: by 2002:a92:914a:: with SMTP id t71mr26674745ild.293.1580313974646; 
 Wed, 29 Jan 2020 08:06:14 -0800 (PST)
Date: Wed, 29 Jan 2020 08:06:14 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000017ad0d059d498531@google.com>
From: syzbot <syzbot+30edd0f34bfcdc548ac4@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, perex@perex.cz, sumit.semwal@linaro.org, 
 syzkaller-bugs@googlegroups.com, tglx@linutronix.de, tiwai@suse.com
X-Mailman-Approved-At: Wed, 29 Jan 2020 19:00:16 +0100
Subject: [alsa-devel] memory leak in snd_pcm_hw_params
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

Hello,

syzbot found the following crash on:

HEAD commit:    b3a60822 Merge branch 'for-v5.6' of git://git.kernel.org:/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1351cf66e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e97a1bc78afb77f
dashboard link: https://syzkaller.appspot.com/bug?extid=30edd0f34bfcdc548ac4
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14e97735e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13cd9bc9e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+30edd0f34bfcdc548ac4@syzkaller.appspotmail.com

executing program
executing program
executing program
BUG: memory leak
unreferenced object 0xffff888108fdefc0 (size 64):
  comm "syz-executor222", pid 7310, jiffies 4294946025 (age 13.660s)
  hex dump (first 32 bytes):
    07 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 10 33 02 00 c9 ff ff 00 00 00 00 00 00 00 00  ..3.............
  backtrace:
    [<00000000c59c6b0c>] kmemleak_alloc_recursive include/linux/kmemleak.h:43 [inline]
    [<00000000c59c6b0c>] slab_post_alloc_hook mm/slab.h:586 [inline]
    [<00000000c59c6b0c>] slab_alloc mm/slab.c:3320 [inline]
    [<00000000c59c6b0c>] kmem_cache_alloc_trace+0x145/0x2c0 mm/slab.c:3549
    [<00000000478172ce>] kmalloc include/linux/slab.h:556 [inline]
    [<00000000478172ce>] kzalloc include/linux/slab.h:670 [inline]
    [<00000000478172ce>] snd_pcm_lib_malloc_pages+0x12b/0x200 sound/core/pcm_memory.c:404
    [<0000000091532e16>] snd_pcm_hw_params+0x720/0x830 sound/core/pcm_native.c:691
    [<000000002070a986>] snd_pcm_kernel_ioctl+0xb5/0x170 sound/core/pcm_native.c:3238
    [<00000000394e99f4>] snd_pcm_oss_change_params_locked+0x745/0x1140 sound/core/oss/pcm_oss.c:944
    [<00000000c81f42ac>] snd_pcm_oss_change_params+0x43/0x80 sound/core/oss/pcm_oss.c:1087
    [<000000007710a1c0>] snd_pcm_oss_make_ready+0x55/0xc0 sound/core/oss/pcm_oss.c:1146
    [<0000000069305204>] snd_pcm_oss_sync.isra.0+0xb8/0x310 sound/core/oss/pcm_oss.c:1707
    [<00000000692460c8>] snd_pcm_oss_release+0xef/0x100 sound/core/oss/pcm_oss.c:2545
    [<0000000013ba02c9>] __fput+0xed/0x300 fs/file_table.c:280
    [<0000000080810f18>] ____fput+0x16/0x20 fs/file_table.c:313
    [<00000000e6bb3aa6>] task_work_run+0x9d/0xc0 kernel/task_work.c:113
    [<00000000b6ce71eb>] exit_task_work include/linux/task_work.h:22 [inline]
    [<00000000b6ce71eb>] do_exit+0x3fa/0xe20 kernel/exit.c:801
    [<0000000045ce7ad3>] do_group_exit+0x4b/0xe0 kernel/exit.c:899
    [<00000000aeb85903>] __do_sys_exit_group kernel/exit.c:910 [inline]
    [<00000000aeb85903>] __se_sys_exit_group kernel/exit.c:908 [inline]
    [<00000000aeb85903>] __x64_sys_exit_group+0x1c/0x20 kernel/exit.c:908
    [<000000008b12db16>] do_syscall_64+0x73/0x220 arch/x86/entry/common.c:294



---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
