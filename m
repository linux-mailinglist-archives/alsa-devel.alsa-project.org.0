Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DA77329F0
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 10:35:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B25D829;
	Fri, 16 Jun 2023 10:34:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B25D829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686904522;
	bh=8kglP9ChRNeVcmaNRu92HuQHvmGxrGzRFqL+h/t1ngQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uxkCIwNCWmgr45gLWfc7RBhT6YkXzJA1U40YBRWTmUojLPbGYw9lnrnq120AthiRf
	 h1tC+fAq+1hEbYjsmZdGyOdNtMHOohwAtKizfN2H2HV9k+cjA80Ds6jioOsKEdjSTM
	 vzf+OXCjfm7Jhq0GWsrON0gjrikuXjjm4lwpDaeg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0280F8025E; Fri, 16 Jun 2023 10:34:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5383F80132;
	Fri, 16 Jun 2023 10:34:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41E4DF80149; Fri, 16 Jun 2023 10:34:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED92AF80093
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 10:34:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED92AF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=KS9gAvul
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35G8AL9l005003;
	Fri, 16 Jun 2023 03:34:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=2dz9DgNzyWe3yiG4rHa+kXpGJErXQgVqdkaqIVGndHc=;
 b=KS9gAvulVnsMKFjUZvhRoqUNld3TfblP0Q4uTXJ4Ny4t477RJ94kUMNWOET9x76+6/rH
 Bb+mdwFQa2NH8IVxnJprNohBeJINvOKPB1QECIMEPZXEQReY0SMZdl2FCcnjTMLEWZEJ
 QJlMsVAzbH48+DMV01YQn9k7TkMa9MCDdY481Dbjt5MV6IMH0VAobqGFUmWIqMxvx3lM
 0u1UPt/8Gn7D3zqqJvNEgUfgDQz5vjetN2FVmWcK6SvbXtoFhN8Q4Cpa640bVN/n7nM2
 xKCeRfqhQM8NnoQABAXRSwzX4p1aX8x/+b/z29hFdN5RiMcqeZ7il91NXBJAdZ8DfEGQ cA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3r75nub1h7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:34:06 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 16 Jun
 2023 09:34:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 16 Jun 2023 09:34:05 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F2A09468;
	Fri, 16 Jun 2023 08:34:04 +0000 (UTC)
Date: Fri, 16 Jun 2023 08:34:04 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>
CC: <broonie@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linus.walleij@linaro.org>, <vkoul@kernel.org>, <robh+dt@kernel.org>,
        <conor+dt@kernel.org>, <lgirdwood@gmail.com>,
        <yung-chuan.liao@linux.intel.com>, <sanyog.r.kale@intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/6] mfd: cs42l43: Add support for cs42l43 core driver
Message-ID: <20230616083404.GR68926@ediswmail.ad.cirrus.com>
References: <20230605125504.2570158-1-ckeepax@opensource.cirrus.com>
 <20230605125504.2570158-4-ckeepax@opensource.cirrus.com>
 <20230615171124.GL3635807@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230615171124.GL3635807@google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: QHC_Qh8S3mj10330FjaGceC4g3StgGJg
X-Proofpoint-GUID: QHC_Qh8S3mj10330FjaGceC4g3StgGJg
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: IF7J7GMSYZ6OKZCZDARAMW3XXQQ5K3VI
X-Message-ID-Hash: IF7J7GMSYZ6OKZCZDARAMW3XXQQ5K3VI
X-MailFrom: prvs=1531175dad=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IF7J7GMSYZ6OKZCZDARAMW3XXQQ5K3VI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 15, 2023 at 06:11:24PM +0100, Lee Jones wrote:
> On Mon, 05 Jun 2023, Charles Keepax wrote:
> > +// SPDX-License-Identifier: GPL-2.0
> > +//
> > +// CS42L43 I2C driver
> > +//
> > +// Copyright (C) 2022-2023 Cirrus Logic, Inc. and
> > +//                         Cirrus Logic International Semiconductor Ltd.
> > +
> 
> I realise there is some precedent for this already in MFD.
> 
> However, I'd rather headers used C style multi-line comments.
> 

Apologies but just to be super clear you want this to look like:

// SPDX-License-Identifier: GPL-2.0
/*
 * CS42L43 I2C driver
 *
 * Copyright (C) 2022-2023 Cirrus Logic, Inc. and
 *                         Cirrus Logic International Semiconductor Ltd.
 */

