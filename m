Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F155C107696
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Nov 2019 18:40:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66D7B1836;
	Fri, 22 Nov 2019 18:39:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66D7B1836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574444429;
	bh=32ZTXPhsRs52Tx3LYCAfnckiOyzRujKM6VWROBn/jTs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=muYX3Suy9VgrelWGpEAAxlyvOPtK9QviZsL67cF+5Cvk1I/l7NKNHr5xt66tdcLv1
	 Sb399ACGXDlyi4qRnfS7Yee8x33c5szy+vvATvPW1dS7FTz8eAw7ri2J6tZaE1qfjh
	 KoL9BVv8Syz9ORRdqdzo2kIltkWW8oZVcoVs1Rac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CFACF80171;
	Fri, 22 Nov 2019 18:38:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A126EF80140; Fri, 22 Nov 2019 18:38:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF60EF80140
 for <alsa-devel@alsa-project.org>; Fri, 22 Nov 2019 18:38:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF60EF80140
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Nov 2019 09:38:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,230,1571727600"; d="scan'208";a="238682978"
Received: from sygreen1-mobl4.amr.corp.intel.com (HELO [10.252.195.68])
 ([10.252.195.68])
 by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2019 09:38:40 -0800
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
References: <1574415866-29715-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1574415866-29715-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7f4ccc51-7bdd-d1c6-605a-0b432485de73@linux.intel.com>
Date: Fri, 22 Nov 2019 09:33:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <1574415866-29715-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
Content-Language: en-US
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Akshu.Agrawal@amd.com, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [PATCH v12 2/6] ASoC: amd: Refactoring of DAI from
 DMA driver
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


>   static int acp3x_audio_probe(struct platform_device *pdev)
>   {
> -	int status;
>   	struct resource *res;
>   	struct i2s_dev_data *adata;
>   	unsigned int irqflags;
> +	int status, ret;
>   
>   	if (!pdev->dev.platform_data) {
>   		dev_err(&pdev->dev, "platform_data not retrieved\n");
> @@ -622,7 +426,7 @@ static int acp3x_audio_probe(struct platform_device *pdev)
>   
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	if (!res) {
> -		dev_err(&pdev->dev, "IORESOURCE_IRQ FAILED\n");
> +		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
>   		return -ENODEV;
>   	}
>   
> @@ -632,60 +436,64 @@ static int acp3x_audio_probe(struct platform_device *pdev)
>   
>   	adata->acp3x_base = devm_ioremap(&pdev->dev, res->start,
>   					 resource_size(res));
> +	if (!adata->acp3x_base)
> +		return -ENOMEM;
>   
>   	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
>   	if (!res) {
>   		dev_err(&pdev->dev, "IORESOURCE_IRQ FAILED\n");
> -		return -ENODEV;
> +		return -ENOMEM;

it's odd for a -ENOMEM code to returned for IRQs?

>   	}
>   
>   	adata->i2s_irq = res->start;
> -	adata->play_stream = NULL;
> -	adata->capture_stream = NULL;
>   
>   	dev_set_drvdata(&pdev->dev, adata);
>   	/* Initialize ACP */
>   	status = acp3x_init(adata->acp3x_base);
>   	if (status)
>   		return -ENODEV;
> +
>   	status = devm_snd_soc_register_component(&pdev->dev,
>   						 &acp3x_i2s_component,
> -						 &acp3x_i2s_dai_driver, 1);
> +						 NULL, 0);
>   	if (status) {
> -		dev_err(&pdev->dev, "Fail to register acp i2s dai\n");
> +		dev_err(&pdev->dev, "Fail to register acp i2s component\n");
> +		ret = -ENODEV;
>   		goto dev_err;
>   	}
>   	status = devm_request_irq(&pdev->dev, adata->i2s_irq, i2s_irq_handler,
>   				  irqflags, "ACP3x_I2S_IRQ", adata);
>   	if (status) {
>   		dev_err(&pdev->dev, "ACP3x I2S IRQ request failed\n");
> +		ret = -ENODEV;
>   		goto dev_err;
>   	}
>   
> -	pm_runtime_set_autosuspend_delay(&pdev->dev, 10000);
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 5000);
>   	pm_runtime_use_autosuspend(&pdev->dev);
>   	pm_runtime_enable(&pdev->dev);
>   	return 0;
> +
>   dev_err:
>   	status = acp3x_deinit(adata->acp3x_base);
>   	if (status)
>   		dev_err(&pdev->dev, "ACP de-init failed\n");
>   	else
> -		dev_info(&pdev->dev, "ACP de-initialized\n");
> -	/*ignore device status and return driver probe error*/
> -	return -ENODEV;
> +		dev_dbg(&pdev->dev, "ACP de-initialized\n");
> +	return ret;
>   }

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
