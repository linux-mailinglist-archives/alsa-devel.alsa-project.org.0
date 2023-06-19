Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF25F734EB2
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jun 2023 10:54:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC790843;
	Mon, 19 Jun 2023 10:53:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC790843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687164850;
	bh=Hb36MT9aOkz1T0PELEGYohdaPTxEUT7yrKuvVBOTDGE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Wn1iox0qxAxWxXwBt3aAFO2mxDUGDudJo2l5hdJo6ydfIOeM+UbdVKzRfTqsYMc93
	 ESMgP2Wo/IrKMTyVXXHyuxEPex7uLazWScv2fpn5numIGCCn4k+hCLZaXmgn+Qlupt
	 zxXyKk2OaUJMR9n3zVHatQze1VI2chyDe3J3Uxh8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAF98F800E5; Mon, 19 Jun 2023 10:52:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C848F80132;
	Mon, 19 Jun 2023 10:52:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F94DF80217; Mon, 19 Jun 2023 10:52:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 733EDF800BA
	for <alsa-devel@alsa-project.org>; Mon, 19 Jun 2023 10:52:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 733EDF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=EFsqCWA9
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35J7BilH019508;
	Mon, 19 Jun 2023 03:52:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=KN9bBN5Pb+ea0O+RR7lKadXIEdNIzwB4JEpMI+Jsp+0=;
 b=EFsqCWA9qKYnaxOm4+hukqHEiCwIR7bjxK4iKkUWRROOXZ2Qu6dLy2E+DKd36HWfLBT0
 xbXU6hhv6fyVlJM0COQfqbx2dNkcqIe5jbQK1+kmOXJBICfLdymQ7DmZksoCtJ7D5Jtk
 2YLMzYdOJ34rZp3s7nnFvtqj5MtDX53K/q5HLlHr8/35BFw9YuUaqdjHgSkBJcrbGQIg
 DbtudSRF4TC9I8MP4tvAgTwh78dOVbnROKYcA6vk6iAwfbilRPZo9VjGzMUaafWQ5s6M
 cSgNVv+7vDC11iW+JM3HN8X+RpSIalS533HYitJp69xtHNgwHI865l8qOAWdP73VylHr 7g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3r9a809knw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jun 2023 03:52:46 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Mon, 19 Jun
 2023 09:52:44 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Mon, 19 Jun 2023 09:52:44 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 800B611AA;
	Mon, 19 Jun 2023 08:52:44 +0000 (UTC)
Date: Mon, 19 Jun 2023 08:52:44 +0000
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
Message-ID: <20230619085244.GU68926@ediswmail.ad.cirrus.com>
References: <20230605125504.2570158-1-ckeepax@opensource.cirrus.com>
 <20230605125504.2570158-4-ckeepax@opensource.cirrus.com>
 <20230615171124.GL3635807@google.com>
 <20230616083404.GR68926@ediswmail.ad.cirrus.com>
 <20230619083005.GN3635807@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230619083005.GN3635807@google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: yH0bMObXJlRVCdEL-QCa-N4rlQtwNX-w
X-Proofpoint-GUID: yH0bMObXJlRVCdEL-QCa-N4rlQtwNX-w
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: K3ZROGNIJLWVFB77S44JZTPO7UGZYZQ7
X-Message-ID-Hash: K3ZROGNIJLWVFB77S44JZTPO7UGZYZQ7
X-MailFrom: prvs=153447c1f4=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K3ZROGNIJLWVFB77S44JZTPO7UGZYZQ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jun 19, 2023 at 09:30:05AM +0100, Lee Jones wrote:
> On Fri, 16 Jun 2023, Charles Keepax wrote:
> > On Thu, Jun 15, 2023 at 06:11:24PM +0100, Lee Jones wrote:
> > > On Mon, 05 Jun 2023, Charles Keepax wrote:
> > > > +static struct i2c_device_id cs42l43_i2c_id[] = {
> > > > +	{ "cs42l43", 0 },
> > > > +	{}
> > > > +};
> > > > +MODULE_DEVICE_TABLE(i2c, cs42l43_i2c_id);
> > > 
> > > Is this required anymore?
> > > 
> > 
> > I was not aware of it not being required, I think it will still
> > be used for the purposes of module naming. Perhaps someone more
> > knowledgable than me can comment?
> 
> Since this table isn't providing any information which cannot be derived
> from the other (OF, ACPI) tables, the I2C subsystem should be able to
> obtain it from those sources instead.
> 

Sorry I literally just sent a v4 then saw this email. I will test
removing this table and send a v5.

> > > > +#if IS_ENABLED(CONFIG_MFD_CS42L43_I2C)
> > > > +const struct regmap_config cs42l43_i2c_regmap = {
> > > > +	.reg_bits		= 32,
> > > > +	.reg_stride		= 4,
> > > > +	.val_bits		= 32,
> > > > +	.reg_format_endian	= REGMAP_ENDIAN_BIG,
> > > > +	.val_format_endian	= REGMAP_ENDIAN_BIG,
> > > > +
> > > > +	.max_register		= CS42L43_MCU_RAM_MAX,
> > > > +	.readable_reg		= cs42l43_readable_register,
> > > > +	.volatile_reg		= cs42l43_volatile_register,
> > > > +	.precious_reg		= cs42l43_precious_register,
> > > > +
> > > > +	.cache_type		= REGCACHE_RBTREE,
> > > > +	.reg_defaults		= cs42l43_reg_default,
> > > > +	.num_reg_defaults	= ARRAY_SIZE(cs42l43_reg_default),
> > > > +};
> > > > +EXPORT_SYMBOL_NS_GPL(cs42l43_i2c_regmap, MFD_CS42L43);
> > > > +#endif
> > > 
> > > We don't tend to like #ifery in C files.
> > > 
> > > Why is it required?
> > > 
> > > And why not just put them were they're consumed?
> > 
> > The trouble is the cs42l43_reg_default array and the array size.
> > There is no good way to statically initialise those two fields
> > from a single array in both the I2C and SDW modules.
> 
> Can you have a little think for another way to solve this please?
> 

I will have another go at it, if memory serves the vague options
were:

1) this approach
2) some sort of horrible #include to put the defaults array in
both modules, although I would really prefer to avoid this one.
3) dynamically allocate the regmap_configs so those two fields
can be filled in with non-static data.

If I fail to come up with an option 4 would you prefer 1 or 3?
Well or 2 but I really would prefer not to do 2.

> > > Perhaps some simple function headers would help?
> > You mean add some kernel doc for these functions, right? Assuming
> > that is what you mean, will do.
> 
> I'd suggest not using kernel-doc formatting, but that type of thing,
> yes.

Ok I will remove the kernel doc bits for v5.

Thanks,
Charles
