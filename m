Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 365092C0370
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 11:37:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD9341687;
	Mon, 23 Nov 2020 11:36:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD9341687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606127847;
	bh=DachXv0RmgTEL8vTzIUj1muIKXtCBJunLO9ADwBf6oY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jvTxrBs2BYFDKjDgQ+TGKdzy3QHcIV8DRtbLXZhVMqVxh4xITkrrkw36+SsfeSQFV
	 OUtq4U2Eru21duLyXlEEOzbg2xY4ORxeCHeH8HYpER43zyFhWTNYrws1mfEcgPOk3q
	 sPr9gOuDcR2gFyD/UvQosGHnWoVVhpADGiRFAeG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EA5EF80128;
	Mon, 23 Nov 2020 11:35:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BA2FF80255; Mon, 23 Nov 2020 11:35:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAFD4F80128
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 11:35:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAFD4F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="kAEUdK2R"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fbb907d0000>; Mon, 23 Nov 2020 02:35:41 -0800
Received: from [10.26.72.66] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Nov
 2020 10:35:36 +0000
Subject: Re: [PATCH v5 3/6] ASoC: tegra: Add audio graph based card driver
To: Sameer Pujar <spujar@nvidia.com>, <broonie@kernel.org>,
 <robh+dt@kernel.org>, <thierry.reding@gmail.com>
References: <1605119676-32273-1-git-send-email-spujar@nvidia.com>
 <1605119676-32273-4-git-send-email-spujar@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <46aa4d68-03e9-72e9-51f9-e67dba15f5d3@nvidia.com>
Date: Mon, 23 Nov 2020 10:35:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1605119676-32273-4-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1606127741; bh=uMDIowN3wpMWfJH47P7VBkUozBmVOf28BCnQ/0Jg7dM=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=kAEUdK2R/aWUfXr+TRSWtdJ0VtB+URhq7Y92DufuUpzrPqL8o2YjNcgiRC9XLzQ6M
 ar9rzb3qPFGBwKAyhleD7EgEryZZzhBeqP7bfCm12dBu72kK9emFDjOpTKYh3VPHk5
 dGYpULQVhOGCunoz9X4/uL9WXnT4cVdapjca4Dhzvks4UCg37SPpg4W7PzHphjrv1B
 Jbd9ggOSUbnyL/OiYjAQ92vxlRWFcN+IzvVAgWj04P7sp/hzv2fDztd8riInzpeHNX
 QwWgUBqDqCSq2DB52fVgFbgJ6wEChQypb0DYklILjRzg4t1WI4+V83BeqBYkIphBp4
 2GIaqS0iH1zng==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linux-kernel@vger.kernel.org,
 sharadg@nvidia.com, linux-tegra@vger.kernel.org
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


