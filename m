Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3830FE087F
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 18:17:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1B6D1670;
	Tue, 22 Oct 2019 18:16:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1B6D1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571761039;
	bh=skxKiWBOmHtnXs8gyMOXjlKT54D0EcrfqaAunRtBCvU=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KRvoVvYdERP+c9eMau14EfKvAicjfQ/0s9QqhF40SEulc6rZddtv/9CPSoWf/kNUk
	 AfQfML/ybkzY5FiFsmFurautFcWvsQbhDYmSCETZ9CdxqTyHdkr4zpoksDLjlc6zN1
	 D7oSNIr4+YPAQBTeJ/dCkHpXQbwlgO8zWBYU2U6k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55D37F80610;
	Tue, 22 Oct 2019 18:14:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED0ADF8031A; Tue, 22 Oct 2019 16:54:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66885F800C0
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 16:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66885F800C0
Received: by mail-io1-f72.google.com with SMTP id r5so20418445iop.2
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 07:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=/l4YRohPu2U+waow0rajZOPTsLqoJy+OFJYokmx4Ib4=;
 b=frv2KzYteFtl455k7WzQhdRo5ApVoHJVppxDuM4qfs8p2/g+1MdRwG9o9XZE+SDqeY
 4BjvqMa0qtoQE5T0CdOSen3ShL3AJMgxdqflDobm2sHxA+m3TCiuf3K/5OZyaAPB/KB2
 V9VkB7Y4NuO28hdGT7bfBM6f4TrLpdogMPnlBUr+uzh0dVdu9Kuj0OnZvqla/QEf/YqX
 4jSHuRzC9oGWv2ulBBsYrrGIcucydOLPfXqbHOd65dfrN0m9edNRyFEosrVq6hpYdnrr
 DJXBQhoTB/3guhnB61SratvoGzDQ1aPfhtlGkNrVJ8u6pmZnvaYUgvkOsFAvqhoBKxB9
 iqkg==
X-Gm-Message-State: APjAAAWaZObn5z/k4RBSj+uaOmjcsREyXuEpHKvkxQmjMdwRJVKOJuws
 AT9cmhEu4XDRce/2o91WIssCVoTDZ01O4x3ZF+q3y3VWZhY2
X-Google-Smtp-Source: APXvYqzzv3pjOV43MjYcorPKwPet1xJDCOz1ge/ruZ+9pJYbuYMJDRlEV36mejfnRULOhLbo61vcJTf/pg638GYdD0Zk2E6KnKXn
MIME-Version: 1.0
X-Received: by 2002:a05:6638:632:: with SMTP id
 h18mr4120087jar.55.1571756047286; 
 Tue, 22 Oct 2019 07:54:07 -0700 (PDT)
Date: Tue, 22 Oct 2019 07:54:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000df5189059580f8e9@google.com>
From: syzbot <syzbot+0620f79a1978b1133fd7@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, andreyknvl@google.com, benquike@gmail.com, 
 dan.carpenter@oracle.com, g@b4.vu, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, perex@perex.cz, rfontana@redhat.com, 
 syzkaller-bugs@googlegroups.com, tiwai@suse.com, yuehaibing@huawei.com
X-Mailman-Approved-At: Tue, 22 Oct 2019 18:14:15 +0200
Subject: [alsa-devel] KASAN: slab-out-of-bounds Read in build_audio_procunit
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

HEAD commit:    22be26f7 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=103893cf600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=387eccb7ac68ec5
dashboard link: https://syzkaller.appspot.com/bug?extid=0620f79a1978b1133fd7
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16fd6a40e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1033215f600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+0620f79a1978b1133fd7@syzkaller.appspotmail.com

usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 1-1: Product: syz
usb 1-1: Manufacturer: syz
usb 1-1: SerialNumber: syz
==================================================================
BUG: KASAN: slab-out-of-bounds in uac_processing_unit_iProcessing  
include/uapi/linux/usb/audio.h:429 [inline]
BUG: KASAN: slab-out-of-bounds in build_audio_procunit+0x1306/0x13f0  
sound/usb/mixer.c:2436
Read of size 1 at addr ffff8881d537c7b7 by task kworker/0:2/101

