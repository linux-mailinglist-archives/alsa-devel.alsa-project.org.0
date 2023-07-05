Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3330748687
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 16:40:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C43783E7;
	Wed,  5 Jul 2023 16:39:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C43783E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688567999;
	bh=R8aWXpLF/uB7zTkUi9Gr8xyNd3yM6c/Ws7kW1A/OW98=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SsWCCEdgojShKHRpXzjI++9GZnGRJe3XhiyJ25GZwzQIgnsreeAR41OggKp0TCCl4
	 O3A92fwP6D1v2+51sM8B9tyH/xhBXJMr/ZptKR/0eO36xo4SdMffXYoX/YxRgzc5Gy
	 y0CMLQ2fp8jOUEi93WorwCnXFrf33GAPFAYLc+9I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F542F80124; Wed,  5 Jul 2023 16:39:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90A8EF80124;
	Wed,  5 Jul 2023 16:39:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FFC4F80125; Wed,  5 Jul 2023 13:37:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B75EAF80104
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 13:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B75EAF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=streamunlimited.com header.i=@streamunlimited.com
 header.a=rsa-sha256 header.s=google header.b=ZkdG5g8A
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fba5a8af2cso68453265e9.3
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Jul 2023 04:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=streamunlimited.com; s=google; t=1688557046; x=1691149046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8aWXpLF/uB7zTkUi9Gr8xyNd3yM6c/Ws7kW1A/OW98=;
        b=ZkdG5g8Aa2jsUtf3YmCBYyZdqAfVRO/M39iAUnudqGbx+kqmkLKkyFmtsCJxRHnPAD
         6kkkhHvjKGu8aDqMVJwaf3iPshFcWQWggmuCdV63266OwOj9WcJi87rq06T+G2N9psEe
         OLb12wO5jM9cHaLO0rZiMc6IvOp1WuHVmgWZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688557046; x=1691149046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8aWXpLF/uB7zTkUi9Gr8xyNd3yM6c/Ws7kW1A/OW98=;
        b=WEt/6tL+R9I/RuBY0GR4qJkWS9rNxnuaQaNd3bicGrj2Da7OEOpd3nIQsgXqbaTN8z
         7N3nnjXV0O7um+PIZVSvBXrBiesJqC23u0lYnmeiG7qFFw/DkrHiYjnbPgWpCDC8bqck
         N8OCqoiPZYRm+Pmaj2qX1C3XZGDqZ92j2ieSRYZmbQXyX6/3MbYXv0NKWKAlLv8R4w8r
         a2XWvPRph+D4WC+TC/HTGtB7ltho7/k3p3HEhoQTBTOAip+3ysU9DDvJmBxQ3aA9YVDz
         4BpxbsAWTyAo7MQM5BsWYMOzWEVxKsqmaHknYspcHlpreN1pADiz+/Lmr1YEn1O2fQYk
         WC8A==
X-Gm-Message-State: AC+VfDxJIxbnAnGBworeLISi2ZIaa917MTZdAlJNgAmI1CNrVDIcNr1v
	80cOaWUJw6kxugTuYXsd0ujuAKZeexDeI0huvze+7ZdgHVDp28BLdfg=
X-Google-Smtp-Source: 
 ACHHUZ4ER11XVWpijQ3xcGXichsaVw88Bea3pLu7DUuq1yiZW9I7I7N07DEQbWoCS9T5/HNKWl6w8YusvmmNJ0IHFU0=
X-Received: by 2002:a7b:c7d5:0:b0:3f9:70f:8b99 with SMTP id
 z21-20020a7bc7d5000000b003f9070f8b99mr12524790wmk.7.1688557045952; Wed, 05
 Jul 2023 04:37:25 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CACMGZgY9SLGJ3d+66DxXwddwh2LTw3BXeEWUBGN=7fyrO0QkeQ@mail.gmail.com>
 <ae06b00a-f3f7-f9d1-0b58-4d71f3394416@linux.intel.com>
In-Reply-To: <ae06b00a-f3f7-f9d1-0b58-4d71f3394416@linux.intel.com>
From: Peter Suti <peter.suti@streamunlimited.com>
Date: Wed, 5 Jul 2023 13:37:15 +0200
Message-ID: 
 <CACMGZgYcjGghOkvcyEvCYsK+Y+xUOF5S6CNoedV1P3k7MSzcrw@mail.gmail.com>
Subject: Re: snd_soc_dai_ops.startup called for all codecs
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org,
	=?UTF-8?Q?Radek_Dost=C3=A1l?= <radek.dostal@streamunlimited.com>,
	Martin Pietryka <martin.pietryka@streamunlimited.com>,
 Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: peter.suti@streamunlimited.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UEG3M2VHIATYXHRAOUCT6EEWQRF4RRH4
X-Message-ID-Hash: UEG3M2VHIATYXHRAOUCT6EEWQRF4RRH4
X-Mailman-Approved-At: Wed, 05 Jul 2023 14:39:05 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UEG3M2VHIATYXHRAOUCT6EEWQRF4RRH4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jul 5, 2023 at 9:45=E2=80=AFAM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> [Adding Mark Brown - ASoC maintainer]
>
> On 7/4/23 14:17, Peter Suti wrote
> > Hi,
> >
> > I'm trying to create a sound card which has two codecs associated with
> > one DAI. One codec is responsible for playback and the other one for
> > capture. I can see in soc-pcm.c that
> > __soc_pcm_hw_params() is checking if the stream is valid for the
> > current codec with
> > snd_soc_dai_stream_valid() and if it isn't it is not calling the
> > hw_params() callback.
> > But this check is not there in __soc_pcm_open() which calls
> > snd_soc_dai_startup() for every codec. Can someone shed some light on
> > this? Why is startup() called for codecs that don't support the
> > current stream?
>
> We have a similar issue but with the .trigger callback.
>
> We will send a patch when the merge window closes, see
> https://github.com/thesofproject/linux/pull/4434
>
> You may need a similar test for the startup?

Would it make sense to add this check for every callback then? I still
don't really understand why only hw_params() and trigger() needs such
a check.
