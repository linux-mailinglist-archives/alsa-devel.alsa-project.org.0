Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD2A4146F4
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Sep 2021 12:46:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EE4215DC;
	Wed, 22 Sep 2021 12:46:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EE4215DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632307619;
	bh=iDhkszUxIAgf/uBns8yZcv/3BzqS02PhS0FZ+vIdCPw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hSLkAuHOTc2ZP7yp5oyn4RV2wB/sNbqM/q16vuTv2tHCTVc53DuMTxGZcFeJiSAAk
	 bEygLZQlLXEsRxByUP588cgKvhzT+MCEzS3lL2VEWmbUZfBcbfp4Six1gX+1m/9Lqv
	 js3eKK6BXVhMRKKI58lb7GceIbTQpvqPVZ/HTkKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BFD2AF804E7;
	Wed, 22 Sep 2021 12:44:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F514F804E6; Wed, 22 Sep 2021 12:44:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DB50F804E4
 for <alsa-devel@alsa-project.org>; Wed, 22 Sep 2021 12:44:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DB50F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="XkJcsTa9"
Received: by mail-ed1-x529.google.com with SMTP id h17so8179475edj.6
 for <alsa-devel@alsa-project.org>; Wed, 22 Sep 2021 03:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4Q8/Q6MLgTcscHegRcSc+UbOB0cyHVp/rZ/oZGT2UHY=;
 b=XkJcsTa9xEX1C5ZsyR+px+QMlI5l/VMX5nNFekS9bGdP8BDlby4udykB8i88HGJPg/
 X5bav7LyKjU0nk0rjfdTjPsX8jphUQ4W2Yd3b5x6peR2DDvdox+z03pvzP84J1QAZRbZ
 r2HP0IplLfdtmkCQzxwVK3i8acrNyQYq8FAVOX9s1TRGZvWjm00x/1ZvWwg6I93G8Z1R
 tdh0PgyME0EakKd0jLWFvB6F1EkGvTkXLvU5Sr0RrSJAiZD/J+seXDtYPv1rMi4ZBakC
 Pqe5vrNRCk6axZ38pgLvoS2yPRzBHIQWEGlbl7Zd4g6Zr4dfUFV8cWnHrrJbfZyhy/NU
 wUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Q8/Q6MLgTcscHegRcSc+UbOB0cyHVp/rZ/oZGT2UHY=;
 b=v6m2vZj+vQ2kzlXbl0XqQWBQXerXMDprGWZfeXM1BvfL4/lv1ZSDactAcQNPk7bnbK
 D47nNZGUhJcXhHltRJlDU9NhUl1OPvm3bAmYyyDyALJb7Zc1bly+Pqfb14O1DpMPem7o
 GAWvye6pOS82ouPxc8JOhqYdq7VmU2rrTHMV3erlWNa28x8pmhfCj4GepFqVygWVfyqy
 tutZkqM5X49/OOibIxHiS8acnCx2PytpesnDcEbbB6k65QVaJt/5fOLCJPxbNDhsnDdY
 kX695XUzS1oYy5F1BCXniSiuIvMZGyYfIvIs08DQy2viDcEXNvJ7JSeoac+qVlEcHbar
 1zIQ==
X-Gm-Message-State: AOAM5317Zwg6Tsq/A3bcPHP9jqqxk1HajiaWpKHa5B9Lg2+5607fvzLV
 0zaNQGnzpMue7LqOO/wqjYGtFg==
X-Google-Smtp-Source: ABdhPJyFkQeFzfvMShtzb6VwPZ+D3NtASIOxyFZN8x0FMk+CJE4FsMk+JC7tiO3Gp/UJxwomkaLBPg==
X-Received: by 2002:a17:906:9241:: with SMTP id
 c1mr41355385ejx.125.1632307487290; 
 Wed, 22 Sep 2021 03:44:47 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id yd3sm917042ejb.6.2021.09.22.03.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 03:44:46 -0700 (PDT)
