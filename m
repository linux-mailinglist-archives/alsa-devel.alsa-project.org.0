Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3142B4BBB1A
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Feb 2022 15:56:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2F1C17B2;
	Fri, 18 Feb 2022 15:55:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2F1C17B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645196171;
	bh=vszf1mxLCqbidpRVRQR/8NqjOMQR9G4uyJxNzOwk5/U=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SUfDasqQ1fYPOsP80AwaZEgW70hp/QZuBO9jiPfLm9KzGVkXC5oekfe1H76JnoDbG
	 XBh6/SGMQEnVbG17cOEyGvuAOqPsk4L/OR2koBH7f2wG+ziTv3UYLykrRwH4ShDJ2g
	 HAe61itwW9rRMs5YsFqfOzkU/ogpOfOG8MzC1RNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A1F9F80518;
	Fri, 18 Feb 2022 15:54:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51224F80519; Fri, 18 Feb 2022 15:54:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2E84F8012B
 for <alsa-devel@alsa-project.org>; Fri, 18 Feb 2022 15:54:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2E84F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="MMTU2098"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6DC611F46B9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645196056;
 bh=vszf1mxLCqbidpRVRQR/8NqjOMQR9G4uyJxNzOwk5/U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=MMTU2098qGRMayEFfduZx/jPWm/f+3QmzqTmb5DrZoMDiIWoXwS/pMsPnS9gHjrFK
 OJUyno+tT3OFo4fuinglRWna4mx2B5/0Q2EeukA7rDpB0w9lSthKttTOCDHvQHrQlB
 JcnSZtOpe7l/eWFc4bSFh4yMtJNIqsPSFXqqwh0CBEf7FQ4KL3xbSZ5MjMPtER7a+n
 Cgt2foHA6HnpOlxMcUX0BVTzhf0CjhUGx+vJnb1vvnJjaHo7+65ynVzzZb9Hb5mzjc
 k3+YwpDT9mRrmQRoGeMaH6m0SkjTXyhEOdK7H6QouBZET2w2yPdxGVqgWnwBYU6Pd2
 8iTl+AqO+rAxg==
Message-ID: <b8ada898-9374-72be-6c1d-a99706388a2a@collabora.com>
Date: Fri, 18 Feb 2022 15:54:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [v2 04/17] ASoC: mediatek: mt8186: support hostless in platform
 driver
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org
References: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
 <20220217134205.15400-5-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220217134205.15400-5-jiaxin.yu@mediatek.com>
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

