Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4240E6D82C8
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 18:01:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 108A61E4;
	Wed,  5 Apr 2023 18:00:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 108A61E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680710491;
	bh=50ZVbsNNzz4ZKfK2XZCGRnvDvjWs9U3qUIwkuVEseio=;
	h=Date:To:Subject:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=KuA3JvplJuSfSzV6Q5KsaQUouaauLR9Cp26x/rh09VoQ+spnf7/s3ZDTsrJck0nxX
	 9FzkEvWX77Wj58o8S6mHKM92N7RLnw5L9bgnDjARiTSY90yXJAhYqiPQw4LidWa44I
	 yQqiqUeR2VQVwWgEYfL5WiWNzq1EE7umICzKNAUY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09397F80249;
	Wed,  5 Apr 2023 18:00:40 +0200 (CEST)
Date: Wed, 5 Apr 2023 18:00:23 +0200
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v5 2/5] mfd: Add support for the Lantiq PEF2256 framer
In-Reply-To: <20230405135450.GF8371@google.com>
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
	<20230405135450.GF8371@google.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UI43IVMEEPDGR367A2C4LVFXK54XQQLO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168071043875.26.3277893203290150249@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FF3AF8024C; Wed,  5 Apr 2023 18:00:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02B6BF80075
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 18:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02B6BF80075
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KC1g4w2x
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id AD9251C000D;
	Wed,  5 Apr 2023 16:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680710428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SRkI5V3gjzupeihxCsM7ao2TVc0QtUHYc/QaMrO1zy4=;
	b=KC1g4w2xVYyQFY6KHYxMQpoZIPGDPaO2rI8LJPbtSdOBU9PjOlgoznRVhGnuRqRe6zdinB
	qTPDgIDlnt9ImAma6cl3BWf+tfa9bxI8XSv7yTIo/zjyy0XTODc7ardoqJ2v5USyLAiiOS
	YcMJqaxrWHD9RwJGUc6I8/b/Vn9C7KfoiT7Mcff0Sm/gADMniMrGdEfEm3kUwkAogRzPiG
	hc/3w2SQb+HxsSvVcBVnF0KuRspZXZOS0wtW18RY2aGSX/uwWN/BTQetkmq7NAlA5GGvx1
	2/5hqW6BtWqlOVAmePg5V4/97yQLJtMRSb+XCIBDczwMAVoEwGqFE4NzoiEeOg==
Date: Wed, 5 Apr 2023 18:00:23 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v5 2/5] mfd: Add support for the Lantiq PEF2256 framer
Message-ID: <20230405180023.4aebaa08@bootlin.com>
In-Reply-To: <20230405135450.GF8371@google.com>
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
	<20230405135450.GF8371@google.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UI43IVMEEPDGR367A2C4LVFXK54XQQLO
X-Message-ID-Hash: UI43IVMEEPDGR367A2C4LVFXK54XQQLO
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UI43IVMEEPDGR367A2C4LVFXK54XQQLO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Lee,
On Wed, 5 Apr 2023 14:54:50 +0100
Lee Jones <lee@kernel.org> wrote:

> On Tue, 04 Apr 2023, Krzysztof Kozlowski wrote:
> 
> > On 04/04/2023 10:07, Herve Codina wrote:
> >  
> > >>> So, the structure I have in mind:
> > >>> - pef2256.c (MFD)
> > >>>   implement and do the setup at probe()
> > >>>   Add the children at probe():
> > >>>     - pef2256-pinctrl (pinctrl) added using mfd_add_devices()
> > >>>     - pef2256-codec (ASoC codec) added using devm_of_platform_populate()
> > >>>
> > >>> Lee, with this in mind, can the core pef2256.c be a MFD driver ?  
> > >>
> > >> You do not use MFD here, so why do you want to keep it in MFD? If you
> > >> disagree, please tell me where is the MFD code in your patch?  
> > >
> > > I don't want to absolutely use MFD.
> > > I just want to put my driver somewhere and I don't know the right location
> > > between MFD and Misc.
> > >
> > > Basically, the driver needs to do (little simplified and error path removed):
> > >
> > >   static const struct mfd_cell pef2256_devs[] = {
> > >   	{ .name = "lantiq-pef2256-pinctrl", },
> > >   };
> > >
> > >   static int pef2256_probe(struct platform_device *pdev)
> > >   {
> > > 	struct pef2256 *pef2256;
> > > 	void __iomem *iomem;
> > > 	int ret;
> > > 	int irq;
> > >
> > > 	pef2256 = devm_kzalloc(&pdev->dev, sizeof(*pef2256), GFP_KERNEL);
> > > 	if (!pef2256)
> > > 		return -ENOMEM;
> > >
> > > 	pef2256->dev = &pdev->dev;
> > >
> > > 	iomem = devm_platform_ioremap_resource(pdev, 0);
> > >
> > > 	pef2256->regmap = devm_regmap_init_mmio(&pdev->dev, iomem,
> > > 						&pef2256_regmap_config);
> > >
> > > 	pef2256->mclk = devm_clk_get_enabled(&pdev->dev, "mclk");
> > > 	pef2256->sclkr = devm_clk_get_enabled(&pdev->dev, "sclkr");
> > > 	pef2256->sclkx = devm_clk_get_enabled(&pdev->dev, "sclkx");
> > >
> > > 	pef2256->reset_gpio = devm_gpiod_get_optional(&pdev->dev, "reset", GPIOD_OUT_LOW);
> > > 	if (pef2256->reset_gpio) {
> > > 		gpiod_set_value_cansleep(pef2256->reset_gpio, 1);
> > > 		udelay(10);
> > > 		gpiod_set_value_cansleep(pef2256->reset_gpio, 0);
> > > 		udelay(10);
> > > 	}
> > >
> > > 	pef2556_of_parse(pef2256, np);
> > >
> > > 	irq = platform_get_irq(pdev, 0);
> > > 	ret = devm_request_irq(pef2256->dev, irq, pef2256_irq_handler, 0, "pef2256", pef2256);
> > >
> > > 	platform_set_drvdata(pdev, pef2256);
> > >
> > > 	mfd_add_devices(pef2256->dev, PLATFORM_DEVID_NONE, pef2256_devs,
> > > 	      		ARRAY_SIZE(pef2256_devs), NULL, 0, NULL);  
> >
> > Wait, now you use MFD framework, so the driver is suitable for MFD.
> > Before there was nothing like that in your code.  
> 
> Agree, the above is suitable for MFD, since it does all the things I
> said your last one did not.  You *can* also use of_platform_populate()
> here, since you are *also* requesting and initialising shared resources.
> You cannot do *both* however.
> 

Thanks for having confirmed that this driver can be a MFD driver.

Related to of_platform_populate() / mfd_add_devices(), I wanted to use both
because:
- the pinctrl part does not have (and does not need to have) a specific node
  with a specific compatible property. In order to instantiate the related
  driver mfd_add_devices() is the only way I know.
- the audio component nodes have a compatible string and several components
  (ie several nodes) can be present. of_platform_populate() call seems the
  simple way to instantiate them.

Is there a way to use mfd_add_devices() in this case without the need to
count the audio component nodes in order to allocate as much mfd_cell as
nodes having a matching compatible property ? Is there an other API to do
it ?

Best regards,
Hervé

