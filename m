Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D31F5107DDC
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Nov 2019 10:10:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 629A91864;
	Sat, 23 Nov 2019 10:09:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 629A91864
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574500210;
	bh=QRtoDy2xo1LtYmPzUH19rS2aT74N2Xjri6l9p4VunDE=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aE7QLtWPn+KLc0NL/y8en7KBDPPTrbCfEQ+VYbsBf5tWf5vvVltUKU4QKuMtDgywu
	 4nSsB+IoFb0PZPBnW5F4GlhTYdF1A8a8ceqZSU/n6HJUZeCN8BfcArOxcu7GMxY9Ev
	 heEwC6U7Vew6lOhk2uC8aIECcm4fSk4AvyW/3shY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B007EF8015B;
	Sat, 23 Nov 2019 10:08:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 384FCF80146; Thu, 21 Nov 2019 16:25:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C8D8F800F0
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 16:25:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C8D8F800F0
Received: by mail-io1-f72.google.com with SMTP id p1so2492761ioo.9
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 07:25:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=5/Y0Vx39t23ptU6jPQhVbmYRjMhm1ty9Ei09eq/gC9A=;
 b=fk86FNWhgEYV7iSjKQzqo/OLolbAHevdCZnB8naypR4M2YGbPjmjs6CCCNScZXbqpF
 capCvo5a8bGuuqAXPicA+Mlp87QX6gymRJIoc85ANCcJFuniP15HSU7n4kU+tp3fHgaB
 C6smVACgEl9AZMflW6Qi0sGM3ptCxOIps87Kl2EEJL4HDH6Bv6qKfRfGmUjA6knXjguf
 ehwocdrI3Y6+2f11o+6KHPMnx5LDMAniGOv7mTzJyU/dT49CYfLjp47CIsTXa6H0udUY
 t+K4+kd9fc/vg9aQnnNPJ3LHaH43WDiMeFqjTYPsmUHkQjS7/NjIryj5erDfCFvA6Sw5
 KLxg==
X-Gm-Message-State: APjAAAXgr/GmXqxF0o7n8quA/SWgncVnNYbHIE+o0thU/+S2XS1b5j1y
 UOIuI87FErUAU056aYd3zN+zJeyVM50EAkFLixakDTlwD7pQ
X-Google-Smtp-Source: APXvYqx24QzbX7sKyq85/7BIRL34ERuzFmfT0f4o2upQazdDIQDaiWYBiXJvRiaFLTa7nbXlURC2Xd8wrVjbHDvIHveClSU3Tblu
MIME-Version: 1.0
X-Received: by 2002:a5e:c314:: with SMTP id a20mr8275088iok.300.1574349909859; 
 Thu, 21 Nov 2019 07:25:09 -0800 (PST)
Date: Thu, 21 Nov 2019 07:25:09 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002129080597dce70d@google.com>
From: syzbot <syzbot+a36ab65c6653d7ccdd62@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, andreyknvl@google.com, benquike@gmail.com, 
 dan.carpenter@oracle.com, g@b4.vu, gregkh@linuxfoundation.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, perex@perex.cz, 
 syzkaller-bugs@googlegroups.com, tiwai@suse.com, wang6495@umn.edu
X-Mailman-Approved-At: Sat, 23 Nov 2019 10:08:24 +0100
Subject: [alsa-devel] general protection fault in snd_usb_create_mixer
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

HEAD commit:    46178223 usb: gadget: add raw-gadget interface
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=176f9836e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=99c88c44660624e7
dashboard link: https://syzkaller.appspot.com/bug?extid=a36ab65c6653d7ccdd62
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1447d3bae00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17ef3a86e00000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+a36ab65c6653d7ccdd62@syzkaller.appspotmail.com

usb 1-1: 208:241 : does not exist
usb 1-1: 208:242 : does not exist
usb 1-1: 208:243 : does not exist
usb 1-1: 208:244 : does not exist
usb 1-1: 208:245 : does not exist
usb 1-1: 208:246 : does not exist
usb 1-1: 208:247 : does not exist
usb 1-1: 208:248 : does not exist
usb 1-1: 208:249 : does not exist
usb 1-1: 208:250 : does not exist
kasan: CONFIG_KASAN_INLINE enabled
kasan: GPF could be caused by NULL-ptr deref or user memory access
general protection fault: 0000 [#1] SMP KASAN
CPU: 1 PID: 22 Comm: kworker/1:1 Not tainted 5.4.0-rc6+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
RIP: 0010:snd_usb_mixer_controls_badd sound/usb/mixer.c:2931 [inline]
RIP: 0010:snd_usb_create_mixer+0xbb9/0x1890 sound/usb/mixer.c:3441
Code: ee e8 9b 23 a6 fc 41 39 ee 74 a4 e8 a1 22 a6 fc 48 8b 7c 24 28 89 ee  
e8 25 59 b4 fe 48 8d 78 10 48 89 c3 48 89 f8 48 c1 e8 03 <42> 0f b6 04 28  
84 c0 74 08 3c 03 0f 8e 2f 09 00 00 8b 6b 10 bf 01
RSP: 0018:ffff8881d932f0a0 EFLAGS: 00010202
RAX: 0000000000000002 RBX: 0000000000000000 RCX: ffffffff834c5dac
RDX: 0000000000000000 RSI: ffffffff834c5e1b RDI: 0000000000000010
RBP: 0000000000000021 R08: ffff8881da24e000 R09: fffffbfff11aadb5
R10: fffffbfff11aadb4 R11: ffffffff88d56da7 R12: 00000000000000da
R13: dffffc0000000000 R14: 00000000000000d0 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000043f100 CR3: 0000000006c21000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  usb_audio_probe+0xc76/0x2010 sound/usb/card.c:653
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2202
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x104/0x210 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
  device_add+0xae6/0x16f0 drivers/base/core.c:2202
  usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2537
  hub_port_connect drivers/usb/core/hub.c:5184 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
  port_event drivers/usb/core/hub.c:5470 [inline]
  hub_event+0x1df8/0x3800 drivers/usb/core/hub.c:5552
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Modules linked in:
---[ end trace 1d30a29898ec11e8 ]---
RIP: 0010:snd_usb_mixer_controls_badd sound/usb/mixer.c:2931 [inline]
RIP: 0010:snd_usb_create_mixer+0xbb9/0x1890 sound/usb/mixer.c:3441
Code: ee e8 9b 23 a6 fc 41 39 ee 74 a4 e8 a1 22 a6 fc 48 8b 7c 24 28 89 ee  
e8 25 59 b4 fe 48 8d 78 10 48 89 c3 48 89 f8 48 c1 e8 03 <42> 0f b6 04 28  
84 c0 74 08 3c 03 0f 8e 2f 09 00 00 8b 6b 10 bf 01
RSP: 0018:ffff8881d932f0a0 EFLAGS: 00010202
RAX: 0000000000000002 RBX: 0000000000000000 RCX: ffffffff834c5dac
RDX: 0000000000000000 RSI: ffffffff834c5e1b RDI: 0000000000000010
RBP: 0000000000000021 R08: ffff8881da24e000 R09: fffffbfff11aadb5
R10: fffffbfff11aadb4 R11: ffffffff88d56da7 R12: 00000000000000da
R13: dffffc0000000000 R14: 00000000000000d0 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000043f100 CR3: 0000000006c21000 CR4: 00000000001406e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


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
