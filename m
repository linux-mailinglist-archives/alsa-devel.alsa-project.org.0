Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C67573D01E4
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 20:49:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EBB9169D;
	Tue, 20 Jul 2021 20:48:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EBB9169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626806966;
	bh=jhmkBQroeb0b0Tq7gCPwTxRe66qpATM21Ks41LFU6qA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=poYBKIUwMCvEsNLu+1vG9sNn2A3Pm1mjE1Z9GX97AcMStpIuf1IQBkhCgKLhdgR88
	 oM9oyst4c3dljlY7TD83Zby3/K9flkT7rc54djVtOL+6RKJ2uCc1CEQBch7S1S1XXl
	 zaQcYk77FWpcpLrUZFwZ7PSLtv6yRvx77JPSNze0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84FD6F804AB;
	Tue, 20 Jul 2021 20:47:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9307F80218; Tue, 20 Jul 2021 20:47:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B24E5F8020D
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 20:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B24E5F8020D
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="198511662"
X-IronPort-AV: E=Sophos;i="5.84,255,1620716400"; d="scan'208";a="198511662"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 11:47:29 -0700
X-IronPort-AV: E=Sophos;i="5.84,255,1620716400"; d="scan'208";a="462146675"
Received: from aremenni-mobl.amr.corp.intel.com (HELO [10.209.130.10])
 ([10.209.130.10])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 11:47:28 -0700
Subject: Re: [PATCH v4 07/12] ASoC: amd: add ACP5x pcm dma driver ops
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20210720163732.23003-1-Vijendar.Mukunda@amd.com>
 <20210720163732.23003-8-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <331065bd-32d5-45eb-37fc-d4fc76c23fe8@linux.intel.com>
Date: Tue, 20 Jul 2021 13:27:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720163732.23003-8-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Sunil-kumar.Dommati@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Alexander.Deucher@amd.com, krisman@collabora.com
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


> +static int acp5x_dma_open(struct snd_soc_component *component,
> +			  struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime;
> +	struct snd_soc_pcm_runtime *prtd;
> +	struct i2s_dev_data *adata;
> +	struct i2s_stream_instance *i2s_data;
> +	int ret;
> +
> +	runtime = substream->runtime;
> +	prtd = asoc_substream_to_rtd(substream);
> +	component = snd_soc_rtdcom_lookup(prtd, DRV_NAME);
> +	adata = dev_get_drvdata(component->dev);
> +
> +	i2s_data = kzalloc(sizeof(*i2s_data), GFP_KERNEL);
> +	if (!i2s_data)
> +		return -EINVAL;

return -ENOMEM?

> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		runtime->hw = acp5x_pcm_hardware_playback;
> +	else
> +		runtime->hw = acp5x_pcm_hardware_capture;
> +
> +	ret = snd_pcm_hw_constraint_integer(runtime,
> +					    SNDRV_PCM_HW_PARAM_PERIODS);
> +	if (ret < 0) {
> +		dev_err(component->dev, "set integer constraint failed\n");
> +		kfree(i2s_data);
> +		return ret;
> +	}
> +	i2s_data->acp5x_base = adata->acp5x_base;
> +	runtime->private_data = i2s_data;
> +	return ret;
> +}
> +
> +static int acp5x_dma_hw_params(struct snd_soc_component *component,
> +			       struct snd_pcm_substream *substream,
> +			       struct snd_pcm_hw_params *params)
> +{
> +	struct i2s_stream_instance *rtd;
> +	struct snd_soc_pcm_runtime *prtd;
> +	struct snd_soc_card *card;
> +	struct acp5x_platform_info *pinfo;
> +	struct i2s_dev_data *adata;
> +	u64 size;
> +
> +	prtd = asoc_substream_to_rtd(substream);
> +	card = prtd->card;
> +	pinfo = snd_soc_card_get_drvdata(card);
> +	adata = dev_get_drvdata(component->dev);
> +	rtd = substream->runtime->private_data;
> +
> +	if (!rtd)
> +		return -EINVAL;
> +
> +	if (pinfo) {
> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +			rtd->i2s_instance = pinfo->play_i2s_instance;
> +			switch (rtd->i2s_instance) {
> +			case I2S_HS_INSTANCE:
> +				adata->play_stream = substream;
> +				break;
> +			case I2S_SP_INSTANCE:
> +			default:
> +				adata->i2ssp_play_stream = substream;
> +			}
> +		} else {
> +			rtd->i2s_instance = pinfo->cap_i2s_instance;
> +			switch (rtd->i2s_instance) {
> +			case I2S_HS_INSTANCE:
> +				adata->capture_stream = substream;
> +				break;
> +			case I2S_SP_INSTANCE:
> +			default:
> +				adata->i2ssp_capture_stream = substream;
> +			}
> +		}
> +	} else {
> +		dev_err(component->dev, "pinfo failed\n");

should you bail here with e.g. return -EINVAL?

> +	}
> +	size = params_buffer_bytes(params);
> +	rtd->dma_addr = substream->dma_buffer.addr;
> +	rtd->num_pages = (PAGE_ALIGN(size) >> PAGE_SHIFT);
> +	config_acp5x_dma(rtd, substream->stream);
> +	return 0;
> +}

