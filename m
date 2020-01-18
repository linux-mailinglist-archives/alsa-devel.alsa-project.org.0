Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D244141CD7
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jan 2020 08:21:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B63111671;
	Sun, 19 Jan 2020 08:20:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B63111671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579418486;
	bh=naGZM0mtK8T6itG3BXjzWrzBpixe6s4M+Ki9kdsVqUo=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gI9uwLh7WkcU2NJWAFWXCFrxim5fO1A8LRbOKbG/aqjQZbaNH9Ie7WPxorqQblRH9
	 YmAhOQEIbu7MTjdUOPUzeWiHDpdhFFizgF7phkjhQ1CWEMV/z8FUNtzdfWbqD8Qj4c
	 IM+gxbmQkRDPkrEcXsR3zFG+xOgrscMhlqW/IE5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFAE7F802BE;
	Sun, 19 Jan 2020 08:14:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DF3EF8014E; Sun, 19 Jan 2020 00:34:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C78DF80126
 for <alsa-devel@alsa-project.org>; Sun, 19 Jan 2020 00:34:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C78DF80126
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="nt7VQA7r"
Received: by mail-io1-xd41.google.com with SMTP id t26so29939402ioi.13
 for <alsa-devel@alsa-project.org>; Sat, 18 Jan 2020 15:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=bLjVanf0Z937OnesgrvWPlxQpFRsWbQr3VEqMJ42Rdw=;
 b=nt7VQA7re5lSGoO3XPdYS3tWEEeGRrvYTcwhOEf9L+gvM9VhXWIxYIQQdEvfiXsgw6
 Tn4IkWH05C0NXOxwUXgAqZf/K9FCFA2UV62gFVk0VMDpwbArjeny+JHZwCTFt7gDuLZh
 Z/W9w8PN/TlhSbN1u7w9Ub4lYyPtWscs2ZTXSoKC/8gMjha4Pfs8/rJ86ircr3yHzbpo
 m9BAt4CZEvbL1fGwhh6pr9PQtOV5whPW3bG/9R4r4GsYYcXNwO0CyrU1VR0X7HsurzjI
 bZ/5Y8Q4h2EW8JxDjIZPpQahBzfJSFaDaCGLIEfzaLeMArvIUJQ2zqptDi+0D5LVVIRh
 ChmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bLjVanf0Z937OnesgrvWPlxQpFRsWbQr3VEqMJ42Rdw=;
 b=BEpe62ipMbgus2zv+hfbpYT6AteP36ZnYH02BcEXkORgDfGw3B+LY800DtQ7JMdq4A
 t/snLGDSzmug5wfFR0az0eu//N4q9A5M/ZOviPMI/FoONJb5yq5oVumSx+wjE8iI7jp4
 Hx3unsg7W/o33bWALV8ORpJy95f/WrhxAtQKon73P4jgM6PuA5xtfzWGhDipV2cpM6Hy
 0u29DFpCsOks1dEYNBGBlPa1olcdNzD0lZtgVSYXS+hNRu9kEH9KcSHU46Cu3J+S4ZVA
 28/PU/ZdlCxa9ai0UmF8ygqS045O4zCeAT8enzYcDLnubueXaJowP8j7ZAkP9mIb8w70
 VF4Q==
X-Gm-Message-State: APjAAAXyvh2zr1KW1onZqQ1kChrXbN6ltFI4LhhXpLsmlx/l4ctnMVQk
 TZMa/yaHFCSsA4rEC3ow4lGGY5fGrDz8PYSLinT61KBPpAc=
X-Google-Smtp-Source: APXvYqwdX8CzdQF0FXRDPBHAtvTQUNpNhmdgsJMB9T4yhEvQMMjnXJPm3v4lovQrSAvXQ32DtPr1XQqBTz7bMlud/jM=
X-Received: by 2002:a6b:6c0f:: with SMTP id a15mr37685204ioh.13.1579390457483; 
 Sat, 18 Jan 2020 15:34:17 -0800 (PST)
MIME-Version: 1.0
From: Mike Oliphant <oliphant@nostatic.org>
Date: Sat, 18 Jan 2020 15:34:06 -0800
Message-ID: <CAHXb3beWDCNvpRPTt7xahBvhRDaZ2bYL3dBH0QSXjgxXXs=VWw@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Sun, 19 Jan 2020 08:13:54 +0100
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] BOSS GT-1 USB audio and implicit feedback
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

I've been digging around in the USB audio section of the kernel for the
past month or so trying unsuccessfully to get audio on my BOSS GT-1
pedalboard to work in Linux.

The device is recognized by the current kernel, but aplay just hangs when
trying to output to it.

My searches led me to this now-resolved issue with implicit feedback quirk
handling on BOSS Katana amplifiers:

https://bugzilla.kernel.org/show_bug.cgi?id=195223

I have patched pcm.c with a similar fix for the GT-1 in
set_sync_ep_implicit_fb_quirk():

        case USB_ID(0x0582, 0x01d6): /* BOSS GT-1 */
                return 0;

This results in successful playback, but with frequent pops/clicks in the
audio - even with high buffer sizes under very low load - likely
attributable to the lack of implicit feedback.

The GT-1 has come up on the mailing list before - some good information is
here, but no resolution:

https://mailman.alsa-project.org/pipermail/alsa-devel/2018-January/130957.html

My understanding from what I think I know about implicit feedback and the
output of lsusb, is that the device is designed to operate with
simultaneous capture/playback, with feedback being provided in the capture
stream to be used to sync both capture and playback.

It seems like this is what the feedback quirk might be trying to do, since
this is what I see from dmesg when trying to play audio with aplay on the
stock kernel:

[  218.530738] usb 1-1.1: setting usb interface 1:1
[  218.530753] Creating new playback data endpoint #d
[  218.530772] Creating new capture data endpoint #8e
[  218.531687] usb 1-1.1: Setting params for ep #d (type 0, 12 urbs), ret=0
[  218.531706] usb 1-1.1: match_endpoint_audioformats: (fmt @ed1fbd45)
score 2
[  218.531840] usb 1-1.1: Setting params for ep #8e (type 0, 12 urbs), ret=0
[  218.531855] usb 1-1.1: Starting data EP @f114d201
[  218.532514] usb 1-1.1: Starting sync EP @984e9cce

I have also tried to manually set the feedback endpoint in
set_sync_ep_implicit_fb_quirk():

        case USB_ID(0x0582, 0x01d6): /* BOSS GT-1 */
                ep = 0x8e;
                ifnum = 2;
                goto add_sync_ep_from_ifnum;

but this results in the same behavior.

Any suggestions on what else to try would be much appreciated. It seems
like the device is *very* close to working properly.

Output from lsusb for the interface follows.

Thanks!

Mike

---
Output from lsusb:

Bus 001 Device 003: ID 0582:01d6 Roland Corp.
Couldn't open device, some information will be missing
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
  iManufacturer           1
  iProduct                2
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
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
