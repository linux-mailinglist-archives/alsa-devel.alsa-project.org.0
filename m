Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 880D13C9CBE
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 12:34:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11314169C;
	Thu, 15 Jul 2021 12:33:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11314169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626345259;
	bh=xdtJCBYNqWas/Kq4FZMDys/KoE7L3yB5CoWX8Bnix9E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O545661R2k8JYJjXqDWqjLMAThI047pc4gf7G5aGhphyXYSsiFJ2h4X1yL4AaAA+4
	 Y/bksEQhHksH8osPaz/4BNtVqauVDqAUPsylf/4SuqdXjvOOm/+gb7as3lZy8ckyF6
	 zDLcgOdphUFMGY/rXdQHEL7xcuto4A6vLO6UG+S4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9163F804DF;
	Thu, 15 Jul 2021 12:32:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0155FF80430; Thu, 15 Jul 2021 12:32:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86C3AF80229
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 12:31:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86C3AF80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="c4uipzQy"
Received: by mail-wr1-x436.google.com with SMTP id r11so7074884wro.9
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 03:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OeiiPl20p9927jbWX7/PfpqS3lSPvusA08Tdqa5UmsY=;
 b=c4uipzQyvebNcq97tf/wFVVx3CSXp3afJYoykf5QKzyirFj9iWO4uusgOI0uPHrtTE
 VfgyKigHuq4KbdCSGL0eVh3ddESvxWA6SFdVHg41aU5mrPCCXDaBIZzIBzUQNPD8XU5r
 7Ql6MK5BejSEOUee+GZOdcidK+JTfrE91sLDFpFs+894+41stPfKcm3BlHozyYM10F6V
 cfokdoruOYjViQkYpjAx8XJ1rTEPxRnxbz6r2cX5yNDNX8gN57jVcyXygP8HvpHEjbCx
 EdUJ3HJ9d6DSOcYO3sjQvVhO/7yHvtuwT8UmuM0nDX2y5qHBio8MZxqD770QEiTvYk1l
 glCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OeiiPl20p9927jbWX7/PfpqS3lSPvusA08Tdqa5UmsY=;
 b=SO3W6JI2Y2vV9gGFfPfUEyhlcSWcZ/quyizf58eELKqHf79k+fNYXo80YQ3TjlLULl
 UPR/qs8u7CZkfHKaHVujF1xsDWAe284wIyCMfR6ozXFL7AoIvDKygYwPumd8sOLkqOTi
 orUCvETsWLRmRDEMf+i5BTMNWESWt964OcYa2N6m/xBvHrxDyV3OK9t1Db7aDtdLk/Yh
 34TSYUq4O5yvk57d6+nRRIF8u6oDYpIZ8SYJ1mo+5sdLl1onJuv1hnSd6OjL9+TppyoU
 3D3ateTZQMhrySKLmuEFjMkSptIGqxkcLGC5OJbfmx36WsJ4dOibQ643LQUweO93IZ8g
 tlsg==
X-Gm-Message-State: AOAM531HsT3s/qjokqY0XPrQ8/ml9EZC3sWLnSRX+wgOuD39J2F69upB
 slMjXFlD1KxdCDx5siC55FsHqQ==
X-Google-Smtp-Source: ABdhPJwgt9sLn+0DSNgKRhtlwDwl9INltt2ugA0cLn21vmM1i3UCR0E0SsLtUikbolq1R6hUyExSdg==
X-Received: by 2002:a5d:5989:: with SMTP id n9mr4535183wri.8.1626345116330;
 Thu, 15 Jul 2021 03:31:56 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id d14sm5927985wrs.49.2021.07.15.03.31.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 03:31:55 -0700 (PDT)
Subject: Re: [PATCH v2 06/16] ASoC: qcom: audioreach: add q6apm support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
 <20210714153039.28373-7-srinivas.kandagatla@linaro.org>
 <77b9d17d-33b6-8a7a-bb1d-e32543d9da79@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <d52fa4c9-d3c7-7501-0bcb-2c7ff997aa55@linaro.org>
