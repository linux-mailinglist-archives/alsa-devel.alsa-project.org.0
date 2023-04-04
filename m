Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E466D5A51
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 10:09:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71ADA1F9;
	Tue,  4 Apr 2023 10:08:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71ADA1F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680595746;
	bh=vXX+FWuplf2eKJCso+97t3ELnE5r8kjC+hMy9516PKY=;
	h=Date:To:Subject:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=ghVyP6a55IVRZClD63f63QEZffty832tn77evheIWXXG2NnxCYbjffgyOkDgT96up
	 a7y58Y0Qw8SuPibE2uwZs4QS/hlm9p2O0JkRi5yI0W5gUwm4lgoxCwjjvapwwj4FQi
	 WMsAEUyJItObyzoDjPL2j7DBiy+QYf+W/74n3jv4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C77C3F801C0;
	Tue,  4 Apr 2023 10:08:15 +0200 (CEST)
Date: Tue, 4 Apr 2023 10:07:59 +0200
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 2/5] mfd: Add support for the Lantiq PEF2256 framer
In-Reply-To: <f7ab2fcc-93fc-ce87-8767-579d33907225@linaro.org>
References: <20230328092645.634375-1-herve.codina@bootlin.com>
	<20230328092645.634375-3-herve.codina@bootlin.com>
	<20230330160510.GB489249@google.com>
	<20230331094208.41ab4420@bootlin.com>
	<6d39e9c3-fb6a-4b2a-9889-8fe8d86716d5@linaro.org>
	<20230331141104.42445da9@bootlin.com>
	<a642e653-e3e2-c3d2-68cb-1efc92be05bb@linaro.org>
	<20230331165904.4e7f46a1@bootlin.com>
	<20230403142822.GA8371@google.com>
	<20230404092036.2d1cd5d9@bootlin.com>
	<f7ab2fcc-93fc-ce87-8767-579d33907225@linaro.org>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MHFVMYAUH3W7S37LBCR454XLDGISAB36/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168059569547.26.17086696459623859778@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD7B6F8024C; Tue,  4 Apr 2023 10:08:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 952D4F80171
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 10:08:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 952D4F80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XnwLRWHs
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3952C60002;
	Tue,  4 Apr 2023 08:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680595682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LGPSyPRGkCSLqISaG9m4y+A3ISEmWEMVR123mIB2ghs=;
	b=XnwLRWHssCeGbpQlTwu4SMUx8FWX7XQrhyGJ/WpLSvGuKTL2V04QWcsEtKJkDaSZ5wdglw
	EgrcaSA40axA8+BXoaqHn1N4kbdwSJe6V7jDXV8n+c46uhMBGULXudDWlXh/4MmdWfvLCF
	EAn5Q8loDHe3/L30Ys4FQyWNID3w3NuqGKcvQimlmwNB3STR7ekwchZnYfr8a7bPvSajmK
	1BAh7ycvJbqnKtarUOBOJOXE1PZM99JLsH6L8kztDtbHcrgp3aCxMwGlu71IChlnvjvoBQ
	DWvCsEC/WKqBJgZF188wzPg0h6p5xgJcAxSbIOtze41j5/pPni4mRhUT+enINA==
Date: Tue, 4 Apr 2023 10:07:59 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 2/5] mfd: Add support for the Lantiq PEF2256 framer
Message-ID: <20230404100759.5bc9cd20@bootlin.com>
In-Reply-To: <f7ab2fcc-93fc-ce87-8767-579d33907225@linaro.org>
References: <20230328092645.634375-1-herve.codina@bootlin.com>
	<20230328092645.634375-3-herve.codina@bootlin.com>
	<20230330160510.GB489249@google.com>
	<20230331094208.41ab4420@bootlin.com>
	<6d39e9c3-fb6a-4b2a-9889-8fe8d86716d5@linaro.org>
	<20230331141104.42445da9@bootlin.com>
	<a642e653-e3e2-c3d2-68cb-1efc92be05bb@linaro.org>
	<20230331165904.4e7f46a1@bootlin.com>
	<20230403142822.GA8371@google.com>
	<20230404092036.2d1cd5d9@bootlin.com>
	<f7ab2fcc-93fc-ce87-8767-579d33907225@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MHFVMYAUH3W7S37LBCR454XLDGISAB36
