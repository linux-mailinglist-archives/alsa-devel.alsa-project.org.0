Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3D4577F7E
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jul 2022 12:19:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1B6D16F4;
	Mon, 18 Jul 2022 12:18:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1B6D16F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658139557;
	bh=NqDfGSQIwvFSjzgrYAGByCaeplVhlWtYJpfZY8jwLRI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ATqDbZbaKo47uRQNuVBDpC8rGYU4sL+qQIjeqsKLoqmTfjJNpf777aHbOgr0oCCef
	 pmGFTQ4OV5jYiR7TGpgygdJbfNInnJrOpmapyh73qlM3K6NqwaN9/utp1uNZ9aIwe4
	 ZjahfqTEI9kSLXAAvTnh/V75eVDh+FkQK2jcrP0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4529EF8050F;
	Mon, 18 Jul 2022 12:18:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75656F80508; Mon, 18 Jul 2022 12:18:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EF43F800F5
 for <alsa-devel@alsa-project.org>; Mon, 18 Jul 2022 12:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EF43F800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="PoeIVvfe"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26I7SxkQ019843;
 Mon, 18 Jul 2022 05:18:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=FcqKSMh01G3bHfXa4jf3Yc87cDilMm6NfbL0ZOGAjVg=;
 b=PoeIVvfeL+hPTz8N/G3c+9bMgIkByVsWINJ5EkWCYgD/h3ucj6YicTqgHXSK6mQ4Ikjq
 gH0iv1gKy0BREXUCW+L3EMb3W06jsDy7Tgt/PiJFF8GNrbGe3WkwGPDB3COuZ58ON6xn
 YKTMuVaaT7+gH/FdcBsft7jTra8EdZq1y0qG4VFgDv1nxWIwDI2k9vPIa6tTijWvqmW9
 K3hbobvZwAXnjqjCl3UOvxKKOfbCO2m8H0mJgo0+M+va55SESu90sRpXfCNjWuNw4cWP
 PJYz32F0qz/KqlS0lF48Vxmay6HNdLj+5zjqwsRs86LezrurQ15LegzbxdsfuUGEIHAh 7g== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3hbsrphr9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jul 2022 05:18:06 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Mon, 18 Jul
 2022 05:18:04 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1118.9 via Frontend Transport; Mon, 18 Jul 2022 05:18:04 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A2E89477;
 Mon, 18 Jul 2022 10:18:04 +0000 (UTC)
Date: Mon, 18 Jul 2022 10:18:04 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Zhu Ning <zhuning0077@gmail.com>
Subject: Re: [PATCH v1 1/2] ASoC: codecs: add support for ES8326
Message-ID: <20220718101804.GA106016@ediswmail.ad.cirrus.com>
References: <20220718053237.20146-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220718053237.20146-1-zhuning0077@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: JlbEtdTyCZBR9pJpxpkYU0Urvxh6om4F
X-Proofpoint-GUID: JlbEtdTyCZBR9pJpxpkYU0Urvxh6om4F
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, broonie@kernel.org,
 Zhu Ning <zhuning@everest-semi.com>, David Yang <yangxiaohua@everest-semi.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Jul 18, 2022 at 01:32:36PM +0800, Zhu Ning wrote:
> The ES8326 codec is not compatible with ES8316 and requires a dedicated driver.
> 
> Signed-off-by: David Yang <yangxiaohua@everest-semi.com>
> Signed-off-by: Zhu Ning <zhuning@everest-semi.com>
> 
> -----
> +static const struct snd_soc_component_driver soc_component_dev_es8326 = {
> +	.probe = es8326_probe,
> +	.remove = es8326_remove,
> +	.resume = es8326_resume,
> +	.suspend = es8326_suspend,
> +	.set_bias_level = es8326_set_bias_level,
> +	.set_jack = es8326_set_jack,
> +
> +	.dapm_widgets = es8326_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(es8326_dapm_widgets),
> +	.dapm_routes = es8326_dapm_routes,
> +	.num_dapm_routes = ARRAY_SIZE(es8326_dapm_routes),
> +	.controls = es8326_snd_controls,
> +	.num_controls = ARRAY_SIZE(es8326_snd_controls),
> +};

As this device sits behind an I2S link you need the endianness
flag here to specify that the endian will be lost over the bus.

Thanks,
Charles