Just clarifying since you want to get rid of all the // comments,
but the SPDX stuff specifically requires one according to
Documentation/process/license-rules.rst.

> > +	// I2C is always attached by definition
> 
> C please.  And everywhere else.
> 

Can do.

> > +static struct i2c_device_id cs42l43_i2c_id[] = {
> > +	{ "cs42l43", 0 },
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(i2c, cs42l43_i2c_id);
> 
> Is this required anymore?
> 

I was not aware of it not being required, I think it will still
be used for the purposes of module naming. Perhaps someone more
knowledgable than me can comment?

> > +#if IS_ENABLED(CONFIG_MFD_CS42L43_I2C)
> > +const struct regmap_config cs42l43_i2c_regmap = {
> > +	.reg_bits		= 32,
> > +	.reg_stride		= 4,
> > +	.val_bits		= 32,
> > +	.reg_format_endian	= REGMAP_ENDIAN_BIG,
> > +	.val_format_endian	= REGMAP_ENDIAN_BIG,
> > +
> > +	.max_register		= CS42L43_MCU_RAM_MAX,
> > +	.readable_reg		= cs42l43_readable_register,
> > +	.volatile_reg		= cs42l43_volatile_register,
> > +	.precious_reg		= cs42l43_precious_register,
> > +
> > +	.cache_type		= REGCACHE_RBTREE,
> > +	.reg_defaults		= cs42l43_reg_default,
> > +	.num_reg_defaults	= ARRAY_SIZE(cs42l43_reg_default),
> > +};
> > +EXPORT_SYMBOL_NS_GPL(cs42l43_i2c_regmap, MFD_CS42L43);
> > +#endif
> 
> We don't tend to like #ifery in C files.
> 
> Why is it required?
> 
> And why not just put them were they're consumed?

The trouble is the cs42l43_reg_default array and the array size.
There is no good way to statically initialise those two fields
from a single array in both the I2C and SDW modules.

> > +static int cs42l43_soft_reset(struct cs42l43 *cs42l43)
> > +{
> > +	static const struct reg_sequence reset[] = {
> > +		{ CS42L43_SFT_RESET, 0x5A000000 },
> > +	};
> > +	unsigned long time;
> > +
> > +	dev_dbg(cs42l43->dev, "Soft resetting\n");
> 
> How often are you realistically going to enable these?  Can you do
> without them and just add some printks when debugging?  Seems a shame to
> dirty the code-base with seldom used / questionably helpful LoC.

I mean I use them all the time they are very helpful. But yeah I
can just add them each time I need them its just a pain, but I
guess since you are the second person to comment I will accept
that wanting to easily turn on debug is not a feature we are keen
on.

> > +	reinit_completion(&cs42l43->device_detach);
> > +
> > +	/* apply cache only as the device will also fall off the soundwire bus */
> 
> Grammar please.  Some capital letters missing there.
> 

No problem.

> > +	regcache_cache_only(cs42l43->regmap, true);
> > +	regmap_multi_reg_write_bypassed(cs42l43->regmap, reset, ARRAY_SIZE(reset));
> > +
> > +	msleep(20);
> 
> Why 20?
> 

Because that is what the hardware needs, I assume this will be
covered when I turn all number in to defines.

> > +static int cs42l43_mcu_stage_2_3(struct cs42l43 *cs42l43, bool shadow)
> > +{
> > +	unsigned int need_reg = CS42L43_NEED_CONFIGS;
> > +	unsigned int val;
> > +	int ret;
> > +
> > +	if (shadow)
> 
> What's shadow?  Comment please.
> 

Yeah can add a comment for that.

> > +		need_reg = CS42L43_FW_SH_BOOT_CFG_NEED_CONFIGS;
> > +
> > +	regmap_write(cs42l43->regmap, need_reg, 0x0);
> > +
> > +	ret = regmap_read_poll_timeout(cs42l43->regmap, CS42L43_BOOT_STATUS,
> > +				       val, (val == 3), 5000, 20000);
> 
> Defines are easier to read than magic numbers.
> 

Can do.

> > +	if (ret) {
> > +		dev_err(cs42l43->dev, "Failed to move to stage 3: %d, 0x%x\n", ret, val);
> 
> Stage 3 what?
> 

Of the MCU boot.

> Perhaps some simple function headers would help?
> 

You mean add some kernel doc for these functions, right? Assuming
that is what you mean, will do.

Thanks,
Charles
