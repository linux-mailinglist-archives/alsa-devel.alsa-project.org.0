Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 506DA36A0CB
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Apr 2021 13:11:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB22A1734;
	Sat, 24 Apr 2021 13:10:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB22A1734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619262705;
	bh=uZdu5iogbMuYULN9DAVg3v4l4FWpdb+o2DUVGNnup14=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RR//m9g3SojR9cpJyyivDNqFkSCHwU3w6uLK7B977aADC00+peBabEEjl0l5GG6rq
	 jNPmMezi25cT969GkCM+8oHyHHYkdGYIdDLvfoMeMWMk3CXVJ8F1AuIR/HFDdTkt6z
	 /BsNExTSXMjaZdkMDSc7HjcoG4W/cG4DzdYJ85uE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D00DF80168;
	Sat, 24 Apr 2021 13:10:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 124F3F80253; Sat, 24 Apr 2021 13:10:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE5E0F80083
 for <alsa-devel@alsa-project.org>; Sat, 24 Apr 2021 13:10:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE5E0F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=superlative.org header.i=@superlative.org
 header.b="x0JZdFIW"
Received: by mail-ot1-x332.google.com with SMTP id
 f75-20020a9d03d10000b0290280def9ab76so42472923otf.12
 for <alsa-devel@alsa-project.org>; Sat, 24 Apr 2021 04:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=superlative.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=TL/MZhl/LUsPs3loHHLf9pEvrv/UkGEV7OHucMQaZJ0=;
 b=x0JZdFIWJnc3SeR4dPictC//+4nwvOmD4b79hu0RLH19vU0x1A/9BtUWMxjxjU1hA6
 voFswzd8B1id9bUXgNe9pB7NfMjbGYud6Iuk9L5FUJpLd3IynZzUDEfQaX+3sz2mq/bD
 /nBRkyt9DDLV7iuJ3lk4gF2wUovNKIxAjAnrEWZmTuXhpGlYdd21c0r5kQLJVVPoUu1F
 OgoAZNfd51EvtNXsW7h2yUsP2DYZXHjhg20nFMus5PSdztCqUOjNtLLzePYzZ0X3Luke
 w7cNUAgb5kVZCnVk4fUG1Z4Kh7/GHXgpcNRiS/wbTtrKBwvDtsngPlnbu6/m9HDWVhfC
 WdkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=TL/MZhl/LUsPs3loHHLf9pEvrv/UkGEV7OHucMQaZJ0=;
 b=rVm2QPYSV7cZeft9j1CAE8f0oEBTPMPnmGQP7u31v7vSrWRqZB7uD2Jx6GVarkLKXg
 j3g4rvj+F3M9SleiJO9sSS0pauFFWk2ZL1Ot8CrxEZad4+8bIvN5bO8bCvI/8wSJgQPV
 vaJIlyuqygh0k9/ahqgqGiFStrT6x8fm8DEDTxfSjbH01QjGBt5CVXp7TARsnik38g4d
 cm2yQlzImZk1A+KG7ZbdKur6vJJ1AZbK3fegvgV4zUf2s+0Ttf/YryEleNtGySodLb1X
 +Ed+klyUBnLv9pY0N94E1tGSTAjd+JunLWPpQkTbhJtskhzuZbCnFWP+VjSv32xXQIcW
 x0Yg==
X-Gm-Message-State: AOAM530Z9w4b69XIqxEi1UZ9eYJl7BisKCOxsDL4bEv5rrThniKk8xfq
 /XFjvqXON/ToQp9nZTD9lAqadiYIfn0GnFceIDJhRvvNwG8ADA==
X-Google-Smtp-Source: ABdhPJxJhFgT3k2gMzht7Lyg9FO5qovOpIHwHxbiNuNtCTLFNXsqxwKRGowsdYEzh4oIgulrDqzxNKTIm1SM1nN61oE=
X-Received: by 2002:a9d:4713:: with SMTP id a19mr6615520otf.71.1619262603864; 
 Sat, 24 Apr 2021 04:10:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210422120413.457-1-tiwai@suse.de>
 <20210422120413.457-2-tiwai@suse.de>
 <CAHXb3bcKvPSceMuvrq-X8dUyxdrH6iAHTHq_RgTXoAAiXygwUQ@mail.gmail.com>
 <s5h1rb173ho.wl-tiwai@suse.de>
In-Reply-To: <s5h1rb173ho.wl-tiwai@suse.de>
From: Keith Milner <maillist@superlative.org>
Date: Sat, 24 Apr 2021 12:09:53 +0100
Message-ID: <CAPMdQDmd8S_SnFycxjh02hzUNG-PuNrc5jYroX0niOuyNdO_UQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ALSA: usb-audio: Generic application of implicit fb
 to Roland/BOSS devices
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hi,
I updated to the latest "for-next" branch and did some testing, including
digging out some old Roland/Boss stuff from my cupboard, and the following
all work for both capture and playback:

Boss Katana (specifically Katana 100W mk1)
Boss GT-1
Boss GT-001
Boss BR-80
Roland V-Studio 20

The only failure was a Roland SD-50 unit which worked on capture, but did
not play back unless capture was running at the same time. I think I
previously tested this with Takashi-san, and it didn't work then, but we
didn't follow up on it as we were focusing on other devices.

