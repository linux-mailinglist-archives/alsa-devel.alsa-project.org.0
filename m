Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FC32F9AF0
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 09:04:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F13417F5;
	Mon, 18 Jan 2021 09:03:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F13417F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610957076;
	bh=frkx990uiPqLk3CW/JmtkCy//HVLlEh4b0LtVFu+k8s=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=u3QRzucVwkWrGXSUDfIzbS7xG9Sh+BAnVXfMBQ5YjOFN2fBdf2mU267jYnbXlutBY
	 Y5XJEQ1Vhg8HLsBkPESd5ULrqhL3CIIVdB2Kjud9tnwDejOkcCI9VXs8koTYGEs15d
	 XvaGEV6NP/WDleenY8tlNTEEpXtlIelZd5ZSCoBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF5CEF8026B;
	Mon, 18 Jan 2021 09:02:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F2B8F801ED; Fri, 15 Jan 2021 09:48:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57705F80132
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 09:47:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57705F80132
Received: by mail-io1-f72.google.com with SMTP id m3so13052980ioy.0
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 00:47:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=3ckr1Mfn/YY+HNQ+AHLOJlRAcQoosqzSNDPBWIcaTtY=;
 b=ttB5ke4tQbFEfz3UsNzozp+AHnu/P7ut7Wn3VPj5hJac2PS/MsiDYsVho7YpDThnX7
 CwdSIxLM3+YqCWPztGJBrzjEbvInFBBnWmXCdwGtjJIDHq1VYwfWQaWWsi255TMOMxK4
 mReIKFlHwYyfGBBaIdXYAlmdfx8cXPN2lskhWrEHkCvoOqdEgGPupIHILqd+RAp20DV5
 5EqXSwfraBJGMYUpozD9/9sNjopjELQVIlSgjixFvRMdZ7LYRMbZ8qYIYUJ9TIgTg9T4
 5FGz2QxARi1913+4zqVJKEKyQwLAalwH1siJ44KkJ2LpoYdHC3d1Hzmw2fig8/RFCSuc
 ui/A==
X-Gm-Message-State: AOAM532zOTkv1EALc9dCGbDj52nzb3QDUM0EvfykiWEcZDyY7s1me9Pn
 xTTXc6awoxg4d8ZJGFNtPxTvGSH156tkgxfi2yLXz1SQiuFm
X-Google-Smtp-Source: ABdhPJzptic/hQVbC4RZn0b9E2+GUjLcLL/KforQ9fhnZiLUTe4Efxou5W3MviG+iKNFS8sgoZyos4sskWf5MPAbMMw7EJvRxuGo
MIME-Version: 1.0
X-Received: by 2002:a6b:5018:: with SMTP id e24mr7746963iob.184.1610700445592; 
 Fri, 15 Jan 2021 00:47:25 -0800 (PST)
Date: Fri, 15 Jan 2021 00:47:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e635df05b8ec6b6e@google.com>
Subject: KMSAN: uninit-value in snd_seq_oss_synth_make_info (2)
From: syzbot <syzbot+e42504ff21cff05a595f@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, glider@google.com, 
 linux-kernel@vger.kernel.org, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 18 Jan 2021 09:02:51 +0100
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

HEAD commit:    73d62e81 kmsan: random: prevent boot-time reports in _mix_..
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=10284200d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2cdf4151c9653e32
dashboard link: https://syzkaller.appspot.com/bug?extid=e42504ff21cff05a595f
compiler:       clang version 11.0.0 (https://github.com/llvm/llvm-project.git ca2dcbd030eadbf0aa9b660efe864ff08af6e18b)
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e42504ff21cff05a595f@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in strlen lib/string.c:576 [inline]
BUG: KMSAN: uninit-value in strlcpy+0x8c/0x1c0 lib/string.c:143
CPU: 1 PID: 10203 Comm: syz-executor.3 Not tainted 5.10.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:118
 kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:118
 __msan_warning+0x5f/0xa0 mm/kmsan/kmsan_instr.c:197
 strlen lib/string.c:576 [inline]
 strlcpy+0x8c/0x1c0 lib/string.c:143
 snd_seq_oss_synth_make_info+0x381/0x820 sound/core/seq/oss/seq_oss_synth.c:619
 snd_seq_oss_synth_info_user sound/core/seq/oss/seq_oss_ioctl.c:24 [inline]
 snd_seq_oss_ioctl+0x12b4/0x2530 sound/core/seq/oss/seq_oss_ioctl.c:139
 odev_ioctl sound/core/seq/oss/seq_oss.c:180 [inline]
 odev_ioctl_compat+0x247/0x290 sound/core/seq/oss/seq_oss.c:190
 __do_compat_sys_ioctl fs/ioctl.c:842 [inline]
 __se_compat_sys_ioctl+0x53d/0x1100 fs/ioctl.c:793
 __ia32_compat_sys_ioctl+0x4a/0x70 fs/ioctl.c:793
 do_syscall_32_irqs_on arch/x86/entry/common.c:80 [inline]
 __do_fast_syscall_32+0x102/0x160 arch/x86/entry/common.c:139
 do_fast_syscall_32+0x6a/0xc0 arch/x86/entry/common.c:162
 do_SYSENTER_32+0x73/0x90 arch/x86/entry/common.c:205
 entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
RIP: 0023:0xf7f8c549
Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 eb 0d 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 002b:00000000f55860cc EFLAGS: 00000296 ORIG_RAX: 0000000000000036
RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 00000000c08c5114
RDX: 0000000020000080 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000

Local variable ----minf@snd_seq_oss_synth_make_info created at:
 snd_seq_oss_synth_make_info+0x22a/0x820 sound/core/seq/oss/seq_oss_synth.c:613
 snd_seq_oss_synth_make_info+0x22a/0x820 sound/core/seq/oss/seq_oss_synth.c:613
=====================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
