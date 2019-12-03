Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E4710FF96
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 15:06:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A5ED1654;
	Tue,  3 Dec 2019 15:05:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A5ED1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575381987;
	bh=5zgT3LvpnKdRkZ2+NYa8c+B1VQzbfbuXviMptNHECvM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rxvfc5JK9L7uqO3rI6I3P1AuSdzbCWH/0azEvC08lbWkDNFNF9Oa+XmyOcC56+vJe
	 Uf74SQMmaLTIlmxsVGBBXWydpS5YqcqpOV+YUoMTVZOno9CotKeVFdh1J939+eSvOr
	 7nGC1+bW+2RfNdCyrHpLVZxwrnqst1AI3Q/+gqiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6ADDF80229;
	Tue,  3 Dec 2019 15:04:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 728ECF80227; Tue,  3 Dec 2019 15:04:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,PDS_BTC_ID,SORTED_RECIPS,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46FC2F800F0
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 15:04:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46FC2F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="HfbeP3N6"
Received: by mail-pf1-x441.google.com with SMTP id n13so1923411pff.1
 for <alsa-devel@alsa-project.org>; Tue, 03 Dec 2019 06:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Dtm8bZvjIqydDk1jDprx34oJUKe7mU+jpSckyH/F1I=;
 b=HfbeP3N6W8K9LfDJCmKgeP7wKt5wkdx++/++XrUJkMDkmhaHSJf/iZ+/dI90IodgVe
 xXmPQzctXcMINqC1qFUMO5mEY4Gmwedvwq726m2FrnaQfb/50lb5RTgk+IaapbokxdEn
 Ys0ezo1g9BuUe5DRN/Vc/tGj3CTwOSTohqM6BDM26d4Zk4kd9D0JNG8QP6662wq2hAAU
 5qLA+EZOMqkqDHkQhoWpYxALjXf606/pH0IB8ITGkwn1UcrnJxwo5ruESH/QWhXLuH/2
 s05NMDYqC4WADIMmpgp/s4pXyZz6d5hg1UDwQqiGumAG0oeuO2R/7WuAeWw1mPLGx0SF
 Leqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Dtm8bZvjIqydDk1jDprx34oJUKe7mU+jpSckyH/F1I=;
 b=qsB+bOZfJ1QFJZ+wFaAph7GRaVJGTwmAr0wvw4Q1imtEOxLKTFMYukWnJcuRc7ORgP
 mKnExyMlIBYgRSQ+sX3HPQyCqf/heFUscH/br+UeTTq85gtvVUyL2qluJfJ8us94H8t5
 liFdZF3XSDFoFja3plVsosiTIYtNCSe+G3HZlo1OILNovGshCWD2UnCEXjrszq+W/qa2
 ze+kR2B39poFoIp3l29aIK3Jk8HbTo7kHL2htP6HVMkDsD0QKvFSniYAfkeVJ+rHQ/J+
 f9JAFyZxx0JW+OoI68kVCLYcai9wVdW7mGjl1ygVCz0jA4gHPErknTkzvcPcsBq9dcSq
 7Afg==
X-Gm-Message-State: APjAAAXcaseyKD14gGEmMHIpIun8DHrEXF13UY0HEiPoHSoj5e/0y+M4
 SlHjF58DNvb39OK4gK3QmBQSAMkBdBkScqH4OCbsUWYsmCg=
X-Google-Smtp-Source: APXvYqzC5+UvK84UP7Ywe9j56Q0zlhRCpLbkEVu6PuqrwMEt+WJkTorLKKUWNoprXciQYxHReXAC6MUx/jUtITb/4ZM=
X-Received: by 2002:a63:c804:: with SMTP id z4mr5569756pgg.440.1575381876794; 
 Tue, 03 Dec 2019 06:04:36 -0800 (PST)
MIME-Version: 1.0
References: <0000000000007ce1f40596c3651f@google.com>
In-Reply-To: <0000000000007ce1f40596c3651f@google.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Tue, 3 Dec 2019 15:04:25 +0100
Message-ID: <CAAeHK+yqy+xJSe8RyBoZYNbG729rCwOMz6UCJ3zONhsA2004Cw@mail.gmail.com>
To: syzbot <syzbot+622d4ecb979f45c6a775@syzkaller.appspotmail.com>
Cc: alsa-devel@alsa-project.org, wang6495@umn.edu, yuehaibing@huawei.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, Richard Fontana <rfontana@redhat.com>,
 Allison Randal <allison@lohutok.net>, Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?B?5b2t6L6J?= <benquike@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] KASAN: slab-out-of-bounds Read in
	build_audio_procunit (2)
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

