Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB64F8D650A
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 16:59:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D17CE9D;
	Fri, 31 May 2024 16:58:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D17CE9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717167536;
	bh=9+6h3DiodrT9YFrdp+kdRsd+uvX5l44PO21I4T4zFO4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CB4EYUHf6Rlkm0S7ZAmYmljT2qAqZGBpPIPNyNQMQg7iQBks1yegsaBb5+xd2XlW/
	 sux8HODD+DhsnFvQbJuXJpu54aQtmPxGFdMOOAjQJIMXOJCcJ010exZ06rNmav0kJX
	 /8Qeychm6NQmDn8BNp0lB8NWVrh07WyUAxmsGa/w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45890F80589; Fri, 31 May 2024 16:58:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 548D7F8059F;
	Fri, 31 May 2024 16:58:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1804EF8026D; Fri, 31 May 2024 16:58:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CFA36F80051
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 16:58:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFA36F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=cgV8psTi
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 44V9Swso003313;
	Fri, 31 May 2024 09:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=hxGvSEqlUm/4Gr1/Y7
	FisaucBu8jAHnTKI/Obg6VI9c=; b=cgV8psTiVp2etlgNlYKT/Xz5UTa72Adwnp
	Mz2p1O9qHqFUPa15bt9k4vOaw0BFh7bPfJ1p4wP2ArTWshr7L1GtTFZWa18VmbEX
	efyhNCr7LGDVTGEkFIdZ0+fQ7lrmWR08B7gFutkTdq4gik7dVbbMx17C3hPbsiqX
	FCCs7+w31Fz3cjSd/vTp8fxiOXlBH0SixpDYUeNAgOZyC/WqXTvNGN/y23eabUCD
	5uteqKIcoNKlQlCxYfRo5l/rbU0dUpjor+W6lYVOnFoOCyW4y/NdaGcm+icIdEzg
	FzQyVFTV5U46MBSRn9vkeAmsXDfnV3tfBs9CiTKaysNGvNIL1WOg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ybdcwwwuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:58:06 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 15:58:04 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 31 May 2024 15:58:04 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 05CBE820244;
	Fri, 31 May 2024 14:58:04 +0000 (UTC)
Date: Fri, 31 May 2024 14:58:02 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Rob Herring <robh@kernel.org>, Weidong Wang <wangweidong.a@awinic.com>,
        Mark Brown <broonie@kernel.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>,
        Shenghao Ding <shenghao-ding@ti.com>,
        "Marco Felsch" <m.felsch@pengutronix.de>,
        Alper Nebi Yasak
	<alpernebiyasak@gmail.com>,
        Chancel Liu <chancel.liu@nxp.com>,
        "Kuninori
 Morimoto" <kuninori.morimoto.gx@renesas.com>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linuxppc-dev@lists.ozlabs.org>, <imx@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        "James
 Schulman" <james.schulman@cirrus.com>,
        David Rhodes
	<david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Heiko Stuebner
	<heiko@sntech.de>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v1 1/6] ASoC: codecs: Remove unused of_gpio.h
Message-ID: <ZlnleuSae2C6/WRU@opensource.cirrus.com>
References: <20240530230037.1156253-1-andriy.shevchenko@linux.intel.com>
 <20240530230037.1156253-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240530230037.1156253-2-andriy.shevchenko@linux.intel.com>
X-Proofpoint-GUID: QOHrrhhsAlL1BvB8LD1NFqOZRJaPkXqI
X-Proofpoint-ORIG-GUID: QOHrrhhsAlL1BvB8LD1NFqOZRJaPkXqI
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 3YY2TD7MQAIRC5NZUA4R2CBNZT23S324
X-Message-ID-Hash: 3YY2TD7MQAIRC5NZUA4R2CBNZT23S324
X-MailFrom: prvs=38813a1e1d=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3YY2TD7MQAIRC5NZUA4R2CBNZT23S324/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, May 31, 2024 at 01:58:47AM +0300, Andy Shevchenko wrote:
> of_gpio.h is deprecated and subject to remove. The drivers in question
> don't use it, simply remove the unused header.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  sound/soc/codecs/cs53l30.c        | 1 -

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
