Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DAE700CBB
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 18:16:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49287DEF;
	Fri, 12 May 2023 18:15:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49287DEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683908209;
	bh=20EXwVMKZ/78YMtxb+s9Ua+sYWh5fGpqIDdZ4/6xCrY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AelnwZ9RzzX3E/QYDdWkbzqouWquZ/FrNIrI0E4h+1Tnag2X1aw8LjeQAQk2m/eWa
	 yOL4mCljtvZqrQ8PGFgbb/fq4WRxJSmSMZRW2PydZ2i+55fozqTbqR4PJMSabazhHi
	 WXbMjix9TRK2ITG+Zd/eoXXbJw02f8FATru4B+cw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C217F802E8; Fri, 12 May 2023 18:15:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AB0AF802E8;
	Fri, 12 May 2023 18:15:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38679F8032D; Fri, 12 May 2023 18:15:54 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3889FF8014C
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 18:15:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3889FF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=M60DIvjb
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34C6Nh0X025791;
	Fri, 12 May 2023 11:15:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=ectvF2yfB5aP03Mre+dyD2CVdNXHXzI/gwQc+s7VZHo=;
 b=M60DIvjb0O76RqJ4hF0r8dai/lOM1XbIryRUEux/gCZxD3/0/2Et/Q+S3Luuv8Sdm1i5
 iCcE7IHWR2gDMfQGVR0Ncu19x/YkLcC5wqn9Zsx1eDwaEOnnO1o8e4hs22I8JnosPa3Y
 RxLd0KkqI0c4H7WMtPN4IjgJRFDNsIBnM751ZTOJGMiRSaaeLp1tCOx66LwF4WWVZon1
 mcfqLvpl7V1x4e8DkJLOXYwRpzVDqbrm4X2VmATFRHITJ6aK78WIPFodRURDPcovLR5f
 MFbMXYiR/by8gkPHKGL0UA7crPz+kZoFLA24Z1I4ui9q41fTwYY/xbjnuCoz+RTUz83V EQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3qf7s46qef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 May 2023 11:15:47 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Fri, 12 May
 2023 11:15:45 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Fri, 12 May 2023 11:15:45 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 537A045;
	Fri, 12 May 2023 16:15:45 +0000 (UTC)
Date: Fri, 12 May 2023 16:15:45 +0000
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
Message-ID: <20230512161545.GL68926@ediswmail.ad.cirrus.com>
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-6-ckeepax@opensource.cirrus.com>
 <25c92476-7bca-90c4-9130-cb765495a783@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <25c92476-7bca-90c4-9130-cb765495a783@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: DeAJb7R437xO5rXNDxVczi3uqEnckv76
X-Proofpoint-GUID: DeAJb7R437xO5rXNDxVczi3uqEnckv76
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: LCWER2V63RGQB22KNLFZWG33W7UG6YPP
X-Message-ID-Hash: LCWER2V63RGQB22KNLFZWG33W7UG6YPP
X-MailFrom: prvs=0496644b8b=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LCWER2V63RGQB22KNLFZWG33W7UG6YPP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 12, 2023 at 05:23:22PM +0200, Krzysztof Kozlowski wrote:
> On 12/05/2023 14:28, Charles Keepax wrote:
> > +$id: http://devicetree.org/schemas/mfd/cirrus,cs42l43.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Cirrus Logic CS42L43 Audio CODEC
> 
> That's audio codec, so it should be in sound, not MFD.
> 

Is this true even despite the device being implemented as an MFD?
I am happy to move it, and will do so unless I hear otherwise.

> > +  - VDD_P-supply
> > +  - VDD_A-supply
> > +  - VDD_D-supply
> > +  - VDD_IO-supply
> > +  - VDD_CP-supply
> 
> lowercase, no underscores in all property names.

I guess we can rename all the regulators to lower case.

> > +additionalProperties: false
> 
> This order is quite unexpected... please do not invent your own layout.
> Use example-schema as your starting point. I suspect there will be many
> things to fix, so limited review follows (not complete).
> 
> 
> Missing ref to dai-common

Apologies for that I was a little hesitant about this but this
order did make the binding document much more readable, the
intentation got really hard to follow in the traditional order. I
guess since I have things working now I can put it back, again I
will do so unless I hear otherwise.

> > +  pinctrl:
> > +    type: object
> 
> additionalProperties: false
> 

Can do.

> > +
> > +    allOf:
> > +      - $ref: "../pinctrl/pinctrl.yaml#"
> 
> No quotes, absolute path, so /schemas/pinctrl/....
> 

Can do.

> > +
> > +    properties:
> > +      pin-settings:
> 
> What's this node about? pinctrl/pinctrl/pins? One level too much.
> 

codec/pinctrl/pins

The device is a codec, so the main node should be called codec,
then it has a subnode called pinctrl to satisfy the pinctrl DT
binding.

> > +examples:
> > +  - |
> > +    i2c@e0004000 {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +        reg = <0xe0004000 0x1000>;
> 
> Drop, just i2c
> 

Can do.

> > +
> > +        cs42l43: codec@1a {
> > +            compatible = "cirrus,cs42l43";
> > +            reg = <0x1a>;
> > +
> > +            VDD_P-supply = <&vdd5v0>;
> > +            VDD_D-supply = <&vdd1v8>;
> > +            VDD_A-supply = <&vdd1v8>;
> > +            VDD_IO-supply = <&vdd1v8>;
> > +            VDD_CP-supply = <&vdd1v8>;
> > +            VDD_AMP-supply = <&vdd5v0>;
> > +
> > +            reset-gpios = <&gpio 0>;
> 
> Use proper defines for flags.

Can do.

Thanks,
Charles
