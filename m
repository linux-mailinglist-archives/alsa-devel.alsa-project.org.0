Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F0876FC1D
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Aug 2023 10:39:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F6EE6C0;
	Fri,  4 Aug 2023 10:38:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F6EE6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691138374;
	bh=B3vb7WX/FXn7lXacVVXCkZ80PSgYkQL98Ll8dqfTX4Q=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N+hmt7YBkVHGSYWwFR9Ezc0H2Z0nFxIr6Zk07vMHoRYlSCHDLLzgDB148FL/x9uXF
	 CtANv5ZqNmTP+2N9cFQX1FORN4vnpauqyRTQCfwT0Q5hvYInEor+iO0UZDKbt3g9ed
	 oY9GZr7+aSzh1swb0djeA0mbIxh19KFaBwjLIW2E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71D06F8016D; Fri,  4 Aug 2023 10:38:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8040F8016D;
	Fri,  4 Aug 2023 10:38:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E88CF8025A; Fri,  4 Aug 2023 10:38:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96227F8015B
	for <alsa-devel@alsa-project.org>; Fri,  4 Aug 2023 10:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96227F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=paOwNJc9
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3745tNEG020986;
	Fri, 4 Aug 2023 03:38:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=sKZQGok/iJi3bIU
	9jek8/lGxGG21C/JvHMYYHSaC/WE=; b=paOwNJc91l5jLmJJ/V4xkm+NCXfZJVN
	oZyqLi18aR9xsMEuBibAcl1hVeYigubU+DkoVGbywRYjor3Ch9AdOSsE9EyaPwym
	KwY3sRoBK9HMYAfGkN3m5lzB6WDCJU9wYCK0ctuZgFGiWeBTwgZHDYG7uVNt0shJ
	lQLYH27ob12BMhXJVXj1eZba4McHCcao8rjpxHZI2AOXSlPilYjjytfV80YHmSn8
	x8UlAlodxdjRhMuMXyMBdNLKuHm0fWuN00KImDqsovIrtepWD6uHFB+C2cyCgjcD
	gKUpMAOFWwAbNf0cOTW6h5vuLCYlpXfsIm3GBLn4tS2joNrczRQn/IA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3s4y6jwhfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Aug 2023 03:38:25 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 4 Aug
 2023 09:38:23 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Fri, 4 Aug 2023 09:38:23 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EF1B63563;
	Fri,  4 Aug 2023 08:38:22 +0000 (UTC)
Date: Fri, 4 Aug 2023 08:38:22 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Fabio Estevam <festevam@gmail.com>
CC: <broonie@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <shengjiu.wang@gmail.com>,
        Fabio Estevam
	<festevam@denx.de>
Subject: Re: [PATCH 2/2] ASoC: wm8960: Add support for the power supplies
Message-ID: <20230804083822.GP103419@ediswmail.ad.cirrus.com>
References: <20230803215506.142922-1-festevam@gmail.com>
 <20230803215506.142922-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230803215506.142922-2-festevam@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: oVoXdZ_DTCtmcS452BHLBw_2RwsyYKy_
X-Proofpoint-ORIG-GUID: oVoXdZ_DTCtmcS452BHLBw_2RwsyYKy_
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: CU7S22ID25CLBFUHIC2PTNOOS2HAD7XS
X-Message-ID-Hash: CU7S22ID25CLBFUHIC2PTNOOS2HAD7XS
X-MailFrom: prvs=3580138b0b=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CU7S22ID25CLBFUHIC2PTNOOS2HAD7XS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Aug 03, 2023 at 06:55:06PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> WM8960 has the following power supplies:
> 
> - AVDD
> - DBVDD
> - DCVDD
> - SPKVDD1
> - SPKVDD1
> 
> Add support for them.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
