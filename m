Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC79B87A58D
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Mar 2024 11:07:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BED610BE;
	Wed, 13 Mar 2024 11:07:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BED610BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710324451;
	bh=HwGbsRac51u5IWwjbzw3ouLNHThjNvNYMLQfmsHJPTw=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bhJ4jJf7hGLNG6HKk5iqUcJycmntPqG1oAt8/bcoX3IBIYo+ewYgN8z5TjrxzoOF4
	 FgHyM4HwSAVo7im8pHzSUsE3vnuIH9MU2zxF3PLMS/qvsMmz6BjXagwMaXFCycO7+f
	 NzqfdNZofyXQn7ac0y1ru0u7gG3rJRTQ7B/athqY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E69CF80570; Wed, 13 Mar 2024 11:06:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB67FF805A0;
	Wed, 13 Mar 2024 11:06:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53654F804B0; Wed, 13 Mar 2024 11:03:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A2444F80088
	for <alsa-devel@alsa-project.org>; Wed, 13 Mar 2024 11:03:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2444F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=LmARl/U0
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-513c81abeb4so705606e87.3
        for <alsa-devel@alsa-project.org>;
 Wed, 13 Mar 2024 03:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710324214;
 x=1710929014; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=mFXVAdau/l1Yd43WSAm/Bs1i7fcklBkhvYYQSoayl5k=;
        b=LmARl/U0m48QDuC4NZ5QlmZ1qraH2z2bXChVWOUNiNgKfkVTULvkKu8w4DqZwXPr9x
         3yuBKaJO/AC4bW854lj9HnQ5nPYqrwDA4u9n1z55nb1YGcpu4KUVWCw6VmY61PRu9TO0
         zGFI4/ohX3LqUuEK121ruPWxZozDfmuYn7Ya83erjkOfkHguBF813WrtbHaZ7jBnf+af
         975N/deHKHGiNsTH6tUYOXOWEJkRgDseEtW6dDA6ntjNbEh5a9IsxjYsoU7qepGmGfJ0
         2KfptVPNx9xgLHrHnOgBC0HDwBzU4l1NorLnA9GW/w0EAQuy3iWay9ZFHm3F6FQaB+6m
         dKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710324214; x=1710929014;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFXVAdau/l1Yd43WSAm/Bs1i7fcklBkhvYYQSoayl5k=;
        b=WlxJOHQ0GSlCfqreGvlBVQUcM1usMXi3mKmdGSt0mn+jyCObiGNjPHsp/m0LBQZF7+
         /qXk6JD8ZVsXllHELmEA3QaEJqq20qAI1OVuFfKbwoJrEeb9kJ/FTM01dqK86lZGjuy1
         kL+BNKlEaSmZ1GCSUWwRNV1tasM/wE4sxD20EjXuV52etSFxGy4YDwtlACcyw3lTEhB9
         66+xqbG4YXeryRNcUlIlQ8YOsZHwjDuuuP2SIoFOQdN/tIPSG7EtxQk56Swd2348EFRp
         gAZ5lRn8kKSe7dhXXhjG3MKaS8Vnvy6c44l/rBcs7TGXSGpwmnruTcdbMvu/siC3rTsS
         I3Uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1wGYkh8kmIX5914AciMoAzcIYfJlRK6FE8IZQKsffTxoqAF0hfcAgSUhUPA7NpmrdBfGMZMnWhuztDtEO4LkbHQULCxgvqNTMLlo=
X-Gm-Message-State: AOJu0YyQJzxh1W0IzSKYoN/PYN2mbq++nJ4UwRV2oWI9M954fiL6Z3TU
	9zbJGDjUpDmJOtzC/5J23I6EpgX+n+byfNpiRXWKu4cODp2V7VmDr2YTrLmDwI8=
X-Google-Smtp-Source: 
 AGHT+IFt0tL9EYUI8h3Qhh2fon51usuWluueHQ7dWS5cclJS8uIzb9fifp0Y06P8l3gUr4jEE5P/5g==
X-Received: by 2002:a05:6512:3d06:b0:513:4afa:a719 with SMTP id
 d6-20020a0565123d0600b005134afaa719mr2343299lfv.59.1710324213904;
        Wed, 13 Mar 2024 03:03:33 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5791:c3f6:da5e:acb8])
        by smtp.gmail.com with ESMTPSA id
 j15-20020a05600c190f00b0041312855081sm1828615wmq.5.2024.03.13.03.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 03:03:33 -0700 (PDT)
References: <87v8a64f3d.wl-kuninori.morimoto.gx@renesas.com>
 <87ttpq4f2c.wl-kuninori.morimoto.gx@renesas.com>
 <e7121fbc-c814-4153-9f17-82ad5de13e64@sirena.org.uk>
 <87a5n46xjk.wl-kuninori.morimoto.gx@renesas.com>
 <7248b107-db87-4409-b93c-f65035d0a6b4@sirena.org.uk>
 <1jo7bje6da.fsf@starbuckisacylon.baylibre.com>
 <b9de4fd1-ef4a-4c30-b3cf-e36931be90f1@sirena.org.uk>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 1/5] ASoC: makes CPU/Codec channel connection map
 more generic
Date: Wed, 13 Mar 2024 10:36:41 +0100
In-reply-to: <b9de4fd1-ef4a-4c30-b3cf-e36931be90f1@sirena.org.uk>
Message-ID: <1jh6haih3f.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: YVVDQ3L6LOGJNN4QSCDL4MCPYC7T2XZG
X-Message-ID-Hash: YVVDQ3L6LOGJNN4QSCDL4MCPYC7T2XZG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YVVDQ3L6LOGJNN4QSCDL4MCPYC7T2XZG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue 12 Mar 2024 at 17:06, Mark Brown <broonie@kernel.org> wrote:

> [[PGP Signed Part:Undecided]]
> On Tue, Mar 12, 2024 at 05:29:25PM +0100, Jerome Brunet wrote:
>
>> Mark, I suspect the boards you have (like the libretech Alta/Solitude or
>> the kvim3 maybe) will show the same thing.
>
> I don't have the kvim3 but I can try with the other two (modulo pain
> with u-boot), it'll be tomorrow now though.

I've check the other boards from same SoC family (g12 and sm1) for the
same kernel build:

https://linux.kernelci.org/test/job/mainline/branch/master/kernel/v6.8-rc7-250-g137e0ec05aeb/plan/baseline/

* Only the u200 is failing. The others devices of the same family are fine.
* The u200 is the only one being test with gcc-10 / defconfig + debug
* The others have been tested with clang-16 / defconfig + CONFIG_ARM64_64K_PAGES

I've checked locally with gcc-13 on the vim3l (sm1 - s905x3)
* OK with defconfig
* Problem reproduced with defconfig + debug fragment from kCI - Observations:
  * Kernel is extremely fat (150+ MB)
  * Boot process incredibly slow.

Fragment is here:
https://storage.kernelci.org/mainline/master/v6.8-rc7-250-g137e0ec05aeb/arm64/defconfig+debug/gcc-10/config/kernelci.config

I'll continue to check but this is apparently related to the options
turned on by the debug fragment. Maybe it could be interesting to check
another non-intel SoC manufacturer using DPCM with this fragment ?
(another device relying on cleared ch_maps - Renesas and/or MTK maybe ?)

-- 
Jerome
