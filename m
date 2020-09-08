Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 739F0261227
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 15:52:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3E25174F;
	Tue,  8 Sep 2020 15:51:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3E25174F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599573126;
	bh=ciZhD3jtbtFQOpDe9qdsHvfNk5/0CMNaJz7RRzaJMKU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JXLIRe7GXa4Ur3raLB+pzC3OINi0Ogp5Okifa+E5dQ1yroILUmUcgLq4Z571ti6fm
	 Zmfiw19UGuHhFvLapEaXtkSUKIH6OCmJEXQpG2x4kY7Ob3yZLKydlzdlAxsWpG3RU1
	 x6nEWZcRkTuQlXxrPs5UpuVQ4juknKCoKiEVZqgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6443F8026F;
	Tue,  8 Sep 2020 15:50:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E770F80264; Tue,  8 Sep 2020 15:50:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62F92F8015F
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 15:50:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62F92F8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EMT8EAzf"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 088DoBcA053778;
 Tue, 8 Sep 2020 08:50:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1599573011;
 bh=qHLb+aBzQu0XOv/X10dRlx794IjobDqksoE3Mzhu9Rc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=EMT8EAzfZ2+Yw0UXfSoMMmNmBwQ/TyZ1EWFOar8tQE22hGSnP7XfZhSx9nEZRLomw
 zsWGPqwbcsbf7IA021UF376HHbwutublPiuVHCcaCQGxvnel61yWpErR7DC903yROS
 x+jTX9aOAXQYYQUmvbt30HMcBJH7fKHPLK9Y/hpQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 088DoBFs083592;
 Tue, 8 Sep 2020 08:50:11 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Sep
 2020 08:50:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Sep 2020 08:50:11 -0500
Received: from [10.250.38.37] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 088DoAgk050565;
 Tue, 8 Sep 2020 08:50:11 -0500
Subject: Re: [PATCH] ASoC: tlv320adcx140: Add support for master mode
To: Camel Guo <camel.guo@axis.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <tiwai@suse.com>
References: <20200908091812.1441-1-camel.guo@axis.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <1fdc20a0-2bc7-f479-e489-5a31ba36e4c3@ti.com>
Date: Tue, 8 Sep 2020 08:50:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908091812.1441-1-camel.guo@axis.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 Camel Guo <camelg@axis.com>
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

Camel

On 9/8/20 4:18 AM, Camel Guo wrote:
> From: Camel Guo <camelg@axis.com>
>
> Add setup of bclk-to-ws ratio and sample rate when in master mode,
> as well as MCLK input pin setup.

The patches you submitted need to go on the sound/for-next branch as it 
does not apply cleanly.

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git

