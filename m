Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E5F2C0D14
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 15:19:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 167951672;
	Mon, 23 Nov 2020 15:18:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 167951672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606141150;
	bh=/y0zDnr1Ers56l2LNSUxfHYdMlTlmOLmNzDeWsGsXGQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=akWlYiddpWmfPZOch+1pHDkQB1KtkLKvwQ+TsbuD7jypZ/8XuMdX8boq/8GKw3luC
	 iQnP2NRelkveGvkhZu2bIIKedkp6VO6uDgGJznOxgnQqZ//yEQfJY+2ycz0PpW6AEN
	 4Zi9EcYNRSlPBHP+ySZiXXlqh53cWJmgbeSpwsVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CF09F8015F;
	Mon, 23 Nov 2020 15:17:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02A4AF80255; Mon, 23 Nov 2020 15:17:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D48DF8015B
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 15:17:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D48DF8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="aJ1HCIIq"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fbbc4750000>; Mon, 23 Nov 2020 06:17:25 -0800
Received: from [10.25.102.126] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Nov
 2020 14:17:19 +0000
Subject: Re: [PATCH v5 3/6] ASoC: tegra: Add audio graph based card driver
To: Jon Hunter <jonathanh@nvidia.com>, <broonie@kernel.org>,
 <robh+dt@kernel.org>, <thierry.reding@gmail.com>
References: <1605119676-32273-1-git-send-email-spujar@nvidia.com>
 <1605119676-32273-4-git-send-email-spujar@nvidia.com>
 <46aa4d68-03e9-72e9-51f9-e67dba15f5d3@nvidia.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <43ace5b2-b3ff-ea7c-dbc4-38833a9c873d@nvidia.com>
Date: Mon, 23 Nov 2020 19:47:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <46aa4d68-03e9-72e9-51f9-e67dba15f5d3@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1606141045; bh=xe5FC1ykPtZxtumbq2Zvv2h2gJPih65n9frebEMU8cw=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=aJ1HCIIqacDVI3gmgvyRLBcakVhyHFl2DIzv76Hok5W3VzK9xcKQTBThyKERrfUTK
 boKNmEuS3G7cq5TV7wCUvwKDf72RlO4g6ZG/lKTVAWUL1kI4+CtFv7RY+LqxklCxo0
 MBpoRiiIYD1RuUCxDbqCNIi1/zuZ5rbC2aoMPFHyl6jnT82GQ3EO0OKjhYF2JvbYe9
 TslGSMdqueoU7z9LdXmzEDgQq1Nz6mzYlWKTP7p231IiVPiTeC5hBCREdZdcgq7QEc
 71J0oDVUFoDLzNBr9/GkXriKR2Lb72aLfG3E7PsHyyDFsRi+VBaeW7Kxlsqrd2Aihe
 7RbERH/TSkC2g==
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


