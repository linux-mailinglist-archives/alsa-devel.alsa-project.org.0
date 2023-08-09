Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 617B577567B
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 11:35:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF085827;
	Wed,  9 Aug 2023 11:34:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF085827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691573716;
	bh=7YvHzKHybW4o/kfE1RYxw2C5pk0yAWLtVnxNOp7qy+s=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NqCuY1MadB8fuewktkiUVxQ+Ankf7g4hK+hrAEK6hYsk1N9CA3SN/qt/QxHN/hCUP
	 +IX9gbGbfI7NZOj/1lZEH1x6u6QgoPmEXMA5i4dV5MPd1J9WOKfV2ToKO+n3w8irZJ
	 azx5lAVBBVZqWHTABTGsGWfndWy6y7+re+a2OHdk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EF06F80552; Wed,  9 Aug 2023 11:33:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99186F80116;
	Wed,  9 Aug 2023 11:33:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D306F80134; Wed,  9 Aug 2023 11:33:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F91CF800FB
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 11:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F91CF800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Y3J2WwjI
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37950aBo005431;
	Wed, 9 Aug 2023 04:33:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=EMFUX1B8Bwu4uca
	w5kUSdO1ek9Z8Xf6YBA+7AUzdgck=; b=Y3J2WwjIzjmwh5TEY5uqZy5wNqZBsK/
	+lIzmdr53yOIVhsAvRY0Zq8HKhMY7MzE+0hjkRK7LfkyHkZXFr1rUw8BXyhYDWIj
	5yaedz8+5T4HToYOT7FqHEYe+WBGEGcT7X6tS2Tci69pIPrxq0Fqa1doiYI6hilN
	rH9DY9pSy5OhXmDsQqSk9f6uQ5JZx85YZ3O/C05W/vyyQKyiSFr67OSKMvzhkafD
	S0ZdyyvnbYvqGVIekCAXLB0HQq1ttByiH04ZQ29XbMEX0sG8rF5xLsbe4YORqCqz
	M5Btoi6dYHdZFe0yS1kgGLtD3dSj96FrhE/9Q7OduTC4zexIDddYXRA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sb7vta7wv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Aug 2023 04:33:44 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 9 Aug
 2023 10:33:42 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Wed, 9 Aug 2023 10:33:42 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2558C475;
	Wed,  9 Aug 2023 09:33:42 +0000 (UTC)
Date: Wed, 9 Aug 2023 09:33:42 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: =?iso-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
	<u.kleine-koenig@pengutronix.de>,
        David Rhodes <david.rhodes@cirrus.com>,
        James Schulman <james.schulman@cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "Richard Fitzgerald" <rf@opensource.cirrus.com>,
        Takashi Iwai
	<tiwai@suse.com>, <alsa-devel@alsa-project.org>
Subject: Re: [PATCH v2 36/39] ASoC: codecs/cs47lxx: merge DAI call back
 functions into ops
Message-ID: <20230809093342.GW103419@ediswmail.ad.cirrus.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
 <87h6p99m55.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87h6p99m55.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: hTkune6g6AZ0Ox0_rae7U2wtLjuP05nn
X-Proofpoint-ORIG-GUID: hTkune6g6AZ0Ox0_rae7U2wtLjuP05nn
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: F4OGRVUWNANGBYJ64RZHRFUZA6CIXLUT
X-Message-ID-Hash: F4OGRVUWNANGBYJ64RZHRFUZA6CIXLUT
X-MailFrom: prvs=3585769064=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F4OGRVUWNANGBYJ64RZHRFUZA6CIXLUT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 08, 2023 at 10:58:47PM +0000, Kuninori Morimoto wrote:
> ALSA SoC merges DAI call backs into .ops.
> This patch merge these into one.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
