Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6ED78A840
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 10:53:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2D8E208;
	Mon, 28 Aug 2023 10:52:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2D8E208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693212812;
	bh=4N5HuhKQA0BqAP2QYNIIUmWTBDu4AugB7siMRbIf6oE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uPLOLuRz3zY8/ReTJV2HlfXwvSOOJY0tejB421nTyDYmgNJPZoK/SFIkME6QcDKFB
	 PaAe4FWDxXsK166Ih1CcjsUyeIVYpMdqcaEmDA5TbIEGW9PE3pAYX4q86hTNyBCLTJ
	 H4VngTppdBjR0/oFL6l3GHFFtWVHMGbMPGyELhuQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39762F800F5; Mon, 28 Aug 2023 10:52:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B06CCF80155;
	Mon, 28 Aug 2023 10:52:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1A99F80158; Mon, 28 Aug 2023 10:52:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B657F800F5
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 10:52:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B657F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=HdW8Y9Pw
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37S7jgMd001749;
	Mon, 28 Aug 2023 03:52:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=sMmQSFG4FHPfHxB
	67WASV4zRHGELWn4ffaCMn5d2OUY=; b=HdW8Y9PwWT/tQRDXp8yIM84YO/gm5ZX
	HoDpEy6+S8nXn5icxa9ex6k7CtXE3ilzhCp2PR+6eXD4qSJnS90yA8Dk2WOA0Sr8
	y6df7W8zKbyzswrxco80UvCX4+mcSafndPnyh4XMmETb3hAH8W+WwW5pJlqPAbOT
	aWS5goSan+Wu4iUV8D03+2ci1HAWRA9rIiY62TrisUMPkrSQgW/VeTc64dZ6pvyZ
	Gqs+VBnCt9ggBhA3ZVl0vjz4sZ2+rXX0XHFP8mjDoTUkKbWCKAN7cnv0bDW+O7qr
	qxxAQKY3OJhu23R3O8F2QREN5U9w3MEcNvzH4OKdYn+j5GANTuQeqAg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3sqdtj1jf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Aug 2023 03:52:26 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Mon, 28 Aug
 2023 09:52:24 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Mon, 28 Aug 2023 09:52:24 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B77CD46B;
	Mon, 28 Aug 2023 08:52:24 +0000 (UTC)
Date: Mon, 28 Aug 2023 08:52:24 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
CC: Lee Jones <lee@kernel.org>, Richard Fitzgerald <rf@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        "Geert
 Uytterhoeven" <geert+renesas@glider.be>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] mfd: madera-i2c: Simplify probe()
Message-ID: <20230828085224.GL103419@ediswmail.ad.cirrus.com>
References: <20230826091751.51634-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230826091751.51634-1-biju.das.jz@bp.renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: neHErvBHZQ431C4VJPNMZ1XQFQbxoP_j
X-Proofpoint-GUID: neHErvBHZQ431C4VJPNMZ1XQFQbxoP_j
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: JQH6DUBLV4W32SHRK2HPIEZEK7APJHXN
X-Message-ID-Hash: JQH6DUBLV4W32SHRK2HPIEZEK7APJHXN
X-MailFrom: prvs=3604f52ce6=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JQH6DUBLV4W32SHRK2HPIEZEK7APJHXN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Aug 26, 2023 at 10:17:51AM +0100, Biju Das wrote:
> Simplify probe() by replacing of_device_get_match_data() and ID lookup for
> retrieving match data by i2c_get_match_data().
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