> Limitations:
>
> - MCLK is assumed to be connected to GPIO1 (other possible choices
>    would be GPI0..3 if they weren't used for analog positive inputs).
> - PLL is always enabled, and clock generation is in automatic mode.
>
> Signed-off-by: Camel Guo <camelg@axis.com>
> ---
>   sound/soc/codecs/tlv320adcx140.c | 134 ++++++++++++++++++++++++++++++-
>   sound/soc/codecs/tlv320adcx140.h |  35 ++++++++
>   2 files changed, 165 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
> index 13ece039e9fe..f143b6b62f84 100644
> --- a/sound/soc/codecs/tlv320adcx140.c
> +++ b/sound/soc/codecs/tlv320adcx140.c
> @@ -35,6 +35,7 @@ struct adcx140_priv {
>   	unsigned int dai_fmt;
>   	unsigned int tdm_delay;
>   	unsigned int slot_width;
> +	int master;
Can this be a bool instead?
>   };
>   
>   static const char * const gpo_config_names[] = {
> @@ -614,12 +615,85 @@ static int adcx140_reset(struct adcx140_priv *adcx140)
>   	return ret;
>   }
>   
> +static int adcx140_fs_bclk_ratio(unsigned int bclk_ratio)
> +{
> +	switch (bclk_ratio) {
> +	case 16:
> +		return ADCX140_RATIO_16;
> +	case 24:
> +		return ADCX140_RATIO_24;
> +	case 32:
> +		return ADCX140_RATIO_32;
> +	case 48:
> +		return ADCX140_RATIO_48;
> +	case 64:
> +		return ADCX140_RATIO_64;
> +	case 96:
> +		return ADCX140_RATIO_96;
> +	case 128:
> +		return ADCX140_RATIO_128;
> +	case 192:
> +		return ADCX140_RATIO_192;
> +	case 256:
> +		return ADCX140_RATIO_256;
> +	case 384:
> +		return ADCX140_RATIO_384;
> +	case 512:
> +		return ADCX140_RATIO_512;
> +	case 1024:
> +		return ADCX140_RATIO_1024;
> +	case 2048:
> +		return ADCX140_RATIO_2048;
> +	default:
> +		break;
> +	}
> +	return -EINVAL;
> +}
> +
> +static int adcx140_fs_rate(unsigned int rate)
> +{
> +	switch (rate) {
> +	case 7350:
> +	case 8000:
> +		return ADCX140_8_OR_7_35KHZ;
> +	case 14700:
> +	case 16000:
> +		return ADCX140_16_OR_14_7KHZ;
> +	case 22050:
> +	case 24000:
> +		return ADCX140_24_OR_22_05KHZ;
> +	case 29400:
> +	case 32000:
> +		return ADCX140_32_OR_29_4KHZ;
> +	case 44100:
> +	case 48000:
> +		return ADCX140_48_OR_44_1KHZ;
> +	case 88200:
> +	case 96000:
> +		return ADCX140_96_OR_88_2KHZ;
> +	case 176400:
> +	case 192000:
> +		return ADCX140_192_OR_176_4KHZ;
> +	case 352800:
> +	case 384000:
> +		return ADCX140_384_OR_352_8KHZ;
> +	case 705600:
> +	case 768000:
> +		return ADCX140_768_OR_705_6KHZ;
> +	default:
> +		break;
> +	}
> +	return -EINVAL;
> +}
> +
>   static int adcx140_hw_params(struct snd_pcm_substream *substream,
>   			     struct snd_pcm_hw_params *params,
>   			     struct snd_soc_dai *dai)
>   {
>   	struct snd_soc_component *component = dai->component;
> +	struct adcx140_priv *adcx140 = snd_soc_component_get_drvdata(component);
>   	u8 data = 0;
> +	u8 mst_cfg0 = 0;
>   
>   	switch (params_width(params)) {
>   	case 16:
> @@ -640,6 +714,60 @@ static int adcx140_hw_params(struct snd_pcm_substream *substream,
>   		return -EINVAL;
>   	}
>   
> +	if (adcx140->master) {
> +		u8 mst_cfg1 = 0;
> +		u8 gpio_cfg0 = 0;

> +		unsigned int bclk_ratio;
> +		int ret;
> +

Can this be moved into a function?

Then we can avoid variable init mid function

> +		mst_cfg0 = ADCX140_MST_SLV_CFG_BIT;
> +		if (params_rate(params) % 1000)
> +			mst_cfg0 |= ADCX140_FS_MODE_BIT; /* 44.1 kHz et al */
> +
> +		ret = adcx140_fs_rate(params_rate(params));
> +		if (ret < 0) {
> +			dev_err(component->dev, "%s: Unsupported rate %d\n",
> +				__func__, params_rate(params));
> +			return ret;
> +		}
> +		mst_cfg1 |= ret;
> +
> +		/* In slave mode when using automatic clock configuration,
> +		 * the codec figures out the BCLK to FSYNC ratio itself. But
> +		 * here in master mode, we need to tell it.
> +		 */
> +
> +		bclk_ratio = snd_soc_params_to_frame_size(params);
> +		ret = adcx140_fs_bclk_ratio(bclk_ratio);
> +		if (ret < 0) {
> +			dev_err(component->dev, "%s: Unsupported bclk_ratio %d\n",
> +				__func__, bclk_ratio);
> +			return ret;
> +		}
> +		mst_cfg1 |= ret;
> +
> +		/* The codec can receive MCLK on any input: GPIO, GPI0..3.
> +		 * While in future it would be nice to have these selectable
> +		 * via clk_id for instance, for now we fix GPIO1 as the MCLK
> +		 * source.
> +		 */
> +		gpio_cfg0 |= ADCX140_GPIO1_MCLK;

Actually the latest driver has the GPO and GPI configurable via the DT

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/sound/tlv320adcx140.yaml?h=v5.9-rc4

Shouldn't be to difficult to add the GPIO as well please add this 
instead of hard coding the GPIO.


> +
> +		snd_soc_component_update_bits(component, ADCX140_MST_CFG1,
> +					      ADCX140_FS_RATE_MSK |
> +					      ADCX140_RATIO_MSK,
> +					      mst_cfg1);
> +
> +		snd_soc_component_update_bits(component, ADCX140_GPIO_CFG0,
> +					      ADCX140_GPIO1_CFG_MSK,
> +					      gpio_cfg0);
> +	}
> +
> +	snd_soc_component_update_bits(component, ADCX140_MST_CFG0,
> +				      ADCX140_FS_MODE_BIT |
> +				      ADCX140_MST_SLV_CFG_BIT,
> +				      mst_cfg0);
> +
>   	snd_soc_component_update_bits(component, ADCX140_ASI_CFG0,
>   			    ADCX140_WORD_LEN_MSK, data);
>   
> @@ -652,16 +780,16 @@ static int adcx140_set_dai_fmt(struct snd_soc_dai *codec_dai,
>   	struct snd_soc_component *component = codec_dai->component;
>   	struct adcx140_priv *adcx140 = snd_soc_component_get_drvdata(component);
>   	u8 iface_reg1 = 0;
> -	u8 iface_reg2 = 0;
>   	int offset = 0;
>   	int width = adcx140->slot_width;
>   
>   	/* set master/slave audio interface */
>   	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
>   	case SND_SOC_DAIFMT_CBM_CFM:
> -		iface_reg2 |= ADCX140_BCLK_FSYNC_MASTER;

> +		adcx140->master = 1;
>   		break;
>   	case SND_SOC_DAIFMT_CBS_CFS:
> +		adcx140->master = 0;
>   		break;
>   	case SND_SOC_DAIFMT_CBS_CFM:
>   	case SND_SOC_DAIFMT_CBM_CFS:
> @@ -714,8 +842,6 @@ static int adcx140_set_dai_fmt(struct snd_soc_dai *codec_dai,
>   				      ADCX140_BCLKINV_BIT |
>   				      ADCX140_ASI_FORMAT_MSK,
>   				      iface_reg1);
> -	snd_soc_component_update_bits(component, ADCX140_MST_CFG0,
> -				      ADCX140_BCLK_FSYNC_MASTER, iface_reg2);
>   
>   	/* Configure data offset */
>   	snd_soc_component_update_bits(component, ADCX140_ASI_CFG1,
> diff --git a/sound/soc/codecs/tlv320adcx140.h b/sound/soc/codecs/tlv320adcx140.h
> index eedbc1d7221f..bac34800b189 100644
> --- a/sound/soc/codecs/tlv320adcx140.h
> +++ b/sound/soc/codecs/tlv320adcx140.h
> @@ -145,4 +145,39 @@
>   #define ADCX140_GPO_CFG_MAX		4
>   #define ADCX140_GPO_DRV_MAX		5
>   
> +/* MST_CFG0 */
> +#define ADCX140_MST_SLV_CFG_BIT	BIT(7)

This is already defined as  ADCX140_BCLK_FSYNC_MASTER please don't 
define defines that are already defined.

> +#define ADCX140_FS_MODE_BIT	BIT(3)

This is already defined as ADCX140_FSYNCINV_BIT

Dan

