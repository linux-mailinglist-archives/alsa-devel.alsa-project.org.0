Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A86EC4146EF
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Sep 2021 12:46:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A1C615F9;
	Wed, 22 Sep 2021 12:45:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A1C615F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632307595;
	bh=2fYYo7UgpTqmzsXPUUZbMDMbmo3CNZrbHdYkEH+vjek=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Akc4RTQ4RFEd/Sks6YlnWgmhn5REmu2G4rUx51L/BIWFIJyLjHeJJj61ZOJfIWAxH
	 hGalRRqhgTAh9IvzSqHSlclT8z7SHxizV4SOh2lWZqwzpJJoAf1F4VeFqN9VWyTCcR
	 nChwtQyAjuH4xBrQ4nOCczkUbx9T9GfWLcWZxiUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0830CF8011F;
	Wed, 22 Sep 2021 12:44:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97782F804CA; Wed, 22 Sep 2021 12:44:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3B57F802A0
 for <alsa-devel@alsa-project.org>; Wed, 22 Sep 2021 12:44:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3B57F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="u8KxRyGK"
Received: by mail-ed1-x534.google.com with SMTP id eg28so8312514edb.1
 for <alsa-devel@alsa-project.org>; Wed, 22 Sep 2021 03:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gfo3ySx0mOztzhYe0egxReN8tzekiAsXOUHxeQvHwnc=;
 b=u8KxRyGKQ0vPOQCFtNr1StgJN8QdTjUYqkfBifs7zqKaXUclYblFKGBpaxvXAiu/NW
 9mmG8jm/+kgShGKcNuodK9053OixmjzAuvYF3PLv88420cMAONjNNg/EnEOtO9OXJIuf
 Oz9rQUOp6oxfRBw68A3kQbEIJgOLulXgtqWzmS7anevqV7q4hwFEjZpTS1u8qHlKklNb
 X82Vfu4gQjKd27e6V45O/lb2umRil8UYSfP9/4g3fk9MQy7dOYIJdqaxeaoxBwT9jVLY
 NH1JGhxHt0/FOUM8NHWV+qyXMuxhjDdeqrFbCGm3qmoTFhE79ejuAseQJKLj1xgAzXiU
 tVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gfo3ySx0mOztzhYe0egxReN8tzekiAsXOUHxeQvHwnc=;
 b=sKgYmn4kzPosgO9vbZf5OVW/SnTpoFkmdeAGBI8TOGmlojgC0umozCSfqQVHPIpDfL
 EoEwG7hx/frFcOj82Vpu7Gg2p6penVhZJ10C+o64tSQpN/NTP9t6JUKY6qRqROS9eJ67
 MkFcrlS705oeC+PWb4kNKO/avebsmAijMMWjjsKPJcSrXwZTmZGsmi+17P1PPWqK8xBE
 xHWa7reginDHIJsWUvRAIvzba6Gtv1uOnQ4nkGeqsDx1LaIfUoXLg0JvHK5q8hmbGFxp
 vYzCceBOqwF9mYmUccZKzV6cgB8NPYCSUlIClN0NZJNPOGbZTAT7i/zQnexB6tI+W2CM
 DV9g==
X-Gm-Message-State: AOAM532KchAANpaEVYTFm/aNmqMxGYabV1Ym8t+CG3Xge5kzoyUZXjv8
 lhvK/GB1VJjzo64dEke53CnGag==
X-Google-Smtp-Source: ABdhPJxNVxvLYU5TyoLcQQXcXBu9X2EkqhfMWYsnypyaZDyxrUYPCk57Wp7yFPfLqDaQ+wIBN2owew==
X-Received: by 2002:a17:906:b183:: with SMTP id
 w3mr40128468ejy.394.1632307474026; 
 Wed, 22 Sep 2021 03:44:34 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id y8sm882133ejm.104.2021.09.22.03.44.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 03:44:33 -0700 (PDT)
Subject: Re: [PATCH v7 16/22] ASoC: qdsp6: audioreach: add module
 configuration command helpers
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210921133709.4973-1-srinivas.kandagatla@linaro.org>
 <20210921133709.4973-17-srinivas.kandagatla@linaro.org>
 <b2d677c6-db3b-1b4b-9121-dabdf56cb137@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <b8d29948-7e29-f226-861a-6fdf94fbc7ac@linaro.org>
Date: Wed, 22 Sep 2021 11:44:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b2d677c6-db3b-1b4b-9121-dabdf56cb137@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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



