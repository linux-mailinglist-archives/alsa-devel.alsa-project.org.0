Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C79754EBA
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jul 2023 15:00:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88C08DED;
	Sun, 16 Jul 2023 15:00:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88C08DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689512450;
	bh=p+P/WbbuoEGaUjF+Tn7R1hULJ23c/3mcMJnAj/KCtTw=;
	h=Date:Subject:From:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jq1gFmJSlEsHpRzNYBuzpewtiea0fmkB5pVDz6EqbHAqMOXWc2OKxqDDuhGapxbqG
	 qxaEfrnOg+beLZ9LhAJCLt+FhkLIPcoZWcEFiEuNtPGHBYMDo3DIFJzo0XSh9ZaQpM
	 Y3sPhM+ih3tQMSe07VFu8xFim0gtUjkeMXPdEDjY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D38F5F80548; Sun, 16 Jul 2023 14:58:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9465DF8047D;
	Sun, 16 Jul 2023 14:58:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59055F8047D; Sun, 16 Jul 2023 10:21:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com
 [209.85.167.205])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4734BF8027B
	for <alsa-devel@alsa-project.org>; Sun, 16 Jul 2023 10:21:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4734BF8027B
Received: by mail-oi1-f205.google.com with SMTP id
 5614622812f47-39fb9cce400so5404501b6e.1
        for <alsa-devel@alsa-project.org>;
 Sun, 16 Jul 2023 01:21:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689495709; x=1692087709;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z/9vVWmFMMeqNG0xDcaixSejDntCvADQME2O0gHEl4Q=;
        b=jvWeT9AYMXe/alDW6yXd+azG/7SRgt4aFKVbVqwhWkajGa7NArcEd19nI7afi+D3cW
         dO0ZCi5lTwCP1Y1sJ0fsHnnXcVJyv5tzCihIvKeBV1VrSC7+SYP6J7YmxA7nJjBOXYlE
         YPDVqSomP6BZv0PKXK0fj2YsDi0cKGe1Q5pBTboXI19Mi8ciG+C2kwwRAEa3o24h4Dcp
         tBGc1bhYaQTnhZ88BjdE7n1NChOYy9Cy/NeTiCwxsqOddl35WLzu3lIaC3egRVT9w9OA
         qOtZv7c/9HrO89vWztr0v1g+2OypBiJCfXEn74k9Qyk0hlE51+9fEy07f+kqUds4sGNd
         ng6Q==
X-Gm-Message-State: ABy/qLYUyfzY00wABVoFwOP8r2fvVgovbTRVhMbEN0bQpemcz2k5rmd4
	iPj6sTw8jWu/BAxJ5maEaDSsrSLzl+YEbF84UyWs+/UX93Br1cTnfg==
X-Google-Smtp-Source: 
 APBJJlEddIYY1oNa9o+XsPUUVXCVS1PtHLHzqRRrNf18e45dUc9ZoAKM+2PZ+09CLYXBZYmkLMUll3a4gL/uvKPgU5GrvrrUSbk5
MIME-Version: 1.0
X-Received: by 2002:a05:6808:14c4:b0:39e:de07:a6b7 with SMTP id
 f4-20020a05680814c400b0039ede07a6b7mr12516901oiw.1.1689495709214; Sun, 16 Jul
 2023 01:21:49 -0700 (PDT)
Date: Sun, 16 Jul 2023 01:21:49 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000098ed3a0600965f89@google.com>
Subject: [syzbot] [alsa?] memory leak in snd_seq_create_port
From: syzbot <syzbot+cf8e7fa4eeec59b3d485@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, perex@perex.cz,
	syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-MailFrom: 
 3naizZAkbAOgcijUKVVObKZZSN.QYYQVOecObMYXdOXd.MYW@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IDES4JUJHAJXRQCMPF5BQDEAI5RU3KRL
X-Message-ID-Hash: IDES4JUJHAJXRQCMPF5BQDEAI5RU3KRL
X-Mailman-Approved-At: Sun, 16 Jul 2023 12:58:31 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IDES4JUJHAJXRQCMPF5BQDEAI5RU3KRL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello,

syzbot found the following issue on:

HEAD commit:    3f01e9fed845 Merge tag 'linux-watchdog-6.5-rc2' of git://w..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14b07344a80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=75da4f0a455bdbd3
dashboard link: https://syzkaller.appspot.com/bug?extid=cf8e7fa4eeec59b3d485
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15877dc2a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12905004a80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/441fb7ea58b8/disk-3f01e9fe.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8fa7790ba0c3/vmlinux-3f01e9fe.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5e7a6471dadf/bzImage-3f01e9fe.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cf8e7fa4eeec59b3d485@syzkaller.appspotmail.com

Warning: Permanently added '10.128.1.1' (ED25519) to the list of known hosts.
executing program
executing program
BUG: memory leak
unreferenced object 0xffff888100877000 (size 512):
  comm "syz-executor257", pid 5012, jiffies 4294941742 (age 12.790s)
  hex dump (first 32 bytes):
    80 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff8154bf94>] kmalloc_trace+0x24/0x90 mm/slab_common.c:1076
    [<ffffffff83d29e28>] kmalloc include/linux/slab.h:582 [inline]
    [<ffffffff83d29e28>] kzalloc include/linux/slab.h:703 [inline]
    [<ffffffff83d29e28>] snd_seq_create_port+0x78/0x300 sound/core/seq/seq_ports.c:135
    [<ffffffff83d1f681>] snd_seq_ioctl_create_port+0xe1/0x2a0 sound/core/seq/seq_clientmgr.c:1324
    [<ffffffff83d20e5e>] snd_seq_ioctl+0x13e/0x290 sound/core/seq/seq_clientmgr.c:2327
    [<ffffffff81685173>] vfs_ioctl fs/ioctl.c:51 [inline]
    [<ffffffff81685173>] __do_sys_ioctl fs/ioctl.c:870 [inline]
    [<ffffffff81685173>] __se_sys_ioctl fs/ioctl.c:856 [inline]
    [<ffffffff81685173>] __x64_sys_ioctl+0x103/0x140 fs/ioctl.c:856
    [<ffffffff84a77ff9>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff84a77ff9>] do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

BUG: memory leak
unreferenced object 0xffff888106742c00 (size 512):
  comm "syz-executor257", pid 5013, jiffies 4294942276 (age 7.450s)
  hex dump (first 32 bytes):
    80 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff8154bf94>] kmalloc_trace+0x24/0x90 mm/slab_common.c:1076
    [<ffffffff83d29e28>] kmalloc include/linux/slab.h:582 [inline]
    [<ffffffff83d29e28>] kzalloc include/linux/slab.h:703 [inline]
    [<ffffffff83d29e28>] snd_seq_create_port+0x78/0x300 sound/core/seq/seq_ports.c:135
    [<ffffffff83d1f681>] snd_seq_ioctl_create_port+0xe1/0x2a0 sound/core/seq/seq_clientmgr.c:1324
    [<ffffffff83d20e5e>] snd_seq_ioctl+0x13e/0x290 sound/core/seq/seq_clientmgr.c:2327
    [<ffffffff81685173>] vfs_ioctl fs/ioctl.c:51 [inline]
    [<ffffffff81685173>] __do_sys_ioctl fs/ioctl.c:870 [inline]
    [<ffffffff81685173>] __se_sys_ioctl fs/ioctl.c:856 [inline]
    [<ffffffff81685173>] __x64_sys_ioctl+0x103/0x140 fs/ioctl.c:856
    [<ffffffff84a77ff9>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff84a77ff9>] do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to change bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
