Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 416B278A848
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 10:54:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29502A4C;
	Mon, 28 Aug 2023 10:53:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29502A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693212863;
	bh=eo73wBk6ygRGG5lbU2arZCJD/hKYp3R58JKwJSFNUe8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kb2U7UkXIZlUKUJlOzIUhENxtgcD4aWhW1XjsABENPjpQQqkD6N76pJ6pG1JVWp2V
	 2E4Gz/W7y4Jh9vL9HwT59aitPLu14GcGsZmnQ3UIbMNZquOsIOtgbBqFkpvg4yGCA8
	 Hiynj7c+X1KyQh6QG28evJOcONFZ3xui4oj0tjgs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 821C2F80249; Mon, 28 Aug 2023 10:53:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D441F80249;
	Mon, 28 Aug 2023 10:53:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC78DF804F3; Mon, 28 Aug 2023 10:53:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AC616F80155
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 10:53:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC616F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=XAE91HYi
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37S5VEqK025026;
	Mon, 28 Aug 2023 03:52:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=wwJZaMhSI4nn95d
	xVpAfdqXggNWd+CIZYQMn2HuH4ro=; b=XAE91HYit1MHXRGSjw1uC4gTJlfX54L
	nsom0E+l0H6RJtd+zyi25wKT6LVeGBHwmw1XuciEWtJsbDoXctgHUZ5DVEAjB414
	cCSIW56QsEtgzmBuWdePirQp3C96G/oERyoukOtOjZIgBn/THKqqc0uQ8RLW64ku
	636ryBmKsrKMaaDtD9Eg9tILfTpt4K7oTTUVLcwsAb6K0dxeP9GCSDsV8RcOm4/o
	0UeoTxkl2MMa8ewGxijTUZPVmugfPiY56UfmF7ZVcGSX1v5duqS0CRozelSYCGHO
	afb1d6G+7PcL50fSK94OdHVKPbW0ecky2b3Ek0411VwiUbhVtMWTHKw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sqesy9wrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Aug 2023 03:52:58 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Mon, 28 Aug
 2023 09:52:56 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Mon, 28 Aug 2023 09:52:56 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4DECE46B;
	Mon, 28 Aug 2023 08:52:56 +0000 (UTC)
Date: Mon, 28 Aug 2023 08:52:56 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "Liam
 Girdwood" <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>,
        "Geert
 Uytterhoeven" <geert+renesas@glider.be>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>,
        Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] ASoC: cs42xx8-i2c: Simplify probe()
Message-ID: <20230828085256.GM103419@ediswmail.ad.cirrus.com>
References: <20230827080931.34524-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230827080931.34524-1-biju.das.jz@bp.renesas.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 0jrvXLtQSH8AUyF5RrXRJXtqp0gmH2oh
X-Proofpoint-GUID: 0jrvXLtQSH8AUyF5RrXRJXtqp0gmH2oh
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: NUWGUIZGHZTAVFY2RAYAJFFXZTT2FSGH
X-Message-ID-Hash: NUWGUIZGHZTAVFY2RAYAJFFXZTT2FSGH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NUWGUIZGHZTAVFY2RAYAJFFXZTT2FSGH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Aug 27, 2023 at 09:09:31AM +0100, Biju Das wrote:
> Simplify probe() by replacing of_match_device->i2c_get_match_data() and
> extend matching support for ID table.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
