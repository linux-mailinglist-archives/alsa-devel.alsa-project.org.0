Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 730CB5EC1C2
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 13:45:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E89C847;
	Tue, 27 Sep 2022 13:44:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E89C847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664279130;
	bh=5WdIsxmCWRJwqo4YhAK/4GYp7GWuq6lmPmfFG4f+kuc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ivE28amn9CYXlDPua+5qhwa/D7LyOz+ayrdGL0n6MQLBNS93yE0sTRznPp3PD1C3/
	 crDDfwqsLo0uy9rwZKpuBAO2T7pbXgYX30RGU0Nadf61EVKhyioGGaSjT0JURKt4Tx
	 zGAENNUusHBxhoQmKdyOMEyGvSjWb57m3AbrBNbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 897EAF80496;
	Tue, 27 Sep 2022 13:44:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD3FCF8025E; Tue, 27 Sep 2022 13:44:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DEECF800AA
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 13:44:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DEECF800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="HV23WuJm"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28RAmS6A011960;
 Tue, 27 Sep 2022 13:44:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=YAyMfPNwBAUPJtosDX78dKoVrqN/KrbuzycZib6rBLQ=;
 b=HV23WuJmwLZivRTgqcr7ZzBq6RYmIEAAdIONpM6Io910pNR1cMEt8G/lo5kNY2YIihcS
 HJrdaQwDrAQc6LbiikmqLO3rsMJQAiQw7tUG0PkHosApikAGWdt2vJqMsoqMP5y8WM+z
 NtwBMbj/pOdeL5a+Wqtrj/TsHfQmDWlUJyjNfyyCYpnJHk8HmSJLHZog+hUnWh5rBvVI
 dLzyW5UdcWzA0Woat/FLgTIDgInfeTI5NUODG+kQVnsTujcAocf54zGIfdyA4uZ/aMCn
 Er7ZjB8CSwBhue+H65WudT2lJXsO6SjdzcVaxQJus0WD3vwVmoXp2EZtHNHKL5xnAdDM 0w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsq1b2cj6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 13:44:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7988710002A;
 Tue, 27 Sep 2022 13:44:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 75AF521F0BF;
 Tue, 27 Sep 2022 13:44:24 +0200 (CEST)
Received: from [10.201.20.178] (10.75.127.44) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 13:44:23 +0200
Message-ID: <8ed6d452-2999-80b5-5e21-9b7b486777ed@foss.st.com>
Date: Tue, 27 Sep 2022 13:44:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Linux-stm32] [PATCH -next 1/2] ASoC: stm32: dfsdm: Fix PM
 disable depth imbalance in stm32_adfsdm_probe
Content-Language: en-US
To: Zhang Qilong <zhangqilong3@huawei.com>, <arnaud.pouliquen@foss.st.com>
References: <20220926141132.124245-1-zhangqilong3@huawei.com>
 <20220926141132.124245-2-zhangqilong3@huawei.com>
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20220926141132.124245-2-zhangqilong3@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_03,2022-09-27_01,2022-06-22_01
Cc: alsa-devel@alsa-project.org
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

Hi Zhang,

Thanks.You can add my:
Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>

BRs

On 9/26/22 16:11, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by moving
> pm_runtime_enable to the endding of stm32_adfsdm_probe.
> 
> Fixes:98e500a12f934 ("ASoC: stm32: dfsdm: add pm_runtime support for audio")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>   sound/soc/stm/stm32_adfsdm.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
> index 04f2912e1418..643fc8a17018 100644
> --- a/sound/soc/stm/stm32_adfsdm.c
> +++ b/sound/soc/stm/stm32_adfsdm.c
> @@ -335,8 +335,6 @@ static int stm32_adfsdm_probe(struct platform_device *pdev)
>   
>   	dev_set_drvdata(&pdev->dev, priv);
>   
> -	pm_runtime_enable(&pdev->dev);
> -
>   	ret = devm_snd_soc_register_component(&pdev->dev,
>   					      &stm32_adfsdm_dai_component,
>   					      &priv->dai_drv, 1);
> @@ -366,9 +364,13 @@ static int stm32_adfsdm_probe(struct platform_device *pdev)
>   #endif
>   
>   	ret = snd_soc_add_component(component, NULL, 0);
> -	if (ret < 0)
> +	if (ret < 0) {
>   		dev_err(&pdev->dev, "%s: Failed to register PCM platform\n",
>   			__func__);
> +		return ret;
> +	}
> +
> +	pm_runtime_enable(&pdev->dev);
>   
>   	return ret;
>   }
