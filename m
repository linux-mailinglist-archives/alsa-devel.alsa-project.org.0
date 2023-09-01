Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9FA78F9CF
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Sep 2023 10:19:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D131B74C;
	Fri,  1 Sep 2023 10:18:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D131B74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693556366;
	bh=JaHkcF0Xva1xbE/f986xzpUY+YHpJPkB9B2xklOXENo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nAKDjqnEfGwgNm81ph70LM0/XV1yOcH2YSQOCKJYrZDixG9g0TYxTdbUOADQ1VT/q
	 dbYDJVGIcuAPVmdqaFdfmVmsmZy+oW2DoEHxU7K80Lvdh+aF72aUeAwZVAOmK+VhIg
	 NTetObzXRzNucFcV9swmp0hiHuA7WPX0maE4HHiM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 525A3F80249; Fri,  1 Sep 2023 10:18:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 011FEF80094;
	Fri,  1 Sep 2023 10:18:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F38CF80158; Fri,  1 Sep 2023 10:18:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0AED6F800D1
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 10:18:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AED6F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ViDDrb19
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3814hqaM004037;
	Fri, 1 Sep 2023 03:18:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=Deb9QFKKId6Rz4c
	lcLbuZhmsyu2KxboCl8QQwCBKsDo=; b=ViDDrb19xhiKqFJ+7G9FeUq6HXJJk92
	yDsbnHKrtlpuq8BgvokdAZajhbHybOqU2gFNin9TcT4WAVHfUPPji7khKuqwLc7g
	nC9hFPUngxgIoyrGTYv5pGif6jVyXWhUlNQKSX4l8n5MtPHU+gzvsyB/4IPwZjg6
	qbRXeXuUkl3lWIm/lIBCUWS+2Hds+nM6qkH4YV7XY2vTn6+oKdXYC5oNbYENUjnk
	OhdQlZhy2TDsqZnzk9jtHYz013jURZXR8QgYjlGkrZdE/wsn0WxoywhS4Iy8vwOz
	SCHGp1c6Ek/lpz3NbTdjt2JzUFN8L7RKI8vFCfz3GFKHUTgl4XjYiPw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sqesyg31f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Sep 2023 03:18:11 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Fri, 1 Sep
 2023 09:18:09 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Fri, 1 Sep 2023 09:18:09 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5E2ED3563;
	Fri,  1 Sep 2023 08:18:09 +0000 (UTC)
Date: Fri, 1 Sep 2023 08:18:09 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "Liam
 Girdwood" <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Uwe
 =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
        "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH v4 2/3] ASoC: wm8580: Remove trailing comma in the
 terminator entry
Message-ID: <20230901081809.GX103419@ediswmail.ad.cirrus.com>
References: <20230901065952.18760-1-biju.das.jz@bp.renesas.com>
 <20230901065952.18760-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230901065952.18760-3-biju.das.jz@bp.renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: g4ABxDejzYwWUzsKktDkGDJSfcz0eHt8
X-Proofpoint-GUID: g4ABxDejzYwWUzsKktDkGDJSfcz0eHt8
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 7PSQKE7ZNDMTSQDFNMEKRG56UTS2XHIP
X-Message-ID-Hash: 7PSQKE7ZNDMTSQDFNMEKRG56UTS2XHIP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7PSQKE7ZNDMTSQDFNMEKRG56UTS2XHIP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Sep 01, 2023 at 07:59:51AM +0100, Biju Das wrote:
> Remove trailing comma in the terminator entry for OF table.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
