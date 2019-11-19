Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B4A1026A5
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 15:29:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 073A9168F;
	Tue, 19 Nov 2019 15:28:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 073A9168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574173748;
	bh=eDuwhqI1GeAZ0VTvgboRJvdcDloEoFJHX+KJTRAntMI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GR4ZxMNGTnYe14dy0h7u4hqzy+WrJLh6Dv+uLXSStNhRhVKd220oc2CAwrLi3AP93
	 1RUkQZMKmfIFeVVZOdc2ADsTAIsMP6+713ziGEn3G5so01YrwcQkiwICdIBjEGi4tk
	 lyLByhOqxNIg0HPYk8V832sH/xmx5+hKIlKOYCr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A3D6F8014E;
	Tue, 19 Nov 2019 15:25:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A55E3F80147; Tue, 19 Nov 2019 15:25:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8676F80137
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 15:25:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8676F80137
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Nov 2019 06:25:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,324,1569308400"; d="scan'208";a="215551232"
Received: from trgallx-mobl.amr.corp.intel.com (HELO [10.251.154.79])
 ([10.251.154.79])
 by fmsmga001.fm.intel.com with ESMTP; 19 Nov 2019 06:25:42 -0800
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
References: <1574155967-1315-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1574155967-1315-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0c3d3545-b0ee-4bb3-558a-045633a30e46@linux.intel.com>
Date: Tue, 19 Nov 2019 07:53:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <1574155967-1315-3-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
Content-Language: en-US
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Liam Girdwood <lgirdwood@gmail.com>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, open list <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 Akshu.Agrawal@amd.com
Subject: Re: [alsa-devel] [PATCH v8 2/6] ASoC: amd: Refactoring of DAI from
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
> +	struct resource *res;
> +	struct i2s_dev_data *adata;
> +	int status;
> +
> +	adata = devm_kzalloc(&pdev->dev, sizeof(struct i2s_dev_data),
> +			GFP_KERNEL);
> +	if (!adata)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
> +		return -ENOMEM;
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
> +			&acp3x_dai_component, &acp3x_i2s_dai, 1);
> +	if (status) {
> +		dev_err(&pdev->dev, "Fail to register acp i2s dai\n");
> +		return -ENODEV;
> +	}
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 5000);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);

question: here you want to use pm_runtime for this platform device...

> +	return 0;
> +}
> +
> +static int acp3x_dai_remove(struct platform_device *pdev)
> +{
> +	pm_runtime_disable(&pdev->dev);
> +	return 0;
> +}
> +static struct platform_driver acp3x_dai_driver = {
> +	.probe = acp3x_dai_probe,
> +	.remove = acp3x_dai_remove,
> +	.driver = {
> +		.name = "acp3x_i2s_playcap",

... but here there is no .pm structure and I don't see any 
suspend/resume routines for this driver...

> +	},
> +};

> @@ -774,13 +586,14 @@ static struct platform_driver acp3x_dma_driver = {
>   	.probe = acp3x_audio_probe,
>   	.remove = acp3x_audio_remove,
>   	.driver = {
> -		.name = "acp3x_rv_i2s",
> +		.name = "acp3x_rv_i2s_dma",
>   		.pm = &acp3x_pm_ops,
>   	},

... but for this other platform_driver you do have a .pm structure and 
suspend-resume implementations.

Wondering if this is a miss or a feature?

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
