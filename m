Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8E4769A70
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 17:09:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C12E17F8;
	Mon, 31 Jul 2023 17:08:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C12E17F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690816180;
	bh=guO8DiPcdrG7oKaE2H7j2eQcgPtH8+AfNTDxXisGiAI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cabYXuy6gvnGOe0189f2+u8rJNARGdFae9k5kNHhIb/KvZStbbLCaRD8h+fCU1boG
	 pIvbW7xRmXM0EwzNaXLRtF3FOVRD1esNc97f14OmxBL412YLi0Wfzz5na6/9KVCpIq
	 wjyUwN5b4OIsFwjDXX1r7ddzyd5OqrSIMorz5vF4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EF5DF80535; Mon, 31 Jul 2023 17:08:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3223F80163;
	Mon, 31 Jul 2023 17:08:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3415BF8016D; Mon, 31 Jul 2023 17:08:45 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F1A23F80149
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 17:08:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1A23F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=D3xsfZG5
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36VExLDl000923;
	Mon, 31 Jul 2023 10:08:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=Ac1SzXAkYAowcCY
	4X6xWPtA/gmE/RcwJtVjsYvKiiSc=; b=D3xsfZG5WJSWBscvz/9yVeYL9OKA4K1
	8Rr3EZ6wjYBW0ZKBNUsiy0CmN5wsSTcVFQ2AIYkJ91n4visCi5AwdACbafocqexi
	JZ5vi8sCXQ3TjeopEnx0mIiuYpZaKfrM+jC7rwrB7aMds+XzVdEMvFhOkDGbWkFv
	niR5fX7BqB6QHBZ4odwIOI5O9uqnex5wA+L0PMC+XQXXGztJ60mxK/epHHLLScu5
	UMmDAXrmWI6Ovba+y9W7yxh4k0temm26KEjoADHwH2z5cLPiVZwEJo2hMgFcIq8+
	C25k2gfQ7gv07CJ/60Ib49yEMEIFTVzCPg3U1J8wckqFk8/DYQDqNZA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3s4y6jskrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Jul 2023 10:08:31 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 31 Jul
 2023 16:08:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Mon, 31 Jul 2023 16:08:30 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 0CC6445;
	Mon, 31 Jul 2023 15:08:30 +0000 (UTC)
Date: Mon, 31 Jul 2023 15:08:30 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] ASoC: wm8960: Read initial MCLK rate from clock API
Message-ID: <20230731150830.GN103419@ediswmail.ad.cirrus.com>
References: <20230731-asoc-wm8960-clk-v1-0-69f9ffa2b10a@kernel.org>
 <20230731-asoc-wm8960-clk-v1-1-69f9ffa2b10a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230731-asoc-wm8960-clk-v1-1-69f9ffa2b10a@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: OisnnALTvK6W1n0cbKjumNuL5kmGmgt-
X-Proofpoint-ORIG-GUID: OisnnALTvK6W1n0cbKjumNuL5kmGmgt-
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: DSZDJPZBGWQNSF2OEPQ3BF7YERH3VBJ2
X-Message-ID-Hash: DSZDJPZBGWQNSF2OEPQ3BF7YERH3VBJ2
X-MailFrom: prvs=3576316b2c=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DSZDJPZBGWQNSF2OEPQ3BF7YERH3VBJ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 31, 2023 at 11:47:02AM +0100, Mark Brown wrote:
> When we have a MCLK provided by the clock API read the rate at startup
> and store it so that there's something set before the machine driver has
> done clocking configuration (eg, if it only configures clocking based on
> sample rate).
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
