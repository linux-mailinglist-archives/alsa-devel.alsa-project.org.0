Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E46F7760B2A
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 09:07:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07E32EAE;
	Tue, 25 Jul 2023 09:06:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07E32EAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690268866;
	bh=yqfpjqkUtJH8uA1hTRcsCtHn3jzO74FwhI8vleq5HQE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A1/vSCXeke/lUrElB1yVVJHZFWGw7nRf5EfbTE7oFJIoum5wIIElzkxsXUXPe+LLw
	 joQYfc5UBJnyapVyFQS3I9tMviOF03Lv64htSDm/i9Zlq/LT3mPJVCxur44bsGKHUf
	 KY6HTo7xwYF1ChILOlRTDkm2pe3xTbQqgSVh5ZTE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31C65F8053B; Tue, 25 Jul 2023 09:06:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADB11F80163;
	Tue, 25 Jul 2023 09:06:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 117AEF8019B; Tue, 25 Jul 2023 09:06:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76AE5F800C7
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 09:06:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76AE5F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=nHiL7NR+
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D00966606FD7;
	Tue, 25 Jul 2023 08:06:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690268797;
	bh=yqfpjqkUtJH8uA1hTRcsCtHn3jzO74FwhI8vleq5HQE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nHiL7NR+q2o7lXVyMeePASERgqUyC3BYbt3zfNt7DM4zusoA4rV3YPGVBFVmpFTSa
	 VJIVjtglO7xTFXLdOwKVjcTFvr5S36Ya8QXkNr9d75TP2nJ7470hmLwXpENkAfN9oD
	 C5R/AAoHno/7Pd2N2Ik8g9VfO43sCXGxNU6oF3K8FA1tqpSo74WA92u1dy+goNZqio
	 hAa69oZdWSsIg56ZakNdgtQK/nQpIpdUqXsbORMt+VdzDaXt2bLh9zq5N6MPx4F9Mh
	 8auc6NhSvESCZQKVmbCcoU7983vixRHxguODL4jMzPZny1C5qW+Xw2/J5n9phfuj1q
	 oEuBrVp7znHrw==
Message-ID: <5314542c-9a99-fad1-93f6-4f72c8698715@collabora.com>
Date: Tue, 25 Jul 2023 09:06:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] ASoC: mediatek: mt8188-mt6359: support dynamic
 pinctrl
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230725035304.2864-1-trevor.wu@mediatek.com>
 <20230725035304.2864-2-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230725035304.2864-2-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HWWTIXFUQITUOABB2CTN4KH2OQ2XQKJX
X-Message-ID-Hash: HWWTIXFUQITUOABB2CTN4KH2OQ2XQKJX
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HWWTIXFUQITUOABB2CTN4KH2OQ2XQKJX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 25/07/23 05:53, Trevor Wu ha scritto:
> To avoid power leakage, it is recommended to replace the default pinctrl
> state with dynamic pinctrl since certain audio pinmux functions can
> remain in a HIGH state even when audio is disabled. Linking pinctrl with
> DAPM using SND_SOC_DAPM_PINCTRL will ensure that audio pins remain in
> GPIO mode by default and only switch to an audio function when necessary.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>   sound/soc/mediatek/mt8188/mt8188-mt6359.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> index 7c9e08e6a4f5..667d79f33bf2 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
> @@ -246,6 +246,11 @@ static const struct snd_soc_dapm_widget mt8188_mt6359_widgets[] = {
>   	SND_SOC_DAPM_MIC("Headset Mic", NULL),
>   	SND_SOC_DAPM_SINK("HDMI"),
>   	SND_SOC_DAPM_SINK("DP"),
> +
> +	/* dynamic pinctrl */
> +	SND_SOC_DAPM_PINCTRL("ETDM_SPK_PIN", "aud_etdm_spk_on", "aud_etdm_spk_off"),
> +	SND_SOC_DAPM_PINCTRL("ETDM_HP_PIN", "aud_etdm_hp_on", "aud_etdm_hp_off"),
> +	SND_SOC_DAPM_PINCTRL("MTKAIF_PIN", "aud_mtkaif_on", "aud_mtkaif_off"),
>   };
>   
>   static const struct snd_kcontrol_new mt8188_mt6359_controls[] = {
> @@ -267,6 +272,7 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
>   		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
>   	struct snd_soc_component *cmpnt_codec =
>   		asoc_rtd_to_codec(rtd, 0)->component;
> +	struct snd_soc_dapm_widget *pin_w = NULL, *w;
>   	struct mtk_base_afe *afe;
>   	struct mt8188_afe_private *afe_priv;
>   	struct mtkaif_param *param;
> @@ -306,6 +312,18 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
>   		return 0;
>   	}
>   
> +	for_each_card_widgets(rtd->card, w) {
> +		if (!strcmp(w->name, "MTKAIF_PIN")) {

if (strncmp(w->name, "MTKAIF_PIN", strlen(w->name) == 0) {
	pin_w = w;
	break;
}

That's safer.

> +			pin_w = w;
> +			break;
> +		}
> +	}
> +
> +	if (!pin_w)

Just a nitpick: you're checking for `if (pin_w)` later in this function, so
to increase readability please do the same here.

if (pin_w)
	dapm_pinctrl_event(...)
else
	dev_dbg(...)

Regards,
Angelo
