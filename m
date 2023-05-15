Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF86E702A3C
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 12:15:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C89341E7;
	Mon, 15 May 2023 12:14:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C89341E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684145722;
	bh=0jBolRjqAoI6DkB+Ema+OKe79ElZ0w/oIzVCXGZlSyI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uIn3ST8u9bCnSaQJCa44P694O6B29CWp0/bY9aWqyRNkl3juYVX4D8/1vLH9/cayC
	 6MoQMLcEc8OZZovoKL63Ln+ItUflTHNI+a61NN5lyrDaDCCSWBpoCPRud4dAC0aXV3
	 hWvClOsEBdD5Nt3ZTUAE2ZxnP+FR5SG8AJhmmRZA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66E36F80542; Mon, 15 May 2023 12:14:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F89EF8025A;
	Mon, 15 May 2023 12:14:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5ECF8F80272; Mon, 15 May 2023 12:14:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ECF93F8024E
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 12:13:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECF93F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=c8rTVO95
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34F66FJJ032340;
	Mon, 15 May 2023 05:13:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=7IKt5jGNUizT52ydViSRpHn5zdWJuSq0iR7Btrzg31A=;
 b=c8rTVO95XcOOvDRnL27augF0T7qUn3Uh+nUSj3tq+WNGyQVXpUmG5KPq5mJGKLxmTinK
 ltENPY8mbK5CYk8syIIo3RfJw++eY7B9vWSzZT2VygwTE1E+WDWyoleAyxa2aq9baxyc
 GCzH7R15Wr6R9l3yMfywtz6ddg7DpOPAXE5zCnfS/KRiDnkmf0jFmMf1If9RZa5XKW0T
 zx2JCiuSK1SaAuHfm8kXT6NXyyI/eI4b1pjoig4dmHp+I8Cw4DiXrnYMVl6+ja4ZD8lz
 3ouHAm8crpYn0KpMiB+WDZ4q9XCiO3Rx1nkxd6Wi8uLS6bPc8YS14BsFWZrFnclRpRsz IA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3qj7y12qcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 May 2023 05:13:53 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Mon, 15 May
 2023 05:13:51 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Mon, 15 May 2023 05:13:51 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F00E845;
	Mon, 15 May 2023 10:13:50 +0000 (UTC)
Date: Mon, 15 May 2023 10:13:50 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <andy.shevchenko@gmail.com>
CC: <broonie@kernel.org>, <lee@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <tglx@linutronix.de>, <maz@kernel.org>, <linus.walleij@linaro.org>,
        <vkoul@kernel.org>, <lgirdwood@gmail.com>,
        <yung-chuan.liao@linux.intel.com>, <sanyog.r.kale@intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 08/10] pinctrl: cs42l43: Add support for the cs42l43
Message-ID: <20230515101350.GS68926@ediswmail.ad.cirrus.com>
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-9-ckeepax@opensource.cirrus.com>
 <ZF6RMqElYZVMpWRt@surfacebook>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZF6RMqElYZVMpWRt@surfacebook>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: qnoTQzyEZoya4jBSWCSaegAU65Cz04Qu
X-Proofpoint-ORIG-GUID: qnoTQzyEZoya4jBSWCSaegAU65Cz04Qu
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: NONHMJ75QI7TYOSWPBUGLPZJIENXMFRO
X-Message-ID-Hash: NONHMJ75QI7TYOSWPBUGLPZJIENXMFRO
X-MailFrom: prvs=04990c9ac7=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NONHMJ75QI7TYOSWPBUGLPZJIENXMFRO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 12, 2023 at 10:19:14PM +0300, andy.shevchenko@gmail.com wrote:
> Fri, May 12, 2023 at 01:28:36PM +0100, Charles Keepax kirjoitti:
> > The CS42L43 is an audio CODEC with integrated MIPI SoundWire interface
> > (Version 1.2.1 compliant), I2C, SPI, and I2S/TDM interfaces designed
> > for portable applications. It provides a high dynamic range, stereo
> > DAC for headphone output, two integrated Class D amplifiers for
> > loudspeakers, and two ADCs for wired headset microphone input or
> > stereo line input. PDM inputs are provided for digital microphones.
> > 
> > Add a basic pinctrl driver which supports driver strength for the
> > various pins, gpios, and pinmux for the 2 multi-function pins.
> 

Thanks for the review, will fix up most of the comments.

> > +#define CS42L43_PIN(_number, _name, _reg, _field) { \
> > +	.number = _number, .name = _name, \
> > +	.drv_data = &((struct cs42l43_pin_data){ \
> > +		.reg = CS42L43_##_reg, \
> > +		.shift = CS42L43_##_field##_DRV_SHIFT, \
> > +		.mask = CS42L43_##_field##_DRV_MASK, \
> > +	}), \
> 
> Do you need this to be GCC extention for the value evaluation?
> I mean the compound literal, IIRC, can be used directly as
> 
> 	.foo = &(struct foo){ ... },
> 
> Am I mistaken?

I will double check this, I had a feeling it needed the GCC
extension.

> > +	dev_dbg(priv->dev, "Setting gpio%d to %s\n",
> > +		offset + 1, input ? "input" : "output");
> 
> How ' + 1' part won't be confusing?

Kinda an un-avoidable confusion somewhere, the GPIOs in the datasheet are
numbered from one. So this makes the debug print match the
datasheet name for the pin, which is used in the pinctrl strings
as well.

> > +	if (!of_property_read_bool(dev_of_node(cs42l43->dev), "gpio-ranges")) {
> > +		ret = gpiochip_add_pin_range(&priv->gpio_chip, priv->gpio_chip.label,
> > +					     0, 0, CS42L43_NUM_GPIOS);
> > +		if (ret) {
> > +			dev_err(priv->dev, "Failed to add GPIO pin range: %d\n", ret);
> > +			goto err_pm;
> > +		}
> > +	}
> 
> Besides the fact that we have a callback for this, why GPIO library can't
> handle this for you already?
> 

Apologies but I am not quite sure I follow you, in the device
tree case this will be handled by the GPIO library. But for ACPI
this information does not exist so has to be called manually, the
library does not necessarily know which values to call with,
although admittedly our case is trivial but not all are.

> ...
> 
> > +static int cs42l43_pin_remove(struct platform_device *pdev)
> > +{
> > +	pm_runtime_disable(&pdev->dev);
> 
> This is simply wrong order because it's a mix of non-devm_*() followed by
> devm_*() calls in the probe.
> 

I had missed there are now devm_pm_runtime calls, I will switch
to that. But I would like to understand the wrong order, remove
will be called before the devm bits are destroyed and it seems
reasonable to disable the pm_runtime before destroying the
pinctrl device. What exactly would run in the wrong order here?

Thanks,
Charles
