Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA3E2A2C3E
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 15:03:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFB81170A;
	Mon,  2 Nov 2020 15:02:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFB81170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604325817;
	bh=7Ohm+i94CyHrsbtz1AvHD7wdVoimYNKt5El0LPVZWvI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Btj3nCrEz2N44rFfGUNvxpjhg1YCQNWilE39iVLqTfe52eMYcCrq0sTaAL+LrMTZX
	 HD/E0WBLOqosS4GbQKGLXfwP388a0ONmcCEATOgkCPDUOjGL6PVG9YxrkvvoOGeFLb
	 OL/hK3jZsRJdMGv36wTdJEUnevMivPgCP6idwETs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 456E3F80083;
	Mon,  2 Nov 2020 15:02:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E3E0F80232; Mon,  2 Nov 2020 15:02:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_78,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB21BF80083
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 15:01:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB21BF80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="CHgJADqg"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A2E1qgr086965;
 Mon, 2 Nov 2020 08:01:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604325712;
 bh=kQz4zXsRQht99vb39ccr75+jyFACg/Or7s3atKvkrVk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=CHgJADqgkjXbzbhbDzLRYHM9jVl456Bd6FvwzQNuXWHhb7iIx2j6jOHaOqLMVSjB3
 55GsdgKoFoa/Iz7Q0KhfOEBuJzlw4sjTtlrr1AFfgM6a3/44g9n3tJ+7aAdglxYU9V
 VdwImiwUrkIyddsFfM8WryfPKeLLz0PTv3qCb5ME=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A2E1q0j047631
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 2 Nov 2020 08:01:52 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 2 Nov
 2020 08:01:08 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 2 Nov 2020 08:01:08 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A2E164N082717;
 Mon, 2 Nov 2020 08:01:07 -0600
Subject: Re: [PATCH] ASoC: ti: davinci-mcasp: remove always zero of
 davinci_mcasp_get_dt_params
To: Zhang Qilong <zhangqilong3@huawei.com>, <perex@perex.cz>, <tiwai@suse.com>
References: <20201102103428.32678-1-zhangqilong3@huawei.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <4b6487dc-5b23-11bc-3c3f-a38ce182f149@ti.com>
Date: Mon, 2 Nov 2020 16:01:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201102103428.32678-1-zhangqilong3@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, lgirdwood@gmail.com
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

Hi,

On 02/11/2020 12.34, Zhang Qilong wrote:
> davinci_mcasp_get_dt_params alway return zero, and its return value
> could be ignored by the caller. So make it 'void' type to avoid the
> check its return value.

Thanks for updating the patch!

Acked-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

> 
> Fixes: 764958f2b5239 ("ASoC: ti: davinci-mcasp: Support for auxclk-fs-ratio")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  sound/soc/ti/davinci-mcasp.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index 4b46dd827f3f..63c492862383 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -2112,20 +2112,18 @@ static inline int davinci_mcasp_init_gpiochip(struct davinci_mcasp *mcasp)
>  }
>  #endif /* CONFIG_GPIOLIB */
>  
> -static int davinci_mcasp_get_dt_params(struct davinci_mcasp *mcasp)
> +static void davinci_mcasp_get_dt_params(struct davinci_mcasp *mcasp)
>  {
>  	struct device_node *np = mcasp->dev->of_node;
>  	int ret;
>  	u32 val;
>  
>  	if (!np)
> -		return 0;
> +		return;
>  
>  	ret = of_property_read_u32(np, "auxclk-fs-ratio", &val);
>  	if (ret >= 0)
>  		mcasp->auxclk_fs_ratio = val;
> -
> -	return 0;
>  }
>  
>  static int davinci_mcasp_probe(struct platform_device *pdev)
> @@ -2361,9 +2359,7 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err;
>  
> -	ret = davinci_mcasp_get_dt_params(mcasp);
> -	if (ret)
> -		return -EINVAL;
> +	davinci_mcasp_get_dt_params(mcasp);
>  
>  	ret = devm_snd_soc_register_component(&pdev->dev,
>  					&davinci_mcasp_component,
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
