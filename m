Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 797AC40DD85
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 17:04:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19FC8189F;
	Thu, 16 Sep 2021 17:03:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19FC8189F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631804655;
	bh=C+7Lcudi7SZbwNey9j+1MCCihc+kibSCcm/s+tOl0WM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MOGZdpi2QsXrA37OqK9DV+xh2mAl4TcbUy+zXI+ydgX3uFbqn2E83nkXSOM9E8CiT
	 E76LrGfdp4HpHiqO67TyaEV07U/uF6Or4CiD0Xf1syNwm+Lb4/45MSd/JRzytRP+L+
	 4hIHiVKvMwbBm8Bzy/5wk6Txv4vClkzZIILVsxLY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 754A3F804B0;
	Thu, 16 Sep 2021 17:02:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A630F8032B; Thu, 16 Sep 2021 17:02:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75751F80117
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 17:02:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75751F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jt/5tWIT"
Received: by mail-wr1-x431.google.com with SMTP id d21so9963469wra.12
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 08:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YIIiNZ1N2SOMMX7Uq/ij5mF3RLXqeUCzPbsrlrJuR74=;
 b=jt/5tWITWXCzx9TuxJKlc/4ci7MWX1d5XSJEosH7mEdxVHMgiJmIS+GpcgYOrjTTys
 liC5dOyHjJgXUb7WZxSKFCFHL0EdBWnw5anzuLoQGCIQD2hnaFSPayFdwVxBtMgLAo/3
 4rP8tAvjgUbtwCtV16AQDUj3I9Ui4kWa7WE34tnTI3aJtvshY1AxZOS/i6fGPfBoeBJ9
 caIwYFHgXHNpuuHhqYvInn0WTiRIU7wS42tih6bLLPfyDbBmy3dRKUDjHCl8sLhHs3HB
 KorpmD7IMAr0EuQc++UuAzXTZwBCtVN/Zfheh2LD9NG4CdLl1oSgRl6MUyPNABO2601c
 GgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YIIiNZ1N2SOMMX7Uq/ij5mF3RLXqeUCzPbsrlrJuR74=;
 b=7oEilqSDwZicQBpyPfbq6l12zYGsRLrL8TrKzbcvSRsvVXE8/wBbHnB957P2T1G3/p
 gQOIm7OFiO6iIROr9/AY1kzVd9g1yyb7E05ZIQ8ITzWsSUdR7dXUxCdeTXI2IyJptulu
 nr0+rBEtGCIvARK4OdI6wKBiM8bhKgJDNxynvwXUCyf2JjzYA9S7c2DZVN8xC7AXfm5f
 Vb8U3T1g8ZRK7XVas4HIobQs3VRwdTMB8UuHRqAp9Ajx5TnCLExDIOOGm9lZcbqXgkRt
 2buW6P3hk0ZXYR3y/KMjB0zAk+W/TIbJMVzJGDMfjG7USope+Hl+YF6HGGsoCs7SLH4m
 v5Tg==
X-Gm-Message-State: AOAM5307zqLi32E27TeQ33oHhK+f6mJPvTiOnXHzki1l7/rli4jsGd1P
 9gi1Yi+XLdyGpNIGRIaAzSJJhg==
X-Google-Smtp-Source: ABdhPJxlcORnlxuErR9hc2YbkqoJnbdb3QRiu5wa7dRIyegpk7J0bufluMi21B4MZ11Ja6aCC376zg==
X-Received: by 2002:adf:e5c5:: with SMTP id a5mr6546246wrn.290.1631804540284; 
 Thu, 16 Sep 2021 08:02:20 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id u2sm3573509wmj.29.2021.09.16.08.02.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 08:02:19 -0700 (PDT)
Subject: Re: [PATCH v6 15/22] ASoC: qdsp6: audioreach: add q6apm support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210915131333.19047-1-srinivas.kandagatla@linaro.org>
 <20210915131333.19047-16-srinivas.kandagatla@linaro.org>
 <f4c9702d-72a4-f602-71ce-006e6588190f@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <0938083f-debd-6ab1-b5fc-fc3335e0d9dd@linaro.org>
