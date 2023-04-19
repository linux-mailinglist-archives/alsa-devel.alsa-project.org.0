Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D146E7C83
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 16:25:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87395ED4;
	Wed, 19 Apr 2023 16:24:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87395ED4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681914327;
	bh=VfAqmXtvXIohfJSWKBOKBjQwzRtT5mK7caLOPnc+fUw=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gv3ubkzrbzvJdHaRt7vDmERbBFSpxAecWWbEF2LKgib+okmMb5xB12j2M/Jcqjybu
	 OE25ck7Lo/dzOX9D7EJFoYmAv+hjjLuUMELRM7hbDtrgpZYv/gPkJklgUXZ7J2UQqD
	 JeNsVBJYP3fRco2AwYwh7mOW8HhOFgo6yIi6R3mE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ACE3F80149;
	Wed, 19 Apr 2023 16:24:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 889D1F80528; Wed, 19 Apr 2023 16:24:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A5CAF800D0
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 16:24:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A5CAF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iRTehmpW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681914266; x=1713450266;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=VfAqmXtvXIohfJSWKBOKBjQwzRtT5mK7caLOPnc+fUw=;
  b=iRTehmpWvNY8ry/LibLjQB6QRLLF+cPmPPmsCdEpR3VMTxFEiegyBh7Z
   1l4TxTcuU2rR2VDNX+8hYDV/fuJNN3nnqE6l044cjX6QB0StcKsLciQ0r
   Yhximdl6Sq/ZtgHtjo/GJoB0fi2RGDCK+VDSQbHb1f0VZZ9Cz9XDjjQbE
   ErawgKukPVraoyqO52YNMYWc+WTVK39fnCVfmcvZcr5dDo+3TUiQZZoGw
   leKfsksXYgPvyODTSz+ON1efMDIKUcOHLSqw6218K7zXcWa9/GEckuRXC
   4ttYlkwMooi5tEEMpn0QXM2gymw1IB3mtppwjBACAvbyuYLD52TdkBwqK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325075276"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200";
   d="scan'208";a="325075276"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 07:24:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="1021225514"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200";
   d="scan'208";a="1021225514"
Received: from gargicha-mobl1.amr.corp.intel.com (HELO [10.209.74.38])
 ([10.209.74.38])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 07:24:20 -0700
Message-ID: <b18d5eb9-17c5-72f8-9e79-60d591003e81@linux.intel.com>
Date: Wed, 19 Apr 2023 09:24:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH v2] ASoC: rt722-sdca: Add RT722 SDCA driver
Content-Language: en-US
To: Jack Yu <jack.yu@realtek.com>, broonie@kernel.org, lgirdwood@gmail.com
References: <20230419101538.30633-1-jack.yu@realtek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230419101538.30633-1-jack.yu@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LYG7GG5NGX7I7P5RIKP7Q52S4IOB4ZEN
X-Message-ID-Hash: LYG7GG5NGX7I7P5RIKP7Q52S4IOB4ZEN
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, shumingf@realtek.com, derek.fang@realtek.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LYG7GG5NGX7I7P5RIKP7Q52S4IOB4ZEN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/19/23 05:15, Jack Yu wrote:
> This is the initial codec driver for rt722-sdca.
> 
> Patch v2 is to fix warning message from kernel test robot.

this version information should go below the --- line ...
> 
> Signed-off-by: Jack Yu <jack.yu@realtek.com>
> ---

... here


