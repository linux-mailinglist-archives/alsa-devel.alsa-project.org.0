Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D443C757B67
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 14:07:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4C7D846;
	Tue, 18 Jul 2023 14:06:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4C7D846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689682048;
	bh=lvdwykiQgs9pSoXQtwOY5v2GzaAVhK0yDEcIDDKcLdk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mH2Z9dlQDg89rG9y0Zu+IEF2cp+ta5uCB0RbGE6H4oVZtrDWMephfD4JLsBErZs9V
	 2+QpWBUu5AiDdDXg7LtDpl+iGXDwPb8nRAnubAAaAiRcPnBSZ4O0mV30P+GEKZnrUK
	 CDp542I9KQP7N5OBZQd78YBdhhLnGuxM5cRcUAZ0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A646BF800D2; Tue, 18 Jul 2023 14:06:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EB64F8027B;
	Tue, 18 Jul 2023 14:06:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDDF5F8032D; Tue, 18 Jul 2023 14:06:12 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 728F0F80153
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 14:06:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 728F0F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=n7SI5jip
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36I7kHqv024058;
	Tue, 18 Jul 2023 07:06:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=h/j6RN76Y6wzf07
	sHUCKEfs/1PbBu/pEI42hq5R1L/0=; b=n7SI5jip1UpXaL5b7ujgEoREJDVMLYy
	jtFSHykALWOhrjhvxj2nnc7NSL99VOxbzro3nLVNR3BwiKVv38MFg0U9GnAIFO0J
	hCGezhZiYQUE1nO1vkbHvc2xuQxgwRoieD4yMeatWhRu6ZI85s/PnZLZzJwYxBrD
	Ijj68FtLpo4QzKmtzOybcTg/05s1Ex5msmEWOL+p9X789/9M47SOLhQ6kTCITTl2
	1SGgf+G1x+Qnb+drI2lFsDvUGJ4cCEBmHKxTCl1pkbtqYc5CwkVAbrI50+KFEmtP
	bYSKrGig+x7xvYt0jy5tHgmrUBKvfde3Fza4f/ePVVF5L7GvUtspSSg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3rus62u75n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 07:06:02 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 18 Jul
 2023 13:06:00 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Tue, 18 Jul 2023 13:06:00 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 420FB15B6;
	Tue, 18 Jul 2023 12:06:00 +0000 (UTC)
Date: Tue, 18 Jul 2023 12:06:00 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>,
        James Schulman
	<james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>,
        Martin =?utf-8?Q?Povi=C5=A1er?=
	<povik+lin@cutebit.org>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
        <asahi@lists.linux.dev>
Subject: Re: [PATCH 02/48] ASoC: cs35l41: Update to use maple tree register
 cache
Message-ID: <20230718120600.GE103419@ediswmail.ad.cirrus.com>
References: <20230713-asoc-cirrus-maple-v1-0-a62651831735@kernel.org>
 <20230713-asoc-cirrus-maple-v1-2-a62651831735@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230713-asoc-cirrus-maple-v1-2-a62651831735@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: McruDD6PXvtZKstOk9pGNgXVKfivOFka
X-Proofpoint-ORIG-GUID: McruDD6PXvtZKstOk9pGNgXVKfivOFka
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 3T6WMFOIFTQWZJS2SKNNV6E6VPQLX3SL
X-Message-ID-Hash: 3T6WMFOIFTQWZJS2SKNNV6E6VPQLX3SL
X-MailFrom: prvs=2563600699=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3T6WMFOIFTQWZJS2SKNNV6E6VPQLX3SL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 13, 2023 at 01:13:15AM +0100, Mark Brown wrote:
> The maple tree register cache is based on a much more modern data structure
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache. In
> v6.5 it has also acquired the ability to generate multi-register writes in
> sync operations, bringing performance up to parity with the rbtree cache
> there.
> 
> Update the cs35l41 driver to use the more modern data structure.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
