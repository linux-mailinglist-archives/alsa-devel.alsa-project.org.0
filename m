Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E4328E496
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 18:37:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF369174A;
	Wed, 14 Oct 2020 18:36:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF369174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602693420;
	bh=0YFb3hyHlP1AVt5yvJAWdmuKljgDjaxKEDsFpXTfrWo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LlXDWnN1kRCmLF/ro7vDv3RRO+Kss0+j5QImLwG6htOqcEIhT5CAIE21jnCGcDXql
	 DC88RlVNjDxLVH1LAopFxqG/J6aQ5Qhu9b+3Yh3hO6PpwQ8pMxmWBONXw64v1vZcJZ
	 YuxQmYwn6GSi1P0vnJfEDe7vwtTwEJBzqcHTf+Ec=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5066FF8020D;
	Wed, 14 Oct 2020 18:35:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0756BF80217; Wed, 14 Oct 2020 18:35:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1071BF80118
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 18:35:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1071BF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=superlative.org header.i=@superlative.org
 header.b="1IxtxMDn"
Received: by mail-oi1-x241.google.com with SMTP id t77so3866527oie.4
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 09:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=superlative.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7ejaa/u7r3n+vgLeKaEMbaFNID/GddfWp+IOn+bFqOU=;
 b=1IxtxMDntucxwi5xNgO7j36maBXGArRjcMDm5OLotmvqE7n0Q4PJqAIX09wOOISN1E
 oUp1lxguOPRpaZ47a0ebtf87+aaZOzIb5IpXUUcSQih8Gq6g0zgopUD3f63z0exrvVNQ
 RHw7GtH6iXENztLTIKx6/ar4IrfYfmBl5Wr+g+rwElQrlTROXPXRbICAhybrDIP8Lfnl
 J3AqWXqcBkKm1KAj4VKRTSRDsMZlhgP0/yyeLFcWLokblzgmN+GiWC1QeEmTKFUSU6fZ
 f4cXMg+uvKIT+pL+1b6tTu2sl6a8Gt/NY2rr2FQQfaZDhr7yzhkDfMKtw9nrBVJVSu17
 q3Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7ejaa/u7r3n+vgLeKaEMbaFNID/GddfWp+IOn+bFqOU=;
 b=pdyCmky86CR52PMUgoFwNkYf4F+7Muu9k7bnN31ho6GhvO34JY1SCrEfWJ7Hpg6Abo
 tarw61WLLq9/utrfAy7FVKDEZKaRkEGiyt3C9iaPzDEIJR1MVZraWRf88F8Bl6SiBqlp
 C/ZAT7wRCkbga18E96X4rrOxDNyhfDW7V5xWs9lv2XnDlXTbGF7keGcVNZjvPLMLGBT4
 R1gFs8w5szo5KUIoEW4aaSVBZIhropbB1itEPnm06DJDWHCgGlsqg35aAdTyG/FPSrKt
 FUcB7aERgpIOyn1P9eWqO3Dm35gvF4AYtIYGDFsC4SlawR8+qWC55myyPBtQ4QmNp7+t
 +bVQ==
X-Gm-Message-State: AOAM531UCagLKmlFIosmQFaaAYSxKtz69iCpcPLamPzqXZm4iU1tHDJo
 cu0e/kbNq8PJP6kU+6J8Mawduogn5MsIrBswLDPyug==
X-Google-Smtp-Source: ABdhPJz0KfnGtTTcmmuBQz1d2Hr9hv525mwNG6sioLFYj0oOAXR4xAF/AqJvYp89v+y6VF5cTZqzjFfG8JeaMX8o9fY=
X-Received: by 2002:aca:48c4:: with SMTP id v187mr112597oia.71.1602693302150; 
 Wed, 14 Oct 2020 09:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191011171937.8013-1-szszoke.code@gmail.com>
 <s5hftjriy1q.wl-tiwai@suse.de>
 <CAPMdQDmY7CdbrHyOwhJNFBREQ0EO1SKufRdN_YR6TG4zmJzXpA@mail.gmail.com>
 <CAHXb3bf+0uKS-+aEVsgebUbYPt1wCBZ7GLAjF57BrPDHcveuQQ@mail.gmail.com>
 <CAPMdQDmE3cgu2whqTxf7pFUoQusUYJKK7xLASev8JdWD-9oypQ@mail.gmail.com>
 <CAHXb3bdrPC_v0oAEkWDR-VH7NZ3uoFdSw-dzNo_Fwy8HzeTopA@mail.gmail.com>
In-Reply-To: <CAHXb3bdrPC_v0oAEkWDR-VH7NZ3uoFdSw-dzNo_Fwy8HzeTopA@mail.gmail.com>
From: Mailing Lists <maillist@superlative.org>
Date: Wed, 14 Oct 2020 17:34:51 +0100
Message-ID: <CAPMdQDmiCDWTdfpbAwM7tJL+KiPApjd0jd46yPemw04-6CQWjg@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: Disable quirks for BOSS
 Katana amplifiers
To: Mike Oliphant <oliphant@nostatic.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
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

On Wed, 14 Oct 2020 at 17:12, Mike Oliphant <oliphant@nostatic.org> wrote:

> Keith - are you getting an implicit feedback endpoint created when you run
> with the patch?
>

Hi Mike,

It appears that I do. For reference I'm on kernel 5.4.0-51:

