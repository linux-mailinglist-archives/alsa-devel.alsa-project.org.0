Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 285FB28E62C
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 20:19:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FBFF1740;
	Wed, 14 Oct 2020 20:18:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FBFF1740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602699582;
	bh=j92bROaJEoUUqGJZeleW8BYYaQOwWvgX6m7qAbQwdco=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F+WNR4/hFgVtjTbJhMcYl1hupHn5kM+3ZETJA0mIRpVJmvx0J0oIU0TjiModv23WE
	 wvYAuqLckGqm1OVgkMLBxhsit9kKQ91ftjW4OtO1KrFHxjjrsX1S5Ubr6HCb8Z9Vxr
	 gJxCk7VqSSR7BQ3TqoawiVt34c0hHJ3xeVv1ly6Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 471F4F8020D;
	Wed, 14 Oct 2020 20:18:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDDCFF80217; Wed, 14 Oct 2020 20:17:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com
 [IPv6:2607:f8b0:4864:20::b41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19327F800F6
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 20:17:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19327F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nostatic-org.20150623.gappssmtp.com
 header.i=@nostatic-org.20150623.gappssmtp.com header.b="s/ppQAuU"
Received: by mail-yb1-xb41.google.com with SMTP id h6so33565ybi.11
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 11:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nostatic-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cq+tbymKElJISfAJ+2K5zodC+vhMsEeLMsR8vL28G1Y=;
 b=s/ppQAuUFGTyBGsIauG0fSET1AmqFj38tt+5naFmDcVvTi4ArR9iyWCBYpCERMGSy0
 0NGcoWL7+1Vkv0qQaEni+/fvd+RQGk1m0GRyXNaoNA3Cm98dj5XO1Tmg3FB3zj/FQ+/V
 ZnHahqL8fK2Mb71/vDJCxa5721DROmGnVFl7cH2VEebD2/W69JQDIPXr6gURjn8jag1E
 7bav7pGeVIGqcF8NQiXWWFvvHHJrXvJGaKOOWQYEBAu4o8ZRVxN6mz+DiQt6DN6/+DB9
 VE1IMudzy6V2S4MmQtGG3grmde7hBi9bRJXnRh2eG+w9CND6pJz+Qkjdfz0qpbXtcgKp
 2zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cq+tbymKElJISfAJ+2K5zodC+vhMsEeLMsR8vL28G1Y=;
 b=r3sA1+2OSUGTywlRH05DRuwTlKCmG9BY3PnvnVobbLQpUWg2QgMR9ib8MQ4I1xxWqv
 gsbU9zBtdtkDcYTymOoXzoS+Wfutw+rbs5x/p8YYS11p2zls8l9kF4yhh5g2FP4lBOTc
 NPtvWaEcNfoDndq3MC6BWg3VS55icz2klNeBUWdw3LJXt5C05qi98nOiCFA/qEhMj2Sc
 fYxH6DoOn+jvaCvoXsbKnb/pEYUCWl0eBGe0KKQxuCazbMMwtPaszDwjgUapIM/o1XbM
 V40LhBVU5gZMv9t71Yto/69De0hHB729qiwTZ9w0BjlWDjNhY/TUgzZUvz8k8wBmHWfA
 5jZg==
X-Gm-Message-State: AOAM532q/V2KMlPUrEyDjAX8Q6ilCVxbj5R6XAixrgPk1Gg76Xfr6oAM
 Y6wi4UNttq/uY/k8kjfWsGWMLDDrKwOcswqQnxvxPg==
X-Google-Smtp-Source: ABdhPJxRJDJ1INkR4/Jd6cZCMxMVLiAYS909j8P8kHNcd/5KUPXJS8Dow3ZRdoBA9Aj6ElWGVUnZ1u+dgtSC44IVqeo=
X-Received: by 2002:a05:6902:6a6:: with SMTP id
 j6mr846487ybt.383.1602699469736; 
 Wed, 14 Oct 2020 11:17:49 -0700 (PDT)
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
In-Reply-To: <CAPMdQDmDzisnh1dqoE-Po4ALRRDwN1dxjQXYXeBuG+fN_gctzA@mail.gmail.com>
From: Mike Oliphant <oliphant@nostatic.org>
Date: Wed, 14 Oct 2020 11:17:41 -0700
Message-ID: <CAHXb3bdHc35WcC_4=wv_zRR_r-w4=boT1vbW0tZpYpn=Kb2-KA@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: usb-audio: Disable quirks for BOSS
 Katana amplifiers
To: Mailing Lists <maillist@superlative.org>
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

That's also what I see from dmesg when I use the quirk device ID patch. I'm
pretty sure it means that implicit feedback is not being enabled for your
device.

Since these devices are designed to work with implicit feedback, the ideal
solution would be to have them work by using it, rather than disabling it.

That said, patching the quirk code with the extra device IDs would make it
so they at least produce output...

The "fix" I'm currently using (linked to in my first response) makes the
implicit feedback code not wait to send data until it has received some. It
works perfectly for me, but success has been mixed for others so I didn't
feel comfortable submitting it as a patch.

FYI, I did a little write-up here:

http://blog.nostatic.org/2020/01/getting-boss-gt-1-effects-processor-to.html

It outlines my struggle with this issue - from trying the quirk ID patch,
to messing with the sample rate, and finally to modifying the implicit
feedback behavior.

Mike

On Wed, Oct 14, 2020 at 10:23 AM Mailing Lists <maillist@superlative.org>
wrote:

> Hi Mike,
> I'm getting this:
>
> [Oct14 18:21] snd_usb_audio:set_format: usb 1-4: setting usb interface 1:1
> [  +0.000003] snd_usb_audio:snd_usb_add_endpoint: usb 1-4: Re-using EP d
> in iface 1,1 @00000000d0aa6911
> [  +0.000018] snd_usb_audio:snd_usb_endpoint_set_params: usb 1-4: Setting
> params for ep #d (type 0, 3 urbs), ret=0
> [  +0.000002] snd_usb_audio:start_endpoints: usb 1-4: Starting data EP
> @00000000d0aa6911
>
> Cheers,
>
> Keith
>
> On Wed, 14 Oct 2020 at 17:46, Mike Oliphant <oliphant@nostatic.org> wrote:
>
>> Hi Keith,
>>
>> The lsusb output just shows that the endpoint is there, but not that it
>> is getting connected when the device is initialized. Can you check dmesg
>> output when you use the device for playback?
>>
>> This is what I see from dmesg when the implicit feedback endpoint is
>> being used:
>>
>> [   26.787360] usb 1-1.1: setting usb interface 1:1
>> [   26.787367] Creating new playback data endpoint #d
>> [   26.787375] Creating new capture data endpoint #8e
>> [   26.787678] usb 1-1.1: Setting params for ep #d (type 0, 12 urbs),
>> ret=0
>> [   26.787685] usb 1-1.1: match_endpoint_audioformats: (fmt @6bc43c84)
>> score 2
>> [   26.787745] usb 1-1.1: Setting params for ep #8e (type 0, 12 urbs),
>> ret=0
>> [   26.787751] usb 1-1.1: Starting data EP @a14130b5
>> [   26.788420] usb 1-1.1: Starting sync EP @720fb7cf
>>
>> Note the "Starting sync EP".
>>
>> Mike
>>
>> On Wed, Oct 14, 2020 at 9:35 AM Mailing Lists <maillist@superlative.org>
>> wrote:
>>
>>> On Wed, 14 Oct 2020 at 17:12, Mike Oliphant <oliphant@nostatic.org>
>>> wrote:
>>>
>>>> Keith - are you getting an implicit feedback endpoint created when you
>>>> run with the patch?
>>>>
>>>
>>> Hi Mike,
>>>
>>> It appears that I do. For reference I'm on kernel 5.4.0-51:
>>>
>>> Bus 001 Device 007: ID 0582:01d6 Roland Corp. GT-1
>>> Device Descriptor:
>>>  bLength                18
>>>  bDescriptorType         1
>>>  bcdUSB               2.00
>>>  bDeviceClass          255 Vendor Specific Class
>>>  bDeviceSubClass         0
>>>  bDeviceProtocol       255
>>>  bMaxPacketSize0        64
>>>  idVendor           0x0582 Roland Corp.
>>>  idProduct          0x01d6
>>>  bcdDevice            0.00
>>>  iManufacturer           1 BOSS
>>>  iProduct                2 GT-1
>>>  iSerial                 0
>>>  bNumConfigurations      1
>>>  Configuration Descriptor:
>>>    bLength                 9
>>>    bDescriptorType         2
>>>    wTotalLength       0x00bc
>>>    bNumInterfaces          4
>>>    bConfigurationValue     1
>>>    iConfiguration          0
>>>    bmAttributes         0xc0
>>>      Self Powered
>>>    MaxPower                0mA
>>>    Interface Descriptor:
>>>      bLength                 9
>>>      bDescriptorType         4
>>>      bInterfaceNumber        0
>>>      bAlternateSetting       0
>>>      bNumEndpoints           0
>>>      bInterfaceClass       255 Vendor Specific Class
>>>      bInterfaceSubClass    255 Vendor Specific Subclass
>>>      bInterfaceProtocol      0
>>>      iInterface              0
>>>    Interface Descriptor:
>>>      bLength                 9
>>>      bDescriptorType         4
>>>      bInterfaceNumber        1
>>>      bAlternateSetting       0
>>>      bNumEndpoints           0
>>>      bInterfaceClass       255 Vendor Specific Class
>>>      bInterfaceSubClass      2
>>>      bInterfaceProtocol      2
>>>      iInterface              0
>>>      ** UNRECOGNIZED:  06 24 f1 01 00 00
>>>    Interface Descriptor:
>>>      bLength                 9
>>>      bDescriptorType         4
>>>      bInterfaceNumber        1
>>>      bAlternateSetting       1
>>>      bNumEndpoints           1
>>>      bInterfaceClass       255 Vendor Specific Class
>>>      bInterfaceSubClass      2
>>>      bInterfaceProtocol      2
>>>      iInterface              0
>>>      ** UNRECOGNIZED:  07 24 01 01 00 01 00
>>>      ** UNRECOGNIZED:  0b 24 02 01 02 04 18 01 44 ac 00
>>>      ** UNRECOGNIZED:  06 24 f1 04 16 00
>>>      Endpoint Descriptor:
>>>        bLength                 7
>>>        bDescriptorType         5
>>>        bEndpointAddress     0x0d  EP 13 OUT
>>>        bmAttributes            5
>>>          Transfer Type            Isochronous
>>>          Synch Type               Asynchronous
>>>          Usage Type               Data
>>>        wMaxPacketSize     0x0038  1x 56 bytes
>>>        bInterval               1
>>>    Interface Descriptor:
>>>      bLength                 9
>>>      bDescriptorType         4
>>>      bInterfaceNumber        2
>>>      bAlternateSetting       0
>>>      bNumEndpoints           0
>>>      bInterfaceClass       255 Vendor Specific Class
>>>      bInterfaceSubClass      2
>>>      bInterfaceProtocol      1
>>>      iInterface              0
>>>    Interface Descriptor:
>>>      bLength                 9
>>>      bDescriptorType         4
>>>      bInterfaceNumber        2
>>>      bAlternateSetting       1
>>>      bNumEndpoints           1
>>>      bInterfaceClass       255 Vendor Specific Class
>>>      bInterfaceSubClass      2
>>>      bInterfaceProtocol      1
>>>      iInterface              0
>>>      ** UNRECOGNIZED:  07 24 01 07 00 01 00
>>>      ** UNRECOGNIZED:  0b 24 02 01 02 04 18 01 44 ac 00
>>>      ** UNRECOGNIZED:  06 24 f1 04 16 00
>>>      Endpoint Descriptor:
>>>        bLength                 7
>>>        bDescriptorType         5
>>>        bEndpointAddress     0x8e  EP 14 IN
>>>        bmAttributes           37
>>>          Transfer Type            Isochronous
>>>          Synch Type               Asynchronous
>>>          Usage Type               Implicit feedback Data
>>>        wMaxPacketSize     0x0038  1x 56 bytes
>>>        bInterval               1
>>>    Interface Descriptor:
>>>      bLength                 9
>>>      bDescriptorType         4
>>>      bInterfaceNumber        3
>>>      bAlternateSetting       0
>>>      bNumEndpoints           2
>>>      bInterfaceClass       255 Vendor Specific Class
>>>      bInterfaceSubClass      3
>>>      bInterfaceProtocol      0
>>>      iInterface              0
>>>      ** UNRECOGNIZED:  06 24 f1 02 01 01
>>>      Endpoint Descriptor:
>>>        bLength                 7
>>>        bDescriptorType         5
>>>        bEndpointAddress     0x03  EP 3 OUT
>>>        bmAttributes            2
>>>          Transfer Type            Bulk
>>>          Synch Type               None
>>>          Usage Type               Data
>>>        wMaxPacketSize     0x0200  1x 512 bytes
>>>        bInterval               1
>>>      Endpoint Descriptor:
>>>        bLength                 7
>>>        bDescriptorType         5
>>>        bEndpointAddress     0x84  EP 4 IN
>>>        bmAttributes            2
>>>          Transfer Type            Bulk
>>>          Synch Type               None
>>>          Usage Type               Data
>>>        wMaxPacketSize     0x0200  1x 512 bytes
>>>        bInterval               0
>>>    Interface Descriptor:
>>>      bLength                 9
>>>      bDescriptorType         4
>>>      bInterfaceNumber        3
>>>      bAlternateSetting       1
>>>      bNumEndpoints           2
>>>      bInterfaceClass       255 Vendor Specific Class
>>>      bInterfaceSubClass      3
>>>      bInterfaceProtocol      0
>>>      iInterface              0
>>>      Endpoint Descriptor:
>>>        bLength                 7
>>>        bDescriptorType         5
>>>        bEndpointAddress     0x03  EP 3 OUT
>>>        bmAttributes            3
>>>          Transfer Type            Interrupt
>>>          Synch Type               None
>>>          Usage Type               Data
>>>        wMaxPacketSize     0x0200  1x 512 bytes
>>>        bInterval               4
>>>      Endpoint Descriptor:
>>>        bLength                 7
>>>        bDescriptorType         5
>>>        bEndpointAddress     0x85  EP 5 IN
>>>        bmAttributes            3
>>>          Transfer Type            Interrupt
>>>          Synch Type               None
>>>          Usage Type               Data
>>>        wMaxPacketSize     0x0200  1x 512 bytes
>>>        bInterval               4
>>> Device Qualifier (for other device speed):
>>>  bLength                10
>>>  bDescriptorType         6
>>>  bcdUSB               2.00
>>>  bDeviceClass          255 Vendor Specific Class
>>>  bDeviceSubClass         0
>>>  bDeviceProtocol       255
>>>  bMaxPacketSize0        64
>>>  bNumConfigurations      1
>>> can't get debug descriptor: Resource temporarily unavailable
>>> Device Status:     0x0001
>>>  Self Powered
>>>
>>>
>>> --
>>> Keith A Milner
>>>
>>
>
> --
> --
> Keith A Milner
>
