Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFEA77DBC7
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 10:10:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CC99207;
	Wed, 16 Aug 2023 10:09:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CC99207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692173440;
	bh=YnX7wA2PC4UFwNdEQiDfcZvFPz169TZtXXtTh0fcEsw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J+O/j1VqYyfWAmt1EvLc239BtjhnWdq4ZsCZ2T4iAIAj3/2tW6XwK9LAtgeFTHNzY
	 z2c/aQL4P/Hs3QGwEdALSATEMfAwp8EIGFDCjtcwCavOSaEszWT3hAYJG9vBaVdemu
	 uoroG4SZucoCTsnYO70iM5Vm2Vbx4XVvsIKePz6g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF090F8016D; Wed, 16 Aug 2023 10:09:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63604F8016A;
	Wed, 16 Aug 2023 10:09:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7F33F8016D; Wed, 16 Aug 2023 10:09:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D54BFF800EE
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 10:09:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D54BFF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=p6gCqmF5
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37G4px6f021725;
	Wed, 16 Aug 2023 03:09:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=RtuS4+RPM5H1eJM
	X+4Vl/LFgMJ7LIG0XPxVu8i+mQYU=; b=p6gCqmF5a32jO0Yqo4wAaacnUR4GSqG
	Y95zPgG7IA7/Y/guuFNkunnjFa/Lmij4iQf7nQAZ4xvR+jdk4/8Hy/yhTTs1QepI
	8LxL0nL8jXuARklIL/d3WausNTHxRf0VnyKIu/Jx8o+I6uwrOlZoYqotNoQjEUBG
	6Z8F/cuy86suepUnRX3EZc2Fo0EC4UdUWa0NC+RdaF3KIT07tKsrAvVb/iPTy8Vm
	W5B9b8g07ao/TltFpj+l2ALVQBxXz6W4jshFuBZETiLcuz+t5eOirbi3BeWYN6dE
	TYO4kdptj7qAT15pxIbFYzbYD7QMocO8XrojXEpOP6UWRcTH7BqqSEA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3se8kqvnbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Aug 2023 03:09:36 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 16 Aug
 2023 09:09:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Wed, 16 Aug 2023 09:09:33 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CBBE33575;
	Wed, 16 Aug 2023 08:09:33 +0000 (UTC)
Date: Wed, 16 Aug 2023 08:09:33 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Heiko
 Stuebner <heiko@sntech.de>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH RESEND 2/3] ASoC: codecs: wm8904: Fix
 Wvoid-pointer-to-enum-cast warning
Message-ID: <20230816080933.GA103419@ediswmail.ad.cirrus.com>
References: <20230815143204.379708-1-krzysztof.kozlowski@linaro.org>
 <20230815143204.379708-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230815143204.379708-2-krzysztof.kozlowski@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: eNCEnLsDOM7DPowp6ucywe6coIrIFr1T
X-Proofpoint-GUID: eNCEnLsDOM7DPowp6ucywe6coIrIFr1T
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 2CD22Y5Q2CJ7IBH3WTOSX7NFINQS7BN2
X-Message-ID-Hash: 2CD22Y5Q2CJ7IBH3WTOSX7NFINQS7BN2
X-MailFrom: prvs=35920a7bb8=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2CD22Y5Q2CJ7IBH3WTOSX7NFINQS7BN2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Aug 15, 2023 at 04:32:03PM +0200, Krzysztof Kozlowski wrote:
> 'devtype' is an enum, thus cast of pointer on 64-bit compile test with
> W=1 causes:
> 
>   wm8904.c:2205:21: error: cast to smaller integer type 'enum wm8904_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
