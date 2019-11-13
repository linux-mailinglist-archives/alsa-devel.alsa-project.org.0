Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC21FB642
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2019 18:20:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD4B2166D;
	Wed, 13 Nov 2019 18:20:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD4B2166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573665650;
	bh=CNYRHeIimao1nJ97V5qLfqx1SrCXeTmtm0rX6Rx5aio=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rQRIx9PG3zCxqYZ+RW8oeQdHEQIakf+JzA2JydCkAbulSJYJc0YYSKrfttFCL5Cku
	 V3JrY8wWRrhPK2uZKKJLhWp6yEX8NoZ0Asb9CDoBKkwMv2fbuBQQdptHXqjQW2clt9
	 jigEUc4+h0Ena2LscqTGNP7Uf/+hHVrOf8GkDQGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E39BF80086;
	Wed, 13 Nov 2019 18:18:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81185F800B8; Wed, 13 Nov 2019 18:18:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3BE6F80085
 for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2019 18:18:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3BE6F80085
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 09:18:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,301,1569308400"; d="scan'208";a="229813213"
Received: from dmsnyder-mobl1.amr.corp.intel.com (HELO [10.252.193.15])
 ([10.252.193.15])
 by fmsmga004.fm.intel.com with ESMTP; 13 Nov 2019 09:18:04 -0800
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
References: <1573629249-13272-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1573629249-13272-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <40d1690c-175c-c6ee-ee44-390c30cccc05@linux.intel.com>
Date: Wed, 13 Nov 2019 10:22:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <1573629249-13272-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
Content-Language: en-US
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, YueHaibing <yuehaibing@huawei.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Sanju R Mehta <sanju.mehta@amd.com>, Mark Brown <broonie@kernel.org>,
 djkurtz@google.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Akshu.Agrawal@amd.com
Subject: Re: [alsa-devel] [RESEND PATCH v5 2/6] ASoC: amd: Refactoring of
 DAI from DMA driver
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


> +	val = rv_readl(adata->acp3x_base + mmACP_BTTDM_ITER);
> +	rv_writel((val | 0x2), adata->acp3x_base + mmACP_BTTDM_ITER);
> +	val = rv_readl(adata->acp3x_base + mmACP_BTTDM_IRER);
> +	rv_writel((val | 0x2), adata->acp3x_base + mmACP_BTTDM_IRER);
> +
> +	val = (FRM_LEN | (slots << 15) | (slot_len << 18));

nit-pick: you have extra parentheses that are not needed for (val | 
0x02) and the outer ones on the previous line


> +static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
> +		int cmd, struct snd_soc_dai *dai)
> +{
> +	int ret = 0;

nit-pick: move last, xmas-style

> +	struct i2s_stream_instance *rtd = substream->runtime->private_data;
> +	u32 val, period_bytes;

> +static int acp3x_dai_probe(struct platform_device *pdev)
> +{
> +	int status;
> +	struct resource *res;
> +	struct i2s_dev_data *adata;
> +
> +	adata = devm_kzalloc(&pdev->dev, sizeof(struct i2s_dev_data),
> +			GFP_KERNEL);
> +	if (!adata)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
> +		goto err;
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
> +		goto dev_err;
> +	}
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 10000);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +	return 0;
> +err:
> +	kfree(adata);
> +	return -ENOMEM;
> +dev_err:
> +	kfree(adata->acp3x_base);
> +	kfree(adata);
> +	kfree(res);
> +	return -ENODEV;

this can be improved a bit by using ret = -ENOMEM/-ENODEV before the 
goto, and organizing the labels and the kfree calls in the reverse order 
of the initialization/allocation steps.


> @@ -666,7 +461,24 @@ static int acp3x_audio_probe(struct platform_device *pdev)
>   	pm_runtime_use_autosuspend(&pdev->dev);
>   	pm_runtime_enable(&pdev->dev);
>   	return 0;
> +
> +err:
> +	kfree(res);
> +	return -ENOMEM;
> +base_err:
> +	kfree(res);
> +	kfree(adata);
> +	return -ENOMEM;
> +io_irq:
> +	kfree(res);
> +	kfree(adata->acp3x_base);
> +	kfree(adata);
> +	return -ENOMEM;
> +
>   dev_err:
> +	kfree(res);
> +	kfree(adata->acp3x_base);
> +	kfree(adata);
>   	status = acp3x_deinit(adata->acp3x_base);
>   	if (status)
>   		dev_err(&pdev->dev, "ACP de-init failed\n");
same here, you should have all the kfrees in the reverse order of the 
kzalloc, and labels pointing straight at the sequence that needs to be 
executed. Duplicating the error flow makes it hard to maintain the code 
and check for memory leaks.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
