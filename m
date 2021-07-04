Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4713BAEB9
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Jul 2021 22:12:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30FCA16AC;
	Sun,  4 Jul 2021 22:11:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30FCA16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625429556;
	bh=LSUTx+5QlCKzMxkDDvJh2a6aLg7N3xt17dQKAevHu7I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yj3aLTIPdynKEJBvXSfHZdtBLOlhQW+1x9jmfIwCi+wmu+QWTkS0MhqNl0MdBHiv3
	 hr8syo/Y1TYsOkGMXGN4PUqfbLj+arkx2wAgkYIpDbRqwF5G1NjOVjUUqxGrpwjr7e
	 7B1i+46eqRtV+nR2OMRLHc5EctlSPRW6JylCj9HA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9013DF80259;
	Sun,  4 Jul 2021 22:11:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78E68F80249; Sun,  4 Jul 2021 22:11:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C188F8014E
 for <alsa-devel@alsa-project.org>; Sun,  4 Jul 2021 22:10:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C188F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sholland.org header.i=@sholland.org
 header.b="Mv/HHXFa"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="b76Iwrde"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id A6CB8580BC5;
 Sun,  4 Jul 2021 16:10:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sun, 04 Jul 2021 16:10:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=M
 mUIwtfv5gjF9zH73t098ED1nPj8ICDYKhMVA2h1iKQ=; b=Mv/HHXFaKyCKHtetQ
 YZiQvC8Bv6DmA5TjFx+dDCHda6m/wLwDf6Boobsa6VNV+ylKHtrl88V3XHv037br
 VyXHiV2x8OoTPMTczGGmXjaGrobjH+QXO5Okou5NL4x1v9Aj0iugMJYTs9IWiUh6
 7xltQnTHfkAuEBwZN+zTQ5jlna2PtSulXD6vIJ5tgEBqqf+wyJmqcStiIuR2Hb1i
 tXt//KmvV0ycwBiGGXllZCH/jSbVI44OwfC3gtMNNm4IEvHUjmmyzeLmplyhUBt/
 f1bfKkw4FTqS4zR8u1dV+AejOR4K3T08xoggBS2//j3OFgtzWA127cPZRH4Ns7Uy
 ANzhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=MmUIwtfv5gjF9zH73t098ED1nPj8ICDYKhMVA2h1i
 KQ=; b=b76IwrdeNan05z8qPog5/tIntCkTeLVQ7qnWl9uXQlbxJ+a+bB6c+EKLQ
 m9TiuRbgvPbozwv+C4el0zE9htKRPlcjdGfkJfsEriTaqKaYtM6Ms2YwueVfrDS9
 IM9Rhx2I+WNDvi0AueTPztxmN2aLDGyE34mJRdH7B+0i99fg98l4FLeRbIHVDSbQ
 70z2SMvNkKngizvRoBjozIicbj+CaqCV6GlA78xJzytsJ2Vtsdasc8SaDEBax55m
 +TWrUOOHvPRaEwhZcK9b9D/Usp1CgMbTLl7s3AXYu3IlKKHjTixkavOUSYkvKkAw
 xP67a1cJS5CQwhvz2GQ081JYcGWFQ==
X-ME-Sender: <xms:zhXiYPUep2wC5bJ61NELe6cHHjS36m59XzLe8Z4RYDrK8R6OdjCWxw>
 <xme:zhXiYHloyrAWZhPIQN6J4DnaLtIFNksQirk70QZa8In3wRlY7ACmBQxHfIQFcrX5I
 chCDPPst5TcgsWWxQ>
X-ME-Received: <xmr:zhXiYLaJ91QOnxrw_zt_IQ0FMgTTTdWxKx5f4MOUUlQy_1VaFojsRbmz1z5rz7nLXQOV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejvddgudegfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepuffvfhfhkffffgggjggtgfesth
 ejredttdefjeenucfhrhhomhepufgrmhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghl
 sehshhholhhlrghnugdrohhrgheqnecuggftrfgrthhtvghrnhepgfevffetleehffejue
 ekvdekvdeitdehveegfeekheeuieeiueetuefgtedtgeegnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnug
 drohhrgh
