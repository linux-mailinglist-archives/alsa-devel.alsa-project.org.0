Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E03AB52ED57
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 15:40:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77A73172C;
	Fri, 20 May 2022 15:39:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77A73172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653054014;
	bh=c8bdH+ZyGQ9wFeRf7kztaXyIa6B6zyqyMyLH+enVaLA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XvPdvd5bg9kwsb8JuVbcQ/ctByJ/xHaPMicNhyYXuIv82mhjlrjvRST1ao6QGftrT
	 Xxu9SQqcSiQvIyO15j7W1lAyMvgRVAcJnnPTZH8aw/xDkTBGYedgkERixSxDrb+OEq
	 oLn78xnl7R23PjXn205ap7Xp2mTYMi3RQDzUB40M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DECD0F800F0;
	Fri, 20 May 2022 15:39:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30B00F8019D; Fri, 20 May 2022 15:39:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC41AF800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 15:39:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC41AF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dbdCdy78"
Received: by mail-ed1-x534.google.com with SMTP id s3so10817133edr.9
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 06:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/vZ5EIynCj28UhpMo2WaUDTGXgrMDD6ssuzpbKQFTrE=;
 b=dbdCdy787bi5RG1nfo93JEf7fRSGqgvdGgWbhi5+jiM2gZq411FflPdY9L2o3Sz097
 XA9SzdoyvFOw4oNvCmxQtifumEL2ucGkRJdht2gKQbj9YVfuffNrO+QPvuuZxjrqoS0F
 NfU67GWBYzEpstGDy844RVUmfAl7HNRGvf/LwT4rnlN6DngXc2ZKIaPbBdhEQ53EpZ4s
 ITsYoJPxw+STd6rZ1MhtfXgofir7SDd7Ohuuh33FWGAKbBMX+xkiGJYwBkluf7rb/Tbk
 3LkMR2KGcBuBeRhqmlx3nsng24xG35IMWoTed7v6OpPZiYpWbvZKUFT3MZVg1KYI/Bnh
 bK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/vZ5EIynCj28UhpMo2WaUDTGXgrMDD6ssuzpbKQFTrE=;
 b=P+3ST/OpzjQAvoLRuaJedhjUrw47tJV3Xz49grGZ5MH4h6a5hkxtA90O523egiTxIl
 s1C82DiW6APWzuyyA5Dpie8juLNDO05MtamOliLtGqID9awjdEYf8ybkourYzuy+8nHr
 RxADDTGeNucl3qro9F9f/VTCW7Xr/2wXjnPigVG5g4SWY2S5mnQhvsTuartwRdmzWI78
 sE4OklxSKBn0qES+xaXeKfqF6Fsfgshf1xTa6wV+D76a9sxkrKgVZEn5vb+xuY0vwJtl
 BqSR5nh9I7t4FCKoPJs1tU+ZA291wu63U6SyShHqyxP1knDuESOH4Uvs5TWYSOzUEbQz
 uMAg==
X-Gm-Message-State: AOAM531Fc+IcTMDrsHllIeCKVnd0u0irgQAzilckpS+NH9W9Tti46nuk
 5lbT02uk9CkKtTsaKzpgGtc=
X-Google-Smtp-Source: ABdhPJzB4dDO6rQGcvP8GfFmFaDFqb3hZ0xhEwmOtYMgE32gUNPAUosh+C78GjzIs6waR9fAZFTMtw==
X-Received: by 2002:a05:6402:3488:b0:427:b4ec:991b with SMTP id
 v8-20020a056402348800b00427b4ec991bmr10869813edc.319.1653053945963; 
 Fri, 20 May 2022 06:39:05 -0700 (PDT)
Received: from archbook.localnet (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84]) by smtp.gmail.com with ESMTPSA id
 b2-20020aa7df82000000b0042abfe32ac8sm4225152edy.30.2022.05.20.06.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 06:39:05 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: broonie@kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 18/56] ASoC: rockchip: Update to use set_fmt_new callback