On 21/09/2021 18:09, Pierre-Louis Bossart wrote:
> 
>> +static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
>> +					   struct audioreach_module *module,
>> +					   struct audioreach_module_config *cfg)
>> +{
>> +	struct apm_module_frame_size_factor_cfg *fs_cfg;
>> +	struct apm_module_param_data *param_data;
>> +	struct apm_i2s_module_intf_cfg *intf_cfg;
>> +	struct apm_module_hw_ep_mf_cfg *hw_cfg;
>> +	int ic_sz, ep_sz, fs_sz;
>> +	int rc, payload_size;
>> +	struct gpr_pkt *pkt;
>> +	void *p;
>> +
>> +	ic_sz = APM_I2S_INTF_CFG_PSIZE;
>> +	ep_sz = APM_HW_EP_CFG_PSIZE;
>> +	fs_sz = APM_FS_CFG_PSIZE;
>> +
>> +	payload_size = ic_sz + ep_sz + fs_sz;
>> +
>> +	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
>> +	if (IS_ERR(pkt))
>> +		return -ENOMEM;
>> +
>> +	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
>> +	intf_cfg = p;
>> +
>> +	param_data = &intf_cfg->param_data;
>> +	param_data->module_instance_id = module->instance_id;
>> +	param_data->error_code = 0;
>> +	param_data->param_id = PARAM_ID_I2S_INTF_CFG;
>> +	param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
>> +
>> +	intf_cfg->cfg.intf_idx = module->hw_interface_idx;
>> +	intf_cfg->cfg.sd_line_idx = module->sd_line_idx;
>> +
>> +	switch (cfg->fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK
> 
Its now fixed in next version.

>> +	case SND_SOC_DAIFMT_CBC_CFC:
>> +		intf_cfg->cfg.ws_src = CONFIG_I2S_WS_SRC_INTERNAL;
>> +		break;
>> +	case SND_SOC_DAIFMT_CBP_CFP:
>> +		/* CPU is slave */
>> +		intf_cfg->cfg.ws_src = CONFIG_I2S_WS_SRC_EXTERNAL;
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	p += ic_sz;
>> +	hw_cfg = p;
>> +	param_data = &hw_cfg->param_data;
>> +	param_data->module_instance_id = module->instance_id;
>> +	param_data->error_code = 0;
>> +	param_data->param_id = PARAM_ID_HW_EP_MF_CFG;
>> +	param_data->param_size = ep_sz - APM_MODULE_PARAM_DATA_SIZE;
>> +
>> +	hw_cfg->mf.sample_rate = cfg->sample_rate;
>> +	hw_cfg->mf.bit_width = cfg->bit_width;
>> +	hw_cfg->mf.num_channels = cfg->num_channels;
>> +	hw_cfg->mf.data_format = module->data_format;
>> +
>> +	p += ep_sz;
>> +	fs_cfg = p;
>> +	param_data = &fs_cfg->param_data;
>> +	param_data->module_instance_id = module->instance_id;
>> +	param_data->error_code = 0;
>> +	param_data->param_id = PARAM_ID_HW_EP_FRAME_SIZE_FACTOR;
>> +	param_data->param_size = fs_sz - APM_MODULE_PARAM_DATA_SIZE;
>> +	fs_cfg->frame_size_factor = 1;
>> +
>> +	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
>> + error and
>> +	kfree(pkt);
>> +
>> +	return rc;
>> +}
>> +int audioreach_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, size_t period_sz,
>> +				  unsigned int periods, bool is_contiguous)
>> +{
>> +	struct apm_shared_map_region_payload *mregions;
>> +	struct apm_cmd_shared_mem_map_regions *cmd;
>> +	uint32_t num_regions, buf_sz, payload_size;
>> +	struct audioreach_graph_data *data;
>> +	struct gpr_pkt *pkt;
>> +	void *p;
>> +	int rc, i;
>> +
>> +	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
>> +		data = &graph->rx_data;
>> +	else
>> +		data = &graph->tx_data;
>> +
>> +	if (is_contiguous) {
>> +		num_regions = 1;
>> +		buf_sz = period_sz * periods;
>> +	} else {
>> +		buf_sz = period_sz;
>> +		num_regions = periods;
>> +	}
>> +
>> +	/* DSP expects size should be aligned to 4K */
>> +	buf_sz = ALIGN(buf_sz, 4096);
>> +
>> +	payload_size = sizeof(*cmd) + (sizeof(*mregions) * num_regions);
>> +
>> +	pkt = audioreach_alloc_apm_pkt(payload_size, APM_CMD_SHARED_MEM_MAP_REGIONS, dir,
>> +				     graph->port->id);
>> +	if (IS_ERR(pkt))
>> +		return -ENOMEM;
> return PTR_ERR(pkt) ?
> 

Removed such instances across all the files.

--srini
> 
>> +int audioreach_shared_memory_send_eos(struct q6apm_graph *graph)
>> +{
>> +	struct data_cmd_wr_sh_mem_ep_eos *eos;
>> +	struct gpr_pkt *pkt;
>> +	int rc = 0, iid;
>> +
>> +	iid = q6apm_graph_get_rx_shmem_module_iid(graph);
>> +	pkt = audioreach_alloc_cmd_pkt(sizeof(*eos), DATA_CMD_WR_SH_MEM_EP_EOS, 0,
>> +				       graph->port->id, iid);
>> +	if (IS_ERR(pkt))
>> +		return -ENOMEM;
> return PTR_ERR(pkt) ?
> 
