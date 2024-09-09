Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40474971F0B
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2024 18:24:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 389E8B60;
	Mon,  9 Sep 2024 18:24:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 389E8B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725899063;
	bh=0Rh4KmqChPzqTEwbrGqXfSqb6i9rs9C8GBy9+jQDHQw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bE/k4Dyud/+iFYNnKHkmTGIKYAZ0yvVXNOKfwhufB0+GjkT9Nu0fgcGYTKw5THYmf
	 HGRHnxLGEjHJjtiUMi6SywnKeekXPx7Rv3ygYu1IjqkOprnPrWNZHv93Lc3yzVikFZ
	 Ly0EuCvrGcF1z1hPSOPef4ssCJrHzl3Wr0l4pxZE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEC6CF805B6; Mon,  9 Sep 2024 18:24:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A701F805B2;
	Mon,  9 Sep 2024 18:24:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FB22F80272; Mon,  9 Sep 2024 18:24:08 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 67502F8019B
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 18:24:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67502F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=YpBd1XgC
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4896dwsf001006;
	Mon, 9 Sep 2024 11:24:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=iJQ6QpbXlFmFTrokEH
	XawRi6AwzM3shtaMUFaKsiIKQ=; b=YpBd1XgCh84u0CRKwzEoYhHgOoOwIEDlal
	jr2P0DnO2t4R5SevDkUDcYEfZ3/j91BxhkTD1qLELjfgfN9bLIc71ky5vwlcmKj9
	9Ymufg2t5/hM+zQm2iocLgLwCG3YjC8XprR6IfO12n7a3ZUkPqZdAfR1bCdRgyak
	1w5Ky2tZDqCFyGIO+CXxdO4pyPnth8nKnlHN6aKhh9MDbhcTcRHse9bE7oQy4AfD
	kLNZsqMVGsUYKBEeVGF3eB00me34r+z7FmYMc6aN9s5y7m48rHkLS+jmpc7Ymqv8
	rRrQwm0hudv2tbDIgC1cadkZjyzBRxrHsMdYgcgUUXVa+HOhevMg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 41gm7x1uny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 11:24:03 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Sep 2024
 17:24:01 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 9 Sep 2024 17:24:01 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 8DEA0820249;
	Mon,  9 Sep 2024 16:24:01 +0000 (UTC)
Date: Mon, 9 Sep 2024 17:24:00 +0100
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
Subject: Re: [PATCH 06/13] ASoC: cs35l36: drop SNDRV_PCM_RATE_KNOT
Message-ID: <Zt8hIGzvPIsmZho/@opensource.cirrus.com>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
 <20240905-alsa-12-24-128-v1-6-8371948d3921@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240905-alsa-12-24-128-v1-6-8371948d3921@baylibre.com>
X-Proofpoint-GUID: YzC5zK9-HLCkV04WUzI1FtnUinHTtgDV
X-Proofpoint-ORIG-GUID: YzC5zK9-HLCkV04WUzI1FtnUinHTtgDV
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 2UAXMELYCCVQIJMXECX6PE3Y2CN5OLA4
X-Message-ID-Hash: 2UAXMELYCCVQIJMXECX6PE3Y2CN5OLA4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2UAXMELYCCVQIJMXECX6PE3Y2CN5OLA4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Sep 05, 2024 at 04:12:57PM +0200, Jerome Brunet wrote:
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
