Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 715A661611B
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Nov 2022 11:45:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0877163F;
	Wed,  2 Nov 2022 11:44:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0877163F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667385922;
	bh=7I+QHBWjXxivPsU0CF0EiLAC03a7MhfEqs5o1FOXxLg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VjDkGVmxmHOXLWRPInlCyESMGNokFQ6AtgqumxNj6CjyXQB2Bw38viJg27GsixEYr
	 xHQMLTiuAJbOwTbO2pXstvMUyQOtoJywOdra2yJQzT0AeoZoJ+jyANxiIGxHe9nnlW
	 1pMIsgFGGjHXCyjQaMu7Z6f5XgqY4IlIX+VGYIag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EB91F80423;
	Wed,  2 Nov 2022 11:44:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15D1BF8026D; Wed,  2 Nov 2022 11:44:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F21B4F80155
 for <alsa-devel@alsa-project.org>; Wed,  2 Nov 2022 11:44:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F21B4F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="Oo6F5aYw"
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 4017D660293F;
 Wed,  2 Nov 2022 10:44:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667385857;
 bh=7I+QHBWjXxivPsU0CF0EiLAC03a7MhfEqs5o1FOXxLg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Oo6F5aYwAxPLUDE6xKJsRgiC+PQFAQuTrDNMda3YvUKBGll07jsH1+EM/kTbSf22U
 j10DtNLnmGUlhUvWDrSZkorI/NpOfHVO0vWtqrm7NSsL5mbzKhps6V4qECh9JY9e/9
 a6RpeAK9jnl67NtEolIn/+gnsG1ELYQwZxLKOrTIHoyAXxrTjZBUWtj11NYEfOC6Pn
 v8fZ7Vd7cN3jdAx7iRX5uq+mRASp/ScSkiKsT3jup1KOF5z1jCaQDEZYHTHQCFAyAB
 7d+ZM0UKJZZrisQIeC9CCTb4EVzUWIyF7b6EJQLm8axoBLKoYUzoI9BqctX6SJUmrM
 SSAkREHo5cTow==
Message-ID: <549e1ff6-821a-1c26-0a4f-021bed27b093@collabora.com>
Date: Wed, 2 Nov 2022 11:44:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v5 2/2] ASoC: mediatek: mt8186-rt5682: Modify machine
 driver for two DMICs case
Content-Language: en-US
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 linux-kernel@vger.kernel.org
References: <20221031122224.1846221-1-ajye_huang@compal.corp-partner.google.com>
 <20221031122224.1846221-3-ajye_huang@compal.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221031122224.1846221-3-ajye_huang@compal.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 "chunxu . li" <chunxu.li@mediatek.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

Il 31/10/22 13:22, Ajye Huang ha scritto:
> Having two DMICs, a front DMIC and a Rear DMIC,
> but only host audio input AUX port0 is used for these two Dmics.
> A "dmic-gpios" property is used for a mixer control to switch
> the dmic signal source between the Front and Rear Dmic.
> 
> Refer to this one as an example,
> commit 3cfbf07c6d27
> ("ASoC: qcom: sc7180: Modify machine driver for 2mic")
> 
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
>   .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 102 +++++++++++++++++-
>   1 file changed, 101 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
> index 2414c5b77233..75351734464c 100644
> --- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
> +++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
> @@ -7,6 +7,8 @@
>   // Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
>   //
>   
> +#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
>   #include <linux/input.h>
>   #include <linux/module.h>
>   #include <linux/of_device.h>
> @@ -39,6 +41,8 @@
>   
>   struct mt8186_mt6366_rt1019_rt5682s_priv {
>   	struct snd_soc_jack headset_jack, hdmi_jack;
> +	struct gpio_desc *dmic_sel;
> +	int dmic_switch;
>   };
>   
>   /* Headset jack detection DAPM pins */
> @@ -68,6 +72,94 @@ static struct snd_soc_codec_conf mt8186_mt6366_rt1019_rt5682s_codec_conf[] = {
>   	},
>   };
>   
> +static int dmic_get(struct snd_kcontrol *kcontrol,
> +		    struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
> +	struct mtk_soc_card_data *soc_card_data =
> +		snd_soc_card_get_drvdata(dapm->card);
> +	struct mt8186_mt6366_rt1019_rt5682s_priv *priv = soc_card_data->mach_priv;
> +
> +	ucontrol->value.integer.value[0] = priv->dmic_switch;
> +	return 0;
> +}
> +
> +static int dmic_set(struct snd_kcontrol *kcontrol,
> +		    struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
> +	struct mtk_soc_card_data *soc_card_data =
> +		snd_soc_card_get_drvdata(dapm->card);
> +	struct mt8186_mt6366_rt1019_rt5682s_priv *priv = soc_card_data->mach_priv;
> +
> +	priv->dmic_switch = ucontrol->value.integer.value[0];
> +	if (priv->dmic_sel) {
> +		gpiod_set_value(priv->dmic_sel, priv->dmic_switch);
> +		dev_info(dapm->card->dev, "dmic_set_value %d\n",
> +			 priv->dmic_switch);
> +	}
> +	return 0;
> +}
> +
> +static const char * const dmic_mux_text[] = {
> +	"FrontMic",
> +	"RearMic",

Why are the two words joined?
s/FrontMic/Front Mic/g
s/RearMic/Rear Mic/g

Like that, we keep it consistent with the naming that was given in the commit
that you mentioned in the commit description.

Regards,
Angelo
