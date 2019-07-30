Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 726297A549
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 11:57:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 100F31885;
	Tue, 30 Jul 2019 11:56:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 100F31885
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564480638;
	bh=f9VMQOw3bI9Jj4TCrhrr9t9WxCNkq/gfdup7PhBKFs8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gvXRhjecmJH5mV0017JVtD1WLK+ZdWHf8ce68aNyIHKiCYvLshaTRfzfntEdDhiFk
	 itoduu1NCa0cUYdZAMt2nI7qP8GpUh8lZkqcIYSIXue9VXDSK15gG7+5xonV5ydaM1
	 IPINlv5mllcPUAKm5mBQqbxD9BeoWbOZ1uiYQwCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48A63F80C87;
	Tue, 30 Jul 2019 11:32:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA274F804CA; Tue, 30 Jul 2019 11:24:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FREEMAIL_FROM,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail3-162.sinamail.sina.com.cn (mail3-162.sinamail.sina.com.cn
 [202.108.3.162]) by alsa1.perex.cz (Postfix) with SMTP id DA296F800AB
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 11:24:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA296F800AB
Received: from unknown (HELO localhost.localdomain)([222.131.77.31])
 by sina.com with ESMTP
 id 5D400CDE00005330; Tue, 30 Jul 2019 17:24:48 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 10809630413314
From: Hillf Danton <hdanton@sina.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.com
Date: Tue, 30 Jul 2019 17:24:36 +0800
Message-Id: <20190730092436.232-1-hdanton@sina.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 30 Jul 2019 11:31:28 +0200
Cc: gregkh@linuxfoundation.org, Hillf Danton <dhanton@sina.com>,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, Andrey Konovalov <andreyknvl@google.com>,
 syzbot <syzbot+d59c4387bfb6eced94e2@syzkaller.appspotmail.com>
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: Fix gpf in
	snd_usb_pipe_sanity_check
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


syzbot found the following crash on:

HEAD commit:    7f7867ff usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=12befdc8600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
dashboard link: https://syzkaller.appspot.com/bug?extid=d59c4387bfb6eced94e2
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16efc49fa00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13245854600000

usb 1-1: New USB device found, idVendor=07fd, idProduct=0004, bcdDevice=d5.ac
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
usb 1-1: string descriptor 0 read error: -71
usb 1-1: Waiting for MOTU Microbook II to boot up...
kasan: CONFIG_KASAN_INLINE enabled
kasan: GPF could be caused by NULL-ptr deref or user memory access
general protection fault: 0000 [#1] SMP KASAN
CPU: 1 PID: 21 Comm: kworker/1:1 Not tainted 5.3.0-rc2+ #23
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
RIP: 0010:snd_usb_pipe_sanity_check+0x80/0x130 sound/usb/helper.c:75
Code: 48 c1 ea 03 80 3c 02 00 0f 85 b3 00 00 00 48 8b 6d 00 c1 eb 1e 48 b8  
00 00 00 00 00 fc ff df 48 8d 7d 03 48 89 fa 48 c1 ea 03 <0f> b6 04 02 48  
89 fa 83 e2 07 38 d0 7f 04 84 c0 75 7b 48 b8 00 00
RSP: 0018:ffff8881da2f7010 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: 0000000000000001 RCX: ffffffff8484d252
RDX: 0000000000000000 RSI: ffffffff8484d26c RDI: 0000000000000003
RBP: 0000000000000000 R08: ffff8881da22e000 R09: ffffed103b665d58
R10: ffffed103b665d57 R11: ffff8881db32eabf R12: 0000000000000000
R13: ffff8881d400ba80 R14: 1ffff1103b45ee06 R15: ffff8881c79244a0
FS:  0000000000000000(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f31b2a87000 CR3: 00000001d3fd4000 CR4: 00000000001406e0
Call Trace:
  snd_usb_motu_microbookii_communicate.constprop.0+0xa0/0x2fb  sound/usb/quirks.c:1007
  snd_usb_motu_microbookii_boot_quirk sound/usb/quirks.c:1051 [inline]
  snd_usb_apply_boot_quirk.cold+0x163/0x370 sound/usb/quirks.c:1280
  usb_audio_probe+0x2ec/0x2010 sound/usb/card.c:576
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x650 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
  bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:882
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2114
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x650 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
  bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:882
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2114
  usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Modules linked in:
[ end trace 41e8577a8c48635e ]

It was introduced in commit 801ebf1043ae for checking pipe and endpoint
types. It is fixed by adding a check of the ep pointer in question.

Reported-by: syzbot <syzbot+d59c4387bfb6eced94e2@syzkaller.appspotmail.com>
Fixes: commit 801ebf1043ae ("ALSA: usb-audio: Sanity checks for each pipe and EP types")
Cc: Andrey Konovalov <andreyknvl@google.com>
Signed-off-by: Hillf Danton <dhanton@sina.com>
---
This is to make syzbot happy for now and in long run we can make
snd_usb_pipe_sanity_check() available outside sound/usb by making
usb_urb_ep_type_check() a wrapper of the former. We will revisit
sound/usb once when things in the usb/core get in place.

 sound/usb/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/helper.c b/sound/usb/helper.c
index 71d5f54..4c12cc5 100644
--- a/sound/usb/helper.c
+++ b/sound/usb/helper.c
@@ -72,7 +72,7 @@ int snd_usb_pipe_sanity_check(struct usb_device *dev, unsigned int pipe)
 	struct usb_host_endpoint *ep;
 
 	ep = usb_pipe_endpoint(dev, pipe);
-	if (usb_pipetype(pipe) != pipetypes[usb_endpoint_type(&ep->desc)])
+	if (!ep || usb_pipetype(pipe) != pipetypes[usb_endpoint_type(&ep->desc)])
 		return -EINVAL;
 	return 0;
 }
--

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
