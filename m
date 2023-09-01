Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7917F78F9D7
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Sep 2023 10:20:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F5BAA4A;
	Fri,  1 Sep 2023 10:19:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F5BAA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693556402;
	bh=+yWRIq9yYjjZllb5Bix8l0hgyJjguX2dq0o8BBE6A0E=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QJcMWwCxN6wJoW9qPnhHNXIsLpo7tD4WZmsaf5kFGTynI9QdMQqpS+3bazd0eBPNJ
	 sBSWHn94e5CcFvfz9UBn/RhNe1lUZ2yBQyTCQ8pC9jBYNQuqExZbKWuP9f3gf7yt3X
	 7A8a6qONK3S4v41XgUoi13NgxqZVGlelYKf7DCl4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BBADBF800D1; Fri,  1 Sep 2023 10:18:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78F75F804DA;
	Fri,  1 Sep 2023 10:18:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F034F804F3; Fri,  1 Sep 2023 10:18:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A1E5F800D1
	for <alsa-devel@alsa-project.org>; Fri,  1 Sep 2023 10:18:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A1E5F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=XhyUziRr
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3817SpqE012068;
	Fri, 1 Sep 2023 03:18:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=HmbQF+n1buq5au+
	CxCfNxxyc+bpk4OqqY2opc+lz1jg=; b=XhyUziRrVvp871EY4H+x9n8Ogl7o0Hw
	n/iea21iEyQontcNJaPscRg6bVR7G3XI8vK6bEN7DhIUiainzaMk+7OEOPo35xVR
	P8ftfxEZ0T/M03wP4tfycHhBvspWctj9p3WHmLmjzljXKfwN6MhmxN49pQYmpOUL
	Q69F9KuCAjwHY2U3r7CBXvb9ZHP28n3elHk79TwJzs3egkDRYkxdmmElTo3AHlzP
	8g0EYYMOqiUpyy6tuR/ULZFHZnZx7wDQo8G9GL2HcxJvvtjSN8zJvbzz0a0vnY9j
	QOLbWuNWFVn+lHEkxypr2r82EKHstDw5gijYeg+XhPUZaU906Jswf0A==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3sqdtj6r9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Sep 2023 03:18:32 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Fri, 1 Sep
 2023 09:18:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Fri, 1 Sep 2023 09:18:31 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EED473563;
	Fri,  1 Sep 2023 08:18:30 +0000 (UTC)
Date: Fri, 1 Sep 2023 08:18:30 +0000
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
Subject: Re: [PATCH v4 3/3] ASoC: wm8580: Move OF table
Message-ID: <20230901081830.GY103419@ediswmail.ad.cirrus.com>
References: <20230901065952.18760-1-biju.das.jz@bp.renesas.com>
 <20230901065952.18760-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230901065952.18760-4-biju.das.jz@bp.renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: G9HaHnAHO6lgBOxV9ToKfuQHxAYLBjDj
X-Proofpoint-GUID: G9HaHnAHO6lgBOxV9ToKfuQHxAYLBjDj
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: GMKYMX25EKNSCB67AQHXTZSLWCIVTTFU
X-Message-ID-Hash: GMKYMX25EKNSCB67AQHXTZSLWCIVTTFU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GMKYMX25EKNSCB67AQHXTZSLWCIVTTFU/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Sep 01, 2023 at 07:59:52AM +0100, Biju Das wrote:
> Move OF table near to the user.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
