Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD99333A0C
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 11:31:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D6D91775;
	Wed, 10 Mar 2021 11:31:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D6D91775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615372311;
	bh=yHtCGqD7st3nAXlFDP7MmQ6wW7pwguTGtq2B8Z9M3fk=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IsMC0ecV3pEHBIGmm8GGC7NdaSUM63Mdx/J9t7ZxBNvldSGfrLeJKFTs4hu4hLslg
	 dWdNsIFWbt6XbSuEsAnswFapZeQdE1GY5dfo/coMhq0k4iIEGUs00fkQ8bl+QRIpdJ
	 6rPsXCdqIy/9CzJZyPd88p7AkPp83C+ZNQCAtC2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAD14F801ED;
	Wed, 10 Mar 2021 11:30:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AAFFF80227; Tue,  9 Mar 2021 12:32:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,SORTED_RECIPS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D171EF80166
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 12:32:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D171EF80166
Received: by mail-io1-f70.google.com with SMTP id y2so9904858ioa.23
 for <alsa-devel@alsa-project.org>; Tue, 09 Mar 2021 03:32:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=lFzSQp5VrURrym4BC8pY1YwVtqSPyvjcmQW9Blx36ug=;
 b=pjysg8gxQ+rD0Hr/HyF8F920FTuMO9ysshoIK9ScUrhgrkIZhoCpbBmznlZ2gZ3sWq
 /GOgN6C0BlCZQz/Oj1qox4/mrkcap/sNrKqqEsMavhGIeoFeoev07YOffxjYdHH6ISkc
 ZM9iGqUiyZSbYUvUpJNv3UbTBc+cxQQd+f8LKUxQvOpmL+bzKZbBivsVDPy2KJv6JhtN
 nzpzW4e1R9JzRWHmQ+a09On62yPtyyzNFhJF1OXj/l7Cn9PlRIobE+v4QK1q8rssS2nw
 hzpUvf1VaLFFiZPzlQ3VSSSmr50LID2/Pbfwo25nO8qpkhur+kmFC6rtFzTXYsgHLbqC
 V72A==
X-Gm-Message-State: AOAM532akswpJS2IC70PHzQ6h17Nq94sV/qtBK7aHA1Dsc9Fj2NQ3q4L
 l1L9uP3mDtGzUZXJ5KW4cy1rEOri/Fr3gBYzK9MUFeKie9dX
X-Google-Smtp-Source: ABdhPJyqlX3cxfemDOCpIh/zdkuVGPIqPIjJoL76reGlLHqmNds+OnQE/Ts2JzTi8SVyDcoDKf0PTmRIGUbV13w2AbsUtN7mOBxw
MIME-Version: 1.0
X-Received: by 2002:a92:c149:: with SMTP id b9mr23020829ilh.133.1615289538148; 
 Tue, 09 Mar 2021 03:32:18 -0800 (PST)
Date: Tue, 09 Mar 2021 03:32:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000217e4d05bd18e750@google.com>
Subject: [syzbot] KASAN: use-after-free Read in usb_audio_disconnect
From: syzbot <syzbot+ffad4c74b3b3ea3aa9c3@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, kai.heng.feng@canonical.com, 
 linux-kernel@vger.kernel.org, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
 tiwai@suse.com, tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 10 Mar 2021 11:30:11 +0100
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

HEAD commit:    4641b323 Add linux-next specific files for 20210305
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=103252ead00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b87b6a083d302a90
dashboard link: https://syzkaller.appspot.com/bug?extid=ffad4c74b3b3ea3aa9c3
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1122d35cd00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17f6476cd00000

The issue was bisected to:

commit 9799110825dba087c2bdce886977cf84dada2005
Author: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date:   Thu Mar 4 04:34:16 2021 +0000

    ALSA: usb-audio: Disable USB autosuspend properly in setup_disable_autosuspend()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=166d91ead00000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=156d91ead00000
console output: https://syzkaller.appspot.com/x/log.txt?x=116d91ead00000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ffad4c74b3b3ea3aa9c3@syzkaller.appspotmail.com
Fixes: 9799110825db ("ALSA: usb-audio: Disable USB autosuspend properly in setup_disable_autosuspend()")

usb 1-1: USB disconnect, device number 2
==================================================================
BUG: KASAN: use-after-free in usb_audio_disconnect+0x750/0x800 sound/usb/card.c:918
Read of size 2 at addr ffff888027a08f24 by task kworker/0:2/2966

CPU: 0 PID: 2966 Comm: kworker/0:2 Not tainted 5.12.0-rc1-next-20210305-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0xfa/0x151 lib/dump_stack.c:120
 print_address_description.constprop.0.cold+0x5b/0x2f8 mm/kasan/report.c:232
 __kasan_report mm/kasan/report.c:399 [inline]
 kasan_report.cold+0x7c/0xd8 mm/kasan/report.c:416
 usb_audio_disconnect+0x750/0x800 sound/usb/card.c:918
 usb_unbind_interface+0x1d8/0x8d0 drivers/usb/core/driver.c:458
 __device_release_driver+0x3bd/0x6f0 drivers/base/dd.c:1156
 device_release_driver_internal drivers/base/dd.c:1187 [inline]
 device_release_driver+0x26/0x40 drivers/base/dd.c:1210
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:533
 device_del+0x502/0xd40 drivers/base/core.c:3421
 usb_disable_device+0x35b/0x7b0 drivers/usb/core/message.c:1413
 usb_disconnect.cold+0x27d/0x791 drivers/usb/core/hub.c:2218
 hub_port_connect drivers/usb/core/hub.c:5074 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5363 [inline]
 port_event drivers/usb/core/hub.c:5509 [inline]
 hub_event+0x1c9c/0x4320 drivers/usb/core/hub.c:5591
 process_one_work+0x98d/0x1600 kernel/workqueue.c:2275
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2421
 kthread+0x3b1/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294

