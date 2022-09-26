Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B035EA68B
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Sep 2022 14:53:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA4D5204;
	Mon, 26 Sep 2022 14:52:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA4D5204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664196823;
	bh=DCOa5K1JmokS2FlunWEZ+qqd2HmApRowTmvbfY9V6lY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EAehv5b/3D1b6eH+Du4AULbqCROCPY0v5SkUjLKMN6bX0VgPyLc8f+X3ZjFzi+nWw
	 hFrqIFwbv6wRC6kLFsGL+wvG94jLBaQfYHlYTKNVIOmO0O9U1UDbTiRNK/vtu/S1JZ
	 yi7vfnQZ12vMgrL75YaIY3vDHv3oFTjxvCNM3y8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E580F80134;
	Mon, 26 Sep 2022 14:52:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA23EF8027D; Mon, 26 Sep 2022 14:52:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C913F8011C
 for <alsa-devel@alsa-project.org>; Mon, 26 Sep 2022 14:52:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C913F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="4KNVEim7"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QAYwJe004276;
 Mon, 26 Sep 2022 14:52:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=O+IAOFImKzcJefc0+0q4nQ3kA464dZfhgjF2aT9XMP8=;
 b=4KNVEim7prR3colcv2mZHDRNkbyWAdeYvIUUPrDIxe+nvo+swDbV8f6KX8Fcps6U+LaW
 T1ElM3PId+1i8Z0vauBk9U7eJ0Od9tHj0h8QtpWnF5PqW0pscPOoJwlC1L5D0VY1cDAF
 LUh4gN+QpsNHtVwFlXXVgxVqfBMIZpkmR2LUG008jooGQT19LU09M0yOMdTDFkQY/m2J
 UmK6p06gghIDO93Tti74lcNxmJO9dec3SljeJVi2/atcaFxmYagtmIdZObQhPsuRjsN0
 Ga94JRXqFjR3OPWclqgP+liVBfxIek4qKHQN42MhQJFhEkH+87Fp/jAYN2PJcPDkVCPc vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsrsjbjkq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 14:52:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4E36B10002A;
 Mon, 26 Sep 2022 14:52:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 099E422A6D5;
 Mon, 26 Sep 2022 14:52:40 +0200 (CEST)
Received: from [10.211.6.21] (10.75.127.49) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 14:52:36 +0200
Message-ID: <b1cd2763-8914-7bce-8f91-666bae219bf4@foss.st.com>
Date: Mon, 26 Sep 2022 14:52:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH -next] ASoC: stm: Fix PM disable depth imbalance in
 stm32_i2s_probe
Content-Language: en-US
To: Zhang Qilong <zhangqilong3@huawei.com>, <olivier.moysan@foss.st.com>,
 <perex@perex.cz>, <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>
References: <20220926091439.103839-1-zhangqilong3@huawei.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20220926091439.103839-1-zhangqilong3@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_08,2022-09-22_02,2022-06-22_01
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com
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

Hello Zhang,

On 9/26/22 11:14, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context.
> 
> Fixes:efc162cbd480f ("ASoC: stm: Use dev_err_probe() helper")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  sound/soc/stm/stm32_i2s.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
> index 6aafe793eec4..5a717443b105 100644
> --- a/sound/soc/stm/stm32_i2s.c
> +++ b/sound/soc/stm/stm32_i2s.c
> @@ -1139,12 +1139,15 @@ static int stm32_i2s_probe(struct platform_device *pdev)
>  	pm_runtime_enable(&pdev->dev);
>  
>  	ret = snd_dmaengine_pcm_register(&pdev->dev, &stm32_i2s_pcm_config, 0);
> -	if (ret)
> +	if (ret) {
> +		pm_runtime_disable(&pdev->dev);
>  		return dev_err_probe(&pdev->dev, ret, "PCM DMA register error\n");
> +	}
>  
>  	ret = snd_soc_register_component(&pdev->dev, &stm32_i2s_component,
>  					 i2s->dai_drv, 1);
>  	if (ret) {
> +		pm_runtime_disable(&pdev->dev);
>  		snd_dmaengine_pcm_unregister(&pdev->dev);
>  		return ret;
>  	}

Seems that there the error has been introduced in this commit:
32a956a1fadf ("ASoC: stm32: i2s: add pm_runtime support")
The pm_runtime_enable should be at the end of the stm32_i2s_probe as done here:
https://github.com/STMicroelectronics/linux/blob/v5.15-stm32mp/sound/soc/stm/stm32_i2s.c#L1200

Please, could you update your patch in this way?
With also an update of the "Fixes:" reference in the commit message

Thanks,
Arnaud
