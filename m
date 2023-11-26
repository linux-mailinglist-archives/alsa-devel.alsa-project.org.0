Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7D77F91F3
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Nov 2023 10:17:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECCE683A;
	Sun, 26 Nov 2023 10:17:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECCE683A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700990255;
	bh=b8PUIbGBQW2JNSh/ufb/ttw1adlV6ADZzj37YiDFOBg=;
	h=Date:Subject:From:To:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Fdu/7irozh/1gv3c2K7KmPzA6ODC/Yr1fa01IiLhP2UT57BiHIUw92MKLc/cC4g4g
	 J6WfQKDZ504N8jNFWpYGctU9lOodUtkdn2bOn001rngLztJVNRGKLfV8WiKhFqBAQ2
	 Zp8roe01AY5Off2EK8PvDT6Vr6OjZTG0yjB/H+ac=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CBD3F80570; Sun, 26 Nov 2023 10:17:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E09E3F80564;
	Sun, 26 Nov 2023 10:17:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C72EF801D5; Sun, 26 Nov 2023 10:13:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1A5AF80166
	for <alsa-devel@alsa-project.org>; Sun, 26 Nov 2023 10:12:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1A5AF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=lZbdqNXx
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5488bf9e193so4415771a12.2
        for <alsa-devel@alsa-project.org>;
 Sun, 26 Nov 2023 01:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700989979; x=1701594779;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OK5UtMraaVTjco0vPLi/Y7nNBrHi7nX7PbX6cS7X0CI=;
        b=lZbdqNXxW9lAHaiiZ7t1vpQcD0BQQaIgPIPfsETBFdhYIwNN2uZnNEUGpDhs1nmXf+
         z69Dv/DL0PNorSIidLhGDoKngs+z/J33M8HxHmNHpJuId6s7+s3PSN3U5krsOofAcwHj
         ANikLfCS58lpGW7HRnP84NkTbN64tjOnnAuMSoF9M4cuqHOt1IJsTeXKusbru6xbqMR6
         X7AcR/7lHEEGwG/q+4/i5Si1C6YP/bmmt2VJEBFUDjSK94xGc5TBMbbHHvNV4ANQW0C+
         tqdT9/KCqRjftM/j/cIjLSCWyjYzSQYmm+KAIiU4MqaeqHNT051MDwYmdCF0RGuQwd4l
         MriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700989979; x=1701594779;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OK5UtMraaVTjco0vPLi/Y7nNBrHi7nX7PbX6cS7X0CI=;
        b=nqqZrqgfvO/2dbwKwlkUUHunEdwYInSPSndukU7HMFywiE+fZwIkex0hbhFIobAEsL
         CukreQv36Sp58qdEOYnyhvxDPMtwnQDUTBIeSkpk2nlH2NGNVmdUhK0V/MN4pG+adXXG
         P0II8C1vRuegSF2ZtpzhNfxUoWRwPIVDX+CcmUBcPDTFz1dPOh2sxWnLsbPXnNzZ6M4T
         hW704DTPQDWUhPEDSSr1TBMsXN9QUhhA2ivsDX0ecDMPMbZdA5GD9Uu3wKH2e2WOQ6m5
         SNcOiE0lTUD36/XCkViv+UGEPK9e6TjtBn8PnCTbUfFO+uCdNdVegYfEGwq0v0l5DXOx
         u6Lw==
X-Gm-Message-State: AOJu0YwVzHw1R3lM6v3U1a5vukf/a5i4qVmoGO6TaRZCSgC4vyytMAZE
	qltgMdErSW3zhq7yDz1L85putXZH4zM=
X-Google-Smtp-Source: 
 AGHT+IGb8+lxlWQzfLOSHkQ1lwlAreW0UP3pDxRZKxlxLq3Rxe5lcJ41EZ5L/eNmBTvOmKZDFX0H1A==
X-Received: by 2002:a50:9994:0:b0:54b:3457:a656 with SMTP id
 m20-20020a509994000000b0054b3457a656mr2019611edb.25.1700989978491;
        Sun, 26 Nov 2023 01:12:58 -0800 (PST)
Received: from ?IPV6:2a02:908:1980:b9c0::9efa? ([2a02:908:1980:b9c0::9efa])
        by smtp.gmail.com with ESMTPSA id
 i12-20020a056402054c00b00548851486d8sm3937135edx.44.2023.11.26.01.12.57
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Nov 2023 01:12:57 -0800 (PST)
Message-ID: <98d10b80-40cb-4511-898e-c287663f0882@gmail.com>
Date: Sun, 26 Nov 2023 10:12:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Yamaha YIT-W12TX not working
From: Julian Sikorski <belegdol@gmail.com>
To: ALSA Development Mailing List <alsa-devel@alsa-project.org>
References: <47549112-b2c6-1957-9055-888a4191c6ab@gmail.com>
 <204b6079-7348-418e-8d97-82d798a28d69@gmail.com>
