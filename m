Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EB6413A5C
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 20:52:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A37B782E;
	Tue, 21 Sep 2021 20:51:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A37B782E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632250336;
	bh=lxISZFCll32YxYkJqaoMSimku3AzuQFluH4e8o4tO1M=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=do8BA5p7oY7KdLb3fkatweoBNdTABEDTiDnLWzi5caPQum77N6Pq7dx3xcezpkBP1
	 bQDzevmI4onsBsnWoL56upd9XQUuMTJwxv5Qgr6c6j8ii3ExJlJmW+D6Zim2JHKpjB
	 01HSw6G3BfCZL/NSJ8EtnZ75JqcNnpaCAMgjpIhc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 971DCF804E7;
	Tue, 21 Sep 2021 20:50:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 403FCF8026A; Tue, 21 Sep 2021 20:50:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FA42F8016E
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 20:50:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FA42F8016E
X-IronPort-AV: E=McAfee;i="6200,9189,10114"; a="210521544"
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="210521544"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 11:50:01 -0700
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="512431690"
Received: from rudymgal-mobl1.amr.corp.intel.com (HELO [10.212.82.111])
 ([10.212.82.111])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2021 11:50:00 -0700
Subject: Re: [PATCH v7 16/22] ASoC: qdsp6: audioreach: add module
 configuration command helpers
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210921133709.4973-1-srinivas.kandagatla@linaro.org>
 <20210921133709.4973-17-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b2d677c6-db3b-1b4b-9121-dabdf56cb137@linux.intel.com>
Date: Tue, 21 Sep 2021 12:09:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921133709.4973-17-srinivas.kandagatla@linaro.org>
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



