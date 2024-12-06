Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A67429E7B0C
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Dec 2024 22:32:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 705541A2D;
	Fri,  6 Dec 2024 22:32:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 705541A2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733520768;
	bh=OkyMM+Fli9aBMq1UHiXfdze4i6Cw8zF1Uo7qyadWUfA=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=njdQrJZ7yWmhRHDv5cswd+9BjgYhrYXYV1mT5ZR8wArf6VYZmza/hqSIyIL9uNqHj
	 3iEpjWAN9wIIVclvpSG45k2nart8V/s79eV2egYPsJHX+Lt1X8nq1CJ2mMnr4Ilfmy
	 ASklcXi3g+E/IOiehxHGJAo2iktrkbBeK+rQwk1k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76F38F80073; Fri,  6 Dec 2024 22:32:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79D70F805C0;
	Fri,  6 Dec 2024 22:32:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FE83F8047C; Fri,  6 Dec 2024 22:32:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	GB_FREEMAIL_DISPTO,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20038F80116
	for <alsa-devel@alsa-project.org>; Fri,  6 Dec 2024 22:32:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20038F80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LxWD0Bxk
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5d0bd12374cso3090893a12.3
        for <alsa-devel@alsa-project.org>;
 Fri, 06 Dec 2024 13:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733520668; x=1734125468;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:disposition-notification-to
         :cc:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9J4GGJ8PlFHiuKS/KtImFeuLxUohPxmjNHgOdOGN0k=;
        b=LxWD0BxkwZm4aEQhFvCcZ+BaQQ1NB1qdkgt30aA+JZafzYbmderDY8MHScGKYBcW0Q
         7bCSXODOtm9jIreKKMbRWBqh756APx8/qLCdUguxJpjS7tpZ2+y6IEG/OeWWjmgqXPxI
         L1qiFwkcpSlpDcUNqpYCjNiaXQXYNcplXb1/TwTdYmKirfTh3aarLacgRHqwdktVaomf
         kLKBqE9WwuADqAhvFl6MGFDsYabwappmEWdYNXEQzJM+rtTQCGYMyL8fxoocRBu0VlzA
         t/h0ZWJ9C116PyQ4p2jVqXTKr/BfyPq1tmAlpHKgfphDAdsFM3jvHVeI5sL8YT+vO6fs
         KyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733520668; x=1734125468;
        h=content-transfer-encoding:in-reply-to:disposition-notification-to
         :cc:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V9J4GGJ8PlFHiuKS/KtImFeuLxUohPxmjNHgOdOGN0k=;
        b=OqFb0qBQd0n2wGFT3pNT6BQ0vsaUDDjaLg3tdqInbnzjAuue3y7m7+tkoVskvVkEs8
         /8nmVja9tOt+TJG6EM689TUXLiXeqskHLRBO4dsCpES+y4ksHV4V++8luZI/i2/e8Vmd
         fy6Qe6wKxfcsX4zci4WMvMCCgsHV5hd+S2qH52u/ofw41ydme96d3/bzCZwHjR5licbp
         zkRoOe3wIQd0g2L+czG6xN6dWzeM61aKsJYMVnGH5cP9OMSvhtHPrDmxJCkPE3axaVfF
         Ev4jVQjx20S3zoifJoubfoxA67KE3wK9M0Y6IDtTwChECIFnA/frR2rJZi0mO3gAPGtj
         /Z3A==
X-Gm-Message-State: AOJu0YxitCEXa1Y3y841cpDpJolCf5aswimzY9hgZCStvvMr/YldcPgL
	VfA0v4hBnSh1gzYgvRF2IBCRqZ0tu9MPzoweyimx34i+5spGOO0t5E9+Pg==
X-Gm-Gg: ASbGnct/FTSWGJs6s+rJFxemYxhkvRatiqUMQ6UxuZS9TZHYCmexGGLp85d9VqGdnPt
	DCoAgvGJ/2vyTzRVnK+QuADWfIrf5Zk1sM9OnEcCgUil+jeRs6GA02LfwfoOiyzn48AjpDaTfiG
	Vu/Xrm3yHVKw9oUL/xDOKpY05Igi8SSVDgrygbiaOs7crfMYtXcH2DZDMRiIkUakXKgysillWzl
	1MO9jyTsSyeKo6tWgrXdOThJosyMgTxTbZjJszYGkYwOhKqdvE3P/ZxlrYSJdMnSJGg3aBIkcAm
	W+2K9MRLHfqwfYROZk6pkl8/ATJf