X-ME-Proxy: <xmx:zhXiYKWSyp_FYB9RmbQBDGFrjEEi2lE-UZw4wGUeX5LWN3r_e37meQ>
 <xmx:zhXiYJlyYIvZWPLSNViNNVbQKuG7bOmllj1faAr1VLZpNZ7LEbnEDg>
 <xmx:zhXiYHfd-NLRmz2mERgVNBDLcNS-79ce64iw___PufiT75qTkBwquQ>
 <xmx:zxXiYM_14FNaIhm5l__Dvt_q2DBhHovJNvgXx9Wvpd-S0CZXR5lIAw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 4 Jul 2021 16:10:53 -0400 (EDT)
Subject: Re: [PATCH v5 1/2] ASoC: sunxi: Add Allwinner H6 Digital MIC driver
To: fengzheng923@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, mripard@kernel.org, wens@csie.org,
 jernej.skrabec@gmail.com, p.zabel@pengutronix.de, krzk@kernel.org
References: <20210704092109.40670-1-fengzheng923@gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <d50b2b79-3882-5324-073d-873f3521ce38@sholland.org>
Date: Sun, 4 Jul 2021 15:10:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20210704092109.40670-1-fengzheng923@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
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

Hi,

On 7/4/21 4:21 AM, fengzheng923@gmail.com wrote:
> From: Ban Tao <fengzheng923@gmail.com>
> 
> The Allwinner H6 and later SoCs have an DMIC block
> which is capable of capture.
> 
> Signed-off-by: Ban Tao <fengzheng923@gmail.com>
> 
> ---
> v1->v2:
> 1.Fix some compilation errors.
> 2.Modify some code styles.
> ---
> v2->v3:
> None.
> ---
> v3->v4:
> 1.add sig_bits.
> ---
> v4->v5:
> None.
> ---

Thanks for the updates! The driver is looking good. I found a couple more small
things (below) when reading through it again.

>  MAINTAINERS                   |   7 +
>  sound/soc/sunxi/Kconfig       |   8 +
>  sound/soc/sunxi/Makefile      |   1 +
>  sound/soc/sunxi/sun50i-dmic.c | 405 ++++++++++++++++++++++++++++++++++
>  4 files changed, 421 insertions(+)
>  create mode 100644 sound/soc/sunxi/sun50i-dmic.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e924f9e5df97..8d700baaa3ca 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -760,6 +760,13 @@ L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	drivers/staging/media/sunxi/cedrus/
>  
> +ALLWINNER DMIC DRIVERS
> +M:	Ban Tao <fengzheng923@gmail.com>
> +L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
> +F:	sound/soc/sunxi/sun50i-dmic.c
> +
>  ALPHA PORT
>  M:	Richard Henderson <rth@twiddle.net>
>  M:	Ivan Kokshaysky <ink@jurassic.park.msu.ru>
> diff --git a/sound/soc/sunxi/Kconfig b/sound/soc/sunxi/Kconfig
> index ddcaaa98d3cb..2a3bf7722e11 100644
> --- a/sound/soc/sunxi/Kconfig
> +++ b/sound/soc/sunxi/Kconfig
> @@ -56,6 +56,14 @@ config SND_SUN4I_SPDIF
>  	  Say Y or M to add support for the S/PDIF audio block in the Allwinner
>  	  A10 and affiliated SoCs.
>  
> +config SND_SUN50I_DMIC
> +	tristate "Allwinner H6 DMIC Support"
> +	depends on (OF && ARCH_SUNXI) || COMPILE_TEST
> +	select SND_SOC_GENERIC_DMAENGINE_PCM
> +	help
> +	  Say Y or M to add support for the DMIC audio block in the Allwinner
> +	  H6 and affiliated SoCs.
> +
>  config SND_SUN8I_ADDA_PR_REGMAP
>  	tristate
>  	select REGMAP
> diff --git a/sound/soc/sunxi/Makefile b/sound/soc/sunxi/Makefile
> index a86be340a076..4483fe9c94ef 100644
> --- a/sound/soc/sunxi/Makefile
> +++ b/sound/soc/sunxi/Makefile
> @@ -6,3 +6,4 @@ obj-$(CONFIG_SND_SUN8I_CODEC_ANALOG) += sun8i-codec-analog.o
>  obj-$(CONFIG_SND_SUN50I_CODEC_ANALOG) += sun50i-codec-analog.o
>  obj-$(CONFIG_SND_SUN8I_CODEC) += sun8i-codec.o
>  obj-$(CONFIG_SND_SUN8I_ADDA_PR_REGMAP) += sun8i-adda-pr-regmap.o
> +obj-$(CONFIG_SND_SUN50I_DMIC) += sun50i-dmic.o
> diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
> new file mode 100644
> index 000000000000..720d15e4b8ba
> --- /dev/null
> +++ b/sound/soc/sunxi/sun50i-dmic.c
> @@ -0,0 +1,405 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +//
> +// This driver supports the DMIC in Allwinner's H6 SoCs.
> +//
> +// Copyright 2021 Ban Tao <fengzheng923@gmail.com>
> +
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/of_device.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +#include <sound/dmaengine_pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +
> +#define SUN50I_DMIC_EN_CTL		(0x00)
> +	#define SUN50I_DMIC_EN_CTL_GLOBE			BIT(8)
> +	#define SUN50I_DMIC_EN_CTL_CHAN(v)		((v) << 0)
> +	#define SUN50I_DMIC_EN_CTL_CHAN_MASK		GENMASK(7, 0)
> +#define SUN50I_DMIC_SR			(0x04)
> +	#define SUN50I_DMIC_SR_SAMOLE_RATE(v)		((v) << 0)
> +	#define SUN50I_DMIC_SR_SAMOLE_RATE_MASK		GENMASK(2, 0)

