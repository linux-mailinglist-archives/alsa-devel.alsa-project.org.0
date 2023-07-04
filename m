Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DA1746C91
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 10:59:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 797F53E7;
	Tue,  4 Jul 2023 10:58:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 797F53E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688461178;
	bh=SjGu7YG2MyYo3NcWANYQRJtPw6x21qgJpQDVq9sIg40=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=N+WWUG3GYomdeOrlhgrIwfGMt4XH3ud3HkWZvxTdRW2nYPT0g4KBa6j7bCib+bBF9
	 R1sr+MxGZx7r+HwXr6zC+xiD21hlBlV+V7zVF3dlWMwBOLuZC0gP1HU/bppkDht8Ma
	 /ioEHJbxIfsl0m34KuigwimFpA9aRQ9txVhiUJtE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 916C4F80272; Tue,  4 Jul 2023 10:58:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0201CF80124;
	Tue,  4 Jul 2023 10:58:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8DEAAF80125; Tue,  4 Jul 2023 10:58:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51D96F800E4
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 10:58:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51D96F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=diAkKC0m
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 606946606ED1;
	Tue,  4 Jul 2023 09:58:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688461118;
	bh=SjGu7YG2MyYo3NcWANYQRJtPw6x21qgJpQDVq9sIg40=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=diAkKC0mRWuRsit2iQeQ1D7RhtTmGuMxonq0MZHRcsLjqWkMY1hJsxU6qJ9VhNSok
	 ptnc7NjHpaZqq+JTZkG5HjlsxOUzg1Ta4Xr7ESYfQmosDTrV8RKiyIHgQpQMsV7VXd
	 Fge0rqRoi8cbmWe6AaPJn0qExzySMJAEaBrHtmN8+Jf2VFE0j3rz/TjLi5SCMy5NV6
	 qE28q0WmNiFcm8zXJa0UleCiSqxtCTlFLsNSgLp2fvWWfvx+0Tq3n+kMcntt8roYr7
	 BRR31fFWm81RnKdxJZPIzCd8iD8k3WXGPxceqdjEevrlyqwZfv43+1rsGPdahIfPQL
	 pPxEOpecAHPSQ==
Message-ID: <255bb946-2198-93e7-7f38-7b8e00f7677f@collabora.com>
Date: Tue, 4 Jul 2023 10:58:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 3/7] ASoC: mediatek: mt7986: support etdm in platform
 driver
Content-Language: en-US
To: Maso Huang <maso.huang@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Ren Zhijie <renzhijie2@huawei.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230626023501.11120-1-maso.huang@mediatek.com>
 <20230626023501.11120-4-maso.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230626023501.11120-4-maso.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XCRIKQAZESR6QROC37GAGQKMHRSMBNIV
X-Message-ID-Hash: XCRIKQAZESR6QROC37GAGQKMHRSMBNIV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XCRIKQAZESR6QROC37GAGQKMHRSMBNIV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Il 26/06/23 04:34, Maso Huang ha scritto:
> Add mt7986 etdm dai driver support.
> 
> Signed-off-by: Maso Huang <maso.huang@mediatek.com>
> ---
>   sound/soc/mediatek/mt7986/mt7986-dai-etdm.c | 421 ++++++++++++++++++++
>   1 file changed, 421 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
> 
> diff --git a/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c b/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
> new file mode 100644
> index 000000000000..672deb59ea46
> --- /dev/null
> +++ b/sound/soc/mediatek/mt7986/mt7986-dai-etdm.c
> @@ -0,0 +1,421 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * MediaTek ALSA SoC Audio DAI eTDM Control
> + *
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Vic Wu <vic.wu@mediatek.com>
> + *         Maso Huang <maso.huang@mediatek.com>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/regmap.h>
> +#include <sound/pcm_params.h>
> +#include "mt7986-afe-clk.h"
> +#include "mt7986-afe-common.h"
> +#include "mt7986-reg.h"
> +
> +enum {
> +	HOPPING_CLK = 0,
> +	APLL_CLK = 1,
> +};
> +
> +enum {
> +	MTK_DAI_ETDM_FORMAT_I2S = 0,
> +	MTK_DAI_ETDM_FORMAT_DSPA = 4,
> +	MTK_DAI_ETDM_FORMAT_DSPB = 5,
> +};
> +
> +enum {
> +	ETDM_IN5 = 2,
> +	ETDM_OUT5 = 10,
> +};
> +
> +enum {
> +	MTK_ETDM_RATE_8K = 0,
> +	MTK_ETDM_RATE_12K = 1,
> +	MTK_ETDM_RATE_16K = 2,
> +	MTK_ETDM_RATE_24K = 3,
> +	MTK_ETDM_RATE_32K = 4,
> +	MTK_ETDM_RATE_48K = 5,
> +	MTK_ETDM_RATE_96K = 7,
> +	MTK_ETDM_RATE_192K = 9,
> +	MTK_ETDM_RATE_11K = 16,
> +	MTK_ETDM_RATE_22K = 17,
> +	MTK_ETDM_RATE_44K = 18,
> +	MTK_ETDM_RATE_88K = 19,
> +	MTK_ETDM_RATE_176K = 20,
> +};
> +
> +struct mtk_dai_etdm_priv {
> +	bool bck_inv;
> +	bool lrck_inv;
> +	bool slave_mode;
> +	unsigned int format;
> +};
> +
> +static unsigned int mt7986_etdm_rate_transform(struct device *dev,
> +					unsigned int rate)

