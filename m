Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE21358EE9
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 23:02:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2437A166D;
	Thu,  8 Apr 2021 23:01:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2437A166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617915729;
	bh=ZPIgh69lz5UjJlashbUzjoEsqLitRJrjMpzXaDHadls=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gOr/NshG9SB6Twk78U2n+WraUM19QDqKT454G4zlh9u59oBeUh8HTEVIKqNHchJZt
	 lKa/apoH0CwzX5TdUrTKMWYWzqCmTT+NkcByUN9a3k6IiYj2DfkRBq70zkwXrlZwWG
	 LyRhFzBqMpqBZEupLim7eV7SZAXDf+mlL7AGt+gA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BFC7F80246;
	Thu,  8 Apr 2021 23:00:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42112F8020B; Thu,  8 Apr 2021 23:00:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE973F80162
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 23:00:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE973F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iJ6irpe5"
Received: by mail-qk1-x729.google.com with SMTP id v70so3753396qkb.8
 for <alsa-devel@alsa-project.org>; Thu, 08 Apr 2021 14:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WtQz76ajUh6lF1LHnsA3AcmCmQO71D9H2KVnb6B5qCY=;
 b=iJ6irpe5LWmLOK57kvpIEXsaNMxmySXNJENEJomYp/4CBR3cO7F/slE9Phy6rYkHtl
 RRDYCb48f9YswwTMwBduZMpsSSiGmL1GJDkZxUSs2O3D+NOYweTixSiZ/mEtg8/1ZnE/
 QHzKLA1s4hkmTZ0iKawT445k1gtaNcfzLGPtZLBqIuy8aKi1Y6+W/WIQCw4Ffp1747Db
 G5GMPIqtD8iGB68czi+JHddjkjmqx0qK2XVtEH3ZWLi6fNsFPU+NOWFS+CzQ694lWdwh
 ya7napfzSs3kNHyACgJ3ku13L1N8dyJgIM7oDDgry4HFhmF7YKvWQyEns+LrOAP5naFs
 TVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WtQz76ajUh6lF1LHnsA3AcmCmQO71D9H2KVnb6B5qCY=;
 b=TivJfPoq4TnlG1iWIE1cEf9kCDvxQPHt2SxFOyl48GwGWPTxX7iTgTtBJvSQ6iBgC+
 tNm26QO+1RXDfF6jKlLPIEtX0iaa6sGb2BMtUwCi66zd40Ris/kDQdpAUWk65gMZy8aW
 /2O4UEwJ0R5gNzzmQN76MGD+kFOmkni8zLj5O9YWNnBHclh/q+OcFXJQjl11sDS4edLv
 8Oy8YIJ9QJVpM4jX+pOtqaUUPlNXOYOioy/VYRSBHcXvQNB/O49HRwBvB3NXhbOML555
 fQsHOCos8zOs0LRuqS1+Z5yVr3IE5AW9POD2w9eSlc+1+km09dGQKjM46ILKJSr5HN6t
 CeVw==
X-Gm-Message-State: AOAM533tnR/jL1n+Bv4g0D5Xx7gTwip1//8QbqcR+toAowaQW44uIQv9
 tPEPtVBNwztUfVVF6T2dAOIc42l9nz8oM2703qo=
X-Google-Smtp-Source: ABdhPJwGT//3PXiMzZj+eZD+GdmKLHTGAJWIpw35fpvMndq0ZhsHLL0WFKa1QnFDyzbmP0xtgHY4N1Dhfm+my5SqyPk=
X-Received: by 2002:a05:620a:24a:: with SMTP id
 q10mr3550079qkn.366.1617915632138; 
 Thu, 08 Apr 2021 14:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAHXb3begced9GYCQ4a6qLOK2PrQR9gHeSvb3HAG29DVpZ+vwiQ@mail.gmail.com>
 <CAEsQvcu5freEXMFwBRH0aQsT9=ngvOY_SkA6dmfs_YVvMYYuJw@mail.gmail.com>
 <CAHXb3bddyVMXrZHxmtz5AM4j7TRwWSbZcLM94JjcbOMfrd4+2g@mail.gmail.com>
 <CAEsQvcs+-O_eGW928eLdbde9EhWiD3qxjCuv2iW477DZDprkBw@mail.gmail.com>
 <CAHXb3beRycUteezmWRqO0u3kZnV8TbCNAqfO3ksjVoJ6WSrdBw@mail.gmail.com>
 <CAEsQvcuBYnY_k1Rd8US5qrDKcJas62Q5kA4P0NSEJODBCcZMuw@mail.gmail.com>
 <CAHXb3bfD_YivP3r4wOeb8bcXmAU+_+eeZwudW6f1pxfYtpnq1g@mail.gmail.com>
 <CAEsQvcsCJUi8eP_t8MGUKf0zSf7Zmqiof8b0fmk-XhZtUScbmg@mail.gmail.com>
 <CAEsQvcspNZFS4gbS=dQ1enkshVnG+-=xvoc8kskmoweTQjQhRw@mail.gmail.com>
 <CAEsQvcurb3s_W47f3N1h1=+oW4rX8tUSfQKv+_zyMMXXqJCBVw@mail.gmail.com>
 <CAHXb3bf4estasrkRhyME9w2hO6UmwUPAY+Vg6e4kvCnZh=R2zA@mail.gmail.com>
 <CAEsQvcs2Ov71mpSCXgefEFV1QQeqND871nu4+BV5KfT3kXtu+Q@mail.gmail.com>
 <CAOsVg8ooWOafVv-T-hVsekO3tuPPe=AhTHZ1qzjbf1X5astXXA@mail.gmail.com>
