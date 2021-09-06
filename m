Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C8C401E57
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Sep 2021 18:31:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 684091755;
	Mon,  6 Sep 2021 18:30:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 684091755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630945867;
	bh=77YLBmVZ83U9x2xVipZurpXoTF6Mm2M2fdXiEbLqrug=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eeLFponZF4eXY4/tY0R3J+UQx4bR6tYDbMQKTOHgnL1uRiKvWbmAr5lCXGKEAaC9r
	 ZBI5tCrYnkrgEzDjwyrFR6CTKsoKzUaMZI07nqWNbgjr9SFbrRx2PHk3eG7unpWXhn
	 lNlKu0d7IBtlfm4iQW4SI/PclqtUyp/ODT5hwT9k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6154FF804DF;
	Mon,  6 Sep 2021 18:29:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0A30F804A9; Mon,  6 Sep 2021 18:29:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B51FF8014D
 for <alsa-devel@alsa-project.org>; Mon,  6 Sep 2021 18:28:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B51FF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="pu9w8GQX"
Received: by mail-wr1-x42a.google.com with SMTP id m9so10639575wrb.1
 for <alsa-devel@alsa-project.org>; Mon, 06 Sep 2021 09:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K9/IADPCTfS1A+kIDuWYabZeRoEDF2vR35j0XEALmBU=;
 b=pu9w8GQX3Uy1rCJpk2kp6IWia3g+4q7A0FXjsVt4m8ZtBOE1Xdpb0nGI5jbkOeQXDw
 SvmCvxvNQinsNUszs8O03XalQqt9sH5QeJVp6v8bU1KkSIQth3yt/S/TEmUkVLOskz4u
 zJhKI+FWeb0kgV3VmqEMG2CiWzvs/W4O7QKakMIOirzlrDUVn3sJop+sqmJgqgDSMIbQ
 +HiyjhxeuMvcByGBCCmjqaEs1h8rsVysts6Men49X/m8C8vQRAdILaslqzr28suGKMDO
 Y/mVn9C+JpncehIV10MPVN8ed/nxnpasnuo8a/qkvHgNtVkQAVICQR/qwwtkpOwEw/Yt
 Ow8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K9/IADPCTfS1A+kIDuWYabZeRoEDF2vR35j0XEALmBU=;
 b=EIIN5Hfk6WAHkj0SSJBJYlhHahBMeo3iGFa/6bSAEUIgu2BJOKDfd6ChPswFiBQccG
 iF418RFKAehAoSjI/3yexJ0v4NZYLPkEktbxCerJ9oHMTUqU0MlPqKPlmxjdiwnSie8F
 f+NfLFAwvBsjSYPNKF/ZK9zeLKDwP9K2J5A6/7Xizaa9v+t4KVYPbqM7MnK5h7Cb4txg
 rjvBvlBd3vnX8t1sTIHS3gUWO9Tko+vGYz+Dij8W7qw2GVIRU80RTA0ZFkuvBLV3YZVU
 Z4zavlkgGr/3d1aR7zIHxdNtT6ZZvp3lHroX4Z7S2ODw5N5bKODwkdt+04NziWbB19jo
 Fm0A==
X-Gm-Message-State: AOAM532mAXYYcmmnZv/7va5j+nkF+5NbLBRQyIBnVEVzhTrVtEqB6kdv
 9yfMgD1euQv0aPAr0QOA4tqCkw==
X-Google-Smtp-Source: ABdhPJzJXonenUj9r0z7ElJeU/FfwlK/1KIRVG75vw/29AggL/5z1FhM6L9qqqvhzQiDiU1w2VCJSw==
X-Received: by 2002:a5d:4107:: with SMTP id l7mr14113354wrp.318.1630945739115; 
 Mon, 06 Sep 2021 09:28:59 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id h8sm7597153wmb.35.2021.09.06.09.28.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 09:28:58 -0700 (PDT)
