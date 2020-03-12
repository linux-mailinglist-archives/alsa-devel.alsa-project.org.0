Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EE1183634
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 17:32:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 700C7173C;
	Thu, 12 Mar 2020 17:31:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 700C7173C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584030747;
	bh=vElPR3QX3tHiie7PggHyPf8Scfc9X4yZFsAN+Ittzuo=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XnF31zGJ190Z7fM+WK0pr2hTDEabx7WT+Qde5+m387kanHPGeZFVI7UPlK7+cakQZ
	 xx4i3b7fYd0xXaaYMNrUrXBJVJ7z1LuvWWXVkp1auOpLd/4UnTzsfqmkPkLmITy1QA
	 wvE6RpQW0R3Fz/7meLoMm5vLsPjALc/QT3YEFG/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 546E6F8023F;
	Thu, 12 Mar 2020 17:30:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D9FAF8020C; Thu, 12 Mar 2020 16:47:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B813F8013E
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 16:47:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B813F8013E
Received: by mail-io1-f72.google.com with SMTP id p4so4189113ioo.4
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 08:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=O73odJhRE0RHld216mUpontgZMPThRLNn/9xOQ9zEz4=;
 b=rUbDnZF55+up8Awez3S9l4nxS2zX6BVLCE2Ndb7Edpz+lolX89y/yqhjZghKsVemsP
 4UjPcC9tHb7MStVCO7SFSQh9zdEnw8hHKF/bNtwUlAIo59HAhDJeTxButGki/OE2fZI+
 R//7kK4+jQriMjqvjCqdTn7R1bcz773hww0tFocjcBYdQkws/JuZZUbo7S2MsdhywdSW
 AflSNWYwITSMlkpo+uY4VEazwYT/mNhyOs2b1ccTLKlgROvP2nVETywOzcsqUrdGQhEI
 kc50eLzbuzcrNydl4Gle4q3W4PBiSU54+Dk8FU8ovxgHzvjQWaq3SEql/1PNFEOYRTz7
 cB1g==
X-Gm-Message-State: ANhLgQ090XMm/1SKV3EII9CVQ5ge0dRx2bj6rfeSPSQE16BH0vZ6lVnq
 9vMZxZYPXgh1LNwcXGEfDsp6R43aMN7SDh315Q261wc7EnKO
X-Google-Smtp-Source: ADFU+vvaavmPhh9rz8kG1SSIP1LAz3qXenQRbRDuSH3nHZItb1tKcdfIX9vmI8nzNvqHJQLjeHH+GFo9B7OE3ObSiz50VG9KRMu2
MIME-Version: 1.0
X-Received: by 2002:a92:ddcb:: with SMTP id d11mr8654833ilr.211.1584028034040; 
 Thu, 12 Mar 2020 08:47:14 -0700 (PDT)
Date: Thu, 12 Mar 2020 08:47:14 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000488d2805a0aa449c@google.com>
Subject: linux-next test error: WARNING in snd_pcm_plug_alloc
From: syzbot <syzbot+2a59ee7a9831b264f45e@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 12 Mar 2020 17:29:57 +0100
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

syzbot found the following crash on:

HEAD commit:    407b0a62 Add linux-next specific files for 20200312
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=14dd6545e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d644875269fc730b
dashboard link: https://syzkaller.appspot.com/bug?extid=2a59ee7a9831b264f45e
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+2a59ee7a9831b264f45e@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 8559 at sound/core/oss/pcm_plugin.c:126 snd_pcm_plug_alloc+0x29a/0x330 sound/core/oss/pcm_plugin.c:126
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 8559 Comm: syz-fuzzer Not tainted 5.6.0-rc5-next-20200312-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x188/0x20d lib/dump_stack.c:118
 panic+0x2e3/0x75c kernel/panic.c:221
 __warn.cold+0x2f/0x35 kernel/panic.c:582
 report_bug+0x27b/0x2f0 lib/bug.c:195
 fixup_bug arch/x86/kernel/traps.c:175 [inline]
 fixup_bug arch/x86/kernel/traps.c:170 [inline]
 do_error_trap+0x12b/0x220 arch/x86/kernel/traps.c:267
 do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:286
 invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1027
RIP: 0010:snd_pcm_plug_alloc+0x29a/0x330 sound/core/oss/pcm_plugin.c:126
Code: ff ff 45 31 e4 e8 d6 4d 7f fb 44 89 e0 5b 5d 41 5c 41 5d 41 5e c3 e8 c5 4d 7f fb 0f 0b 41 bc fa ff ff ff eb e0 e8 b6 4d 7f fb <0f> 0b 41 bc fa ff ff ff eb d1 e8 a7 4d 7f fb 0f 0b 41 bc fa ff ff
RSP: 0018:ffffc90002317b88 EFLAGS: 00010293
RAX: ffff888093a7c200 RBX: ffff8880a4086000 RCX: ffffffff85f37886
RDX: 0000000000000000 RSI: ffffffff85f37a0a RDI: 0000000000000007
RBP: 0000000000000000 R08: ffff888093a7c200 R09: ffffed10132a791f
R10: ffff88809953c8f3 R11: ffffed10132a791e R12: ffff8880a4086058
R13: dffffc0000000000 R14: 0000000000000000 R15: ffff88809953c800
 snd_pcm_oss_change_params_locked+0x1c05/0x34b0 sound/core/oss/pcm_oss.c:1021
 snd_pcm_oss_change_params+0x76/0xd0 sound/core/oss/pcm_oss.c:1084
 snd_pcm_oss_make_ready+0xb7/0x170 sound/core/oss/pcm_oss.c:1143
 snd_pcm_oss_sync.isra.0+0x1be/0x7d0 sound/core/oss/pcm_oss.c:1708
 snd_pcm_oss_release+0x210/0x280 sound/core/oss/pcm_oss.c:2546
 __fput+0x2da/0x850 fs/file_table.c:280
 task_work_run+0xf4/0x1b0 kernel/task_work.c:123
 tracehook_notify_resume include/linux/tracehook.h:188 [inline]
 exit_to_usermode_loop+0x2fa/0x360 arch/x86/entry/common.c:165
 prepare_exit_to_usermode arch/x86/entry/common.c:196 [inline]
 syscall_return_slowpath arch/x86/entry/common.c:279 [inline]
 do_syscall_64+0x6b1/0x7d0 arch/x86/entry/common.c:305
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x4afb40
Code: 8b 7c 24 10 48 8b 74 24 18 48 8b 54 24 20 49 c7 c2 00 00 00 00 49 c7 c0 00 00 00 00 49 c7 c1 00 00 00 00 48 8b 44 24 08 0f 05 <48> 3d 01 f0 ff ff 76 20 48 c7 44 24 28 ff ff ff ff 48 c7 44 24 30
RSP: 002b:000000c000213588 EFLAGS: 00000212 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 000000c00002c000 RCX: 00000000004afb40
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003
RBP: 000000c0002135c8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000212 R12: 0000000000000006
R13: 0000000000000005 R14: 0000000000000200 R15: 0000000000000000
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
