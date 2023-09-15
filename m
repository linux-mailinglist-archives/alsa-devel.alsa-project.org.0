Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E337A20A2
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 16:16:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0027184C;
	Fri, 15 Sep 2023 16:15:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0027184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694787396;
	bh=4bJnKHhGdAYZJkrr06OHdeclnulAY+flcpOD15avu54=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PHEGLHDlm2Grn2xPzpdTWRcXdJ/ESjrj7RtQWimN/jNGTrUWZ1re0SrjiRL/EIN7V
	 tr7NHcHSYkqsomS0PbW3xxXaqEu+bsfYrPadnqMhz65mva9oe4qCasnq/ZmUQ5Vyvh
	 xb+gEzVGn1yM6l6ztcaC/zrbXXPUsoh8aU37OFmg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81FFDF80425; Fri, 15 Sep 2023 16:15:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05E6BF80246;
	Fri, 15 Sep 2023 16:15:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCF04F80425; Fri, 15 Sep 2023 16:15:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86578F801F5
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 16:15:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86578F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ASH6m340
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38FDxFew031114;
	Fri, 15 Sep 2023 09:15:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=aCEXI68lTXdsry6
	dELoiV+B/0zhuy6taAq6GDfbTB20=; b=ASH6m340IgCWovKTPuYQUPzjQnBntrT
	aO4NYRrFnw4cXIbn7qzJ+rAwuWBS2VKLo0aTa1sv+kxUbRhkXCxF29XYhdAH5/iA
	sO/9vIqquWy2r2CaLENlJSzyl8uAncskkTizrYBwt3cUMUY0imGQfWUoWaJa/tEr
	saq1bkKBXdYChecl2fYRXKXaPhf7s5x2tRbMQl0VRSzlnfNH5Eigw4OZTZwT1VdK
	MaQh2Lj9BvB94STU8KLmi4N9OazXKpqv4nNEdjsnOL0M18A/Jmg2hC1bRl0BSsPv
	ER4dv3u4clDXCXJznmhvaCtEokFdVsYOjlwbcexipaadbZLuRTquTUA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t2y7u4486-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 09:15:30 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Fri, 15 Sep
 2023 15:15:28 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Fri, 15 Sep 2023 15:15:27 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D6870357D;
	Fri, 15 Sep 2023 14:15:27 +0000 (UTC)
Date: Fri, 15 Sep 2023 14:15:27 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Colin Ian King <colin.i.king@gmail.com>
CC: James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][next] ASoC: cs42l43: make const array controls static
Message-ID: <20230915141527.GU103419@ediswmail.ad.cirrus.com>
References: <20230915092639.31074-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915092639.31074-1-colin.i.king@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: kXd1VQHzb0v6gaw4aAc6S3Wd7MZ_nUJk
X-Proofpoint-ORIG-GUID: kXd1VQHzb0v6gaw4aAc6S3Wd7MZ_nUJk
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 6G37CYMAAA7XLZUYQ6OWDXJCE5G36HUH
X-Message-ID-Hash: 6G37CYMAAA7XLZUYQ6OWDXJCE5G36HUH
X-MailFrom: prvs=4622e418f9=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6G37CYMAAA7XLZUYQ6OWDXJCE5G36HUH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Sep 15, 2023 at 10:26:39AM +0100, Colin Ian King wrote:
> Don't populate the const array controls on the stack, instead make it
> static.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
