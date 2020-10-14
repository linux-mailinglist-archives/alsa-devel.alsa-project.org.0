Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCE128E828
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 22:59:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2315175C;
	Wed, 14 Oct 2020 22:58:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2315175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602709160;
	bh=9Pm7d0Xu1fkfQbaBYpSaaMxHbN3wA7IMnQRyRP/gUqs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hJB1FwAA+BvQVr7OBcWy2ze1F2jJRr4ghgqyKjVgjyiM1AocYL9PPpvBR5//Nrr/N
	 6FgE+3tf8Rb24JC4iks3RZ3V/A2prm1TbTxf3dKZvCQEie1YDPMQGt13kq5LKQb8oS
	 myIFf31ZP/VdDxEw8uzQxYt17LZytUkSK4n57XLQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7230EF8020D;
	Wed, 14 Oct 2020 22:57:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8FE4F80217; Wed, 14 Oct 2020 22:57:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F858F800F6
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 22:57:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F858F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=superlative.org header.i=@superlative.org
 header.b="Rq2ZlTEJ"
Received: by mail-oi1-x243.google.com with SMTP id m128so654510oig.7
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 13:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=superlative.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iUt0Ccx4e1tJdKX0yk+mwR27gAUYu3rfrWssWykQPwU=;
 b=Rq2ZlTEJoMVQGpBA7maeZG0veaRMK3j6fJecX9htD11fmgt6eyHbJp7FvOGmwd1W22
 QzTFsol6ooMV6z4V6hVjETBCDUoxhEkSqs7upbBSn6sGuq9CvRM5WDaTycJ4kf9nw8Yd
 L2IEvuL5XEqwrpKOAhae5LDLifwmWO3NRvu+oxeKjeGkfHRo3ZdOleEuV0Z/pF/Wlsk4
 rQt4VWfWhlUleuzXlK2FClQkJRwxHpfDEPhx7XRm65cAG+J15ZzAd35bAKpXlIE/SI4Q
 GaPFrt7Sc9A+nPmWvy0DF48EECduiD3Z7TJX6Kz9ElyZT7vrCrIRKiOKfVmaWCgB7oQA
 V9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iUt0Ccx4e1tJdKX0yk+mwR27gAUYu3rfrWssWykQPwU=;
 b=UCwgDx7jtERYL/7xEu10NFfnmYaQoJZvZuZHtOWQ+d1QfpC2igyoty3T/YSC8Gdvge
 bQDneTvXbKU/EZLZvRgBcQ5O48rNvhCSkIVLPTSYhe7HRv8ha+SHS2FBo81ioA5YVyZ5
 XHDgQmzTihTOxQaQqlxyVCY+pHptQyaYNgFX8xSbQvGdUwIic6Z6YPvxZONDfGkPqjjS
 BmdV0+8VszSIGPnX/dr/i1gyp4/nn3qSXsEHiDnLxO5t1rtLzwHTCtsDFxMyx9LtI3EN
 VqNhJNVkKmFzov4tt/35YMKz3hP+adr54vVJEL/2UE80PVE8Kl0KUTASmaFpS8VnRcZB
 xZ6g==
X-Gm-Message-State: AOAM5302m6qwPLqOSGxmnu0qlPY7ArkB872VzahcB0/7XCwTKNyn9vu/
 Sa5V3Q+b/uC+pml/BtgKwfgeGFIPNnk+2d9KdvVycA==
X-Google-Smtp-Source: ABdhPJyzMDXfnIs3/ZywzXqWIWpr63gBlD9MuBCpIt2TTGxYgO7Ogip+PADlA/+q2ZklSBclcKbhtPinPMJQntZM3I8=
X-Received: by 2002:aca:48c4:: with SMTP id v187mr9742oia.71.1602709047013;
 Wed, 14 Oct 2020 13:57:27 -0700 (PDT)
MIME-Version: 1.0
References: <20191011171937.8013-1-szszoke.code@gmail.com>
 <s5hftjriy1q.wl-tiwai@suse.de>
 <CAPMdQDmY7CdbrHyOwhJNFBREQ0EO1SKufRdN_YR6TG4zmJzXpA@mail.gmail.com>
 <CAHXb3bf+0uKS-+aEVsgebUbYPt1wCBZ7GLAjF57BrPDHcveuQQ@mail.gmail.com>
 <CAPMdQDmE3cgu2whqTxf7pFUoQusUYJKK7xLASev8JdWD-9oypQ@mail.gmail.com>
 <CAHXb3bdrPC_v0oAEkWDR-VH7NZ3uoFdSw-dzNo_Fwy8HzeTopA@mail.gmail.com>
 <CAPMdQDmiCDWTdfpbAwM7tJL+KiPApjd0jd46yPemw04-6CQWjg@mail.gmail.com>
 <CAHXb3bfgfHDYfkYEZOKttvNkpe+frBeeogzcoA7UBT+=3wqy1g@mail.gmail.com>
 <CAPMdQDmDzisnh1dqoE-Po4ALRRDwN1dxjQXYXeBuG+fN_gctzA@mail.gmail.com>
 <CAHXb3bdHc35WcC_4=wv_zRR_r-w4=boT1vbW0tZpYpn=Kb2-KA@mail.gmail.com>