Please either fix indentation or just do it in one line, 86 columns are ok.

> +{
> +	switch (rate) {
> +	case 8000:
> +		return MTK_ETDM_RATE_8K;
> +	case 11025:
> +		return MTK_ETDM_RATE_11K;
> +	case 12000:
> +		return MTK_ETDM_RATE_12K;
> +	case 16000:
> +		return MTK_ETDM_RATE_16K;
> +	case 22050:
> +		return MTK_ETDM_RATE_22K;
> +	case 24000:
> +		return MTK_ETDM_RATE_24K;
> +	case 32000:
> +		return MTK_ETDM_RATE_32K;
> +	case 44100:
> +		return MTK_ETDM_RATE_44K;
> +	case 48000:
> +		return MTK_ETDM_RATE_48K;
> +	case 88200:
> +		return MTK_ETDM_RATE_88K;
> +	case 96000:
> +		return MTK_ETDM_RATE_96K;
> +	case 176400:
> +		return MTK_ETDM_RATE_176K;
> +	case 192000:
> +		return MTK_ETDM_RATE_192K;
> +	default:
> +		dev_warn(dev, "%s(), rate %u invalid, use %d!!!\n",

s/use/using/g

> +			 __func__, rate, MTK_ETDM_RATE_48K);
> +		return MTK_ETDM_RATE_48K;
> +	}
> +}
> +
> +static int get_etdm_wlen(unsigned int bitwidth)
> +{
> +	return bitwidth <= 16 ? 16 : 32;
> +}
> +
> +/* dai component */
> +/* interconnection */
> +
> +static const struct snd_kcontrol_new o124_mix[] = {
> +	SOC_DAPM_SINGLE_AUTODISABLE("I032_Switch", AFE_CONN124_1, 0, 1, 0),
> +};
> +
> +static const struct snd_kcontrol_new o125_mix[] = {
> +	SOC_DAPM_SINGLE_AUTODISABLE("I033_Switch", AFE_CONN125_1, 1, 1, 0),
> +};
> +
> +static const struct snd_soc_dapm_widget mtk_dai_etdm_widgets[] = {
> +
> +	/* DL */
> +	SND_SOC_DAPM_MIXER("I150", SND_SOC_NOPM, 0, 0, NULL, 0),
> +	SND_SOC_DAPM_MIXER("I151", SND_SOC_NOPM, 0, 0, NULL, 0),
> +	/* UL */
> +	SND_SOC_DAPM_MIXER("O124", SND_SOC_NOPM, 0, 0,
> +			   o124_mix, ARRAY_SIZE(o124_mix)),

Fits in one line.

> +	SND_SOC_DAPM_MIXER("O125", SND_SOC_NOPM, 0, 0,
> +			   o125_mix, ARRAY_SIZE(o125_mix)),

This one too.

> +};
> +
> +static const struct snd_soc_dapm_route mtk_dai_etdm_routes[] = {
> +	{"I150", NULL, "ETDM Capture"},
> +	{"I151", NULL, "ETDM Capture"},
> +	{"ETDM Playback", NULL, "O124"},
> +	{"ETDM Playback", NULL, "O125"},
> +	{"O124", "I032_Switch", "I032"},
> +	{"O125", "I033_Switch", "I033"},
> +};
> +
> +/* dai ops */
> +static int mtk_dai_etdm_startup(struct snd_pcm_substream *substream,
> +				struct snd_soc_dai *dai)
> +{
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +
> +	mt7986_afe_enable_clock(afe);
> +
> +	regmap_update_bits(afe->regmap, AUDIO_TOP_CON2, CLK_OUT5_PDN_MASK,
> +			   0);
> +	regmap_update_bits(afe->regmap, AUDIO_TOP_CON2, CLK_IN5_PDN_MASK,
> +			   0);

Both do fit in one line (and others in this file).

After fixing that,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
