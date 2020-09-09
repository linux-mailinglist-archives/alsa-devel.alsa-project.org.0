Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B81262B60
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 11:10:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95A841702;
	Wed,  9 Sep 2020 11:09:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95A841702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599642632;
	bh=aT5C8o2NHAn4nqO6WkP8BsCRyFLTDqwF6v8cVCYY87U=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lOlyme62H067S0u9uBcXNetVGeuZGM3BrSxY9J1BI0osPp2Yv2rYEDjMSbwxAUrqn
	 hiOqQPXRZPNuRqq4jS2WdutetYfDngRFnwRiWH5z6tgFVBFU9sOxdGD6ODQM2lFICn
	 5pyruqprPnqyxQDbgsAcZZvitSJuqXUuvuRoVJ3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF789F8015F;
	Wed,  9 Sep 2020 11:08:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB57BF80227; Wed,  9 Sep 2020 10:49:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=FROM_LOCAL_DIGITS,
 FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_76,RCVD_IN_MSPIKE_H2,
 SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-io1-f78.google.com (mail-io1-f78.google.com
 [209.85.166.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C152F800FD
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 10:49:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C152F800FD
Received: by mail-io1-f78.google.com with SMTP id j4so1479892iob.8
 for <alsa-devel@alsa-project.org>; Wed, 09 Sep 2020 01:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=cgyKll0nagh2//Z/Ms7SYLz8ci4xEH7BD44T3z7Gevk=;
 b=noY6+Z2Nr6Dl56tDE5K/frdrkJUOWXeAg5WAt22m5+T76mIqOEDUxxV1OzrlwBIajS
 LppkcbA1fGMCiCoRVGR3cuTAwWUTzsoywULjDYTmwJuiEX7r8potQD+dMVPycTG4oinj
 bO2+6NZFQKoLhH7h9k0shNiAZpg9kW8iKSmcZB87ZGhVoGXzSa2QkujxPqDnTp8bL1HK
 MBf9qEIuY9Zuf9r4lh1Yq4Q5lUzm0ILESts2+Q9L66jBzy84F/kTypQRvN7n2cY0jCn4
 LFsmcXswyIdxxCISkXEGRVgkwEmAG0wFv0HDJtQ4HTgzp+xThL76CVEqQTL2HX+RrNxD
 E04A==
X-Gm-Message-State: AOAM530E3uFROlGwu3t9irsr2t40yzL99uhmpNkseYQIndUflHV4EAfR
 IlAG8pTmLWrh3Dhtyme+HjLRrbt8Mh8badZkOVJ8Yz2KNrCK
X-Google-Smtp-Source: ABdhPJzqt9hE9UfmuqkQvmQLNHrDrDWH2zcrJe6IyV/rvgH72nWEiDKrxYwYrVYgf7SiDg56DKqiBHCFniakYRMdVFMV2LV85Mvy
MIME-Version: 1.0
X-Received: by 2002:a92:9a92:: with SMTP id c18mr2880342ill.265.1599641362414; 
 Wed, 09 Sep 2020 01:49:22 -0700 (PDT)
Date: Wed, 09 Sep 2020 01:49:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002cc32605aedd876d@google.com>
Subject: possible deadlock in _snd_pcm_stream_lock_irqsave
From: syzbot <syzbot+561a74f84100162990b2@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, arnd@arndb.de, baolin.wang@linaro.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 09 Sep 2020 11:08:48 +0200
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

HEAD commit:    dff9f829 Add linux-next specific files for 20200908
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1425773e900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=37b3426c77bda44c
dashboard link: https://syzkaller.appspot.com/bug?extid=561a74f84100162990b2
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=126577ae900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=121e4e21900000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+561a74f84100162990b2@syzkaller.appspotmail.com

========================================================
WARNING: possible irq lock inversion dependency detected
5.9.0-rc4-next-20200908-syzkaller #0 Not tainted
--------------------------------------------------------
swapper/0/0 just changed the state of lock:
ffff8882153bc908 (&group->lock){..-.}-{2:2}, at: _snd_pcm_stream_lock_irqsave+0x9f/0xd0 sound/core/pcm_native.c:170
but this lock took another, SOFTIRQ-READ-unsafe lock in the past:
 (&card->ctl_files_rwlock){.+.+}-{2:2}


and interrupts could create inverse lock ordering between them.


other info that might help us debug this:
 Possible interrupt unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&card->ctl_files_rwlock);
                               local_irq_disable();
                               lock(&group->lock);
                               lock(&card->ctl_files_rwlock);
  <Interrupt>
    lock(&group->lock);

 *** DEADLOCK ***

1 lock held by swapper/0/0:
 #0: ffffc90000007d68 ((&dpcm->timer)){+.-.}-{0:0}, at: lockdep_copy_map include/linux/lockdep.h:35 [inline]
 #0: ffffc90000007d68 ((&dpcm->timer)){+.-.}-{0:0}, at: call_timer_fn+0xdb/0x760 kernel/time/timer.c:1403

the shortest dependencies between 2nd lock and 1st lock:
 -> (&card->ctl_files_rwlock){.+.+}-{2:2} {
    HARDIRQ-ON-R at:
                      lock_acquire+0x1f3/0xaf0 kernel/locking/lockdep.c:5398
                      __raw_read_lock include/linux/rwlock_api_smp.h:149 [inline]
                      _raw_read_lock+0x5b/0x70 kernel/locking/spinlock.c:223
                      snd_ctl_notify.part.0+0x36/0x550 sound/core/control.c:153
                      snd_ctl_notify+0x8f/0xb0 sound/core/control.c:181
                      __snd_ctl_add_replace+0x638/0x800 sound/core/control.c:382
                      snd_ctl_add_replace+0x76/0x130 sound/core/control.c:399
                      snd_card_dummy_new_mixer sound/drivers/dummy.c:885 [inline]
                      snd_dummy_probe+0xbbf/0x1050 sound/drivers/dummy.c:1080
                      platform_drv_probe+0x87/0x140 drivers/base/platform.c:747
                      really_probe+0x282/0x9f0 drivers/base/dd.c:553
                      driver_probe_device+0xfe/0x1d0 drivers/base/dd.c:738
                      __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:844
                      bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:431
                      __device_attach+0x228/0x470 drivers/base/dd.c:912
                      bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
                      device_add+0xb17/0x1c40 drivers/base/core.c:2926
                      platform_device_add+0x34f/0x6d0 drivers/base/platform.c:597
                      platform_device_register_full+0x38c/0x4e0 drivers/base/platform.c:720
                      platform_device_register_resndata include/linux/platform_device.h:131 [inline]
                      platform_device_register_simple include/linux/platform_device.h:160 [inline]
                      alsa_card_dummy_init+0x1cc/0x2e0 sound/drivers/dummy.c:1168
                      do_one_initcall+0x10a/0x7b0 init/main.c:1204
                      do_initcall_level init/main.c:1277 [inline]
                      do_initcalls init/main.c:1293 [inline]
                      do_basic_setup init/main.c:1313 [inline]
                      kernel_init_freeable+0x5e9/0x66d init/main.c:1512
                      kernel_init+0xd/0x1c0 init/main.c:1402
                      ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
    SOFTIRQ-ON-R at:
                      lock_acquire+0x1f3/0xaf0 kernel/locking/lockdep.c:5398
                      __raw_read_lock include/linux/rwlock_api_smp.h:149 [inline]
                      _raw_read_lock+0x5b/0x70 kernel/locking/spinlock.c:223
                      snd_ctl_notify.part.0+0x36/0x550 sound/core/control.c:153
                      snd_ctl_notify+0x8f/0xb0 sound/core/control.c:181
                      __snd_ctl_add_replace+0x638/0x800 sound/core/control.c:382
                      snd_ctl_add_replace+0x76/0x130 sound/core/control.c:399
                      snd_card_dummy_new_mixer sound/drivers/dummy.c:885 [inline]
                      snd_dummy_probe+0xbbf/0x1050 sound/drivers/dummy.c:1080
                      platform_drv_probe+0x87/0x140 drivers/base/platform.c:747
                      really_probe+0x282/0x9f0 drivers/base/dd.c:553
                      driver_probe_device+0xfe/0x1d0 drivers/base/dd.c:738
                      __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:844
                      bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:431
                      __device_attach+0x228/0x470 drivers/base/dd.c:912
                      bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
                      device_add+0xb17/0x1c40 drivers/base/core.c:2926
                      platform_device_add+0x34f/0x6d0 drivers/base/platform.c:597
                      platform_device_register_full+0x38c/0x4e0 drivers/base/platform.c:720
                      platform_device_register_resndata include/linux/platform_device.h:131 [inline]
                      platform_device_register_simple include/linux/platform_device.h:160 [inline]
                      alsa_card_dummy_init+0x1cc/0x2e0 sound/drivers/dummy.c:1168
                      do_one_initcall+0x10a/0x7b0 init/main.c:1204
                      do_initcall_level init/main.c:1277 [inline]
                      do_initcalls init/main.c:1293 [inline]
                      do_basic_setup init/main.c:1313 [inline]
                      kernel_init_freeable+0x5e9/0x66d init/main.c:1512
                      kernel_init+0xd/0x1c0 init/main.c:1402
                      ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
    (null) at:
general protection fault, probably for non-canonical address 0xdffffc0000000002: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.9.0-rc4-next-20200908-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:print_lock_trace kernel/locking/lockdep.c:1751 [inline]
RIP: 0010:print_lock_class_header kernel/locking/lockdep.c:2240 [inline]
RIP: 0010:print_shortest_lock_dependencies.cold+0x110/0x2af kernel/locking/lockdep.c:2263
Code: 48 8b 04 24 48 c1 e8 03 42 80 3c 20 00 74 09 48 8b 3c 24 e8 dd fb de f9 48 8b 04 24 48 8b 00 48 8d 78 14 48 89 fa 48 c1 ea 03 <42> 0f b6 0c 22 48 89 fa 83 e2 07 83 c2 03 38 ca 7c 08 84 c9 0f 85
RSP: 0018:ffffc90000007870 EFLAGS: 00010003
RAX: 0000000000000001 RBX: ffffffff8c8d3cc0 RCX: 0000000000000000
RDX: 0000000000000002 RSI: ffffffff815bc817 RDI: 0000000000000015
RBP: ffffc900000079a0 R08: 0000000000000004 R09: ffff8880ae620f8b
R10: 0000000000000000 R11: 6c756e2820202020 R12: dffffc0000000000
R13: ffffffff8c6de1d0 R14: 0000000000000009 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff8880ae600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000200000c0 CR3: 0000000093f18000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 print_irq_inversion_bug.part.0+0x2c6/0x2ee kernel/locking/lockdep.c:3769
 print_irq_inversion_bug kernel/locking/lockdep.c:4377 [inline]
 check_usage_forwards kernel/locking/lockdep.c:3803 [inline]
 mark_lock_irq kernel/locking/lockdep.c:3935 [inline]
 mark_lock.cold+0x38/0x10d kernel/locking/lockdep.c:4375
 mark_usage kernel/locking/lockdep.c:4260 [inline]
 __lock_acquire+0x117d/0x55d0 kernel/locking/lockdep.c:4750
 lock_acquire+0x1f3/0xaf0 kernel/locking/lockdep.c:5398
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
 _raw_spin_lock_irqsave+0x94/0xd0 kernel/locking/spinlock.c:159
 _snd_pcm_stream_lock_irqsave+0x9f/0xd0 sound/core/pcm_native.c:170
 snd_pcm_period_elapsed+0x24/0x250 sound/core/pcm_lib.c:1799
 loopback_jiffies_timer_function+0x1a8/0x220 sound/drivers/aloop.c:669
 call_timer_fn+0x1ac/0x760 kernel/time/timer.c:1413
 expire_timers kernel/time/timer.c:1458 [inline]
 __run_timers.part.0+0x67c/0xaa0 kernel/time/timer.c:1755
 __run_timers kernel/time/timer.c:1736 [inline]
 run_timer_softirq+0xae/0x1a0 kernel/time/timer.c:1768
 __do_softirq+0x1f7/0xa91 kernel/softirq.c:298
 asm_call_on_stack+0xf/0x20 arch/x86/entry/entry_64.S:706
 </IRQ>
 __run_on_irqstack arch/x86/include/asm/irq_stack.h:22 [inline]
 run_on_irqstack_cond arch/x86/include/asm/irq_stack.h:48 [inline]
 do_softirq_own_stack+0x9d/0xd0 arch/x86/kernel/irq_64.c:77
 invoke_softirq kernel/softirq.c:393 [inline]
 __irq_exit_rcu kernel/softirq.c:423 [inline]
 irq_exit_rcu+0x235/0x280 kernel/softirq.c:435
 sysvec_apic_timer_interrupt+0x51/0xf0 arch/x86/kernel/apic/apic.c:1091
 asm_sysvec_apic_timer_interrupt+0x12/0x20 arch/x86/include/asm/idtentry.h:581
RIP: 0010:native_safe_halt+0xe/0x10 arch/x86/include/asm/irqflags.h:61
Code: ff 4c 89 ef e8 23 c4 b4 f9 e9 8e fe ff ff 48 89 df e8 16 c4 b4 f9 eb 8a cc cc cc cc e9 07 00 00 00 0f 00 2d 94 f6 4a 00 fb f4 <c3> 90 e9 07 00 00 00 0f 00 2d 84 f6 4a 00 f4 c3 cc cc 55 53 e8 e9
RSP: 0018:ffffffff89a07cd8 EFLAGS: 00000293
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 1ffffffff15796a9
RDX: ffffffff89a99dc0 RSI: ffffffff87fdd050 RDI: 0000000000000000
RBP: ffff8880a67b3064 R08: 0000000000000001 R09: 0000000000000001
R10: 0000000000000000 R11: 0000000000000001 R12: ffff8880a67b3064
R13: 1ffffffff1340fa5 R14: ffff8880a67b3065 R15: 0000000000000001
 arch_safe_halt arch/x86/include/asm/paravirt.h:150 [inline]
 acpi_safe_halt+0x95/0x180 drivers/acpi/processor_idle.c:111
 acpi_idle_do_entry+0x15c/0x1b0 drivers/acpi/processor_idle.c:524
 acpi_idle_enter+0x403/0xac0 drivers/acpi/processor_idle.c:650
 cpuidle_enter_state+0x150/0xa70 drivers/cpuidle/cpuidle.c:243
 cpuidle_enter+0x4a/0xa0 drivers/cpuidle/cpuidle.c:355
 call_cpuidle kernel/sched/idle.c:132 [inline]
 cpuidle_idle_call kernel/sched/idle.c:213 [inline]
 do_idle+0x48e/0x730 kernel/sched/idle.c:273
 cpu_startup_entry+0x14/0x20 kernel/sched/idle.c:369
 start_kernel+0x490/0x4b1 init/main.c:1048
 secondary_startup_64+0xa4/0xb0 arch/x86/kernel/head_64.S:243
Modules linked in:
---[ end trace 7b8dcf330d33be72 ]---
RIP: 0010:print_lock_trace kernel/locking/lockdep.c:1751 [inline]
RIP: 0010:print_lock_class_header kernel/locking/lockdep.c:2240 [inline]
RIP: 0010:print_shortest_lock_dependencies.cold+0x110/0x2af kernel/locking/lockdep.c:2263
Code: 48 8b 04 24 48 c1 e8 03 42 80 3c 20 00 74 09 48 8b 3c 24 e8 dd fb de f9 48 8b 04 24 48 8b 00 48 8d 78 14 48 89 fa 48 c1 ea 03 <42> 0f b6 0c 22 48 89 fa 83 e2 07 83 c2 03 38 ca 7c 08 84 c9 0f 85
RSP: 0018:ffffc90000007870 EFLAGS: 00010003
RAX: 0000000000000001 RBX: ffffffff8c8d3cc0 RCX: 0000000000000000
RDX: 0000000000000002 RSI: ffffffff815bc817 RDI: 0000000000000015
RBP: ffffc900000079a0 R08: 0000000000000004 R09: ffff8880ae620f8b
R10: 0000000000000000 R11: 6c756e2820202020 R12: dffffc0000000000
R13: ffffffff8c6de1d0 R14: 0000000000000009 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff8880ae600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000200000c0 CR3: 0000000093f18000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
