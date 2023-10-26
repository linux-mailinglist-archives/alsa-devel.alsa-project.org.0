Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1407D7EFB
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 10:54:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1104C84A;
	Thu, 26 Oct 2023 10:53:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1104C84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698310450;
	bh=kvsNmL0T+1YonRXVjk5vwBhEw8e2FCcjj3V8KIIhCMc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WGy9BwYdggaPkTtDZzFXogAJbM+x68FGnqnwkWpOx3edwQq4I8iRTOG1gMkYAg0A2
	 RkGIgS8Xgwm0s2UZp9XqvC8vv/GbpSke7hetnJesloXhsLxTSnsxJy9MoljyXMxvMf
	 T7yh9XfIbjm/rja10fn412FZ5nfXfii3ScId13rM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C59C5F8057B; Thu, 26 Oct 2023 10:52:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 480E2F8055A;
	Thu, 26 Oct 2023 10:52:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37DA5F80578; Thu, 26 Oct 2023 10:52:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25F0EF8055A
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 10:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25F0EF8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=mKc0MnVa
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39Q8qX1i024935;
	Thu, 26 Oct 2023 03:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=meY/NcqksPwsYaV
	rdoWv0mO5Ml8Ah9L0WADpYCb7aYg=; b=mKc0MnVaC4xqxuCKjP7yD5+WRB24sfb
	ldlb8bcXWYYk9iAeh/Y1UeiRHILgKuT2buo5XuFWVQnFU6bLrUBjX058bVSmh+rf
	GbXpBQZvKRUlbT9lOu27OaB/Czxmb7CcOLJ5UYyBz33NQaKrIhoImfrbCIZvHCk6
	iXczyPkbOHKcduduiYLO+iUG/32Fj00+xaTatI5PjD59EYUvCmqXRRFp7F4PDKNy
	aQhyWbydkHqFd1KOm2Js0GeeWc7gzyLMyb+TNjlxpi3bRUj/Vu9H+WO5ESl/eGuf
	VR5eSuN3tVJIbzp7CjXtVwMyWr8Bc0XiM6lTUEJr8RmfNv09UWl4siw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3tvb2j6dra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Oct 2023 03:52:33 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 26 Oct
 2023 09:52:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Thu, 26 Oct 2023 09:52:32 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1372BB38;
	Thu, 26 Oct 2023 08:52:32 +0000 (UTC)
Date: Thu, 26 Oct 2023 08:52:32 +0000
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
Subject: Re: [RFT PATCH 11/17] ASoC: codecs: wm8995: Handle component name
 prefix
Message-ID: <20231026085232.GA103419@ediswmail.ad.cirrus.com>
References: <20231023095428.166563-1-krzysztof.kozlowski@linaro.org>
 <20231023095428.166563-12-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231023095428.166563-12-krzysztof.kozlowski@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: R6fqKvCV_h-KsNmgGlanxb0Z_43awYVT
X-Proofpoint-ORIG-GUID: R6fqKvCV_h-KsNmgGlanxb0Z_43awYVT
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 6JFSTGF52YOMURECGIMPXBH52UP3CRHD
X-Message-ID-Hash: 6JFSTGF52YOMURECGIMPXBH52UP3CRHD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6JFSTGF52YOMURECGIMPXBH52UP3CRHD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Oct 23, 2023 at 11:54:22AM +0200, Krzysztof Kozlowski wrote:
> Use snd_soc_dapm_widget_name_cmp() helper when comparing widget names,
> to include also the component's name prefix.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
