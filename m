Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0AE188778
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 15:26:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A808017C7;
	Tue, 17 Mar 2020 15:25:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A808017C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584455195;
	bh=iD426G0RLGJQ22fAcksYLp3ChFMoKCl2eOgqz168qxs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DwYqJ2cLv4ODY/Opvjm1kqDXddnk6H1N6HmPjl6jLO34Vg7PKn58TbSfUXMTfv2hA
	 S16uQ6PSNSmqbnumhcw76QESyqZ6FDaZAz5qiRO+KuMqtVBYYaZXoM5LzYpljN86Tr
	 GxTS3IaK+T8IQmGjQrk7EigsEwuMUuzJ7TsfMTVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65934F800CD;
	Tue, 17 Mar 2020 15:24:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F74CF80232; Tue, 17 Mar 2020 15:24:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_76,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62724F800C0
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 15:24:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62724F800C0
IronPort-SDR: SAlLuViVg46TWnqMuGjQx2wjSCLcYVvQvwLbvcTv1X0vW+gdYzt4SZeBaJn2c+KdswGPiVxnvv
 9GOHXPDkU+FQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 07:24:44 -0700
IronPort-SDR: UrTN2MTmca/v3pbjuGA0H3ilsTaZGZgz+Bdujev27zl8CWimGerZj8JyH8A7mddwBkeUnD+D2G
 rCTpBzshVP5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,564,1574150400"; d="scan'208";a="244492157"
Received: from dasabhi1-mobl.amr.corp.intel.com (HELO [10.255.35.148])
 ([10.255.35.148])
 by orsmga003.jf.intel.com with ESMTP; 17 Mar 2020 07:24:42 -0700
Subject: Re: [PATCH 1/2] ASoC: qcom: sdm845: handle soundwire stream
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20200317095351.15582-1-srinivas.kandagatla@linaro.org>
 <20200317095351.15582-2-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8daeeb26-851b-8311-30f5-5d285ccbc255@linux.intel.com>
Date: Tue, 17 Mar 2020 08:07:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200317095351.15582-2-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, vkoul@kernel.org,
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


> @@ -45,11 +48,20 @@ static int sdm845_slim_snd_hw_params(struct snd_pcm_substream *substream,
>   	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>   	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
>   	struct snd_soc_dai *codec_dai;
> +	struct sdm845_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
>   	u32 rx_ch[SLIM_MAX_RX_PORTS], tx_ch[SLIM_MAX_TX_PORTS];
> +	struct sdw_stream_runtime *sruntime;
>   	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
>   	int ret = 0, i;
>   
>   	for_each_rtd_codec_dais(rtd, i, codec_dai) {
> +		sruntime = snd_soc_dai_get_sdw_stream(codec_dai,
> +						      substream->stream);
> +		if (sruntime != ERR_PTR(-ENOTSUPP))
> +			pdata->sruntime[cpu_dai->id] = sruntime;
> +		else
> +			pdata->sruntime[cpu_dai->id] = NULL;
> +

Can you explain this part?
The get_sdw_stream() is supposed to return what was set by 
set_sdw_stream(), so if it's not supported isn't this an error?

>   		ret = snd_soc_dai_get_channel_map(codec_dai,
>   				&tx_ch_cnt, tx_ch, &rx_ch_cnt, rx_ch);
>   
> @@ -425,8 +437,65 @@ static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
>   	}
>   }
>   
> +static int sdm845_snd_prepare(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
> +	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
> +	int ret;
> +
> +	if (!sruntime)
> +		return 0;

same here, isn't this an error?

> +	if (data->stream_prepared[cpu_dai->id]) {
> +		sdw_disable_stream(sruntime);
> +		sdw_deprepare_stream(sruntime);
> +		data->stream_prepared[cpu_dai->id] = false;
> +	}
> +
> +	ret = sdw_prepare_stream(sruntime);
> +	if (ret)
> +		return ret;
> +
> +	/**
> +	 * NOTE: there is a strict hw requirement about the ordering of port
> +	 * enables and actual WSA881x PA enable. PA enable should only happen
> +	 * after soundwire ports are enabled if not DC on the line is
> +	 * accumulated resulting in Click/Pop Noise
> +	 * PA enable/mute are handled as part of codec DAPM and digital mute.
> +	 */
> +
> +	ret = sdw_enable_stream(sruntime);
> +	if (ret) {
> +		sdw_deprepare_stream(sruntime);
> +		return ret;
> +	}
> +	data->stream_prepared[cpu_dai->id] = true;
> +
> +	return ret;
> +}
> +
> +static int sdm845_snd_hw_free(struct snd_pcm_substream *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
> +	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
> +	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
> +
> +	if (sruntime && data->stream_prepared[cpu_dai->id]) {

and here?

Really wondering where the stream is actually allocated and set.

> +		sdw_disable_stream(sruntime);
> +		sdw_deprepare_stream(sruntime);
> +		data->stream_prepared[cpu_dai->id] = false;
> +	}
> +
> +	return 0;
> +}
> +
>   static const struct snd_soc_ops sdm845_be_ops = {
>   	.hw_params = sdm845_snd_hw_params,
> +	.hw_free = sdm845_snd_hw_free,
> +	.prepare = sdm845_snd_prepare,
>   	.startup = sdm845_snd_startup,
>   	.shutdown = sdm845_snd_shutdown,
>   };
> 
