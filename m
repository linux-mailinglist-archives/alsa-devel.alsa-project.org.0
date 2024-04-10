Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6158A9F10
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:51:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D83561930;
	Thu, 18 Apr 2024 17:51:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D83561930
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455472;
	bh=uahkF1VOEWvbo4wDDrFwOjLhjLjNoYbSCjv9ymH8OPg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IRzxG3bnGiulaZlGN2UnEWA+7Oqasq7OaU23v1bhXXZ5NNwlP/zcidz+DOdH62OI3
	 EVQfGyO+a4Z4EfHdCYd+4U4trHBfGddwXSIpZI+iwMBgNVJnlIUmoKif1dAOKFPv08
	 AsekGoCEnEcN+VyIZtZzwIr3aEzOPgCyNYm/oWqI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCE01F896B4; Thu, 18 Apr 2024 17:46:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFE7FF896C7;
	Thu, 18 Apr 2024 17:46:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BA3EF8026D; Wed, 10 Apr 2024 17:07:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9735F8013D
	for <alsa-devel@alsa-project.org>; Wed, 10 Apr 2024 17:07:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9735F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=EIMHAUDs
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-346359c8785so1108391f8f.0
        for <alsa-devel@alsa-project.org>;
 Wed, 10 Apr 2024 08:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712761657;
 x=1713366457; darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+P+72Hlq99kFNnxAOkF8xNKRqdp0Nj1rk4leGd6q+bQ=;
        b=EIMHAUDsHndEPEYuQgqn/nOQ6xke6RoPnYGm5PpOW5r/LZnQKMpbd2HJtaRAdogTGZ
         BT5rYzJYAP53fMd/NH1CpMQTdYtTchVXW2oEBgmx4SCY4WZVAQVuKhCaXDDYsnCd6K1y
         EQuj+Z9zjgHtXGT5D8A5KMSXOIPNQs4B6+gXEo/mezWle3zLQkIGCB/mXK7pmMXUU6dU
         7QmKqXf7Y2j3KNEngeWE8L4tVDV5ooNrF3+K8Iu7DK/UWNFHecbPZGQ+4Xg1p102/oM7
         q6dOZqxGO1rH3wa9TqEzCAh4ViV8oba99WaWdxzXbQ9WvdXjYh280wh2Oxd2GhWoB/ql
         QQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712761657; x=1713366457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+P+72Hlq99kFNnxAOkF8xNKRqdp0Nj1rk4leGd6q+bQ=;
        b=ZtmlfoL/1anbB5HFstM5dlos7Ye07i0TREsCxAWR5E8pKOi6PUSXeq8SJxt5u9TyJ8
         Vy1NQxFKqLX46VP0zzEJhrxp5OQ7niNXwA4/EnOd0/Lseq/WvtDRu5w68QAFvmpwgt/M
         wuT3+mamdw4BFkReNPUTAc3yVF4KERaLZ8lG3CGmW7J+15uPuI7ZxPgHyVF4CaabTg94
         SV+KLaaiu8TEowzeKR6vuhcJ0FqCSsnlie4UrJbsw0N/TN9vykNLBwjbQYe3k06BH7mP
         0ZC5peMO2TMshe3jVVnu6pgC0iFpQ7fcF4j9292LLlDMGsI7WiOWIvx5FE6N1PS0ku6b
         MSTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdpBpw/oF1TYYedT5n4C22C8+i+ouu6/YkEOTwiD0EpSSyuBRPRfUqRglhsfHM/wyaS1MNJR+OdnHg/q4fE0hMcJDCj6BoJFTbumg=
X-Gm-Message-State: AOJu0YwRyggEh8TfAeEgdEVzET2BWmTxB+9F2J1KMQiVPL7ejbWyVRCu
	21JmZKO+xhX9bv79AHIIlDrwK+KvHD9yuK8n4SB7VET6U/0FRX+htPEDDiL/XUA=
X-Google-Smtp-Source: 
 AGHT+IFhnB0gsdOm+IB5xuyR92fHk4A/RRmX5WG9qW/Rsc9kuPzli806ObV+/wdLIouJrwCNwH1GSA==
X-Received: by 2002:a5d:47a7:0:b0:343:bb25:82f0 with SMTP id
 7-20020a5d47a7000000b00343bb2582f0mr2577063wrb.11.1712761657374;
        Wed, 10 Apr 2024 08:07:37 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id
 c8-20020adfe748000000b00343a0e2375esm13906254wrn.27.2024.04.10.08.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 08:07:37 -0700 (PDT)
