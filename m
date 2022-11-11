Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 672206269CE
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Nov 2022 15:13:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86F8C167E;
	Sat, 12 Nov 2022 15:12:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86F8C167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668262417;
	bh=sZeej48P5lCknE+4bj3dux8H9xacSVO+SVlx8mXHLKM=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=htlctznDhGeaefhiQDFRnsGG953GBi+yCtijPU3OgD9jHKcKHuXXAMOk86R3hOXaT
	 K4gEzOGNgPOdYNKWB2LDZDxlfp9r8Fk19UUPaRDBnjjvFhS9gzl2/4T081WsX9PD5G
	 LLiAozC/ut0AABR9pdoj0EdOxukwsF5/d2iZZzSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBB81F80162;
	Sat, 12 Nov 2022 15:11:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06707F8028D; Fri, 11 Nov 2022 19:27:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79402F800F8
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 19:26:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79402F800F8
Received: by mail-il1-f199.google.com with SMTP id
 j7-20020a056e02154700b003007885e7beso4493038ilu.20
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 10:26:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kGTnkFXQuCUMTD7CK+5QZtG8OlzqpMe0ZhXCS8Y5mCA=;
 b=Ew1O4tr7n9AQwzb6d2JeR1fRd9xG7iA5KgzmQDtpLHGeKEsX7BPPPtxs8+akvX5kkT
 EKT9f7nN8MYJosG1Y7GzxmErswdRW4O2gCgup9SfUlOQuiv41a3s7eKjFQJNxBKqn8cG
 TWvhb02de5Z1MUp6l0OqhwrJ/VXYXjF8DpFj174+YFVacCeFlPWDDqYCp0vGXyaPojNU
 jQ+HMRMHec4ah47AGN5we5ym8OUqLinMPs85hOJIRnt8O9W9WP4lMUQySlflf2u8hmBv
 WLJuFLBY5R7wm8hNvtR9Il91RRlPm0UEbhvIUHDQoZuJxoYVXQOvZ45n2QBJjUQPTjn6
 Z22w==
X-Gm-Message-State: ANoB5pnixhc/RotQP/b4I5JLmcxlr1hmTk70zb5wsGKao/td5K8kmJD1
 cPC3LoKhlkPDZE9Vkhag3bslhJoZPEcG9L8CTzkrFW38Waw/
X-Google-Smtp-Source: AA0mqf7tMxRu86J9NN7fa3qvRYALu5Tnq+mvG7iwu/phVekaVvJKCCWx3jP/XYI+6fU/N9u1GUisfejde0w1Mu5Oj0/PWaSVmgT7
MIME-Version: 1.0
X-Received: by 2002:a02:54ca:0:b0:375:7f39:51d9 with SMTP id
 t193-20020a0254ca000000b003757f3951d9mr1362528jaa.174.1668191209340; Fri, 11
 Nov 2022 10:26:49 -0800 (PST)
Date: Fri, 11 Nov 2022 10:26:49 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000734a7305ed3608ba@google.com>
Subject: [syzbot] WARNING in snd_usbmidi_output_open
From: syzbot <syzbot+9abda841d636d86c41da@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, clemens@ladisch.de, 
 linux-kernel@vger.kernel.org, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 12 Nov 2022 15:11:54 +0100
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

HEAD commit:    f8f60f322f06 Add linux-next specific files for 20221111
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=12fe828e880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85ba52c07cd97289
dashboard link: https://syzkaller.appspot.com/bug?extid=9abda841d636d86c41da
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=160e91fa880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=161d3e69880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6008df424195/disk-f8f60f32.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/394340525f66/vmlinux-f8f60f32.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b13604a3343a/bzImage-f8f60f32.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9abda841d636d86c41da@syzkaller.appspotmail.com

------------[ cut here ]------------
BUG?
WARNING: CPU: 0 PID: 5267 at sound/usb/midi.c:1137 snd_usbmidi_output_open+0xd8/0x410 sound/usb/midi.c:1137
Modules linked in:
CPU: 0 PID: 5267 Comm: syz-executor895 Not tainted 6.1.0-rc4-next-20221111-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
RIP: 0010:snd_usbmidi_output_open+0xd8/0x410 sound/usb/midi.c:1137
Code: 3c 02 00 0f 85 03 03 00 00 4d 8b be 10 02 00 00 4d 85 ff 0f 85 c8 00 00 00 e8 d4 92 25 fa 48 c7 c7 a0 6e f2 8a e8 02 da 04 02 <0f> 0b 41 bc fa ff ff ff e8 bb 92 25 fa 44 89 e0 48 83 c4 08 5b 5d
RSP: 0018:ffffc90003b7f3a0 EFLAGS: 00010282
RAX: 0000000000000000 RBX: ffff888146c8d000 RCX: 0000000000000000
RDX: ffff8880245d3a80 RSI: ffffffff81624e68 RDI: fffff5200076fe66
RBP: ffff88801ed9c900 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000080000000 R11: 0000000000000000 R12: ffff88814017cc00
R13: 0000000000000000 R14: ffff88802b1d5000 R15: 0000000000000000
FS:  00005555574d4300(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f6ed57c3670 CR3: 0000000076149000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 open_substream+0x41d/0x8c0 sound/core/rawmidi.c:344
 rawmidi_open_priv+0x591/0x6f0 sound/core/rawmidi.c:394
 snd_rawmidi_kernel_open+0x1b5/0x270 sound/core/rawmidi.c:429
 midisynth_use+0xee/0x270 sound/core/seq/seq_midi.c:215
 subscribe_port sound/core/seq/seq_ports.c:412 [inline]
 check_and_subscribe_port+0x89a/0xb80 sound/core/seq/seq_ports.c:495
 snd_seq_port_connect+0x382/0x540 sound/core/seq/seq_ports.c:581
 snd_seq_ioctl_subscribe_port+0x1fc/0x400 sound/core/seq/seq_clientmgr.c:1490
 snd_seq_kernel_client_ctl+0x102/0x1c0 sound/core/seq/seq_clientmgr.c:2367
 snd_seq_oss_midi_open+0x582/0x6e0 sound/core/seq/oss/seq_oss_midi.c:361
 snd_seq_oss_synth_setup_midi+0x12d/0x530 sound/core/seq/oss/seq_oss_synth.c:269
 snd_seq_oss_open+0x8b8/0xa70 sound/core/seq/oss/seq_oss_init.c:260
 odev_open+0x6c/0x90 sound/core/seq/oss/seq_oss.c:128
 soundcore_open+0x44e/0x620 sound/sound_core.c:593
 chrdev_open+0x266/0x770 fs/char_dev.c:414
 do_dentry_open+0x6cc/0x13f0 fs/open.c:882
 do_open fs/namei.c:3557 [inline]
 path_openat+0x1bbc/0x2a50 fs/namei.c:3713
 do_filp_open+0x1b6/0x400 fs/namei.c:3740
 do_sys_openat2+0x16d/0x4c0 fs/open.c:1310
 do_sys_open fs/open.c:1326 [inline]
 __do_sys_openat fs/open.c:1342 [inline]
 __se_sys_openat fs/open.c:1337 [inline]
 __x64_sys_openat+0x13f/0x1f0 fs/open.c:1337
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f496367ae39
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 b1 14 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc99e01aa8 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00000000000f4240 RCX: 00007f496367ae39
RDX: 0000000000020983 RSI: 0000000020000080 RDI: ffffffffffffff9c
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000001
R10: 0000000000000000 R11: 0000000000000246 R12: 000000000000d066
R13: 00007ffc99e01abc R14: 00007ffc99e01ad0 R15: 00007ffc99e01ac0
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