Date: Thu, 16 Sep 2021 16:02:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f4c9702d-72a4-f602-71ce-006e6588190f@linux.intel.com>
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

Thanks Pierre for review,

On 15/09/2021 17:02, Pierre-Louis Bossart wrote:
> 
>> +static void audioreach_populate_graph(struct apm_graph_open_params *open,
>> +				      struct list_head *sg_list,
>> +				      int num_sub_graphs)
>> +{
>> +	struct apm_mod_conn_list_params *mc_data = open->mod_conn_list_data;
>> +	struct apm_module_list_params *ml_data = open->mod_list_data;
>> +	struct apm_prop_list_params *mp_data = open->mod_prop_data;
>> +	struct apm_container_params *c_data = open->cont_data;
>> +	struct apm_sub_graph_params *sg_data = open->sg_data;
>> +	int ncontainer = 0, nmodule = 0, nconn = 0;
>> +	struct apm_mod_prop_obj *module_prop_obj;
>> +	struct audioreach_container *container;
>> +	struct apm_module_conn_obj *conn_obj;
>> +	struct audioreach_module *module;
>> +	struct audioreach_sub_graph *sg;
>> +	struct apm_container_obj *cobj;
>> +	struct apm_mod_list_obj *mlobj;
>> +	int i = 0;
>> +
>> +	mlobj = &ml_data->mod_list_obj[0];
>> +
>> +	list_for_each_entry(sg, sg_list, node) {
>> +		struct apm_sub_graph_data *sg_cfg = &sg_data->sg_cfg[i++];
>> +
>> +		apm_populate_sub_graph_config(sg_cfg, sg);
>> +
>> +		list_for_each_entry(container, &sg->container_list, node) {
>> +			cobj = &c_data->cont_obj[ncontainer];
>> +
>> +			apm_populate_container_config(cobj, container);
>> +			apm_populate_module_list_obj(mlobj, container, sg->sub_graph_id);
>> +
>> +			list_for_each_container_module(module, container) {
>> +				uint32_t src_mod_inst_id;
>> +
>> +				src_mod_inst_id = module->src_mod_inst_id;
>> +
>> +				module_prop_obj = &mp_data->mod_prop_obj[nmodule];
>> +				apm_populate_module_prop_obj(module_prop_obj, module);
>> +
>> +				if (src_mod_inst_id /*&& dst_mod_inst_id*/) {
> 
> remove left-over code or uncomment required condition?

Yes, this can be removed.

> 
>> +					conn_obj = &mc_data->conn_obj[nconn];
>> +					apm_populate_connection_obj(conn_obj, module);
>> +					nconn++;
>> +				}
>> +
>> +				nmodule++;
>> +			}
>> +			mlobj = (void *) mlobj + APM_MOD_LIST_OBJ_PSIZE(container->num_modules);
>> +
>> +			ncontainer++;
>> +		}
>> +	}
>> +}
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
>> +	}
>> +
>> +	mutex_lock(&apm->lock);
>> +	idr_alloc(&apm->graph_idr, graph, graph_id, graph_id + 1, GFP_KERNEL);
> 
> test for idr_alloc() success? You have error checks for idr_find() but
> not for the _alloc() case.

Yes, error handing is missing in this case, fixed in next version.

> 
>> +	mutex_unlock(&apm->lock);
>> +
>> +	kref_init(&graph->refcount);
>> +
>> +	q6apm_send_cmd_sync(apm, graph->graph, 0);
>> +
>> +	return graph;
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
> 
> this would keep ret = -EINVAL and return it, that seems suspicious since
> this doesn't look as an error case?
> 
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
>> +			} else {
>> +				ret = 0;
> 
> That's also weird, maybe initialize to zero and return an error code in
> error cases, or fix the case APM_CMD_RSP_GET_SPF_STATE above.

this is now fixed by initializing the ret to 0 and setting it in error path.

--srini

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
> 
> so all the defaults are errors?
> 
>> +	}
>> +
>> +	return ret;
>> +}