X-Message-ID-Hash: MHFVMYAUH3W7S37LBCR454XLDGISAB36
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MHFVMYAUH3W7S37LBCR454XLDGISAB36/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 4 Apr 2023 09:23:36 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 04/04/2023 09:20, Herve Codina wrote:
> >> I suggest that none of this (besides the child registration, which is
> >> achieved by a simple OF API call in this case) has anything to do with
> >> MFD.  We are not requesting and initialising shared resources and we are
> >> not using the MFD API to register children.  The pin control
> >> functionality clearly needs moving to Pinctrl and the rest, if you
> >> cannot find a suitable home for it *may be* suitable for Misc.
> >>  
> > 
> > I am confused and I am not really sure to understand where to put my driver.
> > 
> > The core pef2256.c needs to:
> > 1) setup the pef2256
> > 2) add the children
> > 
> > To add the children it calls  devm_of_platform_populate() to add the audio
> > parts as several audio children can be available with the same compatible
> > string.
> > 
> > I plan to move the pinctrl part to the pinctrl subsystem. With this done,
> > the core pef2256.c will probably add the children using:
> > - a mfd_cell for the pinctrl part
> > - devm_of_platform_populate() for the audio children
> > 
> > The setup (E1 lines and TDM configuration) still needs to be done by the
> > core pef2256.c. Moving this part only to Misc will break the hierarchy.
> > The audio children depends on the core pef2256.c as this one do the setup.
> > Having in the audio children and the part that do the setup in same hierarchy
> > level is not correct. Audio children should be children of the part that do
> > the setup.
> > 
> > So, the structure I have in mind:
> > - pef2256.c (MFD)
> >   implement and do the setup at probe()
> >   Add the children at probe():
> >     - pef2256-pinctrl (pinctrl) added using mfd_add_devices()
> >     - pef2256-codec (ASoC codec) added using devm_of_platform_populate()
> > 
> > Lee, with this in mind, can the core pef2256.c be a MFD driver ?  
> 
> You do not use MFD here, so why do you want to keep it in MFD? If you
> disagree, please tell me where is the MFD code in your patch?

I don't want to absolutely use MFD.
I just want to put my driver somewhere and I don't know the right location
between MFD and Misc.

Basically, the driver needs to do (little simplified and error path removed):

  static const struct mfd_cell pef2256_devs[] = {
  	{ .name = "lantiq-pef2256-pinctrl", },
  };

  static int pef2256_probe(struct platform_device *pdev)
  {
	struct pef2256 *pef2256;
	void __iomem *iomem;
	int ret;
	int irq;

	pef2256 = devm_kzalloc(&pdev->dev, sizeof(*pef2256), GFP_KERNEL);
	if (!pef2256)
		return -ENOMEM;

	pef2256->dev = &pdev->dev;

	iomem = devm_platform_ioremap_resource(pdev, 0);

	pef2256->regmap = devm_regmap_init_mmio(&pdev->dev, iomem,
						&pef2256_regmap_config);

	pef2256->mclk = devm_clk_get_enabled(&pdev->dev, "mclk");
	pef2256->sclkr = devm_clk_get_enabled(&pdev->dev, "sclkr");
	pef2256->sclkx = devm_clk_get_enabled(&pdev->dev, "sclkx");

	pef2256->reset_gpio = devm_gpiod_get_optional(&pdev->dev, "reset", GPIOD_OUT_LOW);
	if (pef2256->reset_gpio) {
		gpiod_set_value_cansleep(pef2256->reset_gpio, 1);
		udelay(10);
		gpiod_set_value_cansleep(pef2256->reset_gpio, 0);
		udelay(10);
	}

	pef2556_of_parse(pef2256, np);

	irq = platform_get_irq(pdev, 0);
	ret = devm_request_irq(pef2256->dev, irq, pef2256_irq_handler, 0, "pef2256", pef2256);

	platform_set_drvdata(pdev, pef2256);

	mfd_add_devices(pef2256->dev, PLATFORM_DEVID_NONE, pef2256_devs,
	      		ARRAY_SIZE(pef2256_devs), NULL, 0, NULL);

	pef2256_setup(pef2256);

	devm_of_platform_populate(pef2256->dev);
	
	return 0;
  }

> 
> Best regards,
> Krzysztof
> 



-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