> +static int rt722_sdca_read_prop(struct sdw_slave *slave)
> +{
> +	struct sdw_slave_prop *prop = &slave->prop;
> +	int nval;
> +	int i, j;
> +	u32 bit;
> +	unsigned long addr;
> +	struct sdw_dpn_prop *dpn;
> +
> +	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
> +	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
> +
> +	prop->paging_support = true;
> +
> +	/* first we need to allocate memory for set bits in port lists */
> +	prop->source_ports = BIT(6) | BIT(2); /* BITMAP: 01000100 */
> +	prop->sink_ports = BIT(3) | BIT(1); /* BITMAP:  00001010 */

which port is used for what?

> +
> +	nval = hweight32(prop->source_ports);
> +	prop->src_dpn_prop = devm_kcalloc(&slave->dev, nval,
> +		sizeof(*prop->src_dpn_prop), GFP_KERNEL);
> +	if (!prop->src_dpn_prop)
> +		return -ENOMEM;
> +
> +	i = 0;
> +	dpn = prop->src_dpn_prop;
> +	addr = prop->source_ports;
> +	for_each_set_bit(bit, &addr, 32) {
> +		dpn[i].num = bit;
> +		dpn[i].type = SDW_DPN_FULL;
> +		dpn[i].simple_ch_prep_sm = true;
> +		dpn[i].ch_prep_timeout = 10;
> +		i++;
> +	}
> +
> +	/* do this again for sink now */
> +	nval = hweight32(prop->sink_ports);
> +	prop->sink_dpn_prop = devm_kcalloc(&slave->dev, nval,
> +		sizeof(*prop->sink_dpn_prop), GFP_KERNEL);
> +	if (!prop->sink_dpn_prop)
> +		return -ENOMEM;
> +
> +	j = 0;
> +	dpn = prop->sink_dpn_prop;
> +	addr = prop->sink_ports;
> +	for_each_set_bit(bit, &addr, 32) {
> +		dpn[j].num = bit;
> +		dpn[j].type = SDW_DPN_FULL;
> +		dpn[j].simple_ch_prep_sm = true;
> +		dpn[j].ch_prep_timeout = 10;
> +		j++;
> +	}
> +
> +	/* set the timeout values */
> +	prop->clk_stop_timeout = 200;
> +
> +	/* wake-up event */
> +	prop->wake_capable = 1;
> +
> +	return 0;
> +}

> +static int rt722_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
> +				struct snd_pcm_hw_params *params,
> +				struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct rt722_sdca_priv *rt722 = snd_soc_component_get_drvdata(component);
> +	struct sdw_stream_config stream_config;
> +	struct sdw_port_config port_config;
> +	enum sdw_data_direction direction;
> +	struct sdw_stream_runtime *sdw_stream;
> +	int retval, port, num_channels;
> +	unsigned int sampling_rate;
> +
> +	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
> +	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
> +
> +	if (!sdw_stream)
> +		return -EINVAL;
> +
> +	if (!rt722->slave)
> +		return -EINVAL;
> +
> +	/*
> +	 * RT722_AIF1 with port = 1 for headphone playback
> +	 * RT722_AIF1 with port = 2 for headset-mic capture
> +	 * RT722_AIF2 with port = 3 for speaker playback
> +	 * RT722_AIF2 with port = 6 for digital-mic capture
> +	 */

I guess the answer is here...

It wouldn't hurt to have the information above as well.

It's also an interesting partition because in theory the amplifier and
mic 'functions' are supposed to be independent, yet they are on the same
DAI.

Bard, would this work for the machine driver integration?

> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		direction = SDW_DATA_DIR_RX;
> +		if (dai->id == RT722_AIF1)
> +			port = 1;
> +		else if (dai->id == RT722_AIF2)
> +			port = 3;
> +		else
> +			return -EINVAL;
> +	} else {
> +		direction = SDW_DATA_DIR_TX;
> +		if (dai->id == RT722_AIF1)
> +			port = 2;
> +		else if (dai->id == RT722_AIF2)
> +			port = 6;
> +		else
> +			return -EINVAL;
> +	}
> +	stream_config.frame_rate = params_rate(params);
> +	stream_config.ch_count = params_channels(params);
> +	stream_config.bps = snd_pcm_format_width(params_format(params));
> +	stream_config.direction = direction;
> +
> +	num_channels = params_channels(params);
> +	port_config.ch_mask = GENMASK(num_channels - 1, 0);
> +	port_config.num = port;
> +
> +	retval = sdw_stream_add_slave(rt722->slave, &stream_config,
> +					&port_config, 1, sdw_stream);
> +	if (retval) {
> +		dev_err(dai->dev, "Unable to configure port\n");
> +		return retval;
> +	}
> +
> +	if (params_channels(params) > 16) {
> +		dev_err(component->dev, "Unsupported channels %d\n",
> +			params_channels(params));
> +		return -EINVAL;
> +	}
> +
> +	/* sampling rate configuration */
> +	switch (params_rate(params)) {
> +	case 44100:
> +		sampling_rate = RT722_SDCA_RATE_44100HZ;
> +		break;
> +	case 48000:
> +		sampling_rate = RT722_SDCA_RATE_48000HZ;
> +		break;
> +	case 96000:
> +		sampling_rate = RT722_SDCA_RATE_96000HZ;
> +		break;
> +	case 192000:
> +		sampling_rate = RT722_SDCA_RATE_192000HZ;
> +		break;
> +	default:
> +		dev_err(component->dev, "Rate %d is not supported\n",
> +			params_rate(params));
> +		return -EINVAL;
> +	}
> +
> +	/* set sampling frequency */
> +	if (dai->id == RT722_AIF1) {
> +		regmap_write(rt722->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_CS01,
> +				RT722_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), sampling_rate);
> +		regmap_write(rt722->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_CS11,
> +				RT722_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), sampling_rate);
> +	}
> +
> +	if (dai->id == RT722_AIF2) {
> +		regmap_write(rt722->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT_CS1F,
> +				RT722_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), sampling_rate);
> +		regmap_write(rt722->regmap,
> +			SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_CS31,
> +				RT722_SDCA_CTL_SAMPLE_FREQ_INDEX, 0), sampling_rate);

