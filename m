Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE85C92A3BA
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jul 2024 15:35:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E521584D;
	Mon,  8 Jul 2024 15:35:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E521584D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720445732;
	bh=ZEzWRO2LpDgyJB3Z+NE8SgN6LUV6fHcQtsqrgS8Yc10=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JnksoJIlsZRH3+hB8B6u9aVGel0fuZbYkTClhW7D966VPiXbCkL64WpUNPkSJ8WEX
	 hZ0gt2hapJYKJ/et/OhPuyFvOVqLjV91kagxINl9n2siNYKaDniobMsy1Fu/3nsnnM
	 uecb3Ls+skKBFrmRUts+zuntIuurgQerE4FZBAlw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AECCF805AD; Mon,  8 Jul 2024 15:35:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12B41F80494;
	Mon,  8 Jul 2024 15:35:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F0F5F801F5; Mon,  8 Jul 2024 15:34:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A108FF80074
	for <alsa-devel@alsa-project.org>; Mon,  8 Jul 2024 15:34:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A108FF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=r5ZEAuC/
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-426606f80ebso11834175e9.1
        for <alsa-devel@alsa-project.org>;
 Mon, 08 Jul 2024 06:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720445686;
 x=1721050486; darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZEzWRO2LpDgyJB3Z+NE8SgN6LUV6fHcQtsqrgS8Yc10=;
        b=r5ZEAuC/uj81EtzuGsPLOafziiECAkcd0ohK/QO8rfWxNvFoFWCuMYwmxX88esk7lV
         XH1OsfdwTzm49Z8DA8iWQh13uUdWjNM+qrw0CWyJ40BRT2NNnVI77AhRon8JdGnRcS1u
         ZevCcKiLY9ITWlArNLriTRMVjcMHU+pMA1CRQpUtLrqnksUnxP/c6StTVyvv4yII/WFM
         9M2T1p8Jzbwo61YRQbpejqgA4feFYQqSe0ZFp7wOC+ObX2Pg5mBaewliz2dbP6bMsjAF
         MFm74THYCxJSvdgR+WPPXQGh2Qh/F+dXfgSUdQzKxg0EHahfIvN8u2coFj48DIoXGAA/
         NKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720445686; x=1721050486;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZEzWRO2LpDgyJB3Z+NE8SgN6LUV6fHcQtsqrgS8Yc10=;
        b=I2PSJfzihBt0jhejcH9ilwwxhUiN5ZJLZy14Higcii0SeKZkhbTpkAvx/aotwQk5D7
         cp5KKpbfSoSW577LHeRh+d3ZK9d8fb/6eg5ZaoDIqArykqIRve3frzQdxABAqUGr1tOr
         IEZtHh6u1ofs2LiPyadw7GYH3TGvo7KKLmLe/r4grZRYU3ueQaYozf7BRZcTn7dnGzlC
         gz9tUvDfU9FuU5EhpxG2i0OmG1+u9GfFZbBPaqCahO/XBNVib0my4v5Q3B8+GfsbA06o
         fjCo28omuS+it90anuFzWvOTeN/M/6dv0nZXGWY25IcProy9X73MywE0Ug+SFRMd8n4s
         +h4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrwQ/xIMrUvHQbsYYzE2UXt49Ahsb4qKmfKGvcnm6MIhZIqepUi75NraHCJs9qW3AOw985KsLDi/WJXvJebTWzb+nxB0CXjOOKENc=
X-Gm-Message-State: AOJu0YwaB64snGTmvInGoD/GpD1KQAO/oSsuvAf8mPqYg2uXCz0e2V+U
	62SHIRv93BKR5ziLs0eoJTSsNnEXi894cWKkKXAvgKrJhHu0Ji/BkTJl8coDakQ=
X-Google-Smtp-Source: 
 AGHT+IGRHXzVP8vWodoy2IVaw2YC8m/sDvIPSISv1qKc25IfTFheIsZdbD3qEGLVm1zTHYZ1DPNdZQ==
