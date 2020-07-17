Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8352258B2
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 09:36:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09243844;
	Mon, 20 Jul 2020 09:35:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09243844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595230600;
	bh=djCaiCC2susAJqcCo2p1yLs+3eV9tLGnQo+XE/ZmrIU=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KMYcCJODLpjPCVTZXxtSDEYnRATLtEt6uz7z8N9akzLSu1hcZa60jvYX0zTvDWz+s
	 +zX7h9Hzi9Bhb8QRO3gaYHZY+W+VPv1TuXVZ9B7pSzH25nCAfeL2oomId1aMBib+cf
	 GM6zVJqTrWntJDtabSY7oY2RCZzoKPwXpr2ot3uE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 920DFF8015C;
	Mon, 20 Jul 2020 09:34:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B91CFF80217; Fri, 17 Jul 2020 09:50:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1729F80110
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 09:50:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1729F80110
Received: by mail-io1-f69.google.com with SMTP id q207so5982625iod.21
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 00:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=K0xpYgdDbOkmDKfy09w7rceR9YlCNd4wQzw3kksCOjY=;
 b=Q7VJdvEFpZfJZfYnLLkaY4XNGJeMacgjiN9jefXcooKRti7J+YuPW8s/Tj98N67aJq
 +m2Ga2gTeC2icMqaKKLbTENzyxG3zaF3Sf2AB2E4Yx3HakHcERLPmQyiYYgSz79+6m+I
 /zloUxEX0AUfapuEXItk7/Q4AA/85+Y/LlvBxDxfO0xCO/mMz8a5Iea4kc35xvIwitzY
 ctBtMNKvz4q6ngIXdE72I6lT95za8lC8s2baQ8HdshEvNzLJZbU0MwBie02RyVE+LtQT
 ZsyO6JPQ8kc7IAvnqW5DfeMuMt4NUeJkjgJhXpBuYL1xOHgZ4JPMqdP5WB6vf0GR8fcH
 Y5nQ==
X-Gm-Message-State: AOAM530Pu4LPccZtnmTSiodLcVpRHSpH0g4FJKke5wKTyuOfyxfWCb3E
 jhE8B3L2+wEhRj1kgqUl7kSWdDN0ptMK6TkhhL3PiP94XhwX
X-Google-Smtp-Source: ABdhPJy9MHfJA3K/uRrEETeJS7pFj1JuWZ14huXJU7C83Yu5kG+1/OkMiBmXRvPRmu6Qid9JxiIc0lXqZr1Syi7KxAIV/9gT8Cod
MIME-Version: 1.0
X-Received: by 2002:a6b:ee15:: with SMTP id i21mr8402115ioh.25.1594972217317; 
 Fri, 17 Jul 2020 00:50:17 -0700 (PDT)
Date: Fri, 17 Jul 2020 00:50:17 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000070a78f05aa9e6883@google.com>
Subject: WARNING in snd_info_get_line
From: syzbot <syzbot+e42d0746c3c3699b6061@syzkaller.appspotmail.com>
To: adobriyan@gmail.com, akpm@linux-foundation.org, 
 alsa-devel@alsa-project.org, colin.king@canonical.com, 
 linux-kernel@vger.kernel.org, perex@perex.cz, sfr@canb.auug.org.au, 
 syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 20 Jul 2020 09:34:10 +0200
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

HEAD commit:    f8456690 Merge tag 'clk-fixes-for-linus' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11539507100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e944500a36bc4d55
dashboard link: https://syzkaller.appspot.com/bug?extid=e42d0746c3c3699b6061
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1531c5ab100000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17c399c7100000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e42d0746c3c3699b6061@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 1 PID: 6804 at sound/core/info.c:609 snd_info_get_line+0x3d0/0x450 sound/core/info.c:609
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 6804 Comm: syz-executor373 Not tainted 5.8.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x1f0/0x31e lib/dump_stack.c:118
 panic+0x264/0x7a0 kernel/panic.c:231
 __warn+0x227/0x250 kernel/panic.c:600
 report_bug+0x1b1/0x2e0 lib/bug.c:198
 handle_bug+0x42/0x80 arch/x86/kernel/traps.c:235
 exc_invalid_op+0x16/0x40 arch/x86/kernel/traps.c:255
 asm_exc_invalid_op+0x12/0x20 arch/x86/include/asm/idtentry.h:542
RIP: 0010:snd_info_get_line+0x3d0/0x450 sound/core/info.c:609
Code: 0f 85 84 00 00 00 41 c6 45 00 00 31 ed 89 e8 48 83 c4 40 5b 41 5c 41 5d 41 5e 41 5f 5d c3 e8 57 8a 3b fb eb 05 e8 50 8a 3b fb <0f> 0b bd 01 00 00 00 eb da 89 d9 80 e1 07 80 c1 03 38 c1 0f 8c a3
RSP: 0018:ffffc90001077a38 EFLAGS: 00010293
RAX: ffffffff86390470 RBX: 0000000000000080 RCX: ffff888096156500
RDX: 0000000000000000 RSI: ffffc90001077b10 RDI: ffff8880a1e30600
RBP: ffffc90001077bc8 R08: dffffc0000000000 R09: ffffed10429a6594
R10: ffffed10429a6594 R11: 0000000000000000 R12: ffff8880a2527908
R13: ffffc90001077b10 R14: 1ffff110143c60c0 R15: ffff8880a1e30600
 snd_mixer_oss_proc_write+0x6d/0x670 sound/core/oss/mixer_oss.c:1179
 snd_info_text_entry_release+0xdf/0x1c0 sound/core/info.c:409
 close_pdeo+0x16c/0x310 fs/proc/inode.c:244
 proc_reg_release+0x17c/0x1c0 fs/proc/inode.c:561
 __fput+0x2f0/0x750 fs/file_table.c:281
 task_work_run+0x137/0x1c0 kernel/task_work.c:135
 exit_task_work include/linux/task_work.h:25 [inline]
 do_exit+0x601/0x1f80 kernel/exit.c:805
 do_group_exit+0x161/0x2d0 kernel/exit.c:903
 __do_sys_exit_group+0x13/0x20 kernel/exit.c:914
 __se_sys_exit_group+0x10/0x10 kernel/exit.c:912
 __x64_sys_exit_group+0x37/0x40 kernel/exit.c:912
 do_syscall_64+0x73/0xe0 arch/x86/entry/common.c:384
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x43eeb8
Code: Bad RIP value.
RSP: 002b:00007ffce5a0e308 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 000000000043eeb8
RDX: 0000000000000000 RSI: 000000000000003c RDI: 0000000000000000
RBP: 00000000004be6c8 R08: 00000000000000e7 R09: ffffffffffffffd0
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00000000006d0180 R14: 0000000000000000 R15: 0000000000000000
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
