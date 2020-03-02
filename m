Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E80C175B97
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Mar 2020 14:28:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98BC616AB;
	Mon,  2 Mar 2020 14:27:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98BC616AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583155729;
	bh=2pM8tqbXxayG+sbrSR/njjmvsTL2KnmxRu11dhctnWg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W611iuvJB3zbntP8cPJxSXU6yRTdo0UhSb4z6yLrsqvGQhgk+qkyvWNFI9vlAUqoQ
	 +SX+B7RoPBRcHmrujFSi4C269OYlDx+vGD58fXJS/54mrRj2phBptubIJEyY72M3wd
	 whrIk4VqUZTqKBA+ggGfRxzH7ja2fQpjkvJpffa0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7FEDF80131;
	Mon,  2 Mar 2020 14:27:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FB82F80131; Mon,  2 Mar 2020 14:27:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5748BF80131
 for <alsa-devel@alsa-project.org>; Mon,  2 Mar 2020 14:26:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5748BF80131
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="ENGH+Ogq"
Received: by mail-pf1-x444.google.com with SMTP id j9so5574852pfa.8
 for <alsa-devel@alsa-project.org>; Mon, 02 Mar 2020 05:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VP1fafp2b7C6oEOfVA1gwI8KH4TRBICGM8mvK9CJQiQ=;
 b=ENGH+OgqKoaBLczTHYgi+nRHBYTc82wfHHjHCzHhkg2pLmgO1UJY7FFP5I93d3WnMV
 hB97uNGtDYKZVHJjgcPQ1Lo4+VHDxQKbPwEROMjkHG1ULHteAbY2So/nmbS99RkaDN3c
 VILA/H7k497G1+ihBy3OETg6J4EANgy3FdZ7RBegBXK5wNJXxM1OhdYsTJ30JHSlaMsB
 b3IKGp8V+GnP4J4wmPG3VgtPJa7Ap8oQzhFQoKHKH7UURIWhZs/5A+DA4kCFHzoQEO8p
 UpCVZwVxakYlbhCDXJeLQl/WX0C3F+ofGvadfrryXDm1TIMDxFEEGVwrU6WiGl+Z/T5D
 QBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VP1fafp2b7C6oEOfVA1gwI8KH4TRBICGM8mvK9CJQiQ=;
 b=KIrrSPbEgv8PFBLJVzT1uB9L4vTdEJqFtkQ7uLZtDW+6HEaEVdDHj5cLyP77sqFEYM
 rJcini+v0f1MOSHF0Wm1tbPkkYqIb7zWhnwq4W1L9T0wspXiZ5oxCKiEvar6oV3q8DVK
 kyKPL3aczOUgBihea6Cx1F2vUPqFiakdlqhQtW9F6RWDjA7K7hvQDFptWogPwJ5+whsM
 55so++1hG7SbotCSUXc8/G3Hg37rsCYkhGBgFa4RqosaXTixi3KcsOyTy8Zvq1GI/iZT
 I1cT445qWYWHFhpB9D2D3lWoVJ+8pUTn4szMKgRsY7Xar8mgiFFSWcMn3G2qnNe1cQmJ
 +8pA==
X-Gm-Message-State: APjAAAV9QtaTZjyZGJ7c93fVtt+aVqOOSo5YYor0c4TRqcLxTmiRUS9a
 ipOQKHR0f8g8IKlel6ancCFDvptFMKtehS5ZlTA6vw==
X-Google-Smtp-Source: APXvYqz/Y2xIVcAgS4zqYaTBLAxEP/enF4Ma0OCq+wR35FOMCzIvuKtbqyjRHdZuirA9lGZcAoZ6+K2qvDCdSCGBBRg=
X-Received: by 2002:a63:a062:: with SMTP id u34mr20023853pgn.286.1583155617348; 
 Mon, 02 Mar 2020 05:26:57 -0800 (PST)
MIME-Version: 1.0
References: <000000000000033087059f8f8fa3@google.com>
In-Reply-To: <000000000000033087059f8f8fa3@google.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Mon, 2 Mar 2020 14:26:46 +0100
Message-ID: <CAAeHK+wkoYDtMifOAtiu6yRSGFHLvB1_W+UMg4kNLrt4VrqVDQ@mail.gmail.com>
Subject: Re: BUG: soft lockup in sys_exit_group
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Allison Randal <allison@lohutok.net>, 
 Pavel Machek <pavel@denx.de>, Thomas Gleixner <tglx@linutronix.de>,
 alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Cc: USB list <linux-usb@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>,
 syzbot <syzbot+cce32521ee0a824c21f7@syzkaller.appspotmail.com>
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

