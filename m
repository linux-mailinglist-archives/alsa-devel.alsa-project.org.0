Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A99FF258CA8
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 12:21:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B3721793;
	Tue,  1 Sep 2020 12:21:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B3721793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598955710;
	bh=FIvAqAAuW3pzdMLZFgCidYxpTCyrv9uWBiOii4HR6S0=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fSBSkttbDdbhAGMhiA6Yl8dWI6eCqjp1OCMEtIibd6ebxt6GeWs9ZkNpeWBnD7iNM
	 mr8VNDng/jS2XE9+uWU2j4BGrND8qMgdIoRoQMEVsGxaKNTWrvG183EuxUL96eM4Gk
	 x9Lr3gPKLbFYhNMpbLHaSoJuBBroSR4LO4rjnpE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 283A3F80304;
	Tue,  1 Sep 2020 12:16:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B837F80217; Tue,  1 Sep 2020 12:08:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76835F801EB
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 12:08:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76835F801EB
Received: by mail-io1-f71.google.com with SMTP id f19so538545iol.10
 for <alsa-devel@alsa-project.org>; Tue, 01 Sep 2020 03:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=vcq85hTgfFbOTzSGIGZ0MEl5+wa57BmvY+5hA/EWY2Y=;
 b=sUYqDZJrq/2EkAnfJ+l7hm4Rs3SfnQ+1XpxvIt4eNAv9c2Z8fgckTBE/CU1U8wUaYo
 VKwb5ilW/fWKExLhNxKY3XQ3MWS+jEdO74P0RBD5f+kuJp90g0ASNvFxztt9FCVRnJ5L
 6lz2pBylr4puILQRns/bsK0QqmTJF/JiIsecgQYB+Y/TBGxlR6ujsIm2Iq4Sg5DHPCt8
 Z7oZillbe88cNySxAhZQXTmG5OWBqeH77J28KJowXe733Dyhq6V5e/bnDCKX01EMWWcm
 dR3grpYrEpyZykY/Zt8hwDf8K/zDIhOZPhS1pQQmtP7aBPY0r70Mxtqe2ByPlJHVGKGd
 TimQ==
X-Gm-Message-State: AOAM5310IROpDCOmkHK9w74CET9sD3AlwneePV2/fKV5w7u51+wHb4BO
 63n7xn9V5xsON7OxtG8jiM0KyNkKvWFaUO6s7mIcYwYEFopw
X-Google-Smtp-Source: ABdhPJxznVX6UqT+Ib0Jsa6yzEKkg9S0WBmz58bmho7qUoI5y0QJy1MflBd9YqqLJGCYt2vJcCkvlJRpca2lmWouQKzMDqdk8wO4
MIME-Version: 1.0
X-Received: by 2002:a6b:6016:: with SMTP id r22mr853494iog.42.1598954896037;
 Tue, 01 Sep 2020 03:08:16 -0700 (PDT)
Date: Tue, 01 Sep 2020 03:08:16 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000971bc005ae3db23d@google.com>
Subject: WARNING in snd_pcm_plugin_build_mulaw
From: syzbot <syzbot+23b22dc2e0b81cbfcc95@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, festevam@gmail.com, 
 linux-kernel@vger.kernel.org, perex@perex.cz, robh@kernel.org, 
 syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 01 Sep 2020 12:15:51 +0200
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

Hello,

syzbot found the following issue on:

HEAD commit:    15bc20c6 Merge tag 'tty-5.9-rc3' of git://git.kernel.org/p..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1268efb1900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=891ca5711a9f1650
dashboard link: https://syzkaller.appspot.com/bug?extid=23b22dc2e0b81cbfcc95
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11a95f41900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11a452f2900000

The issue was bisected to:

