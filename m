Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB89A2D5572
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 09:28:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BE97169F;
	Thu, 10 Dec 2020 09:27:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BE97169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607588927;
	bh=H1g79x5Pts+Z6C3Tly+ps11RiYysJOdtJWF8zGNj2tk=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vr0l8KetFJvY6eKbA56nHcWzyU8DsL2eftYbXVRZksOX4RLc1r5GbCYGvsqgQrSiW
	 YzZbzmFauc6TXgGvq8rwiqaPgSFohhnwZ0RiSocuYkFlwz1a7f3wcR6esaZ7tqKQQO
	 zJGzYmlrRKbbsXWqAiBCRydVTz6v+WItdaHHYCM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2183AF8025A;
	Thu, 10 Dec 2020 09:27:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12F74F8020D; Wed,  9 Dec 2020 08:33:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,SORTED_RECIPS,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC5C2F801D8
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 08:33:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC5C2F801D8
Received: by mail-il1-f200.google.com with SMTP id b18so639610ilr.7
 for <alsa-devel@alsa-project.org>; Tue, 08 Dec 2020 23:33:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=P9LZMAZBHJf7O9yDXHWHSE/19zyEUKOfD7IEF1OKF14=;
 b=lHaRwOIWK7KKQXzzVvAuEwAFZrnSAMmetdIdXP6+AvJfNaf3J+eI6pvdKWSjIaAzJw
 6VbJcIyRe859FVLdu3uG9ANgBQ3lKhda3YG+oSv/1iPmQQmFFgXmZHqbvgorGEFLTU+S
 ftmv5poahjE+KncleHMuWXnV9+kCz0blELNxwWNvydTUBAz2yegCdjZYHnzBw/ev9ejK
 vfTFK/sAeWbbOEh/xiv9wpyipk4FYw7YNNDu12oHEcL/K35w7aPHt8vpMvdj5O8tQf5T
 ztuiIgbfS0aaxxVdVrVhlM0OTHiOalsUhWzssg9CjsgSpgLkcdW8KNSGl4VrFeFBeycf
 qB+w==
X-Gm-Message-State: AOAM530Umn5PJU0cI6PJ46Wc+Cd6qxhihHyNZ99Gq53MVNn+o0Xh/lpl
 cgYGQnxMdzc+xM6SDl2QNtAeeTH2Y2v2+DeyH4cb2Dbfq/Ah
X-Google-Smtp-Source: ABdhPJxeiG9pDSrKPLzAaSeLKo/j9mbJBnfYpzGtjanj1/S/ooN3PyFgINzu9pkjYBCnpJC/mqHlVwut2yh0IMMxDrRNPMYI/Hq8
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2211:: with SMTP id
 n17mr1139091ion.107.1607499191889; 
 Tue, 08 Dec 2020 23:33:11 -0800 (PST)
Date: Tue, 08 Dec 2020 23:33:11 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004f34f605b60312af@google.com>
Subject: UBSAN: shift-out-of-bounds in parse_audio_format_i
From: syzbot <syzbot+df7dc146ebdd6435eea3@syzkaller.appspotmail.com>
To: alexander@tsoy.me, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org, mickflemm@gmail.com, perex@perex.cz, 
 syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 10 Dec 2020 09:27:00 +0100
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

HEAD commit:    15ac8fdb Add linux-next specific files for 20201207
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=16d4620f500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3696b8138207d24d
dashboard link: https://syzkaller.appspot.com/bug?extid=df7dc146ebdd6435eea3
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=126afa13500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14389613500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+df7dc146ebdd6435eea3@syzkaller.appspotmail.com

usb 1-1: New USB device found, idVendor=1d6b, idProduct=0101, bcdDevice= 0.40
usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 1-1: Product: syz
usb 1-1: Manufacturer: syz
usb 1-1: SerialNumber: syz
usb 1-1: 2:1 : no or invalid class specific endpoint descriptor
================================================================================
UBSAN: shift-out-of-bounds in sound/usb/format.c:44:17
shift exponent 4098 is too large for 64-bit type 'long long unsigned int'
CPU: 0 PID: 8656 Comm: kworker/0:4 Not tainted 5.10.0-rc6-next-20201207-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:120
 ubsan_epilogue+0xb/0x5a lib/ubsan.c:148
 __ubsan_handle_shift_out_of_bounds.cold+0xb1/0x181 lib/ubsan.c:395
 parse_audio_format_i_type sound/usb/format.c:44 [inline]
 parse_audio_format_i.cold+0xba/0x3e2 sound/usb/format.c:653
 snd_usb_parse_audio_format+0x89/0x290 sound/usb/format.c:753
 snd_usb_get_audioformat_uac12 sound/usb/stream.c:841 [inline]
 __snd_usb_parse_audio_interface+0xce4/0x3cf0 sound/usb/stream.c:1170
 snd_usb_parse_audio_interface+0x79/0x130 sound/usb/stream.c:1240
 snd_usb_create_stream.isra.0+0x23a/0x530 sound/usb/card.c:206
 snd_usb_create_streams sound/usb/card.c:278 [inline]
 usb_audio_probe+0x93c/0x2ab0 sound/usb/card.c:802
 usb_probe_interface+0x315/0x7f0 drivers/usb/core/driver.c:396
 really_probe+0x2b1/0xe40 drivers/base/dd.c:554
 driver_probe_device+0x285/0x3f0 drivers/base/dd.c:738
 __device_attach_driver+0x216/0x2d0 drivers/base/dd.c:844
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:431
 __device_attach+0x228/0x4c0 drivers/base/dd.c:912
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0xbb2/0x1ce0 drivers/base/core.c:2934
 usb_set_configuration+0x113c/0x1910 drivers/usb/core/message.c:2167
 usb_generic_driver_probe+0xba/0x100 drivers/usb/core/generic.c:238
 usb_probe_device+0xd9/0x2c0 drivers/usb/core/driver.c:293
 really_probe+0x2b1/0xe40 drivers/base/dd.c:554
 driver_probe_device+0x285/0x3f0 drivers/base/dd.c:738
 __device_attach_driver+0x216/0x2d0 drivers/base/dd.c:844
 bus_for_each_drv+0x15f/0x1e0 drivers/base/bus.c:431
 __device_attach+0x228/0x4c0 drivers/base/dd.c:912
 bus_probe_device+0x1e4/0x290 drivers/base/bus.c:491
 device_add+0xbb2/0x1ce0 drivers/base/core.c:2934
 usb_new_device.cold+0x725/0x1057 drivers/usb/core/hub.c:2555
 hub_port_connect drivers/usb/core/hub.c:5223 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5363 [inline]
 port_event drivers/usb/core/hub.c:5509 [inline]
 hub_event+0x2348/0x42d0 drivers/usb/core/hub.c:5591
 process_one_work+0x98d/0x1630 kernel/workqueue.c:2275
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2421
 kthread+0x3b1/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
================================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
