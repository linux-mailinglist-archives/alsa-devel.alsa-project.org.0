Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 881A3F3568
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 18:07:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFF2E1686;
	Thu,  7 Nov 2019 18:06:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFF2E1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573146438;
	bh=SW/PwrxNcETggR9M+sK8a5cXCJXPxazJ4thNRFg8mMo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HHNcDdk+/rq8xXS5YI4OK6HXF2bEqZBlAl0Jd0xmuHiukq3iFpB6B+zIoJLvzoKO/
	 1ei9R+uXIwrkgKikQeqEa4yaCZv1Xo63veys6e71wgRI4RvsQJDC6YrXofpCGFdeyy
	 1OxW59LaaOfUDSCkrgCCrC+z9kH0E4PQe2TuyKEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85EF0F80446;
	Thu,  7 Nov 2019 18:05:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DB2AF80508; Thu,  7 Nov 2019 18:05:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEE4EF80291
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 18:05:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEE4EF80291
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 09:05:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,278,1569308400"; d="scan'208";a="192880761"
Received: from cjense2x-mobl1.amr.corp.intel.com (HELO [10.251.130.63])
 ([10.251.130.63])
 by orsmga007.jf.intel.com with ESMTP; 07 Nov 2019 09:05:21 -0800
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
References: <1573133093-28208-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1573133093-28208-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2547cf06-6f2f-78d8-d7c8-d0eb9c84f880@linux.intel.com>
Date: Thu, 7 Nov 2019 09:13:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <1573133093-28208-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
Content-Language: en-US
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, YueHaibing <yuehaibing@huawei.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Akshu.Agrawal@amd.com
Subject: Re: [alsa-devel] [PATCH v3 2/6] ASoC: amd: Refactoring of DAI from
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


> +static int acp3x_dai_probe(struct platform_device *pdev)
> +{
> +	int status;
> +	struct resource *res;
> +	struct i2s_dev_data *adata;
> +
> +	if (!pdev->dev.platform_data) {
> +		dev_err(&pdev->dev, "platform_data not retrieved\n");
> +		return -ENODEV;
> +	}
> +
> +	adata = devm_kzalloc(&pdev->dev, sizeof(struct i2s_dev_data),
> +			GFP_KERNEL);

if (!adata)
	return -ENOMEM;
	> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
> +		return -ENODEV;
> +	}
> +
> +	adata->acp3x_base = devm_ioremap(&pdev->dev, res->start,
> +			resource_size(res));
> +	if (IS_ERR(adata->acp3x_base))
> +		return PTR_ERR(adata->acp3x_base);
> +
> +	adata->i2s_irq = res->start;
> +	dev_set_drvdata(&pdev->dev, adata);
> +	status = devm_snd_soc_register_component(&pdev->dev,
> +			&acp3x_dai_component,
> +			&acp3x_i2s_dai, 1);
> +	if (status) {
> +		dev_err(&pdev->dev, "Fail to register acp i2s dai\n");
> +		return -ENODEV;

if the probe fails for such errors, don't you have a memory leak?

> +	}
> +
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 10000);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +	return 0;

err:
	kree(adata)
	return ret;
?


>   static const struct snd_pcm_hardware acp3x_pcm_hardware_playback = {
>   	.info = SNDRV_PCM_INFO_INTERLEAVED |
>   		SNDRV_PCM_INFO_BLOCK_TRANSFER |
> @@ -279,7 +261,11 @@ static int acp3x_dma_open(struct snd_soc_component *component,
>   			  struct snd_pcm_substream *substream)
>   {
>   	int ret = 0;
> +

newline?

> -
>   static const struct snd_soc_component_driver acp3x_i2s_component = {
>   	.name		= DRV_NAME,
>   	.open		= acp3x_dma_open,
> @@ -619,6 +415,9 @@ static int acp3x_audio_probe(struct platform_device *pdev)
>   		return -ENODEV;
>   	}
>   	irqflags = *((unsigned int *)(pdev->dev.platform_data));
> +	adata = devm_kzalloc(&pdev->dev, sizeof(*adata), GFP_KERNEL);
> +	if (!adata)
> +		return -ENOMEM;
>   
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	if (!res) {
> @@ -626,10 +425,6 @@ static int acp3x_audio_probe(struct platform_device *pdev)
>   		return -ENODEV;
>   	}
>   
> -	adata = devm_kzalloc(&pdev->dev, sizeof(*adata), GFP_KERNEL);
> -	if (!adata)
> -		return -ENOMEM;
> -

that part is hard to review with diff, please double-check the changes.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
