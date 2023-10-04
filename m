Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 028E07B9B9B
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 09:56:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FDFCEBF;
	Thu,  5 Oct 2023 09:55:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FDFCEBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696492578;
	bh=UwmYmNSJ5N9bCYGOhkqk5VQCOP5kX+Bk4CRe0KBh2OU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sfzUDi3oexK5GL1Whqf6Qdtv7rOgV2s6Kn0aZ95SODDK2yIUApA6WvCYvzXG1Dlr1
	 qO3wy2gQm9moyXBw8EQMzbUjmv0gLp6B+uVGj2vBLO4RYKoXFHCPSPsuCnvW3uceWs
	 a9dNc0J+cwCYVRmxYfPWoRbc/AUK9SjjBIsVYfT8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 317FFF805DA; Thu,  5 Oct 2023 09:52:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1BBDF805C5;
	Thu,  5 Oct 2023 09:52:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7207F8047D; Wed,  4 Oct 2023 10:33:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40D6AF800C1
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 10:33:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40D6AF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=MKm1hEnL
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39461LK5031802;
	Wed, 4 Oct 2023 03:33:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=C03Kz69TBbxck4h
	yYh7pZ/332ziUW1qlTgjfP8Qf2Tg=; b=MKm1hEnLBCfTn8s5VJjtjUgmfX/JTvm
	+OrRe1LWGGwQbaoNRf2GWfGYSjE6o45VTn1nyuudObMD4lODrlfjwrOlZtVOx6Qh
	37dHacwtaXA6jLq+M2WNBVm7MVHRQldFk2ZTFgTKQLNtyASpRXzz9EnpGq5mzSc1
	mIMYUabBH9Wst4ROoD5x0QVA1i/N1k5SpI3r8ACY7STWH5NcYwovm835M+4Z/TW8
	KlIAE8jw8j9AiyEpmE+APRK5qiC22T5sHotstaVVs1Lm9quG99MahE/rVrK66KPe
	3huRn/gK94po0HHXw77W4HccUrAoZSUK4itBjTrTuVLYFTYwHrdWGyw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3th2dt85sm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 03:33:35 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 4 Oct
 2023 09:33:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Wed, 4 Oct 2023 09:33:32 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4BC2AB06;
	Wed,  4 Oct 2023 08:33:32 +0000 (UTC)
Date: Wed, 4 Oct 2023 08:33:32 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Rob Herring <robh@kernel.org>
CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Mark Brown
	<broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai
	<tiwai@suse.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>,
        Peter Rosin <peda@axentia.se>, "Ray
 Jui" <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "Lars-Peter
 Clausen" <lars@metafoo.de>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        James Schulman <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Shenghao Ding
	<shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu
	<baojun.xu@ti.com>, Oder Chiou <oder_chiou@realtek.com>,
        Fabio Estevam
	<festevam@gmail.com>,
        Kiseok Jo <kiseok.jo@irondevice.com>,
        Kevin Cernekee
	<cernekee@chromium.org>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li
	<Xiubo.Lee@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
        Shawn Guo
	<shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "Pengutronix
 Kernel Team" <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami
	<bgoswami@quicinc.com>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Sylwester Nawrocki
	<s.nawrocki@samsung.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec
	<jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Ban Tao
	<fengzheng923@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        "Jonathan Hunter" <jonathanh@nvidia.com>,
        Peter Ujfalusi
	<peter.ujfalusi@gmail.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Cezary
 Rojewski <cezary.rojewski@intel.com>,
        Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>,
        Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>,
        Bard Liao
	<yung-chuan.liao@linux.intel.com>,
        Ranjani Sridharan
	<r.anjani.sridharan@linux.intel.com>,
        Kai Vehmanen
	<kai.vehmanen@linux.intel.com>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 2/5] ASoC: Drop unnecessary of_match_device() calls
Message-ID: <20231004083332.GQ103419@ediswmail.ad.cirrus.com>
References: <20231003-dt-asoc-header-cleanups-v1-0-308666806378@kernel.org>
 <20231003-dt-asoc-header-cleanups-v1-2-308666806378@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231003-dt-asoc-header-cleanups-v1-2-308666806378@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: cvmrx7nPMYCDUdYHAhx7anCT9XLT2sn8
X-Proofpoint-GUID: cvmrx7nPMYCDUdYHAhx7anCT9XLT2sn8
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=5641f542b1=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: BZMLH4VL3QQHDXPRHADE567WHAOLOLDC
X-Message-ID-Hash: BZMLH4VL3QQHDXPRHADE567WHAOLOLDC
X-Mailman-Approved-At: Thu, 05 Oct 2023 07:52:34 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BZMLH4VL3QQHDXPRHADE567WHAOLOLDC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Oct 03, 2023 at 11:43:08AM -0500, Rob Herring wrote:
> If probe is reached, we've already matched the device and in the case of
> DT matching, the struct device_node pointer will be set. Therefore, there
> is no need to call of_match_device() in probe.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

For the cirrus bits:

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
