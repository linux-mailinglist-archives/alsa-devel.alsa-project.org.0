Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C15E75EDA5
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jul 2023 10:31:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E014204;
	Mon, 24 Jul 2023 10:30:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E014204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690187475;
	bh=BMdQWFcxqDguMxj4D1YrU+/RnJPP0qlnkt8sdSwvJno=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LEH0esMkgm8vKhIk9gTGL1vVT9OfjeOqJm0ldParJ/BG4jsnjpwYNdKyurehxQAEq
	 CV+ZhCpWvsS5WOhhiLd1Ol6W3KzWTmDvU6VwgPgo/C7+w+Q5qNic8LC4rvHxQNOHRM
	 WCO6UdtKWOO4vHgS42cuvnFcv3TJ+Akki6ENenjU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B484BF801F5; Mon, 24 Jul 2023 10:30:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36F5EF80163;
	Mon, 24 Jul 2023 10:30:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 707B6F8019B; Mon, 24 Jul 2023 10:30:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D005F800D2
	for <alsa-devel@alsa-project.org>; Mon, 24 Jul 2023 10:30:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D005F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=SVIgfNIZ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36O5NNVU031630;
	Mon, 24 Jul 2023 03:30:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=QQv0SxoFmBIvOfY
	EYP3HSROFDEykvX7cVOxUZ+1+3d4=; b=SVIgfNIZi11VTyIn7tkTnGN6AOTh00f
	Xodk3NHG7SUeXfJXiRzOmPP7GXWVC7fD+8QYHGj1ab4sSlk1QoZuUbZy9m5G5pb7
	HVtIQhzTNt1u3wV/9FpSQ8QoAmRsJepo6rHqd/Ad7/9GiPNtp3tpSbX5TbbCB8C/
	5hZx7+qe4zGxXb6QjyKtjd2Cn8Ir7riv+dEZzKgH5fNi9rjwwGK91hAgHSXoMovf
	BqfKJxDRXWnjJNxfbV33tjtFkKV8sIBUkoQN72AQqcSLkXrjNcI9lzFz2kG7r55A
	4TiJJ4KzXXEigU+YUIH2DlyErQGLssar9qR/EzeXX7J0iVyCNZTKyiw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3s0cgxsq7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jul 2023 03:30:01 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 24 Jul
 2023 09:29:59 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Mon, 24 Jul 2023 09:29:59 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7F39715B4;
	Mon, 24 Jul 2023 08:29:59 +0000 (UTC)
Date: Mon, 24 Jul 2023 08:29:59 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>
Subject: Re: [PATCH] ASoC: wm8904: Fill the cache for WM8904_ADC_TEST_0
 register
Message-ID: <20230724082959.GL103419@ediswmail.ad.cirrus.com>
References: 
 <20230723-asoc-fix-wm8904-adc-test-read-v1-1-2cdf2edd83fd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: 
 <20230723-asoc-fix-wm8904-adc-test-read-v1-1-2cdf2edd83fd@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: d_anRes0BSx49DQu5r1rZpR9oZ6F7SS7
X-Proofpoint-GUID: d_anRes0BSx49DQu5r1rZpR9oZ6F7SS7
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: IDTHGHH75EUDUKCKTMBRTXGN6WOPJK4T
X-Message-ID-Hash: IDTHGHH75EUDUKCKTMBRTXGN6WOPJK4T
X-MailFrom: prvs=256966101f=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IDTHGHH75EUDUKCKTMBRTXGN6WOPJK4T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, Jul 23, 2023 at 12:27:22AM +0100, Mark Brown wrote:
> The WM8904_ADC_TEST_0 register is modified as part of updating the OSR
> controls but does not have a cache default, leading to errors when we try
> to modify these controls in cache only mode with no prior read:
> 
> wm8904 3-001a: ASoC: error at snd_soc_component_update_bits on wm8904.3-001a for register: [0x000000c6] -16
> 
> Add a read of the register to probe() to fill the cache and avoid both the
> error messages and the misconfiguration of the chip which will result.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