In-Reply-To: <CAHXb3bdHc35WcC_4=wv_zRR_r-w4=boT1vbW0tZpYpn=Kb2-KA@mail.gmail.com>
From: Keith Milner <maillist@superlative.org>
Date: Wed, 14 Oct 2020 21:57:16 +0100
Message-ID: <CAPMdQD=08UxAO2RCVContMH5wLnqhXyNDoWqwPMQS420h=EA3w@mail.gmail.com>
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

I thought I would re-try the change you made. When I tried this last year
on my old laptop, I recall I couldn't get it working properly.

This time around it works... sort of, but isn't without some significant
issues for me. For a start, it only works in Jack. If I try to access the
alsa device directly (for instance, using ALSA mode in Ardour or using
Audacity) it doesn't work. It also fills my dmesg with error messages:

[  184.089158] usb 1-4: Unable to change format on ep #8e: already in use
[  184.089232] usb 1-4: Unable to change format on ep #8e: already in use
[  184.089401] usb 1-4: Unable to change format on ep #8e: already in use
[  184.089619] usb 1-4: Unable to change format on ep #8e: already in use

So, unfortunately, whilst it seems like it's a tactical fix for some
situations, it seems to be broken in other ways.

When I tried it on my GT-001 I got similar results, although only one
"Unable to change format on ep #8e: already in use" message this time
rather than the logs getting spammed. Interestingly, I got more xruns with
this as well.

Personally I'll be going back to how I had it before with the implicit
feedback disabled, as it's more reliable and functional for me, but it's
clear this one isn't solved yet.

Cheers,

Keith

On Wed, 14 Oct 2020 at 19:17, Mike Oliphant <oliphant@nostatic.org> wrote:

