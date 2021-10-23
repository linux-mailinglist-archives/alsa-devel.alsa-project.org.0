Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA20043AC26
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 08:16:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D87D16D5;
	Tue, 26 Oct 2021 08:15:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D87D16D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635228979;
	bh=Zp2EwFjLibhY7ua23tjb6o1d+dn8MMB0IvAuxCn/ipU=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B2ct/k6kNAoLwjHd+cGiGJClPrRgVItZUm+XqBjKnuzuYrqr59GNYQ1zZSnMWb++a
	 n+HyougPFTzbcn5rt0EWat7H25AdZSliDtx7XHgVbQ8FugcaQDKeQ2w+ouEYPucrAI
	 2y8WGZmXIHOusLQ2gZGPvaLT/7FzH1WfCAfnhT2Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E67CAF804C2;
	Tue, 26 Oct 2021 08:14:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0A9CF80240; Sat, 23 Oct 2021 21:35:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,SORTED_RECIPS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B805F8010B
 for <alsa-devel@alsa-project.org>; Sat, 23 Oct 2021 21:35:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B805F8010B
Received: by mail-io1-f69.google.com with SMTP id
 t1-20020a5d81c1000000b005de76e9e20cso2643510iol.7
 for <alsa-devel@alsa-project.org>; Sat, 23 Oct 2021 12:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=o4rd6Mkpq1AQ9on8hbgP8TELF/6kZHRbq1idq5wO+Cg=;
 b=QUjy0KCmU4QSzCNUTMiIemdVixdHHMS+49sNgFDPyuiXA5BGzq//h8T/h5aoT8Sl7N
 Al2DAn+W416da66e5tFU3s7g6QMjhVmHF92aHorh9outyUjLrYD/sfjdSzr2IoJBdLIV
 HQd6A/S0tugYXM1fzZtRS6xY10JHIjZWhJ6eFCCFs1kuGQHbl/MNc7Q10LCpOiQeLAyg
 hjquZo8xN6D3jm5izT3DHP7OlnNwG4HWAUz8SkJM4gdsVqS59AdzRb6SwBF4zkMjtvqB
 Zk3LbJyKW0Nv4B1iiXhARURbpVvOREEUPbOaDwABU/63aaZw2waQDbUeHLE/QIY9xY+b
 m07g==
X-Gm-Message-State: AOAM5315dwUvE3OWQY+DtGfKS+m1HVhrZrLpSyzVDMzImSfs6Ug4IMcU
 IiI1RoRQsq+mjOGwOArCxtnH7QA0S7Oa38nnEOewyt+6Ru5E
X-Google-Smtp-Source: ABdhPJxqeaA8sqy0hYo/N8XZ/mP7Bmwj6PvbQPnGG8m5GoXOyi3MUdxVMrBtjvxiL4mT0sqR6GdRN//I5PYwMHdxniP/22qBpYQS
MIME-Version: 1.0
X-Received: by 2002:a05:6602:14d2:: with SMTP id
 b18mr4688430iow.123.1635017720046; 
 Sat, 23 Oct 2021 12:35:20 -0700 (PDT)
Date: Sat, 23 Oct 2021 12:35:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000067a98805cf0a3a98@google.com>
Subject: [syzbot] possible deadlock in snd_mixer_oss_ioctl1
From: syzbot <syzbot+ace149a75a9a0a399ac7@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, broonie@kernel.org, joe@perches.com, 
 lars@metafoo.de, linux-kernel@vger.kernel.org, perex@perex.cz, 
 syzkaller-bugs@googlegroups.com, tiwai@suse.com, tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 26 Oct 2021 08:14:36 +0200
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

HEAD commit:    cf6c9d12750c Add linux-next specific files for 20211022
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=15d3d4c4b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e694204255ade3a3
dashboard link: https://syzkaller.appspot.com/bug?extid=ace149a75a9a0a399ac7
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17c0530cb00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1129c952b00000

The issue was bisected to:

commit 411cef6adfb38a5bb6bd9af3941b28198e7fb680
Author: Takashi Iwai <tiwai@suse.de>
Date:   Wed Oct 20 16:48:46 2021 +0000

    ALSA: mixer: oss: Fix racy access to slots

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=167f6454b00000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=157f6454b00000
console output: https://syzkaller.appspot.com/x/log.txt?x=117f6454b00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ace149a75a9a0a399ac7@syzkaller.appspotmail.com
Fixes: 411cef6adfb3 ("ALSA: mixer: oss: Fix racy access to slots")

============================================
WARNING: possible recursive locking detected
5.15.0-rc6-next-20211022-syzkaller #0 Not tainted
--------------------------------------------
syz-executor206/6529 is trying to acquire lock:
ffff888021ff09c8 (&mixer->reg_mutex){+.+.}-{3:3}, at: snd_mixer_oss_set_volume sound/core/oss/mixer_oss.c:316 [inline]
ffff888021ff09c8 (&mixer->reg_mutex){+.+.}-{3:3}, at: snd_mixer_oss_ioctl1+0x630/0x19a0 sound/core/oss/mixer_oss.c:375

but task is already holding lock:
ffff888021ff09c8 (&mixer->reg_mutex){+.+.}-{3:3}, at: snd_mixer_oss_set_volume sound/core/oss/mixer_oss.c:300 [inline]
ffff888021ff09c8 (&mixer->reg_mutex){+.+.}-{3:3}, at: snd_mixer_oss_ioctl1+0x4b1/0x19a0 sound/core/oss/mixer_oss.c:375

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&mixer->reg_mutex);
  lock(&mixer->reg_mutex);

 *** DEADLOCK ***

 May be due to missing lock nesting notation

1 lock held by syz-executor206/6529:
 #0: ffff888021ff09c8 (&mixer->reg_mutex){+.+.}-{3:3}, at: snd_mixer_oss_set_volume sound/core/oss/mixer_oss.c:300 [inline]
 #0: ffff888021ff09c8 (&mixer->reg_mutex){+.+.}-{3:3}, at: snd_mixer_oss_ioctl1+0x4b1/0x19a0 sound/core/oss/mixer_oss.c:375

stack backtrace:
CPU: 0 PID: 6529 Comm: syz-executor206 Not tainted 5.15.0-rc6-next-20211022-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_deadlock_bug kernel/locking/lockdep.c:2956 [inline]
 check_deadlock kernel/locking/lockdep.c:2999 [inline]
 validate_chain kernel/locking/lockdep.c:3788 [inline]
 __lock_acquire.cold+0x149/0x3ab kernel/locking/lockdep.c:5027
 lock_acquire kernel/locking/lockdep.c:5637 [inline]
 lock_acquire+0x1ab/0x510 kernel/locking/lockdep.c:5602
 __mutex_lock_common kernel/locking/mutex.c:607 [inline]
 __mutex_lock+0x12f/0x12f0 kernel/locking/mutex.c:740
 snd_mixer_oss_set_volume sound/core/oss/mixer_oss.c:316 [inline]
 snd_mixer_oss_ioctl1+0x630/0x19a0 sound/core/oss/mixer_oss.c:375
 snd_mixer_oss_ioctl+0x40/0x50 sound/core/oss/mixer_oss.c:390
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]
 __se_sys_ioctl fs/ioctl.c:860 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:860
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f0c06979fe9
Code: 28 c3 e8 2a 14 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffea97dd558 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f0c06979fe9
RDX: 0000000020000080 RSI: 00000000c0044d00 RDI: 0000000000000003
RBP: 00007f0c0693dfd0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f0c0693e060
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