In-Reply-To: <CAOsVg8ooWOafVv-T-hVsekO3tuPPe=AhTHZ1qzjbf1X5astXXA@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Thu, 8 Apr 2021 18:05:12 -0300
Message-ID: <CAEsQvcuUtKRvvzN3Jq75apFkcH05C3qxKLsRRhJK7VcpVBF9PA@mail.gmail.com>
Subject: Re: Implicit feedback on BOSS GT-1, the saga continues...
To: Lucas <jaffa225man@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Mike Oliphant <oliphant@nostatic.org>
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

Em Qui, 8 de abr de 2021 17:31, Lucas <jaffa225man@gmail.com> escreveu:

> It's easy enough to get the lsusb -v output you wanted, but I plan to
> build one kernel for another topic next.  After that, I'll try re-enabling
> your code plus the capture quirk table entry.
>

No need to rebuild the kernel, Lucas, cd to /usr/src/linux and make -C .
M=sound/usb

This will rebuild the usb sound modules only, which will taint the kernel
but at least will spare you some time and some reboots.

After building the modules, modprobe -r the modules you want to reload,
copy the relevant .ko files to the proper place inside /lib/modules and use
the depmod command.



> Here's lsusb -v for the Roland Boutique D-05, but it seems the endpoints
> are the same addresses:
> Bus 002 Device 005: ID 0582:01ff Roland Corp. Boutique
> Couldn't open device, some information will be missing
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass          255 Vendor Specific Class
>   bDeviceSubClass         0
>   bDeviceProtocol       255
>   bMaxPacketSize0        64
>   idVendor           0x0582 Roland Corp.
>   idProduct          0x01ff
>   bcdDevice            1.00
>   iManufacturer           1 Roland
>   iProduct                2 Boutique
>   iSerial                 3 BQ_D382DDA054B5533321C1F1743
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x010e
>     bNumInterfaces          4
>     bConfigurationValue     1
>     iConfiguration          0
>     bmAttributes         0x80
>       (Bus Powered)
>     MaxPower              500mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           0
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass    255 Vendor Specific Subclass
>       bInterfaceProtocol      0
>       iInterface              0
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       0
>       bNumEndpoints           0
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      2
>       bInterfaceProtocol      2
>       iInterface              0
>       ** UNRECOGNIZED:  06 24 f1 01 00 00
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       1
>       bNumEndpoints           1
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      2
>       bInterfaceProtocol      2
>       iInterface              0
>       ** UNRECOGNIZED:  07 24 01 01 00 01 00
>       ** UNRECOGNIZED:  0b 24 02 01 02 04 18 01 00 77 01
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x0d  EP 13 OUT
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x0070  1x 112 bytes
>         bInterval               1
>         INTERFACE CLASS:  06 24 f1 04 12 00
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       2
>       bNumEndpoints           1
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      2
>       bInterfaceProtocol      2
>       iInterface              0
>       ** UNRECOGNIZED:  07 24 01 01 00 01 00
>       ** UNRECOGNIZED:  0b 24 02 01 02 04 18 01 00 77 01
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x0d  EP 13 OUT
>         bmAttributes            5
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Data
>         wMaxPacketSize     0x0070  1x 112 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        2
>       bAlternateSetting       0
>       bNumEndpoints           0
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      2
>       bInterfaceProtocol      1
>       iInterface              0
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        2
>       bAlternateSetting       1
>       bNumEndpoints           1
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      2
>       bInterfaceProtocol      1
>       iInterface              0
>       ** UNRECOGNIZED:  07 24 01 07 00 01 00
>       ** UNRECOGNIZED:  0b 24 02 01 02 04 18 01 00 77 01
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x8e  EP 14 IN
>         bmAttributes           37
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Implicit feedback Data
>         wMaxPacketSize     0x0070  1x 112 bytes
>         bInterval               1
>         INTERFACE CLASS:  06 24 f1 04 12 00
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        2
>       bAlternateSetting       2
>       bNumEndpoints           1
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      2
>       bInterfaceProtocol      1
>       iInterface              0
>       ** UNRECOGNIZED:  07 24 01 07 00 01 00
>       ** UNRECOGNIZED:  0b 24 02 01 02 04 18 01 00 77 01
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x8e  EP 14 IN
>         bmAttributes           37
>           Transfer Type            Isochronous
>           Synch Type               Asynchronous
>           Usage Type               Implicit feedback Data
>         wMaxPacketSize     0x0070  1x 112 bytes
>         bInterval               1
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        3
>       bAlternateSetting       0
>       bNumEndpoints           2
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      3
>       bInterfaceProtocol      0
>       iInterface              0
>       ** UNRECOGNIZED:  06 24 f1 02 01 01
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x03  EP 3 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               1
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x84  EP 4 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               0
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        3
>       bAlternateSetting       1
>       bNumEndpoints           2
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      3
>       bInterfaceProtocol      0
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x03  EP 3 OUT
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               4
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x85  EP 5 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               4
>
>