Subject: Re: [PATCH v5 15/21] ASoC: qdsp6: audioreach: add q6apm support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
 <20210903112032.25834-16-srinivas.kandagatla@linaro.org>
 <081e6734-a258-6d21-cf66-f00bfeb38b04@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <b1cfacb4-70b9-7146-00d5-9d680297d900@linaro.org>
Date: Mon, 6 Sep 2021 17:28:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <081e6734-a258-6d21-cf66-f00bfeb38b04@linux.intel.com>
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

thanks Pierre for taking time to review the patches.

On 03/09/2021 15:54, Pierre-Louis Bossart wrote:
> 
>> +static void apm_populate_container_config(
>> +			struct apm_container_obj *cfg,
>> +			struct audioreach_container *cont)
> 
> indentation looks rather weird, use 100 chars?

Fixed simillar indendataion across all the patches.
> 
>> +{
>> +

>> +struct audioreach_module *audioreach_get_container_first_module(
>> +				struct audioreach_container *container)
>> +{
>> +	struct audioreach_module *module;
>> +
>> +	list_for_each_entry(module, &container->modules_list, node) {
>> +		if (module->src_mod_inst_id == 0 ||
>> +		    !is_module_in_container(container, module->src_mod_inst_id))
> 
> You may want to add a to comment to explain why you walk through the
> list with two nested loops?

Yes, I have add a comment now.

> 
>> +			return module;
>> +	}
>> +	return NULL;
>> +}
>> +EXPORT_SYMBOL_GPL(audioreach_get_container_first_module);
> 
>> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
>> index 8ef015aca3b2..d25ea8c48b41 100644
>> --- a/sound/soc/qcom/qdsp6/audioreach.h
>> +++ b/sound/soc/qcom/qdsp6/audioreach.h
>> @@ -5,6 +5,9 @@
>>   #include <linux/types.h>
>>   #include <linux/soc/qcom/apr.h>
>>   #include <sound/soc.h>
>> +struct q6apm;
>> +struct q6apm_graph;
>> +
>>   
> 
> spurious line? checkpatch should complain on this?
Its fixed now.

> 
>>   /* Module IDs */
>>   #define MODULE_ID_WR_SHARED_MEM_EP	0x07001000
>> @@ -622,6 +625,20 @@ struct audioreach_module {
>>   	struct snd_soc_dapm_widget *widget;
>>   };
>>   
>> +struct audioreach_module_config {
>> +	int	direction;
>> +	u16	sample_rate;
> 
> so any rate above 64kHz cannot be represented? yay high-res audio...
True, this is just an intermediate data-structure, I have have now 
changed this to u32.
> 
>> +	u16	bit_width;
>> +	u16	bits_per_sample;
>> +
>> +	u16	data_format;
>> +	u16	num_channels;
>> +	u16	active_channels_mask;
>> +	u32	sd_line_mask;
>> +	int	fmt;
>> +	u8 channel_map[PCM_MAX_NUM_CHANNEL];
>> +};
> 
>> +/*
...
>> +int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt,
>> +			uint32_t rsp_opcode)
>> +{
>> +	gpr_device_t *gdev = apm->gdev;
>> +	struct gpr_hdr *hdr = &pkt->hdr;
>> +	int rc;
>> +
>> +	mutex_lock(&apm->cmd_lock);
>> +	apm->result.opcode = 0;
>> +	apm->result.status = 0;
>> +
>> +	rc = gpr_send_pkt(apm->gdev, pkt);
>> +	if (rc < 0)
>> +		goto err;
>> +
>> +	if (rsp_opcode)
>> +		rc = wait_event_timeout(apm->wait,
>> +					(apm->result.opcode == hdr->opcode) ||
>> +					(apm->result.opcode == rsp_opcode),
>> +					5 * HZ);
>> +	else
>> +		rc = wait_event_timeout(apm->wait,
>> +					(apm->result.opcode == hdr->opcode),
>> +					5 * HZ);
>> +
>> +	if (!rc) {
>> +		dev_err(&gdev->dev, "CMD timeout for [%x] opcode\n",
>> +			hdr->opcode);
>> +		rc = -ETIMEDOUT;
>> +	} else if (apm->result.status > 0) {
>> +		dev_err(&gdev->dev, "DSP returned error[%x] %x\n", hdr->opcode,
>> +			apm->result.status);
>> +		rc = -EINVAL;
>> +	} else {
>> +		dev_err(&gdev->dev, "DSP returned [%x]\n",
>> +			apm->result.status);
>> +		rc = 0;
> 
> maybe add a comment on why you squelch the error?

DSP finished command successfully at this point. DSP returns error info 
in result.status. I have added a comment here for clarity and removed 
this dev_err which I have used in past for debug.

> 
>> +	}
>> +
>> +err:
>> +	mutex_unlock(&apm->cmd_lock);
>> +	return rc;
>> +}
>> +
>> +static struct audioreach_graph *q6apm_get_audioreach_graph(struct q6apm *apm,
>> +						      uint32_t graph_id)
>> +{
>> +	struct audioreach_graph *graph;
>> +	struct audioreach_graph_info *info;
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&apm->lock, flags);
>> +	graph = idr_find(&apm->graph_idr, graph_id);
>> +	spin_unlock_irqrestore(&apm->lock, flags);
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
>> +	/* Assuming Linear Graphs only for now! */

THis is very old comment forgot to clean it up, its removed now.

> 
> Linear graphs? does this mean you don't have support for mixers/mux/demux?
> 
> The cover letter says this
> 
> "
> AudioReach has constructs of sub-graph, container and modules.
> Each sub-graph can have N containers and each Container can have N Modules
> and connections between them can be linear or non-linear.
> "
> 
> the comment seems contradict the cover letter, so which is it?
> 
> Explaining the concept of 'nonlinear' would be good, I don't think I've
> ever seen this term used for a graph. The graph of a function can be
> linear or non-linear, but that's a different story.
> 
>> +	graph->graph = audioreach_alloc_graph_pkt(apm, &info->sg_list, graph_id);
>> +	if (IS_ERR(graph->graph)) {
>> +		kfree(graph);
>> +		return ERR_PTR(-ENOMEM);
>> +	}
>> +
>> +	spin_lock(&apm->lock);
>> +	idr_alloc(&apm->graph_idr, graph, graph_id,
>> +		  graph_id + 1, GFP_ATOMIC);
> 
> does this need to be ATOMIC?

We are inside spinlock.

> 
>> +	spin_unlock(&apm->lock);
>> +
>> +	kref_init(&graph->refcount);
>> +
>> +	q6apm_send_cmd_sync(apm, graph->graph, 0);
>> +
>> +	return graph;
>> +}
>> +
>> +static int audioreach_graph_mgmt_cmd(struct audioreach_graph *graph,
>> +				      uint32_t opcode)
>> +{
>> +	struct gpr_pkt *pkt;
>> +	void *p;
>> +	int i = 0, rc, payload_size;
>> +	struct q6apm *apm = graph->apm;
>> +	struct audioreach_graph_info *info = graph->info;
>> +	int num_sub_graphs = info->num_sub_graphs;
>> +	struct apm_graph_mgmt_cmd *mgmt_cmd;
>> +	struct apm_module_param_data *param_data;
>> +	struct audioreach_sub_graph *sg;
> 
> reverse x-mas tree style?
> 
I think I tried to do this but some how I missed it in few places, will 
fix all such instances.

>> +
>> +

>> +static int graph_callback(struct gpr_resp_pkt *data, void *priv, int op)
>> +{
>> +	struct q6apm_graph *graph = priv;
>> +	struct device *dev = graph->dev;
>> +	struct gpr_hdr *hdr = &data->hdr;
>> +	struct gpr_ibasic_rsp_result_t *result;
>> +	int ret = -EINVAL;
>> +	uint32_t client_event = 0;
>> +	struct data_cmd_rsp_wr_sh_mem_ep_data_buffer_done_v2 *done;
>> +	struct apm_cmd_rsp_shared_mem_map_regions *rsp;
>> +	phys_addr_t phys;
>> +	unsigned long flags;
>> +	int token;
>> +
>> +	result = data->payload;
>> +
>> +	switch (hdr->opcode) {
>> +	case DATA_CMD_RSP_WR_SH_MEM_EP_DATA_BUFFER_DONE_V2:
>> +		client_event = APM_CLIENT_EVENT_DATA_WRITE_DONE;
>> +		spin_lock_irqsave(&graph->lock, flags);
>> +		token = hdr->token & APM_WRITE_TOKEN_MASK;
>> +
>> +		done = data->payload;
>> +		phys = graph->rx_data.buf[token].phys;
>> +
>> +		if (lower_32_bits(phys) != done->buf_addr_lsw ||
>> +		    upper_32_bits(phys) != done->buf_addr_msw) {
>> +			dev_err(dev, "WR BUFF Expected Token %d addr %pa\n", token, &phys);
>> +			ret = -EINVAL;
>> +		} else {
>> +			ret = 0;
>> +			graph->result.opcode = hdr->opcode;
>> +			graph->result.status = done->status;
>> +		}
>> +		spin_unlock_irqrestore(&graph->lock, flags);
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
>> +		done = data->payload;
>> +		spin_lock_irqsave(&graph->lock, flags);
>> +		phys = graph->tx_data.buf[hdr->token].phys;
>> +		if (upper_32_bits(phys) != done->buf_addr_msw ||
>> +		    lower_32_bits(phys) != done->buf_addr_lsw) {
>> +			dev_err(dev, "RD BUFF Expected addr %pa %08x-%08x\n",
>> +				&phys,
>> +				done->buf_addr_lsw,
>> +				done->buf_addr_msw);
>> +			ret = -EINVAL;
>> +		} else {
>> +			ret = 0;
>> +		}
>> +		spin_unlock_irqrestore(&graph->lock, flags);
>> +		client_event = APM_CLIENT_EVENT_DATA_READ_DONE;
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
>> +				dev_err(dev,
>> +					"Error (%d) Processing 0x%08x cmd\n",
>> +					result->status, result->opcode);
>> +				ret = -EINVAL;
>> +			} else {
>> +				ret = 0;
>> +			}
>> +			wake_up(&graph->cmd_wait);
>> +			if (graph->cb)
>> +				graph->cb(client_event, hdr->token, data->payload,
>> +					  graph->priv);
>> +
>> +		}
>> +		break;
> 
> default:
>     ret = -EINVAL;
>     break;
> 

Yes, it needs
default:
	break;
at two places, ret is already initialized to -EINVAL.

> ??
> 
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
>> +				     void *priv, int graph_id)
>> +{
>> +	struct q6apm *apm = dev_get_drvdata(dev->parent);
>> +	struct q6apm_graph *graph;
>> +	struct audioreach_graph *ar_graph;
>> +	int ret;
>> +
>> +	dev_err(dev, "%s :graph id %d\n", __func__, graph_id);
> 
> dev_dbg() ?

This looks like lef-over from debug. Will remove this.

> 
>> +	ar_graph = q6apm_get_audioreach_graph(apm, graph_id);
>> +	if (IS_ERR(ar_graph)) {
>> +		dev_err(dev, "No graph found with id %d\n", graph_id);
>> +		return ERR_CAST(ar_graph);
>> +	}
>> +
>> +	graph = kzalloc(sizeof(*graph), GFP_KERNEL);
>> +	if (!graph) {
>> +		ret = -ENOMEM;
>> +		goto err;
>> +	}
>> +
>> +	graph->apm = apm;
>> +	graph->priv = priv;
>> +	graph->cb = cb;
>> +	graph->info = ar_graph->info;
>> +	graph->ar_graph = ar_graph;
>> +	graph->id = ar_graph->id;
>> +	graph->dev = dev;
>> +
>> +	spin_lock_init(&graph->lock);
>> +	init_waitqueue_head(&graph->cmd_wait);
>> +	mutex_init(&graph->cmd_lock);
>> +
>> +	graph->port = gpr_alloc_port(apm->gdev, dev, graph_callback, graph);
>> +	if (!graph->port) {
>> +		kfree(graph);
>> +		ret = -ENOMEM;
>> +		goto err;
>> +	}
>> +
>> +	dev_dbg(dev, "%s: GRAPH-DEBUG Opening graph id %d with port id 0x%08x\n", __func__,
>> +		graph_id, graph->port->id);
>> +
>> +	return graph;
>> +err:
>> +	kref_put(&ar_graph->refcount, q6apm_put_audioreach_graph);
>> +	return ERR_PTR(ret);
>> +}
>> +EXPORT_SYMBOL_GPL(q6apm_graph_open);
>> +
>> +int q6apm_graph_close(struct q6apm_graph *graph)
>> +{
>> +	struct audioreach_graph *ar_graph = graph->ar_graph;
>> +
>> +	gpr_free_port(graph->port);
>> +	graph->port = NULL;
>> +	kref_put(&ar_graph->refcount, q6apm_put_audioreach_graph);
>> +	kfree(graph);
> 
> is this kfree needed, I see it done in the routine below:
Yes, its redundant, we can remove this.


> 
> static void q6apm_put_audioreach_graph(struct kref *ref)
> +{
> +	struct audioreach_graph *graph;
> +	struct q6apm *apm;
> +	unsigned long flags;
> +
> +	graph = container_of(ref, struct audioreach_graph, refcount);
> +	apm = graph->apm;
> +
> +	audioreach_graph_mgmt_cmd(graph, APM_CMD_GRAPH_CLOSE);
> +
> +	spin_lock_irqsave(&apm->lock, flags);
> +	graph = idr_remove(&apm->graph_idr, graph->id);
> +	spin_unlock_irqrestore(&apm->lock, flags);
> +
> +	kfree(graph->graph);
> +	kfree(graph); <<< HERE
> 
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(q6apm_graph_close);
>> +
> 
>> +static int apm_probe(gpr_device_t *gdev)
>> +{
>> +	struct device *dev = &gdev->dev;
>> +	struct q6apm *apm;
>> +
>> +	apm = devm_kzalloc(dev, sizeof(*apm), GFP_KERNEL);
>> +	if (!apm)
>> +		return -ENOMEM;
>> +
>> +	dev_set_drvdata(dev, apm);
>> +
>> +	mutex_init(&apm->cmd_lock);
>> +	apm->dev = dev;
>> +	apm->gdev = gdev;
>> +	init_waitqueue_head(&apm->wait);
>> +
>> +	idr_init(&apm->graph_idr);
>> +	idr_init(&apm->graph_info_idr);
>> +	idr_init(&apm->sub_graphs_idr);
>> +	idr_init(&apm->containers_idr);
>> +
>> +	idr_init(&apm->modules_idr);
>> +	spin_lock_init(&apm->lock);
>> +
>> +	q6apm_get_apm_state(apm);
>> +
>> +	devm_snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
> 
> shouldn't this be checked for errors?

I have fixed this now.

> 
>> +
>> +	return of_platform_populate(dev->of_node, NULL, NULL, dev);
>> +}
>> +
>> +static int apm_exit(gpr_device_t *gdev)
>> +{
>> +	return 0;
>> +}
>> +
>> +struct audioreach_module *q6apm_find_module_by_mid(struct q6apm_graph *graph,
>> +						    uint32_t mid)
>> +{
>> +	struct audioreach_graph_info *info = graph->info;
>> +	struct q6apm *apm = graph->apm;
>> +
>> +	return __q6apm_find_module_by_mid(apm, info, mid);
>> +
>> +}
>> +
>> +static int apm_callback(struct gpr_resp_pkt *data, void *priv, int op)
>> +{
>> +	gpr_device_t *gdev = priv;
>> +	struct q6apm *apm = dev_get_drvdata(&gdev->dev);
>> +	struct device *dev = &gdev->dev;
>> +	struct gpr_ibasic_rsp_result_t *result;
>> +	struct gpr_hdr *hdr = &data->hdr;
>> +	int ret = -EINVAL;
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
>> +				dev_err(dev,
>> +					"Error (%d) Processing 0x%08x cmd\n",
>> +					result->status, result->opcode);
>> +				ret = -EINVAL;
>> +			} else {
>> +				ret = 0;
>> +			}
>> +			wake_up(&apm->wait);
> 
> default case?
> 
>> +
>> +		}
>> +		break;
> 
> default case?

its done in next version.

> 
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static const struct of_device_id apm_device_id[]  = {
>> +	{ .compatible = "qcom,q6apm" },
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, apm_device_id);
>> +
>> +static gpr_driver_t apm_driver = {
>> +	.probe = apm_probe,
>> +	.remove = apm_exit,
> 
> this does nothing at the moment?
> 
>> +	.gpr_callback = apm_callback,
>> +	.driver = {
>> +		.name = "qcom-apm",
>> +		.of_match_table = of_match_ptr(apm_device_id),
>> +	},
>> +};
>> +
>> +module_gpr_driver(apm_driver);
>> +MODULE_DESCRIPTION("Audio Process Manager");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
>> new file mode 100644
>> index 000000000000..8956a060d7cc
>> --- /dev/null
>> +++ b/sound/soc/qcom/qdsp6/q6apm.h
>> @@ -0,0 +1,154 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +#ifndef __Q6APM_H__
>> +#define __Q6APM_H__
>> +#include <linux/types.h>
>> +#include <linux/slab.h>
>> +#include <linux/wait.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/sched.h>
>> +#include <linux/of.h>
>> +#include <linux/delay.h>
>> +#include <sound/soc.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/soc/qcom/apr.h>
>> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
>> +#include "audioreach.h"
>> +
>> +#define APM_PORT_MAX		127
>> +#define APM_PORT_MAX_AUDIO_CHAN_CNT 8
>> +#define PCM_CHANNEL_NULL 0
>> +#define PCM_CHANNEL_FL    1	/* Front left channel. */
>> +#define PCM_CHANNEL_FR    2	/* Front right channel. */
>> +#define PCM_CHANNEL_FC    3	/* Front center channel. */
>> +#define PCM_CHANNEL_LS   4	/* Left surround channel. */
>> +#define PCM_CHANNEL_RS   5	/* Right surround channel. */
>> +#define PCM_CHANNEL_LFE  6	/* Low frequency effect channel. */
>> +#define PCM_CHANNEL_CS   7	/* Center surround channel; Rear center ch */
>> +#define PCM_CHANNEL_LB   8	/* Left back channel; Rear left channel. */
>> +#define PCM_CHANNEL_RB   9	/* Right back channel; Rear right channel. */
>> +#define PCM_CHANNELS   10	/* Top surround channel. */
>> +
>> +#define NO_TIMESTAMP    0xFF00
>> +#define FORMAT_LINEAR_PCM   0x0000
> 
> APM_NO_TIMESTAMP?
> 
> use prefixes...

These are now prefixed.

--srini
> 
>> +/* APM client callback events */
>> +#define CMD_EOS				0x0003
> 
> APM_CMD_EOS?
> 
>> +#define APM_CLIENT_EVENT_CMD_EOS_DONE		0x1003
>> +#define CMD_CLOSE				0x0004
>> +#define APM_CLIENT_EVENT_CMD_CLOSE_DONE		0x1004
>> +#define APM_CLIENT_EVENT_CMD_RUN_DONE		0x1008
>> +#define APM_CLIENT_EVENT_DATA_WRITE_DONE	0x1009
>> +#define APM_CLIENT_EVENT_DATA_READ_DONE		0x100a
>> +#define APM_WRITE_TOKEN_MASK                   GENMASK(15, 0)
>> +#define APM_WRITE_TOKEN_LEN_MASK               GENMASK(31, 16)
>> +#define APM_WRITE_TOKEN_LEN_SHIFT              16
>> +
>> +#define MAX_SESSIONS	8
> 
> APM_MAX_SESSIONS?
> 
>> +
