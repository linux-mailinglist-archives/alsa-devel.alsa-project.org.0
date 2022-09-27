Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D53F5EC1D0
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 13:47:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDB84847;
	Tue, 27 Sep 2022 13:46:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDB84847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664279251;
	bh=a1gWJ2j9kULG3b5JB7gSeYvTSL4NVMjDRRM0C57JtBI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KiRqxC1qxHhEE80ZGnG9v/SkKJdzhuV/HPaVbessO+NF03DnLjt/L4QELLQAxtJ08
	 MPEvCwoHV853Vf0VSmv6VVOX/sB98452mZur6PYRaOcdMjKiRYRqLncI+vAQebLbhB
	 15liQu/z5heFADnYU5XGlBx+3M3kKS3Mrncn8tFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B051F80166;
	Tue, 27 Sep 2022 13:46:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A39FAF80166; Tue, 27 Sep 2022 13:46:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ED01F80166
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 13:46:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ED01F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="kqa4Jbcq"
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28RAmFNK018528;
 Tue, 27 Sep 2022 13:46:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=p7nSaAy+cZg+KQL/F8o0vNcZWrBXnchWV1z54NpHiRs=;
 b=kqa4JbcqYBk1y8Jxh8DSdn60BBe9AZWRn+G6Dt698eW7nvSB3cJV/Rknpa+WCrZWpwWs
 RSaNSFnuHdnFtVBGHJJaNgD705V8hpZoapaKb1l4qVlUliNlTcF7IyrJrz384h3gecfL
 3Ololazctb0vYn+LiXPKVwIPCNRhFaOwgSPG6rBbc/BrlLy+4DBTNTdHfZ6xPldfWDDF
 2AQYqZgO7/QALgi/sv/huoIvEfwuFBW1AzZEswLCWN+sTGBlUE4aH5OYGJo4Discly61
 PozCc7hV3efjCtKHPXysUpmYeE2KGUJ21QrkoDAJX5dfBVzoWFe0HYyI/Zzy1RGqaQG8 kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jss8298k2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 13:46:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 17DAB10002A;
 Tue, 27 Sep 2022 13:46:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 121E321B523;
 Tue, 27 Sep 2022 13:46:27 +0200 (CEST)
Received: from [10.201.20.178] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 13:46:26 +0200
Message-ID: <42001826-e4aa-7d6a-af1e-b2bf935f3d38@foss.st.com>
Date: Tue, 27 Sep 2022 13:46:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Linux-stm32] [PATCH v2 -next] ASoC: stm: Fix PM disable depth
 imbalance in stm32_i2s_probe
Content-Language: en-US
To: Zhang Qilong <zhangqilong3@huawei.com>, <arnaud.pouliquen@foss.st.com>
References: <20220926134155.121427-1-zhangqilong3@huawei.com>
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20220926134155.121427-1-zhangqilong3@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_03,2022-09-27_01,2022-06-22_01
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

Hi Zhang,

Thanks.You can add my:
Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>

BRs

On 9/26/22 15:41, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by moving
> pm_runtime_enable to the endding of stm32_i2s_probe.
> 
> Fixes:32a956a1fadf ("ASoC: stm32: i2s: add pm_runtime support")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
> v2:
> - Move pm_runtime_enable to the endding of stm32_i2s_probe
>    and correct fixes commit.
> ---
>   sound/soc/stm/stm32_i2s.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
> index 6aafe793eec4..ce7f6942308f 100644
> --- a/sound/soc/stm/stm32_i2s.c
> +++ b/sound/soc/stm/stm32_i2s.c
> @@ -1136,8 +1136,6 @@ static int stm32_i2s_probe(struct platform_device *pdev)
>   		return dev_err_probe(&pdev->dev, PTR_ERR(i2s->regmap),
>   				     "Regmap init error\n");
>   
> -	pm_runtime_enable(&pdev->dev);
> -
>   	ret = snd_dmaengine_pcm_register(&pdev->dev, &stm32_i2s_pcm_config, 0);
>   	if (ret)
>   		return dev_err_probe(&pdev->dev, ret, "PCM DMA register error\n");
> @@ -1180,6 +1178,8 @@ static int stm32_i2s_probe(struct platform_device *pdev)
>   			FIELD_GET(I2S_VERR_MIN_MASK, val));
>   	}
>   
> +	pm_runtime_enable(&pdev->dev);
> +
>   	return ret;
>   
>   error:
