Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2282BEF2
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 08:03:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 504E017D9;
	Tue, 28 May 2019 08:03:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 504E017D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559023434;
	bh=k2+BkH/ELjppNYk8//YVpYp4ZRwKk9GTPoJZZQzExD4=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lF1m0zPZ9NzjLhvkRB1kYpfNEo6/DhUQVuns7nWE+619eVF3oYmmqrCr2uT59pr2U
	 kCgPRYpzfK9s33AbavFurVWMpscsZRhzNVcyXTUJ9Zb3gJ4PBE4i4fyTCBGDUmJ8wJ
	 DcarBX2ojJNwKXgmXIqJF9zv7+BLBoIeT7SEr0Tw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA816F896EB;
	Tue, 28 May 2019 08:02:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EF60F896E0; Mon, 27 May 2019 13:38:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66F22F8065A
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 13:38:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66F22F8065A
Received: by mail-io1-f72.google.com with SMTP id j26so8993777iog.19
 for <alsa-devel@alsa-project.org>; Mon, 27 May 2019 04:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=3ofJz0VOtKLU8MeevgDTLa64a60th9mQF2FKBUhaEfo=;
 b=YAajYJd0VVLdRGlMTZ/t7+Inr8zGSwXUP3niyD+lGwzmN0Ht1a1Yinc659SrI9xpTT
 8o3yrkEAkyaCaFEbEo6YLQMwDbPMKiMo0JpyN3f7iuM1ejj6Sk4PaKqZx5WUc/hk+LOM
 DXeQdWRATn8/dhXbsr1cGTiytbQBhE3BITnsY9kAw8jKIVvrRWGK9i0U1E529bGWQhAZ
 3+CAk5uvSfVN4hIF0gZ44gD7oi6oK+Ofy021YjAmimNTJ4WKmtwsZwUnaG/6us6XwBTn
 pmziMAlrpr3K2Yk/UGNXWyUKkMvgQmwHQpmWswGdbf5NUTo+SA6bCDIWzT3ftKsDhUsv
 mQXg==
X-Gm-Message-State: APjAAAXhTEkwvchWjy1mMSLWbr1iuc+EF/m+OQkTvCIUjiCP5CZsMWCh
 EZr+RN1qCrQfAGrlqiu/148fUMGDOwrmh3+SmOtltdbCIoH/
X-Google-Smtp-Source: APXvYqx3RE6uJKijGeIKhmkzojrhR8IqNMfF5lo/O5KVrJ1mEjMuBtHdWc7JwKkln31iNhl+Vphvgo3ijbgtwRp9AlqVFXgYeGkv
MIME-Version: 1.0
X-Received: by 2002:a6b:5812:: with SMTP id m18mr1656876iob.13.1558957086368; 
 Mon, 27 May 2019 04:38:06 -0700 (PDT)
Date: Mon, 27 May 2019 04:38:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005a6b660589dcfb60@google.com>
From: syzbot <syzbot+192a537b5c634febc6cf@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, andreyknvl@google.com, keescook@chromium.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, perex@perex.cz, 
 syzkaller-bugs@googlegroups.com, tiwai@suse.com
X-Mailman-Approved-At: Tue, 28 May 2019 08:02:07 +0200
Subject: [alsa-devel] WARNING in line6_pcm_acquire
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

HEAD commit:    43151d6c usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=169fe1f8a00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=95aff7278e7ff25e
dashboard link: https://syzkaller.appspot.com/bug?extid=192a537b5c634febc6cf
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+192a537b5c634febc6cf@syzkaller.appspotmail.com

------------[ cut here ]------------
do not call blocking ops when !TASK_RUNNING; state=1 set at  
[<000000009424b595>] do_nanosleep+0x107/0x6a0 kernel/time/hrtimer.c:1675
WARNING: CPU: 0 PID: 4661 at kernel/sched/core.c:6136  
__might_sleep+0x135/0x190 kernel/sched/core.c:6136
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 4661 Comm: syz-executor.4 Not tainted 5.1.0-rc3+ #8
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  <IRQ>
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  panic+0x292/0x5e1 kernel/panic.c:214
  __warn.cold+0x20/0x53 kernel/panic.c:571
  report_bug+0x262/0x2a0 lib/bug.c:186
  fixup_bug arch/x86/kernel/traps.c:179 [inline]
  fixup_bug arch/x86/kernel/traps.c:174 [inline]
  do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:272
  do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:291
  invalid_op+0x14/0x20 arch/x86/entry/entry_64.S:973