> +static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
> +					   struct audioreach_module *module,
> +					   struct audioreach_module_config *cfg)
> +{
> +	struct apm_module_frame_size_factor_cfg *fs_cfg;
> +	struct apm_module_param_data *param_data;
> +	struct apm_i2s_module_intf_cfg *intf_cfg;
> +	struct apm_module_hw_ep_mf_cfg *hw_cfg;
> +	int ic_sz, ep_sz, fs_sz;
> +	int rc, payload_size;
> +	struct gpr_pkt *pkt;
> +	void *p;
> +
> +	ic_sz = APM_I2S_INTF_CFG_PSIZE;
> +	ep_sz = APM_HW_EP_CFG_PSIZE;
> +	fs_sz = APM_FS_CFG_PSIZE;
> +
> +	payload_size = ic_sz + ep_sz + fs_sz;
> +
> +	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
> +	if (IS_ERR(pkt))
> +		return -ENOMEM;
> +
> +	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
> +	intf_cfg = p;
> +
> +	param_data = &intf_cfg->param_data;
> +	param_data->module_instance_id = module->instance_id;
> +	param_data->error_code = 0;
> +	param_data->param_id = PARAM_ID_I2S_INTF_CFG;
> +	param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
> +
> +	intf_cfg->cfg.intf_idx = module->hw_interface_idx;
> +	intf_cfg->cfg.sd_line_idx = module->sd_line_idx;
> +
> +	switch (cfg->fmt & SND_SOC_DAIFMT_MASTER_MASK) {

SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK

> +	case SND_SOC_DAIFMT_CBC_CFC:
> +		intf_cfg->cfg.ws_src = CONFIG_I2S_WS_SRC_INTERNAL;
> +		break;
> +	case SND_SOC_DAIFMT_CBP_CFP:
> +		/* CPU is slave */
> +		intf_cfg->cfg.ws_src = CONFIG_I2S_WS_SRC_EXTERNAL;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	p += ic_sz;
> +	hw_cfg = p;
> +	param_data = &hw_cfg->param_data;
> +	param_data->module_instance_id = module->instance_id;
> +	param_data->error_code = 0;
> +	param_data->param_id = PARAM_ID_HW_EP_MF_CFG;
> +	param_data->param_size = ep_sz - APM_MODULE_PARAM_DATA_SIZE;
> +
> +	hw_cfg->mf.sample_rate = cfg->sample_rate;
> +	hw_cfg->mf.bit_width = cfg->bit_width;
> +	hw_cfg->mf.num_channels = cfg->num_channels;
> +	hw_cfg->mf.data_format = module->data_format;
> +
> +	p += ep_sz;
> +	fs_cfg = p;
> +	param_data = &fs_cfg->param_data;
> +	param_data->module_instance_id = module->instance_id;
> +	param_data->error_code = 0;
> +	param_data->param_id = PARAM_ID_HW_EP_FRAME_SIZE_FACTOR;
> +	param_data->param_size = fs_sz - APM_MODULE_PARAM_DATA_SIZE;
> +	fs_cfg->frame_size_factor = 1;
> +
> +	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
> +
> +	kfree(pkt);
> +
> +	return rc;
> +}

> +int audioreach_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, size_t period_sz,
> +				  unsigned int periods, bool is_contiguous)
> +{
> +	struct apm_shared_map_region_payload *mregions;
> +	struct apm_cmd_shared_mem_map_regions *cmd;
> +	uint32_t num_regions, buf_sz, payload_size;
> +	struct audioreach_graph_data *data;
> +	struct gpr_pkt *pkt;
> +	void *p;
> +	int rc, i;
> +
> +	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
> +		data = &graph->rx_data;
> +	else
> +		data = &graph->tx_data;
> +
> +	if (is_contiguous) {
> +		num_regions = 1;
> +		buf_sz = period_sz * periods;
> +	} else {
> +		buf_sz = period_sz;
> +		num_regions = periods;
> +	}
> +
> +	/* DSP expects size should be aligned to 4K */
> +	buf_sz = ALIGN(buf_sz, 4096);
> +
> +	payload_size = sizeof(*cmd) + (sizeof(*mregions) * num_regions);
> +
> +	pkt = audioreach_alloc_apm_pkt(payload_size, APM_CMD_SHARED_MEM_MAP_REGIONS, dir,
> +				     graph->port->id);
> +	if (IS_ERR(pkt))
> +		return -ENOMEM;

return PTR_ERR(pkt) ?


> +int audioreach_shared_memory_send_eos(struct q6apm_graph *graph)
> +{
> +	struct data_cmd_wr_sh_mem_ep_eos *eos;
> +	struct gpr_pkt *pkt;
> +	int rc = 0, iid;
> +
> +	iid = q6apm_graph_get_rx_shmem_module_iid(graph);
> +	pkt = audioreach_alloc_cmd_pkt(sizeof(*eos), DATA_CMD_WR_SH_MEM_EP_EOS, 0,
> +				       graph->port->id, iid);
> +	if (IS_ERR(pkt))
> +		return -ENOMEM;

return PTR_ERR(pkt) ?

> +
> +	eos = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
> +
> +	eos->policy = WR_SH_MEM_EP_EOS_POLICY_LAST;
> +
> +	rc = gpr_send_port_pkt(graph->port, pkt);
> +	kfree(pkt);
> +
> +	return rc;
> +}

> +int q6apm_unmap_memory_regions(struct q6apm_graph *graph, unsigned int dir)
> +{
> +	struct apm_cmd_shared_mem_unmap_regions *cmd;
> +	struct audioreach_graph_data *data;
> +	struct gpr_pkt *pkt;
> +	int rc;
> +
> +	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
> +		data = &graph->rx_data;
> +	else
> +		data = &graph->tx_data;
> +
> +	if (!data->mem_map_handle)
> +		return 0;
> +
> +	pkt = audioreach_alloc_apm_pkt(sizeof(*cmd), APM_CMD_SHARED_MEM_UNMAP_REGIONS, dir,
> +				     graph->port->id);
> +	if (IS_ERR(pkt))
> +		return -ENOMEM;

return PTR_ERR(pkt) ?

> +
> +	cmd = (void *)pkt + GPR_HDR_SIZE;
> +	cmd->mem_map_handle = data->mem_map_handle;
> +
> +	rc = audioreach_graph_send_cmd_sync(graph, pkt, APM_CMD_SHARED_MEM_UNMAP_REGIONS);
> +	kfree(pkt);
> +
> +	audioreach_graph_free_buf(graph);
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(q6apm_unmap_memory_regions);
> +
> +int q6apm_graph_media_format_pcm(struct q6apm_graph *graph, struct audioreach_module_config *cfg)
> +{
> +	struct audioreach_graph_info *info = graph->info;
> +	struct audioreach_sub_graph *sgs;
> +	struct audioreach_container *container;
> +	struct audioreach_module *module;
> +
> +	list_for_each_entry(sgs, &info->sg_list, node) {
> +		list_for_each_entry(container, &sgs->container_list, node) {
> +			list_for_each_entry(module, &container->modules_list, node) {
> +				if ((module->module_id == MODULE_ID_WR_SHARED_MEM_EP) ||
> +					(module->module_id == MODULE_ID_RD_SHARED_MEM_EP))
> +					continue;
> +
> +				audioreach_set_media_format(graph, module, cfg);
> +			}
> +		}
> +	}
> +
> +	return 0;
> +
> +}

> +int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
> +		      uint32_t lsw_ts, uint32_t wflags)
> +{
> +	struct apm_data_cmd_wr_sh_mem_ep_data_buffer_v2 *write_buffer;
> +	struct audio_buffer *ab;
> +	struct gpr_pkt *pkt;
> +	int rc, iid;
> +
> +	iid = q6apm_graph_get_rx_shmem_module_iid(graph);
> +	pkt = audioreach_alloc_pkt(sizeof(*write_buffer), DATA_CMD_WR_SH_MEM_EP_DATA_BUFFER_V2,
> +				   graph->rx_data.dsp_buf | (len << APM_WRITE_TOKEN_LEN_SHIFT),
> +				   graph->port->id, iid);
> +	if (IS_ERR(pkt))
> +		return -ENOMEM;

return PTR_ERR(pkt) ?

> +
> +	write_buffer = (void *)pkt + GPR_HDR_SIZE;
> +
> +	mutex_lock(&graph->lock);
> +	ab = &graph->rx_data.buf[graph->rx_data.dsp_buf];
> +
> +	write_buffer->buf_addr_lsw = lower_32_bits(ab->phys);
> +	write_buffer->buf_addr_msw = upper_32_bits(ab->phys);
> +	write_buffer->buf_size = len;
> +	write_buffer->timestamp_lsw = lsw_ts;
> +	write_buffer->timestamp_msw = msw_ts;
> +	write_buffer->mem_map_handle = graph->rx_data.mem_map_handle;
> +	write_buffer->flags = wflags;
> +
> +	graph->rx_data.dsp_buf++;
> +
> +	if (graph->rx_data.dsp_buf >= graph->rx_data.num_periods)
> +		graph->rx_data.dsp_buf = 0;
> +
> +	mutex_unlock(&graph->lock);
> +
> +	rc = gpr_send_port_pkt(graph->port, pkt);
> +
> +	kfree(pkt);
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(q6apm_write_async);
> +
> +int q6apm_read(struct q6apm_graph *graph)
> +{
> +	struct data_cmd_rd_sh_mem_ep_data_buffer_v2 *read_buffer;
> +	struct audioreach_graph_data *port;
> +	struct audio_buffer *ab;
> +	struct gpr_pkt *pkt;
> +	int rc, iid;
> +
> +	iid = q6apm_graph_get_tx_shmem_module_iid(graph);
> +	pkt = audioreach_alloc_pkt(sizeof(*read_buffer), DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER_V2,
> +				   graph->tx_data.dsp_buf, graph->port->id, iid);
> +	if (IS_ERR(pkt))
> +		return -ENOMEM;

return PTR_ERR(pkt) ?

> +
> +	read_buffer = (void *)pkt + GPR_HDR_SIZE;
> +
> +	mutex_lock(&graph->lock);
> +	port = &graph->tx_data;
> +	ab = &port->buf[port->dsp_buf];
> +
> +	read_buffer->buf_addr_lsw = lower_32_bits(ab->phys);
> +	read_buffer->buf_addr_msw = upper_32_bits(ab->phys);
> +	read_buffer->mem_map_handle = port->mem_map_handle;
> +	read_buffer->buf_size = ab->size;
> +
> +	port->dsp_buf++;
> +
> +	if (port->dsp_buf >= port->num_periods)
> +		port->dsp_buf = 0;
> +
> +	mutex_unlock(&graph->lock);
> +
> +	rc = gpr_send_port_pkt(graph->port, pkt);
> +	kfree(pkt);
> +
> +	return rc;
> +}