Content-Language: en-US
In-Reply-To: <204b6079-7348-418e-8d97-82d798a28d69@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: C2APHD6VOB7XTGDIFIR6MWDBE72E3WUK
X-Message-ID-Hash: C2APHD6VOB7XTGDIFIR6MWDBE72E3WUK
X-MailFrom: belegdol@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C2APHD6VOB7XTGDIFIR6MWDBE72E3WUK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Am 17.11.23 um 15:31 schrieb Julian Sikorski:
> Am 13.12.2020 um 10:51 schrieb Julian Sikorski:
>> Hi list,
>>
>> Yamaha YIT-W12TX is a USB dongle which allows to transmit audio from 
>> PC to the YSP-4300 sound bar [1][2]. While it is quite old and no 
>> longer sold, I recently tried to make it work under linux. 
>> Unfortunately, it did not work:
>>
>> [ 3676.366404] usb 2-1.1: new full-speed USB device number 5 using 
>> ehci-pci
>> [ 3676.445995] usb 2-1.1: config 1 has an invalid interface number: 4 
>> but max is 3
>> [ 3676.446001] usb 2-1.1: config 1 has no interface number 2
>> [ 3676.446664] usb 2-1.1: New USB device found, idVendor=0499, 
>> idProduct=3108, bcdDevice= 1.00
>> [ 3676.446666] usb 2-1.1: New USB device strings: Mfr=2, Product=1, 
>> SerialNumber=0
>> [ 3676.446679] usb 2-1.1: Product: YIT-W12TX
>> [ 3676.446683] usb 2-1.1: Manufacturer: YAMAHA Corp.
>> [ 3676.449508] hid-generic 0003:0499:3108.0001: hiddev96,hidraw0: USB 
>> HID v0.01 Device [YAMAHA Corp. YIT-W12TX] on usb-0000:00:1d.0-1.1/input3
>> [ 3676.450846] input: YAMAHA Corp. YIT-W12TX as 
>> /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.1/2-1.1:1.4/0003:0499:3108.0002/input/input34
>> [ 3676.503844] hid-generic 0003:0499:3108.0002: input,hidraw1: USB HID 
>> v1.00 Device [YAMAHA Corp. YIT-W12TX] on usb-0000:00:1d.0-1.1/input4
>> [ 3676.671641] usb 2-1.1: 1:1: cannot get freq at ep 0x1
>> [ 3676.675786] usb 2-1.1: 5:0: cannot get min/max values for control 2 
>> (id 5)
>> [ 3676.676476] usbcore: registered new interface driver snd-usb-audio
>> [ 3676.731911] usb 2-1.1: 5:0: cannot get min/max values for control 2 
>> (id 5)
>> [ 3676.735658] usb 2-1.1: 5:0: cannot get min/max values for control 2 
>> (id 5)
>> [ 3676.739399] usb 2-1.1: 5:0: cannot get min/max values for control 2 
>> (id 5)
>> [ 3676.743131] usb 2-1.1: 5:0: cannot get min/max values for control 2 
>> (id 5)
>> [ 3676.746920] usb 2-1.1: 5:0: cannot get min/max values for control 2 
>> (id 5)
>> [ 3676.750648] usb 2-1.1: 5:0: cannot get min/max values for control 2 
>> (id 5)
>> [ 3676.754445] usb 2-1.1: 5:0: cannot get min/max values for control 2 
>> (id 5)
>> [ 3676.758524] usb 2-1.1: 5:0: cannot get min/max values for control 2 
>> (id 5)
>> [ 3676.762274] usb 2-1.1: 5:0: cannot get min/max values for control 2 
>> (id 5)
>> [ 3676.789671] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.790049] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.790414] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.790773] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.791169] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.792134] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.792547] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.792899] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.793254] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.793634] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.794900] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.795255] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.795634] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.796008] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.796384] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.797543] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.797879] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.798254] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.798634] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.799007] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.813819] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.814281] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.814686] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.815281] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.815929] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.817807] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.818155] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.818592] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.819165] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.819801] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.822163] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.822802] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.823284] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.824161] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.824907] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.827683] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.828159] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.828675] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.829415] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.830157] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.841801] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.842155] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.842551] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.843158] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.843785] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.844909] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.845283] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.845673] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.846156] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.846800] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.848287] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.848799] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.849280] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.850031] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.850799] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.852677] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.853154] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.853674] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.854429] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.855155] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.858916] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.859277] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.859672] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.860280] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.860909] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.862033] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.862418] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.862797] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.863279] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.863923] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.865471] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.866033] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.866590] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.867410] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.868157] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.870162] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.870674] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.871155] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.871908] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.872676] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>> [ 3676.900672] usb 2-1.1: USB disconnect, device number 5
>> [ 3676.900688] usb 2-1.1: 1:1: cannot set freq 44100 to ep 0x1
>>
>> This is with kernel-5.9.13-200.fc33.x86_64 and 
>> alsa-lib-1.2.4-5.fc33.x86_64 on Fedora 33. Under Windows 10 the dongle 
>> works without any special drivers from Yamaha, everything appears to 
>> be downloaded by Windows automatically, so I was hoping the device 
>> could be made to work under Linux relatively easily.
>>
>> Best regards,
>> Julian
>>
>> [1] 
>> https://europe.yamaha.com/en/products/audio_visual/accessories/yit-w12/downloads.html#product-tabs
>> [2] 
>> https://europe.yamaha.com/en/products/audio_visual/sound_bar/ysp-4300/downloads.html#product-tabs
> 
> Hello,
> 
> 3 years later I am still hoping for getting the device working. I am on 
> 6.5 kernel and Fedora 39.
> I am attaching Windows' driver details screenshot as well as the inf 
> file used.
> Does USB audio driver under linux have any parameters I could try?
> 
> Best regards,
> Julian

Hi again,

turns out that getting the sound out was easier than expected:

options snd-usb-audio quirk_flags=0x1

One cosmetic issue remains: in pavucontrol I can see 3 configuration 
options:
- Analog Stereo output
- Digital Stereo (IEC958) output
- Pro Audio
The first and the third one work normally whereas digital stereo output 
very quiet audio only.
By contrast, both my built-in audio cards (AMD Renoir HDMI and analog 
output) only have two options:
- Play HiFi quality Music
- Pro Audio
Is this expected?

Best regards,
Julian
