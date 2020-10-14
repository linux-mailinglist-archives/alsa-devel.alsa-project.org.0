Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E68F728E54C
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 19:25:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A2131614;
	Wed, 14 Oct 2020 19:24:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A2131614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602696304;
	bh=JfwRwGeLMoCO3rp4unRmmuIPlQ7OtcKx2jsl/1N5dRg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bcY9ZzveCybxlZrQ6A9Aw1uGM1vAEm5co0eLjNSxSK1F1n+J8lFpQJCcV1TZgkGPO
	 LqgfJmTp5TZv5BsK3matls6HxIWfqXbowJnw3hbEwcTEQvTbijsgKck5+pZ8dOOxtd
	 pLTFMdhoEo+glbX47F451j2ICKdx4Pl8/EhvBxLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C017F8021D;
	Wed, 14 Oct 2020 19:23:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8764F80217; Wed, 14 Oct 2020 19:23:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F2CAF80118
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 19:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F2CAF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=superlative.org header.i=@superlative.org
 header.b="ooiQqDsm"
Received: by mail-ot1-x343.google.com with SMTP id f10so357988otb.6
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 10:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=superlative.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LrttezmJpSgtlDATQ6SJgU/+C/e+u/mKjGp4xtIpliI=;
 b=ooiQqDsm7cyGnS6M+BLTWbSwJ/BGeNQ2pOIZHnYiLcuca2dRVuq0LxSWyxPkUrHYyk
 mAmm5gFMlwPMSHUrpOmJ2nIAROBQ115WHk7Uh/hTrOWhHreJ5XeUgQ0SDwHtCWTnqil3
 0IDo8Etdkq86lLZMGZAPQuFXdOKlRZ/rbh8n5WZysGU5YTrqyNeuPDxPemMDk8ZTwxXW
 LHQv3QOSR+DKA8Cf0z+/yC+W4IMItMtf8Wf7cXUUmZGoDoUEkZfql27xaI1fLiTw/iiS
 GZfb27ueM2BOQJhart75jILxtNHHm+ZSDkObTJ90/Cl6r8YwOPZLvkpBVCqb877dhWfS
 vSxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LrttezmJpSgtlDATQ6SJgU/+C/e+u/mKjGp4xtIpliI=;
 b=JJOtrCP5ed/Oisy4PVEfO3IhHJMEaw2bMQlRKbnp+pCfREm4juiXUQz2K5TKRDuO/a
 IpWDnRNR8kha/LXS5nHlVDg8bIhJ+QXOmnooHUg8BEUFeBvkbVpqI2I4ZLVR0/tgnsYL
 Z7pAqulR+bqmAfHG345F15sF9AOnfR4JyEPx0iDXizG9612vZRuJdQaI+8BXXFThndDL
 kRNbIqUpPunUl+ObKZFQPB5791bHfhZRVK7Mx/5OAT2VWT/KvKf0BGH3eHE/hBgIdsPG
 l9J0fb9i49rIYEaq25PdQyCltJVgFa+8R5qyTQ2r+UOXHDAaX5bhrrx5bXfNCfulLVDP
 1pkw==
X-Gm-Message-State: AOAM532vNmlEToc+UCkdy3pw5+Si2TO6LYz6EdvFkVo8EcXQiwYFHsBa
 SMl7a2QTt3fNLE9xP6jAlBCd0seGfBORXkPmaxprSQ==
X-Google-Smtp-Source: ABdhPJwXt55a0Tie7BTv7QByE1Q0ZzV2otFTAza8j6FV/ew4qF6wpfiN7eTcffuDHaKsPMxdMtDpauiD+ZXkUShMzWk=
X-Received: by 2002:a9d:3983:: with SMTP id y3mr121126otb.71.1602696191458;
 Wed, 14 Oct 2020 10:23:11 -0700 (PDT)
MIME-Version: 1.0
References: <20191011171937.8013-1-szszoke.code@gmail.com>
 <s5hftjriy1q.wl-tiwai@suse.de>
 <CAPMdQDmY7CdbrHyOwhJNFBREQ0EO1SKufRdN_YR6TG4zmJzXpA@mail.gmail.com>
 <CAHXb3bf+0uKS-+aEVsgebUbYPt1wCBZ7GLAjF57BrPDHcveuQQ@mail.gmail.com>
 <CAPMdQDmE3cgu2whqTxf7pFUoQusUYJKK7xLASev8JdWD-9oypQ@mail.gmail.com>
 <CAHXb3bdrPC_v0oAEkWDR-VH7NZ3uoFdSw-dzNo_Fwy8HzeTopA@mail.gmail.com>
 <CAPMdQDmiCDWTdfpbAwM7tJL+KiPApjd0jd46yPemw04-6CQWjg@mail.gmail.com>
 <CAHXb3bfgfHDYfkYEZOKttvNkpe+frBeeogzcoA7UBT+=3wqy1g@mail.gmail.com>
