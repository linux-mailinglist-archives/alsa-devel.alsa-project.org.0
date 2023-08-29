Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1498378C205
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 12:09:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1B76A4D;
	Tue, 29 Aug 2023 12:08:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1B76A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693303783;
	bh=BP8RM0z//vMep5YyyPAslceh/viguKLA36N8AfDtE6Q=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QHUQkEmiiZEYIRm63dumUIa11za+emTMzhrWhqUm8vzPnZ2Ccx4rE+8m60Q2jDVhq
	 Fcq3ey/3Xqv5Jp8itJHmwRatkxjgaEwqbLr8Zt4tFk7eKtZtrmRpom6t8sr8WFdg6P
	 mrwd7qN32/uXTmnVDjxhyciBSfrdXhNs3LdH+rec=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 302BCF80551; Tue, 29 Aug 2023 12:08:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3054F8023B;
	Tue, 29 Aug 2023 12:08:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F03B8F80249; Tue, 29 Aug 2023 12:08:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11ED5F80155
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 12:08:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11ED5F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=TCKc9ECt
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37TA4RFe031776;
	Tue, 29 Aug 2023 05:08:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=fomil356zRLd7vA
	qQlZgu3ZhNZVKzpD7b7qJZsXLfF8=; b=TCKc9ECttQ21dte0fXm4oRfyYFPaS0C
	iR44CWy3qOMYiq7MrRBHYYI46Uq2jRCrmYu4eKN4OSFp9c/Kuw9NiZZ4rk9mwvmu
	AIwPSeiyr7pQUpnHj8C3+ORYRSHT5najdwkAkNgFSAR3KzbmGC+PYd8A8kmgCP2p
	ZQ/y4yNRAKBfA9Okbd2jM0d2c4eNKp9kjjQxLCwiLLUdyEeMh20RasHj4AJV6HQc
	M3QLa8fNJlPrZP0yso/oS6WCjYmSIvvqiXLEOebNYQZQ4gKOMpH6EOUZANe61s+/
	hlJoa2o6EHEM0Dp+FY+5YgZQoYNlewpVnLsAsXlJd9IicmdXGwO5Aig==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3sqdtj2sb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 05:08:40 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 29 Aug
 2023 11:08:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Tue, 29 Aug 2023 11:08:33 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 34FF811AA;
	Tue, 29 Aug 2023 10:08:33 +0000 (UTC)
Date: Tue, 29 Aug 2023 10:08:33 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring
	<robh+dt@kernel.org>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <RicardoRivera-Matosricardo.rivera-matos@cirrus.com>
Subject: Re: [PATCH 5/7] ASoC: cs35l45: Rename DACPCM1 Source control
Message-ID: <20230829100833.GS103419@ediswmail.ad.cirrus.com>
References: <20230828170525.335671-1-vkarpovi@opensource.cirrus.com>
 <20230828170525.335671-5-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230828170525.335671-5-vkarpovi@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: TF0pRW_bTQDizYLKquE_93iH4RuOVvs_
X-Proofpoint-GUID: TF0pRW_bTQDizYLKquE_93iH4RuOVvs_
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: OPSEI5WHCBUYTNGEML6XQU6NFCSKRV65
X-Message-ID-Hash: OPSEI5WHCBUYTNGEML6XQU6NFCSKRV65
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OPSEI5WHCBUYTNGEML6XQU6NFCSKRV65/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Aug 28, 2023 at 12:05:23PM -0500, Vlad Karpovich wrote:
> Rename control to "DACPCM Source" for backward compatibility
> with previous implementation.
> 
> Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
