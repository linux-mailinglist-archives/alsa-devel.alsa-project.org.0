Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A48FA40CA69
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 18:36:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20D171843;
	Wed, 15 Sep 2021 18:35:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20D171843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631723789;
	bh=hmcsl9lvuNzn9McD72DyFBy5uatzCKs05zIHoxG6Zxg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iIpwjZJAogJnwJzhGu3ZhEGl8Cdnp1RrgtGCwp8tPgMg5TUo7GhtZxRmxbLyynVfG
	 IHdLMeFwWHmfGuKZvK94riGHjEvynHQOFTroSof7u3wriZsj3Z/AwNzUlP1U3L5Mr/
	 ob+hHhkejsZSjOdYg4w1u7stvAs+m0uyU+D29oP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E2B8F804E3;
	Wed, 15 Sep 2021 18:34:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1071AF8032C; Wed, 15 Sep 2021 18:34:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB8F5F80227
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 18:34:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB8F5F80227
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="286060904"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="286060904"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 09:34:37 -0700
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="583352195"
Received: from mvetrive-mobl3.amr.corp.intel.com (HELO [10.212.69.198])
 ([10.212.69.198])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 09:34:35 -0700
Subject: Re: [PATCH v6 15/22] ASoC: qdsp6: audioreach: add q6apm support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210915131333.19047-1-srinivas.kandagatla@linaro.org>
 <20210915131333.19047-16-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f4c9702d-72a4-f602-71ce-006e6588190f@linux.intel.com>
Date: Wed, 15 Sep 2021 11:02:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210915131333.19047-16-srinivas.kandagatla@linaro.org>
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


> +static void audioreach_populate_graph(struct apm_graph_open_params *open,
> +				      struct list_head *sg_list,
> +				      int num_sub_graphs)
> +{
> +	struct apm_mod_conn_list_params *mc_data = open->mod_conn_list_data;
> +	struct apm_module_list_params *ml_data = open->mod_list_data;
> +	struct apm_prop_list_params *mp_data = open->mod_prop_data;
> +	struct apm_container_params *c_data = open->cont_data;
> +	struct apm_sub_graph_params *sg_data = open->sg_data;
> +	int ncontainer = 0, nmodule = 0, nconn = 0;
> +	struct apm_mod_prop_obj *module_prop_obj;
> +	struct audioreach_container *container;
> +	struct apm_module_conn_obj *conn_obj;
> +	struct audioreach_module *module;
> +	struct audioreach_sub_graph *sg;
> +	struct apm_container_obj *cobj;
> +	struct apm_mod_list_obj *mlobj;
> +	int i = 0;
> +
> +	mlobj = &ml_data->mod_list_obj[0];
> +
> +	list_for_each_entry(sg, sg_list, node) {
> +		struct apm_sub_graph_data *sg_cfg = &sg_data->sg_cfg[i++];
> +
> +		apm_populate_sub_graph_config(sg_cfg, sg);
> +
> +		list_for_each_entry(container, &sg->container_list, node) {
> +			cobj = &c_data->cont_obj[ncontainer];
> +
> +			apm_populate_container_config(cobj, container);
> +			apm_populate_module_list_obj(mlobj, container, sg->sub_graph_id);
> +
> +			list_for_each_container_module(module, container) {
> +				uint32_t src_mod_inst_id;
> +
> +				src_mod_inst_id = module->src_mod_inst_id;
> +
> +				module_prop_obj = &mp_data->mod_prop_obj[nmodule];
> +				apm_populate_module_prop_obj(module_prop_obj, module);
> +
> +				if (src_mod_inst_id /*&& dst_mod_inst_id*/) {

remove left-over code or uncomment required condition?

> +					conn_obj = &mc_data->conn_obj[nconn];
> +					apm_populate_connection_obj(conn_obj, module);
> +					nconn++;
> +				}
> +
> +				nmodule++;
> +			}
> +			mlobj = (void *) mlobj + APM_MOD_LIST_OBJ_PSIZE(container->num_modules);
> +
> +			ncontainer++;
> +		}
> +	}
> +}

