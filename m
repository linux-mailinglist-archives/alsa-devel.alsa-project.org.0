Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D956B851060
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Feb 2024 11:12:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11B21825;
	Mon, 12 Feb 2024 11:12:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11B21825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707732732;
	bh=EUaMkEUqz4qgROvxBCIDolmNlZRkFxJ7hUO/k+Lveu0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YJp0v9X61f12zaBodemlfJzSAimon3hekYV1rEDl1pWSS5tbz/5w0AWN5xsaIYrx3
	 vtfXBRMnIBfBZrsNseHkS1lm2XvRBhzAqII8cNt25N57gc/gp/dmQFHhBPBbHB7e7v
	 +5nfAMOwiBW0pr0bdVMElvtZvXVIRBtOA6VcSFmU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BD13F80571; Mon, 12 Feb 2024 11:11:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB93CF80567;
	Mon, 12 Feb 2024 11:11:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98A57F8025A; Mon, 12 Feb 2024 11:03:21 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A88BF800EE
	for <alsa-devel@alsa-project.org>; Mon, 12 Feb 2024 11:02:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A88BF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=LWzQNVJn
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41C7sVo4016307;
	Mon, 12 Feb 2024 04:02:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=WLF2X+j3Bn92Q1D
	DaV05/unswsO5ahBS+1WWPqaApW4=; b=LWzQNVJn8q7dcq0Bd+TtMxT1lIBoGiw
	yD0TsejCsoABuy8AggRDJW06Q1z2xJlky/ztkU9ADIkffObtOL0UuCQv3Beh4nhA
	Put6Ypu2vVivviEJ6Oil+cEfW1Q27QM+O9ltZ623dvQO4anhr/dZNovMzxP3lw+a
	LhOj5jub+y3fjAvlvXTHjliMbTrYlMFuhJHFxHorIs5Vl5GjaGvKHU61HqyF2Ni8
	oMyxoPUphkMgU1KFNxi+kfuEZzYoo4jyVm3Qy64lf8Glce+CGjlLDllqFwliGFC9
	RTpYBk2a8X7avMhCql6FZ7NmoU/tVg544Z1TluPmt36M8g8y3w06Uow==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w67e21nee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 04:02:21 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 12 Feb
 2024 10:02:18 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 12 Feb 2024 10:02:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 70E1F820242;
	Mon, 12 Feb 2024 10:02:18 +0000 (UTC)
Date: Mon, 12 Feb 2024 10:02:17 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
        Peng Fan
	<peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Nishanth Menon
	<nm@ti.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter
	<jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Laurent
 Pinchart" <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Russell King
	<linux@armlinux.org.uk>,
        Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>,
        Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        NXP Linux Team
	<linux-imx@nxp.com>,
        <linux-amlogic@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <alsa-devel@alsa-project.org>,
        <linux-sound@vger.kernel.org>
Subject: Re: [PATCH] clk: constify the of_phandle_args argument of
 of_clk_provider
Message-ID: <ZcnsqaIftZXcNaUA@ediswmail9.ad.cirrus.com>
References: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
X-Proofpoint-ORIG-GUID: NzDJLMtFiatrdGDskmwX3IMPmG4MYizJ
X-Proofpoint-GUID: NzDJLMtFiatrdGDskmwX3IMPmG4MYizJ
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: GG4K5YNQ6GDJQRP2SMDVH5YCXPJ3E75O
X-Message-ID-Hash: GG4K5YNQ6GDJQRP2SMDVH5YCXPJ3E75O
X-MailFrom: prvs=97722b643d=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GG4K5YNQ6GDJQRP2SMDVH5YCXPJ3E75O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Feb 08, 2024 at 05:37:10PM +0100, Krzysztof Kozlowski wrote:
> None of the implementations of the get() and get_hw() callbacks of
> "struct of_clk_provider" modify the contents of received of_phandle_args
> pointer.  They treat it as read-only variable used to find the clock to
> return.  Make obvious that implementations are not supposed to modify
> the of_phandle_args, by making it a pointer to const.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/clk/clk-lochnagar.c                   |  2 +-

For the Lochnagar bits:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
