Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1906D7E27
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 15:55:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E85FF1E3;
	Wed,  5 Apr 2023 15:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E85FF1E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680702958;
	bh=afQp0pzn0/QeQA2yZuPiGA1HfkQUMzgZArsWN6F3gP8=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vg6TA+qlenVpboHNNgHnObh1XBpxA6K4NncETWmTQGo/gV67BnrursOmG+Le+2TR3
	 S872He+5KrmMG+512td1CN59rcmzOO4qafQkq+2L3tnnqjk7Hm1z5Ot0oh1E+Hs90U
	 HWgQnRXZLZZPx+9Fmvo3TYexd/1tGEr0Yln7EKgw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69F4AF80249;
	Wed,  5 Apr 2023 15:55:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B27EDF8026D; Wed,  5 Apr 2023 15:55:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CF39F8015B
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 15:54:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CF39F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BJzRUELO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9B45D62942;
	Wed,  5 Apr 2023 13:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14212C433D2;
	Wed,  5 Apr 2023 13:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680702896;
	bh=afQp0pzn0/QeQA2yZuPiGA1HfkQUMzgZArsWN6F3gP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BJzRUELOzZFM4zemOrIWywg+3ZyP3masCyIl5+zZlAB09XTI6j0Nki00evmuKOTJY
	 1PckAHEU9PDXJ+7sUqjZBOo7K8vEYAKQsSHYxvoWGq42pTvxAdIi4OEX3fvUN3LyzD
	 cWhFN9VprMBARPc3xovQJAWqPiFoXA9QyncVskUC/HCxqx0YLUjfYH1BD+rb0tyPXk
	 6yHuY5PPh+Ng6icedCWO7f1PXkcLxW7gyC3lxLEB81vMOAwXPGmlFGCDk5zAwuO3mB
	 l8rL+Up4CnppD4DdNEtADRAbDQwZ4h/eBb+avX0sB3v3khVzpyyq2aGF4JG/p7Z9T6
	 sA9i588CorxQg==
Date: Wed, 5 Apr 2023 14:54:50 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 2/5] mfd: Add support for the Lantiq PEF2256 framer
Message-ID: <20230405135450.GF8371@google.com>
References: <20230331094208.41ab4420@bootlin.com>
 <6d39e9c3-fb6a-4b2a-9889-8fe8d86716d5@linaro.org>
 <20230331141104.42445da9@bootlin.com>
 <a642e653-e3e2-c3d2-68cb-1efc92be05bb@linaro.org>
 <20230331165904.4e7f46a1@bootlin.com>
 <20230403142822.GA8371@google.com>
 <20230404092036.2d1cd5d9@bootlin.com>
 <f7ab2fcc-93fc-ce87-8767-579d33907225@linaro.org>
 <20230404100759.5bc9cd20@bootlin.com>
 <143754c2-9e37-4386-af92-174c0df2eb0a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <143754c2-9e37-4386-af92-174c0df2eb0a@linaro.org>
Message-ID-Hash: GJKUJRRONTBKWXHEF72UPTR2SS7GRCN2
X-Message-ID-Hash: GJKUJRRONTBKWXHEF72UPTR2SS7GRCN2
X-MailFrom: lee@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GJKUJRRONTBKWXHEF72UPTR2SS7GRCN2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 04 Apr 2023, Krzysztof Kozlowski wrote:

> On 04/04/2023 10:07, Herve Codina wrote:
>
> >>> So, the structure I have in mind:
> >>> - pef2256.c (MFD)
> >>>   implement and do the setup at probe()
> >>>   Add the children at probe():
> >>>     - pef2256-pinctrl (pinctrl) added using mfd_add_devices()
> >>>     - pef2256-codec (ASoC codec) added using devm_of_platform_populate()
> >>>
> >>> Lee, with this in mind, can the core pef2256.c be a MFD driver ?
> >>
> >> You do not use MFD here, so why do you want to keep it in MFD? If you
> >> disagree, please tell me where is the MFD code in your patch?
> >
> > I don't want to absolutely use MFD.
> > I just want to put my driver somewhere and I don't know the right location
> > between MFD and Misc.
> >
> > Basically, the driver needs to do (little simplified and error path removed):
> >
> >   static const struct mfd_cell pef2256_devs[] = {
> >   	{ .name = "lantiq-pef2256-pinctrl", },
> >   };
> >
> >   static int pef2256_probe(struct platform_device *pdev)
> >   {
> > 	struct pef2256 *pef2256;
> > 	void __iomem *iomem;
> > 	int ret;
> > 	int irq;
> >
> > 	pef2256 = devm_kzalloc(&pdev->dev, sizeof(*pef2256), GFP_KERNEL);
> > 	if (!pef2256)
> > 		return -ENOMEM;
> >
> > 	pef2256->dev = &pdev->dev;
> >
> > 	iomem = devm_platform_ioremap_resource(pdev, 0);
> >
> > 	pef2256->regmap = devm_regmap_init_mmio(&pdev->dev, iomem,
> > 						&pef2256_regmap_config);
> >
> > 	pef2256->mclk = devm_clk_get_enabled(&pdev->dev, "mclk");
> > 	pef2256->sclkr = devm_clk_get_enabled(&pdev->dev, "sclkr");
> > 	pef2256->sclkx = devm_clk_get_enabled(&pdev->dev, "sclkx");
> >
> > 	pef2256->reset_gpio = devm_gpiod_get_optional(&pdev->dev, "reset", GPIOD_OUT_LOW);
> > 	if (pef2256->reset_gpio) {
> > 		gpiod_set_value_cansleep(pef2256->reset_gpio, 1);
> > 		udelay(10);
> > 		gpiod_set_value_cansleep(pef2256->reset_gpio, 0);
> > 		udelay(10);
> > 	}
> >
> > 	pef2556_of_parse(pef2256, np);
> >
> > 	irq = platform_get_irq(pdev, 0);
> > 	ret = devm_request_irq(pef2256->dev, irq, pef2256_irq_handler, 0, "pef2256", pef2256);
> >
> > 	platform_set_drvdata(pdev, pef2256);
> >
> > 	mfd_add_devices(pef2256->dev, PLATFORM_DEVID_NONE, pef2256_devs,
> > 	      		ARRAY_SIZE(pef2256_devs), NULL, 0, NULL);
>
> Wait, now you use MFD framework, so the driver is suitable for MFD.
> Before there was nothing like that in your code.

Agree, the above is suitable for MFD, since it does all the things I
said your last one did not.  You *can* also use of_platform_populate()
here, since you are *also* requesting and initialising shared resources.
You cannot do *both* however.

--
Lee Jones [李琼斯]