commit f3ca3f5b0966cfc2737178cca8a7a65b09991898
Author: Fabio Estevam <festevam@gmail.com>
Date:   Fri Mar 27 15:57:21 2020 +0000

    dt-bindings: sound: cs42l51: Remove unneeded I2C unit name

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15395f41900000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=17395f41900000
console output: https://syzkaller.appspot.com/x/log.txt?x=13395f41900000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+23b22dc2e0b81cbfcc95@syzkaller.appspotmail.com
Fixes: f3ca3f5b0966 ("dt-bindings: sound: cs42l51: Remove unneeded I2C unit name")

------------[ cut here ]------------
WARNING: CPU: 0 PID: 6835 at sound/core/oss/mulaw.c:332 snd_pcm_plugin_build_mulaw+0x4ef/0x6e0 sound/core/oss/mulaw.c:332
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 6835 Comm: syz-executor088 Not tainted 5.9.0-rc2-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x1f0/0x31e lib/dump_stack.c:118
 panic+0x264/0x7a0 kernel/panic.c:231
 __warn+0x227/0x250 kernel/panic.c:600
 report_bug+0x1b1/0x2e0 lib/bug.c:198
 handle_bug+0x42/0x80 arch/x86/kernel/traps.c:234
 exc_invalid_op+0x16/0x40 arch/x86/kernel/traps.c:254
 asm_exc_invalid_op+0x12/0x20 arch/x86/include/asm/idtentry.h:536
RIP: 0010:snd_pcm_plugin_build_mulaw+0x4ef/0x6e0 sound/core/oss/mulaw.c:332
Code: 0f 0b bb fa ff ff ff eb cd e8 fd e3 2d fb 0f 0b bb fa ff ff ff eb bf e8 ef e3 2d fb 0f 0b bb fa ff ff ff eb b1 e8 e1 e3 2d fb <0f> 0b bb fa ff ff ff eb a3 89 e9 80 e1 07 80 c1 03 38 c1 0f 8c 77
RSP: 0018:ffffc90001ed7950 EFLAGS: 00010293
RAX: ffffffff8647143f RBX: 0000000000000000 RCX: ffff88808dcbc540
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffffff86471e70 R08: ffffffff864710ee R09: fffff520003daf47
R10: fffff520003daf47 R11: 0000000000000000 R12: 1ffff920003daf45
R13: ffffc90001ed7a18 R14: ffffc90001ed7a28 R15: ffffc90001ed7a28
 snd_pcm_plug_format_plugins+0xbbd/0x1640 sound/core/oss/pcm_plugin.c:494
 snd_pcm_oss_change_params_locked+0x2c29/0x4410 sound/core/oss/pcm_oss.c:952
 snd_pcm_oss_change_params sound/core/oss/pcm_oss.c:1084 [inline]
 snd_pcm_oss_make_ready+0x115/0x2b0 sound/core/oss/pcm_oss.c:1143
 snd_pcm_oss_sync+0x265/0x900 sound/core/oss/pcm_oss.c:1642
 snd_pcm_oss_release+0x119/0x270 sound/core/oss/pcm_oss.c:2546
 __fput+0x34f/0x7b0 fs/file_table.c:281
 task_work_run+0x137/0x1c0 kernel/task_work.c:141
 exit_task_work include/linux/task_work.h:25 [inline]
 do_exit+0x5f3/0x1f20 kernel/exit.c:806
 do_group_exit+0x161/0x2d0 kernel/exit.c:903
 __do_sys_exit_group+0x13/0x20 kernel/exit.c:914
 __se_sys_exit_group+0x10/0x10 kernel/exit.c:912
 __x64_sys_exit_group+0x37/0x40 kernel/exit.c:912
 do_syscall_64+0x31/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x440038
Code: Bad RIP value.
RSP: 002b:00007ffe721a2058 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 0000000000440038
RDX: 0000000000000000 RSI: 000000000000003c RDI: 0000000000000000
RBP: 00000000004bf870 R08: 00000000000000e7 R09: ffffffffffffffd0
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00000000006d1180 R14: 0000000000000000 R15: 0000000000000000
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
