Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 410B84DBFF1
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 08:04:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF4BD18FD;
	Thu, 17 Mar 2022 08:03:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF4BD18FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647500671;
	bh=WmHtpBQ44C8X61hRnAdk7lA5/RViQC1JUxHvSA2s2wE=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rAAHNpuMSh5H3YUDp1mR/AalO7SJ9c8csFuSI35aUiIUUVV8JWtbNnMdGWMObNNAG
	 D3bhRDtuQR8asbO7bTsUVC3UMivlkRm0iQrfOHGbEJRnRPVbiwGk2051P+A0smf9jE
	 hdsFhUQbWFj7jatTWNAPc1919+prRra4166UBuBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 243C2F805F3;
	Thu, 17 Mar 2022 07:55:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD69EF80084; Wed, 16 Mar 2022 19:51:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.0 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,SORTED_RECIPS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07651F80084
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 19:51:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07651F80084
Received: by mail-il1-f198.google.com with SMTP id
 k5-20020a926f05000000b002be190db91cso1762485ilc.11
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 11:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=9BInTHTUyv8pUWV/QT2xDw1J7W1pxyFN1eHiSsUR3wc=;
 b=v5edmmMOOt3KyHM/KjjvNg3cUAdToSBYGMjeiljbyb1t9nTqvjousapi+sWDSSALaK
 7GKeCeqOom1OpBt09e+JathpOE8n0nIjf0h0AauL6egBT2LvNNpQ89uS1LZPiCTMYxHv
 bvd9LI7JXNxDVefNowO3Hax0lC21lnnpaYSf6Et1+rcQ7obnLrpz8aY/QDEYu/+LDEKp
 CetTKQqNZQCVQRgJ7BtlbAET9C/6i48EEd7FFKeE3mcmPHY94EipUJ/x0H1TD9P6DN9d
 js90e483JRwMquzhcLnU+Yb3I1VBXjAwrpRwLtB50QrbBGXUr99e4C89+Cnvq1c+6DS6
 jY7A==
X-Gm-Message-State: AOAM531ZSPqWkJGOfLQs7X4NdWBPqzk9iBcwa4774+u4dLFVfqIAwr6s
 ZGNmsHCewOwf0T8cY/MvZZa239soxfW7urT1Us+R4aUeKX13
X-Google-Smtp-Source: ABdhPJyv4vim6IFuInxOD5F0o+3aHFZSEZV+cefh9fq0DAjbQkPDdG5PfV0FoRsFAPQjY52EGpPyAENTGBUKioFGrADJ4oxvaDsj
MIME-Version: 1.0
X-Received: by 2002:a5e:8d15:0:b0:645:c856:e84a with SMTP id
 m21-20020a5e8d15000000b00645c856e84amr665007ioj.84.1647456685501; Wed, 16 Mar
 2022 11:51:25 -0700 (PDT)
Date: Wed, 16 Mar 2022 11:51:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000085b1b305da5a66f3@google.com>
Subject: [syzbot] WARNING: kmalloc bug in snd_pcm_plugin_alloc (2)
From: syzbot <syzbot+72732c532ac1454eeee9@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, perex@perex.cz, 
 syzkaller-bugs@googlegroups.com, tiwai@suse.com, 
 torvalds@linux-foundation.org, w@1wt.eu
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 17 Mar 2022 07:55:06 +0100
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

HEAD commit:    68453767131a ARM: Spectre-BHB: provide empty stub for non-..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11ddd329700000
kernel config:  https://syzkaller.appspot.com/x/.config?x=442f8ac61e60a75e
dashboard link: https://syzkaller.appspot.com/bug?extid=72732c532ac1454eeee9
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13636d79700000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=128fcd03700000

The issue was bisected to:

commit 7661809d493b426e979f39ab512e3adf41fbcc69
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed Jul 14 16:45:49 2021 +0000

    mm: don't allow oversized kvmalloc() calls

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=134eb7d1700000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=10ceb7d1700000
console output: https://syzkaller.appspot.com/x/log.txt?x=174eb7d1700000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+72732c532ac1454eeee9@syzkaller.appspotmail.com
Fixes: 7661809d493b ("mm: don't allow oversized kvmalloc() calls")

------------[ cut here ]------------
WARNING: CPU: 1 PID: 3761 at mm/util.c:591 kvmalloc_node+0x121/0x130 mm/util.c:591
Modules linked in:
CPU: 0 PID: 3761 Comm: syz-executor165 Not tainted 5.17.0-rc7-syzkaller-00227-g68453767131a #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:kvmalloc_node+0x121/0x130 mm/util.c:591
Code: eb 8e 45 31 e4 e9 49 ff ff ff e8 fa 91 d0 ff 41 81 e5 00 20 00 00 31 ff 44 89 ee e8 69 95 d0 ff 45 85 ed 75 dd e8 df 91 d0 ff <0f> 0b e9 22 ff ff ff 0f 1f 84 00 00 00 00 00 55 48 89 fd 53 e8 c6
RSP: 0018:ffffc9000282fb38 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff88801c2d4d00 RCX: 0000000000000000
RDX: ffff88806c235700 RSI: ffffffff81a82e51 RDI: 0000000000000003
RBP: 00000000c0c0c100 R08: 0000000000000000 R09: 00000000ffffffff
R10: ffffffff81a82e47 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 00000000ffffffff R15: ffff88801c2d4d14
FS:  00007f4196580700(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffee56e9938 CR3: 000000006d5c7000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 kvmalloc include/linux/slab.h:731 [inline]
 kvzalloc include/linux/slab.h:739 [inline]
 snd_pcm_plugin_alloc+0x570/0x770 sound/core/oss/pcm_plugin.c:71
 snd_pcm_plug_alloc+0x20d/0x310 sound/core/oss/pcm_plugin.c:118
 snd_pcm_oss_change_params_locked+0x19db/0x3bf0 sound/core/oss/pcm_oss.c:1041
 snd_pcm_oss_change_params sound/core/oss/pcm_oss.c:1104 [inline]
 snd_pcm_oss_get_active_substream+0x164/0x1c0 sound/core/oss/pcm_oss.c:1121
 snd_pcm_oss_get_rate sound/core/oss/pcm_oss.c:1778 [inline]
 snd_pcm_oss_set_rate sound/core/oss/pcm_oss.c:1770 [inline]
 snd_pcm_oss_ioctl+0x144f/0x3430 sound/core/oss/pcm_oss.c:2632
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:874 [inline]
 __se_sys_ioctl fs/ioctl.c:860 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:860
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f41965cf1f9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 41 15 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f41965802f8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f41966584a8 RCX: 00007f41965cf1f9
RDX: 0000000020000140 RSI: 00000000c0045002 RDI: 0000000000000003
RBP: 00007f41966584a0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f41966584ac
R13: 00007f4196625088 R14: 7364612f7665642f R15: 0000000000022000
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
