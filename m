Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D479F93FA22
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2024 17:58:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5240FE68;
	Mon, 29 Jul 2024 17:58:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5240FE68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722268731;
	bh=CbhyjmepvZ2GQWlE4o/bGvvFhBwaNQx9b3bICGSN68M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HL4/RWpvJWpVJJ8BOugbaYd4HoovvrkA8Ii7wK0HXAie2vwmrq++pAka+YDA/qNEP
	 zgj0oJbJkK3Jm3+heVkMc3PCNbMq2zK+XqnYnA2fV4HPqmCMgLIvJLuL4LCmkDhUI2
	 doeWO6lXq4p0FCEE3zlASPAv68GxgzczZYMpDyeU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 894EAF805BB; Mon, 29 Jul 2024 17:58:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1F3DF80580;
	Mon, 29 Jul 2024 17:58:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61043F802DB; Mon, 29 Jul 2024 17:57:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BA45F800E3
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 17:57:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BA45F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=FdMFuaNA
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3687f8fcab5so1425528f8f.3
        for <alsa-devel@alsa-project.org>;
 Mon, 29 Jul 2024 08:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722268627;
 x=1722873427; darn=alsa-project.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fQJQXLHnlv/DKOapoxTHZwq5P+QBGMyJlUyNZAowiSs=;
        b=FdMFuaNAdz+89iF3WJvXVdxhVzSYxornxf5PQMSq1ZhR2muS5dP9ah0GFMV/H3SNkV
         rF+88u12n6m4YYz44ySJ7p+aRxJ85NwIkl2pQUTjcsPg7W8oyGD7B2hXoIvw4Gsvz3bH
         XiIeowgs67quotdcAh4ejGwJV3FATG7oeMge95TcAc7WgGlNkw0iW7Ec7W75967qssPm
         WLzyUYTo60YwUcxxG4+mj5dGKsmrPsWUhKNWmLIIt3+D7xgMbOFlbtXzWF7xtU6aQY8m
         QA+M3xbeNtc06/8dCzQC9dmNUtfqt+knBz6gwIJ9YLGxFnueFZHf8D4xT+XJ8UpGqvZ9
         uILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722268627; x=1722873427;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fQJQXLHnlv/DKOapoxTHZwq5P+QBGMyJlUyNZAowiSs=;
        b=TAvkbcKSjHy7UGw9je81qwqTNnNQhCUnevC9a9zj78HTk9hXQuBUD6UMJBmBwalr11
         F3dbWL4VHrYmXC/Ga0bjT+rapLhSzhs8D6Wm+VLYnzxMh1JH4TAnJyoQA6b57okHanbh
         lSUm+T05rbxyT5brtrEkdAmELU+3fAs3cKXFI9VpYg/oyO2jwYc2geO8Ji8ZTSHVut4U
         TFEpTw4SFjxK8vKXFyCu384J6VXQscdo7ZWSvDqnnWbOrIUx2gldEjJnJY59ODmHmB8x
         CTIXXIT0ECWyMk+2HtMOe9rx99NAtqGNXjALXXjIhKRHPwmLo8KTHqMpUAutzKnp9KiI
         xRlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXREATJq/x18OAy0faHicrhmGiBHmYA74uYBHbKSFPvL3ZHGtUzQ8pLxAV6QMk9w3zxiPBbLlvjydHj1KqZcQhozjC0Gbm8bkeQdc8=
X-Gm-Message-State: AOJu0Yy2/68wwowqZDR8c0jvL0cPUOhyDdYQsl1NcQFJ3KROaA/gg9tf
	NxjemyPzkdLVRIc/+4L1PhBqCDnhAvraujDqr9gwVly2itPq+Rg5Vrp5P0nXOVY=
X-Google-Smtp-Source: 
 AGHT+IEBBx5LsAEMyoM6oe7rtQrWY0rnpjUL/ghKQBCG5QRwkixQ4Ro9RCrukrZIHEiRAWSLTz45yw==
X-Received: by 2002:a5d:6347:0:b0:35f:10ac:ea50 with SMTP id
 ffacd0b85a97d-36b5cefc0afmr5637864f8f.37.1722268626835;
        Mon, 29 Jul 2024 08:57:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:abd3:cdc8:2363:54ef])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b3687003dsm12532306f8f.115.2024.07.29.08.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 08:57:06 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, linux-rt-users@vger.kernel.org
Cc: Arseniy Krasnov <avkrasnov@salutedevices.com>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai
 <tiwai@suse.com>,  Neil Armstrong <neil.armstrong@linaro.org>,  Kevin
 Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  alsa-devel@alsa-project.org,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
  kernel@sberdevices.ru,  oxffffaa@gmail.com
Subject: Re: [PATCH v1] ASoC: meson: axg-fifo: set option to use raw spinlock
In-Reply-To: <7dfdade5-3a57-4883-bfac-067c50ec0ffb@sirena.org.uk> (Mark
	Brown's message of "Mon, 29 Jul 2024 16:28:56 +0100")
References: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
	<1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
	<2b16b95e-196e-4d8a-98c3-3be568cdd18a@sirena.org.uk>
	<1j5xsow839.fsf@starbuckisacylon.baylibre.com>
	<7dfdade5-3a57-4883-bfac-067c50ec0ffb@sirena.org.uk>
Date: Mon, 29 Jul 2024 17:57:05 +0200
Message-ID: <1j1q3cw5ri.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: PLVY7SNVYTIYLP72BOHKGYL2QGPG6WZF
X-Message-ID-Hash: PLVY7SNVYTIYLP72BOHKGYL2QGPG6WZF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PLVY7SNVYTIYLP72BOHKGYL2QGPG6WZF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon 29 Jul 2024 at 16:28, Mark Brown <broonie@kernel.org> wrote:

> On Mon, Jul 29, 2024 at 05:06:50PM +0200, Jerome Brunet wrote:
>> On Mon 29 Jul 2024 at 15:44, Mark Brown <broonie@kernel.org> wrote:
>
>> > I don't recall this coming up much TBH.  It may be that people just set
>> > raw spinlocks when they need it, or that there's not many people using
>> > relevant devices with RT kernels.
>
>> I have not been playing much with RT TBH, but AFAIK, with RT irq
>> handlers are threaded unless IRQF_NO_THREAD is set. In this case,
>> something preemptible in the handler should not be a problem.
>
>> The axg-fifo drivers do not have IRQF_NO_THREAD so something is a bit
>> unclear here.
>
> Yeah, it's definitely likely to happen all the time for people using RT
> with relevant devices.  I'm not sure I have a good sense of if it's
> likely to be a nasty surprise to switch raw spinlocks on by default when
> it's currently controllable, I'd expect it'll generally be fine but it's
> possibly a bit rude to any users that don't use interrupts...

Indeed it is bit radical.

My concern with this patch is that, IIUC, the handler should be
threaded under RT and there should be no problem with the spinlock API.

Adding the RT folks to try to get a better understanding, they should
have been CCed anyway.

-- 
Jerome
