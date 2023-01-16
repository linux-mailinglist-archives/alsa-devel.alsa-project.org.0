Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D128F66E491
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 18:13:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 048C46B10;
	Tue, 17 Jan 2023 18:12:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 048C46B10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673975613;
	bh=Sy+DcVL862ePRsNSx1UnuRPqVKg9kcEBIMiIJvjooSU=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gX0lYDTQedrosq/oSvqPDeNKWtKInhORGbGXY2QMJm1xK4Xo0rGoJTjxQzINjhqUk
	 4UEo9z1gmNpE63sMP6RzSyMvc5W/V+zKX7IBYb+hAx9NcpHu/J1OjD4wySpS/mq7Js
	 AEBaTYhPXHhwfXZJPCZdjtcbUwg5XeA0lGdbbdRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B232F80506;
	Tue, 17 Jan 2023 18:12:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D45A1F8024C; Mon, 16 Jan 2023 12:39:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
 autolearn_force=no version=3.4.6
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08839F8023A
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 12:39:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08839F8023A
Received: by mail-io1-f72.google.com with SMTP id
 k1-20020a6b3c01000000b006f744aee560so17392393iob.2
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 03:39:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MSwiniR5woQGqc8BuSp7q6E3UjD1x2HrdHo84ICBI9Q=;
 b=FF4PB7NNkVMrHfiH5EwOaii32wCACDm7LT1uPuGQAnlN4SpQlcLBOaDea9XGwNFoSp
 aTlp9lQqSE5NKjgqzz6Fn8BboiPHELozyIUDdV5cFXIt3wwCfmk27tWKsICd/5JkdZKm
 dLz3GL2a8Rh6wMjlB8Dcosp813BcPpLUxzvImPZ24kXHCNBKugPiYm/GflcD+wZTX2+E
 0vex9T9d/bz1JI8qvBBfVZXvtLvjZLGBb7NRXjeObWQlvVrpgxkHt0RMgE61vkiHuZmy
 AYq32IzY3jzFue1LaGA2d7QOlnIJ4Wtztmf2jKYDNQrdu29YKf2ATRAwSZRa7TEPZxLn
 GOsw==
X-Gm-Message-State: AFqh2kpWVNBdLdcfGZBLXuNDlGilLBjKao0pvtOC2gsdaJnu6mwMbdNN
 stZ+maqVobZdR7YTdsW3PdSNdquGJP7t0E5XlBHNe+hkn2wH
X-Google-Smtp-Source: AMrXdXtN9RuEcXj4YKTwxvCY9z/PMotAZJVQBskp9A1ozhNVQ8sEqZC/00BYOUHyWuB7z4G4U43LfTQuZudjXwLhp7TX1Ivj4rK9
MIME-Version: 1.0
X-Received: by 2002:a05:6638:60c:b0:38c:886a:219a with SMTP id
 g12-20020a056638060c00b0038c886a219amr10320580jar.133.1673869177783; Mon, 16
 Jan 2023 03:39:37 -0800 (PST)
Date: Mon, 16 Jan 2023 03:39:37 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000be0f9b05f2600901@google.com>
Subject: [syzbot] general protection fault in snd_rawmidi_write
From: syzbot <syzbot+52d5f07074cbd0fa32d4@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 17 Jan 2023 18:12:39 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

HEAD commit:    0a093b2893c7 Add linux-next specific files for 20230112
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=168edb4a480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=835f3591019836d5
dashboard link: https://syzkaller.appspot.com/bug?extid=52d5f07074cbd0fa32d4
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/8111a570d6cb/disk-0a093b28.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ecc135b7fc9a/vmlinux-0a093b28.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ca8d73b446ea/bzImage-0a093b28.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+52d5f07074cbd0fa32d4@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xdffffc0000000007: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000038-0x000000000000003f]
CPU: 1 PID: 8401 Comm: syz-executor.4 Not tainted 6.2.0-rc3-next-20230112-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
RIP: 0010:snd_rawmidi_ready_append sound/core/rawmidi.c:119 [inline]
RIP: 0010:snd_rawmidi_write+0x358/0xbb0 sound/core/rawmidi.c:1592
Code: f9 48 8b 44 24 38 48 c1 e8 03 80 3c 18 00 0f 85 0d 07 00 00 48 8b 04 24 4c 8b b0 a0 00 00 00 49 8d 7e 38 48 89 f8 48 c1 e8 03 <80> 3c 18 00 0f 85 06 07 00 00 49 8d 7e 30 49 8b 6e 38 48 89 f8 48
RSP: 0018:ffffc900050a7c28 EFLAGS: 00010002

RAX: 0000000000000007 RBX: dffffc0000000000 RCX: ffffc9000e84b000
RDX: 0000000000040000 RSI: ffffffff879a3daf RDI: 0000000000000038
RBP: 0000000000001bb8 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000001bb8 R11: 0000000000000000 R12: ffff88807ac10000
R13: ffff888149ef0630 R14: 0000000000000000 R15: ffffc900050a7cc0
FS:  00007f9e6738e700(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000200ce000 CR3: 0000000029217000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 vfs_write+0x2db/0xe10 fs/read_write.c:582
 ksys_write+0x1ec/0x250 fs/read_write.c:637
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f9e6668c0c9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f9e6738e168 EFLAGS: 00000246
 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f9e667ac1f0 RCX: 00007f9e6668c0c9
RDX: 00000000fffffd2c RSI: 0000000020000000 RDI: 0000000000000004
RBP: 00007f9e666e7ae9 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffec721559f R14: 00007f9e6738e300 R15: 0000000000022000
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:snd_rawmidi_ready_append sound/core/rawmidi.c:119 [inline]
RIP: 0010:snd_rawmidi_write+0x358/0xbb0 sound/core/rawmidi.c:1592
Code: f9 48 8b 44 24 38 48 c1 e8 03 80 3c 18 00 0f 85 0d 07 00 00 48 8b 04 24 4c 8b b0 a0 00 00 00 49 8d 7e 38 48 89 f8 48 c1 e8 03 <80> 3c 18 00 0f 85 06 07 00 00 49 8d 7e 30 49 8b 6e 38 48 89 f8 48
RSP: 0018:ffffc900050a7c28 EFLAGS: 00010002

RAX: 0000000000000007 RBX: dffffc0000000000 RCX: ffffc9000e84b000
RDX: 0000000000040000 RSI: ffffffff879a3daf RDI: 0000000000000038
RBP: 0000000000001bb8 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000001bb8 R11: 0000000000000000 R12: ffff88807ac10000
R13: ffff888149ef0630 R14: 0000000000000000 R15: ffffc900050a7cc0
FS:  00007f9e6738e700(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000200ce000 CR3: 0000000029217000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	f9                   	stc
   1:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
   6:	48 c1 e8 03          	shr    $0x3,%rax
   a:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
   e:	0f 85 0d 07 00 00    	jne    0x721
  14:	48 8b 04 24          	mov    (%rsp),%rax
  18:	4c 8b b0 a0 00 00 00 	mov    0xa0(%rax),%r14
  1f:	49 8d 7e 38          	lea    0x38(%r14),%rdi
  23:	48 89 f8             	mov    %rdi,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1) <-- trapping instruction
  2e:	0f 85 06 07 00 00    	jne    0x73a
  34:	49 8d 7e 30          	lea    0x30(%r14),%rdi
  38:	49 8b 6e 38          	mov    0x38(%r14),%rbp
  3c:	48 89 f8             	mov    %rdi,%rax
  3f:	48                   	rex.W


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