Bus 001 Device 007: ID 0582:01d6 Roland Corp. GT-1
Device Descriptor:
 bLength                18
 bDescriptorType         1
 bcdUSB               2.00
 bDeviceClass          255 Vendor Specific Class
 bDeviceSubClass         0
 bDeviceProtocol       255
 bMaxPacketSize0        64
 idVendor           0x0582 Roland Corp.
 idProduct          0x01d6
 bcdDevice            0.00
 iManufacturer           1 BOSS
 iProduct                2 GT-1
 iSerial                 0
 bNumConfigurations      1
 Configuration Descriptor:
   bLength                 9
   bDescriptorType         2
   wTotalLength       0x00bc
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
     bInterfaceSubClass    255 Vendor Specific Subclass
     bInterfaceProtocol      0
     iInterface              0
   Interface Descriptor:
     bLength                 9
     bDescriptorType         4
     bInterfaceNumber        1
     bAlternateSetting       0
     bNumEndpoints           0
     bInterfaceClass       255 Vendor Specific Class
     bInterfaceSubClass      2
     bInterfaceProtocol      2
     iInterface              0
     ** UNRECOGNIZED:  06 24 f1 01 00 00
   Interface Descriptor:
     bLength                 9
     bDescriptorType         4
     bInterfaceNumber        1
     bAlternateSetting       1
     bNumEndpoints           1
     bInterfaceClass       255 Vendor Specific Class
     bInterfaceSubClass      2
     bInterfaceProtocol      2
     iInterface              0
     ** UNRECOGNIZED:  07 24 01 01 00 01 00
     ** UNRECOGNIZED:  0b 24 02 01 02 04 18 01 44 ac 00
     ** UNRECOGNIZED:  06 24 f1 04 16 00
     Endpoint Descriptor:
       bLength                 7
       bDescriptorType         5
       bEndpointAddress     0x0d  EP 13 OUT
       bmAttributes            5
         Transfer Type            Isochronous
         Synch Type               Asynchronous
         Usage Type               Data
       wMaxPacketSize     0x0038  1x 56 bytes
       bInterval               1
   Interface Descriptor:
     bLength                 9
     bDescriptorType         4
     bInterfaceNumber        2
     bAlternateSetting       0
     bNumEndpoints           0
     bInterfaceClass       255 Vendor Specific Class
     bInterfaceSubClass      2
     bInterfaceProtocol      1
     iInterface              0
   Interface Descriptor:
     bLength                 9
     bDescriptorType         4
     bInterfaceNumber        2
     bAlternateSetting       1
     bNumEndpoints           1
     bInterfaceClass       255 Vendor Specific Class
     bInterfaceSubClass      2
     bInterfaceProtocol      1
     iInterface              0
     ** UNRECOGNIZED:  07 24 01 07 00 01 00
     ** UNRECOGNIZED:  0b 24 02 01 02 04 18 01 44 ac 00
     ** UNRECOGNIZED:  06 24 f1 04 16 00
     Endpoint Descriptor:
       bLength                 7
       bDescriptorType         5
       bEndpointAddress     0x8e  EP 14 IN
       bmAttributes           37
         Transfer Type            Isochronous
         Synch Type               Asynchronous
         Usage Type               Implicit feedback Data
       wMaxPacketSize     0x0038  1x 56 bytes
       bInterval               1
   Interface Descriptor:
     bLength                 9
     bDescriptorType         4
     bInterfaceNumber        3
     bAlternateSetting       0
     bNumEndpoints           2
     bInterfaceClass       255 Vendor Specific Class
     bInterfaceSubClass      3
     bInterfaceProtocol      0
     iInterface              0
     ** UNRECOGNIZED:  06 24 f1 02 01 01
     Endpoint Descriptor:
       bLength                 7
       bDescriptorType         5
       bEndpointAddress     0x03  EP 3 OUT
       bmAttributes            2
         Transfer Type            Bulk
         Synch Type               None
         Usage Type               Data
       wMaxPacketSize     0x0200  1x 512 bytes
       bInterval               1
     Endpoint Descriptor:
       bLength                 7
       bDescriptorType         5
       bEndpointAddress     0x84  EP 4 IN
       bmAttributes            2
         Transfer Type            Bulk
         Synch Type               None
         Usage Type               Data
       wMaxPacketSize     0x0200  1x 512 bytes
       bInterval               0
   Interface Descriptor:
     bLength                 9
     bDescriptorType         4
     bInterfaceNumber        3
     bAlternateSetting       1
     bNumEndpoints           2
     bInterfaceClass       255 Vendor Specific Class
     bInterfaceSubClass      3
     bInterfaceProtocol      0
     iInterface              0
     Endpoint Descriptor:
       bLength                 7
       bDescriptorType         5
       bEndpointAddress     0x03  EP 3 OUT
       bmAttributes            3
         Transfer Type            Interrupt
         Synch Type               None
         Usage Type               Data
       wMaxPacketSize     0x0200  1x 512 bytes
       bInterval               4
     Endpoint Descriptor:
       bLength                 7
       bDescriptorType         5
       bEndpointAddress     0x85  EP 5 IN
       bmAttributes            3
         Transfer Type            Interrupt
         Synch Type               None
         Usage Type               Data
       wMaxPacketSize     0x0200  1x 512 bytes
       bInterval               4
Device Qualifier (for other device speed):
 bLength                10
 bDescriptorType         6
 bcdUSB               2.00
 bDeviceClass          255 Vendor Specific Class
 bDeviceSubClass         0
 bDeviceProtocol       255
 bMaxPacketSize0        64
 bNumConfigurations      1
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x0001
 Self Powered


-- 
Keith A Milner