Date: Thu, 15 Jul 2021 11:31:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <77b9d17d-33b6-8a7a-bb1d-e32543d9da79@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

Thanks Pierre for review,

On 14/07/2021 17:40, Pierre-Louis Bossart wrote:
> 
>>   /* SubGraph Config */
>> @@ -32,7 +33,7 @@ struct apm_sub_graph_params  {
>>   /* container config */
>>   struct apm_container_obj  {
>>   	struct apm_container_cfg container_cfg;
>> -	/* Capablity ID list */
>> +	/* Capability ID list */
> 
> squash in wrong patch, this should have been included in the previous patch.

My bad.. will fix such instances in next spin.


> 
>>   	struct apm_prop_data cap_data;
>>   	uint32_t num_capablity_id;

...

> 
>> +static struct audioreach_graph *q6apm_get_audioreach_graph(struct q6apm *apm,
>> +						      uint32_t graph_id)
>> +{
>> +	struct audioreach_graph *graph = NULL;
> 
> useless init
> 
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
>> +	graph->graph = audioreach_alloc_graph_pkt(apm, &info->sg_list, graph_id);
>> +	if (IS_ERR(graph->graph))
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	spin_lock(&apm->lock);
>> +	idr_alloc(&apm->graph_idr, graph, graph_id,
>> +		  graph_id + 1, GFP_ATOMIC);
> 
> ATOMIC?
we are under spinlock here, so we need this.

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
>> +
>> +	payload_size = APM_GRAPH_MGMT_PSIZE(num_sub_graphs);
>> +
>> +	p = audioreach_alloc_apm_cmd_pkt(payload_size, opcode, 0);
>> +	if (IS_ERR(p))
>> +		return -ENOMEM;
>> +
>> +	pkt = p;
>> +	p = p + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
>> +
>> +	mgmt_cmd = p;
>> +	mgmt_cmd->num_sub_graphs = num_sub_graphs;
>> +
>> +	param_data = &mgmt_cmd->param_data;
>> +	param_data->module_instance_id = APM_MODULE_INSTANCE_ID;
>> +	param_data->param_id = APM_PARAM_ID_SUB_GRAPH_LIST;
>> +	param_data->param_size = payload_size - APM_MODULE_PARAM_DATA_SIZE;
>> +
>> +	list_for_each_entry(sg, &info->sg_list, node) {
>> +		mgmt_cmd->sub_graph_id_list[i++] = sg->sub_graph_id;
>> +	}
>> +
>> +	rc = q6apm_send_cmd_sync(apm, pkt, 0);
>> +
>> +	kfree(pkt);
>> +
>> +	return rc;
>> +}
>> +
>> +static void q6apm_put_audioreach_graph(struct kref *ref)
>> +{
>> +	struct audioreach_graph *graph;
>> +	struct q6apm *apm;
>> +	unsigned long flags;
>> +
>> +	graph = container_of(ref, struct audioreach_graph, refcount);
>> +	apm = graph->apm;
>> +
>> +	audioreach_graph_mgmt_cmd(graph, APM_CMD_GRAPH_CLOSE);
>> +
>> +	spin_lock_irqsave(&apm->lock, flags);
>> +	graph = idr_remove(&apm->graph_idr, graph->id);
>> +	spin_unlock_irqrestore(&apm->lock, flags);
>> +
>> +	kfree(graph->graph);
>> +	kfree(graph);
> 
> earlier in the _get routine, you had a kref_get(&graph->refcount)
> 
This is a release callback for kref. Probably I should rename this to 
q6apm_release_audioreach_graph().


> is it intentional that there's kref_put?

kref_put is called in q6apm_graph_close()

q6apm_graph_open() calls q6apm_get_audioreach_graph() which will do 
kref_get.

q6apm_graph_close() will call kref_put().

when refcount is zero q6apm_put_audioreach_graph() callback will be invoked.

--srini
> 
> adding a comment on the refcounts might be useful...
> 
