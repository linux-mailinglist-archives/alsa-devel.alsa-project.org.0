Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E0C9038A1
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2024 12:16:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B820A852;
	Tue, 11 Jun 2024 12:16:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B820A852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718100983;
	bh=lwtvF8TxyoK5ymJEUqL+Fdnx72KICz4bi8hcR1ZN2pk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hUESqmb1xKMonQYJKluU5h4MT2J5fL4BTUQN9LGhgUMY3UAY/047RB/L/j68gDssv
	 Jb7r4HaTzewipuAuWMUSURHr+Ri1rj2XvfT9xD34yW3hgFyY5Ymo5OD3AK++Rw1cBM
	 Ulb2+lGiswR+J99SnX9oMTbkc7fePqOzImL2hEiw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EDF0F805BB; Tue, 11 Jun 2024 12:15:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B042F805AA;
	Tue, 11 Jun 2024 12:15:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CB69F8057A; Tue, 11 Jun 2024 12:15:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EEE5BF8010C
	for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2024 12:15:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEE5BF8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WCcERj+i
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A71576068D;
	Tue, 11 Jun 2024 10:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EAA0C2BD10;
	Tue, 11 Jun 2024 10:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718100940;
	bh=lwtvF8TxyoK5ymJEUqL+Fdnx72KICz4bi8hcR1ZN2pk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WCcERj+iqpu+bZrTYQgOyGthvcZ/X2gu2+GqD1bh3N3awgteDMG9mU+ACV+3pLH4R
	 XskRK+Cwj2BK6OmWFJ2prqWvoXbpWi/fv0AAcF5SCxPI5dvLkplU1gG5bF4BquXc48
	 3FdozzoIzVNDlT4MU0bfZCi6cy9FWQp16bUJNxTf/CQs380s3QWDQw7ZXKShlr6mv1
	 +roaCUeCOoUwe03l9bXJIY26YI51b0e/VuqHM45uIb/tLDkv4kJi9AVCWPUCkv24aG
	 48WWBZQ34zOGhJhiuJ5Ot9doIBsmw89AEGSiNn1Mvbca22RkVbLntiBFZI4A/C/Evd
	 oo0NoeTHwe1rQ==
Message-ID: <6cd2897f-a61d-4351-abac-714bae2ab154@kernel.org>
Date: Tue, 11 Jun 2024 12:15:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v2 1/2] ASoC: fsl: Add i2s and pcm drivers for LPC32xx
 CPUs
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Russell King <linux@armlinux.org.uk>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Chancel Liu <chancel.liu@nxp.com>,
 Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
References: <[PATCH] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs>
 <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UGCHMYEFLMEHA2RZNV2S5ZOD5Z7AMWEK
X-Message-ID-Hash: UGCHMYEFLMEHA2RZNV2S5ZOD5Z7AMWEK
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UGCHMYEFLMEHA2RZNV2S5ZOD5Z7AMWEK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/06/2024 11:47, Piotr Wojtaszczyk wrote:
> This driver was ported from an old version in linux 2.6.27 and adjusted
> for the new ASoC framework and DMA API.
> 
> Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> ---
> Changes for v2:
> - Coding Style cleanup
> - Use dev_err_probe() for error handling in probe function
> - Removed unneded err_clk_disable label
> - Removed empty function
> - Droped of_match_ptr in lpc32xx_i2s_match DT match table
> - ASoC struct adjustmes for the latest 6.10-rc3 kernel
> 
>  MAINTAINERS                            |   7 +

1:
>  arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi |   4 +

2:
>  arch/arm/mach-lpc32xx/phy3250.c        |  60 ++++

3:
>  sound/soc/fsl/Kconfig                  |   7 +
>  sound/soc/fsl/Makefile                 |   2 +
>  sound/soc/fsl/lpc3xxx-i2s.c            | 383 +++++++++++++++++++++++++
>  sound/soc/fsl/lpc3xxx-i2s.h            |  94 ++++++
>  sound/soc/fsl/lpc3xxx-pcm.c            |  75 +++++

Three separate subsystems, so three separate patches.

>  8 files changed, 632 insertions(+)
>  create mode 100644 sound/soc/fsl/lpc3xxx-i2s.c
>  create mode 100644 sound/soc/fsl/lpc3xxx-i2s.h
>  create mode 100644 sound/soc/fsl/lpc3xxx-pcm.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index aacccb376c28..7616f61d6327 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8909,6 +8909,13 @@ S:	Maintained
>  F:	sound/soc/fsl/fsl*
>  F:	sound/soc/fsl/imx*
>  
> +FREESCALE SOC LPC32XX SOUND DRIVERS
> +M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> +L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> +L:	linuxppc-dev@lists.ozlabs.org
> +S:	Orphan

Not sure if we want it in the first place. Why would we like to support
orphaned drivers? Sorry, if there is no one to care about it, then it
should not be merged.

...

> +
> +static int lpc32xx_i2s_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct lpc3xxx_i2s_info *i2s_info_p;
> +	struct resource *res;
> +	void __iomem *iomem;
> +	int ret;
> +
> +	i2s_info_p = devm_kzalloc(dev, sizeof(*i2s_info_p), GFP_KERNEL);
> +	if (!i2s_info_p)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, i2s_info_p);
> +	i2s_info_p->dev = dev;
> +
> +	iomem = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(iomem))
> +		return dev_err_probe(dev, PTR_ERR(iomem), "Can't map registers\n");
> +
> +	i2s_info_p->regs = devm_regmap_init_mmio(dev, iomem, &lpc32xx_i2s_regconfig);
> +	if (IS_ERR(i2s_info_p->regs))
> +		return dev_err_probe(dev, PTR_ERR(i2s_info_p->regs),
> +				     "failed to init register map: %d\n", ret);
> +
> +	i2s_info_p->clk = devm_clk_get(dev, "i2s_clk");
> +	if (IS_ERR(i2s_info_p->clk))
> +		return dev_err_probe(dev, PTR_ERR(i2s_info_p->clk), "Can't get clock\n");
> +
> +	i2s_info_p->clkrate = clk_get_rate(i2s_info_p->clk);
> +	if (i2s_info_p->clkrate == 0)
> +		return dev_err_probe(dev, -EINVAL, "Invalid returned clock rate\n");
> +
> +	mutex_init(&i2s_info_p->lock);
> +
> +	ret = devm_snd_soc_register_component(dev, &lpc32xx_i2s_component,
> +					      &lpc3xxx_i2s_dai_driver, 1);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Can't register cpu_dai component\n");
> +
> +	i2s_info_p->playback_dma_config.addr = (dma_addr_t)(res->start + I2S_TX_FIFO);
> +	i2s_info_p->playback_dma_config.maxburst = 4;
> +	i2s_info_p->playback_dma_config.filter_data = "i2s-tx";
> +	i2s_info_p->capture_dma_config.addr = (dma_addr_t)(res->start + I2S_RX_FIFO);
> +	i2s_info_p->capture_dma_config.maxburst = 4;
> +	i2s_info_p->capture_dma_config.filter_data = "i2s-rx";
> +
> +	ret = lpc3xxx_pcm_register(pdev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Can't register pcm component\n");
> +
> +	return 0;
> +}
> +
> +static int lpc32xx_i2s_remove(struct platform_device *pdev)
> +{
> +	return 0;
> +}

You did not respond to comment about this. Drop.


Best regards,
Krzysztof

