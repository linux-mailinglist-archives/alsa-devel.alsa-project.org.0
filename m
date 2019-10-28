Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F32AE727B
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 14:16:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07DF01F05;
	Mon, 28 Oct 2019 14:15:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07DF01F05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572268562;
	bh=ulb9LlnrM+ElAPBpDmPGZyxrSoGf9b1ds4kAzit+ksg=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XEF6IxYm7WfpLL5QDcxpfns4OGDMr/OCEB4fpdlMmqPcaO4TjEsFtL9Wlyh9B80js
	 keWTJKgLOSQf+Aa9tmNc8n+DiEntp0Vtfm9IU0u8T03dfa2y2ST92P9JRvg9CvClKI
	 Qt4snHidT8j73apRwdP/izBP/LFRqzdVRL/aYCw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BA2DF805AE;
	Mon, 28 Oct 2019 14:13:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB1BEF80361; Mon, 28 Oct 2019 11:32:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ****
X-Spam-Status: No, score=4.1 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC154F800E7
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 11:32:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC154F800E7
Received: by mail-io1-f72.google.com with SMTP id r84so7989909ior.14
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 03:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=hJSzb7bWJAvhaZjkw4DBBAd/7CIOcLR09vzgtA5ipIE=;
 b=RrpkpvzrCn8LcNGVUTjTj1smMpPFxqB39b32cmPD5EX8el/ZCc6BYPd/Q+RF9Z+8On
 LVw8eRUwb8wnvhpnODenSDSDD0d1V9TDu8vOx33pjahRLNb3yDHS2OwCu9cxixCqhuzh
 VYpy5TEepSLvilMfYF9pwVdZoWXEh3Urp5tveuVPzcTXeai2l0m/zQ/S6HkZB2mHnHxo
 h3zQKpGZJVXjilWoqn6GghmZIzgHSexJ29xtI4gPoRrgLOoQnBQ/MmLi/tVFtVO5VbHP
 yi/QUm5ATzXr2BvYilt5+9RoNJw9DEAaZHIjiagE7eYUhehZGWRA2rMWL22sy+IZu7cx
 NKgQ==
X-Gm-Message-State: APjAAAVL5Zedn6OYV0hb/GorY+LlYFwPaUqhKhtPERPp+hIyHYt1Qcut
 eopAXtSip0l9S1Z6Sm5aETln0rqXsrxqJqQdi6oixglHqJ+q
X-Google-Smtp-Source: APXvYqznxlbZDdahJdmyIZekbwl12dJv2b3+PfVJxCfyOFx4Xhj0xpqEuav6W7NGB3vzQuiUpe//lF3ayZsl8tFHNxRFSqebwolj
MIME-Version: 1.0
X-Received: by 2002:a92:889c:: with SMTP id m28mr19001304ilh.157.1572258727864; 
 Mon, 28 Oct 2019 03:32:07 -0700 (PDT)
Date: Mon, 28 Oct 2019 03:32:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f838060595f602a7@google.com>
From: syzbot <syzbot+8f2612936028bfd28f28@syzkaller.appspotmail.com>
To: allison@lohutok.net, alsa-devel@alsa-project.org, benquike@gmail.com, 
 dan.carpenter@oracle.com, glider@google.com, gregkh@linuxfoundation.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
 tglx@linutronix.de, tiwai@suse.com, wang6495@umn.edu, yuehaibing@huawei.com
X-Mailman-Approved-At: Mon, 28 Oct 2019 14:13:37 +0100
Subject: [alsa-devel] KMSAN: uninit-value in get_term_name
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

HEAD commit:    d86c1556 kmsan: add printk_test()
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=16c4ef54e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c07a3d4f8a59e198
dashboard link: https://syzkaller.appspot.com/bug?extid=8f2612936028bfd28f28
compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
80fee25776c2fb61e74c1ecb1a523375c2500b69)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11b96c4ce00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11a51ca8e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+8f2612936028bfd28f28@syzkaller.appspotmail.com