CPU: 0 PID: 101 Comm: kworker/0:2 Not tainted 5.4.0-rc3+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description.constprop.0+0x36/0x50 mm/kasan/report.c:374
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:506
  kasan_report+0xe/0x20 mm/kasan/common.c:634
  uac_processing_unit_iProcessing include/uapi/linux/usb/audio.h:429 [inline]
  build_audio_procunit+0x1306/0x13f0 sound/usb/mixer.c:2436
  parse_audio_processing_unit sound/usb/mixer.c:2468 [inline]
  parse_audio_unit+0x17e9/0x36f0 sound/usb/mixer.c:2757
  snd_usb_mixer_controls+0x715/0xb90 sound/usb/mixer.c:3095
  snd_usb_create_mixer+0x2b5/0x1890 sound/usb/mixer.c:3445
  usb_audio_probe+0xc76/0x2010 sound/usb/card.c:653
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2201
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2201
  usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5183 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5323 [inline]
  port_event drivers/usb/core/hub.c:5469 [inline]
  hub_event+0x1dd0/0x37e0 drivers/usb/core/hub.c:5551
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Allocated by task 101:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  __kasan_kmalloc mm/kasan/common.c:510 [inline]
  __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:483
  kmalloc include/linux/slab.h:561 [inline]
  usb_get_configuration+0x314/0x3050 drivers/usb/core/config.c:857
  usb_enumerate_device drivers/usb/core/hub.c:2369 [inline]
  usb_new_device+0xd3/0x160 drivers/usb/core/hub.c:2505
  hub_port_connect drivers/usb/core/hub.c:5183 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5323 [inline]
  port_event drivers/usb/core/hub.c:5469 [inline]
  hub_event+0x1dd0/0x37e0 drivers/usb/core/hub.c:5551
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

Freed by task 17:
  save_stack+0x1b/0x80 mm/kasan/common.c:69
  set_track mm/kasan/common.c:77 [inline]
  kasan_set_free_info mm/kasan/common.c:332 [inline]
  __kasan_slab_free+0x130/0x180 mm/kasan/common.c:471
  slab_free_hook mm/slub.c:1424 [inline]
  slab_free_freelist_hook mm/slub.c:1475 [inline]
  slab_free mm/slub.c:3018 [inline]
  kfree+0xe4/0x320 mm/slub.c:3967
  urb_destroy drivers/usb/core/urb.c:26 [inline]
  kref_put include/linux/kref.h:65 [inline]
  usb_free_urb.part.0+0x7a/0xc0 drivers/usb/core/urb.c:95
  usb_free_urb+0x1b/0x30 drivers/usb/core/urb.c:94
  usb_start_wait_urb+0x1e5/0x2b0 drivers/usb/core/message.c:79
  usb_internal_control_msg drivers/usb/core/message.c:101 [inline]
  usb_control_msg+0x31c/0x4a0 drivers/usb/core/message.c:152
  get_port_status drivers/usb/core/hub.c:569 [inline]
  hub_ext_port_status+0x125/0x460 drivers/usb/core/hub.c:586
  hub_port_status drivers/usb/core/hub.c:608 [inline]
  hub_activate+0x497/0x1570 drivers/usb/core/hub.c:1111
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352

The buggy address belongs to the object at ffff8881d537c700
  which belongs to the cache kmalloc-192 of size 192
The buggy address is located 183 bytes inside of
  192-byte region [ffff8881d537c700, ffff8881d537c7c0)
The buggy address belongs to the page:
page:ffffea000754df00 refcount:1 mapcount:0 mapping:ffff8881da002a00  
index:0x0
flags: 0x200000000000200(slab)
raw: 0200000000000200 ffffea000754d680 0000000600000006 ffff8881da002a00
raw: 0000000000000000 0000000000100010 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
  ffff8881d537c680: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
  ffff8881d537c700: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> ffff8881d537c780: 00 00 00 02 fc fc fc fc fc fc fc fc fc fc fc fc
                                      ^
  ffff8881d537c800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
  ffff8881d537c880: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
