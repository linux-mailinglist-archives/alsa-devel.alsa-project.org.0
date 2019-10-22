Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CD6E1138
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Oct 2019 06:51:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12D3E1616;
	Wed, 23 Oct 2019 06:50:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12D3E1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571806291;
	bh=cUp6EY0FORxtFetkpwaYmXZNZmC1ljvPCCBT1OgYSXw=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=REDN8Fy3gCXrm9Uccsdv3jwVWY3aHPXaPEIaonMPmhiIG7Z9QAT2xUdqiOChhL0XV
	 4F+ao1WFQGisblzgboq2vbZIleuOU/oR46xZp2U78q2wgUtM/1V4UMMLFQsrsYvT+O
	 zW+aaQ/QyLZqTID9MZqfMMn4paJq+XHTXBd917+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CE9CF805FC;
	Wed, 23 Oct 2019 06:48:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6663F8031A; Wed, 23 Oct 2019 00:44:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 764C6F80112
 for <alsa-devel@alsa-project.org>; Wed, 23 Oct 2019 00:44:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 764C6F80112
Received: by mail-il1-f200.google.com with SMTP id w9so10754514ilo.12
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 15:44:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=dvNgexL4MTfQfuzWCsSOBdjRrK9RO5oPSvx73xr85Bc=;
 b=Zzt3sQRn91etxdzYiPvI1OsZW4UAaOw4rWNX9keTGRyL2szDm2rdEnJIDiRFjbY6El
 xBmr7IAdBsk6gxueruagor7u/v+qMUU3Gfn9QaIw3qWsI4j39EuRQyBYBLeNoWhcZDLl
 SmUQoANstT7RBpRJrf7NWE6NcOBDnWeT2es/riYie3gZ7SgOZlSbTKQBWtHqo14MlpJQ
 Um/9NNPlF7d5H+ihUtINekytZZJAcPWG0eugLW1X9COANvVxPmkW++ktoPHzwJ4gEoZd
 ZhPJqYEU43zkA8PGoCGIRwK9K33bsEzwpopC3EOFAd1Iyza1y+2M+0JeJcxIbruKluLj
 AZgQ==
X-Gm-Message-State: APjAAAVbGy/Ecm9qUhsJvs2vR+9QMR0WEuHLi6mOUuKLvz42pp4o1tib
 QDHEoPnPO/3nu7oVhQaOkT/EkarZpjPI4UD8RcjXRdtgLJEY
X-Google-Smtp-Source: APXvYqyvIqFxbAMta15TN9O4BFvIhOHpmPLdzksoRW+V8gi4fHw+L83AcKp5mrhrZQQmmpax27S3jOc+csA8wbZxDiaGqbYVav0M
MIME-Version: 1.0
X-Received: by 2002:a92:b308:: with SMTP id p8mr33355252ilh.182.1571784251877; 
 Tue, 22 Oct 2019 15:44:11 -0700 (PDT)
Date: Tue, 22 Oct 2019 15:44:11 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ff32e605958789e2@google.com>
From: syzbot <syzbot+85f45d8bd343473faf15@syzkaller.appspotmail.com>
To: allison@lohutok.net, alsa-devel@alsa-project.org, benquike@gmail.com, 
 dan.carpenter@oracle.com, g@b4.vu, glider@google.com, 
 linux-kernel@vger.kernel.org, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
 tglx@linutronix.de, tiwai@suse.com, wang6495@umn.edu
X-Mailman-Approved-At: Wed, 23 Oct 2019 06:48:10 +0200
Subject: [alsa-devel] KMSAN: uninit-value in build_audio_procunit
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

HEAD commit:    3c8ca708 test_kmsan.c: fix SPDX comment
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=133fb3cf600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c07a3d4f8a59e198
dashboard link: https://syzkaller.appspot.com/bug?extid=85f45d8bd343473faf15
compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
80fee25776c2fb61e74c1ecb1a523375c2500b69)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12201cef600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1281b8ff600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+85f45d8bd343473faf15@syzkaller.appspotmail.com

usb 1-1: New USB device found, idVendor=1d6b, idProduct=0101, bcdDevice=  
0.40
usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 1-1: Product: syz
usb 1-1: Manufacturer: syz
usb 1-1: SerialNumber: syz
=====================================================
BUG: KMSAN: uninit-value in build_audio_procunit+0x1be8/0x2490  
sound/usb/mixer.c:2438
CPU: 1 PID: 3381 Comm: kworker/1:2 Not tainted 5.4.0-rc3+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x191/0x1f0 lib/dump_stack.c:113
  kmsan_report+0x14a/0x2f0 mm/kmsan/kmsan_report.c:110
  __msan_warning+0x73/0xf0 mm/kmsan/kmsan_instr.c:245
  build_audio_procunit+0x1be8/0x2490 sound/usb/mixer.c:2438
  parse_audio_unit+0x115c/0x7490 sound/usb/mixer.c:2483
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
  kmsan_internal_poison_shadow+0x60/0x110 mm/kmsan/kmsan.c:134
  kmsan_slab_alloc+0xaa/0x130 mm/kmsan/kmsan_hooks.c:88
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