Subject: Re: [PATCH v7 15/22] ASoC: qdsp6: audioreach: add q6apm support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210921133709.4973-1-srinivas.kandagatla@linaro.org>
 <20210921133709.4973-16-srinivas.kandagatla@linaro.org>
 <fdb5cd4d-4b8b-3dea-872a-f225a5c90d1f@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <8dd1aff9-b837-a563-7466-62a45bb4ec74@linaro.org>
Date: Wed, 22 Sep 2021 11:44:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fdb5cd4d-4b8b-3dea-872a-f225a5c90d1f@linux.intel.com>
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



On 21/09/2021 18:05, Pierre-Louis Bossart wrote:
> 
>> +static void apm_populate_connection_obj(struct apm_module_conn_obj *obj,
>> +					struct audioreach_module *module)
>> +{
>> +	obj->src_mod_inst_id = module->src_mod_inst_id;
>> +	obj->src_mod_op_port_id = module->src_mod_op_port_id;
>> +	obj->dst_mod_inst_id = module->instance_id;
>> +	obj->dst_mod_ip_port_id =	module->in_port;
> 
> alignment seems off?

Its fixed in next version.
> 
> 
>> +void *audioreach_alloc_graph_pkt(struct q6apm *apm, struct list_head *sg_list, int graph_id)
>> +{
>> +	void *p;
> 
> move this as last declaration to have a nice reverse christmas tree style?
Done.

> 
>> +	int payload_size, sg_sz, cont_sz, ml_sz, mp_sz, mc_sz;
>> +	struct apm_module_param_data  *param_data;
>> +	struct audioreach_container *container;
>> +	struct apm_graph_open_params params;
>> +	struct audioreach_sub_graph *sgs;
>> +	struct audioreach_module *module;
>> +	int num_modules_per_list;
>> +	int num_connections = 0;
>> +	int num_containers = 0;
>> +	int num_sub_graphs = 0;
>> +	int num_modules = 0;
>> +	int num_modules_list;
>> +	struct gpr_pkt *pkt;
> 
> [...]
> 
>> +static struct audioreach_graph *q6apm_get_audioreach_graph(struct q6apm *apm, uint32_t graph_id)
>> +{
>> +	struct audioreach_graph_info *info;
>> +	struct audioreach_graph *graph;
>> +
>> +	mutex_lock(&apm->lock);
>> +	graph = idr_find(&apm->graph_idr, graph_id);
>> +	mutex_unlock(&apm->lock);
>> +
>> +	if (graph) {
>> +		kref_get(&graph->refcount);
>> +		return graph;
>> +	}
>> +
>> +	info = idr_find(&apm->graph_info_idr, graph_id);
>> +
>> +	if (!info)
>> +		return ERR_PTR(-ENODEV);
>> +
>> +	graph = kzalloc(sizeof(*graph), GFP_KERNEL);
>> +	if (!graph)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	graph->apm = apm;
>> +	graph->info = info;
>> +	graph->id = graph_id;
>> +
>> +	graph->graph = audioreach_alloc_graph_pkt(apm, &info->sg_list, graph_id);
>> +	if (IS_ERR(graph->graph)) {
>> +		kfree(graph);
>> +		return ERR_PTR(-ENOMEM);
> 
> why not return graph->graph (store and return the value before freeing
> graph)?
Updated something like this now:
	if (IS_ERR(graph->graph)) {
		void *err = graph->graph;

		kfree(graph);
		return ERR_CAST(err);
	}



> 
>> +	}
>> +
>> +	mutex_lock(&apm->lock);
>> +	if (idr_alloc(&apm->graph_idr, graph, graph_id, graph_id + 1, GFP_KERNEL) < 0) {
>> +		dev_err(apm->dev, "Unable to allocate graph id (%d)\n", graph_id);
>> +		kfree(graph);
>> +		mutex_unlock(&apm->lock);
>> +		return ERR_PTR(-ENOMEM);
>> +	}
>> +	mutex_unlock(&apm->lock);
>> +
>> +	kref_init(&graph->refcount);
>> +
>> +	q6apm_send_cmd_sync(apm, graph->graph, 0);
>> +
>> +	return graph;
>> +}
> 
>> +static int graph_callback(struct gpr_resp_pkt *data, void *priv, int op)
>> +{
>> +	struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done_v2 *rd_done;
>> +	struct data_cmd_rsp_wr_sh_mem_ep_data_buffer_done_v2 *done;
>> +	struct apm_cmd_rsp_shared_mem_map_regions *rsp;
>> +	struct gpr_ibasic_rsp_result_t *result;
>> +	struct q6apm_graph *graph = priv;
>> +	struct gpr_hdr *hdr = &data->hdr;
>> +	struct device *dev = graph->dev;
>> +	uint32_t client_event;
>> +	int ret = -EINVAL;
>> +	phys_addr_t phys;
>> +	int token;
>> +
>> +	result = data->payload;
>> +
>> +	switch (hdr->opcode) {
>> +	case DATA_CMD_RSP_WR_SH_MEM_EP_DATA_BUFFER_DONE_V2:
>> +		client_event = APM_CLIENT_EVENT_DATA_WRITE_DONE;
>> +		mutex_lock(&graph->lock);
>> +		token = hdr->token & APM_WRITE_TOKEN_MASK;
>> +
>> +		done = data->payload;
>> +		phys = graph->rx_data.buf[token].phys;
>> +
>> +		if (lower_32_bits(phys) != done->buf_addr_lsw ||
>> +		    upper_32_bits(phys) != done->buf_addr_msw) {
>> +			dev_err(dev, "WR BUFF Unexpected addr %08x-%08x\n",
>> +				done->buf_addr_lsw, done->buf_addr_msw);
>> +			ret = -EINVAL;
> 
> since you don't return here you might invoke graph->cb() below, is this
> desired?
> 

No, it does not make sense to do the cb() for un-expected/error response.

TBH, rethinking on this..
returning error from these callbacks is totally useless as the apr-bus 
will not do anything about this. Only reporting it as dev_err and caller 
receiving a command timeout on error is the right thing to do.

This callback will now only return 0 irrespective of error response or 
not. CMD will Timeout for the caller in error cases.


--srini

>> +		} else {
>> +			ret = 0;
>> +			graph->result.opcode = hdr->opcode;
>> +			graph->result.status = done->status;
>> +		}
>> +		mutex_unlock(&graph->lock);
>> +		if (graph->cb)
>> +			graph->cb(client_event, hdr->token, data->payload,
>> +				  graph->priv);
>> +
>> +		break;
>> +	case APM_CMD_RSP_SHARED_MEM_MAP_REGIONS:
>> +		graph->result.opcode = hdr->opcode;
>> +		graph->result.status = 0;
>> +		rsp = data->payload;
>> +
>> +		if (hdr->token == SNDRV_PCM_STREAM_PLAYBACK)
>> +			graph->rx_data.mem_map_handle = rsp->mem_map_handle;
>> +		else
>> +			graph->tx_data.mem_map_handle = rsp->mem_map_handle;
>> +
>> +		wake_up(&graph->cmd_wait);
>> +		ret = 0;
>> +		break;
>> +	case DATA_CMD_RSP_RD_SH_MEM_EP_DATA_BUFFER_V2:
>> +		client_event = APM_CLIENT_EVENT_DATA_READ_DONE;
>> +		mutex_lock(&graph->lock);
>> +		rd_done = data->payload;
>> +		phys = graph->tx_data.buf[hdr->token].phys;
>> +		if (upper_32_bits(phys) != rd_done->buf_addr_msw ||
>> +		    lower_32_bits(phys) != rd_done->buf_addr_lsw) {
>> +			dev_err(dev, "RD BUFF Unexpected addr %08x-%08x\n",
>> +				rd_done->buf_addr_lsw, rd_done->buf_addr_msw);
>> +			ret = -EINVAL;
> 
> same here, you will call wake_up and conditionally the callback.
> 
>> +		} else {
>> +			ret = 0;
>> +		}
>> +		mutex_unlock(&graph->lock);
>> +		wake_up(&graph->cmd_wait);
>> +
>> +		if (graph->cb)
>> +			graph->cb(client_event, hdr->token, data->payload,
>> +				  graph->priv);
>> +		break;
>> +	case DATA_CMD_WR_SH_MEM_EP_EOS_RENDERED:
>> +		break;
>> +	case GPR_BASIC_RSP_RESULT:
>> +		switch (result->opcode) {
>> +		case APM_CMD_SHARED_MEM_UNMAP_REGIONS:
>> +			graph->result.opcode = result->opcode;
>> +			graph->result.status = 0;
>> +			if (hdr->token == SNDRV_PCM_STREAM_PLAYBACK)
>> +				graph->rx_data.mem_map_handle = 0;
>> +			else
>> +				graph->tx_data.mem_map_handle = 0;
>> +
>> +			wake_up(&graph->cmd_wait);
>> +			ret = 0;
>> +			break;
>> +		case APM_CMD_SHARED_MEM_MAP_REGIONS:
>> +		case DATA_CMD_WR_SH_MEM_EP_MEDIA_FORMAT:
>> +		case APM_CMD_SET_CFG:
>> +			graph->result.opcode = result->opcode;
>> +			graph->result.status = result->status;
>> +			if (result->status) {
>> +				dev_err(dev, "Error (%d) Processing 0x%08x cmd\n",
>> +					result->status, result->opcode);
>> +				ret = -EINVAL;
> 
> and here as well.
> 
>> +			} else {
>> +				ret = 0;
>> +			}
>> +			wake_up(&graph->cmd_wait);
>> +			break;
>> +		default:
>> +			break;
>> +		}
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	return ret;
>> +}
> 
>> +static int apm_callback(struct gpr_resp_pkt *data, void *priv, int op)
>> +{
>> +	gpr_device_t *gdev = priv;
>> +	struct q6apm *apm = dev_get_drvdata(&gdev->dev);
>> +	struct device *dev = &gdev->dev;
>> +	struct gpr_ibasic_rsp_result_t *result;
>> +	struct gpr_hdr *hdr = &data->hdr;
>> +	int ret = 0;
>> +
>> +	result = data->payload;
>> +
>> +	switch (hdr->opcode) {
>> +	case APM_CMD_RSP_GET_SPF_STATE:
>> +		apm->result.opcode = hdr->opcode;
>> +		apm->result.status = 0;
>> +		/* First word of result it state */
>> +		apm->state = result->opcode;
>> +		wake_up(&apm->wait);
>> +		break;
>> +	case GPR_BASIC_RSP_RESULT:
>> +		switch (result->opcode) {
>> +		case APM_CMD_GRAPH_START:
>> +		case APM_CMD_GRAPH_OPEN:
>> +		case APM_CMD_GRAPH_PREPARE:
>> +		case APM_CMD_GRAPH_CLOSE:
>> +		case APM_CMD_GRAPH_FLUSH:
>> +		case APM_CMD_GRAPH_STOP:
>> +		case APM_CMD_SET_CFG:
>> +			apm->result.opcode = result->opcode;
>> +			apm->result.status = result->status;
>> +			if (result->status) {
>> +				dev_err(dev, "Error (%d) Processing 0x%08x cmd\n",
>> +					result->status, result->opcode);
>> +				ret = -EINVAL;
> 
> same pattern, you will call wake_up even on an error?
> 
>> +			}
>> +			wake_up(&apm->wait);
>> +			break;
>> +		default:
>> +			break;
>> +		}
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	return ret;
>> +}
> 
