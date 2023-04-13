Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A76466E0701
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Apr 2023 08:32:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAF6B825;
	Thu, 13 Apr 2023 08:31:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAF6B825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681367538;
	bh=+Mm5ipSzyjaBIWUtRoMDqj1E0Q5RmrTXHM6/Qgfl5/A=;
	h=Date:To:Subject:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=vA1jtGRFHKeJ9z7h+OhxQ7tsOLJTDucEmIBwLPVAp1bJahuyFVQZlG9QEPbzjjoO1
	 bU2k//64HQLB60fzGOoBPO71j9aKJsQ65XY9JoItUjXjgD39VXKnI8iXtwVXHcbyIZ
	 zoiY0j/bE8WPqx52caagxu7fRPpRtn9ZcnTl0jmU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A5F6F8025E;
	Thu, 13 Apr 2023 08:31:28 +0200 (CEST)
Date: Thu, 13 Apr 2023 08:31:09 +0200
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v5 2/5] mfd: Add support for the Lantiq PEF2256 framer
In-Reply-To: <20230412095918.GZ8371@google.com>
References: <a642e653-e3e2-c3d2-68cb-1efc92be05bb@linaro.org>
	<20230331165904.4e7f46a1@bootlin.com>
	<20230403142822.GA8371@google.com>
	<20230404092036.2d1cd5d9@bootlin.com>
	<f7ab2fcc-93fc-ce87-8767-579d33907225@linaro.org>
	<20230404100759.5bc9cd20@bootlin.com>
	<143754c2-9e37-4386-af92-174c0df2eb0a@linaro.org>
	<20230405135450.GF8371@google.com>
	<20230405180023.4aebaa08@bootlin.com>
	<20230411181640.50c19d4e@bootlin.com>
	<20230412095918.GZ8371@google.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PKUYRD3WWPQCWM7TDDSQE6SQ6IDJUW52/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168136748741.26.5283015815346835598@mailman-core.alsa-project.org>
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
	id 824B8F8032B; Thu, 13 Apr 2023 08:31:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0D54F800E5
	for <alsa-devel@alsa-project.org>; Thu, 13 Apr 2023 08:31:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0D54F800E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NQMQq46V
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B34B4FF80B;
	Thu, 13 Apr 2023 06:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681367471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wFZjlYbqAXEdbzIOL/Z8LZvjFBauGqMFBal3K99vt78=;
	b=NQMQq46Vn4bBbnwNQgUO5Euut2Wezby0IgtPuKGUC7b8AyOrmEpZtnxtZTjJ+XQznjvjj0
	wVpiTMKGeUGMPsElUI9TZbd6ZDXmF46hqfK/eYuS0RvIB3RkNFXCHkR7dshNZXmFqTrNqC
	/nrRuNgCUqX+bkBnX44RKoJItPIl2rg+TA+/uEx5UoWHmMxL+n8nJdEHE/ol0DrRP/Xyo1
	aCZmaXekhzWpyXLSF7EVOZ7h2pfLzwckZqQ37J1LyFyFk1wxiq5MjUfFkFuzQNxaMQWg56
	G/BiXhzPaJIfEtwqfqurv8Eo3Clao0B+4LQKmsxuprnTAo18hqF2Kat3OLWbMQ==
Date: Thu, 13 Apr 2023 08:31:09 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v5 2/5] mfd: Add support for the Lantiq PEF2256 framer
Message-ID: <20230413083109.5ad09d2a@bootlin.com>
In-Reply-To: <20230412095918.GZ8371@google.com>
References: <a642e653-e3e2-c3d2-68cb-1efc92be05bb@linaro.org>
	<20230331165904.4e7f46a1@bootlin.com>
	<20230403142822.GA8371@google.com>
	<20230404092036.2d1cd5d9@bootlin.com>
	<f7ab2fcc-93fc-ce87-8767-579d33907225@linaro.org>
	<20230404100759.5bc9cd20@bootlin.com>
	<143754c2-9e37-4386-af92-174c0df2eb0a@linaro.org>
	<20230405135450.GF8371@google.com>
	<20230405180023.4aebaa08@bootlin.com>
	<20230411181640.50c19d4e@bootlin.com>
	<20230412095918.GZ8371@google.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PKUYRD3WWPQCWM7TDDSQE6SQ6IDJUW52
