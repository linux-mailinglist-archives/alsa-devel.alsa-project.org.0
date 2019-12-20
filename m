Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF0912800D
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 16:52:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46969886;
	Fri, 20 Dec 2019 16:51:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46969886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576857132;
	bh=LcpPqR+F61JKXQWMaeP6qeJpTWJNdca2jjibFemi2ts=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XFtk03m+l3LKAv9ZUIvVX3K47FxWU3s4zGBInhaU/vWk+V+eP34hIVhlqbYtioyMS
	 Vt6nObgKwy5V/v9s+8DMwQINWAvNiUlD4tqiePwJEg61028qzeeMvl0NbyMBeTyAEL
	 PjqaZU2rl8H7JuFAyL+rOypVfvq4+kI913bVEXlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 040DFF80268;
	Fri, 20 Dec 2019 16:49:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 881A7F8014C; Fri, 20 Dec 2019 16:49:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_76, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60EB4F8014C
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 16:49:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60EB4F8014C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Dec 2019 07:49:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,336,1571727600"; d="scan'208";a="267551909"
Received: from pkriegsm-mobl.amr.corp.intel.com (HELO [10.252.132.172])
 ([10.252.132.172])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Dec 2019 07:49:37 -0800
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20191220115629.8293-1-srinivas.kandagatla@linaro.org>
 <20191220115629.8293-3-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <052d527b-77a5-172e-2b18-ca635242b440@linux.intel.com>
Date: Fri, 20 Dec 2019 09:45:01 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191220115629.8293-3-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 spapothi@codeaurora.org, lgirdwood@gmail.com, vkoul@kernel.org
Subject: Re: [alsa-devel] [PATCH v10 2/2] ASoC: codecs: add wsa881x
 amplifier support
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Looks mostly good, couple of comments below.

> +static int wsa881x_prepare(struct snd_pcm_substream *substream,
> +			   struct snd_soc_dai *dai)
> +{
> +	struct wsa881x_priv *wsa881x = dev_get_drvdata(dai->dev);
> +	int ret;
> +
> +	if (wsa881x->stream_prepared) {
> +		sdw_disable_stream(wsa881x->sruntime);
> +		sdw_deprepare_stream(wsa881x->sruntime);
> +		wsa881x->stream_prepared = false;
> +	}

in what scenario would you have a transition from a stream active to 
prepared?

> +
> +
> +	ret = sdw_prepare_stream(wsa881x->sruntime);
> +	if (ret)
> +		return ret;
> +
> +	/**
> +	 * NOTE: there is a strict hw requirement about the ordering of port
> +	 * enables and actual PA enable. PA enable should only happen after

PA == power amplifiers?

> +	 * soundwire ports are enabled if not DC on the line is accumlated

accumulated

> +	 * resulting in Click/Pop Noise
> +	 */
> +
> +	ret = sdw_enable_stream(wsa881x->sruntime);

I guess this answers to my question above, you are not using the 'usual' 
mapping between ALSA states and SoundWire stream states. Enabling the 
stream will cause a bank switch and (zero?) data to be transmitted, is 
this intentional?

If this is due to the order with the PA, then where is the PA handled?


> +	if (ret) {
> +		sdw_deprepare_stream(wsa881x->sruntime);
> +		return ret;
> +	}
> +	wsa881x->stream_prepared = true;
> +
> +	return ret;
> +}
> +
> +static int wsa881x_hw_params(struct snd_pcm_substream *substream,
> +			     struct snd_pcm_hw_params *params,
> +			     struct snd_soc_dai *dai)
> +{
> +	struct wsa881x_priv *wsa881x = dev_get_drvdata(dai->dev);
> +	int i;
> +
> +	wsa881x->active_ports = 0;
> +	for (i = 0; i < WSA881X_MAX_SWR_PORTS; i++) {
> +		if (!wsa881x->port_enable[i])
> +			continue;
> +
> +		wsa881x->port_config[wsa881x->active_ports] =
> +							wsa881x_pconfig[i];
> +		wsa881x->active_ports++;
> +	}
> +
> +	return sdw_stream_add_slave(wsa881x->slave, &wsa881x->sconfig,
> +				    wsa881x->port_config, wsa881x->active_ports,
> +				    wsa881x->sruntime);
> +}
> +
> +static int wsa881x_hw_free(struct snd_pcm_substream *substream,
> +			   struct snd_soc_dai *dai)
> +{
> +	struct wsa881x_priv *wsa881x = dev_get_drvdata(dai->dev);
> +
> +	sdw_disable_stream(wsa881x->sruntime);
> +	sdw_deprepare_stream(wsa881x->sruntime);

This works if you do a hw_params->prepare->hw_free transition, but isn't 
it possible to have hw_params->hw_free as well? In that case the stream 
would not enabled/prepared, so shouldn't you have the same test as in 
prepare?

if (wsa881x->stream_prepared) {
	sdw_disable_stream(wsa881x->sruntime);
	sdw_deprepare_stream(wsa881x->sruntime);
	wsa881x->stream_prepared = false;
}

> +	sdw_stream_remove_slave(wsa881x->slave, wsa881x->sruntime);
> +	wsa881x->stream_prepared = false;
> +
> +	return 0;
> +}
> +

> +static struct snd_soc_dai_driver wsa881x_dais[] = {
> +	[0] = {

is that [0] needed?

> +		.name = "SPKR",
> +		.id = 0,
> +		.playback = {
> +			.stream_name = "SPKR Playback",
> +			.rate_max = 48000,
> +			.rate_min = 48000,
> +			.channels_min = 1,
> +			.channels_max = 1,
> +		},
> +		.ops = &wsa881x_dai_ops,
> +	},
> +};
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