usb 1-1: New USB device found, idVendor=1d6b, idProduct=0101, bcdDevice=  
0.40
usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 1-1: Product: syz
usb 1-1: Manufacturer: syz
usb 1-1: SerialNumber: syz
=====================================================
BUG: KMSAN: uninit-value in get_term_name+0x1b7/0xad0 sound/usb/mixer.c:652
CPU: 1 PID: 30 Comm: kworker/1:1 Not tainted 5.4.0-rc3+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x191/0x1f0 lib/dump_stack.c:113
  kmsan_report+0x128/0x220 mm/kmsan/kmsan_report.c:108
  __msan_warning+0x73/0xe0 mm/kmsan/kmsan_instr.c:245
  get_term_name+0x1b7/0xad0 sound/usb/mixer.c:652
  __build_feature_ctl+0x11f1/0x29e0 sound/usb/mixer.c:1628
  build_feature_ctl sound/usb/mixer.c:1709 [inline]
  parse_audio_feature_unit sound/usb/mixer.c:1921 [inline]
  parse_audio_unit+0x2308/0x7490 sound/usb/mixer.c:2753
  snd_usb_mixer_controls sound/usb/mixer.c:3095 [inline]
  snd_usb_create_mixer+0x1d7c/0x4070 sound/usb/mixer.c:3445
  usb_audio_probe+0x286b/0x3eb0 sound/usb/card.c:653
  usb_probe_interface+0xd19/0x1310 drivers/usb/core/driver.c:361
  really_probe+0xd91/0x1f90 drivers/base/dd.c:552
  driver_probe_device+0x1ba/0x510 drivers/base/dd.c:721
  __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:828
  bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:430
  __device_attach+0x489/0x750 drivers/base/dd.c:894
  device_initial_probe+0x4a/0x60 drivers/base/dd.c:941
  bus_probe_device+0x131/0x390 drivers/base/bus.c:490
  device_add+0x25b5/0x2df0 drivers/base/core.c:2201
  usb_set_configuration+0x309f/0x3710 drivers/usb/core/message.c:2027
  generic_probe+0xe7/0x280 drivers/usb/core/generic.c:210
  usb_probe_device+0x146/0x200 drivers/usb/core/driver.c:266
  really_probe+0xd91/0x1f90 drivers/base/dd.c:552
  driver_probe_device+0x1ba/0x510 drivers/base/dd.c:721
  __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:828
  bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:430
  __device_attach+0x489/0x750 drivers/base/dd.c:894
  device_initial_probe+0x4a/0x60 drivers/base/dd.c:941
  bus_probe_device+0x131/0x390 drivers/base/bus.c:490
  device_add+0x25b5/0x2df0 drivers/base/core.c:2201
  usb_new_device+0x23e5/0x2fb0 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x581d/0x72f0 drivers/usb/core/hub.c:5441
  process_one_work+0x1572/0x1ef0 kernel/workqueue.c:2269
  worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
  kthread+0x4b5/0x4f0 kernel/kthread.c:256
  ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355

Uninit was stored to memory at:
  kmsan_save_stack_with_flags mm/kmsan/kmsan.c:151 [inline]
  kmsan_internal_chain_origin+0xbd/0x180 mm/kmsan/kmsan.c:319
  __msan_chain_origin+0x6b/0xd0 mm/kmsan/kmsan_instr.c:179
  parse_term_proc_unit+0x73d/0x7e0 sound/usb/mixer.c:896
  __check_input_term+0x13ef/0x2360 sound/usb/mixer.c:989
  check_input_term sound/usb/mixer.c:1008 [inline]
  parse_audio_feature_unit sound/usb/mixer.c:1875 [inline]
  parse_audio_unit+0x1478/0x7490 sound/usb/mixer.c:2753
  snd_usb_mixer_controls sound/usb/mixer.c:3095 [inline]
  snd_usb_create_mixer+0x1d7c/0x4070 sound/usb/mixer.c:3445
  usb_audio_probe+0x286b/0x3eb0 sound/usb/card.c:653
  usb_probe_interface+0xd19/0x1310 drivers/usb/core/driver.c:361
  really_probe+0xd91/0x1f90 drivers/base/dd.c:552
  driver_probe_device+0x1ba/0x510 drivers/base/dd.c:721
  __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:828
  bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:430
  __device_attach+0x489/0x750 drivers/base/dd.c:894
  device_initial_probe+0x4a/0x60 drivers/base/dd.c:941
  bus_probe_device+0x131/0x390 drivers/base/bus.c:490
  device_add+0x25b5/0x2df0 drivers/base/core.c:2201
  usb_set_configuration+0x309f/0x3710 drivers/usb/core/message.c:2027
  generic_probe+0xe7/0x280 drivers/usb/core/generic.c:210
  usb_probe_device+0x146/0x200 drivers/usb/core/driver.c:266
  really_probe+0xd91/0x1f90 drivers/base/dd.c:552
  driver_probe_device+0x1ba/0x510 drivers/base/dd.c:721
  __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:828
  bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:430
  __device_attach+0x489/0x750 drivers/base/dd.c:894
  device_initial_probe+0x4a/0x60 drivers/base/dd.c:941
  bus_probe_device+0x131/0x390 drivers/base/bus.c:490
  device_add+0x25b5/0x2df0 drivers/base/core.c:2201
  usb_new_device+0x23e5/0x2fb0 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x581d/0x72f0 drivers/usb/core/hub.c:5441
  process_one_work+0x1572/0x1ef0 kernel/workqueue.c:2269
  worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
  kthread+0x4b5/0x4f0 kernel/kthread.c:256
  ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355

Uninit was created at:
  kmsan_save_stack_with_flags mm/kmsan/kmsan.c:151 [inline]
  kmsan_internal_poison_shadow+0x60/0x120 mm/kmsan/kmsan.c:134
  kmsan_slab_alloc+0xaa/0x120 mm/kmsan/kmsan_hooks.c:88
  slab_alloc_node mm/slub.c:2792 [inline]
  slab_alloc mm/slub.c:2801 [inline]
  __kmalloc+0x28e/0x430 mm/slub.c:3832
  kmalloc include/linux/slab.h:561 [inline]
  usb_get_configuration+0x50d/0x76a0 drivers/usb/core/config.c:857
  usb_enumerate_device drivers/usb/core/hub.c:2369 [inline]
  usb_new_device+0x224/0x2fb0 drivers/usb/core/hub.c:2505
  hub_port_connect drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x581d/0x72f0 drivers/usb/core/hub.c:5441
  process_one_work+0x1572/0x1ef0 kernel/workqueue.c:2269
  worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
  kthread+0x4b5/0x4f0 kernel/kthread.c:256
  ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355
=====================================================


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