> That's also what I see from dmesg when I use the quirk device ID patch.
> I'm pretty sure it means that implicit feedback is not being enabled for
> your device.
>
> Since these devices are designed to work with implicit feedback, the ideal
> solution would be to have them work by using it, rather than disabling it.
>
> That said, patching the quirk code with the extra device IDs would make it
> so they at least produce output...
>
> The "fix" I'm currently using (linked to in my first response) makes the
> implicit feedback code not wait to send data until it has received some. It
> works perfectly for me, but success has been mixed for others so I didn't
> feel comfortable submitting it as a patch.
>
> FYI, I did a little write-up here:
>
>
> http://blog.nostatic.org/2020/01/getting-boss-gt-1-effects-processor-to.html
>
> It outlines my struggle with this issue - from trying the quirk ID patch,
> to messing with the sample rate, and finally to modifying the implicit
> feedback behavior.
>
> Mike
>
> On Wed, Oct 14, 2020 at 10:23 AM Mailing Lists <maillist@superlative.org>
> wrote:
>
>> Hi Mike,
>> I'm getting this:
>>
>> [Oct14 18:21] snd_usb_audio:set_format: usb 1-4: setting usb interface 1:1
>> [  +0.000003] snd_usb_audio:snd_usb_add_endpoint: usb 1-4: Re-using EP d
>> in iface 1,1 @00000000d0aa6911
>> [  +0.000018] snd_usb_audio:snd_usb_endpoint_set_params: usb 1-4: Setting
>> params for ep #d (type 0, 3 urbs), ret=0
>> [  +0.000002] snd_usb_audio:start_endpoints: usb 1-4: Starting data EP
>> @00000000d0aa6911
>>
>> Cheers,
>>
>> Keith
>>
>> On Wed, 14 Oct 2020 at 17:46, Mike Oliphant <oliphant@nostatic.org>
>> wrote:
>>
>>> Hi Keith,
>>>
>>> The lsusb output just shows that the endpoint is there, but not that it
>>> is getting connected when the device is initialized. Can you check dmesg
>>> output when you use the device for playback?
>>>
>>> This is what I see from dmesg when the implicit feedback endpoint is
>>> being used:
>>>
>>> [   26.787360] usb 1-1.1: setting usb interface 1:1
>>> [   26.787367] Creating new playback data endpoint #d
>>> [   26.787375] Creating new capture data endpoint #8e
>>> [   26.787678] usb 1-1.1: Setting params for ep #d (type 0, 12 urbs),
>>> ret=0
>>> [   26.787685] usb 1-1.1: match_endpoint_audioformats: (fmt @6bc43c84)
>>> score 2
>>> [   26.787745] usb 1-1.1: Setting params for ep #8e (type 0, 12 urbs),
>>> ret=0
>>> [   26.787751] usb 1-1.1: Starting data EP @a14130b5
>>> [   26.788420] usb 1-1.1: Starting sync EP @720fb7cf
>>>
>>> Note the "Starting sync EP".
>>>
>>> Mike
>>>
>>> On Wed, Oct 14, 2020 at 9:35 AM Mailing Lists <maillist@superlative.org>
>>> wrote:
>>>
>>>> On Wed, 14 Oct 2020 at 17:12, Mike Oliphant <oliphant@nostatic.org>
>>>> wrote:
>>>>
>>>>> Keith - are you getting an implicit feedback endpoint created when you
>>>>> run with the patch?
>>>>>
>>>>
>>>> Hi Mike,
>>>>
>>>> It appears that I do. For reference I'm on kernel 5.4.0-51:
>>>>
>>>> Bus 001 Device 007: ID 0582:01d6 Roland Corp. GT-1
>>>> Device Descriptor:
>>>>  bLength                18
>>>>  bDescriptorType         1
>>>>  bcdUSB               2.00
>>>>  bDeviceClass          255 Vendor Specific Class
>>>>  bDeviceSubClass         0
>>>>  bDeviceProtocol       255
>>>>  bMaxPacketSize0        64
>>>>  idVendor           0x0582 Roland Corp.
>>>>  idProduct          0x01d6
>>>>  bcdDevice            0.00
>>>>  iManufacturer           1 BOSS
>>>>  iProduct                2 GT-1
>>>>  iSerial                 0
>>>>  bNumConfigurations      1
>>>>  Configuration Descriptor:
>>>>    bLength                 9
>>>>    bDescriptorType         2
>>>>    wTotalLength       0x00bc
>>>>    bNumInterfaces          4
>>>>    bConfigurationValue     1
>>>>    iConfiguration          0
>>>>    bmAttributes         0xc0
>>>>      Self Powered
>>>>    MaxPower                0mA
>>>>    Interface Descriptor:
>>>>      bLength                 9
>>>>      bDescriptorType         4
>>>>      bInterfaceNumber        0
>>>>      bAlternateSetting       0
>>>>      bNumEndpoints           0
>>>>      bInterfaceClass       255 Vendor Specific Class
>>>>      bInterfaceSubClass    255 Vendor Specific Subclass
>>>>      bInterfaceProtocol      0
>>>>      iInterface              0
>>>>    Interface Descriptor:
>>>>      bLength                 9
>>>>      bDescriptorType         4
>>>>      bInterfaceNumber        1
>>>>      bAlternateSetting       0
>>>>      bNumEndpoints           0
>>>>      bInterfaceClass       255 Vendor Specific Class
>>>>      bInterfaceSubClass      2
>>>>      bInterfaceProtocol      2
>>>>      iInterface              0
>>>>      ** UNRECOGNIZED:  06 24 f1 01 00 00
>>>>    Interface Descriptor:
>>>>      bLength                 9
>>>>      bDescriptorType         4
>>>>      bInterfaceNumber        1
>>>>      bAlternateSetting       1
>>>>      bNumEndpoints           1
>>>>      bInterfaceClass       255 Vendor Specific Class
>>>>      bInterfaceSubClass      2
>>>>      bInterfaceProtocol      2
>>>>      iInterface              0
>>>>      ** UNRECOGNIZED:  07 24 01 01 00 01 00
>>>>      ** UNRECOGNIZED:  0b 24 02 01 02 04 18 01 44 ac 00
>>>>      ** UNRECOGNIZED:  06 24 f1 04 16 00
>>>>      Endpoint Descriptor:
>>>>        bLength                 7
>>>>        bDescriptorType         5
>>>>        bEndpointAddress     0x0d  EP 13 OUT
>>>>        bmAttributes            5
>>>>          Transfer Type            Isochronous
>>>>          Synch Type               Asynchronous
>>>>          Usage Type               Data
>>>>        wMaxPacketSize     0x0038  1x 56 bytes
>>>>        bInterval               1
>>>>    Interface Descriptor:
>>>>      bLength                 9
>>>>      bDescriptorType         4
>>>>      bInterfaceNumber        2
>>>>      bAlternateSetting       0
>>>>      bNumEndpoints           0
>>>>      bInterfaceClass       255 Vendor Specific Class
>>>>      bInterfaceSubClass      2
>>>>      bInterfaceProtocol      1
>>>>      iInterface              0
>>>>    Interface Descriptor:
>>>>      bLength                 9
>>>>      bDescriptorType         4
>>>>      bInterfaceNumber        2
>>>>      bAlternateSetting       1
>>>>      bNumEndpoints           1
>>>>      bInterfaceClass       255 Vendor Specific Class
>>>>      bInterfaceSubClass      2
>>>>      bInterfaceProtocol      1
>>>>      iInterface              0
>>>>      ** UNRECOGNIZED:  07 24 01 07 00 01 00
>>>>      ** UNRECOGNIZED:  0b 24 02 01 02 04 18 01 44 ac 00
>>>>      ** UNRECOGNIZED:  06 24 f1 04 16 00
>>>>      Endpoint Descriptor:
>>>>        bLength                 7
>>>>        bDescriptorType         5
>>>>        bEndpointAddress     0x8e  EP 14 IN
>>>>        bmAttributes           37
>>>>          Transfer Type            Isochronous
>>>>          Synch Type               Asynchronous
>>>>          Usage Type               Implicit feedback Data
>>>>        wMaxPacketSize     0x0038  1x 56 bytes
>>>>        bInterval               1
>>>>    Interface Descriptor:
>>>>      bLength                 9
>>>>      bDescriptorType         4
>>>>      bInterfaceNumber        3
>>>>      bAlternateSetting       0
>>>>      bNumEndpoints           2
>>>>      bInterfaceClass       255 Vendor Specific Class
>>>>      bInterfaceSubClass      3
>>>>      bInterfaceProtocol      0
>>>>      iInterface              0
>>>>      ** UNRECOGNIZED:  06 24 f1 02 01 01
>>>>      Endpoint Descriptor:
>>>>        bLength                 7
>>>>        bDescriptorType         5
>>>>        bEndpointAddress     0x03  EP 3 OUT
>>>>        bmAttributes            2
>>>>          Transfer Type            Bulk
>>>>          Synch Type               None
>>>>          Usage Type               Data
>>>>        wMaxPacketSize     0x0200  1x 512 bytes
>>>>        bInterval               1
>>>>      Endpoint Descriptor:
>>>>        bLength                 7
>>>>        bDescriptorType         5
>>>>        bEndpointAddress     0x84  EP 4 IN
>>>>        bmAttributes            2
>>>>          Transfer Type            Bulk
>>>>          Synch Type               None
>>>>          Usage Type               Data
>>>>        wMaxPacketSize     0x0200  1x 512 bytes
>>>>        bInterval               0
>>>>    Interface Descriptor:
>>>>      bLength                 9
>>>>      bDescriptorType         4
>>>>      bInterfaceNumber        3
>>>>      bAlternateSetting       1
>>>>      bNumEndpoints           2
>>>>      bInterfaceClass       255 Vendor Specific Class
>>>>      bInterfaceSubClass      3
>>>>      bInterfaceProtocol      0
>>>>      iInterface              0
>>>>      Endpoint Descriptor:
>>>>        bLength                 7
>>>>        bDescriptorType         5
>>>>        bEndpointAddress     0x03  EP 3 OUT
>>>>        bmAttributes            3
>>>>          Transfer Type            Interrupt
>>>>          Synch Type               None
>>>>          Usage Type               Data
>>>>        wMaxPacketSize     0x0200  1x 512 bytes
>>>>        bInterval               4
>>>>      Endpoint Descriptor:
>>>>        bLength                 7
>>>>        bDescriptorType         5
>>>>        bEndpointAddress     0x85  EP 5 IN
>>>>        bmAttributes            3
>>>>          Transfer Type            Interrupt
>>>>          Synch Type               None
>>>>          Usage Type               Data
>>>>        wMaxPacketSize     0x0200  1x 512 bytes
>>>>        bInterval               4
>>>> Device Qualifier (for other device speed):
>>>>  bLength                10
>>>>  bDescriptorType         6
>>>>  bcdUSB               2.00
>>>>  bDeviceClass          255 Vendor Specific Class
>>>>  bDeviceSubClass         0
>>>>  bDeviceProtocol       255
>>>>  bMaxPacketSize0        64
>>>>  bNumConfigurations      1
>>>> can't get debug descriptor: Resource temporarily unavailable
>>>> Device Status:     0x0001
>>>>  Self Powered
>>>>
>>>>
>>>> --
>>>> Keith A Milner
>>>>
>>>
>>
>> --
>> --
>> Keith A Milner
>>
>

-- 
-- 
Keith A Milner
