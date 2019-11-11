Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 936EDF8C9F
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 11:17:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CB59167C;
	Tue, 12 Nov 2019 11:17:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CB59167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573553878;
	bh=DDVuVq3ikgucrcdm98mxpj06Ay81R5xoH+ptSAEgn8k=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S21OEEeEpaO5hEzMlVOX7iNf6Bay5bu2NwTiNa580bLfdKvHb1qHnwW0q5ONRO0Du
	 vQBzQiG1X5c9tmnjvoWZ/QBz+aYntCQDfHSRkKOgu3L6ZjEdHC0AKlrXss9tNE7Ta0
	 v5JoKLl2qIZE5ypO8OY3zppkcu4gA/SNuUDKkULY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 503D1F80633;
	Tue, 12 Nov 2019 11:14:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9894FF802E0; Mon, 11 Nov 2019 17:39:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ****
X-Spam-Status: No, score=4.1 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7141F802E0
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 17:39:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7141F802E0
Received: by mail-il1-f198.google.com with SMTP id m12so14132402ilq.1
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 08:39:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=/zegXvvBfn/8NivNj035Ns8LaxibNFZ37GX89KDpfAE=;
 b=UgfKHCnVa/E1gyoO02skYlXKJj0s8NNQc1oux2CveJZuNA7MXDbah4la/VTC2Yd+29
 NBAqDPJ/mwDJsinEtiuowwpdTYeQDreYxKBu50daf7dF/OSMR3KtXLjngE5c6DBeDFxR
 Ktieddd5b3kGHZfLEp6fHPXsNYrrP09M+8QZC4dPkVkr0jTX4br4M21CIyGfaKn30n/I
 LbCvV6SrYXIF9TS9du6VUJOxiHg/PcMjSR9zPu6F2/aXM+0PBOBi1RXNr/+7jGhicnUa
 X9cP80k1gzP/IY2zpN2IzGsGVwJG+RzaNV+okr4/EIGu/Bv/CpFahbyf8fVtd1lbkS9E
 fADg==
X-Gm-Message-State: APjAAAVHW8Yps3czFmC5wJ4MkUstxl81XaKlLYxX7QoYLIYPhMmFT7mg
 CVKIby06udiK8B0SVmuRnwzL4UoyNsGiWPiXvdVQWKeTpb3Z
X-Google-Smtp-Source: APXvYqwS23U7Ms7ca8ZBxpyqTo6oDZ7pvYAwbX+k/Eyth9OjQOdRvrGIRum6xPhd68VpRe/eantNLetTzJSDEisBjiZqx9BOoDu9
MIME-Version: 1.0
X-Received: by 2002:a05:6602:228e:: with SMTP id
 d14mr13854303iod.122.1573490349867; 
 Mon, 11 Nov 2019 08:39:09 -0800 (PST)
Date: Mon, 11 Nov 2019 08:39:09 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005c8bdf059714c5a5@google.com>
From: syzbot <syzbot+7a0ab45b9c1dc81c9e6b@syzkaller.appspotmail.com>
To: alexandre.belloni@bootlin.com, allison@lohutok.net, 
 alsa-devel@alsa-project.org, enric.balletbo@collabora.com, 
 gregkh@linuxfoundation.org, kirr@nexedi.com, linux-kernel@vger.kernel.org, 
 perex@perex.cz, syzkaller-bugs@googlegroups.com, tglx@linutronix.de, 
 tiwai@suse.com
X-Mailman-Approved-At: Tue, 12 Nov 2019 11:14:25 +0100
Subject: [alsa-devel] general protection fault in snd_timer_open
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello,

syzbot found the following crash on:

HEAD commit:    6980b7f6 Add linux-next specific files for 20191111
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=149fae72e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2af7db1972ec750e
dashboard link: https://syzkaller.appspot.com/bug?extid=7a0ab45b9c1dc81c9e6b
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+7a0ab45b9c1dc81c9e6b@syzkaller.appspotmail.com

