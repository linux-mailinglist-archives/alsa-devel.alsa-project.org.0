Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A66B1E34C7
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 15:51:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ED4B16CB;
	Thu, 24 Oct 2019 15:50:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ED4B16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571925102;
	bh=JF7d572+ROX28zlXcdjuIK60Oyy1H0zaL/Q6LLEd8U8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vd15OE133oXIpzVWjdHYm/SWJPwxiOCVeopAiOTz++FW5ZLwpw5uQObsY/VB45Z2g
	 t8DD0Fl7389jicNKw0OlmTqO64iZin+tdRFxJ8QNPxkDbj3avAnqzZtRJS3stoFUqo
	 Bh7Af1t54uFov1UZe4PIzL1jPH3pb0z5acd/Dkbo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9339F80600;
	Thu, 24 Oct 2019 15:49:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C30D7F805FE; Thu, 24 Oct 2019 15:49:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6810F80112
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 15:49:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6810F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="AT5TqI2O"
Received: by mail-pf1-x442.google.com with SMTP id x28so1733017pfi.12
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 06:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Epp7roKhlKHGAskpWn/rk4LYqkhZ0PXTtiAIXJ0osJY=;
 b=AT5TqI2O5QHrSsCP4a4wU0Ji7l5qDJl48Z8kHrNOqDc0DauuFIBtuedNrQcKIjpm48
 bnF0Aff+/ERiaQQNy/bwGN6OR2L+FTpmNEcuZs10VmkcUNRfNI2QKRB6dfcGi6XZD3uJ
 XbOiWx6wb1L91v9Q6dQF0av0fmYFlMHS6uJFi/qeUbtFU89sTDlRGNb4mtpAU/U7Ie39
 NUmI0wlAsVzik7BMAJPkt7n4CPZhK3AVKC0ytAgO39TrAXAEPeJTMyG5KOaq/GSE5Lj5
 KR/FZDj3k6cOhpmSSAEO0NgTmViJueqRZWC5ADUP5iyzPrZ/pE5MmgAis8kt3k0XSit6
 Axmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Epp7roKhlKHGAskpWn/rk4LYqkhZ0PXTtiAIXJ0osJY=;
 b=O6K0QtsXxX2oJ7UlbNaMzH8AsFA7EbfFe1u6k812DiYmR+50yZzQbuE+NZkKYpcyyd
 fan/Caaa/40FudEFFcfvEmJAFkb9RED5bYArobZS4pBkhF3oe5XRFUuZOjJVRZMi4C4T
 4J8CCfASV3F1ctn/tHm4rhM+K5b2Z36s+kWS4WQXqS0aTJoRmMFNW6S97ofBNwydGPrh
 1UtGC6hKtTaSodfZzmzlXuKxS7VqEJNtIhKWL0nnh6SSIVNY/Wp+x7MPMUSzCCT8838M
 jxHsBT6unKZ++YEPKGMpEc1y7AKp8c2Vd/UHvzquJMXTFX1c42Tov5wQyUx0yCHhEumY
 nCoA==
X-Gm-Message-State: APjAAAUBViZbLnSoORamQrPRBA+V59daNwFJWrrIy0r8q+3mSBZEBUDM
 aeNx3kF65mCWE47qNypgJPIkAtImsR06BLgYJXeZ3e/XMPM=
X-Google-Smtp-Source: APXvYqxLe8KHesj6gA4iauDrWWbEGuaZ8KBBM7JPPyWbx/nPNfQVymo5EvHkb8EfQazchk8Z+Fu45HXtWEluaqdUL4o=
X-Received: by 2002:a63:541e:: with SMTP id i30mr16689978pgb.130.1571924955198; 
 Thu, 24 Oct 2019 06:49:15 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000006bb9c0595a84569@google.com>
In-Reply-To: <00000000000006bb9c0595a84569@google.com>
From: Andrey Konovalov <andreyknvl@google.com>
Date: Thu, 24 Oct 2019 15:49:03 +0200
Message-ID: <CAAeHK+yOsChMWj=fnd55mG05asOzFo1Q8dgpiMYpRYnv+_NPbg@mail.gmail.com>
To: syzbot <syzbot+fd965c77e4711eb13b82@syzkaller.appspotmail.com>
Cc: alsa-devel@alsa-project.org, g@b4.vu, wang6495@umn.edu,
 USB list <linux-usb@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, Richard Fontana <rfontana@redhat.com>,
 Takashi Iwai <tiwai@suse.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?B?5b2t6L6J?= <benquike@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] KASAN: use-after-free Read in build_audio_procunit
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

