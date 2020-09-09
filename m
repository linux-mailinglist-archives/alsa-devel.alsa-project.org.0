Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B08262B68
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 11:11:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FAB31716;
	Wed,  9 Sep 2020 11:10:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FAB31716
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599642676;
	bh=LeXMg0/XWUzIUMtgsHgGW5/DY8T30UOXj3/eXwF/d18=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GaLQxyR9/mLI6CFQwA9pNnEWFVHugVArptm/73R5mFhzR07srl7SL1YXmCx5lCB8S
	 aH+dIViNzlmsChDKofqUQGALrIU3hIaX6KfFjwz+UEGESgDGuRZjYyqa21R5YiigQf
	 yCfJve58LfljmDXbRdmc4QSmOhc88Sj5dEcge23I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2334F8028D;
	Wed,  9 Sep 2020 11:08:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B15EF80227; Wed,  9 Sep 2020 10:58:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-io1-f77.google.com (mail-io1-f77.google.com
 [209.85.166.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80584F8015F
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 10:58:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80584F8015F
Received: by mail-io1-f77.google.com with SMTP id f8so1493531iow.7
 for <alsa-devel@alsa-project.org>; Wed, 09 Sep 2020 01:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=a82XEKuwQtRdR0+zY4now1TJNGu7MBTSY6oVedJsmNg=;
 b=VAOxKwm0LtmBscwFRqZMr42yYHpjEMgMCF5RduE2SLDgCiOiuXx4w12MbmWhDSW2Jm
 KBrQhqJ2jSmg5ODnk7I4/6+kzTnGqDz/zK/o5AizdJB2eIdK28cCaTjHAKtG/rtpNT2S
 UPIXWski9GFCt16gJCRst+4qpCKmx9I/lPmLaTmHTM3VvR57XD1rMO8il3ofrJL8hZ2Y
 xlqXdb9XztvUdR8bc5GRdwylEBjH0XlJcrI9nNC33/w59Wqrar+IZHeY6mhg+UfKTUFc
 z2rTBRCEY48XiPrbsjPoJN9AB/NCfKm2IKEFBGOUIgGjJiqOKQny63DpOitjieZTnsE9
 HkwA==
X-Gm-Message-State: AOAM530FLPoWM9cn6LOE80VG+8iwDa68g1mb59wrSG8Tls7rkpuvlzqJ
 Jez0BPjxwMv2E9J/EItaaz2JiYKuWx37LrmI/PY0ZBr66pgR
X-Google-Smtp-Source: ABdhPJy7nD98ztksJNjatjTdIQCiip7e6DR50zAgnagmjr8wDg6w7zGHM3qNS1kjxOLosM6V4x1eL9PVx6y4HTOj5Rt+zCO1w9gB
MIME-Version: 1.0
X-Received: by 2002:a02:11c2:: with SMTP id 185mr2973916jaf.35.1599641900890; 
 Wed, 09 Sep 2020 01:58:20 -0700 (PDT)
Date: Wed, 09 Sep 2020 01:58:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000045446005aedda747@google.com>
Subject: possible deadlock in snd_ctl_notify
From: syzbot <syzbot+a04707b50020dd3fe3f7@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, dan.carpenter@oracle.com, 
 linux-kernel@vger.kernel.org, o-takashi@sakamocchi.jp, perex@perex.cz, 
 syzkaller-bugs@googlegroups.com, tiwai@suse.com
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
console output: https://syzkaller.appspot.com/x/log.txt?x=12f43229900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=37b3426c77bda44c
dashboard link: https://syzkaller.appspot.com/bug?extid=a04707b50020dd3fe3f7
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a04707b50020dd3fe3f7@syzkaller.appspotmail.com

=====================================================
WARNING: SOFTIRQ-safe -> SOFTIRQ-unsafe lock order detected
5.9.0-rc4-next-20200908-syzkaller #0 Not tainted
-----------------------------------------------------
syz-executor.3/8556 [HC0[0]:SC0[0]:HE0:SE1] is trying to acquire:
ffff888214db8760 (&card->ctl_files_rwlock){.+.+}-{2:2}, at: snd_ctl_notify.part.0+0x36/0x550 sound/core/control.c:153

and this task is already holding:
ffff888214dc2108 (&group->lock){..-.}-{2:2}, at: spin_lock_irq include/linux/spinlock.h:379 [inline]
ffff888214dc2108 (&group->lock){..-.}-{2:2}, at: snd_pcm_group_lock_irq sound/core/pcm_native.c:97 [inline]
ffff888214dc2108 (&group->lock){..-.}-{2:2}, at: snd_pcm_stream_lock_irq+0x8e/0xb0 sound/core/pcm_native.c:136
which would create a new lock dependency:
 (&group->lock){..-.}-{2:2} -> (&card->ctl_files_rwlock){.+.+}-{2:2}

but this new dependency connects a SOFTIRQ-irq-safe lock:
 (&group->lock){..-.}-{2:2}

... which became SOFTIRQ-irq-safe at:
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
  __run_on_irqstack arch/x86/include/asm/irq_stack.h:22 [inline]
  run_on_irqstack_cond arch/x86/include/asm/irq_stack.h:48 [inline]
  do_softirq_own_stack+0x9d/0xd0 arch/x86/kernel/irq_64.c:77
  invoke_softirq kernel/softirq.c:393 [inline]
  __irq_exit_rcu kernel/softirq.c:423 [inline]
  irq_exit_rcu+0x235/0x280 kernel/softirq.c:435
  sysvec_apic_timer_interrupt+0x51/0xf0 arch/x86/kernel/apic/apic.c:1091
  asm_sysvec_apic_timer_interrupt+0x12/0x20 arch/x86/include/asm/idtentry.h:581
  unwind_next_frame+0xc51/0x1f90 arch/x86/kernel/unwind_orc.c:543
  arch_stack_walk+0x81/0xf0 arch/x86/kernel/stacktrace.c:25
  stack_trace_save+0x8c/0xc0 kernel/stacktrace.c:123
  kasan_save_stack+0x1b/0x40 mm/kasan/common.c:48
  kasan_set_track mm/kasan/common.c:56 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:461
  __do_kmalloc mm/slab.c:3655 [inline]
  __kmalloc+0x27c/0x480 mm/slab.c:3664
  kmalloc include/linux/slab.h:559 [inline]
  tomoyo_realpath_from_path+0xc3/0x620 security/tomoyo/realpath.c:254
  tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
  tomoyo_path_perm+0x212/0x3f0 security/tomoyo/file.c:822
  security_inode_getattr+0xcf/0x140 security/security.c:1278
  vfs_getattr fs/stat.c:121 [inline]
  vfs_statx+0x170/0x390 fs/stat.c:206
  vfs_lstat include/linux/fs.h:3186 [inline]
  __do_sys_newlstat+0x91/0x110 fs/stat.c:374
  do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
  entry_SYSCALL_64_after_hwframe+0x44/0xa9

to a SOFTIRQ-irq-unsafe lock:
 (&card->ctl_files_rwlock){.+.+}-{2:2}

... which became SOFTIRQ-irq-unsafe at:
...
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

1 lock held by syz-executor.3/8556:
 #0: ffff888214dc2108 (&group->lock){..-.}-{2:2}, at: spin_lock_irq include/linux/spinlock.h:379 [inline]
 #0: ffff888214dc2108 (&group->lock){..-.}-{2:2}, at: snd_pcm_group_lock_irq sound/core/pcm_native.c:97 [inline]
 #0: ffff888214dc2108 (&group->lock){..-.}-{2:2}, at: snd_pcm_stream_lock_irq+0x8e/0xb0 sound/core/pcm_native.c:136

the dependencies between SOFTIRQ-irq-safe lock and the holding lock:
-> (&group->lock){..-.}-{2:2} {
   IN-SOFTIRQ-W at:
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
                    __run_on_irqstack arch/x86/include/asm/irq_stack.h:22 [inline]
                    run_on_irqstack_cond arch/x86/include/asm/irq_stack.h:48 [inline]
                    do_softirq_own_stack+0x9d/0xd0 arch/x86/kernel/irq_64.c:77
                    invoke_softirq kernel/softirq.c:393 [inline]
                    __irq_exit_rcu kernel/softirq.c:423 [inline]
                    irq_exit_rcu+0x235/0x280 kernel/softirq.c:435
                    sysvec_apic_timer_interrupt+0x51/0xf0 arch/x86/kernel/apic/apic.c:1091
                    asm_sysvec_apic_timer_interrupt+0x12/0x20 arch/x86/include/asm/idtentry.h:581
                    unwind_next_frame+0xc51/0x1f90 arch/x86/kernel/unwind_orc.c:543
                    arch_stack_walk+0x81/0xf0 arch/x86/kernel/stacktrace.c:25
                    stack_trace_save+0x8c/0xc0 kernel/stacktrace.c:123
                    kasan_save_stack+0x1b/0x40 mm/kasan/common.c:48
                    kasan_set_track mm/kasan/common.c:56 [inline]
                    __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:461
                    __do_kmalloc mm/slab.c:3655 [inline]
                    __kmalloc+0x27c/0x480 mm/slab.c:3664
                    kmalloc include/linux/slab.h:559 [inline]
                    tomoyo_realpath_from_path+0xc3/0x620 security/tomoyo/realpath.c:254
                    tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
                    tomoyo_path_perm+0x212/0x3f0 security/tomoyo/file.c:822
                    security_inode_getattr+0xcf/0x140 security/security.c:1278
                    vfs_getattr fs/stat.c:121 [inline]
                    vfs_statx+0x170/0x390 fs/stat.c:206
                    vfs_lstat include/linux/fs.h:3186 [inline]
                    __do_sys_newlstat+0x91/0x110 fs/stat.c:374
                    do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
                    entry_SYSCALL_64_after_hwframe+0x44/0xa9
   INITIAL USE at:
                   lock_acquire+0x1f3/0xaf0 kernel/locking/lockdep.c:5398
                   __raw_spin_lock_irq include/linux/spinlock_api_smp.h:128 [inline]
                   _raw_spin_lock_irq+0x94/0xd0 kernel/locking/spinlock.c:167
                   spin_lock_irq include/linux/spinlock.h:379 [inline]
                   snd_pcm_group_lock_irq sound/core/pcm_native.c:97 [inline]
                   snd_pcm_stream_lock_irq sound/core/pcm_native.c:136 [inline]
                   snd_pcm_hw_params+0x12a/0x1880 sound/core/pcm_native.c:672
                   snd_pcm_kernel_ioctl+0xd1/0x240 sound/core/pcm_native.c:3325
                   snd_pcm_oss_change_params_locked+0x130c/0x3430 sound/core/oss/pcm_oss.c:941
                   snd_pcm_oss_change_params sound/core/oss/pcm_oss.c:1084 [inline]
                   snd_pcm_oss_get_active_substream+0x164/0x1c0 sound/core/oss/pcm_oss.c:1101
                   snd_pcm_oss_get_channels sound/core/oss/pcm_oss.c:1792 [inline]
                   snd_pcm_oss_set_channels+0x244/0x380 sound/core/oss/pcm_oss.c:1784
                   snd_pcm_oss_ioctl+0x17d5/0x3370 sound/core/oss/pcm_oss.c:2606
                   vfs_ioctl fs/ioctl.c:48 [inline]
                   __do_sys_ioctl fs/ioctl.c:753 [inline]
                   __se_sys_ioctl fs/ioctl.c:739 [inline]
                   __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:739
                   do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
                   entry_SYSCALL_64_after_hwframe+0x44/0xa9
 }
 ... key      at: [<ffffffff8d607200>] __key.7+0x0/0x40
 ... acquired at:
   lock_acquire+0x1f3/0xaf0 kernel/locking/lockdep.c:5398
   __raw_read_lock include/linux/rwlock_api_smp.h:149 [inline]
   _raw_read_lock+0x5b/0x70 kernel/locking/spinlock.c:223
   snd_ctl_notify.part.0+0x36/0x550 sound/core/control.c:153
   snd_ctl_notify+0x8f/0xb0 sound/core/control.c:181
   loopback_check_format sound/drivers/aloop.c:358 [inline]
   loopback_trigger+0x10df/0x1990 sound/drivers/aloop.c:387
   snd_pcm_do_start sound/core/pcm_native.c:1350 [inline]
   snd_pcm_do_start+0xb1/0xf0 sound/core/pcm_native.c:1345
   snd_pcm_action_single sound/core/pcm_native.c:1207 [inline]
   snd_pcm_action+0xc8/0x170 sound/core/pcm_native.c:1290
   __snd_pcm_lib_xfer+0x1202/0x1a90 sound/core/pcm_lib.c:2247
   snd_pcm_oss_write3+0x107/0x320 sound/core/oss/pcm_oss.c:1221
   io_playback_transfer+0x27e/0x330 sound/core/oss/io.c:47
   snd_pcm_plug_write_transfer+0x2cd/0x3f0 sound/core/oss/pcm_plugin.c:624
   snd_pcm_oss_write2+0x245/0x3f0 sound/core/oss/pcm_oss.c:1353
   snd_pcm_oss_write1 sound/core/oss/pcm_oss.c:1419 [inline]
   snd_pcm_oss_write+0x705/0x940 sound/core/oss/pcm_oss.c:2765
   vfs_write+0x28e/0x700 fs/read_write.c:593
   ksys_write+0x12d/0x250 fs/read_write.c:648
   do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
   entry_SYSCALL_64_after_hwframe+0x44/0xa9


the dependencies between the lock to be acquired
 and SOFTIRQ-irq-unsafe lock:
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
   INITIAL USE at:
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
CPU: 0 PID: 8556 Comm: syz-executor.3 Not tainted 5.9.0-rc4-next-20200908-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:print_lock_trace kernel/locking/lockdep.c:1751 [inline]
RIP: 0010:print_lock_class_header kernel/locking/lockdep.c:2240 [inline]
RIP: 0010:print_shortest_lock_dependencies.cold+0x110/0x2af kernel/locking/lockdep.c:2263
Code: 48 8b 04 24 48 c1 e8 03 42 80 3c 20 00 74 09 48 8b 3c 24 e8 dd fb de f9 48 8b 04 24 48 8b 00 48 8d 78 14 48 89 fa 48 c1 ea 03 <42> 0f b6 0c 22 48 89 fa 83 e2 07 83 c2 03 38 ca 7c 08 84 c9 0f 85
RSP: 0018:ffffc900056f73a0 EFLAGS: 00010003
RAX: 0000000000000001 RBX: ffffc900056f7558 RCX: 0000000000000000
RDX: 0000000000000002 RSI: ffffffff815bc817 RDI: 0000000000000015
RBP: ffffc900056f7558 R08: 0000000000000004 R09: ffff8880ae620f8b
R10: 0000000000000000 R11: 6c6c756e28202020 R12: dffffc0000000000
R13: ffffffff8c6de340 R14: 0000000000000009 R15: 0000000000000000
FS:  00007f3778278700(0000) GS:ffff8880ae600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b33223000 CR3: 00000000a78fa000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 print_bad_irq_dependency kernel/locking/lockdep.c:2402 [inline]
 check_irq_usage.cold+0x46b/0x5b0 kernel/locking/lockdep.c:2634
 check_prev_add kernel/locking/lockdep.c:2823 [inline]
 check_prevs_add kernel/locking/lockdep.c:2944 [inline]
 validate_chain kernel/locking/lockdep.c:3562 [inline]
 __lock_acquire+0x2800/0x55d0 kernel/locking/lockdep.c:4796
 lock_acquire+0x1f3/0xaf0 kernel/locking/lockdep.c:5398
 __raw_read_lock include/linux/rwlock_api_smp.h:149 [inline]
 _raw_read_lock+0x5b/0x70 kernel/locking/spinlock.c:223
 snd_ctl_notify.part.0+0x36/0x550 sound/core/control.c:153
 snd_ctl_notify+0x8f/0xb0 sound/core/control.c:181
 loopback_check_format sound/drivers/aloop.c:358 [inline]
 loopback_trigger+0x10df/0x1990 sound/drivers/aloop.c:387
 snd_pcm_do_start sound/core/pcm_native.c:1350 [inline]
 snd_pcm_do_start+0xb1/0xf0 sound/core/pcm_native.c:1345
 snd_pcm_action_single sound/core/pcm_native.c:1207 [inline]
 snd_pcm_action+0xc8/0x170 sound/core/pcm_native.c:1290
 __snd_pcm_lib_xfer+0x1202/0x1a90 sound/core/pcm_lib.c:2247
 snd_pcm_oss_write3+0x107/0x320 sound/core/oss/pcm_oss.c:1221
 io_playback_transfer+0x27e/0x330 sound/core/oss/io.c:47
 snd_pcm_plug_write_transfer+0x2cd/0x3f0 sound/core/oss/pcm_plugin.c:624
 snd_pcm_oss_write2+0x245/0x3f0 sound/core/oss/pcm_oss.c:1353
 snd_pcm_oss_write1 sound/core/oss/pcm_oss.c:1419 [inline]
 snd_pcm_oss_write+0x705/0x940 sound/core/oss/pcm_oss.c:2765
 vfs_write+0x28e/0x700 fs/read_write.c:593
 ksys_write+0x12d/0x250 fs/read_write.c:648
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x45d5b9
Code: 5d b4 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 2b b4 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f3778277c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000000000038f40 RCX: 000000000045d5b9
RDX: 0000000000000080 RSI: 00000000200000c0 RDI: 0000000000000003
RBP: 000000000118cf80 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 000000000118cf4c
R13: 00007ffe90897b0f R14: 00007f37782789c0 R15: 000000000118cf4c
Modules linked in:
---[ end trace f8fb172cba9857a8 ]---
RIP: 0010:print_lock_trace kernel/locking/lockdep.c:1751 [inline]
RIP: 0010:print_lock_class_header kernel/locking/lockdep.c:2240 [inline]
RIP: 0010:print_shortest_lock_dependencies.cold+0x110/0x2af kernel/locking/lockdep.c:2263
Code: 48 8b 04 24 48 c1 e8 03 42 80 3c 20 00 74 09 48 8b 3c 24 e8 dd fb de f9 48 8b 04 24 48 8b 00 48 8d 78 14 48 89 fa 48 c1 ea 03 <42> 0f b6 0c 22 48 89 fa 83 e2 07 83 c2 03 38 ca 7c 08 84 c9 0f 85
RSP: 0018:ffffc900056f73a0 EFLAGS: 00010003
RAX: 0000000000000001 RBX: ffffc900056f7558 RCX: 0000000000000000
RDX: 0000000000000002 RSI: ffffffff815bc817 RDI: 0000000000000015
RBP: ffffc900056f7558 R08: 0000000000000004 R09: ffff8880ae620f8b
R10: 0000000000000000 R11: 6c6c756e28202020 R12: dffffc0000000000
R13: ffffffff8c6de340 R14: 0000000000000009 R15: 0000000000000000
FS:  00007f3778278700(0000) GS:ffff8880ae600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b33223000 CR3: 00000000a78fa000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