Typo: SAMPLE

> +#define SUN50I_DMIC_CTL			(0x08)
> +	#define SUN50I_DMIC_CTL_OVERSAMPLE_RATE		BIT(0)
> +#define SUN50I_DMIC_DATA			(0x10)
> +#define SUN50I_DMIC_INTC			(0x14)
> +	#define SUN50I_DMIC_FIFO_DRQ_EN			BIT(2)
> +#define SUN50I_DMIC_INT_STA		(0x18)
> +	#define SUN50I_DMIC_INT_STA_OVERRUN_IRQ_PENDING	BIT(1)
> +	#define SUN50I_DMIC_INT_STA_DATA_IRQ_PENDING	BIT(0)
> +#define SUN50I_DMIC_RXFIFO_CTL		(0x1c)
> +	#define SUN50I_DMIC_RXFIFO_CTL_FLUSH		BIT(31)
> +	#define SUN50I_DMIC_RXFIFO_CTL_MODE		BIT(9)
> +	#define SUN50I_DMIC_RXFIFO_CTL_RESOLUTION	BIT(8)
> +#define SUN50I_DMIC_CH_NUM		(0x24)
> +	#define SUN50I_DMIC_CH_NUM_N(v)			((v) << 0)
> +	#define SUN50I_DMIC_CH_NUM_N_MASK		GENMASK(2, 0)
> +#define SUN50I_DMIC_CNT			(0x2c)
> +	#define SUN50I_DMIC_CNT_N			BIT(0)
> +#define SUN50I_DMIC_HPF_CTRL		(0x38)
> +#define SUN50I_DMIC_VERSION		(0x50)
> +
> +
> +struct sun50i_dmic_dev {
> +	struct clk *dmic_clk;
> +	struct clk *bus_clk;
> +	struct reset_control *rst;
> +	struct regmap *regmap;
> +	struct snd_dmaengine_dai_dma_data dma_params_rx;
> +	unsigned int chan_en;
> +};
> +
> +struct dmic_rate {
> +	unsigned int samplerate;
> +	unsigned int rate_bit;
> +};
> +
> +static int sun50i_dmic_startup(struct snd_pcm_substream *substream,
> +			       struct snd_soc_dai *cpu_dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
> +
> +	/* only support capture */
> +	if (substream->stream != SNDRV_PCM_STREAM_CAPTURE)
> +		return -EINVAL;
> +
> +	regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
> +			   SUN50I_DMIC_RXFIFO_CTL_FLUSH,
> +			   SUN50I_DMIC_RXFIFO_CTL_FLUSH);
> +	regmap_write(host->regmap, SUN50I_DMIC_CNT, SUN50I_DMIC_CNT_N);
> +
> +	return 0;
> +}
> +
> +static int sun50i_dmic_hw_params(struct snd_pcm_substream *substream,
> +				 struct snd_pcm_hw_params *params,
> +				 struct snd_soc_dai *cpu_dai)
> +{
> +	int i = 0;
> +	unsigned long rate = params_rate(params);
> +	unsigned int mclk = 0;
> +	unsigned int channels = params_channels(params);
> +	struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(cpu_dai);
> +	struct dmic_rate dmic_rate_s[] = {

This needs to be static, or it will get initialized every time the function is
called.

> +		{44100, 0x0},
> +		{48000, 0x0},
> +		{22050, 0x2},
> +		{24000, 0x2},
> +		{11025, 0x4},
> +		{12000, 0x4},
> +		{32000, 0x1},
> +		{16000, 0x3},
> +		{8000,  0x5},
> +	};
> +
> +	/* DMIC num is N+1 */
> +	regmap_update_bits(host->regmap, SUN50I_DMIC_CH_NUM,
> +			   SUN50I_DMIC_CH_NUM_N_MASK,
> +			   SUN50I_DMIC_CH_NUM_N(channels - 1));
> +	host->chan_en = (1 << channels) - 1;
> +	regmap_write(host->regmap, SUN50I_DMIC_HPF_CTRL, host->chan_en);
> +
> +	switch (params_format(params)) {
> +	case SNDRV_PCM_FORMAT_S16_LE:
> +		regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
> +				   SUN50I_DMIC_RXFIFO_CTL_MODE,
> +				   SUN50I_DMIC_RXFIFO_CTL_MODE);
> +		regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
> +				   SUN50I_DMIC_RXFIFO_CTL_RESOLUTION, 0);
> +		break;
> +	case SNDRV_PCM_FORMAT_S24_LE:
> +		regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
> +				   SUN50I_DMIC_RXFIFO_CTL_MODE, 0);

