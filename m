Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6898A83BF12
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jan 2024 11:39:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 347F9828;
	Thu, 25 Jan 2024 11:39:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 347F9828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706179181;
	bh=1SIXC4wWYaFLAPwdkKFjp65vXY1gVmwuEvMvTcck4G0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X+mpwCldE0dIdZSuV+2Pk7/pAGkkQWCS+ZakFv/jUdXlwJOpXAOGDRH+7ImKjxbBL
	 F0yVWy2woFwb+l/EGrY2tgVY/zqkF0/ahseLTOdhyW9y0zDpkkRu8AsxMI4uLkWtkc
	 wT7weCARN3WlFxsYSBy9OLbyMqjIvDILMzU8TTI8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55D7BF8057A; Thu, 25 Jan 2024 11:39:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4615CF802E8;
	Thu, 25 Jan 2024 11:39:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B325CF8028D; Thu, 25 Jan 2024 11:39:03 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C1730F80149
	for <alsa-devel@alsa-project.org>; Thu, 25 Jan 2024 11:38:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1730F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=b3+gBlDX
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40P5AAgS030847;
	Thu, 25 Jan 2024 04:38:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=H+pywFxcGO3YzfU
	rAAIpNM2vOQO6zCM1bhi8m27y6OI=; b=b3+gBlDXeNI33HTb3T7utPWf75UcvTs
	ZcP/BhOpa3V4+/1KG2aJyhJmonJrkg58ulrc3GIVe4IVnfvBgY+Lox1KAI5JisQZ
	3b8JM2obfJM4NwlhRimVpm5BIoKJwxQ8WkYJbiWHrReD3jNTTwvK53q4/to2Qrsq
	ixXzNZmnJ0tBc4agwBubW1bNhaNmJACR47haBNshaI4PnGrKytTXJGGT7aHEnwcq
	y7UamTq69F0kQ+sPr/N7LOuKbnexmfPuOe9AwibpexoZATYkP67Q7C/b1PTV1G+k
	mm+nux6AVYhCUDatO6NJuqJP/k/tOfKBSSFfQEKidf2uiaZ2ktIvQ8g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhj3tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 04:38:57 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 25 Jan
 2024 10:38:55 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Thu, 25 Jan 2024 10:38:55 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 21112820246;
	Thu, 25 Jan 2024 10:38:55 +0000 (UTC)
Date: Thu, 25 Jan 2024 10:38:54 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Rob Herring <robh@kernel.org>
CC: Richard Fitzgerald <rf@opensource.cirrus.com>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Avi
 Fishman" <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        "Tali
 Perry" <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, "Nancy
 Yuen" <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Jonathan
 =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Unify "input-debounce" schema
Message-ID: <ZbI6PrrQsVDIjt69@ediswmail9.ad.cirrus.com>
References: <20240124190106.1540585-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240124190106.1540585-1-robh@kernel.org>
X-Proofpoint-ORIG-GUID: 8iYiuE_6G63A78QKjJlEqxQHoZze71Jp
X-Proofpoint-GUID: 8iYiuE_6G63A78QKjJlEqxQHoZze71Jp
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: LUQMENTYBC3G453DLK45SUB6F3FEGPRU
X-Message-ID-Hash: LUQMENTYBC3G453DLK45SUB6F3FEGPRU
X-MailFrom: prvs=8754d201d6=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LUQMENTYBC3G453DLK45SUB6F3FEGPRU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jan 24, 2024 at 01:01:04PM -0600, Rob Herring wrote:
> nuvoton,npcm845-pinctrl defines the common "input-debounce" property as
> an array rather than an scalar. Update the common definition to expand
> it to an uint32-array, and update all the users of the property with
> array constraints.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml   | 3 ++-

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
