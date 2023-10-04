Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C847B9B9A
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Oct 2023 09:56:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA715EB0;
	Thu,  5 Oct 2023 09:55:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA715EB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696492561;
	bh=Rsw+rLK4uzHM4l/7f5QgPzu4ERN2qLxiZjFE2tbUu8U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s14nzeAP3XoH60z0I2IxcrxG1h6ILEZqbKHpE6UOc2DsURJsYbnZQCB5AozCEAQlL
	 9PSFGbPaQ8vYjqlpkLa5oQuv2jaNX+IGZc9WES+1BG1ykEGZFpVe+J1pGrAorikxa9
	 toEQH9OJVeQBiUDmcFPglvkZ2TQoUCZJmEDYNWrg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8233F805D3; Thu,  5 Oct 2023 09:52:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7516F805BD;
	Thu,  5 Oct 2023 09:52:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C014F8047D; Wed,  4 Oct 2023 10:28:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5127F800C1
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 10:28:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5127F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=FkPSHjHT
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3948ScCJ021667;
	Wed, 4 Oct 2023 03:28:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=cx4j1u2cB/RSNNO
	JLWI4IUS4jJGgAFRWe5mxjA6ot+c=; b=FkPSHjHTRZJ7+JgSxFK8tXOclrwQk6D
	erGe55nCKmcgwS4pjnCa7kx1t0KIUQRtp6DiLVx44+462zqwJ8IHQxXw3IZS3qCK
	dgoVBaX0bfhZaQm0BRHVtj0P6703R28AQy9Moikhz0h1Hk5FfaFO+6kD95DFY1n4
	6OV+Nm6qkRSYAlc/A3eMbDBImbyhazxV2Ob1kCGGe1jsAo342KW2wxFmjc9kfXI5
	uZVCADBJlHGRF/5hjD2uAdYyKdiCYm2rPazpPjo5nz/x5wiAxgTj0cBQUhiTkISf
	HLO6AcCL2/hwACfFWus/kRMLo9mY4pCvdBfYY9IzNGhz9DH3nUAvmNQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3teg3k55km-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 03:28:38 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 4 Oct
 2023 09:28:36 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Wed, 4 Oct 2023 09:28:36 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6973611AA;
	Wed,  4 Oct 2023 08:28:36 +0000 (UTC)
Date: Wed, 4 Oct 2023 08:28:36 +0000
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
Subject: Re: [PATCH 1/5] ASoC: Explicitly include correct DT includes
Message-ID: <20231004082836.GP103419@ediswmail.ad.cirrus.com>
References: <20231003-dt-asoc-header-cleanups-v1-0-308666806378@kernel.org>
 <20231003-dt-asoc-header-cleanups-v1-1-308666806378@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231003-dt-asoc-header-cleanups-v1-1-308666806378@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: jGlpUZphMoUFhGT30mAikeonWPxMmR74
X-Proofpoint-ORIG-GUID: jGlpUZphMoUFhGT30mAikeonWPxMmR74
X-Proofpoint-Spam-Reason: safe
X-MailFrom: prvs=5641f542b1=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: XQKLIKTNVPM4KE6KTG2FMP7JXUZYGRF3
X-Message-ID-Hash: XQKLIKTNVPM4KE6KTG2FMP7JXUZYGRF3
X-Mailman-Approved-At: Thu, 05 Oct 2023 07:52:34 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XQKLIKTNVPM4KE6KTG2FMP7JXUZYGRF3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Oct 03, 2023 at 11:43:07AM -0500, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it was merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

For the Wolfson/Cirrus bits:

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
