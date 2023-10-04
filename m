Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AAD7B8E15
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 22:32:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AF0BAE8;
	Wed,  4 Oct 2023 22:32:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AF0BAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696451575;
	bh=ESQvJZctYiv8lN6ltsro47C1eNao1M4P8HhyGWJi1h4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BMPTRuANNVp9A+6XRCDC8+04J/21vFJS8G1/xzbOW5pd2eKKQLRc3O0fgcbuLae4v
	 P5MdVUC5GKKhW1Nq2XR/Tr9baadJulgxDhb6p6B7ZwbdDDYnGWIpxYOjOFL/joK1gi
	 xCgtshDfSmT+8OfG9Mpkr0omiTWvBozJAJLrzO+E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D7A4F80552; Wed,  4 Oct 2023 22:31:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 047F0F80310;
	Wed,  4 Oct 2023 22:31:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 703DAF80166; Wed,  4 Oct 2023 22:29:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67857F80166
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 22:28:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67857F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=h1x1dXpx
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D118DB82071
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 20:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340E0C433C9
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 20:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696451297;
	bh=ESQvJZctYiv8lN6ltsro47C1eNao1M4P8HhyGWJi1h4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h1x1dXpxsW0znEXAMg1TsOxUEQAeL4mameKwEflZkI3ud72E4SfSnMLv4MTyPJOGK
	 91xKEos+lnRlsdOawtcs1w7xjj/NrHk6TkQun8DsZU6AEJZ9kq8yvqhWsCcAP7ToV0
	 3GMHy78dDOOJgAnAvr2ii/YekvQwjb2tiYwKcj8h+qj46tO8durP9jmgOwujcb89DT
	 1Fcvt0BdxthkDKsconPNNWQjko1VboNg1Q5AJwRe7Wl23lo/dozWL04bt+Kplgmc+I
	 i/sX6rb9bwFGm0GxmpG+U6qFYRmMILtd8DUJKRvdgDyKyyQ3S4+2RbKVtrvmaizWbG
	 91yqWlSOeijRA==
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2c008042211so3096291fa.2
        for <alsa-devel@alsa-project.org>;
 Wed, 04 Oct 2023 13:28:17 -0700 (PDT)
X-Gm-Message-State: AOJu0Yws5h+lDxuWGvZwKD+9mimLRyxV8u8fRjLDTIKaBGMhPk96Gsv1
	pM1DMJhnSt3JKXyqKWd6M9QDWqhnEeVQdUksvA==
X-Google-Smtp-Source: 
 AGHT+IFXJfh8tz1TfG4klEB0mQGxX4Kz28T+ev5c9ShobOxqcsUhL+MV/lbeEpe9jSwPaddrVVnL759EryfLJI5QK0U=
X-Received: by 2002:a05:6512:605:b0:503:1ca6:c590 with SMTP id
 b5-20020a056512060500b005031ca6c590mr2798624lfe.22.1696451275113; Wed, 04 Oct
 2023 13:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231004-dt-asoc-header-cleanups-v2-0-e77765080cbc@kernel.org>
 <20231004-dt-asoc-header-cleanups-v2-1-e77765080cbc@kernel.org>
 <72f8f521-93f0-4e3d-929c-f7478622ddb3@sirena.org.uk>
In-Reply-To: <72f8f521-93f0-4e3d-929c-f7478622ddb3@sirena.org.uk>
From: Rob Herring <robh@kernel.org>
Date: Wed, 4 Oct 2023 15:27:42 -0500
X-Gmail-Original-Message-ID: 
 <CAL_JsqLw6TKBsTee6U5Yfiz_T7WDt+1LZZNWzW1pL+z9bK5R0w@mail.gmail.com>
Message-ID: 
 <CAL_JsqLw6TKBsTee6U5Yfiz_T7WDt+1LZZNWzW1pL+z9bK5R0w@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] ASoC: Explicitly include correct DT includes
To: Mark Brown <broonie@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Peter Rosin <peda@axentia.se>,
 Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com,
	James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>, Fabio Estevam <festevam@gmail.com>,
	Kiseok Jo <kiseok.jo@irondevice.com>, Kevin Cernekee <cernekee@chromium.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Ban Tao <fengzheng923@gmail.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: JSA55RIONY5YYTEHKUEPOPE3US5UUPLJ
X-Message-ID-Hash: JSA55RIONY5YYTEHKUEPOPE3US5UUPLJ
X-MailFrom: robh@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JSA55RIONY5YYTEHKUEPOPE3US5UUPLJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Oct 4, 2023 at 12:39=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Oct 04, 2023 at 10:58:05AM -0500, Rob Herring wrote:
> > The DT of_device.h and of_platform.h date back to the separate
> > of_platform_bus_type before it was merged into the regular platform bus=
.
> > As part of that merge prepping Arm DT support 13 years ago, they
> > "temporarily" include each other. They also include platform_device.h
> > and of.h. As a result, there's a pretty much random mix of those includ=
e
> > files used throughout the tree. In order to detangle these headers and
> > replace the implicit includes with struct declarations, users need to
> > explicitly include the correct includes.
>
> This is breaking various builds for me, for example arm64 defconfig:

I believe I got some of the include changes in the wrong place. They
should go into patch 5.

Rob
