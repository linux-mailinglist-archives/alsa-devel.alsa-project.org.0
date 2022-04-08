Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 555AC4FD36D
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 11:53:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03661178D;
	Tue, 12 Apr 2022 11:52:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03661178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649757188;
	bh=aNOXZwYLwPEvR4ghbOzew2Ujx4vEwVmGAed8qDGvSIk=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Fm45RmkksRuZVeBMdodwiSiYi4GzoaDbN/tZISDK5dPF6zcLxqjnz7T7NqWoiCcRG
	 tAl4vB7fKycMsFRSms02yGh9BkF5xFEpoE+Etm2CGlWWAuG8teWtX2GBR+KgHIIsWL
	 8ekV3C+eVKmfmCca2CJ+zp2Oz/hDoqW81xXNg7k4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C194F80249;
	Tue, 12 Apr 2022 11:51:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06FA9F8014E; Sat,  9 Apr 2022 00:52:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59A33F80054
 for <alsa-devel@alsa-project.org>; Sat,  9 Apr 2022 00:52:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59A33F80054
Received: by mail-io1-f72.google.com with SMTP id
 f5-20020a6be805000000b00649b9faf257so6619993ioh.9
 for <alsa-devel@alsa-project.org>; Fri, 08 Apr 2022 15:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=bzt9Z5p0uad85LLIp+TaBnz8TD3Frv18qcrHApPV7Ek=;
 b=C48axtAhgsdhhwYeTK2lgylqhk830zGGxFO/jgxuciEiswh7asQzo4jSOJGhtJ8sd8
 uHse3+fMpc1DAlu9VOcSypXDxsNjagHsFPLJg1pDIoTVMZcADm1hiFPn8HsehC/c3PUx
 zK/3IDzx1coyCNfONG0hSsDLEiIfJkJJIhH7bIeVwHVTLibs80LBwrML4TqDPfRT1Wmy
 1PYo8uIU6HC00qvV9J5agDtEpy931QSLe2PYgjy/GjYo04V3xfWoN3fs3d3Y+AkiL+05
 NIJ6e9TTSJTzay/cciI5Mi3DRKVf1Te+M608Ece6FMf2vHc5RTjGYNV762h1ebgeXBPJ
 5Ztw==
X-Gm-Message-State: AOAM5303wboGP/OY/u4yup7zcB9IeoGWvjwmekEIn/l29muTODipV7jX
 0+k7JQpDDAjltlX6CKLNzwredZRzDbKWDSddtMHDflpsGfRM
X-Google-Smtp-Source: ABdhPJy4wCGmhkenOavrH0karBsmOC5UrHcs85nWF//FYeeFAPIGJSQFFKSwt3F/YK7HQNXWvRLqe9aqAFBtbvwAr49hVIi1NSUt
MIME-Version: 1.0
X-Received: by 2002:a05:6602:14c7:b0:646:3bfb:7555 with SMTP id
 b7-20020a05660214c700b006463bfb7555mr9239062iow.83.1649458346558; Fri, 08 Apr
 2022 15:52:26 -0700 (PDT)
Date: Fri, 08 Apr 2022 15:52:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d188ef05dc2c7279@google.com>
Subject: [syzbot] KASAN: null-ptr-deref Write in snd_pcm_format_set_silence
From: syzbot <syzbot+205eb15961852c2c5974@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 12 Apr 2022 11:51:33 +0200
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

HEAD commit:    312310928417 Linux 5.18-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16f30a90f00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=595bcd2109a73f9c
dashboard link: https://syzkaller.appspot.com/bug?extid=205eb15961852c2c5974
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1798df4f700000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12981dbf700000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+205eb15961852c2c5974@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: null-ptr-deref in snd_pcm_format_set_silence sound/core/pcm_misc.c:441 [inline]
BUG: KASAN: null-ptr-deref in snd_pcm_format_set_silence+0x215/0x350 sound/core/pcm_misc.c:424
Write of size 16383 at addr 0000000000000001 by task syz-executor156/3605

CPU: 0 PID: 3605 Comm: syz-executor156 Not tainted 5.18.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 print_report mm/kasan/report.c:432 [inline]
 kasan_report.cold+0x61/0x1c6 mm/kasan/report.c:491
 check_region_inline mm/kasan/generic.c:183 [inline]
 kasan_check_range+0x13d/0x180 mm/kasan/generic.c:189
 memset+0x20/0x40 mm/kasan/shadow.c:44
 snd_pcm_format_set_silence sound/core/pcm_misc.c:441 [inline]
 snd_pcm_format_set_silence+0x215/0x350 sound/core/pcm_misc.c:424
 snd_pcm_oss_sync+0x60e/0x800 sound/core/oss/pcm_oss.c:1690
 snd_pcm_oss_ioctl+0x208c/0x3430 sound/core/oss/pcm_oss.c:2634
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0x80 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f0846a59e69
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 c1 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f0846c74318 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f0846af0028 RCX: 00007f0846a59e69
RDX: 0000000000000000 RSI: 0000000000005001 RDI: 0000000000000003
RBP: 00007f0846af0020 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 6475612f7665642f
R13: 00007f0846bffd8f R14: 00007f0846c74400 R15: 0000000000022000
 </TASK>
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
