Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3961C258C9A
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 12:19:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCE02179E;
	Tue,  1 Sep 2020 12:18:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCE02179E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598955553;
	bh=Hl1Kk6zV37I891GNso8ONIIDcjaBUGaNsdum386KSys=;
	h=Date:Subject:From:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lzT5Gcj9v0eqVE3zUUUl2fQrHtOLOWkwgVS0G/zeGwrBEr4p6douoYagDSuTK3sX6
	 WukQO5kd0z3b8rzfpsTKVklYJ4yH82n3sYEbw+EZgwEsF6lZlc02TZJbxmnUC3EwVe
	 I2B4v3z55y5jkBXNq9Z/2asFJKQBMm3iGc5ctaGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 746A8F802DD;
	Tue,  1 Sep 2020 12:15:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CC6AF802DB; Mon, 31 Aug 2020 14:16:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=5.0 tests=FROM_LOCAL_HEX,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SORTED_RECIPS,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 902C1F80257
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 14:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 902C1F80257
Received: by mail-io1-f69.google.com with SMTP id q12so2675841iob.18
 for <alsa-devel@alsa-project.org>; Mon, 31 Aug 2020 05:16:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=xqAEW0uxhAt/9jyozVgi195mAb05+fCsu31ZuwuP3RE=;
 b=HQHsLPYpO1qeiRZ6y74b5a7aHdMLd/JiK+YG16RdsPHhZfi61QhoelcxQE1JkRyuEL
 0DgbLXsE08Axm51hXChzBNxkVgqwEwz3JfCATT6H1rKyMaNkqkxmvZu5Hg6eB4Gb1uHy
 Q9gF4Z/YI73RS4ReJH36kae04wAl82h8kHmqkRhGuHVc1UlA2xC3mvkBBC/JLj9MGpXV
 eZYXQfa7+U3pZevmd1g+k8U1AjLn/mRarHDezSLq4Tar/RNxFIO/ro2prz4mTpqm4eqZ
 YmGSL/eCHcJfJ3mvSvhNwGCwlY7UXWcYhgYQdRORFWLCAr7CK6mHwbLaqp/BYgL3P0Ea
 WKiA==
X-Gm-Message-State: AOAM531/kn1JNcL5BiwL7JThaUtDw/2qa1EocHT50k/GovH5YmkUwlfL
 NFD8mPy3ldzuCN0Q7WqFQSSQdLz8KHkLecaR3EYjUc3AYD+o
X-Google-Smtp-Source: ABdhPJxsCP4vmGpKdDdCv2nN17m84UVhtF2m7pbehTjiWasZlC4m83UnxuB/Qmcq/+OhJByyGuMeL9nNhNcFo4gsWoj5DAJA4BfT
MIME-Version: 1.0
X-Received: by 2002:a92:a302:: with SMTP id a2mr1071597ili.116.1598876175225; 
 Mon, 31 Aug 2020 05:16:15 -0700 (PDT)
Date: Mon, 31 Aug 2020 05:16:15 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000076d7e105ae2b5ec4@google.com>
Subject: general protection fault in line6_midibuf_write
From: syzbot <syzbot+b333bd4e812c1d42827a@syzkaller.appspotmail.com>
To: alsa-devel@alsa-project.org, andreyknvl@google.com, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, perex@perex.cz, 
 syzkaller-bugs@googlegroups.com, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 01 Sep 2020 12:15:51 +0200
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