and that's precisely the sort of problems I had in mind earlier. Why
would the sample-rate be aligned for both amplifier and dmic?

I don't think this follows the intent of the SDCA spec. The functions
are supposed to be independent, so when we set hw_params for e.g.
amplifiers we can't touch the microphone function.

I would recommend splitting the DAIs here to have self-contained
operations that preserve the independence between functions - if the
hardware can deal with independent functions we have no reason to rejoin
these functions at the driver level, do we?

> +	}
> +
> +	return 0;
> +}
> +
> +static int rt722_sdca_pcm_hw_free(struct snd_pcm_substream *substream,
> +				struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct rt722_sdca_priv *rt722 = snd_soc_component_get_drvdata(component);
> +	struct sdw_stream_runtime *sdw_stream =
> +		snd_soc_dai_get_dma_data(dai, substream);
> +
> +	if (!rt722->slave)
> +		return -EINVAL;
> +
> +	sdw_stream_remove_slave(rt722->slave, sdw_stream);
> +	return 0;
> +}
> +
> +#define RT722_STEREO_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 | \
> +			SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_192000)
> +#define RT722_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
> +			SNDRV_PCM_FMTBIT_S24_LE)
> +
> +static const struct snd_soc_dai_ops rt722_sdca_ops = {
> +	.hw_params	= rt722_sdca_pcm_hw_params,
> +	.hw_free	= rt722_sdca_pcm_hw_free,
> +	.set_stream	= rt722_sdca_set_sdw_stream,
> +	.shutdown	= rt722_sdca_shutdown,
> +};
> +
> +static struct snd_soc_dai_driver rt722_sdca_dai[] = {
> +	{
> +		.name = "rt722-sdca-aif1",
> +		.id = RT722_AIF1,
> +		.playback = {
> +			.stream_name = "DP1 Headphone Playback",
> +			.channels_min = 1,
> +			.channels_max = 2,
> +			.rates = RT722_STEREO_RATES,
> +			.formats = RT722_FORMATS,
> +		},
> +		.capture = {
> +			.stream_name = "DP2 Headset Capture",
> +			.channels_min = 1,
> +			.channels_max = 2,
> +			.rates = RT722_STEREO_RATES,
> +			.formats = RT722_FORMATS,
> +		},
> +		.ops = &rt722_sdca_ops,
> +	},
> +	{
> +		.name = "rt722-sdca-aif2",
> +		.id = RT722_AIF2,
> +		.playback = {
> +			.stream_name = "DP3 Speaker Playback",
> +			.channels_min = 1,
> +			.channels_max = 2,
> +			.rates = RT722_STEREO_RATES,
> +			.formats = RT722_FORMATS,
> +		},
> +		.capture = {
> +			.stream_name = "DP6 DMic Capture",
> +			.channels_min = 1,
> +			.channels_max = 2,
> +			.rates = RT722_STEREO_RATES,
> +			.formats = RT722_FORMATS,
> +		},
> +		.ops = &rt722_sdca_ops,
> +	}
> +};