I may try to dig into this some more, but the lsusb follows if anyone wants
to make any suggestions. I'm actually not, personally, that worried about
this particular device being fully working as it works for me in Ardour
(which opens both capture and playback at the same time), but I thought I
would throw it in in case there was an obvious case which might apply to
other Roland/Boss devices.

Bus 001 Device 015: ID 0582:0114 Roland Corp. SD-50
Device Descriptor:
 bLength                18
 bDescriptorType         1
 bcdUSB               1.10
 bDeviceClass          255 Vendor Specific Class
 bDeviceSubClass         0
 bDeviceProtocol       255
 bMaxPacketSize0        64
 idVendor           0x0582 Roland Corp.
 idProduct          0x0114 SD-50
 bcdDevice            1.00
 iManufacturer           1 Roland
 iProduct                2 SD-50
 iSerial                 0
 bNumConfigurations      1
 Configuration Descriptor:
   bLength                 9
   bDescriptorType         2
   wTotalLength       0x00a7
   bNumInterfaces          3
   bConfigurationValue     1
   iConfiguration          0
   bmAttributes         0x80
     (Bus Powered)
   MaxPower              480mA
   Interface Descriptor:
     bLength                 9
     bDescriptorType         4
     bInterfaceNumber        0
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
     bInterfaceNumber        0
     bAlternateSetting       1
     bNumEndpoints           1
     bInterfaceClass       255 Vendor Specific Class
     bInterfaceSubClass      2
     bInterfaceProtocol      2
     iInterface              0
     ** UNRECOGNIZED:  07 24 01 01 00 01 00
     ** UNRECOGNIZED:  0b 24 02 01 02 03 18 01 44 ac 00
     Endpoint Descriptor:
       bLength                 7
       bDescriptorType         5
       bEndpointAddress     0x01  EP 1 OUT
       bmAttributes            9
         Transfer Type            Isochronous
         Synch Type               Adaptive
         Usage Type               Data
       wMaxPacketSize     0x0140  1x 320 bytes
       bInterval               1
   Interface Descriptor:
     bLength                 9
     bDescriptorType         4
     bInterfaceNumber        1
     bAlternateSetting       0
     bNumEndpoints           0
     bInterfaceClass       255 Vendor Specific Class
     bInterfaceSubClass      2
     bInterfaceProtocol      1
     iInterface              0
   Interface Descriptor:
     bLength                 9
     bDescriptorType         4
     bInterfaceNumber        1
     bAlternateSetting       1
     bNumEndpoints           1
     bInterfaceClass       255 Vendor Specific Class
     bInterfaceSubClass      2
     bInterfaceProtocol      1
     iInterface              0
     ** UNRECOGNIZED:  07 24 01 07 00 01 00
     ** UNRECOGNIZED:  0b 24 02 01 02 03 18 01 44 ac 00
     Endpoint Descriptor:
       bLength                 7
       bDescriptorType         5
       bEndpointAddress     0x82  EP 2 IN
       bmAttributes            5
         Transfer Type            Isochronous
         Synch Type               Asynchronous
         Usage Type               Data
       wMaxPacketSize     0x0140  1x 320 bytes
       bInterval               1
   Interface Descriptor:
     bLength                 9
     bDescriptorType         4
     bInterfaceNumber        2
     bAlternateSetting       0
     bNumEndpoints           2
     bInterfaceClass       255 Vendor Specific Class
     bInterfaceSubClass      3
     bInterfaceProtocol      0
     iInterface              0
     ** UNRECOGNIZED:  06 24 f1 02 03 03
     Endpoint Descriptor:
       bLength                 7
       bDescriptorType         5
       bEndpointAddress     0x03  EP 3 OUT
       bmAttributes            2
         Transfer Type            Bulk
         Synch Type               None
         Usage Type               Data
       wMaxPacketSize     0x0040  1x 64 bytes
       bInterval               0
     Endpoint Descriptor:
       bLength                 7
       bDescriptorType         5
       bEndpointAddress     0x84  EP 4 IN
       bmAttributes            2
         Transfer Type            Bulk
         Synch Type               None
         Usage Type               Data
       wMaxPacketSize     0x0040  1x 64 bytes
       bInterval               0
   Interface Descriptor:
     bLength                 9
     bDescriptorType         4
     bInterfaceNumber        2
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
       bmAttributes            2
         Transfer Type            Bulk
         Synch Type               None
         Usage Type               Data
       wMaxPacketSize     0x0040  1x 64 bytes
       bInterval               0
     Endpoint Descriptor:
       bLength                 7
       bDescriptorType         5
       bEndpointAddress     0x84  EP 4 IN
       bmAttributes            3
         Transfer Type            Interrupt
         Synch Type               None
         Usage Type               Data
       wMaxPacketSize     0x0040  1x 64 bytes
       bInterval               1
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x0000
 (Bus Powered)


Regards,

Keith







On Fri, 23 Apr 2021 at 10:29, Takashi Iwai <tiwai@suse.de> wrote:

> On Thu, 22 Apr 2021 21:20:19 +0200,
> Mike Oliphant wrote:
> >
> > I had wondered whether the hardcoded endpoints were necessary (or always
> > accurate).
> >
> > This method seems much cleaner, and I can report that it is working as
> > expected (playback-only, record-only, and full duplex) on the BOSS GT-1.
>
> Thanks for confirmation.
>
> FWIW, the patches are on my for-next branch, destined for 5.13
> kernel.
>
>
> Takashi
>


-- 
-- 
Keith A Milner
