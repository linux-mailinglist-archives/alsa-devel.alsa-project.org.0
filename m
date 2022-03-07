Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE7C4CF566
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 10:27:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06C5E1701;
	Mon,  7 Mar 2022 10:26:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06C5E1701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646645224;
	bh=y4VLgbWo6XZNz149OzPNBE58Dgjk4Sa5/Ss0oJHGQfI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hXwtcGOa3+YSRkJDKC4Ajn1sE7clXZZj0kx5mSZsGjvqdef1pat8X5CCIh3/HQ9Gr
	 ZEhy9WcvQqBvqSDZowOVNhagHQhId9XC9q1GjJBWp9v7abzsM+i/6MXaXPW17HiuxW
	 Dl9CsHjMlmAsaEH2auvGoYDYqQhVrjaDLUytWix8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DFC9F80159;
	Mon,  7 Mar 2022 10:25:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 008FCF8013F; Mon,  7 Mar 2022 10:25:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E179F800D1
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 10:25:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E179F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="bJWICC2B"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 23E491F438AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646645145;
 bh=y4VLgbWo6XZNz149OzPNBE58Dgjk4Sa5/Ss0oJHGQfI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bJWICC2BD4Rcn+qe80ItLN1vEk4qtCS1B4XxXh4ix5Um2H3z9W1/DXSEqcU8NQFWv
 PQcj19AT+tydDQL47aj/bcS6epfc2f4Z0acCU0hnHKS8T9kskEtLh1vBmWCzceeL/c
 FnADwgUdVPSPhL+LdiYx62O4EOr/xbkLwtrC9ooyKmLpUr938myipbR3JVjNBAyp1D
 tcNhXBTz+dJlVla/93FBInRttQrM/Fl4DjMLFwVEDMsLOZ4VgUiCzMyw8hpyQC4lrW
 WaG/RSs28E0BGRMHOAAhF2YlNuoQB8nf74OyVbzwtdH3TyIetE2VQclla6qjW8421I
 DttsYK1EfB6mg==
Message-ID: <371b25e0-73c8-e17a-ee55-fe1cf2ad5a61@collabora.com>
Date: Mon, 7 Mar 2022 10:25:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [v2 03/17] ASoC: mediatek: mt8186: support adda in platform driver
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org
References: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
 <20220217134205.15400-4-jiaxin.yu@mediatek.com>
 <0e633e93-566d-0a91-f5e3-f3e3131fcb43@collabora.com>
 <5aca64866e5441d21aaf0293a1e48286acfdd978.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <5aca64866e5441d21aaf0293a1e48286acfdd978.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 geert+renesas@glider.be, linux-kernel@vger.kernel.org, zhangqilong3@huawei.com,
 tiwai@suse.com, lgirdwood@gmail.com, tzungbi@google.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com, aaronyu@google.com,
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