Message-ID: <65b3ec7e-e753-4692-b778-a9246e9e6664@baylibre.com>
Date: Wed, 10 Apr 2024 17:07:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/18] ASoC: mediatek: mt8186-rt1019: Migrate to the
 common mtk_soundcard_startup
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 broonie@kernel.org
Cc: wenst@chromium.org, lgirdwood@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
 trevor.wu@mediatek.com, maso.huang@mediatek.com,
 xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
 kuninori.morimoto.gx@renesas.com, shraash@google.com,
 nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de,
 dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com,
 eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
 jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com,
 ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com,
 nfraprado@collabora.com, alsa-devel@alsa-project.org,
 shane.chien@mediatek.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20240409113310.303261-1-angelogioacchino.delregno@collabora.com>
 <20240409113310.303261-11-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: 
 <20240409113310.303261-11-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: amergnat@baylibre.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZHW7KNR6SW7T5AQHHYNHOGLBBFWK3BH5
X-Message-ID-Hash: ZHW7KNR6SW7T5AQHHYNHOGLBBFWK3BH5
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:46:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZHW7KNR6SW7T5AQHHYNHOGLBBFWK3BH5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

What is the purpose of these change ? I don't see the link with the 
migration to the common mtk_soundcard_startup.

On 09/04/2024 13:33, AngeloGioacchino Del Regno wrote:
> diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
> index bfcfc68ac64d..dbe5afa0e9ee 100644
> --- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
> @@ -2729,7 +2729,7 @@ static int mt8186_afe_runtime_resume(struct device *dev)
>   	struct mtk_base_afe *afe = dev_get_drvdata(dev);
>   	struct mt8186_afe_private *afe_priv = afe->platform_priv;
>   	int ret;
> -
> +pr_err("mt8186 afe runtime_resume\n");

Forgot to remove this print ?

>   	ret = mt8186_afe_enable_clock(afe);
>   	if (ret)
>   		return ret;
> @@ -2739,7 +2739,7 @@ static int mt8186_afe_runtime_resume(struct device *dev)
>   		return ret;
>   
>   	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
> -		goto skip_regmap;
> +		return 0;
>   
>   	regcache_cache_only(afe->regmap, false);
>   	regcache_sync(afe->regmap);
> @@ -2758,13 +2758,20 @@ static int mt8186_afe_runtime_resume(struct device *dev)
>   	/* enable AFE */
>   	regmap_update_bits(afe->regmap, AFE_DAC_CON0, AUDIO_AFE_ON_MASK_SFT, BIT(0));
>   
> -skip_regmap:
>   	return 0;
>   }
>   
>   static int mt8186_afe_component_probe(struct snd_soc_component *component)
>   {
> -	mtk_afe_add_sub_dai_control(component);
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	snd_soc_component_init_regmap(component, afe->regmap);
> +
> +	ret = mtk_afe_add_sub_dai_control(component);
> +	if (ret)
> +		return ret;
> +
>   	mt8186_add_misc_control(component);
>   
>   	return 0;
> @@ -2929,6 +2936,10 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
>   		goto err_pm_disable;
>   	}
>   
> +	ret = regmap_reinit_cache(afe->regmap, &mt8186_afe_regmap_config);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "regmap_reinit_cache fail\n");
> +
>   	/* others */
>   	afe->mtk_afe_hardware = &mt8186_afe_hardware;
>   	afe->memif_fs = mt8186_memif_fs;
> diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
> index dbd157d1a1ea..b87b04928678 100644
> --- a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
> +++ b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
> @@ -413,7 +413,7 @@ static const struct snd_soc_dapm_widget mtk_dai_adda_widgets[] = {
>   			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
>   
>   	SND_SOC_DAPM_SUPPLY_S("AUD_PAD_TOP", SUPPLY_SEQ_ADDA_AUD_PAD_TOP,
> -			      AFE_AUD_PAD_TOP, RG_RX_FIFO_ON_SFT, 0,
> +			      SND_SOC_NOPM, 0, 0,

Is it related to the regmap init function added in the AFE PCM probe ?

>   			      mtk_adda_pad_top_event,
>   			      SND_SOC_DAPM_PRE_PMU),
>   	SND_SOC_DAPM_SUPPLY_S("ADDA_MTKAIF_CFG", SUPPLY_SEQ_ADDA_MTKAIF_CFG,

-- 
Regards,
Alexandre