In-Reply-To: <CAHXb3bfgfHDYfkYEZOKttvNkpe+frBeeogzcoA7UBT+=3wqy1g@mail.gmail.com>
From: Mailing Lists <maillist@superlative.org>
Date: Wed, 14 Oct 2020 18:23:00 +0100
Message-ID: <CAPMdQDmDzisnh1dqoE-Po4ALRRDwN1dxjQXYXeBuG+fN_gctzA@mail.gmail.com>
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

Hi Mike,
I'm getting this:

[Oct14 18:21] snd_usb_audio:set_format: usb 1-4: setting usb interface 1:1
[  +0.000003] snd_usb_audio:snd_usb_add_endpoint: usb 1-4: Re-using EP d in
iface 1,1 @00000000d0aa6911
[  +0.000018] snd_usb_audio:snd_usb_endpoint_set_params: usb 1-4: Setting
params for ep #d (type 0, 3 urbs), ret=0
[  +0.000002] snd_usb_audio:start_endpoints: usb 1-4: Starting data EP
@00000000d0aa6911

Cheers,

Keith

On Wed, 14 Oct 2020 at 17:46, Mike Oliphant <oliphant@nostatic.org> wrote:

> Hi Keith,
>
> The lsusb output just shows that the endpoint is there, but not that it is
> getting connected when the device is initialized. Can you check dmesg
> output when you use the device for playback?
>
> This is what I see from dmesg when the implicit feedback endpoint is being
> used:
>
> [   26.787360] usb 1-1.1: setting usb interface 1:1
> [   26.787367] Creating new playback data endpoint #d
> [   26.787375] Creating new capture data endpoint #8e
> [   26.787678] usb 1-1.1: Setting params for ep #d (type 0, 12 urbs), ret=0
> [   26.787685] usb 1-1.1: match_endpoint_audioformats: (fmt @6bc43c84)
> score 2
> [   26.787745] usb 1-1.1: Setting params for ep #8e (type 0, 12 urbs),
> ret=0
> [   26.787751] usb 1-1.1: Starting data EP @a14130b5
> [   26.788420] usb 1-1.1: Starting sync EP @720fb7cf
>
> Note the "Starting sync EP".
>
> Mike
>
> On Wed, Oct 14, 2020 at 9:35 AM Mailing Lists <maillist@superlative.org>
> wrote:
>
>> On Wed, 14 Oct 2020 at 17:12, Mike Oliphant <oliphant@nostatic.org>
>> wrote:
>>
>>> Keith - are you getting an implicit feedback endpoint created when you
>>> run with the patch?
>>>
>>
>> Hi Mike,
>>
>> It appears that I do. For reference I'm on kernel 5.4.0-51:
>>
>> Bus 001 Device 007: ID 0582:01d6 Roland Corp. GT-1
>> Device Descriptor:
>>  bLength                18
>>  bDescriptorType         1
>>  bcdUSB               2.00
>>  bDeviceClass          255 Vendor Specific Class
>>  bDeviceSubClass         0
>>  bDeviceProtocol       255
>>  bMaxPacketSize0        64
>>  idVendor           0x0582 Roland Corp.
>>  idProduct          0x01d6
>>  bcdDevice            0.00
>>  iManufacturer           1 BOSS
>>  iProduct                2 GT-1
>>  iSerial                 0
>>  bNumConfigurations      1
>>  Configuration Descriptor:
>>    bLength                 9
>>    bDescriptorType         2
>>    wTotalLength       0x00bc
>>    bNumInterfaces          4
>>    bConfigurationValue     1
>>    iConfiguration          0
>>    bmAttributes         0xc0
>>      Self Powered
>>    MaxPower                0mA
>>    Interface Descriptor:
>>      bLength                 9
>>      bDescriptorType         4
>>      bInterfaceNumber        0
>>      bAlternateSetting       0
>>      bNumEndpoints           0
>>      bInterfaceClass       255 Vendor Specific Class
>>      bInterfaceSubClass    255 Vendor Specific Subclass
>>      bInterfaceProtocol      0
>>      iInterface              0
>>    Interface Descriptor:
>>      bLength                 9
>>      bDescriptorType         4
>>      bInterfaceNumber        1
>>      bAlternateSetting       0
>>      bNumEndpoints           0
>>      bInterfaceClass       255 Vendor Specific Class
>>      bInterfaceSubClass      2
>>      bInterfaceProtocol      2
>>      iInterface              0
>>      ** UNRECOGNIZED:  06 24 f1 01 00 00
>>    Interface Descriptor:
>>      bLength                 9
>>      bDescriptorType         4
>>      bInterfaceNumber        1
>>      bAlternateSetting       1
>>      bNumEndpoints           1
>>      bInterfaceClass       255 Vendor Specific Class
>>      bInterfaceSubClass      2
>>      bInterfaceProtocol      2
>>      iInterface              0
>>      ** UNRECOGNIZED:  07 24 01 01 00 01 00
>>      ** UNRECOGNIZED:  0b 24 02 01 02 04 18 01 44 ac 00
>>      ** UNRECOGNIZED:  06 24 f1 04 16 00
>>      Endpoint Descriptor:
>>        bLength                 7
>>        bDescriptorType         5
>>        bEndpointAddress     0x0d  EP 13 OUT
>>        bmAttributes            5
>>          Transfer Type            Isochronous
>>          Synch Type               Asynchronous
>>          Usage Type               Data
>>        wMaxPacketSize     0x0038  1x 56 bytes
>>        bInterval               1
>>    Interface Descriptor:
>>      bLength                 9
>>      bDescriptorType         4
>>      bInterfaceNumber        2
>>      bAlternateSetting       0
>>      bNumEndpoints           0
>>      bInterfaceClass       255 Vendor Specific Class
>>      bInterfaceSubClass      2
>>      bInterfaceProtocol      1
>>      iInterface              0
>>    Interface Descriptor:
>>      bLength                 9
>>      bDescriptorType         4
>>      bInterfaceNumber        2
>>      bAlternateSetting       1
>>      bNumEndpoints           1
>>      bInterfaceClass       255 Vendor Specific Class
>>      bInterfaceSubClass      2
>>      bInterfaceProtocol      1
>>      iInterface              0
>>      ** UNRECOGNIZED:  07 24 01 07 00 01 00
>>      ** UNRECOGNIZED:  0b 24 02 01 02 04 18 01 44 ac 00
>>      ** UNRECOGNIZED:  06 24 f1 04 16 00
>>      Endpoint Descriptor:
>>        bLength                 7
>>        bDescriptorType         5
>>        bEndpointAddress     0x8e  EP 14 IN
>>        bmAttributes           37
>>          Transfer Type            Isochronous
>>          Synch Type               Asynchronous
>>          Usage Type               Implicit feedback Data
>>        wMaxPacketSize     0x0038  1x 56 bytes
>>        bInterval               1
>>    Interface Descriptor:
>>      bLength                 9
>>      bDescriptorType         4
>>      bInterfaceNumber        3
>>      bAlternateSetting       0
>>      bNumEndpoints           2
>>      bInterfaceClass       255 Vendor Specific Class
>>      bInterfaceSubClass      3
>>      bInterfaceProtocol      0
>>      iInterface              0
>>      ** UNRECOGNIZED:  06 24 f1 02 01 01
>>      Endpoint Descriptor:
>>        bLength                 7
>>        bDescriptorType         5
>>        bEndpointAddress     0x03  EP 3 OUT
>>        bmAttributes            2
>>          Transfer Type            Bulk
>>          Synch Type               None
>>          Usage Type               Data
>>        wMaxPacketSize     0x0200  1x 512 bytes
>>        bInterval               1
>>      Endpoint Descriptor:
>>        bLength                 7
>>        bDescriptorType         5
>>        bEndpointAddress     0x84  EP 4 IN
>>        bmAttributes            2
>>          Transfer Type            Bulk
>>          Synch Type               None
>>          Usage Type               Data
>>        wMaxPacketSize     0x0200  1x 512 bytes
>>        bInterval               0
>>    Interface Descriptor:
>>      bLength                 9
>>      bDescriptorType         4
>>      bInterfaceNumber        3
>>      bAlternateSetting       1
>>      bNumEndpoints           2
>>      bInterfaceClass       255 Vendor Specific Class
>>      bInterfaceSubClass      3
>>      bInterfaceProtocol      0
>>      iInterface              0
>>      Endpoint Descriptor:
>>        bLength                 7
>>        bDescriptorType         5
>>        bEndpointAddress     0x03  EP 3 OUT
>>        bmAttributes            3
>>          Transfer Type            Interrupt
>>          Synch Type               None
>>          Usage Type               Data
>>        wMaxPacketSize     0x0200  1x 512 bytes
>>        bInterval               4
>>      Endpoint Descriptor:
>>        bLength                 7
>>        bDescriptorType         5
>>        bEndpointAddress     0x85  EP 5 IN
>>        bmAttributes            3
>>          Transfer Type            Interrupt
>>          Synch Type               None
>>          Usage Type               Data
>>        wMaxPacketSize     0x0200  1x 512 bytes
>>        bInterval               4
>> Device Qualifier (for other device speed):
>>  bLength                10
>>  bDescriptorType         6
>>  bcdUSB               2.00
>>  bDeviceClass          255 Vendor Specific Class
>>  bDeviceSubClass         0
>>  bDeviceProtocol       255
>>  bMaxPacketSize0        64
>>  bNumConfigurations      1
>> can't get debug descriptor: Resource temporarily unavailable
>> Device Status:     0x0001
>>  Self Powered
>>
>>
>> --
>> Keith A Milner
>>
>

-- 
-- 
Keith A Milner