Il 05/03/22 11:49, Jiaxin Yu ha scritto:
> On Fri, 2022-02-18 at 15:54 +0100, AngeloGioacchino Del Regno wrote:
>> Il 17/02/22 14:41, Jiaxin Yu ha scritto:
>>> This patch adds mt8186 adda dai driver
>>>
>>> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
>>> ---
>>>    sound/soc/mediatek/mt8186/mt8186-dai-adda.c | 891
>>> ++++++++++++++++++++
>>>    1 file changed, 891 insertions(+)
>>>    create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-adda.c
>>>
>>> diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
>>> b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
>>> new file mode 100644
>>> index 000000000000..6d7dd1533da0
>>> --- /dev/null
>>> +++ b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
>>> @@ -0,0 +1,891 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +//
>>> +// MediaTek ALSA SoC Audio DAI ADDA Control
>>> +//
>>> +// Copyright (c) 2022 MediaTek Inc.
>>> +// Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
>>> +
>>> +#include <linux/regmap.h>
>>> +#include <linux/delay.h>
>>> +#include "mt8186-afe-clk.h"
>>> +#include "mt8186-afe-common.h"
>>> +#include "mt8186-afe-gpio.h"
>>> +#include "mt8186-interconnection.h"
>>> +
> ...snip...
>>>
>>> +/* dai ops */
>>> +static int mtk_dai_adda_hw_params(struct snd_pcm_substream
>>> *substream,
>>> +				  struct snd_pcm_hw_params *params,
>>> +				  struct snd_soc_dai *dai)
>>> +{
>>> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
>>> +	struct mt8186_afe_private *afe_priv = afe->platform_priv;
>>> +	unsigned int rate = params_rate(params);
>>> +	int id = dai->id;
>>> +	struct mtk_afe_adda_priv *adda_priv = afe_priv->dai_priv[id];
>>> +
>>> +	dev_info(afe->dev, "%s(), id %d, stream %d, rate %d\n",
>>> +		 __func__,
>>> +		 id,
>>> +		 substream->stream,
>>> +		 rate);
>>> +
>>> +	if (!adda_priv) {
>>> +		dev_info(afe->dev, "%s(), adda_priv == NULL",
>>> __func__);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>>> +		unsigned int dl_src2_con0 = 0;
>>> +		unsigned int dl_src2_con1 = 0;
>>
>> This initialization is redundant: you're never using these variables
>> before initializing them later, so initializing them to zero is not
>> needed here.
> Yes, got it. Thank you.
>>
>>> +
>>> +		adda_priv->dl_rate = rate;
>>> +
>>> +		/* set sampling rate */
>>> +		dl_src2_con0 = adda_dl_rate_transform(afe, rate) <<
>>> +			       DL_2_INPUT_MODE_CTL_SFT;
>>> +
>>> +		/* set output mode, UP_SAMPLING_RATE_X8 */
>>> +		dl_src2_con0 |= (0x3 << DL_2_OUTPUT_SEL_CTL_SFT);
>>> +
>>> +		/* turn off mute function */
>>> +		dl_src2_con0 |= (0x01 <<
>>> DL_2_MUTE_CH2_OFF_CTL_PRE_SFT);
>>
>> BIT() macro, please
>>
>>> +		dl_src2_con0 |= (0x01 <<
>>> DL_2_MUTE_CH1_OFF_CTL_PRE_SFT);
>>> +
>>> +		/* set voice input data if input sample rate is 8k or
>>> 16k */
>>> +		if (rate == 8000 || rate == 16000)
>>> +			dl_src2_con0 |= 0x01 <<
>>> DL_2_VOICE_MODE_CTL_PRE_SFT;
>>> +
>>> +		/* SA suggest apply -0.3db to audio/speech path */
>>> +		dl_src2_con1 = MTK_AFE_ADDA_DL_GAIN_NORMAL <<
>>> +			       DL_2_GAIN_CTL_PRE_SFT;
>>> +
>>> +		/* turn on down-link gain */
>>> +		dl_src2_con0 |= (0x01 << DL_2_GAIN_ON_CTL_PRE_SFT);
>>> +
>>> +		if (id == MT8186_DAI_ADDA) {
>>> +			/* clean predistortion */
>>> +			regmap_write(afe->regmap, AFE_ADDA_PREDIS_CON0,
>>> 0);
>>> +			regmap_write(afe->regmap, AFE_ADDA_PREDIS_CON1,
>>> 0);
>>> +
>>> +			regmap_write(afe->regmap,
>>> +				     AFE_ADDA_DL_SRC2_CON0,
>>> dl_src2_con0);
>>> +			regmap_write(afe->regmap,
>>> +				     AFE_ADDA_DL_SRC2_CON1,
>>> dl_src2_con1);
>>> +
>>> +			/* set sdm gain */
>>> +			regmap_update_bits(afe->regmap,
>>> +					   AFE_ADDA_DL_SDM_DCCOMP_CON,
>>> +					   ATTGAIN_CTL_MASK_SFT,
>>> +					   AUDIO_SDM_LEVEL_NORMAL <<
>>> +					   ATTGAIN_CTL_SFT);
>>> +
>>> +			/* Use new 2nd sdm */
>>> +			regmap_update_bits(afe->regmap,
>>> +					   AFE_ADDA_DL_SDM_DITHER_CON,
>>> +					   AFE_DL_SDM_DITHER_64TAP_EN_M
>>> ASK_SFT,
>>> +					   0x1 <<
>>> AFE_DL_SDM_DITHER_64TAP_EN_SFT);
>>
>> BIT(AFE_DL_SDM_DITHER_64TAP_EN_SFT)
>>
>>> +			regmap_update_bits(afe->regmap,
>>> +					   AFE_ADDA_DL_SDM_AUTO_RESET_C
>>> ON,
>>> +					   AFE_DL_USE_NEW_2ND_SDM_MASK_
>>> SFT,
>>> +					   0x1 <<
>>> AFE_DL_USE_NEW_2ND_SDM_SFT);
>>
>> BIT(AFE_DL_USE_NEW_2ND_SDM_SFT)
>>
>>> +			regmap_update_bits(afe->regmap,
>>> +					   AFE_ADDA_DL_SDM_DCCOMP_CON,
>>> +					   USE_3RD_SDM_MASK_SFT,
>>> +					   AUDIO_SDM_2ND <<
>>> USE_3RD_SDM_SFT);
>>> +
>>> +			/* sdm auto reset */
>>> +			regmap_write(afe->regmap,
>>> +				     AFE_ADDA_DL_SDM_AUTO_RESET_CON,
>>> +				     SDM_AUTO_RESET_THRESHOLD);
>>> +			regmap_update_bits(afe->regmap,
>>> +					   AFE_ADDA_DL_SDM_AUTO_RESET_C
>>> ON,
>>> +					   SDM_AUTO_RESET_TEST_ON_MASK_
>>> SFT,
>>> +					   0x1 <<
>>> SDM_AUTO_RESET_TEST_ON_SFT);
>>
>> BIT(SDM_AUTO_RESET_TEST_ON_SFT)
>>
>>> +		}
>>> +	} else {
>>> +		unsigned int voice_mode = 0;
>>
>> what about...
>> 		unsigned int ul_src_con0 = 0; /* default value */
>> 		unsigned int voice_mode =  adda_ul_rate_transform(afe,
>> rate);
> Agree with you.
> 
>>> +		unsigned int ul_src_con0 = 0;	/* default value */
>>> +
>>> +		adda_priv->ul_rate = rate;
>>> +
>>> +		voice_mode = adda_ul_rate_transform(afe, rate);
>>> +
>>> +		ul_src_con0 |= (voice_mode << 17) & (0x7 << 17);
>>> +
>>> +		/* enable iir */
>>> +		ul_src_con0 |= (1 << UL_IIR_ON_TMP_CTL_SFT) &
>>> +			       UL_IIR_ON_TMP_CTL_MASK_SFT;
>>> +		ul_src_con0 |= (UL_IIR_SW << UL_IIRMODE_CTL_SFT) &
>>> +			       UL_IIRMODE_CTL_MASK_SFT;
>>> +		switch (id) {
>>> +		case MT8186_DAI_ADDA:
>>> +		case MT8186_DAI_AP_DMIC:
>>> +			/* 35Hz @ 48k */
>>> +			regmap_write(afe->regmap,
>>> +				     AFE_ADDA_IIR_COEF_02_01,
>>> 0x00000000);
>>
>> Please drop leading zeroes:
>>
>> regmap_write(afe->regmap, AFE_ADDA_IIR_COEF_02_01, 0);
>>
>>> +			regmap_write(afe->regmap,
>>> +				     AFE_ADDA_IIR_COEF_04_03,
>>> 0x00003FB8);
>>
>> ... and also please write hex in lower-case:
>>
> Got it.
>> regmap_write(afe->regmap,
>> 	     AFE_ADDA_IIR_COEF_04_03, 0x03fb8);
>>
>>> +			regmap_write(afe->regmap,
>>> +				     AFE_ADDA_IIR_COEF_06_05,
>>> 0x3FB80000);
>>> +			regmap_write(afe->regmap,
>>> +				     AFE_ADDA_IIR_COEF_08_07,
>>> 0x3FB80000);
>>> +			regmap_write(afe->regmap,
>>> +				     AFE_ADDA_IIR_COEF_10_09,
>>> 0x0000C048);
>>> +
>>> +			regmap_write(afe->regmap,
>>> +				     AFE_ADDA_UL_SRC_CON0,
>>> ul_src_con0);
>>> +
>>> +			/* Using Internal ADC */
>>> +			regmap_update_bits(afe->regmap,
>>> +					   AFE_ADDA_TOP_CON0,
>>> +					   0x1 << 0,
>>> +					   0x0 << 0);
>>
>> Please use the BIT() macro:
>>
>> regmap_update_bits(afe->regmap, AFE_ADDA_TOP_CON0, BIT(0), 0);
>>
>> P.S.: 87 columns is ok
> 
> How can I judge whether it can exceed 80 lines?

https://www.kernel.org/doc/html/latest/process/coding-style.html

Besides, the 80 columns rule was made for old terminals (like VT100 and such)
that supported displaying a maximum of 80 cols... in the modern era, that's
not the case anymore.
It's somewhat preferred if something can fit in 80 columns, but if it does
impact on readability, then you can go over that, up to 100 columns.

scripts/checkpatch.pl was also changed to complain about 100 columns and not
80 anymore...

my $max_line_length = 100;

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/checkpatch.pl?h=v5.17-rc7#n59

Cheers,
Angelo

