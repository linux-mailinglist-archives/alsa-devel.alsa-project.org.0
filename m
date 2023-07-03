Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4833745562
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 08:20:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A97F844;
	Mon,  3 Jul 2023 08:19:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A97F844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688365200;
	bh=b02O7hMAe/0cdSzPP3WCdlJ3T6kG6Hi5gr453ff6ODI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KtXbLuauxHZ3vt7S+hi9uZGn7eo0cROvXeUW5z556rlA1l21aOpey0ul7Pi7/130R
	 GDqRJKg3CkkHCSScbcdNwyt2oZjRrMyCG0VIWVApizNjsh7RFD5twaeTk/gQA+Cwp+
	 QW594mmYYFrksOvNdakOIeBEYlVVzbV8wLGI0NGs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39C70F80558; Mon,  3 Jul 2023 08:19:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1EB9F80548;
	Mon,  3 Jul 2023 08:19:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F8D1F80153; Mon,  3 Jul 2023 08:18:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7EF97F80104
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 08:18:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EF97F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AaWAZ0Mz
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6EECC60DB7;
	Mon,  3 Jul 2023 06:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CFFC433C8;
	Mon,  3 Jul 2023 06:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688365104;
	bh=b02O7hMAe/0cdSzPP3WCdlJ3T6kG6Hi5gr453ff6ODI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AaWAZ0MzR5WlM8LsDfCGcJYsVnapu6kw3CisOBlzAeBV65fsgiHj4cTCvUVhiPIXg
	 OWZalDz2U4a5HKVY1ries+snvEPAN5HyGHqmrzszj1Tsai1ox2Wns/gdYr+nnOXCkN
	 hSoOzk1I0NMqkaFaP9CvULBEZ+pw4Cnt1hmw6Yctc6sxyRegJ0XgDy3Q/2nvH7qLUe
	 lXK15gu9WWAliwPVRDZWqp8FG1w7v7J73PeQpU1dmRKdTp1gtpuqigtK6c2oa6xSyg
	 GHkI4K0Bsl8GHo4vYtDDdrF+8+xgRj04wNrn+uNUySINBhEzFIfI2OtIm3OrbcFGHZ
	 cJBJvLinemqQQ==
Date: Mon, 3 Jul 2023 08:18:16 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Uwe =?UTF-8?B?S2xlaW5lLUs=?=
 =?UTF-8?B?w7ZuaWc=?=         <u.kleine-koenig@pengutronix.de>, Mark Brown
 <broonie@kernel.org>, David Lin <CTLIN0@nuvoton.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Antti Palosaari <crope@iki.fi>, Sergey Kozlov
 <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, Yasunari Takiguchi
 <Yasunari.Takiguchi@sony.com>, Michael Krufky <mkrufky@linuxtv.org>,
 Matthias Schwarzott <zzam@gentoo.org>, Akihiro Tsukada <tskd08@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 0/4] ASoC: remove copy of intlog10()
Message-ID: <20230703081816.37028ab7@sal.lan>
In-Reply-To: <20230619172019.21457-1-andriy.shevchenko@linux.intel.com>
References: <20230619172019.21457-1-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UET3L5YCM7QQZ7ZCFBXL7RL2R4VE4X6A
X-Message-ID-Hash: UET3L5YCM7QQZ7ZCFBXL7RL2R4VE4X6A
X-MailFrom: mchehab@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UET3L5YCM7QQZ7ZCFBXL7RL2R4VE4X6A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Em Mon, 19 Jun 2023 20:20:15 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> escreveu:

> The first three patches moves intlog10() to be available in entire
> kernel. The last one removes copy of it in one driver. Besides already
> good Lines of Code (LoC) statistics the upcoming users, if any, can
> utilize the exported functions.
> 
> The series can be routed either via ASoC tree or media tree.
> 
> Note, int_log.h is separated from math.h due to licensing.
> I dunno if we can mix two in a single header file. In any
> case we may do it later on.
> 
> Andy Shevchenko (4):
>   lib/math: Move dvb_math.c into lib/math/int_log.c
>   lib/math/int_log: Use ARRAY_SIZE(logtable) where makes sense
>   lib/math/int_log: Replace LGPL-2.1-or-later boilerplate with SPDX
>     identifier
>   ASoC: nau8825: Replace copied'n'pasted intlog10()

It probably makes sense to apply it at ASoC tree, as the relevant
change is there.

I have just one small nit on patch 1/4, which should be trivial to
solve. Once done, feel free to merge it with  my ack:

Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> 
>  Documentation/driver-api/media/dtv-common.rst |  2 +-
>  drivers/media/dvb-core/Makefile               |  2 +-
>  drivers/media/dvb-frontends/af9013_priv.h     |  2 +-
>  drivers/media/dvb-frontends/af9033_priv.h     |  2 +-
>  drivers/media/dvb-frontends/cxd2820r_priv.h   |  2 +-
>  drivers/media/dvb-frontends/cxd2841er.c       |  2 +-
>  .../cxd2880/cxd2880_tnrdmd_dvbt2_mon.c        |  2 +-
>  .../cxd2880/cxd2880_tnrdmd_dvbt_mon.c         |  2 +-
>  .../media/dvb-frontends/cxd2880/cxd2880_top.c |  2 +-
>  drivers/media/dvb-frontends/dib7000p.c        |  2 +-
>  drivers/media/dvb-frontends/dib8000.c         |  2 +-
>  drivers/media/dvb-frontends/dib9000.c         |  2 +-
>  drivers/media/dvb-frontends/drxk_hard.c       |  2 +-
>  drivers/media/dvb-frontends/lgdt3305.c        |  2 +-
>  drivers/media/dvb-frontends/lgdt3306a.c       |  2 +-
>  drivers/media/dvb-frontends/lgdt330x.c        |  2 +-
>  drivers/media/dvb-frontends/m88ds3103_priv.h  |  2 +-
>  drivers/media/dvb-frontends/mn88443x.c        |  2 +-
>  drivers/media/dvb-frontends/mn88472_priv.h    |  2 +-
>  drivers/media/dvb-frontends/mn88473_priv.h    |  2 +-
>  drivers/media/dvb-frontends/or51132.c         |  2 +-
>  drivers/media/dvb-frontends/or51211.c         |  2 +-
>  drivers/media/dvb-frontends/rtl2830_priv.h    |  2 +-
>  drivers/media/dvb-frontends/rtl2832_priv.h    |  2 +-
>  drivers/media/dvb-frontends/si2165.c          |  2 +-
>  drivers/media/dvb-frontends/stv0367.c         |  2 +-
>  drivers/media/dvb-frontends/tc90522.c         |  2 +-
>  drivers/media/dvb-frontends/tda10048.c        |  2 +-
>  include/{media/dvb_math.h => linux/int_log.h} | 18 +---
>  lib/math/Makefile                             |  2 +-
>  .../dvb-core/dvb_math.c => lib/math/int_log.c | 26 ++----
>  sound/soc/codecs/nau8825.c                    | 93 +------------------
>  32 files changed, 45 insertions(+), 150 deletions(-)
>  rename include/{media/dvb_math.h => linux/int_log.h} (63%)
>  rename drivers/media/dvb-core/dvb_math.c => lib/math/int_log.c (84%)
> 
