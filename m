Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFDE3542B4
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Apr 2021 16:22:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C7C516E9;
	Mon,  5 Apr 2021 16:21:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C7C516E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617632544;
	bh=By5+50QLuVXO2vQ93csQbSTL7yi72SWRUq/RfAmvtwk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NMVF92qLXi0rqVc4Bu1KUYoZlnYSqlutqDesm2U8mpMjr3YlKlgd7L/R3nRN2H/vV
	 8DoK57yuy+DazZao+DjZD6pM3O9gc8tPEgE3XC0JkjU98TKz5ONLXlIN0kbpm8oqgF
	 UZihQaeLBJZrXSDui/8vioEploFDeDITtTSYsuDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 494F0F80124;
	Mon,  5 Apr 2021 16:20:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DA82F8016A; Mon,  5 Apr 2021 16:20:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCB39F80124
 for <alsa-devel@alsa-project.org>; Mon,  5 Apr 2021 16:20:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCB39F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WgEmSZSF"
Received: by mail-qk1-x736.google.com with SMTP id q26so11575182qkm.6
 for <alsa-devel@alsa-project.org>; Mon, 05 Apr 2021 07:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GoYR3hv9DU/cazg7SsbVz29zaxFrggmcU0hdecueT4Y=;
 b=WgEmSZSFV1B9hru5B8KIt9eCPCjL9XSy04HE0VmN7F7FKzpzHRCVej5pELOBu0066r
 9B5EwNPsRuYUydHuO27UGMk6uGyzrQuUBC5x9giW7QHxyzyW0rQcZPWYRD6oHo2HgeiA
 PcQDcK8wOhuri29ihzuB4goK/3bLj27UHCqDqL7qwn1NJcN2cV4OLG5M6w65bFVU1NT9
 x3YrzVeId5I1bq5VOoFXb7jW49ThyA4a6P0/DKRCgvjUyrc2h06VvX2ZdvkekhLcOkNx
 Tvz2yOTmjgJ/z5sHwLOC4lqHNSnfGCoxDk0WOuUz9boF54vM2O6cdH8Xj43xp5ERAwp0
 eIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GoYR3hv9DU/cazg7SsbVz29zaxFrggmcU0hdecueT4Y=;
 b=sUnkdOWUFlTLJ6JBG3xn7B9oF6AIi97aUmarjB/AZk3iAbvP6S0I1ZjgoApQanXknr
 En1P7Tyjq2nPv283DQX/GI8waa0nH4i1e2cxmQ6uMYidx5ViwcdbmDryimLslKdQurQL
 KyirbRIPzrdp+RGAauZBHOyq+c7JEPAI/z2jA94Fpm8+hQF/Dzi6tNtmQhUBGsoN4C46
 GL9cnqplb9oERjZp0JwDbQVTZfw4HEL+D42Uu2qzbMcC3lSGcJm8Tmg0VIDmyaMvJXms
 dAj6UnFPkF5IrjyUmLP7ZasPVrKcwm516wQT8Kko6d+t13NmQjS4YF40kfZx6Y5Dficc
 MiFA==
X-Gm-Message-State: AOAM532I0gdRigdrib/DeYiHT23690NEFe2GrP75h51ZlDi9q+JY3e3T
 2I0TIrgAnFULrUkDjlNj+wtK3/b1Qc97bkl/Nf4yVMt8rmE=
X-Google-Smtp-Source: ABdhPJyn5ypuNy/yKG8WGzd/D9v6cqjOVn27GXr8ChpDXKLlJ/us/xSKtHnB/6WSlyTsHLNRsQ/u8+tR2CfFvyczmlQ=
X-Received: by 2002:a05:620a:10a6:: with SMTP id
 h6mr24754509qkk.366.1617632443198; 
 Mon, 05 Apr 2021 07:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAEsQvcs9LcciAYjoB64Kt_VaSww4EAW4-qN0ED5jDA0GeeTtDg@mail.gmail.com>
In-Reply-To: <CAEsQvcs9LcciAYjoB64Kt_VaSww4EAW4-qN0ED5jDA0GeeTtDg@mail.gmail.com>
From: Geraldo <geraldogabriel@gmail.com>
Date: Mon, 5 Apr 2021 11:16:42 -0300
Message-ID: <CAEsQvcvNvx1kOAdO8ZoLHQyMQs13hWTjPMBp466A_9_ij5w25Q@mail.gmail.com>
Subject: Re: [PATCH v2] Pioneer devices: engage implicit feedback sync for
 playback
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Takashi Iwai <tiwai@suse.de>
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

Dr. Iwai, here's the additional debugging information you asked for.

First dyndbg log is for successful engagement of implicit feedback sync on
the playback.
Second case I modified snd_usb_parse_implicit_fb_quirk to return 0 as it
would normally, unsuccessful.
Third is lsusb -v of Pioneer DJ DDJ-SR2.