>> Add Tegra audio machine driver which is based on generic audio graph card
>> driver. It re-uses most of the common stuff from audio graph driver and
>> uses the same DT binding. Required Tegra specific customizations are done
>> in the driver and additional DT bindings are required for clock handling.
>>
>> Details on the customizations done:
>>
>>   - Update PLL rates at runtime: Tegra HW supports multiple sample rates
>>     (multiples of 8x and 11.025x) and both of these groups require different
>>     PLL rates. Hence there is a requirement to update this at runtime.
>>     This is achieved by providing a custom 'snd_soc_ops' and in hw_param()
>>     callback PLL rate is updated as per the sample rate.
>>
>>   - Internal structure 'tegra_audio_graph_data' is used to maintain clock
>>     handles of PLL.
>>
>>   - The 'force_dpcm' flag is set to use DPCM for all DAI links.
>>
>>   - The 'component_chaining' flag is set to use DPCM with component model.
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> ---
>>   sound/soc/tegra/Kconfig                  |   9 ++
>>   sound/soc/tegra/Makefile                 |   2 +
>>   sound/soc/tegra/tegra_audio_graph_card.c | 255 +++++++++++++++++++++++++++++++
>>   3 files changed, 266 insertions(+)
>>   create mode 100644 sound/soc/tegra/tegra_audio_graph_card.c
>>
>> diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
>> index a62cc87..6dc83ad 100644
>> --- a/sound/soc/tegra/Kconfig
>> +++ b/sound/soc/tegra/Kconfig
>> @@ -117,6 +117,15 @@ config SND_SOC_TEGRA210_ADMAIF
>>   	  channel. Buffer size is configurable for each ADMAIIF channel.
>>   	  Say Y or M if you want to add support for Tegra210 ADMAIF module.
>>   
>> +config SND_SOC_TEGRA_AUDIO_GRAPH_CARD
>> +	tristate "Audio Graph Card based Tegra driver"
>> +	depends on SND_AUDIO_GRAPH_CARD
>> +	help
>> +	  Config to enable Tegra audio machine driver based on generic
>> +	  audio graph driver. It is a thin driver written to customize
>> +	  few things for Tegra audio. Most of the code is re-used from
>> +	  audio graph driver and the same DT bindings are used.
>> +
>>   config SND_SOC_TEGRA_RT5640
>>   	tristate "SoC Audio support for Tegra boards using an RT5640 codec"
>>   	depends on SND_SOC_TEGRA && I2C && GPIOLIB
>> diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
>> index 60040a0..b17dd6e 100644
>> --- a/sound/soc/tegra/Makefile
>> +++ b/sound/soc/tegra/Makefile
>> @@ -38,6 +38,7 @@ snd-soc-tegra-trimslice-objs := trimslice.o
>>   snd-soc-tegra-alc5632-objs := tegra_alc5632.o
>>   snd-soc-tegra-max98090-objs := tegra_max98090.o
>>   snd-soc-tegra-sgtl5000-objs := tegra_sgtl5000.o
>> +snd-soc-tegra-audio-graph-card-objs := tegra_audio_graph_card.o
>>   
>>   obj-$(CONFIG_SND_SOC_TEGRA_RT5640) += snd-soc-tegra-rt5640.o
>>   obj-$(CONFIG_SND_SOC_TEGRA_RT5677) += snd-soc-tegra-rt5677.o
>> @@ -48,3 +49,4 @@ obj-$(CONFIG_SND_SOC_TEGRA_TRIMSLICE) += snd-soc-tegra-trimslice.o
>>   obj-$(CONFIG_SND_SOC_TEGRA_ALC5632) += snd-soc-tegra-alc5632.o
>>   obj-$(CONFIG_SND_SOC_TEGRA_MAX98090) += snd-soc-tegra-max98090.o
>>   obj-$(CONFIG_SND_SOC_TEGRA_SGTL5000) += snd-soc-tegra-sgtl5000.o
>> +obj-$(CONFIG_SND_SOC_TEGRA_AUDIO_GRAPH_CARD) += snd-soc-tegra-audio-graph-card.o
>> diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
>> new file mode 100644
>> index 0000000..f4d826d
>> --- /dev/null
>> +++ b/sound/soc/tegra/tegra_audio_graph_card.c
>> @@ -0,0 +1,255 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +//
>> +// tegra_audio_graph_card.c - Audio Graph based Tegra Machine Driver
>> +//
>> +// Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
>> +
>> +#include <linux/math64.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/platform_device.h>
>> +#include <sound/graph_card.h>
>> +#include <sound/pcm_params.h>
>> +
>> +#define MAX_PLLA_OUT0_DIV 128
>> +
>> +#define simple_to_tegra_priv(simple) \
>> +		container_of(simple, struct tegra_audio_priv, simple)
>> +
>> +enum srate_type {
>> +	/*
>> +	 * Sample rates multiple of 8000 Hz and below are supported:
>> +	 * ( 8000, 16000, 32000, 48000, 96000, 192000 Hz )
>> +	 */
>> +	x8_RATE,
>> +
>> +	/*
>> +	 * Sample rates multiple of 11025 Hz and below are supported:
>> +	 * ( 11025, 22050, 44100, 88200, 176400 Hz )
>> +	 */
>> +	x11_RATE,
>> +
>> +	NUM_RATE_TYPE,
>> +};
>> +
>> +struct tegra_audio_priv {
>> +	struct asoc_simple_priv simple;
>> +	struct clk *clk_plla_out0;
>> +	struct clk *clk_plla;
>> +};
>> +
>> +/* Tegra audio chip data */
>> +struct tegra_audio_cdata {
>> +	unsigned int plla_rates[NUM_RATE_TYPE];
>> +	unsigned int plla_out0_rates[NUM_RATE_TYPE];
>> +};
>> +
>> +/* Setup PLL clock as per the given sample rate */
>> +static int tegra_audio_graph_update_pll(struct snd_pcm_substream *substream,
>> +					struct snd_pcm_hw_params *params)
>> +{
>> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
>> +	struct asoc_simple_priv *simple = snd_soc_card_get_drvdata(rtd->card);
>> +	struct tegra_audio_priv *priv = simple_to_tegra_priv(simple);
>> +	struct device *dev = rtd->card->dev;
>> +	const struct tegra_audio_cdata *data = of_device_get_match_data(dev);
>> +	unsigned int plla_rate, plla_out0_rate, bclk;
>> +	unsigned int srate = params_rate(params);
>> +	int err;
>> +
>> +	/* There is nothing to configure */
>> +	if (!data)
>> +		return 0;
>
> Seems like this should never happen and so if it did this is an error.
> Any reason why we don't return an error here?

I was thinking it is OK for platforms to use fixed PLL rates and in such 
cases they don't have to define chip data. But yes currently there is no 
case for it and I will simply drop this check in v6.