On Thu, Feb 27, 2020 at 3:30 PM syzbot
<syzbot+cce32521ee0a824c21f7@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    d6ff8147 usb: gadget: add raw-gadget interface
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=147a92c3e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=90a3d9bed5648419
> dashboard link: https://syzkaller.appspot.com/bug?extid=cce32521ee0a824c21f7
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=147f1d09e00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17c88e45e00000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+cce32521ee0a824c21f7@syzkaller.appspotmail.com
>
> watchdog: BUG: soft lockup - CPU#0 stuck for 123s! [syz-executor413:1795]
> Modules linked in:
> irq event stamp: 35154
> hardirqs last  enabled at (35153): [<ffffffff810047c1>] trace_hardirqs_on_thunk+0x1a/0x1c arch/x86/entry/thunk_64.S:41
> hardirqs last disabled at (35154): [<ffffffff810047dd>] trace_hardirqs_off_thunk+0x1a/0x1c arch/x86/entry/thunk_64.S:42
> softirqs last  enabled at (33516): [<ffffffff85c00673>] __do_softirq+0x673/0x950 kernel/softirq.c:319
> softirqs last disabled at (33499): [<ffffffff811584b8>] invoke_softirq kernel/softirq.c:373 [inline]
> softirqs last disabled at (33499): [<ffffffff811584b8>] irq_exit+0x178/0x1a0 kernel/softirq.c:413
> CPU: 0 PID: 1795 Comm: syz-executor413 Not tainted 5.6.0-rc3-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> RIP: 0010:__read_once_size include/linux/compiler.h:199 [inline]
> RIP: 0010:check_kcov_mode kernel/kcov.c:155 [inline]
> RIP: 0010:write_comp_data+0x17/0x70 kernel/kcov.c:208
> Code: d0 76 07 48 89 34 d1 48 89 11 c3 0f 1f 84 00 00 00 00 00 65 4c 8b 04 25 00 0f 02 00 65 8b 05 78 b1 c2 7e a9 00 01 1f 00 75 51 <41> 8b 80 b0 12 00 00 83 f8 03 75 45 49 8b 80 b8 12 00 00 45 8b 80
> RSP: 0018:ffff8881cdf77a38 EFLAGS: 00000246 ORIG_RAX: ffffffffffffff13
> RAX: 0000000000000002 RBX: 0000000000000001 RCX: ffffffff8134f89f
> RDX: 0000000000000001 RSI: 0000000000000000 RDI: 0000000000000005
> RBP: ffff8881cdf77b08 R08: ffff8881ce40b100 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> R13: 0000000000000000 R14: ffff8881ce5839c0 R15: ffff8881db233dc0
> FS:  0000000000000000(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fe6518f0000 CR3: 0000000007021000 CR4: 00000000001406f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  csd_lock_wait kernel/smp.c:109 [inline]
>  smp_call_function_single+0x2df/0x3a0 kernel/smp.c:311
>  smp_call_function_many_cond+0x25e/0x900 kernel/smp.c:439
>  flush_tlb_others arch/x86/include/asm/paravirt.h:68 [inline]
>  flush_tlb_mm_range+0x1e8/0x3e0 arch/x86/mm/tlb.c:798
>  tlb_flush arch/x86/include/asm/tlb.h:24 [inline]
>  tlb_flush_mmu_tlbonly include/asm-generic/tlb.h:424 [inline]
>  tlb_flush_mmu_tlbonly include/asm-generic/tlb.h:414 [inline]
>  tlb_flush_mmu+0x274/0x630 mm/mmu_gather.c:248
>  tlb_finish_mmu+0x93/0x420 mm/mmu_gather.c:328
>  exit_mmap+0x298/0x4d0 mm/mmap.c:3128
>  __mmput kernel/fork.c:1082 [inline]
>  mmput+0xce/0x3d0 kernel/fork.c:1103
>  exit_mm kernel/exit.c:485 [inline]
>  do_exit+0xaa0/0x2c50 kernel/exit.c:788
>  do_group_exit+0x125/0x340 kernel/exit.c:899
>  __do_sys_exit_group kernel/exit.c:910 [inline]
>  __se_sys_exit_group kernel/exit.c:908 [inline]
>  __x64_sys_exit_group+0x3a/0x50 kernel/exit.c:908
>  do_syscall_64+0xb6/0x5a0 arch/x86/entry/common.c:294
>  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x4436c8
> Code: Bad RIP value.
> RSP: 002b:00007ffd45d85c48 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00000000004436c8
> RDX: 0000000000000000 RSI: 000000000000003c RDI: 0000000000000000
> RBP: 00000000004c3e28 R08: 00000000000000e7 R09: ffffffffffffffd0
> R10: 80603de77cf35948 R11: 0000000000000246 R12: 0000000000000001
> R13: 00000000006d7f20 R14: 0000000000000000 R15: 0000000000000000
> Sending NMI from CPU 0 to CPUs 1:
> NMI backtrace for cpu 1
> CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.6.0-rc3-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> RIP: 0010:line6_midibuf_read+0x486/0xa30 sound/usb/line6/midibuf.c:215
> Code: 08 48 01 c1 48 89 0c 24 e8 97 4f 85 fc 44 89 f6 89 df e8 7d 50 85 fc 44 39 f3 0f 8d b4 02 00 00 e8 7f 4f 85 fc 48 8b 74 24 18 <48> 63 d3 48 8b 3c 24 e8 fe d2 ad fc 01 5d 10 e8 66 4f 85 fc 31 ff
> RSP: 0018:ffff8881db3099e8 EFLAGS: 00000006
> RAX: ffff8881da213100 RBX: 0000000000000000 RCX: ffffffff84ba0d63
> RDX: 0000000000000100 RSI: ffff8881cdc8c81c RDI: 0000000000000004
> RBP: ffff8881d4e6b4a0 R08: ffff8881da213100 R09: ffffed103a9cd641
> R10: ffffed103a9cd640 R11: ffff8881d4e6b200 R12: 0000000000000001
> R13: 000000000000001c R14: 00000000000003e4 R15: 0000000000000001
> FS:  0000000000000000(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fe6518f0000 CR3: 00000001cf791000 CR4: 00000000001406e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <IRQ>
>  line6_data_received+0x318/0x520 sound/usb/line6/driver.c:305
>  __usb_hcd_giveback_urb+0x1f2/0x470 drivers/usb/core/hcd.c:1648
>  usb_hcd_giveback_urb+0x368/0x420 drivers/usb/core/hcd.c:1713
>  dummy_timer+0x1258/0x32ae drivers/usb/gadget/udc/dummy_hcd.c:1966
>  call_timer_fn+0x195/0x6f0 kernel/time/timer.c:1404
>  expire_timers kernel/time/timer.c:1449 [inline]
>  __run_timers kernel/time/timer.c:1773 [inline]
>  __run_timers kernel/time/timer.c:1740 [inline]
>  run_timer_softirq+0x5f9/0x1500 kernel/time/timer.c:1786
>  __do_softirq+0x21e/0x950 kernel/softirq.c:292
>  invoke_softirq kernel/softirq.c:373 [inline]
>  irq_exit+0x178/0x1a0 kernel/softirq.c:413
>  exiting_irq arch/x86/include/asm/apic.h:546 [inline]
>  smp_apic_timer_interrupt+0x141/0x540 arch/x86/kernel/apic/apic.c:1146
>  apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:829
>  </IRQ>
> RIP: 0010:default_idle+0x28/0x300 arch/x86/kernel/process.c:696
> Code: cc cc 41 56 41 55 65 44 8b 2d 94 c9 72 7a 41 54 55 53 0f 1f 44 00 00 e8 16 bb b5 fb e9 07 00 00 00 0f 00 2d 3a 5f 53 00 fb f4 <65> 44 8b 2d 70 c9 72 7a 0f 1f 44 00 00 5b 5d 41 5c 41 5d 41 5e c3
> RSP: 0018:ffff8881da22fda8 EFLAGS: 00000246 ORIG_RAX: ffffffffffffff13
> RAX: 0000000000000007 RBX: ffff8881da213100 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000006 RDI: ffff8881da21394c
> RBP: ffffed103b442620 R08: ffff8881da213100 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
> R13: 0000000000000001 R14: ffffffff87e60000 R15: 0000000000000000
>  cpuidle_idle_call kernel/sched/idle.c:154 [inline]
>  do_idle+0x3e0/0x500 kernel/sched/idle.c:269
>  cpu_startup_entry+0x14/0x20 kernel/sched/idle.c:361
>  start_secondary+0x2a4/0x390 arch/x86/kernel/smpboot.c:264
>  secondary_startup_64+0xb6/0xc0 arch/x86/kernel/head_64.S:242
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> syzbot can test patches for this bug, for details see:
> https://goo.gl/tpsmEJ#testing-patches

+line6 maintainers