I think I know now why we need to return 1 like a capture quirk was found
inside snd_usb_parse_implicit_fb_quirk: if we don't it triggers sync ep
code inside pcm.c

As always, thank you for your time.

---

[ 6397.520597] xhci_hcd 0000:00:14.0: Port change event, 3-1, id 1, portsc:
0xa0206e1
[ 6397.520619] xhci_hcd 0000:00:14.0: resume root hub
[ 6397.520647] xhci_hcd 0000:00:14.0: handle_port_status: starting port
polling.
[ 6397.520747] xhci_hcd 0000:00:14.0: Get port status 3-1 read: 0x206e1,
return 0x10101
[ 6397.520950] xhci_hcd 0000:00:14.0: clear port1 connect change, portsc:
0x6e1
[ 6397.521111] xhci_hcd 0000:00:14.0: Get port status 3-2 read: 0x2a0,
return 0x100
[ 6397.521147] xhci_hcd 0000:00:14.0: Get port status 3-3 read: 0x2a0,
return 0x100
[ 6397.521179] xhci_hcd 0000:00:14.0: Get port status 3-4 read: 0x2a0,
return 0x100
[ 6397.626337] xhci_hcd 0000:00:14.0: Get port status 3-1 read: 0x6e1,
return 0x101
[ 6397.626387] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6397.626432] xhci_hcd 0000:00:14.0: Adding 1 ep ctx, 1 now active.
[ 6397.626441] xhci_hcd 0000:00:14.0: Slot 5 output ctx = 0x13efdc000 (dma)
[ 6397.626447] xhci_hcd 0000:00:14.0: Slot 5 input ctx = 0x13ec75000 (dma)
[ 6397.626456] xhci_hcd 0000:00:14.0: Set slot id 5 dcbaa entry
00000000225b73b8 to 0x13efdc000
[ 6397.626515] xhci_hcd 0000:00:14.0: set port reset, actual port 3-1
status  = 0x791
[ 6397.629635] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping port
polling.
[ 6397.681751] xhci_hcd 0000:00:14.0: Port change event, 3-1, id 1, portsc:
0x200e03
[ 6397.681768] xhci_hcd 0000:00:14.0: handle_port_status: starting port
polling.
[ 6397.693020] xhci_hcd 0000:00:14.0: Get port status 3-1 read: 0x200e03,
return 0x100503
[ 6397.693084] xhci_hcd 0000:00:14.0: clear port1 reset change, portsc:
0xe03
[ 6397.719619] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping port
polling.
[ 6397.749662] usb 3-1: new high-speed USB device number 6 using xhci_hcd
[ 6397.749689] xhci_hcd 0000:00:14.0: Set root hub portnum to 1
[ 6397.749697] xhci_hcd 0000:00:14.0: Set fake root hub portnum to 1
[ 6397.749702] xhci_hcd 0000:00:14.0: udev->tt = 0000000000000000
[ 6397.749709] xhci_hcd 0000:00:14.0: udev->ttport = 0x0
[ 6397.749720] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6397.749762] xhci_hcd 0000:00:14.0: Successful setup context command
[ 6397.749771] xhci_hcd 0000:00:14.0: Op regs DCBAA ptr = 0x00000236cef000
[ 6397.749778] xhci_hcd 0000:00:14.0: Slot ID 5 dcbaa entry
@00000000225b73b8 = 0x0000013efdc000
[ 6397.749787] xhci_hcd 0000:00:14.0: Output Context DMA address =
0x13efdc000
[ 6397.749792] xhci_hcd 0000:00:14.0: Internal device address = 0
[ 6397.749878] xhci_hcd 0000:00:14.0: Waiting for status stage event
[ 6397.749925] xhci_hcd 0000:00:14.0: set port reset, actual port 3-1
status  = 0xf91
[ 6397.805146] xhci_hcd 0000:00:14.0: Port change event, 3-1, id 1, portsc:
0x200e03
[ 6397.805161] xhci_hcd 0000:00:14.0: handle_port_status: starting port
polling.
[ 6397.816340] xhci_hcd 0000:00:14.0: Get port status 3-1 read: 0x200e03,
return 0x100503
[ 6397.816403] xhci_hcd 0000:00:14.0: clear port1 reset change, portsc:
0xe03
[ 6397.872940] xhci_hcd 0000:00:14.0: Resetting device with slot ID 5
[ 6397.872964] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6397.872979] xhci_hcd 0000:00:14.0: Completed reset device command.
[ 6397.872995] xhci_hcd 0000:00:14.0: Can't reset device (slot ID 5) in
default state
[ 6397.873001] xhci_hcd 0000:00:14.0: Not freeing device rings.
[ 6397.873013] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6397.873057] xhci_hcd 0000:00:14.0: Successful setup address command
[ 6397.873066] xhci_hcd 0000:00:14.0: Op regs DCBAA ptr = 0x00000236cef000
[ 6397.873073] xhci_hcd 0000:00:14.0: Slot ID 5 dcbaa entry
@00000000225b73b8 = 0x0000013efdc000
[ 6397.873083] xhci_hcd 0000:00:14.0: Output Context DMA address =
0x13efdc000
[ 6397.873088] xhci_hcd 0000:00:14.0: Internal device address = 5
[ 6397.890400] xhci_hcd 0000:00:14.0: Waiting for status stage event
[ 6397.890503] xhci_hcd 0000:00:14.0: Waiting for status stage event
[ 6397.890743] xhci_hcd 0000:00:14.0: Waiting for status stage event
[ 6397.890817] usb 3-1: New USB device found, idVendor=2b73,
idProduct=001e, bcdDevice= 1.01
[ 6397.890828] usb 3-1: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[ 6397.890835] usb 3-1: Product: DDJ-SR2
[ 6397.890840] usb 3-1: Manufacturer: Pioneer DJ Corporation
[ 6397.891132] xhci_hcd 0000:00:14.0: add ep 0x85, slot id 5, new drop
flags = 0x0, new add flags = 0x800
[ 6397.891165] xhci_hcd 0000:00:14.0: add ep 0x4, slot id 5, new drop flags
= 0x0, new add flags = 0x900
[ 6397.891183] xhci_hcd 0000:00:14.0: add ep 0x87, slot id 5, new drop
flags = 0x0, new add flags = 0x8900
[ 6397.891196] xhci_hcd 0000:00:14.0: xhci_check_bandwidth called for udev
00000000298860cb
[ 6397.891210] xhci_hcd 0000:00:14.0: Adding 3 ep ctxs, 4 now active.
[ 6397.891225] xhci_hcd 0000:00:14.0: Recalculating BW for rootport 1
[ 6397.891236] xhci_hcd 0000:00:14.0: Final bandwidth: 42, Limit: 1607,
Reserved: 322, Available: 77 percent
[ 6397.891253] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6397.891348] xhci_hcd 0000:00:14.0: Successful Endpoint Configure command
[ 6397.891468] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6397.891493] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot
5 ep 10
[ 6397.891522] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6397.891609] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6397.891841] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot
5 ep 7
[ 6397.891856] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6397.891923] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6397.891949] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot
5 ep 14
[ 6397.891962] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6397.892364] xhci_hcd 0000:00:14.0: Waiting for status stage event
[ 6397.892476] xhci_hcd 0000:00:14.0: Waiting for status stage event
[ 6397.892543] usb 3-1: 0:1: added playback implicit_fb sync_ep 82, iface
0:1
[ 6397.892562] usb 3-1: Creating new data endpoint #1
[ 6397.892568] usb 3-1: Creating new data endpoint #82
[ 6397.892574] xhci_hcd 0000:00:14.0: xhci_check_bandwidth called for udev
00000000298860cb
[ 6397.892683] usb 3-1: 0:1 Set sample rate 44100, clock 0
[ 6397.892706] xhci_hcd 0000:00:14.0: xhci_check_bandwidth called for udev
00000000298860cb
[ 6397.892771] usb 3-1: 0:1 Set sample rate 44100, clock 0
[ 6397.969579] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping port
polling.
[ 6402.946313] xhci_hcd 0000:00:14.0: Cancel URB 00000000c89bac54, dev 1,
ep 0x0, starting at offset 0x13ef91210
[ 6402.946353] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6402.946371] xhci_hcd 0000:00:14.0: Stopped on Transfer TRB for slot 5 ep
0
[ 6402.946383] xhci_hcd 0000:00:14.0: Removing canceled TD starting at
0x13ef91210 (dma).
[ 6402.946392] xhci_hcd 0000:00:14.0: Set TR Deq ptr 0x13ef91230, cycle 1
[ 6402.946398] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6402.946409] xhci_hcd 0000:00:14.0: Successful Set TR Deq Ptr cmd, deq =
@13ef91230
[ 6402.946417] xhci_hcd 0000:00:14.0: Giveback URB 00000000c89bac54, len =
0, expected = 0, status = -115
[ 6402.947692] hid-generic 0003:2B73:001E.0005: hiddev96,hidraw0: USB HID
v1.11 Device [Pioneer DJ Corporation DDJ-SR2] on usb-0000:00:14.0-1/input3
[ 6424.552616] usb 3-1: Open EP 0x82, iface=0:1, idx=1
[ 6424.552626] usb 3-1:   channels=6, rate=44100, format=S24_3LE,
period_bytes=9216, periods=2, implicit_fb=0
[ 6424.552632] usb 3-1: Setting usb interface 0:0 for EP 0x82
[ 6424.552638] xhci_hcd 0000:00:14.0: xhci_check_bandwidth called for udev
00000000298860cb
[ 6424.552715] usb 3-1: Setting usb interface 0:1 for EP 0x82
[ 6424.552725] xhci_hcd 0000:00:14.0: add ep 0x1, slot id 5, new drop flags
= 0x0, new add flags = 0x5
[ 6424.552732] xhci_hcd 0000:00:14.0: add ep 0x82, slot id 5, new drop
flags = 0x0, new add flags = 0x25
[ 6424.552736] xhci_hcd 0000:00:14.0: xhci_check_bandwidth called for udev
00000000298860cb
[ 6424.552741] xhci_hcd 0000:00:14.0: Adding 2 ep ctxs, 6 now active.
[ 6424.552746] xhci_hcd 0000:00:14.0: Recalculating BW for rootport 1
[ 6424.552750] xhci_hcd 0000:00:14.0: Final bandwidth: 282, Limit: 1607,
Reserved: 322, Available: 62 percent
[ 6424.552757] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6424.552811] xhci_hcd 0000:00:14.0: Successful Endpoint Configure command
[ 6424.552983] usb 3-1: 0:1 Set sample rate 44100, clock 0
[ 6424.553011] usb 3-1: Setting params for data EP 0x82, pipe 0x10680
[ 6424.553021] usb 3-1: Set up 12 URBS, ret=0
[ 6424.553113] usb 3-1: Open EP 0x1, iface=0:1, idx=0
[ 6424.553117] usb 3-1:   channels=4, rate=44100, format=S24_3LE,
period_bytes=6144, periods=2, implicit_fb=1
[ 6424.553122] usb 3-1: Reopened EP 0x82 (count 1)
[ 6424.553126] usb 3-1: 0:1 Set sample rate 44100, clock 0
[ 6424.553129] usb 3-1: Setting params for data EP 0x1, pipe 0x8600
[ 6424.553138] usb 3-1: Set up 12 URBS, ret=0
[ 6424.553163] usb 3-1: Starting data EP 0x1 (running 0)
[ 6424.553168] usb 3-1: No URB submission due to implicit fb sync
[ 6424.553170] usb 3-1: Starting data EP 0x82 (running 0)
[ 6424.553219] usb 3-1: 12 URBs submitted for EP 0x82
[ 6424.555173] usb 3-1: Starting data EP 0x82 (running 1)
[ 6424.555180] usb 3-1: 0:1 Start Capture PCM
[ 6424.555184] usb 3-1: 0:1 Start Playback PCM


