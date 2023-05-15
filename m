Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C21C67029E2
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 12:03:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B96741E2;
	Mon, 15 May 2023 12:02:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B96741E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684145008;
	bh=D2DSlPIOhMXdbL7wtztiPs4iGbvNFulA6Ppo86DOMeo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BOZYpkPaVhMoWQh+IVKyHe6PPj2TOShwUcR2kdvYVewqzklLygCL3kUdaodxa7bjQ
	 nhirgSnPz4DXXSd03JDqtjJS3pjcfleSXWMIz08F+ask3a4Fxh5lUuhQkEEEEdGcKg
	 LcNu1wokvbn+Ewf7QD3EvX9kvsLIwimZALGuL8Ec=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 397BAF8025A; Mon, 15 May 2023 12:02:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7D73F8016D;
	Mon, 15 May 2023 12:02:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C16B2F80272; Mon, 15 May 2023 12:02:34 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C17A1F8016D
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 12:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C17A1F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=N1Y9Rrrd
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34F5WRGW024445;
	Mon, 15 May 2023 05:02:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=Dbath1udrCW8z6DIMjvXKGKZ7Y0Y4bUg2k1Qq4nsa8I=;
 b=N1Y9RrrdtpkyWCO3O79I/Z0dre7bjVf29OofkQJhCM0EJx0kG5nJpveDUEJLEpNZs5ko
 nLkSe5Ojx+AZ09GgFc6hjPxracRbkpKHrpKqB7XQtFZmlp3Rj5owfrnE/FE2uXtEIJWc
 B8amnGLzY/zG8u3y0UIKLN7+7s8vUIzpZMLnSz9hOaM7gcCV8A4vyxtYaJgpNLAmC2QI
 ZVh8XFv5Sc4gf+RkkbA9NqqodZYjaX+oVXaOAGYi4U3N29FU8FB3N97LSv5h4j0hWWsh
 eLTWD+7+xG5csTtLpKKZahLGAL/q3/ZmvR/1BhRbZHuqI6damknQB4oQfEmZKUwW/hWo 8w==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3qj7y12q01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 May 2023 05:02:28 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Mon, 15 May
 2023 05:02:25 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 15 May 2023 05:02:25 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C2B8845;
	Mon, 15 May 2023 10:02:25 +0000 (UTC)
Date: Mon, 15 May 2023 10:02:25 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: <broonie@kernel.org>, <lee@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <tglx@linutronix.de>, <maz@kernel.org>, <linus.walleij@linaro.org>,
        <vkoul@kernel.org>, <lgirdwood@gmail.com>,
        <yung-chuan.liao@linux.intel.com>, <sanyog.r.kale@intel.com>,
        <pierre-louis.bossart@linux.intel.com>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <devicetree@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 05/10] dt-bindings: mfd: cirrus,cs42l43: Add initial DT
 binding
Message-ID: <20230515100225.GR68926@ediswmail.ad.cirrus.com>
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-6-ckeepax@opensource.cirrus.com>
 <5969fe82-69cd-34d6-edd1-d16ea741d9cb@linaro.org>
 <20230512161803.GM68926@ediswmail.ad.cirrus.com>
 <db2dcafb-db14-96ab-87cc-88408f3bab4b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <db2dcafb-db14-96ab-87cc-88408f3bab4b@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: GnlTQhIlwLNY3S7LBUO1FLvr8l9zp2hX
X-Proofpoint-ORIG-GUID: GnlTQhIlwLNY3S7LBUO1FLvr8l9zp2hX
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: DTAQEU3ISNJOAPZDN4XVXQMLFOV3Q44W
X-Message-ID-Hash: DTAQEU3ISNJOAPZDN4XVXQMLFOV3Q44W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DTAQEU3ISNJOAPZDN4XVXQMLFOV3Q44W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, May 13, 2023 at 08:08:05PM +0200, Krzysztof Kozlowski wrote:
> On 12/05/2023 18:18, Charles Keepax wrote:
> > On Fri, May 12, 2023 at 05:25:52PM +0200, Krzysztof Kozlowski wrote:
> >> On 12/05/2023 14:28, Charles Keepax wrote:
> >>> The CS42L43 is an audio CODEC with integrated MIPI SoundWire interface
> >>> (Version 1.2.1 compliant), I2C, SPI, and I2S/TDM interfaces designed
> >>> for portable applications. It provides a high dynamic range, stereo
> >>> DAC for headphone output, two integrated Class D amplifiers for
> >>
> >> ...
> >>
> >>> +
> >>> +  interrupt-controller: true
> >>> +
> >>> +  '#interrupt-cells':
> >>> +    const: 2
> >>
> >> Hm, are you sure? Who is the consumer/user of this interrupt controller?
> >>
> > 
> > Anyone who wants the device has GPIOs that can signal IRQs. Some
> > of the other IRQs could be more generally useful, such as some of
> > the jack detection ones.
> 
> 
> OK, makes sense, but it is a bit odd then to have:
> codec {
>   which is GPIO and interrupt controller, but not pin controller
>   pinctrl {
>     pin controller, which is not GPIO and not interrupt controller
>   }
> }
> Maybe all the GPIO/pin/related interrupt properties should be moved to
> pinctrl node?
> 

I will have a look at that although I have a vague memory that
this made the pinctrl very sad doing this. Presumably a bug
somewhere but might take me a while to figure that out. The
interrupt controller is a bit of a grey area as well since it
has a bunch of IRQs that don't relate to the pins as well as
some that do. So logically it might be better suited on the root
node.

Thanks,
Charles
