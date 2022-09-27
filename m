Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E675A5EC1BD
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 13:43:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 965DB1F1;
	Tue, 27 Sep 2022 13:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 965DB1F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664279010;
	bh=YDWbLs3m5MTKfJlAMSOmtjPdyOBF/f5JkAhDjKyAKEM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vEPESHhMxVtkytu0Qg7xOJAT1Rl9UsHJHWt0i8E+QjaOHGf8bxxu6uQMg0N1ktNKU
	 fiqfzQDaJKipVzg4tIpyK36w0ZHaAbMNA4jhwStVLGDnau6z/dbzJDNiABEZvnsf1k
	 pxqundSjqaNVc9pqtJkAsAJgW12U97AJealk3VBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4C21F80496;
	Tue, 27 Sep 2022 13:42:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9EDAF80166; Tue, 27 Sep 2022 13:42:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30016F80166
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 13:42:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30016F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com
 header.b="1qlHSaAM"
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28RAmGKA018243;
 Tue, 27 Sep 2022 13:42:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=qM9BvEOkGGUoy3w55y3w7QUBXL8GafqVVms0iRqWss0=;
 b=1qlHSaAMrbmapL3s12k5+7GrxvXwTW6KQ+9k5s+b7UP+26VbGYXxhDzf/sIUKqx/MKQ2
 IsXYPKiBa+xYsEXoulPSOKEbcAkOvxBOVwnwcZp124q1NjwqfcfKuJoDPKQkl8OGf2cz
 tDkmB856Mtlq65J7/W4QdlvO84x7AjWUop+er2JLFU1dkjdJuk0ErrQtqZz4S1XqW2CY
 ZLbCLfkW8xktfCXFcy4M3N2OQIF1UzMEXNhzuEplzzPLdYWZ2VymiJDNFZDaCzvfkKQF
 xY8czZmd6US/Lls0/OKPhEd/2j4Qhnnjd9XTmg+loOc+w0vv4vPrUNQk/oo+ubCSaeA/ LQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsrsjj09n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 13:42:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB56310002A;
 Tue, 27 Sep 2022 13:42:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1860121F0B7;
 Tue, 27 Sep 2022 13:42:24 +0200 (CEST)
Received: from [10.201.20.178] (10.75.127.117) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 13:42:23 +0200
Message-ID: <0e8d3e9a-97cb-3ce1-4778-600eda54ee9e@foss.st.com>
Date: Tue, 27 Sep 2022 13:42:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Linux-stm32] [PATCH -next 2/2] ASoC: stm32: spdifrx: Fix PM
 disable depth imbalance in stm32_spdifrx_probe
Content-Language: en-US
To: Zhang Qilong <zhangqilong3@huawei.com>, <arnaud.pouliquen@foss.st.com>
References: <20220926141132.124245-1-zhangqilong3@huawei.com>
 <20220926141132.124245-3-zhangqilong3@huawei.com>
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <20220926141132.124245-3-zhangqilong3@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.117]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
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

On 9/26/22 16:11, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by moving
> pm_runtime_enable to the endding of stm32_spdifrx_probe.
> 
> Fixes:ac5e3efd55868 ("ASoC: stm32: spdifrx: add pm_runtime support")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>   sound/soc/stm/stm32_spdifrx.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
> index 0f7146756717..d399c906bb92 100644
> --- a/sound/soc/stm/stm32_spdifrx.c
> +++ b/sound/soc/stm/stm32_spdifrx.c
> @@ -1002,8 +1002,6 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
>   	udelay(2);
>   	reset_control_deassert(rst);
>   
> -	pm_runtime_enable(&pdev->dev);
> -
>   	pcm_config = &stm32_spdifrx_pcm_config;
>   	ret = snd_dmaengine_pcm_register(&pdev->dev, pcm_config, 0);
>   	if (ret)
> @@ -1036,6 +1034,8 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
>   			FIELD_GET(SPDIFRX_VERR_MIN_MASK, ver));
>   	}
>   
> +	pm_runtime_enable(&pdev->dev);
> +
>   	return ret;
>   
>   error:
