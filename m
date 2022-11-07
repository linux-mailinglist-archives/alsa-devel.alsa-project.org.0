Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 727F061F000
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 11:11:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAAAB1E0;
	Mon,  7 Nov 2022 11:10:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAAAB1E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667815880;
	bh=EVsUDrhylFai08uDMeK0lu+wEAYcOOxk9y34A0yc6t0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LDfXMHQgOaE+hU5ENN8sRjg9ppP1hKJQodTfpV8AmcsAPlkowsJ7kK4B4OGTbi00F
	 0B+zfRLJNkWSJ0Et6rBYwfU3EfFy5QVmug3xmQ+xdfpxWWq7oFGdqVEcnktCSZmjTr
	 4vVvXVR/UNKOTRLN6PALdf0taZmn6e2DsHqFlCjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EFEFF800AE;
	Mon,  7 Nov 2022 11:10:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0D17F8025A; Mon,  7 Nov 2022 11:10:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D264F800AE
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 11:10:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D264F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="IFHKftRT"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A75cAPq015477; Mon, 7 Nov 2022 04:10:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=W+CLnYPyUu0FQxpvhbNOyp8OvpfWBZPtCzOY3DXt5S0=;
 b=IFHKftRT5f4U5aIzBHn7DWcUpZ1U5L1skecCIwns7A9Fq3Y7y4dXxRV2xhuI9wy9dzQY
 4ecqkg4qxOq3tqbuPrEVG1LSc2s0YMD9IrX/wCh1MgJ/koTm5IEm/s/jTzq0h3DVnREl
 F+sZRLA/3Mn+zfvRv3rLEn2OfDXOeIx4h3W+j5F4M5zDdhRamMnWmT+WuUGnIazi4wN3
 xe7kh2/+w452X95wDabk5EYqfmCGJ2FNHNQ5Pj6688vvpi2Az6ccKrSHO+mF8LWabJTp
 YAzMuAzwa5D/pkueqcBOwgZT9KAcNXCIsRuvA9gw/9xNKh90U583FRzTUBJioeuS4mwu qQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3knn81j2mt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Nov 2022 04:10:13 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.15; Mon, 7 Nov
 2022 04:10:11 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.15 via
 Frontend Transport; Mon, 7 Nov 2022 04:10:11 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F0A55468;
 Mon,  7 Nov 2022 10:10:10 +0000 (UTC)
Date: Mon, 7 Nov 2022 10:10:10 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Chancel Liu <chancel.liu@nxp.com>
Subject: Re: [PATCH] ASoC: wm8962: Wait for updated value of WM8962_CLOCKING1
 register
Message-ID: <20221107101010.GD10437@ediswmail.ad.cirrus.com>
References: <20221107063818.2468193-1-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221107063818.2468193-1-chancel.liu@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: pBotZGE4lalnutjQ3nXDuy48PLdn9Riu
X-Proofpoint-GUID: pBotZGE4lalnutjQ3nXDuy48PLdn9Riu
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, xiaolei.wang@windriver.com, cmo@melexis.com,
 patches@opensource.cirrus.com, shengjiu.wang@nxp.com, tiwai@suse.com,
 chi.minghao@zte.com.cn, lgirdwood@gmail.com, broonie@kernel.org,
 u.kleine-koenig@pengutronix.de, ojeda@kernel.org, steve@sk2.org,
 luca.ceresoli@bootlin.com, linux-kernel@vger.kernel.org
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

On Mon, Nov 07, 2022 at 02:38:18PM +0800, Chancel Liu wrote:
> DSPCLK_DIV field in WM8962_CLOCKING1 register is used to generate
> correct frequency of LRCLK and BCLK. Sometimes the read-only value
> can't be updated timely after enabling SYSCLK. This results in wrong
> calculation values. Delay is introduced here to wait for newest value
> from register. The time of the delay should be at least 500~1000us
> according to test.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  sound/soc/codecs/wm8962.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
> index b4b4355c6728..563843565f68 100644
> --- a/sound/soc/codecs/wm8962.c
> +++ b/sound/soc/codecs/wm8962.c
> @@ -2503,6 +2503,14 @@ static void wm8962_configure_bclk(struct snd_soc_component *component)
>  		snd_soc_component_update_bits(component, WM8962_CLOCKING2,
>  				WM8962_SYSCLK_ENA_MASK, WM8962_SYSCLK_ENA);
>  
> +	/* DSPCLK_DIV field in WM8962_CLOCKING1 register is used to generate
> +	 * correct frequency of LRCLK and BCLK. Sometimes the read-only value
> +	 * can't be updated timely after enabling SYSCLK. This results in wrong
> +	 * calculation values. Delay is introduced here to wait for newest
> +	 * value from register. The time of the delay should be at least
> +	 * 500~1000us according to test.
> +	 */
> +	msleep(1);

This looks reasonable but for a 1ms delay we should really be
using usleep_range rather than msleep.

Thanks,
Charles