---

[ 6518.662829] xhci_hcd 0000:00:14.0: resume root hub
[ 6518.662849] xhci_hcd 0000:00:14.0: handle_port_status: starting port
polling.
[ 6518.663623] xhci_hcd 0000:00:14.0: Get port status 3-1 read: 0x206e1,
return 0x10101
[ 6518.663703] xhci_hcd 0000:00:14.0: clear port1 connect change, portsc:
0x6e1
[ 6518.663728] xhci_hcd 0000:00:14.0: Get port status 3-2 read: 0x2a0,
return 0x100
[ 6518.663750] xhci_hcd 0000:00:14.0: Get port status 3-3 read: 0x2a0,
return 0x100
[ 6518.663769] xhci_hcd 0000:00:14.0: Get port status 3-4 read: 0x2a0,
return 0x100
[ 6518.719588] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping port
polling.
[ 6518.769612] xhci_hcd 0000:00:14.0: Get port status 3-1 read: 0x6e1,
return 0x101
[ 6518.769668] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6518.769712] xhci_hcd 0000:00:14.0: Adding 1 ep ctx, 1 now active.
[ 6518.769725] xhci_hcd 0000:00:14.0: Slot 6 output ctx = 0x13efdc000 (dma)
[ 6518.769734] xhci_hcd 0000:00:14.0: Slot 6 input ctx = 0x13ec75000 (dma)
[ 6518.769744] xhci_hcd 0000:00:14.0: Set slot id 6 dcbaa entry
00000000d24104f6 to 0x13efdc000
[ 6518.769816] xhci_hcd 0000:00:14.0: set port reset, actual port 3-1
status  = 0x791
[ 6518.772897] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping port
polling.
[ 6518.824991] xhci_hcd 0000:00:14.0: Port change event, 3-1, id 1, portsc:
0x200e03
[ 6518.825012] xhci_hcd 0000:00:14.0: handle_port_status: starting port
polling.
[ 6518.836254] xhci_hcd 0000:00:14.0: Get port status 3-1 read: 0x200e03,
return 0x100503
[ 6518.836306] xhci_hcd 0000:00:14.0: clear port1 reset change, portsc:
0xe03
[ 6518.892917] usb 3-1: new high-speed USB device number 7 using xhci_hcd
[ 6518.892938] xhci_hcd 0000:00:14.0: Set root hub portnum to 1
[ 6518.892945] xhci_hcd 0000:00:14.0: Set fake root hub portnum to 1
[ 6518.892950] xhci_hcd 0000:00:14.0: udev->tt = 0000000000000000
[ 6518.892956] xhci_hcd 0000:00:14.0: udev->ttport = 0x0
[ 6518.892966] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6518.892999] xhci_hcd 0000:00:14.0: Successful setup context command
[ 6518.893008] xhci_hcd 0000:00:14.0: Op regs DCBAA ptr = 0x00000236cef000
[ 6518.893015] xhci_hcd 0000:00:14.0: Slot ID 6 dcbaa entry
@00000000d24104f6 = 0x0000013efdc000
[ 6518.893023] xhci_hcd 0000:00:14.0: Output Context DMA address =
0x13efdc000
[ 6518.893029] xhci_hcd 0000:00:14.0: Internal device address = 0
[ 6518.893208] xhci_hcd 0000:00:14.0: Waiting for status stage event
[ 6518.893287] xhci_hcd 0000:00:14.0: set port reset, actual port 3-1
status  = 0xf91
[ 6518.948510] xhci_hcd 0000:00:14.0: Port change event, 3-1, id 1, portsc:
0x200e03
[ 6518.948533] xhci_hcd 0000:00:14.0: handle_port_status: starting port
polling.
[ 6518.959642] xhci_hcd 0000:00:14.0: Get port status 3-1 read: 0x200e03,
return 0x100503
[ 6518.959704] xhci_hcd 0000:00:14.0: clear port1 reset change, portsc:
0xe03
[ 6518.969594] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping port
polling.
[ 6519.016304] xhci_hcd 0000:00:14.0: Resetting device with slot ID 6
[ 6519.016330] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6519.016351] xhci_hcd 0000:00:14.0: Completed reset device command.
[ 6519.016370] xhci_hcd 0000:00:14.0: Can't reset device (slot ID 6) in
default state
[ 6519.016377] xhci_hcd 0000:00:14.0: Not freeing device rings.
[ 6519.016390] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6519.016437] xhci_hcd 0000:00:14.0: Successful setup address command
[ 6519.016446] xhci_hcd 0000:00:14.0: Op regs DCBAA ptr = 0x00000236cef000
[ 6519.016454] xhci_hcd 0000:00:14.0: Slot ID 6 dcbaa entry
@00000000d24104f6 = 0x0000013efdc000
[ 6519.016463] xhci_hcd 0000:00:14.0: Output Context DMA address =
0x13efdc000
[ 6519.016469] xhci_hcd 0000:00:14.0: Internal device address = 6
[ 6519.033886] xhci_hcd 0000:00:14.0: Waiting for status stage event
[ 6519.034170] xhci_hcd 0000:00:14.0: Waiting for status stage event
[ 6519.034352] xhci_hcd 0000:00:14.0: Waiting for status stage event
[ 6519.034416] usb 3-1: New USB device found, idVendor=2b73,
idProduct=001e, bcdDevice= 1.01
[ 6519.034427] usb 3-1: New USB device strings: Mfr=1, Product=2,
SerialNumber=0
[ 6519.034435] usb 3-1: Product: DDJ-SR2
[ 6519.034440] usb 3-1: Manufacturer: Pioneer DJ Corporation
[ 6519.034757] xhci_hcd 0000:00:14.0: add ep 0x85, slot id 6, new drop
flags = 0x0, new add flags = 0x800
[ 6519.034776] xhci_hcd 0000:00:14.0: add ep 0x4, slot id 6, new drop flags
= 0x0, new add flags = 0x900
[ 6519.034790] xhci_hcd 0000:00:14.0: add ep 0x87, slot id 6, new drop
flags = 0x0, new add flags = 0x8900
[ 6519.034799] xhci_hcd 0000:00:14.0: xhci_check_bandwidth called for udev
0000000041e6ad6d
[ 6519.034811] xhci_hcd 0000:00:14.0: Adding 3 ep ctxs, 4 now active.
[ 6519.034821] xhci_hcd 0000:00:14.0: Recalculating BW for rootport 1
[ 6519.034828] xhci_hcd 0000:00:14.0: Final bandwidth: 42, Limit: 1607,
Reserved: 322, Available: 77 percent
[ 6519.034842] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6519.045845] xhci_hcd 0000:00:14.0: Successful Endpoint Configure command
[ 6519.045948] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6519.045982] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot
6 ep 10
[ 6519.046008] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6519.046083] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6519.046107] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot
6 ep 7
[ 6519.046123] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6519.046239] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6519.046528] xhci_hcd 0000:00:14.0: Stopped on No-op or Link TRB for slot
6 ep 14
[ 6519.046813] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6524.122938] xhci_hcd 0000:00:14.0: Cancel URB 000000005dc311b3, dev 1,
ep 0x0, starting at offset 0x13ef91170
[ 6524.122971] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6524.122989] xhci_hcd 0000:00:14.0: Stopped on Transfer TRB for slot 6 ep
0
[ 6524.123001] xhci_hcd 0000:00:14.0: Removing canceled TD starting at
0x13ef91170 (dma).
[ 6524.123010] xhci_hcd 0000:00:14.0: Set TR Deq ptr 0x13ef91190, cycle 1
[ 6524.123016] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6524.123028] xhci_hcd 0000:00:14.0: Successful Set TR Deq Ptr cmd, deq =
@13ef91190
[ 6524.123036] xhci_hcd 0000:00:14.0: Giveback URB 000000005dc311b3, len =
0, expected = 0, status = -115
[ 6524.124748] hid-generic 0003:2B73:001E.0006: hiddev96,hidraw0: USB HID
v1.11 Device [Pioneer DJ Corporation DDJ-SR2] on usb-0000:00:14.0-1/input3
[ 6524.140705] xhci_hcd 0000:00:14.0: Waiting for status stage event
[ 6524.140856] xhci_hcd 0000:00:14.0: Waiting for status stage event
[ 6524.140936] usb 3-1: 0:1: added playback implicit_fb sync_ep 82, iface
0:1
[ 6524.140951] usb 3-1: Creating new data endpoint #1
[ 6524.140954] usb 3-1: Creating new data endpoint #82
[ 6524.140958] xhci_hcd 0000:00:14.0: xhci_check_bandwidth called for udev
0000000041e6ad6d
[ 6524.141095] usb 3-1: 0:1 Set sample rate 44100, clock 0
[ 6524.141110] usb 3-1: 0:1: found sync_ep=0x82, iface=0, alt=1,
implicit_fb=0
[ 6524.141118] xhci_hcd 0000:00:14.0: xhci_check_bandwidth called for udev
0000000041e6ad6d
[ 6524.141274] usb 3-1: 0:1 Set sample rate 44100, clock 0
[ 6524.141683] usbcore: registered new interface driver snd-usb-audio
[ 6530.912038] usb 3-1: Open EP 0x82, iface=0:1, idx=1
[ 6530.912047] usb 3-1:   channels=6, rate=44100, format=S24_3LE,
period_bytes=9216, periods=2, implicit_fb=0
[ 6530.912052] usb 3-1: Reopened EP 0x82 (count 1)
[ 6530.912056] usb 3-1: Setting usb interface 0:0 for EP 0x82
[ 6530.912062] xhci_hcd 0000:00:14.0: xhci_check_bandwidth called for udev
0000000041e6ad6d
[ 6530.912125] usb 3-1: Setting usb interface 0:1 for EP 0x82
[ 6530.912134] xhci_hcd 0000:00:14.0: add ep 0x1, slot id 6, new drop flags
= 0x0, new add flags = 0x5
[ 6530.912141] xhci_hcd 0000:00:14.0: add ep 0x82, slot id 6, new drop
flags = 0x0, new add flags = 0x25
[ 6530.912146] xhci_hcd 0000:00:14.0: xhci_check_bandwidth called for udev
0000000041e6ad6d
[ 6530.912151] xhci_hcd 0000:00:14.0: Adding 2 ep ctxs, 6 now active.
[ 6530.912156] xhci_hcd 0000:00:14.0: Recalculating BW for rootport 1
[ 6530.912160] xhci_hcd 0000:00:14.0: Final bandwidth: 282, Limit: 1607,
Reserved: 322, Available: 62 percent
[ 6530.912165] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6530.912221] xhci_hcd 0000:00:14.0: Successful Endpoint Configure command
[ 6530.912412] usb 3-1: 0:1 Set sample rate 44100, clock 0
[ 6530.912419] usb 3-1: Setting params for data EP 0x82, pipe 0x10780
[ 6530.912428] usb 3-1: Set up 12 URBS, ret=0
[ 6530.912525] usb 3-1: Open EP 0x1, iface=0:1, idx=0
[ 6530.912530] usb 3-1:   channels=4, rate=44100, format=S24_3LE,
period_bytes=6144, periods=2, implicit_fb=1
[ 6530.912535] usb 3-1: Reopened EP 0x82 (count 2)
[ 6530.912538] usb 3-1: 0:1 Set sample rate 44100, clock 0
[ 6530.912542] usb 3-1: Setting params for data EP 0x1, pipe 0x8700
[ 6530.912549] usb 3-1: Set up 12 URBS, ret=0
[ 6530.912575] usb 3-1: Starting data EP 0x1 (running 0)
[ 6530.912579] usb 3-1: No URB submission due to implicit fb sync
[ 6530.912582] usb 3-1: Starting data EP 0x82 (running 0)
[ 6530.912623] usb 3-1: 12 URBs submitted for EP 0x82
[ 6530.915746] usb 3-1: Starting data EP 0x82 (running 1)
[ 6530.915760] usb 3-1: Starting data EP 0x82 (running 2)
[ 6530.915766] usb 3-1: 0:1 Start Capture PCM
[ 6530.915772] usb 3-1: 0:1 Start Playback PCM
[ 6548.340701] usb 3-1: Stopping data EP 0x82 (running 3)
[ 6548.340709] usb 3-1: Stopping data EP 0x82 (running 2)
[ 6548.340713] usb 3-1: 0:1 Stop Capture PCM
[ 6548.340717] usb 3-1: Stopping data EP 0x82 (running 1)
[ 6548.340724] xhci_hcd 0000:00:14.0: Cancel URB 0000000017eaed8f, dev 1,
ep 0x82, starting at offset 0x13eef0b40
[ 6548.340731] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6548.340735] xhci_hcd 0000:00:14.0: Cancel URB 00000000d1c36d1d, dev 1,
ep 0x82, starting at offset 0x13eef0b50
[ 6548.340741] xhci_hcd 0000:00:14.0: Stopped on Transfer TRB for slot 6 ep
4
[ 6548.340746] xhci_hcd 0000:00:14.0: Removing canceled TD starting at
0x13eef0b40 (dma).
[ 6548.340750] xhci_hcd 0000:00:14.0: Removing canceled TD starting at
0x13eef0b50 (dma).
[ 6548.340758] xhci_hcd 0000:00:14.0: Cancel URB 000000007dcb7021, dev 1,
ep 0x82, starting at offset 0x13eef0b60
[ 6548.340762] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6548.340766] xhci_hcd 0000:00:14.0: Cancel URB 00000000b381540e, dev 1,
ep 0x82, starting at offset 0x13eef0b70
[ 6548.340769] xhci_hcd 0000:00:14.0: Cancel URB 00000000059964b3, dev 1,
ep 0x82, starting at offset 0x13eef0b80
[ 6548.340773] xhci_hcd 0000:00:14.0: Cancel URB 0000000009d6cac7, dev 1,
ep 0x82, starting at offset 0x13eef0b90
[ 6548.340777] xhci_hcd 0000:00:14.0: Cancel URB 000000008fc1dbd6, dev 1,
ep 0x82, starting at offset 0x13eef0ba0
[ 6548.340783] xhci_hcd 0000:00:14.0: Stopped on Transfer TRB for slot 6 ep
4
[ 6548.340786] xhci_hcd 0000:00:14.0: Removing canceled TD starting at
0x13eef0b60 (dma).
[ 6548.340789] xhci_hcd 0000:00:14.0: Removing canceled TD starting at
0x13eef0b70 (dma).
[ 6548.340792] xhci_hcd 0000:00:14.0: Removing canceled TD starting at
0x13eef0b80 (dma).
[ 6548.340795] xhci_hcd 0000:00:14.0: Removing canceled TD starting at
0x13eef0b90 (dma).
[ 6548.340798] xhci_hcd 0000:00:14.0: Removing canceled TD starting at
0x13eef0ba0 (dma).
[ 6548.340806] xhci_hcd 0000:00:14.0: Cancel URB 00000000dd5ca99e, dev 1,
ep 0x82, starting at offset 0x13eef0bb0
[ 6548.340810] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6548.340814] xhci_hcd 0000:00:14.0: Cancel URB 000000003c889fa7, dev 1,
ep 0x82, starting at offset 0x13eef0bc0
[ 6548.340818] xhci_hcd 0000:00:14.0: Cancel URB 000000005c402de4, dev 1,
ep 0x82, starting at offset 0x13eef0b10
[ 6548.340823] xhci_hcd 0000:00:14.0: Stopped on Transfer TRB for slot 6 ep
4
[ 6548.340826] xhci_hcd 0000:00:14.0: Removing canceled TD starting at
0x13eef0bb0 (dma).
[ 6548.340829] xhci_hcd 0000:00:14.0: Removing canceled TD starting at
0x13eef0bc0 (dma).
[ 6548.340832] xhci_hcd 0000:00:14.0: Removing canceled TD starting at
0x13eef0b10 (dma).
[ 6548.340836] xhci_hcd 0000:00:14.0: Set TR Deq ptr 0x13eef0b20, cycle 1
[ 6548.340839] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6548.340848] xhci_hcd 0000:00:14.0: Cancel URB 0000000012679da4, dev 1,
ep 0x82, starting at offset 0x13eef0b20
[ 6548.340851] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6548.340855] xhci_hcd 0000:00:14.0: Cancel URB 00000000353acb81, dev 1,
ep 0x82, starting at offset 0x13eef0b30
[ 6548.340860] usb 3-1: Stopping data EP 0x1 (running 1)
[ 6548.340861] xhci_hcd 0000:00:14.0: Successful Set TR Deq Ptr cmd, deq =
@13eef0b20
[ 6548.340864] usb 3-1: 0:1 Stop Playback PCM
[ 6548.340866] xhci_hcd 0000:00:14.0: Removing canceled TD starting at
0x13eef0b20 (dma).
[ 6548.340869] xhci_hcd 0000:00:14.0: Removing canceled TD starting at
0x13eef0b30 (dma).
[ 6548.340872] xhci_hcd 0000:00:14.0: Set TR Deq ptr 0x13eef0b30, cycle 1
[ 6548.340875] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6548.340901] xhci_hcd 0000:00:14.0: Successful Set TR Deq Ptr cmd, deq =
@13eef0b30
[ 6548.350377] usb 3-1: Closing EP 0x82 (count 3)
[ 6548.350384] usb 3-1: Closing EP 0x82 (count 2)
[ 6548.350396] usb 3-1: Closing EP 0x1 (count 1)
[ 6548.350398] usb 3-1: EP 0x1 closed
[ 6548.350400] usb 3-1: Closing EP 0x82 (count 1)
[ 6548.350401] usb 3-1: Setting usb interface 0:0 for EP 0x82
[ 6548.350406] xhci_hcd 0000:00:14.0: xhci_drop_endpoint called for udev
0000000041e6ad6d
[ 6548.350423] xhci_hcd 0000:00:14.0: drop ep 0x1, slot id 6, new drop
flags = 0x4, new add flags = 0x0
[ 6548.350426] xhci_hcd 0000:00:14.0: xhci_drop_endpoint called for udev
0000000041e6ad6d
[ 6548.350435] xhci_hcd 0000:00:14.0: drop ep 0x82, slot id 6, new drop
flags = 0x24, new add flags = 0x0
[ 6548.350438] xhci_hcd 0000:00:14.0: xhci_check_bandwidth called for udev
0000000041e6ad6d
[ 6548.350442] xhci_hcd 0000:00:14.0: Adding 0 ep ctxs, 6 now active.
[ 6548.350445] xhci_hcd 0000:00:14.0: Recalculating BW for rootport 1
[ 6548.350447] xhci_hcd 0000:00:14.0: Final bandwidth: 42, Limit: 1607,
Reserved: 322, Available: 77 percent
[ 6548.350451] xhci_hcd 0000:00:14.0: // Ding dong!
[ 6548.350509] xhci_hcd 0000:00:14.0: Successful Endpoint Configure command
[ 6548.350512] xhci_hcd 0000:00:14.0: Removing 2 dropped ep ctxs, 4 now
active.
[ 6548.350644] usb 3-1: EP 0x82 closed