RIP: 0010:__might_sleep+0x135/0x190 kernel/sched/core.c:6136
Code: 65 48 8b 1c 25 c0 de 01 00 48 8d 7b 10 48 89 fe 48 c1 ee 03 80 3c 06  
00 75 2b 48 8b 73 10 48 c7 c7 c0 ec c5 85 e8 c6 4b f6 ff <0f> 0b e9 46 ff  
ff ff e8 2f d0 45 00 e9 29 ff ff ff e8 25 d0 45 00
RSP: 0018:ffff8881db207b48 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ffff8881c7d71800 RCX: 0000000000000000
RDX: 0000000000000100 RSI: ffffffff8127bbcd RDI: ffffed103b640f5b
RBP: ffffffff85c622c0 R08: ffff8881c7d71800 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 000000000000038c
R13: 0000000000000000 R14: 0000000000000000 R15: ffffffff849f6d40
  __mutex_lock_common kernel/locking/mutex.c:908 [inline]
  __mutex_lock+0xc8/0x12b0 kernel/locking/mutex.c:1072
  line6_pcm_acquire+0x30/0x210 sound/usb/line6/pcm.c:311
  call_timer_fn+0x15c/0x5e0 kernel/time/timer.c:1325
  expire_timers kernel/time/timer.c:1362 [inline]
  __run_timers kernel/time/timer.c:1681 [inline]
  __run_timers kernel/time/timer.c:1649 [inline]
  run_timer_softirq+0x586/0x1400 kernel/time/timer.c:1694
  __do_softirq+0x21f/0x8bc kernel/softirq.c:293
  invoke_softirq kernel/softirq.c:374 [inline]
  irq_exit+0x17c/0x1a0 kernel/softirq.c:414
  exiting_irq arch/x86/include/asm/apic.h:536 [inline]
  smp_apic_timer_interrupt+0xf1/0x490 arch/x86/kernel/apic/apic.c:1062
  apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:807
  </IRQ>
RIP: 0010:arch_local_irq_restore arch/x86/include/asm/irqflags.h:81 [inline]
RIP: 0010:__raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:160  
[inline]
RIP: 0010:_raw_spin_unlock_irqrestore+0x40/0x50  
kernel/locking/spinlock.c:184
Code: e8 25 19 bc fb 48 89 ef e8 dd f7 bc fb f6 c7 02 75 11 53 9d e8 a1 fd  
d8 fb 65 ff 0d 0a 59 99 7a 5b 5d c3 e8 d2 fb d8 fb 53 9d <eb> ed 0f 1f 40  
00 66 2e 0f 1f 84 00 00 00 00 00 55 48 89 fd 65 ff
RSP: 0018:ffff8881b13ffba8 EFLAGS: 00000246 ORIG_RAX: ffffffffffffff13
RAX: 0000000000000007 RBX: 0000000000000246 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000006 RDI: ffff8881c7d72034
RBP: ffff8881db224a80 R08: ffff8881c7d71800 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: dffffc0000000000
R13: ffff8881db224b00 R14: ffff8881db224b00 R15: ffff8881db224a80
  unlock_hrtimer_base kernel/time/hrtimer.c:878 [inline]
  hrtimer_start_range_ns+0x5b0/0xad0 kernel/time/hrtimer.c:1109
  hrtimer_start_expires include/linux/hrtimer.h:409 [inline]
  do_nanosleep+0x19b/0x6a0 kernel/time/hrtimer.c:1676
  hrtimer_nanosleep+0x258/0x510 kernel/time/hrtimer.c:1733
  __do_sys_nanosleep kernel/time/hrtimer.c:1767 [inline]
  __se_sys_nanosleep kernel/time/hrtimer.c:1754 [inline]
  __x64_sys_nanosleep+0x19d/0x220 kernel/time/hrtimer.c:1754
  do_syscall_64+0xbd/0x500 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x486570
Code: 00 00 48 c7 c0 d4 ff ff ff 64 c7 00 16 00 00 00 31 c0 eb be 66 0f 1f  
44 00 00 83 3d e1 01 5d 00 00 75 14 b8 23 00 00 00 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 b4 e0 f8 ff c3 48 83 ec 08 e8 ea 53 fd ff
RSP: 002b:00007ffc588bb088 EFLAGS: 00000246 ORIG_RAX: 0000000000000023
RAX: ffffffffffffffda RBX: 00000000000a95fa RCX: 0000000000486570
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 00007ffc588bb090
RBP: 00000000000002d5 R08: 0000000000000001 R09: 00000000027fc940
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000008
R13: 00007ffc588bb0e0 R14: 00000000000a8e2a R15: 00007ffc588bb0f0
Kernel Offset: disabled
Rebooting in 86400 seconds..


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
