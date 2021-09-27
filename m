Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BF5419F90
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 21:54:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2035E16B0;
	Mon, 27 Sep 2021 21:53:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2035E16B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632772487;
	bh=VeK0jA2GTFOS4eCeW+bE43j27+460VwRyTZFlPp3SYk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aDrbGgCdhf7YCVZ+JD3nYU8i2Q7NXvFWSKeSHzQeNR9Bc0BWNaPV0xoC49jSPfZZH
	 iY3I5MDKPOpswmMoKNp+40egahty0V2vrUpXkTdAvCUE3+rZ5t93fhZznsr5vomH9v
	 5fkNw6w7DCh3YTMiQTjeD27RJVND7msBVLr67y8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C9E7F80301;
	Mon, 27 Sep 2021 21:53:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E88DF801F7; Mon, 27 Sep 2021 21:53:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E556BF801F7
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 21:53:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E556BF801F7
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="288212684"
X-IronPort-AV: E=Sophos;i="5.85,327,1624345200"; d="scan'208";a="288212684"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 12:52:50 -0700
X-IronPort-AV: E=Sophos;i="5.85,327,1624345200"; d="scan'208";a="486267994"
Received: from asen4-mobl2.amr.corp.intel.com (HELO [10.212.27.2])
 ([10.212.27.2])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 12:52:47 -0700
Subject: Re: [PATCH v8 16/22] ASoC: qdsp6: audioreach: add module
 configuration command helpers
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210927135559.738-1-srinivas.kandagatla@linaro.org>
 <20210927135559.738-17-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2be40835-e98a-ff3f-71b1-ab2dd80086c3@linux.intel.com>
Date: Mon, 27 Sep 2021 11:16:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210927135559.738-17-srinivas.kandagatla@linaro.org>
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


> +static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
> +					     struct audioreach_module *module,
> +					     struct audioreach_module_config *mcfg)
> +{
> +	uint32_t num_channels = mcfg->num_channels;
> +	struct apm_module_param_data *param_data;
> +	struct payload_media_fmt_pcm *cfg;
> +	struct media_format *header;
> +	int rc, payload_size;
> +	struct gpr_pkt *pkt;
> +	void *p;
> +
> +	if (num_channels > 2) {
> +		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
> +		return -EINVAL;
> +	}

so here mcfg->num_channels > 2 is flagged as an error, but ...

> +
> +	payload_size = APM_SHMEM_FMT_CFG_PSIZE(num_channels) + APM_MODULE_PARAM_DATA_SIZE;
> +
> +	pkt = audioreach_alloc_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0,
> +				     graph->port->id, module->instance_id);
> +	if (IS_ERR(pkt))
> +		return PTR_ERR(pkt);
> +
> +	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
> +
> +	param_data = p;
> +	param_data->module_instance_id = module->instance_id;
> +	param_data->error_code = 0;
> +	param_data->param_id = PARAM_ID_MEDIA_FORMAT;
> +	param_data->param_size = payload_size - APM_MODULE_PARAM_DATA_SIZE;
> +	p = p + APM_MODULE_PARAM_DATA_SIZE;
> +
> +	header = p;
> +	header->data_format = DATA_FORMAT_FIXED_POINT;
> +	header->fmt_id = MEDIA_FMT_ID_PCM;
> +	header->payload_size = payload_size - sizeof(*header);
> +
> +	p = p + sizeof(*header);
> +	cfg = p;
> +	cfg->sample_rate = mcfg->sample_rate;
> +	cfg->bit_width = mcfg->bit_width;
> +	cfg->alignment = PCM_LSB_ALIGNED;
> +	cfg->bits_per_sample = mcfg->bit_width;
> +	cfg->q_factor = mcfg->bit_width - 1;
> +	cfg->endianness = PCM_LITTLE_ENDIAN;
> +	cfg->num_channels = mcfg->num_channels;
> +
> +	if (mcfg->num_channels == 1) {
> +		cfg->channel_mapping[0] =  PCM_CHANNEL_L;
> +	} else if (num_channels == 2) {
> +		cfg->channel_mapping[0] =  PCM_CHANNEL_L;
> +		cfg->channel_mapping[1] =  PCM_CHANNEL_R;
> +	} else {
> +		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
> +		rc = -EINVAL;
> +		goto err;

... this is again the case where mcfg->num_channels > 2 so this block is
never executed.

> +	}
> +
> +	rc = audioreach_graph_send_cmd_sync(graph, pkt, 0);
> +err:
> +	kfree(pkt);
> +
> +	return rc;
> +}
> +