> +static struct audioreach_graph *q6apm_get_audioreach_graph(struct q6apm *apm, uint32_t graph_id)
> +{
> +	struct audioreach_graph_info *info;
> +	struct audioreach_graph *graph;
> +
> +	mutex_lock(&apm->lock);
> +	graph = idr_find(&apm->graph_idr, graph_id);
> +	mutex_unlock(&apm->lock);
> +
> +	if (graph) {
> +		kref_get(&graph->refcount);
> +		return graph;
> +	}
> +
> +	info = idr_find(&apm->graph_info_idr, graph_id);
> +
> +	if (!info)
> +		return ERR_PTR(-ENODEV);
> +
> +	graph = kzalloc(sizeof(*graph), GFP_KERNEL);
> +	if (!graph)
> +		return ERR_PTR(-ENOMEM);
> +
> +	graph->apm = apm;
> +	graph->info = info;
> +	graph->id = graph_id;
> +
> +	graph->graph = audioreach_alloc_graph_pkt(apm, &info->sg_list, graph_id);
> +	if (IS_ERR(graph->graph)) {
> +		kfree(graph);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	mutex_lock(&apm->lock);
> +	idr_alloc(&apm->graph_idr, graph, graph_id, graph_id + 1, GFP_KERNEL);

test for idr_alloc() success? You have error checks for idr_find() but
not for the _alloc() case.

> +	mutex_unlock(&apm->lock);
> +
> +	kref_init(&graph->refcount);
> +
> +	q6apm_send_cmd_sync(apm, graph->graph, 0);
> +
> +	return graph;
> +}
> +
> +static int audioreach_graph_mgmt_cmd(struct audioreach_graph *graph, uint32_t opcode)
> +{
> +	struct audioreach_graph_info *info = graph->info;
> +	int num_sub_graphs = info->num_sub_graphs;
> +	struct apm_module_param_data *param_data;
> +	struct apm_graph_mgmt_cmd *mgmt_cmd;
> +	struct audioreach_sub_graph *sg;
> +	struct q6apm *apm = graph->apm;
> +	int i = 0, rc, payload_size;
> +	struct gpr_pkt *pkt;
> +
> +	payload_size = APM_GRAPH_MGMT_PSIZE(num_sub_graphs);
> +
> +	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, opcode, 0);
> +	if (IS_ERR(pkt))
> +		return -ENOMEM;
> +
> +	mgmt_cmd = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
> +
> +	mgmt_cmd->num_sub_graphs = num_sub_graphs;
> +
> +	param_data = &mgmt_cmd->param_data;
> +	param_data->module_instance_id = APM_MODULE_INSTANCE_ID;
> +	param_data->param_id = APM_PARAM_ID_SUB_GRAPH_LIST;
> +	param_data->param_size = payload_size - APM_MODULE_PARAM_DATA_SIZE;
> +
> +	list_for_each_entry(sg, &info->sg_list, node)
> +		mgmt_cmd->sub_graph_id_list[i++] = sg->sub_graph_id;
> +
> +	rc = q6apm_send_cmd_sync(apm, pkt, 0);
> +
> +	kfree(pkt);
> +
> +	return rc;
> +}
> +
> +static void q6apm_put_audioreach_graph(struct kref *ref)
> +{
> +	struct audioreach_graph *graph;
> +	struct q6apm *apm;
> +
> +	graph = container_of(ref, struct audioreach_graph, refcount);
> +	apm = graph->apm;
> +
> +	audioreach_graph_mgmt_cmd(graph, APM_CMD_GRAPH_CLOSE);
> +
> +	mutex_lock(&apm->lock);
> +	graph = idr_remove(&apm->graph_idr, graph->id);
> +	mutex_unlock(&apm->lock);
> +
> +	kfree(graph->graph);
> +	kfree(graph);
> +}
> +
> +static bool q6apm_get_apm_state(struct q6apm *apm)
> +{
> +	struct gpr_pkt *pkt;
> +
> +	pkt = audioreach_alloc_apm_cmd_pkt(0, APM_CMD_GET_SPF_STATE, 0);
> +	if (IS_ERR(pkt))
> +		return -ENOMEM;
> +
> +	q6apm_send_cmd_sync(apm, pkt, APM_CMD_RSP_GET_SPF_STATE);
> +
> +	kfree(pkt);
> +
> +	return !apm->state ? false : true;
> +}
> +
> +static struct audioreach_module *__q6apm_find_module_by_mid(struct q6apm *apm,
> +						    struct audioreach_graph_info *info,
> +						    uint32_t mid)
> +{
> +	struct audioreach_container *container;
> +	struct audioreach_sub_graph *sgs;
> +	struct audioreach_module *module;
> +
> +	list_for_each_entry(sgs, &info->sg_list, node) {
> +		list_for_each_entry(container, &sgs->container_list, node) {
> +			list_for_each_entry(module, &container->modules_list, node) {
> +				if (mid == module->module_id)
> +					return module;
> +			}
> +		}
> +	}
> +
> +	return NULL;
> +}
> +
> +static struct audioreach_module *q6apm_graph_get_last_module(struct q6apm *apm, u32 sgid)
> +{
> +	struct audioreach_container *container;
> +	struct audioreach_module *module;
> +	struct audioreach_sub_graph *sg;
> +
> +	mutex_lock(&apm->lock);
> +	sg = idr_find(&apm->sub_graphs_idr, sgid);
> +	mutex_unlock(&apm->lock);
> +	if (!sg)
> +		return NULL;
> +
> +	container = list_last_entry(&sg->container_list, struct audioreach_container, node);
> +	module = audioreach_get_container_last_module(container);
> +
> +	return module;
> +}
> +
> +static struct audioreach_module *q6apm_graph_get_first_module(struct q6apm *apm, u32 sgid)
> +{
> +	struct audioreach_container *container;
> +	struct audioreach_module *module;
> +	struct audioreach_sub_graph *sg;
> +
> +	mutex_lock(&apm->lock);
> +	sg = idr_find(&apm->sub_graphs_idr, sgid);
> +	mutex_unlock(&apm->lock);
> +	if (!sg)
> +		return NULL;
> +
> +	container = list_first_entry(&sg->container_list, struct audioreach_container, node);
> +	module = audioreach_get_container_first_module(container);
> +
> +	return module;
> +}
> +
> +bool q6apm_is_sub_graphs_connected(struct q6apm *apm, u32 src_sgid, u32 dst_sgid)
> +{
> +	struct audioreach_module *module;
> +	u32 iid;
> +
> +	module = q6apm_graph_get_last_module(apm, src_sgid);
> +	if (!module)
> +		return false;
> +
> +	iid = module->instance_id;
> +	module = q6apm_graph_get_first_module(apm, dst_sgid);
> +	if (!module)
> +		return false;
> +
> +	if (module->src_mod_inst_id == iid)
> +		return true;
> +
> +	return false;
> +}
> +
> +int q6apm_connect_sub_graphs(struct q6apm *apm, u32 src_sgid, u32 dst_sgid, bool connect)
> +{
> +	struct audioreach_module *module;
> +	u32 iid;
> +
> +	if (connect) {
> +		module = q6apm_graph_get_last_module(apm, src_sgid);
> +		if (!module)
> +			return -ENODEV;
> +
> +		iid = module->instance_id;
> +	} else {
> +		iid = 0;
> +	}
> +
> +	module = q6apm_graph_get_first_module(apm, dst_sgid);
> +	if (!module)
> +		return -ENODEV;
> +
> +	/* set src module in dst subgraph first module */
> +	module->src_mod_inst_id = iid;
> +
> +	return 0;
> +}
> +
> +int q6apm_graph_get_rx_shmem_module_iid(struct q6apm_graph *graph)
> +{
> +	struct audioreach_module *module;
> +
> +	module = q6apm_find_module_by_mid(graph, MODULE_ID_WR_SHARED_MEM_EP);
> +	if (!module)
> +		return -ENODEV;
> +
> +	return module->instance_id;
> +
> +}
> +EXPORT_SYMBOL_GPL(q6apm_graph_get_rx_shmem_module_iid);
> +
> +static int graph_callback(struct gpr_resp_pkt *data, void *priv, int op)
> +{
> +	struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done_v2 *rd_done;
> +	struct data_cmd_rsp_wr_sh_mem_ep_data_buffer_done_v2 *done;
> +	struct apm_cmd_rsp_shared_mem_map_regions *rsp;
> +	struct gpr_ibasic_rsp_result_t *result;
> +	struct q6apm_graph *graph = priv;
> +	struct gpr_hdr *hdr = &data->hdr;
> +	struct device *dev = graph->dev;
> +	uint32_t client_event;
> +	int ret = -EINVAL;
> +	phys_addr_t phys;
> +	int token;
> +
> +	result = data->payload;
> +
> +	switch (hdr->opcode) {
> +	case DATA_CMD_RSP_WR_SH_MEM_EP_DATA_BUFFER_DONE_V2:
> +		client_event = APM_CLIENT_EVENT_DATA_WRITE_DONE;
> +		mutex_lock(&graph->lock);
> +		token = hdr->token & APM_WRITE_TOKEN_MASK;
> +
> +		done = data->payload;
> +		phys = graph->rx_data.buf[token].phys;
> +
> +		if (lower_32_bits(phys) != done->buf_addr_lsw ||
> +		    upper_32_bits(phys) != done->buf_addr_msw) {
> +			dev_err(dev, "WR BUFF Unexpected addr %08x-%08x\n",
> +				done->buf_addr_lsw, done->buf_addr_msw);
> +			ret = -EINVAL;
> +		} else {
> +			ret = 0;
> +			graph->result.opcode = hdr->opcode;
> +			graph->result.status = done->status;
> +		}
> +		mutex_unlock(&graph->lock);
> +		if (graph->cb)
> +			graph->cb(client_event, hdr->token, data->payload,
> +				  graph->priv);
> +
> +		break;
> +	case APM_CMD_RSP_SHARED_MEM_MAP_REGIONS:
> +		graph->result.opcode = hdr->opcode;
> +		graph->result.status = 0;
> +		rsp = data->payload;
> +
> +		if (hdr->token == SNDRV_PCM_STREAM_PLAYBACK)
> +			graph->rx_data.mem_map_handle = rsp->mem_map_handle;
> +		else
> +			graph->tx_data.mem_map_handle = rsp->mem_map_handle;
> +
> +		wake_up(&graph->cmd_wait);
> +		ret = 0;
> +		break;
> +	case DATA_CMD_RSP_RD_SH_MEM_EP_DATA_BUFFER_V2:
> +		client_event = APM_CLIENT_EVENT_DATA_READ_DONE;
> +		mutex_lock(&graph->lock);
> +		rd_done = data->payload;
> +		phys = graph->tx_data.buf[hdr->token].phys;
> +		if (upper_32_bits(phys) != rd_done->buf_addr_msw ||
> +		    lower_32_bits(phys) != rd_done->buf_addr_lsw) {
> +			dev_err(dev, "RD BUFF Unexpected addr %08x-%08x\n",
> +				rd_done->buf_addr_lsw, rd_done->buf_addr_msw);
> +			ret = -EINVAL;
> +		} else {
> +			ret = 0;
> +		}
> +		mutex_unlock(&graph->lock);
> +		wake_up(&graph->cmd_wait);
> +
> +		if (graph->cb)
> +			graph->cb(client_event, hdr->token, data->payload,
> +				  graph->priv);
> +		break;
> +	case DATA_CMD_WR_SH_MEM_EP_EOS_RENDERED:
> +		break;
> +	case GPR_BASIC_RSP_RESULT:
> +		switch (result->opcode) {
> +		case APM_CMD_SHARED_MEM_UNMAP_REGIONS:
> +			graph->result.opcode = result->opcode;
> +			graph->result.status = 0;
> +			if (hdr->token == SNDRV_PCM_STREAM_PLAYBACK)
> +				graph->rx_data.mem_map_handle = 0;
> +			else
> +				graph->tx_data.mem_map_handle = 0;
> +
> +			wake_up(&graph->cmd_wait);
> +			ret = 0;
> +			break;
> +		case APM_CMD_SHARED_MEM_MAP_REGIONS:
> +		case DATA_CMD_WR_SH_MEM_EP_MEDIA_FORMAT:
> +		case APM_CMD_SET_CFG:
> +			graph->result.opcode = result->opcode;
> +			graph->result.status = result->status;
> +			if (result->status) {
> +				dev_err(dev, "Error (%d) Processing 0x%08x cmd\n",
> +					result->status, result->opcode);
> +				ret = -EINVAL;
> +			} else {
> +				ret = 0;
> +			}
> +			wake_up(&graph->cmd_wait);
> +			break;
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
> +				     void *priv, int graph_id)
> +{
> +	struct q6apm *apm = dev_get_drvdata(dev->parent);
> +	struct audioreach_graph *ar_graph;
> +	struct q6apm_graph *graph;
> +	int ret;
> +
> +	ar_graph = q6apm_get_audioreach_graph(apm, graph_id);
> +	if (IS_ERR(ar_graph)) {
> +		dev_err(dev, "No graph found with id %d\n", graph_id);
> +		return ERR_CAST(ar_graph);
> +	}
> +
> +	graph = kzalloc(sizeof(*graph), GFP_KERNEL);
> +	if (!graph) {
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +
> +	graph->apm = apm;
> +	graph->priv = priv;
> +	graph->cb = cb;
> +	graph->info = ar_graph->info;
> +	graph->ar_graph = ar_graph;
> +	graph->id = ar_graph->id;
> +	graph->dev = dev;
> +
> +	mutex_init(&graph->lock);
> +	init_waitqueue_head(&graph->cmd_wait);
> +
> +	graph->port = gpr_alloc_port(apm->gdev, dev, graph_callback, graph);
> +	if (!graph->port) {
> +		kfree(graph);
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +
> +	return graph;
> +err:
> +	kref_put(&ar_graph->refcount, q6apm_put_audioreach_graph);
> +	return ERR_PTR(ret);
> +}
> +EXPORT_SYMBOL_GPL(q6apm_graph_open);
> +
> +int q6apm_graph_close(struct q6apm_graph *graph)
> +{
> +	struct audioreach_graph *ar_graph = graph->ar_graph;
> +
> +	gpr_free_port(graph->port);
> +	kref_put(&ar_graph->refcount, q6apm_put_audioreach_graph);
> +	kfree(graph);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(q6apm_graph_close);
> +
> +int q6apm_graph_prepare(struct q6apm_graph *graph)
> +{
> +	return audioreach_graph_mgmt_cmd(graph->ar_graph, APM_CMD_GRAPH_PREPARE);
> +}
> +EXPORT_SYMBOL_GPL(q6apm_graph_prepare);
> +
> +int q6apm_graph_start(struct q6apm_graph *graph)
> +{
> +	struct audioreach_graph *ar_graph = graph->ar_graph;
> +	int ret = 0;
> +
> +	if (ar_graph->start_count == 0)
> +		ret = audioreach_graph_mgmt_cmd(ar_graph, APM_CMD_GRAPH_START);
> +
> +	ar_graph->start_count++;
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(q6apm_graph_start);
> +
> +int q6apm_graph_stop(struct q6apm_graph *graph)
> +{
> +	struct audioreach_graph *ar_graph = graph->ar_graph;
> +
> +	if (--ar_graph->start_count > 0)
> +		return 0;
> +
> +	return audioreach_graph_mgmt_cmd(ar_graph, APM_CMD_GRAPH_STOP);
> +}
> +EXPORT_SYMBOL_GPL(q6apm_graph_stop);
> +
> +int q6apm_graph_flush(struct q6apm_graph *graph)
> +{
> +	return audioreach_graph_mgmt_cmd(graph->ar_graph, APM_CMD_GRAPH_FLUSH);
> +}
> +EXPORT_SYMBOL_GPL(q6apm_graph_flush);
> +
> +static int q6apm_audio_probe(struct snd_soc_component *component)
> +{
> +	return audioreach_tplg_init(component);
> +}
> +
> +static void q6apm_audio_remove(struct snd_soc_component *component)
> +{
> +	/* remove topology */
> +	snd_soc_tplg_component_remove(component);
> +}
> +
> +#define APM_AUDIO_DRV_NAME "q6apm-audio"
> +
> +static const struct snd_soc_component_driver q6apm_audio_component = {
> +	.name		= APM_AUDIO_DRV_NAME,
> +	.probe		= q6apm_audio_probe,
> +	.remove		= q6apm_audio_remove,
> +};
> +
> +static int apm_probe(gpr_device_t *gdev)
> +{
> +	struct device *dev = &gdev->dev;
> +	struct q6apm *apm;
> +	int ret;
> +
> +	apm = devm_kzalloc(dev, sizeof(*apm), GFP_KERNEL);
> +	if (!apm)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, apm);
> +
> +	mutex_init(&apm->lock);
> +	apm->dev = dev;
> +	apm->gdev = gdev;
> +	init_waitqueue_head(&apm->wait);
> +
> +	idr_init(&apm->graph_idr);
> +	idr_init(&apm->graph_info_idr);
> +	idr_init(&apm->sub_graphs_idr);
> +	idr_init(&apm->containers_idr);
> +
> +	idr_init(&apm->modules_idr);
> +
> +	q6apm_get_apm_state(apm);
> +
> +	ret = devm_snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to get register q6apm: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return of_platform_populate(dev->of_node, NULL, NULL, dev);
> +}
> +
> +struct audioreach_module *q6apm_find_module_by_mid(struct q6apm_graph *graph, uint32_t mid)
> +{
> +	struct audioreach_graph_info *info = graph->info;
> +	struct q6apm *apm = graph->apm;
> +
> +	return __q6apm_find_module_by_mid(apm, info, mid);
> +
> +}
> +
> +static int apm_callback(struct gpr_resp_pkt *data, void *priv, int op)
> +{
> +	gpr_device_t *gdev = priv;
> +	struct q6apm *apm = dev_get_drvdata(&gdev->dev);
> +	struct device *dev = &gdev->dev;
> +	struct gpr_ibasic_rsp_result_t *result;
> +	struct gpr_hdr *hdr = &data->hdr;
> +	int ret = -EINVAL;
> +
> +	result = data->payload;
> +
> +	switch (hdr->opcode) {
> +	case APM_CMD_RSP_GET_SPF_STATE:
> +		apm->result.opcode = hdr->opcode;
> +		apm->result.status = 0;
> +		/* First word of result it state */
> +		apm->state = result->opcode;
> +		wake_up(&apm->wait);
> +		break;

this would keep ret = -EINVAL and return it, that seems suspicious since
this doesn't look as an error case?

> +	case GPR_BASIC_RSP_RESULT:
> +		switch (result->opcode) {
> +		case APM_CMD_GRAPH_START:
> +		case APM_CMD_GRAPH_OPEN:
> +		case APM_CMD_GRAPH_PREPARE:
> +		case APM_CMD_GRAPH_CLOSE:
> +		case APM_CMD_GRAPH_FLUSH:
> +		case APM_CMD_GRAPH_STOP:
> +		case APM_CMD_SET_CFG:
> +			apm->result.opcode = result->opcode;
> +			apm->result.status = result->status;
> +			if (result->status) {
> +				dev_err(dev, "Error (%d) Processing 0x%08x cmd\n",
> +					result->status, result->opcode);
> +				ret = -EINVAL;
> +			} else {
> +				ret = 0;

That's also weird, maybe initialize to zero and return an error code in
error cases, or fix the case APM_CMD_RSP_GET_SPF_STATE above.

> +			}
> +			wake_up(&apm->wait);
> +			break;
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;

so all the defaults are errors?

> +	}
> +
> +	return ret;
> +}
