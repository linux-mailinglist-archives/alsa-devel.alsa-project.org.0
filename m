Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF8055B046
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Jun 2022 10:34:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8E2516B6;
	Sun, 26 Jun 2022 10:33:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8E2516B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656232462;
	bh=9pRuNCFdx2S6mqOwRW6uUhsdVPHgU2ag/icbEo1TZz0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j5MeNjWRHTCbTgZc1+RICMzoT89OMzOtfwG6ogWMiO0A7VViRzyXblI9PfGckKyun
	 JnVUrKLuaqnGxbprcUgE8rI0W5+y29IIqPz/4ZTKhMP34yCOb1DbcEbIhCGFYYajy5
	 OMhIooAeNXH4MHo26C5MvtZ1lx+hQMz1VSoZ0Y9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19E44F8023A;
	Sun, 26 Jun 2022 10:33:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09CEDF8016B; Sun, 26 Jun 2022 10:33:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=KHOP_HELO_FCRDNS, NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp09.smtpout.orange.fr
 [80.12.242.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA707F80107
 for <alsa-devel@alsa-project.org>; Sun, 26 Jun 2022 10:33:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA707F80107
Received: from [192.168.1.18] ([90.11.190.129]) by smtp.orange.fr with ESMTPA
 id 5NhgocNcnOXCy5NhhoLboN; Sun, 26 Jun 2022 10:33:15 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 26 Jun 2022 10:33:15 +0200
X-ME-IP: 90.11.190.129
Message-ID: <c8b888fc-dff9-c278-da10-6883c4277289@wanadoo.fr>
Date: Sun, 26 Jun 2022 10:33:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v8 2/8] ASoC: mediatek: mt8186: add platform driver
Content-Language: en-US
To: jiaxin.yu@mediatek.com
References: <20220625190852.29130-1-jiaxin.yu@mediatek.com>
 <20220625190852.29130-3-jiaxin.yu@mediatek.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220625190852.29130-3-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

Le 25/06/2022 à 21:08, Jiaxin Yu a écrit :
> Add mt8186 platform and affiliated driver.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>   sound/soc/mediatek/Kconfig                    |   12 +
>   sound/soc/mediatek/Makefile                   |    1 +
>   sound/soc/mediatek/mt8186/Makefile            |   19 +
>   sound/soc/mediatek/mt8186/mt8186-afe-common.h |  235 ++
>   .../soc/mediatek/mt8186/mt8186-afe-control.c  |  255 ++
>   sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 3011 +++++++++++++++++
>   6 files changed, 3533 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8186/Makefile
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-common.h
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-control.c
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c

[...]

> +	MT8186_DAI_HOSTLESS_SRC_AAUDIO,
> +	MT8186_DAI_HOSTLESS_SRC_1,	/* just an exmpale */

example?

> +	MT8186_DAI_HOSTLESS_SRC_BARGEIN,
> +	MT8186_DAI_HOSTLESS_UL1,

[...]

> +#define MTK_SPK_I2S_0_STR "MTK_SPK_I2S_0"
> +#define MTK_SPK_I2S_1_STR "MTK_SPK_I2S_1"
> +#define MTK_SPK_I2S_2_STR "MTK_SPK_I2S_2"
> +#define MTK_SPK_I2S_3_STR "MTK_SPK_I2S_3"

Out of curiosity, why no 4?
Or, if related to mtk_spk_i2s_type below, why  6, 7, 8 and 9?

> +#define MTK_SPK_I2S_5_STR "MTK_SPK_I2S_5"
> +#define MTK_SPK_I2S_6_STR "MTK_SPK_I2S_6"
> +#define MTK_SPK_I2S_7_STR "MTK_SPK_I2S_7"
> +#define MTK_SPK_I2S_8_STR "MTK_SPK_I2S_8"
> +#define MTK_SPK_I2S_9_STR "MTK_SPK_I2S_9"
> +

[...]

> +
> +enum mtk_spk_i2s_type {
> +	MTK_SPK_I2S_TYPE_INVALID = -1,
> +	MTK_SPK_I2S_0,
> +	MTK_SPK_I2S_1,
> +	MTK_SPK_I2S_2,
> +	MTK_SPK_I2S_3,
> +	MTK_SPK_I2S_5,
> +	MTK_SPK_I2S_TYPE_NUM
> +};

[...]

> +static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
> +{
> +	struct mtk_base_afe *afe;
> +	struct mt8186_afe_private *afe_priv;
> +	struct resource *res;
> +	struct reset_control *rstc;
> +	struct device *dev = &pdev->dev;
> +	int i, ret, irq_id;
> +
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(34));
> +	if (ret)
> +		return ret;
> +
> +	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
> +	if (!afe)
> +		return -ENOMEM;
> +	platform_set_drvdata(pdev, afe);
> +
> +	afe->platform_priv = devm_kzalloc(dev, sizeof(*afe_priv), GFP_KERNEL);
> +	if (!afe->platform_priv)
> +		return -ENOMEM;
> +
> +	afe_priv = afe->platform_priv;
> +	afe->dev = &pdev->dev;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	afe->base_addr = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(afe->base_addr))
> +		return PTR_ERR(afe->base_addr);
> +
> +	/* init audio related clock */
> +	ret = mt8186_init_clock(afe);
> +	if (ret) {
> +		dev_err(dev, "init clock error, ret %d\n", ret);
> +		return ret;
> +	}

There is a mt8186_deinit_clock() call in the remove function.
Should this also be called in the error handling path below?
Or should a devm_add_action_or_reset() be used to ease error handling?

> +
> +	/* init memif */
> +	afe->memif_32bit_supported = 0;
> +	afe->memif_size = MT8186_MEMIF_NUM;
> +	afe->memif = devm_kcalloc(dev, afe->memif_size, sizeof(*afe->memif),
> +				  GFP_KERNEL);
> +

Nit: no need for an empty line here.

> +	if (!afe->memif)
> +		return -ENOMEM;
> +

[...]

> +
> +	return 0;
> +
> +err_pm_disable:
> +	pm_runtime_put_noidle(dev);
> +	pm_runtime_set_suspended(dev);
> +
> +	return ret;
> +}
> +
> +static int mt8186_afe_pcm_dev_remove(struct platform_device *pdev)
> +{
> +	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
> +
> +	if (!pm_runtime_status_suspended(&pdev->dev))
> +		mt8186_afe_runtime_suspend(&pdev->dev);

Out of curiosity, is it normal to have some pm_runtime related code here 
that does not look the same as the one in the error handling of the probe?
(I don't know much about pm, but usually, .remove() functions and error 
handling in the probe look quite close)

> +
> +	mt8186_deinit_clock(afe);
> +
> +	return 0;
> +}
> +

[...]