kasan: CONFIG_KASAN_INLINE enabled
kasan: GPF could be caused by NULL-ptr deref or user memory access
general protection fault: 0000 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 26749 Comm: syz-executor.4 Not tainted 5.4.0-rc6-next-20191111  
#0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
RIP: 0010:snd_timer_check_master sound/core/timer.c:228 [inline]
RIP: 0010:snd_timer_open+0x943/0x1150 sound/core/timer.c:326
Code: 48 89 85 58 ff ff ff 4c 89 f0 48 c1 e8 03 4c 01 e8 48 89 85 50 ff ff  
ff eb 36 e8 38 1e ee fb 48 8d 7b 78 48 89 f8 48 c1 e8 03 <42> 80 3c 28 00  
0f 85 f4 05 00 00 48 8b 43 78 49 89 dc 48 83 e8 78
RSP: 0018:ffff888057d978f8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffffffffffffff88 RCX: ffffc9000e7ad000
RDX: 0000000000007655 RSI: ffffffff85855cd8 RDI: 0000000000000000
RBP: ffff888057d979c0 R08: ffff8880a180c240 R09: ffff8880a1b0f008
R10: ffffed1014361e08 R11: ffff8880a1b0f047 R12: ffff8880a8f40000
R13: dffffc0000000000 R14: ffff888097688600 R15: ffffffff00000002
FS:  00007f1c13a0a700(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000075c000 CR3: 000000009f897000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  snd_seq_timer_open+0x27f/0x590 sound/core/seq/seq_timer.c:281
  queue_use+0xf1/0x270 sound/core/seq/seq_queue.c:489
  snd_seq_queue_alloc+0x2c5/0x4d0 sound/core/seq/seq_queue.c:176
  snd_seq_ioctl_create_queue+0xb0/0x330 sound/core/seq/seq_clientmgr.c:1548
  snd_seq_ioctl+0x21e/0x3e0 sound/core/seq/seq_clientmgr.c:2157
  vfs_ioctl fs/ioctl.c:47 [inline]
  file_ioctl fs/ioctl.c:545 [inline]
  do_vfs_ioctl+0x977/0x14e0 fs/ioctl.c:732
  ksys_ioctl+0xab/0xd0 fs/ioctl.c:749
  __do_sys_ioctl fs/ioctl.c:756 [inline]
  __se_sys_ioctl fs/ioctl.c:754 [inline]
  __x64_sys_ioctl+0x73/0xb0 fs/ioctl.c:754
  do_syscall_64+0xfa/0x760 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x45a219
Code: ad b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 7b b6 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f1c13a09c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 000000000045a219
RDX: 00000000200001c0 RSI: 00000000c08c5332 RDI: 0000000000000004
RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f1c13a0a6d4
R13: 00000000004ceed0 R14: 00000000004d93d0 R15: 00000000ffffffff
Modules linked in:
---[ end trace fd34b5665372895c ]---
RIP: 0010:snd_timer_check_master sound/core/timer.c:228 [inline]
RIP: 0010:snd_timer_open+0x943/0x1150 sound/core/timer.c:326
Code: 48 89 85 58 ff ff ff 4c 89 f0 48 c1 e8 03 4c 01 e8 48 89 85 50 ff ff  
ff eb 36 e8 38 1e ee fb 48 8d 7b 78 48 89 f8 48 c1 e8 03 <42> 80 3c 28 00  
0f 85 f4 05 00 00 48 8b 43 78 49 89 dc 48 83 e8 78
RSP: 0018:ffff888057d978f8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffffffffffffff88 RCX: ffffc9000e7ad000
RDX: 0000000000007655 RSI: ffffffff85855cd8 RDI: 0000000000000000
RBP: ffff888057d979c0 R08: ffff8880a180c240 R09: ffff8880a1b0f008
R10: ffffed1014361e08 R11: ffff8880a1b0f047 R12: ffff8880a8f40000
R13: dffffc0000000000 R14: ffff888097688600 R15: ffffffff00000002
FS:  00007f1c13a0a700(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f750abec110 CR3: 000000009f897000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
