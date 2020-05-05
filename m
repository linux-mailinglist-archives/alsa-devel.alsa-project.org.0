Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E50321C63A4
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 00:07:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C7B81757;
	Wed,  6 May 2020 00:06:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C7B81757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588716438;
	bh=dmFCrNOg28m6biHfBUN/P7DEsOU96LSd0dxrVeOAMGw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IWPC9Hut2UARQGz1XYnqhEkfM7ykI1gbI612TSc6VE6KB+OdwMNz/hxR+6I0pts1e
	 lxq895AFZmdc0UM07TMrwp7VLu2YIE/9DltVtCsIhZA4KyJ9+EmcjjZ58FiQ/EhuiX
	 DO5EcluLfklFpBVn4oxnNq6OagP5D0mFHRqJHqj0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EBA6F8028F;
	Wed,  6 May 2020 00:05:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5F1AF800EE; Wed,  6 May 2020 00:04:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9B57F80171
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 00:04:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9B57F80171
IronPort-SDR: G8PPpRqNS9vraz/7YOKrgxVmWLEPe1HSO5ZzUWYnSJ+OzmmxcxI826qh3i6k5wIIG6k3w5rYvs
 kS6roldAwQjA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2020 15:04:25 -0700
IronPort-SDR: hPHVeKNyDbsPLELZcpoPuQNRHLMtlay7PeJC/6bBmX4X9MNaTSmOCZCO1GzNtVBre1ZBp4XzO/
 GZGxM/Br/58A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,356,1583222400"; d="scan'208";a="278022618"
Received: from krogers-mobl1.amr.corp.intel.com (HELO [10.255.229.42])
 ([10.255.229.42])
 by orsmga002.jf.intel.com with ESMTP; 05 May 2020 15:04:24 -0700
Subject: Re: [PATCH 05/14] ASoC: amd: add ACP3x PDM platform driver
To: Alex Deucher <alexdeucher@gmail.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org, vijendar.mukunda@amd.com, tiwai@suse.de
References: <20200505205327.642282-1-alexander.deucher@amd.com>
 <20200505205327.642282-6-alexander.deucher@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3fa76374-4125-ed8a-436e-7127476baedd@linux.intel.com>
Date: Tue, 5 May 2020 17:03:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505205327.642282-6-alexander.deucher@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Alex Deucher <alexander.deucher@amd.com>
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




> +static struct snd_soc_dai_ops acp_pdm_dai_ops = {
> +	.hw_params = NULL,
> +	.trigger   = NULL,
> +};

doesn't seem very useful? can you remove this pdm_dai_ops?

> +
> +static struct snd_soc_dai_driver acp_pdm_dai_driver = {
> +	.capture = {
> +		.rates = SNDRV_PCM_RATE_48000,
> +		.formats = SNDRV_PCM_FMTBIT_S24_LE |
> +			   SNDRV_PCM_FMTBIT_S32_LE,
> +		.channels_min = 2,
> +		.channels_max = 2,
> +		.rate_min = 48000,
> +		.rate_max = 48000,
> +	},
> +	.ops = &acp_pdm_dai_ops,
> +};
> +
> +static const struct snd_soc_component_driver acp_pdm_component = {
> +	.name		= DRV_NAME,
> +};
> +
> +static int acp_pdm_audio_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	struct pdm_dev_data *adata;
> +	unsigned int irqflags;
> +	int status;
> +
> +	if (!pdev->dev.platform_data) {
> +		dev_err(&pdev->dev, "platform_data not retrieved\n");
> +		return -ENODEV;
> +	}

is this test needed?

> +	irqflags = *((unsigned int *)(pdev->dev.platform_data));
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
> +		return -ENODEV;
> +	}
> +
> +	adata = devm_kzalloc(&pdev->dev, sizeof(*adata), GFP_KERNEL);
> +	if (!adata)
> +		return -ENOMEM;
> +
> +	adata->acp_base = devm_ioremap(&pdev->dev, res->start,
> +				       resource_size(res));
> +	if (!adata->acp_base)
> +		return -ENOMEM;
> +
> +	adata->capture_stream = NULL;
> +
> +	dev_set_drvdata(&pdev->dev, adata);
> +	status = devm_snd_soc_register_component(&pdev->dev,
> +						 &acp_pdm_component,
> +						 &acp_pdm_dai_driver, 1);
> +	if (status) {
> +		dev_err(&pdev->dev, "Fail to register acp pdm dai\n");
> +
> +		return -ENODEV;

return status;

> +	}
> +	return 0;
> +}
> +
> +static int acp_pdm_audio_remove(struct platform_device *pdev)
> +{
> +	return 0;
> +}

not needed?

> +
> +static struct platform_driver acp_pdm_dma_driver = {
> +	.probe = acp_pdm_audio_probe,
> +	.remove = acp_pdm_audio_remove,
> +	.driver = {
> +		.name = "acp_rn_pdm_dma",
> +	},
> +};
> +
> +module_platform_driver(acp_pdm_dma_driver);

