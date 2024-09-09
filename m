Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F2D971F1A
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2024 18:25:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62B7E84C;
	Mon,  9 Sep 2024 18:25:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62B7E84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725899123;
	bh=M6ZLLQgUBQBQ8banvirqUpHTyzU1q6qqBSJ32VFV1Vk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P71eQS+ruVm8jQRMeOGGU+MyHUf8rAJZCr971cG4qiqrDTMY0Wmnxib+OXNAPYytx
	 /bsPsfZTtPP4U0T7RNvHSECWv5MqEiTFjHO//eALi1iuJQfVwyAR9jVkHkfJevXPMP
	 Fzpm1l6UomyX5KXnk7pFe+cLVL1ZHXDCD6twCVq8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F02AF805B4; Mon,  9 Sep 2024 18:24:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61366F805B2;
	Mon,  9 Sep 2024 18:24:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CADEF801F5; Mon,  9 Sep 2024 18:24:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72F6FF80107
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 18:24:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72F6FF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=IZz/xzF2
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4896dwsi001006;
	Mon, 9 Sep 2024 11:24:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=qgXXrB7jZbmm1OASdq
	ea7N1/RcWZU6RDCmcbZWibma4=; b=IZz/xzF2LTag0CbDuRSJi43A0+1aCgTEdx
	OPot8Hthc/a1hbPxbOunSu3PJUO9sjg9bUPatDUjFmmRNv5B0lrWgZtaX0lCox9b
	hRZoZfYwRsVYTSL2Z9cywwNGIq9ZbDJ53Q8O7nrgF/uog2risIoxB7VEosUMUfzY
	sCVsj8v9LG2GZWwz2x26DpphcfrEJocqrfOM/g6QnHi5oZgnTyBH+DYeZZpnDnpZ
	Zdg577erh/mbRiI3aVU3HJCyxUACC1fYXdL3byJv4ZrFmMbg59GWlH5K8nNTwqIJ
	JeeMkn8OSmTdKkt220BO/umyJ0BUezZJqEuUS5J99QNKW1JtyRYQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 41gm7x1upu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 11:24:43 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Sep 2024
 17:24:41 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 9 Sep 2024 17:24:41 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 802DC820249;
	Mon,  9 Sep 2024 16:24:41 +0000 (UTC)
Date: Mon, 9 Sep 2024 17:24:40 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "David
 Rhodes" <david.rhodes@cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood
	<liam.r.girdwood@linux.intel.com>,
        Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>,
        Kai Vehmanen
	<kai.vehmanen@linux.intel.com>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        "Jernej
 Skrabec" <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH 07/13] ASoC: cs35l41: drop SNDRV_PCM_RATE_KNOT
Message-ID: <Zt8hSGHIF16NgMX/@opensource.cirrus.com>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
 <20240905-alsa-12-24-128-v1-7-8371948d3921@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240905-alsa-12-24-128-v1-7-8371948d3921@baylibre.com>
X-Proofpoint-GUID: 6dixBlqA4RmXx9Gp9C01vdaMDdrQzuFj
X-Proofpoint-ORIG-GUID: 6dixBlqA4RmXx9Gp9C01vdaMDdrQzuFj
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: IPISYWJLORKGI33IMA7XBYUNMTUZMOKG
X-Message-ID-Hash: IPISYWJLORKGI33IMA7XBYUNMTUZMOKG
X-MailFrom: prvs=698262c8fd=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IPISYWJLORKGI33IMA7XBYUNMTUZMOKG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Sep 05, 2024 at 04:12:58PM +0200, Jerome Brunet wrote:
> The custom rate constraint list was necessary to support 12kHz and 24kHz.
> These rates are now available through SNDRV_PCM_RATE_12000 and
> SNDRV_PCM_RATE_24000.
> 
> Use them and drop the custom rate constraint rule.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
