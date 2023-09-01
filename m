Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6474E78FA3F
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Sep 2023 10:51:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFBA8DEC;
	Fri,  1 Sep 2023 10:50:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFBA8DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693558308;
	bh=dn3ftSFqOvoXs5JGlRGV64Z1ZtL4ynvjDsqMoO8S3Bg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H0A9RrtP8jt3f4Bhpmao6KUD/1XD2NTUmG574rebwIG96lPduRPQvgLvqRSj1pMWe
	 qfGzqZD2NHIZfuz0QD/gw8/hJgL3oNvi+BY3aECxssRqgOopdgmy/P0Tsoc/GtIQTA
	 e3DZizXofcMRG1/uS2PJq7j0mZ03Iu+EQXk+gOeE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFDE1F80249; Fri,  1 Sep 2023 10:50:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B7AEF80155;
	Fri,  1 Sep 2023 10:50:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6AD0CF80249; Fri,  1 Sep 2023 10:50:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80456F800D1
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 10:50:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80456F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=HG37WO8W
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3818QdxY020704;
	Fri, 1 Sep 2023 03:50:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=VlOhG1J+3FnwSLS
	6c0dsqtg3VtxqEQfZ58R7VT8qvtw=; b=HG37WO8W3OwAaD0ObDafbexga4CD9Mj
	FNbFXML/zpyuHCukySuehZTP8mP5J5ea2c394cn6ZSgi1vOGG61VcJc2vahNTmP8
	w3ubXF5DEJmdYr8Mp0fWz5pVhlT7uIZzbd7NhHuMViI4aM8oc1oLU54W0SjQbrq8
	q/zm4PJiAMXatFqb1XMzZUPvv3222tnzIcO9+EPADcnqd3T8Ls9fL4oReOkgfwRo
	n/i74KLoLzj2t9F8gTefu79JcYFKtXDSzec2t3koN3oPoDvOdtGLgO1cMRSXF7aC
	pj8FahsTFbzqitRH4I6hj7jjz/WFa82Cu5hsrV/TVhuxzT9IK3h//vA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3sqdtj6sd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Sep 2023 03:50:27 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Fri, 1 Sep
 2023 09:50:26 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Fri, 1 Sep 2023 09:50:25 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E2B1BB06;
	Fri,  1 Sep 2023 08:50:25 +0000 (UTC)
Date: Fri, 1 Sep 2023 08:50:25 +0000
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
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 3/4] ASoC: cs35l45: Connect DSP to the monitoring
 signals
Message-ID: <20230901085025.GB103419@ediswmail.ad.cirrus.com>
References: <20230831162042.471801-1-vkarpovi@opensource.cirrus.com>
 <20230831162042.471801-3-vkarpovi@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230831162042.471801-3-vkarpovi@opensource.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: ce8wxe9lCRy-RM0WArXDqhxgVXmM0DN-
X-Proofpoint-GUID: ce8wxe9lCRy-RM0WArXDqhxgVXmM0DN-
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: BQNB6FEI4TT5TQPAMP6A3SBEBMRJ3RZC
X-Message-ID-Hash: BQNB6FEI4TT5TQPAMP6A3SBEBMRJ3RZC
X-MailFrom: prvs=4608688732=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BQNB6FEI4TT5TQPAMP6A3SBEBMRJ3RZC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Aug 31, 2023 at 11:20:41AM -0500, Vlad Karpovich wrote:
> Link VMON, IMON, TEMPMON, VDD_BSTMON and VDD_BATTMON
> to DSP1. The CSPL firmware uses them for the speaker calibration
> and monitoring.
> 
> Signed-off-by: Vlad Karpovich <vkarpovi@opensource.cirrus.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
