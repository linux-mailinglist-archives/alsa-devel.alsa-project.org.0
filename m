Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0219F5E44
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Nov 2019 10:47:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 629D81686;
	Sat,  9 Nov 2019 10:46:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 629D81686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573292821;
	bh=XPYE4MWBhCTwE5NCkbRmmg75hOIob6G1Fierw2yUMzA=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tkkuaHVnzIlu1Vix0x7SWoKzr6FslQuS2FEIen1wYHurbhN2qqChV1p9brd8kGdmz
	 Ws0KBc5wwWKqS0uxLABji9a01DjhVJmcY3yzJFMlgCiB8YY196vtCKn5nC5PyWgkA1
	 e1UZZct/NlUdbCSrqn9JICUA7SrmHT5UfoFP0lW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07B3FF805FB;
	Sat,  9 Nov 2019 10:44:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CB46F80321; Fri,  8 Nov 2019 18:04:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58C6CF800F3
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 18:04:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58C6CF800F3
Received: by mail-io1-f71.google.com with SMTP id u13so5842087iob.4
 for <alsa-devel@alsa-project.org>; Fri, 08 Nov 2019 09:04:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=pFzCAJ0CGlySD/wXXpzl2ok+erCxiE6zz9f3FzQlnXk=;
 b=lPSiUa6KpsV/JNk/H/C8buuIrMUQXkqUDZdYJh0V8TFra76swakOwBP8Up5EtmaMhS
 y4T6nRmHbBXVpZUnaXFs/I96ZuonxMnF3EUGJH+bhVOXg8V3a9nBnzu1IU+sZyv+LJiF
 VJg7hamH+z+IvxQr+k/pllRs2JoLBs6aEy2kC/nZHjB8/JWnddf7iwvbO3R61usQrk3b
 gELnaBA+VhQSD0gwHO0Ua1z2grv8wjpCf+nZryW7FDGR7CPYNPgeFLqQQEr+scIn7XMw
 zlzDhSCpchHb08yaaYBYAAs1IdxQR3BJ4X9V+22bQzggayMgAB8eV1bObjQiQ7KddIXG
 Mzkw==
X-Gm-Message-State: APjAAAWaNLsq6J/Iz50Uh0kKnncZrgEwAxpIMIZrRCYtnQ/riLrW79zr
 rggc/K5dw8G0ZWknmMF/YhOc9cxYyY+HzBnb62YhbSgcRj+l
X-Google-Smtp-Source: APXvYqzYTsdH44lrdqX2YHZSgA0wtmXvEAhKnkksoLLmbuoiqzpuDdMMtL0c2U5MMAOkOzxqvZhKcE7TWdyz0HH+3r9RZX4DrqFi
MIME-Version: 1.0
X-Received: by 2002:a5e:dd09:: with SMTP id t9mr2555994iop.182.1573232650667; 
 Fri, 08 Nov 2019 09:04:10 -0800 (PST)
Date: Fri, 08 Nov 2019 09:04:10 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004acf5b0596d8c522@google.com>
From: syzbot <syzbot+abe1ab7afc62c6bb6377@syzkaller.appspotmail.com>
To: allison@lohutok.net, alsa-devel@alsa-project.org, benquike@gmail.com, 
 dan.carpenter@oracle.com, g@b4.vu, glider@google.com, 
 linux-kernel@vger.kernel.org, perex@perex.cz, syzkaller-bugs@googlegroups.com, 
 tglx@linutronix.de, tiwai@suse.com, wang6495@umn.edu, yuehaibing@huawei.com
X-Mailman-Approved-At: Sat, 09 Nov 2019 10:43:39 +0100
Subject: [alsa-devel] KMSAN: uninit-value in get_min_max_with_quirks
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

HEAD commit:    c2453450 kmsan: kcov: prettify the code unpoisoning area->..
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=119f1173600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3684f3c73f43899a
dashboard link: https://syzkaller.appspot.com/bug?extid=abe1ab7afc62c6bb6377
compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
80fee25776c2fb61e74c1ecb1a523375c2500b69)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16255fe7600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15e73290e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+abe1ab7afc62c6bb6377@syzkaller.appspotmail.com

usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 1-1: Product: syz
usb 1-1: Manufacturer: syz
usb 1-1: SerialNumber: syz
usb 1-1: 0:2 : does not exist
=====================================================
BUG: KMSAN: uninit-value in get_min_max_with_quirks+0xd6f/0x2ea0  
sound/usb/mixer.c:1239
CPU: 0 PID: 2859 Comm: kworker/0:2 Not tainted 5.4.0-rc3+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x191/0x1f0 lib/dump_stack.c:113
  kmsan_report+0x14a/0x2f0 mm/kmsan/kmsan_report.c:109
  __msan_warning+0x73/0xf0 mm/kmsan/kmsan_instr.c:245
  get_min_max_with_quirks+0xd6f/0x2ea0 sound/usb/mixer.c:1239
  __build_feature_ctl+0x12b9/0x29e0 sound/usb/mixer.c:1665
  build_feature_ctl sound/usb/mixer.c:1709 [inline]
  parse_audio_feature_unit sound/usb/mixer.c:1918 [inline]
  parse_audio_unit+0x218c/0x7490 sound/usb/mixer.c:2753
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

Local variable description: ----saved@get_min_max_with_quirks
Variable was created at:
  get_min_max_with_quirks+0xa8b/0x2ea0 sound/usb/mixer.c:1231
  get_min_max_with_quirks+0xa8b/0x2ea0 sound/usb/mixer.c:1231
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
