Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBDC40038F
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 18:39:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0631B18DC;
	Fri,  3 Sep 2021 18:39:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0631B18DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630687190;
	bh=t19jX3cDBGsumSD8n+psG5iu+xp/olSyuzQVfyKPUok=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ut+/nMih1UAuI6UoBVeGuYOnAeIksilXOD/f8zckQLxff6HnMATerKJRtkeSN2da6
	 dSHXk6bkRThUsd3RLsP3rhcWgxAlhb9AR1se6No3JbYNUNZmyPhLdY5Lm0EI43R0lY
	 e41ENsqApJAhvng+VSMaEhNRcRwsOQiinKioVEcU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71C9EF802E0;
	Fri,  3 Sep 2021 18:38:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8512F804F3; Fri,  3 Sep 2021 18:38:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61F85F804E2
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 18:38:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61F85F804E2
X-IronPort-AV: E=McAfee;i="6200,9189,10096"; a="206687202"
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="206687202"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 09:37:56 -0700
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="462453494"
Received: from seangorm-mobl.amr.corp.intel.com (HELO [10.251.136.111])
 ([10.251.136.111])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 09:37:55 -0700
Subject: Re: [PATCH v5 19/21] ASoC: qdsp6: audioreach: add q6apm lpass dai
 support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
 <20210903112032.25834-20-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4374a141-877e-fe80-d61b-e3c7b90c447b@linux.intel.com>
Date: Fri, 3 Sep 2021 10:53:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903112032.25834-20-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com
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


>  config SND_SOC_QDSP6_APM
>  	select SND_SOC_QDSP6_APM_DAI
> +	select SND_SOC_QDSP6_APM_LPASS_DAI
>  	tristate

tristate then select?

>
> +static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream,
> +			       struct snd_soc_dai *dai)
> +{
> +	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
> +	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
> +	int graph_id = dai->id;
> +	int rc;
> +	struct q6apm_graph *graph;
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
> +		if (IS_ERR(graph)) {
> +			dev_err(dai->dev, "Failed to open graph (%d)\n",
> +				graph_id);
> +			rc = PTR_ERR(graph);
> +			return rc;
> +		}
> +		dai_data->graph[graph_id] = graph;
> +	}

so you don't open a graph on capture?

How does the rest work if dai_data->graph is not initialized?
Or is it done somewhere else and it'd be worthy of a comment?

> +
> +	cfg->direction = substream->stream;
> +	rc = q6apm_graph_media_format_pcm(dai_data->graph[dai->id], cfg);
> +
> +	if (rc) {
> +		dev_err(dai->dev, "Failed to set media format %d\n", rc);
> +		return rc;
> +	}
> +
> +	rc = q6apm_graph_prepare(dai_data->graph[dai->id]);
> +	if (rc) {
> +		dev_err(dai->dev, "Failed to prepare Graph %d\n", rc);
> +		return rc;
> +	}
> +
> +	rc = q6apm_graph_start(dai_data->graph[dai->id]);
> +	if (rc < 0) {
> +		dev_err(dai->dev, "fail to start APM port %x\n", dai->id);
> +		return rc;
> +	}
> +	dai_data->is_port_started[dai->id] = true;
> +
> +	return 0;
> +}
> +
> +static int q6apm_lpass_dai_startup(struct snd_pcm_substream *substream,
> +				struct snd_soc_dai *dai)
> +{
> +	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
> +	int graph_id = dai->id;
> +	struct q6apm_graph *graph;
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
> +		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
> +		if (IS_ERR(graph)) {
> +			dev_err(dai->dev, "Failed to open graph (%d)\n",
> +				graph_id);
> +			return PTR_ERR(graph);
> +		}
> +		dai_data->graph[graph_id] = graph;
> +	}

definitively need a comment on why the behavior is different from
capture and playback?

What prevents you from doing the same operations in .startup for capture
and playback?

> +
> +	return 0;
> +}
> +

