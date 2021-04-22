Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0487A3682B2
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Apr 2021 16:50:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 796A9167A;
	Thu, 22 Apr 2021 16:49:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 796A9167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619103028;
	bh=QKXYTqS0srVIGwwfShAJ0YizL2FbVtUxRFNsjnUYMkk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JZzERSfCJcbd5FJq4OPFJgkMLX1QpfvvkJX+uUADboO9MSktSOxAwwz2BBY/OwyOn
	 VZYsVezgriB4DCYfJuNPscqpokTYn4wW1Z03P/hYX6SJ/YLi1RMoUPS7fUsW0WZv+4
	 IUB9L/QPzT+OeMNj8ftbSiFg4dS/XjZNh9wGF/KI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF4ABF80273;
	Thu, 22 Apr 2021 16:48:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39D5FF80253; Thu, 22 Apr 2021 16:48:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42C0EF80059
 for <alsa-devel@alsa-project.org>; Thu, 22 Apr 2021 16:48:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42C0EF80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=superlative.org header.i=@superlative.org
 header.b="dk0A3ZLd"
Received: by mail-qt1-x832.google.com with SMTP id q4so5625619qtn.5
 for <alsa-devel@alsa-project.org>; Thu, 22 Apr 2021 07:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=superlative.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Bi59W6Osi5P99v5y7XCyOCk6aWdfmkGxn3hgmpm88QI=;
 b=dk0A3ZLdAL+CT0QBpqRt382CCN2kEqBicJE2VE5Rs0I+wQKjaBrPx4zYOva90VTUrd
 VJhfDBV5ylLifn/IUxoDGNceUrkC3wjZkxV63vAXwovnWEPxvxtUiOT43nVF6hlq2vVF
 l4Pllyu/VMpA8mcRrBMQfkdkmdnoJZgAT1pZSJ8fzMBdsBXj8pXzyI4TnipgE4IfMARE
 T8UD4ExKwnHYx5ma6+AnZ1C8917HWisBUckTdE9k9nk2XXcpQEksYrD3yb+qdvROfKTh
 0DhLMXMUeMW/MFWD2IltkRnJLZXHjWGuTH/e3P1nBIzoIrxB4YYmqryScIBcbUN1bI/s
 qnGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bi59W6Osi5P99v5y7XCyOCk6aWdfmkGxn3hgmpm88QI=;
 b=DILDcpR3huan4HRKjEuaicAYh3VUm+3Owymr4YmHgIPEMrEYGUUGLgTPbXdTyT6vr2
 lYRyxfsKCgfG+fXqN6HZ6LvbBiq3gpWVJVEHOQKw0Hrd/yUIvJtnGI94vIiTbleUjH6c
 5NhuqDzLgzYJmi7y76IFCRh5F+cSL3SCk4k89UMUOuyD3rFueDUERltJ/oql7WMBbZ7K
 SBrEPy6DFUmNgV+14j3cS9uoawS9EtPJH52xvOoCYF+nx9GLsALssYEDx7O+HltR46B4
 +OfABiOBHOcCgmjLiT5kjvJFhWN/9Xs6Rvn2j1f9P6aJC60VrgVzeioKNlmQGTb8G+LL
 iPFA==
X-Gm-Message-State: AOAM533o8knVF9cbIAffngl/Dg9vP+QJWvsObU9eCVJc+YHZg3l0u1l8
 2qVPb4Spzwr+zyp4JtUT6bRYhuBuzKNUsrMQ
X-Google-Smtp-Source: ABdhPJzV+d93rUIgbxL69YiMvtxdu98NumEZWTo9SKkHSudQuGe3sDyyUDrSN91Ajk5FccrfOo0lgQ==
X-Received: by 2002:ac8:6f55:: with SMTP id n21mr3521704qtv.382.1619102927777; 
 Thu, 22 Apr 2021 07:48:47 -0700 (PDT)
Received: from localhost (grenville1.superlative.org. [81.187.25.35])
 by smtp.gmail.com with ESMTPSA id d3sm2335630qtm.56.2021.04.22.07.48.46
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 07:48:47 -0700 (PDT)
From: "Keith A. Milner" <maillist@superlative.org>
To: alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: usb-audio: Apply implicit feedback mode for BOSS
 devices
Date: Thu, 22 Apr 2021 15:41:16 +0100
Message-ID: <12753665.uLZWGnKmhe@kam-desktop>
In-Reply-To: <CAOsVg8p=yikaRQ-=RWdO8nWdC70tnw4kQ17KM-smShQvujrRJg@mail.gmail.com>
References: <20210414083255.9527-1-tiwai@suse.de>
 <5949663.lOV4Wx5bFT@kam-desktop>
 <CAOsVg8p=yikaRQ-=RWdO8nWdC70tnw4kQ17KM-smShQvujrRJg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

On Tuesday, 20 April 2021 05:20:57 BST Lucas wrote:
> Keith, if it's anything like the Roland devices I've tested with this
> long-awaited patch, could you show the JS-8's "lsusb -v"?

Output pasted further down.

> 
> For me, silence due to the wrong line takes the form of unheard output
> playback, while still working for input capture, so I'm not sure this has
> any bearing on your issue.

When testing Takashi-san's earlier patches, I had a mixture of experiences 
including (depending on the patch) some devices recording silence, some 
playing back silence, and some where the record would lock up until playback 
was started (or vice versa).

> 
> Takashi Iwai has indicated a likely connection between needing the
> IMPLICIT_FB_BOTH_DEVICE line if there's "Asynchronous" "Synch Type" for
> both input and output endpoints.  Otherwise, possibly, it should be
> reverted to IMPLICIT_FB_FIXED_DEVICE for the JS-8.

As you can see, this has "Asynchronous" "Synch Type" on EP4 IN and EP 5 OUT, 
so I don't think it's this.

Bus 001 Device 007: ID 0582:0109 Roland Corp. eBand JS-8
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          255 Vendor Specific Class
  bDeviceSubClass         0 
  bDeviceProtocol       255 
  bMaxPacketSize0        64
  idVendor           0x0582 Roland Corp.
  idProduct          0x0109 eBand JS-8
  bcdDevice            0.01
  iManufacturer           1 BOSS
  iProduct                2 JS-8
  iSerial                 0 
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x00a7
    bNumInterfaces          3
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
      ** UNRECOGNIZED:  0b 24 02 01 02 04 18 01 44 ac 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x05  EP 5 OUT
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0070  1x 112 bytes
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
      ** UNRECOGNIZED:  0b 24 02 01 02 04 18 01 44 ac 00
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes           37
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Implicit feedback Data
        wMaxPacketSize     0x0070  1x 112 bytes
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
      ** UNRECOGNIZED:  06 24 f1 02 02 02
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
        bEndpointAddress     0x82  EP 2 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
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
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               1
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               1
Device Qualifier (for other device speed):
  bLength                10
  bDescriptorType         6
  bcdUSB               2.00
  bDeviceClass            8 Mass Storage
  bDeviceSubClass         6 SCSI
  bDeviceProtocol        80 Bulk-Only
  bMaxPacketSize0        64
  bNumConfigurations      0
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x0001
  Self Powered

Regards,

Keith


