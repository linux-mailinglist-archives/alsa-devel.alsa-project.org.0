Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD8A93F94C
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2024 17:24:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4E20847;
	Mon, 29 Jul 2024 17:24:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4E20847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722266686;
	bh=v+fA2sL8PT2aaem3wZ1F4FcLGMckWT4YxfNzqDv1uMY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OLtd9v5ySKWZuoxbQEqbK9IvAmoT3K0tZRv7odC4gLG1pJUcl77VTjbUMdC9ZNiAV
	 PsHM8A0kxXbvFVuuR0w+Lm+6nGfRHY01qc9jw7wLoAYlthRq69fLrsiHqivhwzGOn7
	 p5HrxIpRzmiR/xeYdsal+DNDl4ahNqDSMjznTFho=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 337A9F80588; Mon, 29 Jul 2024 17:24:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CA62F805AF;
	Mon, 29 Jul 2024 17:24:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B545F802DB; Mon, 29 Jul 2024 17:12:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=TIME_LIMIT_EXCEEDED
	shortcircuit=no autolearn=unavailable version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 990CDF8007E
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 17:06:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 990CDF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=dsCKal4I
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-426526d30aaso18338915e9.0
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Jul 2024 08:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722265612;
 x=1722870412; darn=alsa-project.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=orECJ2OhLH097DTMjvI6rJNFg6vz3nlf5Yl6sqJTBIE=;
        b=dsCKal4IG45Qu123i38Smj/oNeNvk2lgIlttPZ9YbuJi5HR8U5UNKLq9IcJLrJ0Lfq
         7qM6+gPNaEcmWyT9+Uzx7VnOtY5WH8CV7tA8KHxKdZManU4TumNV1aeqg1gpbIZuBTVE
         7jR+sLypq4EfJnViEBGpohQ4bCSylWAALOBlT0tX1Y2neM4Rw1fL3j2DybcYFgboBywE
         9/3kU2D9UP1HE/fIvspS1xtVWGjAcnZbooGiHTi5sJj5oM21GA/M0HXI2A3aP2aGy+Pr
         N9SWbE/l5nX7Q5Ih86ALKpnAfTfqTQkyOroxM6pNwXkZ24dwAbdqKUoEQN8H3omAzPdg
         Q3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722265612; x=1722870412;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=orECJ2OhLH097DTMjvI6rJNFg6vz3nlf5Yl6sqJTBIE=;
        b=da6T8+bCtTBBNdPzt8jLQ6nFzEgx+jVL1E3zyVowFLl+0q1TSN9tFnVkrAMD/W3dOQ
         FPyFldBvzvHCXobA0om2z56zS1FU8wrT68fi5SAjygIyYySVAw2P2wFtlZWu46tYlsqK
         wh70Tj4wBUdURjrdTtHOpFlrXyU7rwHnW6l7+6JcocMZmvedAM5YBx0jA6aosHYvC5gU
         P934pAdX5pV1L6plFeikObLFxC52lz+7ezkCMI1PkhuyKZbtda5DS/QJrNpXSZnaFPr8
         +69Qwv1fy8/wAwofxJl5LbnMYnFLrh9yOb7g+MP6wH47j3RqyDC/2QFL8YT51KAIkebl
         tcmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7YUSVWgZSzhS+y87luk94jsp5/Br/igjU2vOCXK+tS61p17diqsUxnw5MvIvXLHft5qtlDK2l47xp4StAjgVjf3fMQLqcelwjeNg=
X-Gm-Message-State: AOJu0Yy/0MW3SXKGbpl/iYXFs0iYUsE6rTJadOH3Eb+057t1eeA8Vo37
	iC4HZlqHQX4AtY1TPxCWSWqcIe85ibayjmtwjINmOK+hnD4eWxHgj8jiPRHBaok=
X-Google-Smtp-Source: 
 AGHT+IFOpQKJrPEBTB7GUU+M3eQUukpjNflQqjbfqksXjQSALpbGkhpQ80Fn1dUw9m4ErxOkFf+giQ==
X-Received: by 2002:a05:600c:4706:b0:427:d8f7:b718 with SMTP id
 5b1f17b1804b1-42811dd19f0mr51394475e9.24.1722265611970;
        Mon, 29 Jul 2024 08:06:51 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:abd3:cdc8:2363:54ef])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367c067esm12408017f8f.20.2024.07.29.08.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 08:06:51 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: Arseniy Krasnov <avkrasnov@salutedevices.com>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai
 <tiwai@suse.com>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  alsa-devel@alsa-project.org,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
  kernel@sberdevices.ru,  oxffffaa@gmail.com
Subject: Re: [PATCH v1] ASoC: meson: axg-fifo: set option to use raw spinlock
In-Reply-To: <2b16b95e-196e-4d8a-98c3-3be568cdd18a@sirena.org.uk> (Mark
	Brown's message of "Mon, 29 Jul 2024 15:44:38 +0100")
References: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
	<1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
	<2b16b95e-196e-4d8a-98c3-3be568cdd18a@sirena.org.uk>
Date: Mon, 29 Jul 2024 17:06:50 +0200
Message-ID: <1j5xsow839.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: SXRN324XKIUBNNOVNKPXFE4HEMMFMOGT
X-Message-ID-Hash: SXRN324XKIUBNNOVNKPXFE4HEMMFMOGT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SXRN324XKIUBNNOVNKPXFE4HEMMFMOGT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon 29 Jul 2024 at 15:44, Mark Brown <broonie@kernel.org> wrote:

> On Mon, Jul 29, 2024 at 04:15:31PM +0200, Jerome Brunet wrote:
>
>> Maybe mmio regmap should '.use_raw_spinlock = true' by default when
>> '.fast_io' is set ?
>
>> Mark, what is your opinion on this ? I guess it is not the first time
>> this occurs ?
>
> I don't recall this coming up much TBH.  It may be that people just set
> raw spinlocks when they need it, or that there's not many people using
> relevant devices with RT kernels.

I have not been playing much with RT TBH, but AFAIK, with RT irq
handlers are threaded unless IRQF_NO_THREAD is set. In this case,
something preemptible in the handler should not be a problem.

The axg-fifo drivers do not have IRQF_NO_THREAD so something is a bit
unclear here.

-- 
Jerome
