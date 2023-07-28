Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D318766862
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 11:12:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13F3C828;
	Fri, 28 Jul 2023 11:11:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13F3C828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690535527;
	bh=jsukJ3h2ilmz083UcYGengZNcUIJYlLHWk6g/LKxW1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bR3Lduhv84oGjrOzPTIbBBpk9a2fI2UOEAqCsT7buAJtZ4vm1yX9bT0MJPFwUekfb
	 4jAM7q5+FFXKiVKVWm8j0klGnN1dNfrpdwByL4an8lMp8dMRWkwhAJkkUmcZvE+eln
	 jsOzrv1ioYflxHXBrCRWYhaMUozbcxh+PBtwk4bI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDD5DF80153; Fri, 28 Jul 2023 11:10:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CE30F80163;
	Fri, 28 Jul 2023 11:10:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10F76F8019B; Fri, 28 Jul 2023 11:10:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E59D8F800C7
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 11:10:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E59D8F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Jq54e2P2
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A4A2662086;
	Fri, 28 Jul 2023 09:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF74C433C7;
	Fri, 28 Jul 2023 09:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690535437;
	bh=jsukJ3h2ilmz083UcYGengZNcUIJYlLHWk6g/LKxW1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jq54e2P2vabTsv0/ZkCTu/TtAKcPA/986KlVzpTtjaLAFsettUVGxIIEhV012qHmY
	 XjZnDjmAeW2ab1ZsUURkM7jE4L/524t63e/2b+AR7jZDEQXiyB3jMa2BRjo+JEpwRs
	 l3QdUPJ8w/4urXWddV+VETsCyali7ZkVGVcRJ/K6g+RVz5T9C+bf9WioC+uygEDa9I
	 Rh3AvZFW0PdulmDiZySwu0Xy2XsI/jHB3Xyi77hPM/dAwa7KUnEsd9+KEupPqjueWP
	 u1x3RpBtfjI/oksjIHjYF89qn/jUU3ZW18drI+6RQKSDrQ5SYoMzV9cMfadNlCraZU
	 lW9h48LazI1/g==
Date: Fri, 28 Jul 2023 10:10:24 +0100
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Thor Thayer <thor.thayer@linux.intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tony Lindgren <tony@atomide.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
	chrome-platform@lists.linux.dev, alsa-devel@alsa-project.org,
	linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mfd: Explicitly include correct DT includes
Message-ID: <20230728091024.GE8175@google.com>
References: <20230714174731.4059811-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230714174731.4059811-1-robh@kernel.org>
Message-ID-Hash: XFH2X63MPOQIEIOES3PNWWWIGALDG5WD
X-Message-ID-Hash: XFH2X63MPOQIEIOES3PNWWWIGALDG5WD
X-MailFrom: lee@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XFH2X63MPOQIEIOES3PNWWWIGALDG5WD/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 14 Jul 2023, Rob Herring wrote:

> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/mfd/ab8500-core.c           | 1 -
>  drivers/mfd/acer-ec-a500.c          | 2 +-
>  drivers/mfd/act8945a.c              | 2 +-
>  drivers/mfd/altera-sysmgr.c         | 3 +--
>  drivers/mfd/arizona-core.c          | 1 -
>  drivers/mfd/atc260x-core.c          | 1 -
>  drivers/mfd/bcm590xx.c              | 1 -
>  drivers/mfd/cros_ec_dev.c           | 2 +-
>  drivers/mfd/da9052-i2c.c            | 5 +----
>  drivers/mfd/da9055-i2c.c            | 1 -
>  drivers/mfd/da9062-core.c           | 2 +-
>  drivers/mfd/hi655x-pmic.c           | 4 ++--
>  drivers/mfd/iqs62x.c                | 2 +-
>  drivers/mfd/lp873x.c                | 2 +-
>  drivers/mfd/madera-i2c.c            | 1 -
>  drivers/mfd/madera-spi.c            | 1 -
>  drivers/mfd/max77620.c              | 1 -
>  drivers/mfd/max77686.c              | 1 -
>  drivers/mfd/max77843.c              | 2 +-
>  drivers/mfd/max8907.c               | 1 -
>  drivers/mfd/max8925-core.c          | 1 -
>  drivers/mfd/max8997.c               | 1 -
>  drivers/mfd/max8998.c               | 1 -
>  drivers/mfd/mt6358-irq.c            | 5 ++---
>  drivers/mfd/mt6397-core.c           | 5 +++--
>  drivers/mfd/mt6397-irq.c            | 5 ++---
>  drivers/mfd/palmas.c                | 3 ++-
>  drivers/mfd/qcom-pm8008.c           | 2 +-
>  drivers/mfd/rave-sp.c               | 2 +-
>  drivers/mfd/rk8xx-core.c            | 2 +-
>  drivers/mfd/rohm-bd71828.c          | 2 +-
>  drivers/mfd/rohm-bd718x7.c          | 2 +-
>  drivers/mfd/rohm-bd9576.c           | 2 +-
>  drivers/mfd/rt5033.c                | 2 +-
>  drivers/mfd/rz-mtu3.c               | 4 +++-
>  drivers/mfd/sec-core.c              | 2 --
>  drivers/mfd/sprd-sc27xx-spi.c       | 2 +-
>  drivers/mfd/ssbi.c                  | 6 +++---
>  drivers/mfd/stm32-lptimer.c         | 1 +
>  drivers/mfd/stm32-timers.c          | 1 +
>  drivers/mfd/sun4i-gpadc.c           | 4 ++--
>  drivers/mfd/ti-lmu.c                | 1 -
>  drivers/mfd/ti_am335x_tscadc.c      | 2 +-
>  drivers/mfd/tps6507x.c              | 1 -
>  drivers/mfd/tps65090.c              | 1 -
>  drivers/mfd/tps65217.c              | 1 -
>  drivers/mfd/tps65218.c              | 1 -
>  drivers/mfd/tps6594-core.c          | 2 +-
>  drivers/mfd/twl6040.c               | 2 --
>  drivers/mfd/wm831x-core.c           | 3 +--
>  drivers/mtd/chips/cfi_cmdset_0002.c | 3 +--
>  51 files changed, 42 insertions(+), 66 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
