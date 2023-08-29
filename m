Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 661BD78C995
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 18:23:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B1C9208;
	Tue, 29 Aug 2023 18:22:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B1C9208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693326228;
	bh=GzRI2++qsOHZAQe6MZgVZBK+YANIaJSEJjc30HnSk2Y=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rRVxAqBr3fAT356jgOoqchQvg9AXhmJV3k/G4mdUDRArwjC/pZmPyTIndfncsGXUP
	 z9hSyYMlqpu7g4DhVrJTfqNyDF2YFM0EGJ6oQx/nQ0YvOTqRVa5LgQEzMp2lxSz7ZJ
	 l/ctS+tfG118PURAav/uyY7stbpdRdNQY11GYzek=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6A7BF8023B; Tue, 29 Aug 2023 18:22:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A19C9F80155;
	Tue, 29 Aug 2023 18:22:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01285F80158; Tue, 29 Aug 2023 18:22:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D34ADF80094
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 18:22:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D34ADF80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=I+L5I4qB
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37TB7M6Z016651;
	Tue, 29 Aug 2023 11:22:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=ptBbO/ikbUCOzPa
	qVepOxQ9ReSRotYR0A66tqyou2FU=; b=I+L5I4qBF50L9rYiRIaQlhWB4sV3RnQ
	OGVpQwlf2Xo0digGObeI2dtMsDZQlKuuYeFjmholLLT/vDN1GOwElY7Bzp12+RuU
	luWeMHYFh2i0VAca2nNK6nrJBwRnu+U/lUTjOGQuNY75kUBNMlUFfOxfaMpTu8cW
	gdGSyaxRmHjPaj86fsoMAo94ERa9drjuBnqQfnTGnN/FCxCaYdLMG4Lz3gSaX5P0
	sjxgZ09gT61sk1+pMBbkRgIaul55VXjyqt+prHO6UZKxD67CCLeYiE+bC1pOJelC
	d6QWuSffHuwrW2Q2MwrCL9AUBJ+S8y+uKrzGsd5zUs71CWljNEq22SA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3sqdtj360r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 11:22:45 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 29 Aug
 2023 17:22:43 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Tue, 29 Aug 2023 17:22:43 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 93CA615B6;
	Tue, 29 Aug 2023 16:22:43 +0000 (UTC)
Date: Tue, 29 Aug 2023 16:22:43 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: <broonie@kernel.org>, <lee@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <linus.walleij@linaro.org>, <vkoul@kernel.org>, <lgirdwood@gmail.com>,
        <yung-chuan.liao@linux.intel.com>, <sanyog.r.kale@intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 3/6] mfd: cs42l43: Add support for cs42l43 core driver
Message-ID: <20230829162243.GV103419@ediswmail.ad.cirrus.com>
References: <20230804104602.395892-1-ckeepax@opensource.cirrus.com>
 <20230804104602.395892-4-ckeepax@opensource.cirrus.com>
 <b122a788-acee-4747-be6d-a7456ee110dc@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b122a788-acee-4747-be6d-a7456ee110dc@roeck-us.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: mADtkyurD_gKlPgW1ZYY9RFipjVdnnX5
X-Proofpoint-GUID: mADtkyurD_gKlPgW1ZYY9RFipjVdnnX5
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 4NDH33RGTA7LY2WB2WV4EPLONKKXVDZK
X-Message-ID-Hash: 4NDH33RGTA7LY2WB2WV4EPLONKKXVDZK
X-MailFrom: prvs=4605abc1a5=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4NDH33RGTA7LY2WB2WV4EPLONKKXVDZK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 29, 2023 at 07:06:28AM -0700, Guenter Roeck wrote:
> On Fri, Aug 04, 2023 at 11:45:59AM +0100, Charles Keepax wrote:
> > The CS42L43 is an audio CODEC with integrated MIPI SoundWire interface
> > (Version 1.2.1 compliant), I2C, SPI, and I2S/TDM interfaces designed
> > for portable applications. It provides a high dynamic range, stereo
> > DAC for headphone output, two integrated Class D amplifiers for
> > loudspeakers, and two ADCs for wired headset microphone input or
> > stereo line input. PDM inputs are provided for digital microphones.
> > 
> > The MFD component registers and initialises the device and provides
> > PM/system power management.
> > 
> Unfortunately, on systems without pm support:
> 
> Building s390:allmodconfig ... failed
> --------------
> Error log:
> drivers/mfd/cs42l43.c:1138:12: error: 'cs42l43_runtime_resume' defined but not used [-Werror=unused-function]
>  1138 | static int cs42l43_runtime_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~
> drivers/mfd/cs42l43.c:1124:12: error: 'cs42l43_runtime_suspend' defined but not used [-Werror=unused-function]
>  1124 | static int cs42l43_runtime_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/mfd/cs42l43.c:1106:12: error: 'cs42l43_resume' defined but not used [-Werror=unused-function]
>  1106 | static int cs42l43_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~
> drivers/mfd/cs42l43.c:1076:12: error: 'cs42l43_suspend' defined but not used [-Werror=unused-function]
>  1076 | static int cs42l43_suspend(struct device *dev)
> 

Apologies for this one, a fix is already awaiting review here:

https://lore.kernel.org/lkml/20230822114914.340359-1-ckeepax@opensource.cirrus.com/

Thanks,
Charles