HEAD commit:    3ed8e1c2 usb: typec: tcpm: Migrate workqueue to RT priorit..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=137be056900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccafc70ac3d5f49c
dashboard link: https://syzkaller.appspot.com/bug?extid=b333bd4e812c1d42827a
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b333bd4e812c1d42827a@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xdffffc0000000019: 0000 [#1] SMP KASAN
KASAN: null-ptr-deref in range [0x00000000000000c8-0x00000000000000cf]
CPU: 1 PID: 21 Comm: kworker/1:1 Not tainted 5.9.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
RIP: 0010:midibuf_is_full sound/usb/line6/midibuf.c:44 [inline]
RIP: 0010:line6_midibuf_write+0x30/0x3f0 sound/usb/line6/midibuf.c:91
Code: 49 89 f5 41 54 55 89 d5 53 48 89 fb 4c 8d 7b 18 48 83 ec 28 e8 11 68 5f fc 4c 89 fa 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e 0a 03 00 00 44 8b 63 18 31 ff
RSP: 0018:ffff8881db3099d8 EFLAGS: 00010002
RAX: dffffc0000000000 RBX: 00000000000000b0 RCX: ffffc900006a8000
RDX: 0000000000000019 RSI: ffffffff84e098af RDI: 00000000000000b0
RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffff8734d643
R10: 0000000000000000 R11: 000000000004e017 R12: 00000000000000b0
R13: ffff8881d40aec80 R14: ffff8881d4464984 R15: 00000000000000c8
FS:  0000000000000000(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005629deed5130 CR3: 00000001d2254000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 line6_data_received+0x281/0x520 sound/usb/line6/driver.c:296
 __usb_hcd_giveback_urb+0x32d/0x560 drivers/usb/core/hcd.c:1650
 usb_hcd_giveback_urb+0x367/0x410 drivers/usb/core/hcd.c:1716
 dummy_timer+0x11f2/0x3240 drivers/usb/gadget/udc/dummy_hcd.c:1967
 call_timer_fn+0x1ac/0x6e0 kernel/time/timer.c:1413
 expire_timers kernel/time/timer.c:1458 [inline]
 __run_timers.part.0+0x67c/0xa60 kernel/time/timer.c:1755
 __run_timers kernel/time/timer.c:1736 [inline]
 run_timer_softirq+0x80/0x120 kernel/time/timer.c:1768
 __do_softirq+0x1af/0x91c kernel/softirq.c:298
 asm_call_on_stack+0xf/0x20 arch/x86/entry/entry_64.S:706
 </IRQ>
 __run_on_irqstack arch/x86/include/asm/irq_stack.h:22 [inline]
 run_on_irqstack_cond arch/x86/include/asm/irq_stack.h:48 [inline]
 do_softirq_own_stack+0x73/0x90 arch/x86/kernel/irq_64.c:77
 invoke_softirq kernel/softirq.c:393 [inline]
 __irq_exit_rcu kernel/softirq.c:423 [inline]
 irq_exit_rcu+0x107/0x1a0 kernel/softirq.c:435
 sysvec_apic_timer_interrupt+0x43/0x90 arch/x86/kernel/apic/apic.c:1091
 asm_sysvec_apic_timer_interrupt+0x12/0x20 arch/x86/include/asm/idtentry.h:581
RIP: 0010:arch_local_irq_restore arch/x86/include/asm/irqflags.h:85 [inline]
RIP: 0010:console_unlock+0xa99/0xcd0 kernel/printk/printk.c:2509
Code: 00 89 ee 48 c7 c7 a0 0a 35 87 e8 12 b9 03 00 65 ff 0d 3b 48 d8 7e e9 87 f9 ff ff e8 f1 59 16 00 e8 dc f2 1b 00 ff 74 24 30 9d <e9> 20 fe ff ff e8 dd 59 16 00 48 8d 7d 08 48 89 f8 48 c1 e8 03 42
RSP: 0018:ffff8881da34f5e0 EFLAGS: 00000212
RAX: 00000000000d56ed RBX: 0000000000000200 RCX: 0000000000000006
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffff8129a6d4
RBP: 0000000000000000 R08: 0000000000000001 R09: ffffffff895c65e7
R10: fffffbfff12b8cbc R11: 0000000000003254 R12: ffffffff82b3d6f0
R13: ffffffff876fa450 R14: 0000000000000054 R15: dffffc0000000000
 vprintk_emit+0x1b2/0x460 kernel/printk/printk.c:2029
 dev_vprintk_emit+0x3eb/0x436 drivers/base/core.c:4133
 dev_printk_emit+0xba/0xf1 drivers/base/core.c:4144
 __dev_printk+0xcf/0xf5 drivers/base/core.c:4156
 _dev_info+0xd7/0x109 drivers/base/core.c:4202
 hub_port_init.cold+0x264/0x32f drivers/usb/core/hub.c:4628
 hub_port_connect drivers/usb/core/hub.c:5140 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5348 [inline]
 port_event drivers/usb/core/hub.c:5494 [inline]
 hub_event+0x2191/0x4390 drivers/usb/core/hub.c:5576
 process_one_work+0x94c/0x15f0 kernel/workqueue.c:2269
 process_scheduled_works kernel/workqueue.c:2331 [inline]
 worker_thread+0x82b/0x1120 kernel/workqueue.c:2417
 kthread+0x392/0x470 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
Modules linked in:
---[ end trace 3dff073ad8b565c9 ]---
RIP: 0010:midibuf_is_full sound/usb/line6/midibuf.c:44 [inline]
RIP: 0010:line6_midibuf_write+0x30/0x3f0 sound/usb/line6/midibuf.c:91
Code: 49 89 f5 41 54 55 89 d5 53 48 89 fb 4c 8d 7b 18 48 83 ec 28 e8 11 68 5f fc 4c 89 fa 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <0f> b6 04 02 84 c0 74 08 3c 03 0f 8e 0a 03 00 00 44 8b 63 18 31 ff
RSP: 0018:ffff8881db3099d8 EFLAGS: 00010002
RAX: dffffc0000000000 RBX: 00000000000000b0 RCX: ffffc900006a8000
RDX: 0000000000000019 RSI: ffffffff84e098af RDI: 00000000000000b0
RBP: 0000000000000000 R08: 0000000000000000 R09: ffffffff8734d643
R10: 0000000000000000 R11: 000000000004e017 R12: 00000000000000b0
R13: ffff8881d40aec80 R14: ffff8881d4464984 R15: 00000000000000c8
FS:  0000000000000000(0000) GS:ffff8881db300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005629deed5130 CR3: 00000001d2254000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