X-Message-ID-Hash: PKUYRD3WWPQCWM7TDDSQE6SQ6IDJUW52
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PKUYRD3WWPQCWM7TDDSQE6SQ6IDJUW52/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Apr 2023 10:59:18 +0100
Lee Jones <lee@kernel.org> wrote:

> On Tue, 11 Apr 2023, Herve Codina wrote:
> 
> > Hi Lee,
> >
> > On Wed, 5 Apr 2023 18:00:23 +0200
> > Herve Codina <herve.codina@bootlin.com> wrote:
> >  
> > > Hi Lee,
> > > On Wed, 5 Apr 2023 14:54:50 +0100
> > > Lee Jones <lee@kernel.org> wrote:
> > >  
> > > > On Tue, 04 Apr 2023, Krzysztof Kozlowski wrote:
> > > >  
> > > > > On 04/04/2023 10:07, Herve Codina wrote:
> > > > >  
> > > > > >>> So, the structure I have in mind:
> > > > > >>> - pef2256.c (MFD)
> > > > > >>>   implement and do the setup at probe()
> > > > > >>>   Add the children at probe():
> > > > > >>>     - pef2256-pinctrl (pinctrl) added using mfd_add_devices()
> > > > > >>>     - pef2256-codec (ASoC codec) added using devm_of_platform_populate()
> > > > > >>>
> > > > > >>> Lee, with this in mind, can the core pef2256.c be a MFD driver ?  
> > > > > >>
> > > > > >> You do not use MFD here, so why do you want to keep it in MFD? If you
> > > > > >> disagree, please tell me where is the MFD code in your patch?  
> > > > > >
> > > > > > I don't want to absolutely use MFD.
> > > > > > I just want to put my driver somewhere and I don't know the right location
> > > > > > between MFD and Misc.
> > > > > >
> > > > > > Basically, the driver needs to do (little simplified and error path removed):
> > > > > >
> > > > > >   static const struct mfd_cell pef2256_devs[] = {
> > > > > >   	{ .name = "lantiq-pef2256-pinctrl", },
> > > > > >   };
> > > > > >
> > > > > >   static int pef2256_probe(struct platform_device *pdev)
> > > > > >   {
> > > > > > 	struct pef2256 *pef2256;
> > > > > > 	void __iomem *iomem;
> > > > > > 	int ret;
> > > > > > 	int irq;
> > > > > >
> > > > > > 	pef2256 = devm_kzalloc(&pdev->dev, sizeof(*pef2256), GFP_KERNEL);
> > > > > > 	if (!pef2256)
> > > > > > 		return -ENOMEM;
> > > > > >
> > > > > > 	pef2256->dev = &pdev->dev;
> > > > > >
> > > > > > 	iomem = devm_platform_ioremap_resource(pdev, 0);
> > > > > >
> > > > > > 	pef2256->regmap = devm_regmap_init_mmio(&pdev->dev, iomem,
> > > > > > 						&pef2256_regmap_config);
> > > > > >
> > > > > > 	pef2256->mclk = devm_clk_get_enabled(&pdev->dev, "mclk");
> > > > > > 	pef2256->sclkr = devm_clk_get_enabled(&pdev->dev, "sclkr");
> > > > > > 	pef2256->sclkx = devm_clk_get_enabled(&pdev->dev, "sclkx");
> > > > > >
> > > > > > 	pef2256->reset_gpio = devm_gpiod_get_optional(&pdev->dev, "reset", GPIOD_OUT_LOW);
> > > > > > 	if (pef2256->reset_gpio) {
> > > > > > 		gpiod_set_value_cansleep(pef2256->reset_gpio, 1);
> > > > > > 		udelay(10);
> > > > > > 		gpiod_set_value_cansleep(pef2256->reset_gpio, 0);
> > > > > > 		udelay(10);
> > > > > > 	}
> > > > > >
> > > > > > 	pef2556_of_parse(pef2256, np);
> > > > > >
> > > > > > 	irq = platform_get_irq(pdev, 0);
> > > > > > 	ret = devm_request_irq(pef2256->dev, irq, pef2256_irq_handler, 0, "pef2256", pef2256);
> > > > > >
> > > > > > 	platform_set_drvdata(pdev, pef2256);
> > > > > >
> > > > > > 	mfd_add_devices(pef2256->dev, PLATFORM_DEVID_NONE, pef2256_devs,
> > > > > > 	      		ARRAY_SIZE(pef2256_devs), NULL, 0, NULL);  
> > > > >
> > > > > Wait, now you use MFD framework, so the driver is suitable for MFD.
> > > > > Before there was nothing like that in your code.  
> > > >
> > > > Agree, the above is suitable for MFD, since it does all the things I
> > > > said your last one did not.  You *can* also use of_platform_populate()
> > > > here, since you are *also* requesting and initialising shared resources.
> > > > You cannot do *both* however.
> > > >  
> > >
> > > Thanks for having confirmed that this driver can be a MFD driver.
> > >
> > > Related to of_platform_populate() / mfd_add_devices(), I wanted to use both
> > > because:
> > > - the pinctrl part does not have (and does not need to have) a specific node
> > >   with a specific compatible property. In order to instantiate the related
> > >   driver mfd_add_devices() is the only way I know.
> > > - the audio component nodes have a compatible string and several components
> > >   (ie several nodes) can be present. of_platform_populate() call seems the
> > >   simple way to instantiate them.
> > >
> > > Is there a way to use mfd_add_devices() in this case without the need to
> > > count the audio component nodes in order to allocate as much mfd_cell as
> > > nodes having a matching compatible property ? Is there an other API to do
> > > it ?
> > >  
> >
> > I looked deeper for using mfd_add_devices() only and found an issue (related
> > to my use-case).
> >
> > mfd_add_devices() calls mfd_add_device() and in this function we have:
> > ---- 8< ----
> > 	if (IS_ENABLED(CONFIG_OF) && parent->of_node && cell->of_compatible) {
> > 		for_each_child_of_node(parent->of_node, np) {
> > 			if (of_device_is_compatible(np, cell->of_compatible)) {
> > 				/* Ignore 'disabled' devices error free */
> > 				if (!of_device_is_available(np)) {
> > 					of_node_put(np);
> > 					ret = 0;
> > 					goto fail_alias;
> > 				}
> >
> > 				ret = mfd_match_of_node_to_dev(pdev, np, cell);
> > 				if (ret == -EAGAIN)
> > 					continue;
> > 				of_node_put(np);
> > 				if (ret)
> > 					goto fail_alias;
> >
> > 				break;
> > 			}
> > 		}
> >
> > 		if (!pdev->dev.of_node)
> > 			pr_warn("%s: Failed to locate of_node [id: %d]\n",
> > 				cell->name, platform_id);
> > 	}
> > ---- 8< ----
> >
> > My issue is related to the loop.
> > The loop is aborted if the device is not available (typically 'Disabled' in the
> > DT node).
> >
> > My full pef2256 node can have several pef2256 audio subnodes with compatible
> > set to "lantiq,pef2256-codec" and some of them can have 'status = "Disabled";'
> > As soon as one device (with my expected compatible) is found 'Disabled', there
> > is no way to look at other children.
> >
> > Having 'continue' in case of device not available in the loop to look at the
> > next child will change the behavior of mfd_add_device().
> > Do you think that looking at next child if we find a 'not available' child
> > can be correct for mfd_add_device() ?
> > This probably will have impacts on other MFD drivers.  
> 
> Looks like a bug.  Encountering one disabled cell should not prevent the
> others from registering IMHO.
> 

Thanks for your confirmation.
I will propose a fix in the next iteration of this series.

Regards,
Hervé
