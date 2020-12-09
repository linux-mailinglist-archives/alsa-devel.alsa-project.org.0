Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0816F2D5571
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 09:28:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9989582A;
	Thu, 10 Dec 2020 09:27:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9989582A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607588918;
	bh=OVp1RTlxvRTAL+NnHlYPRJudOGrFPw3eZvcrViRaQ6c=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AaW8DLU82yN4RuICvu6uboNfn4Cd27gWMS+qkiuXG2hMj69OjDw2JKMo4wnC56XNi
	 72LlKVj1qRV1ii9SEWwt6AEjRfxr+T5iot5Qn+23xP0xmhKQN6N17fHi0kK2ezyhWV
	 WhZtidVJBz8gXgoNDJyQTyOzbbxkWjKJJL9Qk1jY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFE6BF80105;
	Thu, 10 Dec 2020 09:27:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D0F2F80217; Wed,  9 Dec 2020 08:33:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,SORTED_RECIPS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 675B7F8012C
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 08:33:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 675B7F8012C
Received: by mail-io1-f71.google.com with SMTP id m9so614841ioa.9
 for <alsa-devel@alsa-project.org>; Tue, 08 Dec 2020 23:33:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=oKhCdeN5p+5cdnOz5gwTVBe+HbKNwK7qKySSgBEppUw=;
 b=rfNX8vtfzA4xTHQkyD+/wv/7R4MRUxrCc7SPUYAxnQ/5vSeLmACXARmapa3KauWQLZ
 wbfPU1X0RmsHo4s7jOqFZb/JW+NuS0TPEwkSlJaUjDtqjqzfIxRbmupmheM6Ax6omXGx
 L+HhYI2Hs75BCnPz9vYn/KBgxysTI/T67o1VBDiMN/yriUnQsnyLrUa/7HcGmZElrMQr
 95pqtLlsh/r5tQ5wYMiSX4/onv90Ws4rZ7yqsulMvc6EB7Uj7zguJaOSgF458An99EbU
 zCn8v2E7APz111AoX0SV3x9UraQOtpD1XIEtoz807QNej0aiOBYn7I7K3FsppHXROK3G
 OE4Q==
X-Gm-Message-State: AOAM531thEk8eRw8eZDJSqZLVjVcuqhNai4c9Cz/lLK2IOk7UnqiEliK
 38DGaddVZAi1IId7EaUAzMJmlMQyKe3uf3WYRvDVr3p0UtTo
X-Google-Smtp-Source: ABdhPJxFZF07z5GI3smAAiIdVpt4vBwwZxw5n5fyWs3o7QZrCwgGx4eSQ9wc13SPaczYVpX99zJ73k6OE8pupAdOjLeR47wTzvtv
MIME-Version: 1.0
X-Received: by 2002:a92:4002:: with SMTP id n2mr1029198ila.293.1607499191018; 
 Tue, 08 Dec 2020 23:33:11 -0800 (PST)
Date: Tue, 08 Dec 2020 23:33:11 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000041e8e505b603128f@google.com>
Subject: UBSAN: shift-out-of-bounds in snd_pcm_oss_change_params_locked
From: syzbot <syzbot+33ef0b6639a8d2d42b4c@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, alsa-devel@alsa-project.org, 
 gustavoars@kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 syzkaller-bugs@googlegroups.com, tiwai@suse.com, vbabka@suse.cz, 
 walken@google.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 10 Dec 2020 09:27:00 +0100
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

HEAD commit:    15ac8fdb Add linux-next specific files for 20201207
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1656cc13500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3696b8138207d24d
dashboard link: https://syzkaller.appspot.com/bug?extid=33ef0b6639a8d2d42b4c
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13a8ad37500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15bc6adf500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+33ef0b6639a8d2d42b4c@syzkaller.appspotmail.com

================================================================================
UBSAN: shift-out-of-bounds in sound/core/oss/pcm_oss.c:705:23
shift exponent 58 is too large for 32-bit type 'int'
CPU: 1 PID: 8476 Comm: syz-executor572 Not tainted 5.10.0-rc6-next-20201207-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:120
 ubsan_epilogue+0xb/0x5a lib/ubsan.c:148
 __ubsan_handle_shift_out_of_bounds.cold+0xb1/0x181 lib/ubsan.c:395
 snd_pcm_oss_period_size sound/core/oss/pcm_oss.c:705 [inline]
 snd_pcm_oss_change_params_locked.cold+0x55/0x78 sound/core/oss/pcm_oss.c:925
 snd_pcm_oss_change_params sound/core/oss/pcm_oss.c:1084 [inline]
 snd_pcm_oss_make_ready+0xe7/0x1b0 sound/core/oss/pcm_oss.c:1143
 snd_pcm_oss_sync+0x1de/0x800 sound/core/oss/pcm_oss.c:1708
 snd_pcm_oss_release+0x276/0x300 sound/core/oss/pcm_oss.c:2546
 __fput+0x283/0x920 fs/file_table.c:280
 task_work_run+0xdd/0x190 kernel/task_work.c:140
 exit_task_work include/linux/task_work.h:30 [inline]
 do_exit+0xb89/0x2a00 kernel/exit.c:823
 do_group_exit+0x125/0x310 kernel/exit.c:920
 __do_sys_exit_group kernel/exit.c:931 [inline]
 __se_sys_exit_group kernel/exit.c:929 [inline]
 __x64_sys_exit_group+0x3a/0x50 kernel/exit.c:929
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x43ee98
Code: Unable to access opcode bytes at RIP 0x43ee6e.
RSP: 002b:00007ffc0b9ddff8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 000000000043ee98
RDX: 0000000000000000 RSI: 000000000000003c RDI: 0000000000000000
RBP: 00000000004be6a8 R08: 00000000000000e7 R09: ffffffffffffffd0
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00000000006d0180 R14: 0000000000000000 R15: 0000000000000000
================================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