---

Bus 003 Device 007: ID 2b73:001e Pioneer DJ Corporation DDJ-SR2
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0        64
  idVendor           0x2b73
  idProduct          0x001e
  bcdDevice            1.01
  iManufacturer           1 Pioneer DJ Corporation
  iProduct                2 DDJ-SR2
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x00a2
    bNumInterfaces          4
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xc0
      Self Powered
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       1
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              0
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               3
        bRefresh                0
        bSynchAddress           0
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               3
        bRefresh                0
        bSynchAddress           0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 Audio
      bInterfaceSubClass      1 Control Device
      bInterfaceProtocol      0
      iInterface              0
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x0009
        bInCollection           1
        baInterfaceNr(0)        2
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass         1 Audio
      bInterfaceSubClass      3 MIDI Streaming
      bInterfaceProtocol      0
      iInterface              0
      MIDIStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x0041
      MIDIStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (MIDI_IN_JACK)
        bJackType               1 Embedded
        bJackID                 3
        iJack                   0
      MIDIStreaming Interface Descriptor:
        bLength                 6
        bDescriptorType        36
        bDescriptorSubtype      2 (MIDI_IN_JACK)
        bJackType               2 External
        bJackID                 1
        iJack                   0
      MIDIStreaming Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (MIDI_OUT_JACK)
        bJackType               2 External
        bJackID                 4
        bNrInputPins            1
        baSourceID( 0)          3
        BaSourcePin( 0)         1
        iJack                   0
      MIDIStreaming Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (MIDI_OUT_JACK)
        bJackType               1 Embedded
        bJackID                 2
        bNrInputPins            1
        baSourceID( 0)          1
        BaSourcePin( 0)         1
        iJack                   0
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x85  EP 5 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
        bRefresh                0
        bSynchAddress           0
        MIDIStreaming Endpoint Descriptor:
          bLength                 5
          bDescriptorType        37
          bDescriptorSubtype      1 (GENERAL)
          bNumEmbMIDIJack         1
          baAssocJackID( 0)       2
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x04  EP 4 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
        bRefresh                0
        bSynchAddress           0
        MIDIStreaming Endpoint Descriptor:
          bLength                 5
          bDescriptorType        37
          bDescriptorSubtype      1 (GENERAL)
          bNumEmbMIDIJack         1
          baAssocJackID( 0)       3
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      0
      bInterfaceProtocol      0
      iInterface              0
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.11
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength      52
         Report Descriptors:
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x87  EP 7 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               4
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x0001
  Self Powered
