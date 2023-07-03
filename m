Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 636E17465C2
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 00:33:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 597221E0;
	Tue,  4 Jul 2023 00:32:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 597221E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688423599;
	bh=5P0sRkgZqSZaVbWe4wXGNwodGCwZMTBEXAOh74wUeLY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nXkrXE+LM8OlluSy4B2l+AvnE/93th4bzcswi961oe7UhtqF+FHWIS7myns3Ijhp2
	 yUdzg6QU01FT2GgSuPNX4fPjbQwzEEkWCrcYAgPNAdwUvEA7xrTHhFpt5ksGB2FCRg
	 C4IJ02nD6i9Jb2FjvjNdUcW/BxbuLL3pAw8ypY2U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD670F80124; Tue,  4 Jul 2023 00:32:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53B72F80124;
	Tue,  4 Jul 2023 00:32:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4845F80125; Tue,  4 Jul 2023 00:32:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 422F6F800E4
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 00:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 422F6F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=38OfsZwU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=eZ6Gzs4f1s1uX6XyZuNRQFk10FJphKL4cNWsqk5e5i4=; b=38OfsZwUZeQ0jx8BECK9hDWayf
	REHh1SSh+ICcToamGGKVHk8kR8Roj/SAu1ViWp58tJPR5MkVuX5ARqiyIlcAEm6Q/XTT+DviJDsW7
	mjc/Bh4/Eo1R6eFWgU76undjmyTpOcBj7MdcfDxx9rX51pOpNhijnDazeSKvbROTSKR3ydram/v5x
	jEInUf1umcXy91Ax+HcRhgea0ANDi/fybamVptP/4h/CzPL90r2erijSebOFCttN9MqIuWFOzPr2W
	GUymJC8A8oVXtJVTjaDMh3lOHPjNUs7uEk+ZIHUkQ+B5wRkc1y8snwlMrpwtSnDWNldEn5ONqA4TG
	FKHJS6XA==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qGS5F-00BZ1F-2a;
	Mon, 03 Jul 2023 22:31:49 +0000
Message-ID: <acb675e6-0a41-8965-f1b9-da403d76b7ee@infradead.org>
Date: Mon, 3 Jul 2023 15:31:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/4] lib/math: Move dvb_math.c into lib/math/int_log.c
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, David Lin <CTLIN0@nuvoton.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, alsa-devel@alsa-project.org
Cc: Jonathan Corbet <corbet@lwn.net>, Antti Palosaari <crope@iki.fi>,
 Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>,
 Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>,
 Michael Krufky <mkrufky@linuxtv.org>, Matthias Schwarzott <zzam@gentoo.org>,
 Akihiro Tsukada <tskd08@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230703135211.87416-1-andriy.shevchenko@linux.intel.com>
 <20230703135211.87416-2-andriy.shevchenko@linux.intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230703135211.87416-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: F6QXWRYZDZQSZECNN7HIOV76EUIRDCPP
X-Message-ID-Hash: F6QXWRYZDZQSZECNN7HIOV76EUIRDCPP
X-MailFrom: rdunlap@infradead.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F6QXWRYZDZQSZECNN7HIOV76EUIRDCPP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/3/23 06:52, Andy Shevchenko wrote:
> Some existing and new users may benefit from the intlog2() and
> intlog10() APIs, make them wide available.
> 
> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Link: https://lore.kernel.org/r/20230619172019.21457-2-andriy.shevchenko@linux.intel.com
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/core-api/kernel-api.rst                 |  7 +++++--
>  Documentation/driver-api/media/dtv-common.rst         |  9 ---------
>  drivers/media/dvb-core/Makefile                       |  2 +-
>  drivers/media/dvb-frontends/af9013_priv.h             |  2 +-
>  drivers/media/dvb-frontends/af9033_priv.h             |  2 +-
>  drivers/media/dvb-frontends/cxd2820r_priv.h           |  2 +-
>  drivers/media/dvb-frontends/cxd2841er.c               |  2 +-
>  .../dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt2_mon.c  |  2 +-
>  .../dvb-frontends/cxd2880/cxd2880_tnrdmd_dvbt_mon.c   |  2 +-
>  drivers/media/dvb-frontends/cxd2880/cxd2880_top.c     |  2 +-
>  drivers/media/dvb-frontends/dib7000p.c                |  2 +-
>  drivers/media/dvb-frontends/dib8000.c                 |  2 +-
>  drivers/media/dvb-frontends/dib9000.c                 |  2 +-
>  drivers/media/dvb-frontends/drxk_hard.c               |  2 +-
>  drivers/media/dvb-frontends/lgdt3305.c                |  2 +-
>  drivers/media/dvb-frontends/lgdt3306a.c               |  2 +-
>  drivers/media/dvb-frontends/lgdt330x.c                |  2 +-
>  drivers/media/dvb-frontends/m88ds3103_priv.h          |  2 +-
>  drivers/media/dvb-frontends/mn88443x.c                |  2 +-
>  drivers/media/dvb-frontends/mn88472_priv.h            |  2 +-
>  drivers/media/dvb-frontends/mn88473_priv.h            |  2 +-
>  drivers/media/dvb-frontends/or51132.c                 |  2 +-
>  drivers/media/dvb-frontends/or51211.c                 |  2 +-
>  drivers/media/dvb-frontends/rtl2830_priv.h            |  2 +-
>  drivers/media/dvb-frontends/rtl2832_priv.h            |  2 +-
>  drivers/media/dvb-frontends/si2165.c                  |  2 +-
>  drivers/media/dvb-frontends/stv0367.c                 |  2 +-
>  drivers/media/dvb-frontends/tc90522.c                 |  2 +-
>  drivers/media/dvb-frontends/tda10048.c                |  2 +-
>  include/{media/dvb_math.h => linux/int_log.h}         |  7 +++----
>  lib/math/Makefile                                     |  2 +-
>  .../media/dvb-core/dvb_math.c => lib/math/int_log.c   | 11 ++++++-----
>  32 files changed, 42 insertions(+), 48 deletions(-)
>  rename include/{media/dvb_math.h => linux/int_log.h} (92%)
>  rename drivers/media/dvb-core/dvb_math.c => lib/math/int_log.c (95%)

-- 
~Randy