On 11/11/2020 18:34, Sameer Pujar wrote:
> Add Tegra audio machine driver which is based on generic audio graph card
> driver. It re-uses most of the common stuff from audio graph driver and
> uses the same DT binding. Required Tegra specific customizations are done
> in the driver and additional DT bindings are required for clock handling.
> 
> Details on the customizations done:
> 
>  - Update PLL rates at runtime: Tegra HW supports multiple sample rates
>    (multiples of 8x and 11.025x) and both of these groups require different
>    PLL rates. Hence there is a requirement to update this at runtime.
>    This is achieved by providing a custom 'snd_soc_ops' and in hw_param()
>    callback PLL rate is updated as per the sample rate.
> 
>  - Internal structure 'tegra_audio_graph_data' is used to maintain clock
>    handles of PLL.
> 
>  - The 'force_dpcm' flag is set to use DPCM for all DAI links.
> 
>  - The 'component_chaining' flag is set to use DPCM with component model.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  sound/soc/tegra/Kconfig                  |   9 ++
>  sound/soc/tegra/Makefile                 |   2 +
>  sound/soc/tegra/tegra_audio_graph_card.c | 255 +++++++++++++++++++++++++++++++
>  3 files changed, 266 insertions(+)
>  create mode 100644 sound/soc/tegra/tegra_audio_graph_card.c
> 
> diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
> index a62cc87..6dc83ad 100644
> --- a/sound/soc/tegra/Kconfig
> +++ b/sound/soc/tegra/Kconfig
> @@ -117,6 +117,15 @@ config SND_SOC_TEGRA210_ADMAIF
>  	  channel. Buffer size is configurable for each ADMAIIF channel.
>  	  Say Y or M if you want to add support for Tegra210 ADMAIF module.
>  
> +config SND_SOC_TEGRA_AUDIO_GRAPH_CARD
> +	tristate "Audio Graph Card based Tegra driver"
> +	depends on SND_AUDIO_GRAPH_CARD
> +	help
> +	  Config to enable Tegra audio machine driver based on generic
> +	  audio graph driver. It is a thin driver written to customize
> +	  few things for Tegra audio. Most of the code is re-used from
> +	  audio graph driver and the same DT bindings are used.
> +
>  config SND_SOC_TEGRA_RT5640
>  	tristate "SoC Audio support for Tegra boards using an RT5640 codec"
>  	depends on SND_SOC_TEGRA && I2C && GPIOLIB
> diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
> index 60040a0..b17dd6e 100644
> --- a/sound/soc/tegra/Makefile
> +++ b/sound/soc/tegra/Makefile
> @@ -38,6 +38,7 @@ snd-soc-tegra-trimslice-objs := trimslice.o
>  snd-soc-tegra-alc5632-objs := tegra_alc5632.o
>  snd-soc-tegra-max98090-objs := tegra_max98090.o
>  snd-soc-tegra-sgtl5000-objs := tegra_sgtl5000.o
> +snd-soc-tegra-audio-graph-card-objs := tegra_audio_graph_card.o
>  
>  obj-$(CONFIG_SND_SOC_TEGRA_RT5640) += snd-soc-tegra-rt5640.o
>  obj-$(CONFIG_SND_SOC_TEGRA_RT5677) += snd-soc-tegra-rt5677.o
> @@ -48,3 +49,4 @@ obj-$(CONFIG_SND_SOC_TEGRA_TRIMSLICE) += snd-soc-tegra-trimslice.o
>  obj-$(CONFIG_SND_SOC_TEGRA_ALC5632) += snd-soc-tegra-alc5632.o
>  obj-$(CONFIG_SND_SOC_TEGRA_MAX98090) += snd-soc-tegra-max98090.o
>  obj-$(CONFIG_SND_SOC_TEGRA_SGTL5000) += snd-soc-tegra-sgtl5000.o
> +obj-$(CONFIG_SND_SOC_TEGRA_AUDIO_GRAPH_CARD) += snd-soc-tegra-audio-graph-card.o
> diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
> new file mode 100644
> index 0000000..f4d826d
> --- /dev/null
> +++ b/sound/soc/tegra/tegra_audio_graph_card.c
> @@ -0,0 +1,255 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// tegra_audio_graph_card.c - Audio Graph based Tegra Machine Driver
> +//
> +// Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
> +
> +#include <linux/math64.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <sound/graph_card.h>
> +#include <sound/pcm_params.h>
> +
> +#define MAX_PLLA_OUT0_DIV 128
> +
> +#define simple_to_tegra_priv(simple) \
> +		container_of(simple, struct tegra_audio_priv, simple)
> +
> +enum srate_type {
> +	/*
> +	 * Sample rates multiple of 8000 Hz and below are supported:
> +	 * ( 8000, 16000, 32000, 48000, 96000, 192000 Hz )
> +	 */
> +	x8_RATE,
> +
> +	/*
> +	 * Sample rates multiple of 11025 Hz and below are supported:
> +	 * ( 11025, 22050, 44100, 88200, 176400 Hz )
> +	 */
> +	x11_RATE,
> +
> +	NUM_RATE_TYPE,
> +};
> +
> +struct tegra_audio_priv {
> +	struct asoc_simple_priv simple;
> +	struct clk *clk_plla_out0;
> +	struct clk *clk_plla;
> +};
> +
> +/* Tegra audio chip data */
> +struct tegra_audio_cdata {
> +	unsigned int plla_rates[NUM_RATE_TYPE];
> +	unsigned int plla_out0_rates[NUM_RATE_TYPE];
> +};
> +
> +/* Setup PLL clock as per the given sample rate */
> +static int tegra_audio_graph_update_pll(struct snd_pcm_substream *substream,
> +					struct snd_pcm_hw_params *params)
> +{
> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +	struct asoc_simple_priv *simple = snd_soc_card_get_drvdata(rtd->card);
> +	struct tegra_audio_priv *priv = simple_to_tegra_priv(simple);
> +	struct device *dev = rtd->card->dev;
> +	const struct tegra_audio_cdata *data = of_device_get_match_data(dev);
> +	unsigned int plla_rate, plla_out0_rate, bclk;
> +	unsigned int srate = params_rate(params);
> +	int err;
> +
> +	/* There is nothing to configure */
> +	if (!data)
> +		return 0;


Seems like this should never happen and so if it did this is an error.
Any reason why we don't return an error here?

Cheers
Jon

-- 
nvpublic
