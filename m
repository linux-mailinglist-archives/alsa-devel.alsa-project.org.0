Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3937BD8D1
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 12:38:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36E64DEB;
	Mon,  9 Oct 2023 12:37:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36E64DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696847896;
	bh=/i4z3EbQgAXiZZry0DSWDV5/qIOrGAydLvVcww5YUhw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BRTeRn7Evl40DiC75zQXBBSh0zxX2q55j4D+H1FyUN7Bqm7AlsAT/aDTZ1m3eodQa
	 q/TTSKKUJLduWZBopSkbaOCPVQg4lTy/mJCFtnLgWea2c71tjDbZo4iUsOsPIgM4Ra
	 jtYrImc32ePkTvxwBxzJsdm1yV94NDApiFABb+cU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5C26F80553; Mon,  9 Oct 2023 12:37:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 625E0F8027B;
	Mon,  9 Oct 2023 12:37:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59965F802BE; Mon,  9 Oct 2023 12:37:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 19789F80166
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 12:37:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19789F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=YI4vtvCV
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3998o4jd004408;
	Mon, 9 Oct 2023 05:37:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=
	PODMain02222019; bh=OyqyfVFU0gVjuaAYiEak+piLM77d61dNep6YSXRwMUA=; b=
	YI4vtvCVYNZYSjQkwMD4wQU+yXBSzVigaj0ZBJk++6Tddcg4oEJPmJsH20WknpPX
	Ubz+e66KjlP8oWDwc5cMlzoVTrFP5eUCx9iAyI3qxiMulbbZRoncsOIgLF6HeRjo
	GjUa35evCAo+iAlzp+dPIcUedH2y8UhTi3ti7eZ0D0pMVNPUCVDPi32qjIwv6bPk
	FPGcVBnqUurisfvPvIMP30ONPYlBGy2YJ6Qq9FOn7dktFbJsQbw152Cszziyts1o
	nz/L+6I9OHe2acmhaYnsEwy1iZnSOlfkEtbrKinwyUNIrXJQUHRVxcS17xQC8cRg
	bg62lDoaFpCXJRp+FwynhA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3tkhhah53b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 05:37:03 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Mon, 9 Oct
 2023 11:37:02 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Mon, 9 Oct 2023 11:37:02 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1F98911AC;
	Mon,  9 Oct 2023 10:37:02 +0000 (UTC)
Date: Mon, 9 Oct 2023 10:37:02 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
CC: Linus Walleij <linus.walleij@linaro.org>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/20] pinctrl: cirrus: madera-core: Convert to platform
 remove callback returning void
Message-ID: <20231009103702.GT103419@ediswmail.ad.cirrus.com>
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de>
 <20231009083856.222030-5-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231009083856.222030-5-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: 0ilXo8LgIoQU3KAveaIyUEAf2RT9i5H-
X-Proofpoint-GUID: 0ilXo8LgIoQU3KAveaIyUEAf2RT9i5H-
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: SFAO3P5GUYKIF4SVWIF7DVM6SYTL4D6F
X-Message-ID-Hash: SFAO3P5GUYKIF4SVWIF7DVM6SYTL4D6F
X-MailFrom: prvs=56464428ff=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SFAO3P5GUYKIF4SVWIF7DVM6SYTL4D6F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Oct 09, 2023 at 10:38:40AM +0200, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
