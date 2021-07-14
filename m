Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7943C8998
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 19:18:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F2F41680;
	Wed, 14 Jul 2021 19:17:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F2F41680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626283098;
	bh=10UFH51j+N3b3Ekh6KGYNBuWhJszBaUwZeVv6Rb1nYk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BZIB4O+8OzDGUHrnryOKE5Nv5f/3h8kqZs5+oClI+BzFFNkv/liZAHD95wHuEEFAM
	 t4G++9wxOrjIqfOpQbHfdoJmco9SXazQytVrnXTsId4Xk2I5L0DJQ9m78uRwLthA58
	 xmIE02oo4oa8LoHdr/tOCDT656s04TILpQ2bb8cU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C0CDF804FF;
	Wed, 14 Jul 2021 19:14:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96BF4F804E6; Wed, 14 Jul 2021 19:14:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4E41F804DA
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 19:14:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4E41F804DA
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="190769975"
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; d="scan'208";a="190769975"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 10:14:34 -0700
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; d="scan'208";a="413353781"
Received: from alpinagh-mobl1.amr.corp.intel.com (HELO [10.212.71.223])
 ([10.212.71.223])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 10:14:33 -0700
Subject: Re: [PATCH v2 10/16] ASoC: qcom: audioreach: add bedai support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
 <20210714153039.28373-11-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cb2636b9-e88f-76c3-129a-5cbb2cd017b2@linux.intel.com>
Date: Wed, 14 Jul 2021 12:03:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714153039.28373-11-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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



> +static int q6dma_hw_params(struct snd_pcm_substream *substream,
> +			   struct snd_pcm_hw_params *params,
> +			   struct snd_soc_dai *dai)
> +{
> +	struct q6apm_bedai_data *dai_data = dev_get_drvdata(dai->dev);
> +	struct q6apm_cdc_dma_cfg *cfg = &dai_data->port_config[dai->id].dma_cfg;
> +
> +	cfg->bit_width = params_width(params);
> +	cfg->sample_rate = params_rate(params);
> +	cfg->num_channels = params_channels(params);
> +
> +	switch (params_format(params)) {
> +	case SNDRV_PCM_FORMAT_S16_LE:
> +		dai_data->bits_per_sample[dai->id] = 16;
> +		break;
> +	case SNDRV_PCM_FORMAT_S24_LE:
> +		dai_data->bits_per_sample[dai->id] = 24;
> +		break;

default:
    return -EINVAL;

?

> +	}
> +
> +	return 0;
> +}
> +
> +static void q6apm_bedai_shutdown(struct snd_pcm_substream *substream,
> +				struct snd_soc_dai *dai)
> +{
> +	struct q6apm_bedai_data *dai_data = dev_get_drvdata(dai->dev);
> +	int rc;
> +
> +	if (!dai_data->is_port_started[dai->id])
> +		return;
> +	rc = q6apm_graph_stop(dai_data->graph[dai->id]);
> +	if (rc < 0)
> +		dev_err(dai->dev, "fail to close APM port (%d)\n", rc);
> +
> +	q6apm_graph_close(dai_data->graph[dai->id]);
> +	dai_data->is_port_started[dai->id] = false;

difficult to follow, this mixes '!start', 'stop', 'close'


> +
> +}
> +
> +static int q6apm_bedai_prepare(struct snd_pcm_substream *substream,
> +			       struct snd_soc_dai *dai)
> +{
> +	struct q6apm_bedai_data *dai_data = dev_get_drvdata(dai->dev);
> +	struct q6apm_cdc_dma_cfg *cfg = &dai_data->port_config[dai->id].dma_cfg;
> +	int graph_id = dai->id;
> +	int rc;
> +	int ret;
> +	struct q6apm_graph *graph;
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
> +		if (IS_ERR(graph)) {
> +			dev_err(dai->dev, "Failed to open graph (%d)\n",
> +				graph_id);
> +			ret = PTR_ERR(graph);
> +			return ret;
> +		}
> +		dai_data->graph[graph_id] = graph;
> +	}
> +
> +	rc = q6apm_graph_media_format_pcm(dai_data->graph[dai->id],
> +					  substream->stream, cfg->sample_rate,
> +					  cfg->num_channels, NULL, cfg->bit_width);
> +
> +	rc = q6apm_graph_prepare(dai_data->graph[dai->id]);

any good static analyzer would tell you you didn't test rc before overriding it..

this looks rather questionable.

> +	rc = q6apm_graph_start(dai_data->graph[dai->id]);
> +	if (rc < 0) {
> +		dev_err(dai->dev, "fail to start APM port %x\n", dai->id);
> +		return rc;
> +	}
> +	dai_data->is_port_started[dai->id] = true;
> +
> +	return 0;
> +}
 
