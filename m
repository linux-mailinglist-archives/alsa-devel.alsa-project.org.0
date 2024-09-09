Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC2E971F44
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2024 18:31:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44048B60;
	Mon,  9 Sep 2024 18:31:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44048B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725899492;
	bh=GUDL2TE371GbyE5n1pNlV2wQ1gYkMczH7tLNOGHFQIc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oVXZ+tkzBM6YYOXCtbPQd+nvPidC7/zoOb0r9nxMhuocWUGLMoDTMXit0u+jyjhn4
	 ruQpiRwnRJ1yoD2mxwzEGfM59tdTSQyLPDl/+ji9+SYokQfXD7Tno9/5F60YBEuOfz
	 DW98jNL83NlE6JgW9vE9vjmPGp6uOgBI9uAZey5U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B21EF805AB; Mon,  9 Sep 2024 18:31:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 496F3F805AB;
	Mon,  9 Sep 2024 18:31:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E3B2F801F5; Mon,  9 Sep 2024 18:30:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E2EEF8010B
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 18:30:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E2EEF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=DBiSk+Uo
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 489ApF4e013877;
	Mon, 9 Sep 2024 11:30:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=6U6qZUIO+sUMJTVje+
	G598Zd4h5A4XVzroJm81aghfk=; b=DBiSk+UoAnEWIx1O2j/uIljsq0kfRknJiY
	lCG5jWwliVsZVqXpTpxnX6SCU+JmQ9oZrxENAeXdIrneKzhZ7obYRfTxYTW3magv
	BgKJkwDh1v2SZDjlOoA2ac4HkppLlzl+PhacmbG6M2/QltrKe+ZbsV9pH88lp1k4
	K4NU7RzzbQaQCqYntxP54HFLSrT4Lo382m6ZeRBLeiFB3dJNJM/YKnYhq1m05gfg
	N4XVlGeuHupRdGYavPiK9WUEWWIk1D0VIGmfEqAsAr6sG+XfMu7qb6YyvpMSTGxh
	AaPDauQTGaclAglzdrD5TpPusAiCGM7/wjtzxR7qklC/Fr+Lwl/w==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 41gk8hsxp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 11:30:51 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Sep 2024
 17:30:49 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 9 Sep 2024 17:30:49 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 9CBB7820249;
	Mon,  9 Sep 2024 16:30:49 +0000 (UTC)
Date: Mon, 9 Sep 2024 17:30:48 +0100
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
Subject: Re: [PATCH 01/13] ALSA: pcm: add more sample rate definitions
Message-ID: <Zt8iuGXyBC3NoYYN@opensource.cirrus.com>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
 <20240905-alsa-12-24-128-v1-1-8371948d3921@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240905-alsa-12-24-128-v1-1-8371948d3921@baylibre.com>
X-Proofpoint-GUID: YPCWMWTx_zWDnZTmxJDrF_5U1tHpWoN7
X-Proofpoint-ORIG-GUID: YPCWMWTx_zWDnZTmxJDrF_5U1tHpWoN7
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: TKFS5O3N25BMIFRPQIII7PZ6WIZXX6FB
X-Message-ID-Hash: TKFS5O3N25BMIFRPQIII7PZ6WIZXX6FB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TKFS5O3N25BMIFRPQIII7PZ6WIZXX6FB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Sep 05, 2024 at 04:12:52PM +0200, Jerome Brunet wrote:
> This adds a sample rate definition for 12kHz, 24kHz and 128kHz.
> 
> Admittedly, just a few drivers are currently using these sample
> rates but there is enough of a recurrence to justify adding a definition
> for them and remove some custom rate constraint code while at it.
> 
> The new definitions are not added to the interval definitions, such as
> SNDRV_PCM_RATE_8000_44100, because it would silently add new supported
> rates to drivers that may or may not support them. For sure the drivers
> have not been tested for these new rates so it is better to leave them out
> of interval definitions.
> 
> That being said, the added rates are multiples of well know rates families,
> it is very likely that a lot of devices out there actually supports them.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Almost wonder if a comment with the SNDRV_PCM_RATE_8000_xxx
defines might also be an idea to warn they don't include all the
rates, although it is I guess easily seen from the define itself
so not sure if it might be over kill. But I am happy either way.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