Date: Fri, 20 May 2022 15:39:03 +0200
Message-ID: <4375965.enAZpblka2@archbook>
In-Reply-To: <20220519154318.2153729-19-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <20220519154318.2153729-19-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, daniel@zonque.org,
 kernel@pengutronix.de, shawnguo@kernel.org, jarkko.nikula@bitmer.com
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

On Donnerstag, 19. Mai 2022 17:42:40 CEST Charles Keepax wrote:
> As part of updating the core to directly tell drivers if they are clock
> provider or consumer update these CPU side drivers to use the new direct
> callback.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  sound/soc/rockchip/rockchip_i2s.c     | 8 ++++----
>  sound/soc/rockchip/rockchip_i2s_tdm.c | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
> index 4ce5d25793875..0a66c7df323dc 100644
> --- a/sound/soc/rockchip/rockchip_i2s.c
> +++ b/sound/soc/rockchip/rockchip_i2s.c
> @@ -199,13 +199,13 @@ static int rockchip_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
>  
>  	pm_runtime_get_sync(cpu_dai->dev);
>  	mask = I2S_CKR_MSS_MASK;
> -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -	case SND_SOC_DAIFMT_CBS_CFS:
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_BP_FP:
>  		/* Set source clock in Master mode */
>  		val = I2S_CKR_MSS_MASTER;
>  		i2s->is_master_mode = true;
>  		break;
> -	case SND_SOC_DAIFMT_CBM_CFM:
> +	case SND_SOC_DAIFMT_BC_FC:
>  		val = I2S_CKR_MSS_SLAVE;
>  		i2s->is_master_mode = false;
>  		break;
> @@ -486,7 +486,7 @@ static const struct snd_soc_dai_ops rockchip_i2s_dai_ops = {
>  	.hw_params = rockchip_i2s_hw_params,
>  	.set_bclk_ratio	= rockchip_i2s_set_bclk_ratio,
>  	.set_sysclk = rockchip_i2s_set_sysclk,
> -	.set_fmt = rockchip_i2s_set_fmt,
> +	.set_fmt_new = rockchip_i2s_set_fmt,
>  	.trigger = rockchip_i2s_trigger,
>  };
>  
> diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
> index 98700e75b82a1..c90afccdae362 100644
> --- a/sound/soc/rockchip/rockchip_i2s_tdm.c
> +++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
> @@ -411,12 +411,12 @@ static int rockchip_i2s_tdm_set_fmt(struct snd_soc_dai *cpu_dai,
>  	}
>  
>  	mask = I2S_CKR_MSS_MASK;
> -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -	case SND_SOC_DAIFMT_CBC_CFC:
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_BP_FP:
>  		val = I2S_CKR_MSS_MASTER;
>  		i2s_tdm->is_master_mode = true;
>  		break;
> -	case SND_SOC_DAIFMT_CBP_CFP:
> +	case SND_SOC_DAIFMT_BC_FC:
>  		val = I2S_CKR_MSS_SLAVE;
>  		i2s_tdm->is_master_mode = false;
>  		break;
> @@ -1113,7 +1113,7 @@ static const struct snd_soc_dai_ops rockchip_i2s_tdm_dai_ops = {
>  	.hw_params = rockchip_i2s_tdm_hw_params,
>  	.set_bclk_ratio	= rockchip_i2s_tdm_set_bclk_ratio,
>  	.set_sysclk = rockchip_i2s_tdm_set_sysclk,
> -	.set_fmt = rockchip_i2s_tdm_set_fmt,
> +	.set_fmt_new = rockchip_i2s_tdm_set_fmt,
>  	.set_tdm_slot = rockchip_dai_tdm_slot,
>  	.trigger = rockchip_i2s_tdm_trigger,
>  };
> 

Please run ./scripts/get_maintainer.pl against the individual patches so
that I'm included in the recipients of the e-mail as well.

Anyway, for the i2s-tdm parts:

Tested-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>

Tested on a RK3566 connected to an RK817 codec.

Regards,
Nicolas Frattaroli


