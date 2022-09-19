Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1CF5BCC21
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Sep 2022 14:47:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD86A84B;
	Mon, 19 Sep 2022 14:46:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD86A84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663591651;
	bh=haSYzpKJay+mf9RYmKy6RgPunJFCNX6tGPsxGud90Gs=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lMfcnbdn8uvCk6Z/wc8Sz5rV60G+hnQNaQh/8Hdpa2xvk3mDs95lNJeN+zsHdz0lv
	 xBcfPtneSt8wVPsQm5NKamaJYJYM/e2hNTGPI/+ot5EksqpdrLT42/jx2xUIOZuhRO
	 2WBRrgNUFao2T8rkJH4iGOvA8mksGZH6jwC3V67s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46F83F800C9;
	Mon, 19 Sep 2022 14:46:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F4EBF8023A; Mon, 19 Sep 2022 14:46:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com
 [IPv6:2607:f8b0:4864:20::a34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06703F800E5
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 14:46:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06703F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SOl13Anf"
Received: by mail-vk1-xa34.google.com with SMTP id v192so408534vkv.7
 for <alsa-devel@alsa-project.org>; Mon, 19 Sep 2022 05:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=UrBfut9T8kgQS7wNZRUyz/ed0FiYcdAPQ5fPd/GdYxk=;
 b=SOl13AnfW5omHfAnxMPsd1UBUFfapdc1w9lUAo50iqS7EDVSZV8tbbUGoXU7tlsJS1
 z0RsEFLUqeWKzinDWqlJyYk/IFNxpR9sjYBmVCnAfSQ9NFTDx6WgMl6+zXnad5ZhHAOn
 icdqCGYv1kpQADPjcTMzhwEof0ujcnVykQMlxivTCPFdE687ATgEdsL41avOL8CSMQwk
 ckPBGyOOCaNBsRrA29qHVNw3hAKwz1eLUm+LBz0xLcMS+NwQ0rE7AkOfmSwydleYgtDN
 YVhLrODZ48u9juUpiHXfRDi5+WscMVQeezTlPzPwP9nY2OCTkcUGIl5aT5t0OD9Sb3TG
 1PZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=UrBfut9T8kgQS7wNZRUyz/ed0FiYcdAPQ5fPd/GdYxk=;
 b=Ceo/l0oFKA+UhNndlHfLoopMzHeafGrpb3se+vskbEhjap9BikpoQm031XGQ66oJID
 eGZmc/gGuEmS/NfL7w3BWVjvNlqZjw07+vXxlD1OUGIhd7a6RfjKUlAtAz/WcdR8/v/P
 Su3RtyJKhx3cO3tFFL1lr/E+/I4Vl2+m6kBB/kN/f7tWSHz07qzKQh8AygKfQauGb2Ie
 pDQn2EobTUh2EStmVrmscNTKnKfbabnsCeRdIMywVfaay20UTRWegMCFSLLEbrM0oOoG
 cBBFa9jAQRYATG4zcOwFYgYCKUArFjrce3n2cLoOtPtSRcTfdhSfRFnvFPQmvj1qQ4kv
 jDZw==
X-Gm-Message-State: ACrzQf03W5RJcSIX9URo7x0bp9MFF5RzEeZwKrUeWwqJoP6JJ0BhiIa7
 KFkac/GXM6U7au12nn8L9qcJBFLMJTgpH5WODUw=
X-Google-Smtp-Source: AMsMyM4QMfAx2dgtYUmfGBDvXpvDPZ+brPW+DCffLHFsNiCjoXPcH1QbskD5z7VaOb78FdT+EVQi3tSGF3+Yz7O34aU=
X-Received: by 2002:a1f:26d8:0:b0:39e:e116:59b8 with SMTP id
 m207-20020a1f26d8000000b0039ee11659b8mr5909909vkm.36.1663591584872; Mon, 19
 Sep 2022 05:46:24 -0700 (PDT)
MIME-Version: 1.0
From: Rondreis <linhaoguo86@gmail.com>
Date: Mon, 19 Sep 2022 20:46:13 +0800
Message-ID: <CAB7eexJP7w1B0mVgDF0dQ+gWor7UdkiwPczmL7pn91xx8xpzOA@mail.gmail.com>
Subject: possible deadlock in snd_rawmidi_free
To: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

When fuzzing the Linux kernel driver v6.0-rc4, the following crash was
triggered.

HEAD commit: 7e18e42e4b280c85b76967a9106a13ca61c16179
git tree: upstream

kernel config: https://pastebin.com/raw/xtrgsXP3
console output: https://pastebin.com/raw/9tabWDtu

Sorry for failing to extract the reproducer, and the crash occurred at
the moment of disconnecting the midi device. On other versions of
Linux, I also triggered this crash.

I would appreciate it if you have any idea how to solve this bug.

The crash report is as follows:

======================================================
WARNING: possible circular locking dependency detected
6.0.0-rc4+ #20 Not tainted
------------------------------------------------------
kworker/1:7/10868 is trying to acquire lock:
ffffffff8e289108 (register_mutex#5){+.+.}-{3:3}, at:
snd_rawmidi_free+0x7a/0x190 sound/core/rawmidi.c:1902

but task is already holding lock:
ffffffff8e274048 (sound_oss_mutex){+.+.}-{3:3}, at:
snd_unregister_oss_device+0x97/0x290 sound/core/sound_oss.c:159

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (sound_oss_mutex){+.+.}-{3:3}:
       lock_acquire kernel/locking/lockdep.c:5666 [inline]
       lock_acquire+0x1ab/0x580 kernel/locking/lockdep.c:5631
       __mutex_lock_common kernel/locking/mutex.c:603 [inline]
       __mutex_lock+0x14f/0x1f50 kernel/locking/mutex.c:747
       snd_unregister_oss_device+0x97/0x290 sound/core/sound_oss.c:159
       snd_rawmidi_dev_disconnect+0x418/0x650 sound/core/rawmidi.c:2043
       __snd_device_disconnect.part.0+0x5b/0xc0 sound/core/device.c:63
       __snd_device_disconnect sound/core/device.c:61 [inline]
       snd_device_disconnect_all+0x9b/0xf0 sound/core/device.c:215
       snd_card_disconnect+0x306/0x740 sound/core/init.c:530
       snd_card_free_when_closed+0x13/0x50 sound/core/init.c:622
       f_midi_unbind+0x60/0x120 drivers/usb/gadget/function/f_midi.c:1335
       purge_configs_funcs+0x281/0x4e0 drivers/usb/gadget/configfs.c:1274
       configfs_composite_bind+0xbd3/0x11c0 drivers/usb/gadget/configfs.c:1426
       gadget_bind_driver+0x285/0x860 drivers/usb/gadget/udc/core.c:1495
       call_driver_probe drivers/base/dd.c:560 [inline]
       really_probe+0x249/0xa90 drivers/base/dd.c:639
       __driver_probe_device+0x1df/0x4d0 drivers/base/dd.c:778
       driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:808
       __driver_attach+0x1e6/0x420 drivers/base/dd.c:1190
       bus_for_each_dev+0x147/0x1d0 drivers/base/bus.c:301
       bus_add_driver+0x4c9/0x640 drivers/base/bus.c:618
       driver_register+0x1c4/0x330 drivers/base/driver.c:240
       usb_gadget_register_driver_owner+0xfb/0x1e0
drivers/usb/gadget/udc/core.c:1560
       gadget_dev_desc_UDC_store+0x184/0x220 drivers/usb/gadget/configfs.c:299
       flush_write_buffer fs/configfs/file.c:207 [inline]
       configfs_write_iter+0x2ea/0x480 fs/configfs/file.c:229
       call_write_iter include/linux/fs.h:2187 [inline]
       new_sync_write fs/read_write.c:491 [inline]
       vfs_write+0x9ca/0xd90 fs/read_write.c:578
       ksys_write+0x127/0x250 fs/read_write.c:631
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x35/0x80 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #1 (&rmidi->open_mutex){+.+.}-{3:3}:
       lock_acquire kernel/locking/lockdep.c:5666 [inline]
       lock_acquire+0x1ab/0x580 kernel/locking/lockdep.c:5631
       __mutex_lock_common kernel/locking/mutex.c:603 [inline]
       __mutex_lock+0x14f/0x1f50 kernel/locking/mutex.c:747
       snd_rawmidi_dev_disconnect+0x60/0x650 sound/core/rawmidi.c:2028
       __snd_device_disconnect.part.0+0x5b/0xc0 sound/core/device.c:63
       __snd_device_disconnect sound/core/device.c:61 [inline]
       snd_device_disconnect_all+0x9b/0xf0 sound/core/device.c:215
       snd_card_disconnect+0x306/0x740 sound/core/init.c:530
       snd_card_free_when_closed+0x13/0x50 sound/core/init.c:622
       f_midi_unbind+0x60/0x120 drivers/usb/gadget/function/f_midi.c:1335
       purge_configs_funcs+0x281/0x4e0 drivers/usb/gadget/configfs.c:1274
       configfs_composite_bind+0xbd3/0x11c0 drivers/usb/gadget/configfs.c:1426
       gadget_bind_driver+0x285/0x860 drivers/usb/gadget/udc/core.c:1495
       call_driver_probe drivers/base/dd.c:560 [inline]
       really_probe+0x249/0xa90 drivers/base/dd.c:639
       __driver_probe_device+0x1df/0x4d0 drivers/base/dd.c:778
       driver_probe_device+0x4c/0x1a0 drivers/base/dd.c:808
       __driver_attach+0x1e6/0x420 drivers/base/dd.c:1190
       bus_for_each_dev+0x147/0x1d0 drivers/base/bus.c:301
       bus_add_driver+0x4c9/0x640 drivers/base/bus.c:618
       driver_register+0x1c4/0x330 drivers/base/driver.c:240
       usb_gadget_register_driver_owner+0xfb/0x1e0
drivers/usb/gadget/udc/core.c:1560
       gadget_dev_desc_UDC_store+0x184/0x220 drivers/usb/gadget/configfs.c:299
       flush_write_buffer fs/configfs/file.c:207 [inline]
       configfs_write_iter+0x2ea/0x480 fs/configfs/file.c:229
       call_write_iter include/linux/fs.h:2187 [inline]
       new_sync_write fs/read_write.c:491 [inline]
       vfs_write+0x9ca/0xd90 fs/read_write.c:578
       ksys_write+0x127/0x250 fs/read_write.c:631
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x35/0x80 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #0 (register_mutex#5){+.+.}-{3:3}:
       check_prev_add+0x165/0x2520 kernel/locking/lockdep.c:3095
       check_prevs_add kernel/locking/lockdep.c:3214 [inline]
       validate_chain kernel/locking/lockdep.c:3829 [inline]
       __lock_acquire+0x2df7/0x5830 kernel/locking/lockdep.c:5053
       lock_acquire kernel/locking/lockdep.c:5666 [inline]
       lock_acquire+0x1ab/0x580 kernel/locking/lockdep.c:5631
       __mutex_lock_common kernel/locking/mutex.c:603 [inline]
       __mutex_lock+0x14f/0x1f50 kernel/locking/mutex.c:747
       snd_rawmidi_free+0x7a/0x190 sound/core/rawmidi.c:1902
       __snd_device_free+0x19f/0x230 sound/core/device.c:76
       snd_device_free_all+0xef/0x210 sound/core/device.c:233
       snd_card_do_free sound/core/init.c:591 [inline]
       release_card_device+0x70/0x200 sound/core/init.c:145
       device_release+0x9f/0x240 drivers/base/core.c:2330
       kobject_cleanup lib/kobject.c:673 [inline]
       kobject_release lib/kobject.c:704 [inline]
       kref_put include/linux/kref.h:65 [inline]
       kobject_put+0x1be/0x4c0 lib/kobject.c:721
       put_device+0x1b/0x30 drivers/base/core.c:3624
       klist_next+0x254/0x4a0 lib/klist.c:404
       class_dev_iter_next+0x83/0xc0 drivers/base/class.c:311
       class_find_device+0x144/0x220 drivers/base/class.c:415
       class_find_device_by_devt include/linux/device/class.h:167 [inline]
       device_destroy+0x79/0xd0 drivers/base/core.c:4299
       sound_remove_unit+0x13f/0x1f0 sound/sound_core.c:305
       snd_unregister_oss_device+0xe8/0x290 sound/core/sound_oss.c:165
       snd_mixer_oss_notify_handler+0x282/0x360 sound/core/oss/mixer_oss.c:1417
       snd_card_disconnect+0x2f9/0x740 sound/core/init.c:526
       usb_audio_disconnect+0x335/0x800 sound/usb/card.c:930
       usb_unbind_interface+0x1bd/0x890 drivers/usb/core/driver.c:458
       device_remove drivers/base/dd.c:550 [inline]
       device_remove+0x11f/0x170 drivers/base/dd.c:542
       __device_release_driver drivers/base/dd.c:1249 [inline]
       device_release_driver_internal+0x1a7/0x360 drivers/base/dd.c:1275
       bus_remove_device+0x2e3/0x590 drivers/base/bus.c:529
       device_del+0x5d2/0xe80 drivers/base/core.c:3704
       usb_disable_device+0x214/0x600 drivers/usb/core/message.c:1419
       usb_disconnect+0x285/0x860 drivers/usb/core/hub.c:2235
       hub_port_connect drivers/usb/core/hub.c:5197 [inline]
       hub_port_connect_change drivers/usb/core/hub.c:5497 [inline]
       port_event drivers/usb/core/hub.c:5653 [inline]
       hub_event+0x1c1b/0x4260 drivers/usb/core/hub.c:5735
       process_one_work+0x9c7/0x1650 kernel/workqueue.c:2289
       worker_thread+0x623/0x1070 kernel/workqueue.c:2436
       kthread+0x2e9/0x3a0 kernel/kthread.c:376
       ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306

other info that might help us debug this:

Chain exists of:
  register_mutex#5 --> &rmidi->open_mutex --> sound_oss_mutex

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(sound_oss_mutex);
                               lock(&rmidi->open_mutex);
                               lock(sound_oss_mutex);
  lock(register_mutex#5);

 *** DEADLOCK ***

7 locks held by kworker/1:7/10868:
 #0: ffff88801452b938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at:
arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
 #0: ffff88801452b938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at:
arch_atomic_long_set include/linux/atomic/atomic-long.h:41 [inline]
 #0: ffff88801452b938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at:
atomic_long_set include/linux/atomic/atomic-instrumented.h:1280
[inline]
 #0: ffff88801452b938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at:
set_work_data kernel/workqueue.c:636 [inline]
 #0: ffff88801452b938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at:
set_work_pool_and_clear_pending kernel/workqueue.c:663 [inline]
 #0: ffff88801452b938 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at:
process_one_work+0x8b0/0x1650 kernel/workqueue.c:2260
 #1: ffffc90018367db0 ((work_completion)(&hub->events)){+.+.}-{0:0},
at: process_one_work+0x8e4/0x1650 kernel/workqueue.c:2264
 #2: ffff8880164d2190 (&dev->mutex){....}-{3:3}, at: device_lock
include/linux/device.h:835 [inline]
 #2: ffff8880164d2190 (&dev->mutex){....}-{3:3}, at:
hub_event+0x1bc/0x4260 drivers/usb/core/hub.c:5681
 #3: ffff888047497190 (&dev->mutex){....}-{3:3}, at: device_lock
include/linux/device.h:835 [inline]
 #3: ffff888047497190 (&dev->mutex){....}-{3:3}, at:
usb_disconnect+0x95/0x860 drivers/usb/core/hub.c:2226
 #4: ffff888047493118 (&dev->mutex){....}-{3:3}, at:
device_release_driver_internal+0x23/0x360 drivers/base/dd.c:1272
 #5: ffffffff8e2e7f68 (register_mutex#7){+.+.}-{3:3}, at:
usb_audio_disconnect+0xe3/0x800 sound/usb/card.c:919
 #6: ffffffff8e274048 (sound_oss_mutex){+.+.}-{3:3}, at:
snd_unregister_oss_device+0x97/0x290 sound/core/sound_oss.c:159

stack backtrace:
CPU: 1 PID: 10868 Comm: kworker/1:7 Not tainted 6.0.0-rc4+ #20
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.13.0-1ubuntu1.1 04/01/2014
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 check_noncircular+0x26b/0x310 kernel/locking/lockdep.c:2175
 check_prev_add+0x165/0x2520 kernel/locking/lockdep.c:3095
 check_prevs_add kernel/locking/lockdep.c:3214 [inline]
 validate_chain kernel/locking/lockdep.c:3829 [inline]
 __lock_acquire+0x2df7/0x5830 kernel/locking/lockdep.c:5053
 lock_acquire kernel/locking/lockdep.c:5666 [inline]
 lock_acquire+0x1ab/0x580 kernel/locking/lockdep.c:5631
 __mutex_lock_common kernel/locking/mutex.c:603 [inline]
 __mutex_lock+0x14f/0x1f50 kernel/locking/mutex.c:747
 snd_rawmidi_free+0x7a/0x190 sound/core/rawmidi.c:1902
 __snd_device_free+0x19f/0x230 sound/core/device.c:76
 snd_device_free_all+0xef/0x210 sound/core/device.c:233
 snd_card_do_free sound/core/init.c:591 [inline]
 release_card_device+0x70/0x200 sound/core/init.c:145
 device_release+0x9f/0x240 drivers/base/core.c:2330
 kobject_cleanup lib/kobject.c:673 [inline]
 kobject_release lib/kobject.c:704 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1be/0x4c0 lib/kobject.c:721
 put_device+0x1b/0x30 drivers/base/core.c:3624
 klist_next+0x254/0x4a0 lib/klist.c:404
 class_dev_iter_next+0x83/0xc0 drivers/base/class.c:311
 class_find_device+0x144/0x220 drivers/base/class.c:415
 class_find_device_by_devt include/linux/device/class.h:167 [inline]
 device_destroy+0x79/0xd0 drivers/base/core.c:4299
 sound_remove_unit+0x13f/0x1f0 sound/sound_core.c:305
 snd_unregister_oss_device+0xe8/0x290 sound/core/sound_oss.c:165
 snd_mixer_oss_notify_handler+0x282/0x360 sound/core/oss/mixer_oss.c:1417
 snd_card_disconnect+0x2f9/0x740 sound/core/init.c:526
 usb_audio_disconnect+0x335/0x800 sound/usb/card.c:930
 usb_unbind_interface+0x1bd/0x890 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:550 [inline]
 device_remove+0x11f/0x170 drivers/base/dd.c:542
 __device_release_driver drivers/base/dd.c:1249 [inline]
 device_release_driver_internal+0x1a7/0x360 drivers/base/dd.c:1275
 bus_remove_device+0x2e3/0x590 drivers/base/bus.c:529
 device_del+0x5d2/0xe80 drivers/base/core.c:3704
 usb_disable_device+0x214/0x600 drivers/usb/core/message.c:1419
 usb_disconnect+0x285/0x860 drivers/usb/core/hub.c:2235
 hub_port_connect drivers/usb/core/hub.c:5197 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5497 [inline]
 port_event drivers/usb/core/hub.c:5653 [inline]
 hub_event+0x1c1b/0x4260 drivers/usb/core/hub.c:5735
 process_one_work+0x9c7/0x1650 kernel/workqueue.c:2289
 worker_thread+0x623/0x1070 kernel/workqueue.c:2436
 kthread+0x2e9/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306
 </TASK>
