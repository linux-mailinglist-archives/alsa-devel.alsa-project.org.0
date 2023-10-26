Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E42357D7EFA
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 10:54:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEF3785D;
	Thu, 26 Oct 2023 10:53:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEF3785D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698310446;
	bh=0yayrR/e/VzpH6gwLhZYEjLn8yIhTgOPwrMZZjyxpiI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qnAR/CsPBe8sK6FworRK9bGitWnVKQdGiJzd0bp22HCmNHtk9h97u700QMiJ/CvrB
	 yxMvGPrjwhWT4SwqHlmeYdM3rMvyczJORvytZKlUDU2q7SBIrF0yvf6RwF8ZyNaSEg
	 T4X9zu1wotdItsP8+ks8ewhrmk+xy+utLzc0BE9w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60F03F8028D; Thu, 26 Oct 2023 10:52:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9D54F8055A;
	Thu, 26 Oct 2023 10:52:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83199F8055B; Thu, 26 Oct 2023 10:52:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D30D1F8028D
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 10:52:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D30D1F8028D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=C/PPWzDJ
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39Q7N5xj015496;
	Thu, 26 Oct 2023 03:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=u+0Mr4Qw2FfbSng
	3Rkv4tw9nwtQ4ir/GVU/Frkaz6kk=; b=C/PPWzDJqmE92NTm04Jfr68s6TJRYTy
	YHMnxp28/UPUlk2ji80fmVPNSxZ1HFyP7sad0xrWK4JmfP51TS9lI27sC4twteN1
	hxUMdmOs09i2KdstRHuMNRPQZOeFmtK2dfNtqyhZTNcMluWk/B3l8qjSyOe1QJ8l
	mbsVYCi3yuurMV+iePnRO15hxeero3BchpmBcL20G/nR60Qy62bZqdAgOqM9mS/F
	TdzlgdwfvGdi0c3H4NIM5LL+z3wcwZ0cGGWgwjCAbvRp0ESrIKWSi6k343ZpEsOQ
	ktyAlBSLg82nJw7HSZLb4iSrJlrJZaGYfwu4qREfzljYTOVKgc8O/2A==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3tvc1x8k3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Oct 2023 03:52:20 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 26 Oct
 2023 09:52:17 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Thu, 26 Oct 2023 09:52:17 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 561632A1;
	Thu, 26 Oct 2023 08:52:17 +0000 (UTC)
Date: Thu, 26 Oct 2023 08:52:17 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "Lars-Peter
 Clausen" <lars@metafoo.de>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami
	<bgoswami@quicinc.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Sylwester Nawrocki
	<s.nawrocki@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        "Jonathan Hunter" <jonathanh@nvidia.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <linux-tegra@vger.kernel.org>
Subject: Re: [RFT PATCH 10/17] ASoC: codecs: wm8994: Handle component name
 prefix
Message-ID: <20231026085217.GZ103419@ediswmail.ad.cirrus.com>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
 <20231023095428.166563-11-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231023095428.166563-11-krzysztof.kozlowski@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: Liu2MMO-3sh9BD2L_f1gB2kiZaetIdZS
X-Proofpoint-ORIG-GUID: Liu2MMO-3sh9BD2L_f1gB2kiZaetIdZS
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 46PO5MSPTIPMBKOOWTBGV2WZAVRDJI3V
X-Message-ID-Hash: 46PO5MSPTIPMBKOOWTBGV2WZAVRDJI3V
X-MailFrom: prvs=566375e2f7=ckeepax@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/46PO5MSPTIPMBKOOWTBGV2WZAVRDJI3V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Oct 23, 2023 at 11:54:21AM +0200, Krzysztof Kozlowski wrote:
> Use snd_soc_dapm_widget_name_cmp() helper when comparing widget names,
> to include also the component's name prefix.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