I still believe this should be mode 1, but I don't have any hardware to test
with and know for sure.

Have you tested this driver with S24_LE? Even if it doesn't quite make sense to
me, I am fine with the current code as long as it works.

With these resolved, I am happy to give my Reviewed-by.

Cheers,
Samuel

> +		regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
> +				   SUN50I_DMIC_RXFIFO_CTL_RESOLUTION,
> +				   SUN50I_DMIC_RXFIFO_CTL_RESOLUTION);
> +		break;
> +	default:
> +		dev_err(cpu_dai->dev, "Invalid format!\n");
> +		return -EINVAL;
> +	}
> +
> +	switch (rate) {
> +	case 11025:
> +	case 22050:
> +	case 44100:
> +		mclk = 22579200;
> +		break;
> +	case 8000:
> +	case 12000:
> +	case 16000:
> +	case 24000:
> +	case 32000:
> +	case 48000:
> +		mclk = 24576000;
> +		break;
> +	default:
> +		dev_err(cpu_dai->dev, "Invalid rate!\n");
> +		return -EINVAL;
> +	}
> +
> +	if (clk_set_rate(host->dmic_clk, mclk)) {
> +		dev_err(cpu_dai->dev, "mclk : %u not support\n", mclk);
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(dmic_rate_s); i++) {
> +		if (dmic_rate_s[i].samplerate == rate) {
> +			regmap_update_bits(host->regmap, SUN50I_DMIC_SR,
> +					   SUN50I_DMIC_SR_SAMOLE_RATE_MASK,
> +					   SUN50I_DMIC_SR_SAMOLE_RATE(dmic_rate_s[i].rate_bit));
> +			break;
> +		}
> +	}
> +
> +	switch (params_physical_width(params)) {
> +	case 16:
> +		host->dma_params_rx.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
> +		break;
> +	case 32:
> +		host->dma_params_rx.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +		break;
> +	default:
> +		dev_err(cpu_dai->dev, "Unsupported physical sample width: %d\n",
> +			params_physical_width(params));
> +		return -EINVAL;
> +	}
> +
> +	/* oversamplerate adjust */
> +	if (params_rate(params) >= 24000)
> +		regmap_update_bits(host->regmap, SUN50I_DMIC_CTL,
> +				   SUN50I_DMIC_CTL_OVERSAMPLE_RATE,
> +				   SUN50I_DMIC_CTL_OVERSAMPLE_RATE);
> +	else
> +		regmap_update_bits(host->regmap, SUN50I_DMIC_CTL,
> +				   SUN50I_DMIC_CTL_OVERSAMPLE_RATE, 0);
> +
> +	return 0;
> +}
> +
> +static int sun50i_dmic_trigger(struct snd_pcm_substream *substream, int cmd,
> +			       struct snd_soc_dai *dai)
> +{
> +	int ret = 0;
> +	struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(dai);
> +
> +	if (substream->stream != SNDRV_PCM_STREAM_CAPTURE)
> +		return -EINVAL;
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		/* DRQ ENABLE */
> +		regmap_update_bits(host->regmap, SUN50I_DMIC_INTC,
> +				   SUN50I_DMIC_FIFO_DRQ_EN,
> +				   SUN50I_DMIC_FIFO_DRQ_EN);
> +		regmap_update_bits(host->regmap, SUN50I_DMIC_EN_CTL,
> +				   SUN50I_DMIC_EN_CTL_CHAN_MASK,
> +				   SUN50I_DMIC_EN_CTL_CHAN(host->chan_en));
> +		/* Global enable */
> +		regmap_update_bits(host->regmap, SUN50I_DMIC_EN_CTL,
> +				   SUN50I_DMIC_EN_CTL_GLOBE,
> +				   SUN50I_DMIC_EN_CTL_GLOBE);
> +		break;
> +
> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		/* DRQ DISABLE */
> +		regmap_update_bits(host->regmap, SUN50I_DMIC_INTC,
> +				   SUN50I_DMIC_FIFO_DRQ_EN, 0);
> +		regmap_update_bits(host->regmap, SUN50I_DMIC_EN_CTL,
> +				   SUN50I_DMIC_EN_CTL_CHAN_MASK,
> +				   SUN50I_DMIC_EN_CTL_CHAN(0));
> +		/* Global disable */
> +		regmap_update_bits(host->regmap, SUN50I_DMIC_EN_CTL,
> +				   SUN50I_DMIC_EN_CTL_GLOBE, 0);
> +		break;
> +
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +	return ret;
> +}
> +
> +static int sun50i_dmic_soc_dai_probe(struct snd_soc_dai *dai)
> +{
> +	struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(dai);
> +
> +	snd_soc_dai_init_dma_data(dai, NULL, &host->dma_params_rx);
> +
> +	return 0;
> +}
> +
> +static const struct snd_soc_dai_ops sun50i_dmic_dai_ops = {
> +	.startup	= sun50i_dmic_startup,
> +	.trigger	= sun50i_dmic_trigger,
> +	.hw_params	= sun50i_dmic_hw_params,
> +};
> +
> +static const struct regmap_config sun50i_dmic_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.max_register = SUN50I_DMIC_VERSION,
> +	.cache_type = REGCACHE_NONE,
> +};
> +
> +#define	SUN50I_DMIC_RATES (SNDRV_PCM_RATE_8000_48000)
> +#define SUN50I_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
> +
> +static struct snd_soc_dai_driver sun50i_dmic_dai = {
> +	.capture = {
> +		.channels_min = 1,
> +		.channels_max = 8,
> +		.rates = SUN50I_DMIC_RATES,
> +		.formats = SUN50I_FORMATS,
> +		.sig_bits = 21,
> +	},
> +	.probe = sun50i_dmic_soc_dai_probe,
> +	.ops = &sun50i_dmic_dai_ops,
> +	.name = "dmic",
> +};
> +
> +static const struct of_device_id sun50i_dmic_of_match[] = {
> +	{
> +		.compatible = "allwinner,sun50i-h6-dmic",
> +	},
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, sun50i_dmic_of_match);
> +
> +static const struct snd_soc_component_driver sun50i_dmic_component = {
> +	.name		= "sun50i-dmic",
> +};
> +
> +static int sun50i_dmic_runtime_suspend(struct device *dev)
> +{
> +	struct sun50i_dmic_dev *host  = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(host->dmic_clk);
> +	clk_disable_unprepare(host->bus_clk);
> +
> +	return 0;
> +}
> +
> +static int sun50i_dmic_runtime_resume(struct device *dev)
> +{
> +	struct sun50i_dmic_dev *host  = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(host->dmic_clk);
> +	if (ret)
> +		return ret;
> +	ret = clk_prepare_enable(host->bus_clk);
> +	if (ret)
> +		clk_disable_unprepare(host->dmic_clk);
> +
> +	return ret;
> +}
> +
> +static int sun50i_dmic_probe(struct platform_device *pdev)
> +{
> +	struct sun50i_dmic_dev *host;
> +	struct resource *res;
> +	int ret;
> +	void __iomem *base;
> +
> +	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
> +	if (!host)
> +		return -ENOMEM;
> +
> +	/* Get the addresses */
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(base))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(base),
> +				     "get resource failed.\n");
> +
> +	host->regmap = devm_regmap_init_mmio(&pdev->dev, base,
> +						&sun50i_dmic_regmap_config);
> +
> +	/* Clocks */
> +	host->bus_clk = devm_clk_get(&pdev->dev, "bus");
> +	if (IS_ERR(host->bus_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(host->bus_clk),
> +				     "failed to get bus clock.\n");
> +
> +	host->dmic_clk = devm_clk_get(&pdev->dev, "mod");
> +	if (IS_ERR(host->dmic_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(host->dmic_clk),
> +				     "failed to get dmic clock.\n");
> +
> +	host->dma_params_rx.addr = res->start + SUN50I_DMIC_DATA;
> +	host->dma_params_rx.maxburst = 8;
> +
> +	platform_set_drvdata(pdev, host);
> +
> +	host->rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(host->rst))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(host->rst),
> +				     "Failed to get reset.\n");
> +	reset_control_deassert(host->rst);
> +
> +	ret = devm_snd_soc_register_component(&pdev->dev,
> +				&sun50i_dmic_component, &sun50i_dmic_dai, 1);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to register component.\n");
> +
> +	pm_runtime_enable(&pdev->dev);
> +	if (!pm_runtime_enabled(&pdev->dev)) {
> +		ret = sun50i_dmic_runtime_resume(&pdev->dev);
> +		if (ret)
> +			goto err_unregister;
> +	}
> +
> +	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
> +	if (ret)
> +		goto err_suspend;
> +
> +	return 0;
> +err_suspend:
> +	if (!pm_runtime_status_suspended(&pdev->dev))
> +		sun50i_dmic_runtime_suspend(&pdev->dev);
> +err_unregister:
> +	pm_runtime_disable(&pdev->dev);
> +	return ret;
> +}
> +
> +static int sun50i_dmic_remove(struct platform_device *pdev)
> +{
> +	pm_runtime_disable(&pdev->dev);
> +	if (!pm_runtime_status_suspended(&pdev->dev))
> +		sun50i_dmic_runtime_suspend(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops sun50i_dmic_pm = {
> +	SET_RUNTIME_PM_OPS(sun50i_dmic_runtime_suspend,
> +			   sun50i_dmic_runtime_resume, NULL)
> +};
> +
> +static struct platform_driver sun50i_dmic_driver = {
> +	.driver		= {
> +		.name	= "sun50i-dmic",
> +		.of_match_table = of_match_ptr(sun50i_dmic_of_match),
> +		.pm	= &sun50i_dmic_pm,
> +	},
> +	.probe		= sun50i_dmic_probe,
> +	.remove		= sun50i_dmic_remove,
> +};
> +
> +module_platform_driver(sun50i_dmic_driver);
> +
> +MODULE_DESCRIPTION("Allwinner sun50i DMIC SoC Interface");
> +MODULE_AUTHOR("Ban Tao <fengzheng923@gmail.com>");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:sun50i-dmic");
> 