X-Google-Smtp-Source: 
 AGHT+IEajeOgVGx6nvpHLU8+19Zx0L8ukYC74jMmKUngW91imvpIGbTHXX3ffb+AmmXHh3DujLHwWA==
X-Received: by 2002:a05:6402:2683:b0:5d0:e73c:b80a with SMTP id
 4fb4d7f45d1cf-5d3be742b4cmr10871006a12.33.1733520667672;
        Fri, 06 Dec 2024 13:31:07 -0800 (PST)
Received: from ?IPV6:2a02:8071:3484:bc0:caf7:50ff:fe30:727e?
 ([2a02:8071:3484:bc0:caf7:50ff:fe30:727e])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3ce5b776esm1106739a12.29.2024.12.06.13.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 13:31:07 -0800 (PST)
Message-ID: <4d80afb0-fd93-4ab7-afcd-06a9a4d7700a@gmail.com>
Date: Fri, 6 Dec 2024 22:31:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [vdr] Identifying MPEG-4 HE-AAC (LATM, LAOS) audio formats
To: vdr@linuxtv.org
References: <Z1NfRupTvjFeTlbi@jyty>
Content-Language: en-US, de-DE
From: schorpp <thomas.schorpp@gmail.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <Z1NfRupTvjFeTlbi@jyty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7M65HJVK65UHRRMHNR6LKJPEUEUDZDLX
X-Message-ID-Hash: 7M65HJVK65UHRRMHNR6LKJPEUEUDZDLX
X-MailFrom: thomas.schorpp@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7M65HJVK65UHRRMHNR6LKJPEUEUDZDLX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Am 06.12.24 um 21:32 schrieb Marko Mäkelä:
> A couple of weeks ago, Finland took the penultimate step to get rid of 
> DVB-T. Since years, we had DVB-T and DVB-T2 running in parallel. The 
> DVB-T transponders should be shut down in 2025.

same here but h.265 video and aac audio.

> 
> The step was to introduce a second free-to-air DVB-T2 bouquet to carry 
> some channels that were previously only available with DVB-T and MPEG-2. 
> The VDR channel search failed to find this transponder; I ran a patched 
> version of https://github.com/mighty-p/t2scan/pull/15/ to generate a new 
> channels.conf. (Is this a bug of VDR, or a feature? I remember that when 
> I originally set up VDR, I had to get a channels.conf from tscan or 
> t2scan.)

have You tried the latest git version of scan in dvb-utils @linuxtx.org 
repo?

> 
> Unlike our first free-to-air DVB-T2 bouquet, which uses MPEG-4 H.264 
> video with AC3 audio, the second one uses H.264 video and HE-AAC audio, 
> also known as LATM or LOAS. This had to be explicitly enabled for my 
> output device: https://github.com/reufer/rpihddevice/issues/20
> 

> The HE-AAC support in rpihddevice is experimental, 

as it has been in ffmpeg until today and rpihddevive is based on it?

> maybe because the 
> sampling rate is hard-coded as 48 kHz and the number of channels as 2. 
> Unlike AC3, it does not look like these parameters would be available in 
> any audio frame header. As far I understood from a NorDig.org 
> specification, the sampling rate would always be 48 kHz, but the number 
> of channels could be identified by something in the container, 
> specifically, Table 12.28 and Table 12.29 at page 164 of
> https://nordig.org/wp-content/uploads/2016/03/NorDig-Unified- 
> Requirements-ver.-3.2.1.pdf

Have You tried the latest git ffprobe version, does it detect the aac 
flavor of Your dvb-t2 DVB channels correctly?

Have You tried latest git mediainfo?

> 
> What would have to be changed in VDR or rpihddevice or both to correctly 
> switch between 2-channel and 5.1-channel HE-AAC audio? This is mostly an 
> academic question and exercise, because I only have stereo audio 
> hardware and don't know if any programming is actually available with 
> multichannel audio.

Not at all academic. Since AVRs do not implement Fraunhofer codecs we 
need a HDNI PCM Multichannel driver for the raspberry pi to playback 5.1 
channel aac without transcoding it to ac3 which can be done with mplayer 
on the fly.

I've made a HDMI PCM Multichannel output to AVR driver patch for the 
Allwinner SoC alsa audio driver, look for it on the alsa-dev list archives.

> 
> Best regards,
> 
>      Marko

y
tom