On Thu, Oct 24, 2019 at 3:47 PM syzbot
<syzbot+fd965c77e4711eb13b82@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    22be26f7 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=17cdccc4e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=387eccb7ac68ec5
> dashboard link: https://syzkaller.appspot.com/bug?extid=fd965c77e4711eb13b82
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13fe752f600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17989fd8e00000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+fd965c77e4711eb13b82@syzkaller.appspotmail.com
>
> usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> usb 1-1: Product: syz
> usb 1-1: Manufacturer: syz
> usb 1-1: SerialNumber: syz
> ==================================================================
> BUG: KASAN: use-after-free in uac_extension_unit_iExtension
> include/uapi/linux/usb/audio.h:483 [inline]
> BUG: KASAN: use-after-free in build_audio_procunit+0xeab/0x13f0
> sound/usb/mixer.c:2434
> Read of size 1 at addr ffff8881d4c0140d by task kworker/0:1/12
>
> CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.4.0-rc3+ #0
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
>   device_add+0xae6/0x16f0 drivers/base/core.c:2201
>   usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
>   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
>   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
>   really_probe+0x281/0x6d0 drivers/base/dd.c:548
>   driver_probe_device+0x104/0x210 drivers/base/dd.c:721
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
>   bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
>   __device_attach+0x217/0x360 drivers/base/dd.c:894
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
>   device_add+0xae6/0x16f0 drivers/base/core.c:2201
>   usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
>   hub_port_connect drivers/usb/core/hub.c:5183 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5323 [inline]
>   port_event drivers/usb/core/hub.c:5469 [inline]
>   hub_event+0x1dd0/0x37e0 drivers/usb/core/hub.c:5551
>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> Allocated by task 12:
>   save_stack+0x1b/0x80 mm/kasan/common.c:69
>   set_track mm/kasan/common.c:77 [inline]
>   __kasan_kmalloc mm/kasan/common.c:510 [inline]
>   __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:483
>   kmalloc include/linux/slab.h:561 [inline]
>   usb_alloc_urb+0x65/0xb0 drivers/usb/core/urb.c:73
>   usb_internal_control_msg drivers/usb/core/message.c:94 [inline]
>   usb_control_msg+0x1c9/0x4a0 drivers/usb/core/message.c:152
>   usb_get_descriptor+0xc1/0x1b0 drivers/usb/core/message.c:647
>   usb_get_configuration+0x28e/0x3050 drivers/usb/core/config.c:836
>   usb_enumerate_device drivers/usb/core/hub.c:2369 [inline]
>   usb_new_device+0xd3/0x160 drivers/usb/core/hub.c:2505
>   hub_port_connect drivers/usb/core/hub.c:5183 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5323 [inline]
>   port_event drivers/usb/core/hub.c:5469 [inline]
>   hub_event+0x1dd0/0x37e0 drivers/usb/core/hub.c:5551
>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> Freed by task 12:
>   save_stack+0x1b/0x80 mm/kasan/common.c:69
>   set_track mm/kasan/common.c:77 [inline]
>   kasan_set_free_info mm/kasan/common.c:332 [inline]
>   __kasan_slab_free+0x130/0x180 mm/kasan/common.c:471
>   slab_free_hook mm/slub.c:1424 [inline]
>   slab_free_freelist_hook mm/slub.c:1475 [inline]
>   slab_free mm/slub.c:3018 [inline]
>   kfree+0xe4/0x320 mm/slub.c:3967
>   urb_destroy drivers/usb/core/urb.c:26 [inline]
>   kref_put include/linux/kref.h:65 [inline]
>   usb_free_urb.part.0+0x7a/0xc0 drivers/usb/core/urb.c:95
>   usb_free_urb+0x1b/0x30 drivers/usb/core/urb.c:94
>   usb_start_wait_urb+0x1e5/0x2b0 drivers/usb/core/message.c:79
>   usb_internal_control_msg drivers/usb/core/message.c:101 [inline]
>   usb_control_msg+0x31c/0x4a0 drivers/usb/core/message.c:152
>   usb_get_descriptor+0xc1/0x1b0 drivers/usb/core/message.c:647
>   usb_get_configuration+0x28e/0x3050 drivers/usb/core/config.c:836
>   usb_enumerate_device drivers/usb/core/hub.c:2369 [inline]
>   usb_new_device+0xd3/0x160 drivers/usb/core/hub.c:2505
>   hub_port_connect drivers/usb/core/hub.c:5183 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5323 [inline]
>   port_event drivers/usb/core/hub.c:5469 [inline]
>   hub_event+0x1dd0/0x37e0 drivers/usb/core/hub.c:5551
>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> The buggy address belongs to the object at ffff8881d4c01400
>   which belongs to the cache kmalloc-192 of size 192
> The buggy address is located 13 bytes inside of
>   192-byte region [ffff8881d4c01400, ffff8881d4c014c0)
> The buggy address belongs to the page:
> page:ffffea0007530040 refcount:1 mapcount:0 mapping:ffff8881da002a00
> index:0x0
> flags: 0x200000000000200(slab)
> raw: 0200000000000200 ffffea000754fec0 0000000200000002 ffff8881da002a00
> raw: 0000000000000000 0000000000100010 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
>
> Memory state around the buggy address:
>   ffff8881d4c01300: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   ffff8881d4c01380: 00 00 00 07 fc fc fc fc fc fc fc fc fc fc fc fc
> > ffff8881d4c01400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                        ^
>   ffff8881d4c01480: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
>   ffff8881d4c01500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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

#syz dup: KASAN: slab-out-of-bounds Read in build_audio_procunit
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