X-Received: by 2002:a05:600c:22d0:b0:426:5e1c:1ad0 with SMTP id
 5b1f17b1804b1-4265e1c1db8mr42383885e9.37.1720445685795;
        Mon, 08 Jul 2024 06:34:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5158:f510:c35c:9d0b])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42649dec1cbsm66323985e9.1.2024.07.08.06.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 06:34:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>,  Mark Brown
 <broonie@kernel.org>,  Liam Girdwood <lgirdwood@gmail.com>,  Takashi Iwai
 <tiwai@suse.com>,  Jaroslav Kysela <perex@perex.cz>,
  alsa-devel@alsa-project.org,  linux-sound@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] ALSA: pcm: add support for 128kHz sample rate
In-Reply-To: <874j99434a.wl-tiwai@suse.de> (Takashi Iwai's message of "Mon, 01
	Jul 2024 16:07:49 +0200")
References: <20240628122429.2018059-1-jbrunet@baylibre.com>
	<20240628122429.2018059-2-jbrunet@baylibre.com>
	<326792b9-e706-4ab0-a1e8-cc48943e357d@linux.intel.com>
	<874j99434a.wl-tiwai@suse.de>
Date: Mon, 08 Jul 2024 15:34:44 +0200
Message-ID: <1j4j90hurv.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VBSGY46NWSQDPESX2UDSOG54D2HLGYRH
X-Message-ID-Hash: VBSGY46NWSQDPESX2UDSOG54D2HLGYRH
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VBSGY46NWSQDPESX2UDSOG54D2HLGYRH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon 01 Jul 2024 at 16:07, Takashi Iwai <tiwai@suse.de> wrote:

> On Mon, 01 Jul 2024 10:50:02 +0200,
> Amadeusz S=C5=82awi=C5=84ski wrote:
>>=20
>> On 6/28/2024 2:23 PM, Jerome Brunet wrote:
>> > The usual sample rate possible on an SPDIF link are
>> > 32k, 44.1k, 48k, 88.2k, 96k, 172.4k and 192k.
>> >=20
>> > With higher bandwidth variant, such as eARC, and the introduction of 8
>> > channels mode, the spdif frame rate may be multiplied by 4. This happe=
ns
>> > when the interface use an IEC958_SUBFRAME format.
>> >=20
>> > The spdif 8 channel mode rate list is:
>> > 128k, 176.4k, 192k, 352.8k, 384k, 705.4k and 768k.
>> >=20
>> > All are already supported by ASLA expect for the 128kHz one.
>> > Add support for it but do not insert it the SNDRV_PCM_RATE_8000_192000
>> > macro. Doing so would silently add 128k support to a lot of HW which
>> > probably do not support it.
>> >=20
>> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> > ---
>>=20
>> From what I remember the recommendation is to not add new rates, but
>> use SNDRV_PCM_RATE_KNOT for all rates not included already.
>
> In general yes -- unless the new rate is used for significant amount
> of drivers.
>
> So this case is a sort of on a border line; if it's only for ASoC
> SPDIF codec driver, I'd rather implement with an extra rate list
> instead of extending the common bits (that has some potential risks by
> breaking the existing numbers).

At the moment it would be used by ASoC spdif codec yes (and with Amlogic
eARC support reasonnably soon, hopefully)=20

However it is likely to be a common rate of any derivative of an IEC958
interface, with a sufficiently high bandwidth. I suspect there might be
more of those in the future. Also, it is not an exotic rate for some obscure
codec no one really has. It is part of specified interface that every TV
with HDMI 2 is likely to have nowadays. This is why I thought it made
sense to add it to the usual list. It is the only rate missing,
everything else is already there.

Changing the spdif codecs with SNDRV_PCM_RATE_KNOT and a custom rate
list is doable I suppose, if the new ID is not OK.=20

BTW, I tried not changing the existing numbers and add 128k last but that
broke. I guess something requires the IDs to be ordered. I did not check
this further since updating the IDs worked fine (for me, at least :) )

> OTOH, if we can take this for further
> cleanups of the existing requirement of 128khz rate, we can go with
> it.
>

Apart from the problem reported in sound/usb/caiaq/audio.c, is there
another clean up expected ?

>
> thanks,
>
> Takashi

--=20
Jerome