On Thu, Nov 7, 2019 at 4:34 PM syzbot
<syzbot+622d4ecb979f45c6a775@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    d60bbfea usb: raw: add raw-gadget interface
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=132e5bcce00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=79de80330003b5f7
> dashboard link: https://syzkaller.appspot.com/bug?extid=622d4ecb979f45c6a775
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1478c6b4e00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=117cbf8ae00000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+622d4ecb979f45c6a775@syzkaller.appspotmail.com
>
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: syz
> usb 1-1: Manufacturer: syz
> usb 1-1: SerialNumber: syz
> usb 1-1: 0:2 : does not exist
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in uac_extension_unit_iExtension
> include/uapi/linux/usb/audio.h:483 [inline]
> BUG: KASAN: slab-out-of-bounds in build_audio_procunit+0xeab/0x13f0
> sound/usb/mixer.c:2434
> Read of size 1 at addr ffff8881d4aaa735 by task kworker/1:2/83
>
> CPU: 1 PID: 83 Comm: kworker/1:2 Not tainted 5.4.0-rc6+ #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0xca/0x13e lib/dump_stack.c:113
>   print_address_description.constprop.0+0x36/0x50 mm/kasan/report.c:374
>   __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:506
>   kasan_report+0xe/0x20 mm/kasan/common.c:634
>   uac_extension_unit_iExtension include/uapi/linux/usb/audio.h:483 [inline]
>   build_audio_procunit+0xeab/0x13f0 sound/usb/mixer.c:2434
>   parse_audio_extension_unit sound/usb/mixer.c:2483 [inline]
>   parse_audio_unit+0x1812/0x36f0 sound/usb/mixer.c:2761
>   snd_usb_mixer_controls+0x715/0xb90 sound/usb/mixer.c:3095
>   snd_usb_create_mixer+0x2b5/0x1890 sound/usb/mixer.c:3445
>   usb_audio_probe+0xc76/0x2010 sound/usb/card.c:653
>   usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
>   really_probe+0x281/0x6d0 drivers/base/dd.c:548
>   driver_probe_device+0x104/0x210 drivers/base/dd.c:721
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
>   bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
>   __device_attach+0x217/0x360 drivers/base/dd.c:894
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
>   device_add+0xae6/0x16f0 drivers/base/core.c:2202
>   usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
>   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
>   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
>   really_probe+0x281/0x6d0 drivers/base/dd.c:548
>   driver_probe_device+0x104/0x210 drivers/base/dd.c:721
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
>   bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
>   __device_attach+0x217/0x360 drivers/base/dd.c:894
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
>   device_add+0xae6/0x16f0 drivers/base/core.c:2202
>   usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2537
>   hub_port_connect drivers/usb/core/hub.c:5184 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
>   port_event drivers/usb/core/hub.c:5470 [inline]
>   hub_event+0x1df8/0x3800 drivers/usb/core/hub.c:5552
>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> Allocated by task 83:
>   save_stack+0x1b/0x80 mm/kasan/common.c:69
>   set_track mm/kasan/common.c:77 [inline]
>   __kasan_kmalloc mm/kasan/common.c:510 [inline]
>   __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:483
>   kmalloc include/linux/slab.h:561 [inline]
>   usb_get_configuration+0x311/0x3100 drivers/usb/core/config.c:862
>   usb_enumerate_device drivers/usb/core/hub.c:2370 [inline]
>   usb_new_device+0xd3/0x160 drivers/usb/core/hub.c:2506
>   hub_port_connect drivers/usb/core/hub.c:5184 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5324 [inline]
>   port_event drivers/usb/core/hub.c:5470 [inline]
>   hub_event+0x1df8/0x3800 drivers/usb/core/hub.c:5552
>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> Freed by task 211:
>   save_stack+0x1b/0x80 mm/kasan/common.c:69
>   set_track mm/kasan/common.c:77 [inline]
>   kasan_set_free_info mm/kasan/common.c:332 [inline]
>   __kasan_slab_free+0x130/0x180 mm/kasan/common.c:471
>   slab_free_hook mm/slub.c:1424 [inline]
>   slab_free_freelist_hook mm/slub.c:1475 [inline]
>   slab_free mm/slub.c:3025 [inline]
>   kfree+0xe4/0x320 mm/slub.c:3977
>   do_new_mount fs/namespace.c:2827 [inline]
>   do_mount+0x68a/0x1bf0 fs/namespace.c:3143
>   ksys_mount+0xd7/0x150 fs/namespace.c:3352
>   __do_sys_mount fs/namespace.c:3366 [inline]
>   __se_sys_mount fs/namespace.c:3363 [inline]
>   __x64_sys_mount+0xba/0x150 fs/namespace.c:3363
>   do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:290
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
>
> The buggy address belongs to the object at ffff8881d4aaa600
>   which belongs to the cache kmalloc-256 of size 256
> The buggy address is located 53 bytes to the right of
>   256-byte region [ffff8881d4aaa600, ffff8881d4aaa700)
> The buggy address belongs to the page:
> page:ffffea000752aa80 refcount:1 mapcount:0 mapping:ffff8881da002780
> index:0x0 compound_mapcount: 0
> flags: 0x200000000010200(slab|head)
> raw: 0200000000010200 ffffea000752c900 0000000a0000000a ffff8881da002780
> raw: 0000000000000000 0000000000100010 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
>
> Memory state around the buggy address:
>   ffff8881d4aaa600: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   ffff8881d4aaa680: 00 00 00 00 00 00 00 00 00 00 00 00 00 fc fc fc
> > ffff8881d4aaa700: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>                                       ^
>   ffff8881d4aaa780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>   ffff8881d4aaa800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ==================================================================
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> syzbot can test patches for this bug, for details see:
> https://goo.gl/tpsmEJ#testing-patches

#syz fix: ALSA: usb-audio: Fix incorrect size check for
processing/extension units
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