Il 17/02/22 14:41, Jiaxin Yu ha scritto:
> This patch adds mt8186 hostless dai driver.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>   .../soc/mediatek/mt8186/mt8186-dai-hostless.c | 295 ++++++++++++++++++
>   1 file changed, 295 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-dai-hostless.c
> 
> diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-hostless.c b/sound/soc/mediatek/mt8186/mt8186-dai-hostless.c
> new file mode 100644
> index 000000000000..37460a3acc93
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8186/mt8186-dai-hostless.c
> @@ -0,0 +1,295 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// MediaTek ALSA SoC Audio DAI Hostless Control
> +//
> +// Copyright (c) 2022 MediaTek Inc.
> +// Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
> +
> +#include "mt8186-afe-common.h"
> +
> +static const struct snd_pcm_hardware mt8186_hostless_hardware = {
> +	.info = (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_INTERLEAVED |
> +		 SNDRV_PCM_INFO_MMAP_VALID),
> +	.period_bytes_min = 256,
> +	.period_bytes_max = 4 * 48 * 1024,
> +	.periods_min = 2,
> +	.periods_max = 256,
> +	.buffer_bytes_max = 4 * 48 * 1024,
> +	.fifo_size = 0,
> +};
> +
> +/* dai component */
> +static const struct snd_soc_dapm_route mtk_dai_hostless_routes[] = {
> +	/* Hostless ADDA Loopback */
> +	{"ADDA_DL_CH1", "ADDA_UL_CH1 Switch", "Hostless LPBK DL"},
> +	{"ADDA_DL_CH1", "ADDA_UL_CH2 Switch", "Hostless LPBK DL"},
> +	{"ADDA_DL_CH2", "ADDA_UL_CH1 Switch", "Hostless LPBK DL"},
> +	{"ADDA_DL_CH2", "ADDA_UL_CH2 Switch", "Hostless LPBK DL"},
> +	{"I2S1_CH1", "ADDA_UL_CH1 Switch", "Hostless LPBK DL"},
> +	{"I2S1_CH2", "ADDA_UL_CH2 Switch", "Hostless LPBK DL"},
> +	{"I2S3_CH1", "ADDA_UL_CH1 Switch", "Hostless LPBK DL"},
> +	{"I2S3_CH1", "ADDA_UL_CH2 Switch", "Hostless LPBK DL"},
> +	{"I2S3_CH2", "ADDA_UL_CH1 Switch", "Hostless LPBK DL"},
> +	{"I2S3_CH2", "ADDA_UL_CH2 Switch", "Hostless LPBK DL"},
> +	{"Hostless LPBK UL", NULL, "ADDA_UL_Mux"},
> +
> +	/* Hostelss FM */
> +	/* connsys_i2s to hw gain 1*/
> +	{"Hostless FM UL", NULL, "Connsys I2S"},
> +
> +	{"HW_GAIN1_IN_CH1", "CONNSYS_I2S_CH1 Switch", "Hostless FM DL"},
> +	{"HW_GAIN1_IN_CH2", "CONNSYS_I2S_CH2 Switch", "Hostless FM DL"},
> +	/* hw gain to adda dl */
> +	{"Hostless FM UL", NULL, "HW Gain 1 Out"},
> +
> +	{"ADDA_DL_CH1", "GAIN1_OUT_CH1 Switch", "Hostless FM DL"},
> +	{"ADDA_DL_CH2", "GAIN1_OUT_CH2 Switch", "Hostless FM DL"},
> +	/* hw gain to i2s3 */
> +	{"I2S3_CH1", "GAIN1_OUT_CH1 Switch", "Hostless FM DL"},
> +	{"I2S3_CH2", "GAIN1_OUT_CH2 Switch", "Hostless FM DL"},
> +	/* hw gain to i2s1 */
> +	{"I2S1_CH1", "GAIN1_OUT_CH1 Switch", "Hostless FM DL"},
> +	{"I2S1_CH2", "GAIN1_OUT_CH2 Switch", "Hostless FM DL"},
> +
> +	/* Hostless_SRC */
> +	{"ADDA_DL_CH1", "SRC_1_OUT_CH1 Switch", "Hostless_SRC_1_DL"},
> +	{"ADDA_DL_CH2", "SRC_1_OUT_CH2 Switch", "Hostless_SRC_1_DL"},
> +	{"I2S1_CH1", "SRC_1_OUT_CH1 Switch", "Hostless_SRC_1_DL"},
> +	{"I2S1_CH2", "SRC_1_OUT_CH2 Switch", "Hostless_SRC_1_DL"},
> +	{"I2S3_CH1", "SRC_1_OUT_CH1 Switch", "Hostless_SRC_1_DL"},
> +	{"I2S3_CH2", "SRC_1_OUT_CH2 Switch", "Hostless_SRC_1_DL"},
> +	{"Hostless_SRC_1_UL", NULL, "HW_SRC_1_Out"},
> +
> +	/* Hostless_SRC_bargein */
> +	{"HW_SRC_1_IN_CH1", "I2S0_CH1 Switch", "Hostless_SRC_Bargein_DL"},
> +	{"HW_SRC_1_IN_CH2", "I2S0_CH2 Switch", "Hostless_SRC_Bargein_DL"},
> +	{"Hostless_SRC_Bargein_UL", NULL, "I2S0"},
> +
> +	/* Hostless AAudio */
> +	{"Hostless HW Gain AAudio In", NULL, "HW Gain 2 In"},
> +	{"Hostless SRC AAudio UL", NULL, "HW Gain 2 Out"},
> +	{"HW_SRC_2_IN_CH1", "HW_GAIN2_OUT_CH1 Switch", "Hostless SRC AAudio DL"},
> +	{"HW_SRC_2_IN_CH2", "HW_GAIN2_OUT_CH2 Switch", "Hostless SRC AAudio DL"},
> +};
> +
> +/* dai ops */
> +static int mtk_dai_hostless_startup(struct snd_pcm_substream *substream,
> +				    struct snd_soc_dai *dai)
> +{
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +	int ret;
> +
> +	snd_soc_set_runtime_hwparams(substream, &mt8186_hostless_hardware);
> +
> +	ret = snd_pcm_hw_constraint_integer(runtime,
> +					    SNDRV_PCM_HW_PARAM_PERIODS);
> +	if (ret < 0)
> +		dev_info(afe->dev, "snd_pcm_hw_constraint_integer failed\n");

	if (ret < 0) {
		dev_err(afe->dev, "setting constraints failed: %d\n", ret);
		return ret;
	}

	return 0;


Thanks,
Angelo


