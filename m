Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6715EF1CE
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 11:22:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EA06846;
	Thu, 29 Sep 2022 11:21:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EA06846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664443329;
	bh=qNxc4fxrTyyAnbuPOw8wcVV5Q454MJjdEN55GkFIyls=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OSVizzpSgRls1w72Vcaq6BoPF9ttvNfyh4GYzeDDqkqjbS3FGFpTfTu0JCJqFc3GS
	 JpoeQRJFuglS/hjfMimAE9rKl4Lvn9T/0XqGNCU6huNTGeZVFzarTP7QhizGfIb758
	 LfBZK0hsqJtjCQFWjCaL0BhNlo/chnpg3dnMRhdo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD58EF803DD;
	Thu, 29 Sep 2022 11:21:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1408F8023A; Thu, 29 Sep 2022 11:21:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DDDEF800AA
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 11:21:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DDDEF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="j8I/iOYy"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28T8oRFG030927;
 Thu, 29 Sep 2022 04:21:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=2XKTzy2jknaTB4QMzyr4cI7CofHNh+JKGC2Ylwooupg=;
 b=j8I/iOYyRifLp52uLg1necVtJbUro7vKilysWM14jA9QFbSsnodDEcBwZM7OKdfycmW7
 8LLnuHGNtBNsF6eAskTD3/ZUml6jZj1ZrUaZDqjNBgpzgbTj4LxCrOigAiSOs9e9Rq1F
 Kquc3Wf6sev3h60elJuJpYe4tnYBLJIZtU3Wk/gsTmQBuLn4DFSC2xAKtpkPiYK/sTyV
 pUfHyWlukIFQAC+MxISUsxalA4P2UWgWAktAHSpHnsKprxsCpCbQH+09DOC8zAWXMH8H
 LdwoRv+xXziS7XJJdiFgYYpMsKwTtdwBHlDxA9+kgpKmbZvIfs/rJMtZQwy7u6GUH2yM Og== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3jsxapp13w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Sep 2022 04:21:06 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Thu, 29 Sep
 2022 04:21:05 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.12 via
 Frontend Transport; Thu, 29 Sep 2022 04:21:05 -0500
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E9A822D4;
 Thu, 29 Sep 2022 09:21:04 +0000 (UTC)
Date: Thu, 29 Sep 2022 09:21:04 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Zhang Qilong <zhangqilong3@huawei.com>
Subject: Re: [PATCH -next 2/4] ASoC: wm5110: Fix PM disable depth imbalance
 in wm5110_probe
Message-ID: <20220929092104.GT92394@ediswmail.ad.cirrus.com>
References: <20220928160116.125020-1-zhangqilong3@huawei.com>
 <20220928160116.125020-3-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220928160116.125020-3-zhangqilong3@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: p9vNs_9FToHZQFgOxLP5dKnuYlDoCqW6
X-Proofpoint-GUID: p9vNs_9FToHZQFgOxLP5dKnuYlDoCqW6
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
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

On Thu, Sep 29, 2022 at 12:01:14AM +0800, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by moving
> pm_runtime_enable to the endding of wm5110_probe.
> 
> Fixes:5c6af635fd772 ("ASoC: wm5110: Add audio CODEC driver")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---

As Mark said please use maintainers and specifically if patching
the Wolfson/Cirrus CODECs please CC
patches@opensource.cirrus.com

>  sound/soc/codecs/wm5110.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
> index f3f4a10bf0f7..fc634c995834 100644
> --- a/sound/soc/codecs/wm5110.c
> +++ b/sound/soc/codecs/wm5110.c
> @@ -2457,9 +2457,6 @@ static int wm5110_probe(struct platform_device *pdev)
>  		regmap_update_bits(arizona->regmap, wm5110_digital_vu[i],
>  				   WM5110_DIG_VU, WM5110_DIG_VU);
>  
> -	pm_runtime_enable(&pdev->dev);
> -	pm_runtime_idle(&pdev->dev);
> -
>  	ret = arizona_request_irq(arizona, ARIZONA_IRQ_DSP_IRQ1,
>  				  "ADSP2 Compressed IRQ", wm5110_adsp2_irq,
>  				  wm5110);
> @@ -2492,6 +2489,9 @@ static int wm5110_probe(struct platform_device *pdev)
>  		goto err_spk_irqs;
>  	}
>  
> +	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_idle(&pdev->dev);
> +

I think it would be better to keep the pm_runtime enables before
the IRQ and component stuff. Both of those could start triggering
PM runtime events. We probably need to add an extra error path
here for disabling the pm_runtime.

Thanks,
Charles