Allocated by task 5:
 kasan_save_stack+0x1b/0x40 mm/kasan/common.c:38
 kasan_set_track mm/kasan/common.c:46 [inline]
 set_alloc_info mm/kasan/common.c:427 [inline]
 ____kasan_kmalloc mm/kasan/common.c:506 [inline]
 ____kasan_kmalloc mm/kasan/common.c:465 [inline]
 __kasan_kmalloc+0x99/0xc0 mm/kasan/common.c:515
 kmalloc include/linux/slab.h:561 [inline]
 kzalloc include/linux/slab.h:686 [inline]
 snd_card_new+0xc2/0xcb0 sound/core/init.c:176
 snd_usb_audio_create sound/usb/card.c:588 [inline]
 usb_audio_probe+0x1547/0x2c70 sound/usb/card.c:755
 usb_probe_interface+0x315/0x7f0 drivers/usb/core/driver.c:396
 really_probe+0x291/0xe60 drivers/base/dd.c:554
 driver_probe_device+0x26b/0x3d0 drivers/base/dd.c:740
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:846
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:431
 __device_attach+0x228/0x4a0 drivers/base/dd.c:914
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0xbdb/0x1db0 drivers/base/core.c:3242
 usb_set_configuration+0x113f/0x1910 drivers/usb/core/message.c:2164
 usb_generic_driver_probe+0xba/0x100 drivers/usb/core/generic.c:238
 usb_probe_device+0xd9/0x2c0 drivers/usb/core/driver.c:293
 really_probe+0x291/0xe60 drivers/base/dd.c:554
 driver_probe_device+0x26b/0x3d0 drivers/base/dd.c:740
 __device_attach_driver+0x1d1/0x290 drivers/base/dd.c:846
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:431
 __device_attach+0x228/0x4a0 drivers/base/dd.c:914
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0xbdb/0x1db0 drivers/base/core.c:3242
 usb_new_device.cold+0x721/0x1058 drivers/usb/core/hub.c:2555
 hub_port_connect drivers/usb/core/hub.c:5223 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5363 [inline]
 port_event drivers/usb/core/hub.c:5509 [inline]
 hub_event+0x2357/0x4320 drivers/usb/core/hub.c:5591
 process_one_work+0x98d/0x1600 kernel/workqueue.c:2275
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2421
 kthread+0x3b1/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294

Freed by task 2966:
 kasan_save_stack+0x1b/0x40 mm/kasan/common.c:38
 kasan_set_track+0x1c/0x30 mm/kasan/common.c:46
 kasan_set_free_info+0x20/0x30 mm/kasan/generic.c:357
 ____kasan_slab_free mm/kasan/common.c:360 [inline]
 ____kasan_slab_free mm/kasan/common.c:325 [inline]
 __kasan_slab_free+0xf5/0x130 mm/kasan/common.c:367
 kasan_slab_free include/linux/kasan.h:199 [inline]
 slab_free_hook mm/slub.c:1562 [inline]
 slab_free_freelist_hook+0x72/0x1b0 mm/slub.c:1600
 slab_free mm/slub.c:3161 [inline]
 kfree+0xe5/0x7b0 mm/slub.c:4215
 device_release+0x9f/0x240 drivers/base/core.c:2108
 kobject_cleanup lib/kobject.c:705 [inline]
 kobject_release lib/kobject.c:736 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1c8/0x540 lib/kobject.c:753
 put_device+0x1b/0x30 drivers/base/core.c:3341
 snd_card_free_when_closed+0x35/0x50 sound/core/init.c:518
 usb_audio_disconnect+0x2ba/0x800 sound/usb/card.c:913
 usb_unbind_interface+0x1d8/0x8d0 drivers/usb/core/driver.c:458
 __device_release_driver+0x3bd/0x6f0 drivers/base/dd.c:1156
 device_release_driver_internal drivers/base/dd.c:1187 [inline]
 device_release_driver+0x26/0x40 drivers/base/dd.c:1210
 bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:533
 device_del+0x502/0xd40 drivers/base/core.c:3421
 usb_disable_device+0x35b/0x7b0 drivers/usb/core/message.c:1413
 usb_disconnect.cold+0x27d/0x791 drivers/usb/core/hub.c:2218
 hub_port_connect drivers/usb/core/hub.c:5074 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5363 [inline]
 port_event drivers/usb/core/hub.c:5509 [inline]
 hub_event+0x1c9c/0x4320 drivers/usb/core/hub.c:5591
 process_one_work+0x98d/0x1600 kernel/workqueue.c:2275
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2421
 kthread+0x3b1/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294

The buggy address belongs to the object at ffff888027a08000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 3876 bytes inside of
 8192-byte region [ffff888027a08000, ffff888027a0a000)
The buggy address belongs to the page:
page:0000000024fc4526 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x27a08
head:0000000024fc4526 order:3 compound_mapcount:0 compound_pincount:0
flags: 0xfff00000010200(slab|head)
raw: 00fff00000010200 dead000000000100 dead000000000122 ffff888010842280
raw: 0000000000000000 0000000000020002 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff888027a08e00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888027a08e80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888027a08f00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                               ^
 ffff888027a08f80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888027a09000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
