Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9CB400391
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 18:40:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BBDC18BD;
	Fri,  3 Sep 2021 18:39:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BBDC18BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630687218;
	bh=/3QRL6Oz0uBvQfu/ctxTRhZkah2b019/7Sf4EgepD1E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GvQ90cLdTOrKqsU7xXZsrSAUNxkrVdOabnoWKgclUVCfW9xWvKbOKIPGMgJm8NzbZ
	 Dd5k5u1hZ4crmxGQjqxlDl3PyeCqZ78cBtviIbLBT9MdU0ftpmveeYMh1Mv7XWb0xC
	 +r0DTBT816FGvJYkdodytSqMNLgyrTmTnxDjrPAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16ABBF804FB;
	Fri,  3 Sep 2021 18:38:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7264FF804F3; Fri,  3 Sep 2021 18:38:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D86C6F804C2
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 18:37:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D86C6F804C2
X-IronPort-AV: E=McAfee;i="6200,9189,10096"; a="206687190"
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="206687190"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 09:37:52 -0700
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="462453469"
Received: from seangorm-mobl.amr.corp.intel.com (HELO [10.251.136.111])
 ([10.251.136.111])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 09:37:47 -0700
Subject: Re: [PATCH v5 16/21] ASoC: qdsp6: audioreach: add module
 configuration command helpers
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
 <20210903112032.25834-17-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5042813e-6182-ff8c-e602-fa16d08ca6da@linux.intel.com>
Date: Fri, 3 Sep 2021 10:13:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903112032.25834-17-srinivas.kandagatla@linaro.org>
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



On 9/3/21 6:20 AM, Srinivas Kandagatla wrote:
> Audioreach module configuration helpers, which will be used by
> the q6apm-dai driver.
> 
> Also add Kconfig and Makefile changes as now all the code for audioreach
> and q6apm are in at this point.

separate patches?


> +int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph,
> +				   struct gpr_pkt *pkt, uint32_t rsp_opcode)
> +{
> +
> +	struct device *dev = graph->dev;
> +	struct gpr_hdr *hdr = &pkt->hdr;
> +	int rc;
> +
> +	mutex_lock(&graph->cmd_lock);
> +	graph->result.opcode = 0;
> +	graph->result.status = 0;
> +
> +	rc = gpr_send_port_pkt(graph->port, pkt);
> +	if (rc < 0)
> +		goto err;
> +
> +	if (rsp_opcode)
> +		rc = wait_event_timeout(graph->cmd_wait,
> +					(graph->result.opcode == hdr->opcode) ||
> +					(graph->result.opcode == rsp_opcode),
> +					5 * HZ);
> +	else
> +		rc = wait_event_timeout(graph->cmd_wait,
> +					(graph->result.opcode == hdr->opcode),
> +					5 * HZ);
> +
> +	if (!rc) {
> +		dev_err(dev, "CMD timeout for [%x] opcode\n", hdr->opcode);
> +		rc = -ETIMEDOUT;
> +	} else if (graph->result.status > 0) {
> +		dev_err(dev, "DSP returned error[%x] %x\n", hdr->opcode,
> +			graph->result.status);
> +		rc = -EINVAL;
> +	} else {
> +		dev_err(dev, "DSP returned [%x]\n", graph->result.status);
> +		rc = 0;
> +	}
> +
> +err:
> +	mutex_unlock(&graph->cmd_lock);
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(audioreach_graph_send_cmd_sync);

I'm pretty sure I've seen this code before...

This looks almost identical to

int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt,
			uint32_t rsp_opcode)

Can this be refactored?

If not, at the very least make sure the errors messages are unique...

> +static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
> +					  struct audioreach_module *module,
> +					  struct audioreach_module_config *cfg)

maybe explain what a 'codec dma' is?

> +{
> +	struct apm_module_param_data *param_data;
> +	struct apm_codec_dma_module_intf_cfg *intf_cfg;
> +	struct apm_module_hw_ep_mf_cfg *hw_cfg;
> +	struct apm_module_frame_size_factor_cfg *fs_cfg;
> +	struct apm_module_hw_ep_power_mode_cfg *pm_cfg;
> +	int ic_sz, ep_sz, fs_sz, pm_sz, dl_sz;
> +	int rc, payload_size;
> +	struct gpr_pkt *pkt;
> +	void *p;
> +
> +	ic_sz = APM_CDMA_INTF_CFG_PSIZE;
> +	ep_sz = APM_HW_EP_CFG_PSIZE;
> +	fs_sz = APM_FS_CFG_PSIZE;
> +	pm_sz = APM_HW_EP_PMODE_CFG_PSIZE;
> +	dl_sz = 0;
> +
> +	payload_size = ic_sz + ep_sz + fs_sz + pm_sz + dl_sz;
> +
> +	p = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
> +	if (IS_ERR(p))
> +		return -ENOMEM;
> +
> +	pkt = p;
> +	p = p + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
> +
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
> +	p += ep_sz;
> +
> +	fs_cfg = p;
> +	param_data = &fs_cfg->param_data;
> +	param_data->module_instance_id = module->instance_id;
> +	param_data->error_code = 0;
> +	param_data->param_id = PARAM_ID_HW_EP_FRAME_SIZE_FACTOR;
> +	param_data->param_size = fs_sz - APM_MODULE_PARAM_DATA_SIZE;
> +	fs_cfg->frame_size_factor = 1;
> +	p += fs_sz;
> +
> +	intf_cfg = p;
> +	param_data = &intf_cfg->param_data;
> +	param_data->module_instance_id = module->instance_id;
> +	param_data->error_code = 0;
> +	param_data->param_id = PARAM_ID_CODEC_DMA_INTF_CFG;
> +	param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
> +
> +	intf_cfg->cfg.lpaif_type = module->hw_interface_type;
> +	intf_cfg->cfg.intf_index = module->hw_interface_idx;
> +	intf_cfg->cfg.active_channels_mask = (1 << cfg->num_channels) - 1;
> +	p += ic_sz;
> +
> +	pm_cfg = p;
> +	param_data = &pm_cfg->param_data;
> +	param_data->module_instance_id = module->instance_id;
> +	param_data->error_code = 0;
> +	param_data->param_id = PARAM_ID_HW_EP_POWER_MODE_CFG;
> +	param_data->param_size = pm_sz - APM_MODULE_PARAM_DATA_SIZE;
> +	pm_cfg->power_mode.power_mode = 0;
> +
> +	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
> +
> +	kfree(pkt);
> +
> +	return rc;
> +}
> +
> +static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
> +				    struct audioreach_module *module,
> +				    struct audioreach_module_config *cfg)
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
> +	p = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
> +	if (IS_ERR(p))
> +		return -ENOMEM;
> +
> +	pkt = p;
> +	p = p + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
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
> +	case SND_SOC_DAIFMT_CBS_CFS:

CBC_CFC

> +		intf_cfg->cfg.ws_src = CONFIG_I2S_WS_SRC_INTERNAL;
> +		break;
> +	case SND_SOC_DAIFMT_CBM_CFM:

CBP_CFP

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
> +
> +static int audioreach_logging_set_media_format(struct q6apm_graph *graph,
> +					 struct audioreach_module *module)
> +{
> +	struct apm_module_param_data *param_data;
> +	struct data_logging_config *cfg;
> +	int rc, payload_size;
> +	struct gpr_pkt *pkt;
> +	void *p;
> +
> +	payload_size = sizeof(*cfg) + APM_MODULE_PARAM_DATA_SIZE;
> +	p = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
> +	if (IS_ERR(p))
> +		return -ENOMEM;
> +
> +	pkt = p;
> +	p = p + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
> +
> +	param_data = p;
> +	param_data->module_instance_id = module->instance_id;
> +	param_data->error_code = 0;
> +	param_data->param_id = PARAM_ID_DATA_LOGGING_CONFIG;
> +	param_data->param_size = payload_size - APM_MODULE_PARAM_DATA_SIZE;
> +
> +	p = p + APM_MODULE_PARAM_DATA_SIZE;
> +	cfg = p;
> +	cfg->log_code = module->log_code;
> +	cfg->log_tap_point_id = module->log_tap_point_id;
> +	cfg->mode = module->mode;
> +
> +	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
> +
> +	kfree(pkt);

it would be simpler and easier on the reviewer if you allocated and
freed the same variable.

pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
p = (void*)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
...
kfree(pkt);

same comment for the rest of the code in this patch.

> +
> +	return rc;
> +}
> +


> +int q6apm_map_memory_regions(struct q6apm_graph *graph,
> +			     unsigned int dir, phys_addr_t phys,
> +			     size_t period_sz, unsigned int periods)
> +{
> +	struct audioreach_graph_data *data;
> +	struct audio_buffer *buf;
> +	unsigned long flags;
> +	int cnt;
> +	int rc;
> +
> +	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
> +		data = &graph->rx_data;
> +	else
> +		data = &graph->tx_data;
> +
> +	spin_lock_irqsave(&graph->lock, flags);
> +
> +	if (data->buf) {
> +		dev_err(graph->dev, "Buffer already allocated\n");
> +		spin_unlock_irqrestore(&graph->lock, flags);
> +		return 0;
> +	}
> +
> +	buf = kzalloc(((sizeof(struct audio_buffer)) * periods), GFP_ATOMIC);

Why GFP_ATOMIC?

> +	if (!buf) {
> +		spin_unlock_irqrestore(&graph->lock, flags);
> +		return -ENOMEM;
> +	}
> +
> +	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
> +		data = &graph->rx_data;
> +	else
> +		data = &graph->tx_data;
> +
> +	data->buf = buf;
> +
> +	buf[0].phys = phys;
> +	buf[0].size = period_sz;
> +
> +	for (cnt = 1; cnt < periods; cnt++) {
> +		if (period_sz > 0) {
> +			buf[cnt].phys = buf[0].phys + (cnt * period_sz);
> +			buf[cnt].size = period_sz;
> +		}
> +	}
> +	data->num_periods = periods;
> +
> +	spin_unlock_irqrestore(&graph->lock, flags);
> +
> +	rc = audioreach_map_memory_regions(graph, dir, period_sz,
> +					      periods, 1);
> +	if (rc < 0) {
> +		dev_err(graph->dev, "Memory_map_regions failed\n");
> +		audioreach_graph_free_buf(graph);
> +	}
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(q6apm_map_memory_regions);

> +int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
> +		      uint32_t lsw_ts, uint32_t wflags)
> +{
> +	struct gpr_pkt *pkt;
> +	void *p;
> +	int rc, payload_size, iid;
> +	struct apm_data_cmd_wr_sh_mem_ep_data_buffer_v2 *write;
> +	struct audio_buffer *ab;
> +	unsigned long flags;
> +
> +	payload_size = sizeof(*write);
> +
> +	iid = q6apm_graph_get_rx_shmem_module_iid(graph);
> +	p = audioreach_alloc_pkt(payload_size,
> +				      DATA_CMD_WR_SH_MEM_EP_DATA_BUFFER_V2,
> +				      graph->rx_data.dsp_buf | (len << APM_WRITE_TOKEN_LEN_SHIFT),
> +				      graph->port->id, iid);
> +	if (IS_ERR(p))
> +		return -ENOMEM;
> +
> +	pkt = p;
> +	p = p + GPR_HDR_SIZE;
> +	write = p;
> +
> +	spin_lock_irqsave(&graph->lock, flags);
> +	ab = &graph->rx_data.buf[graph->rx_data.dsp_buf];
> +
> +	write->buf_addr_lsw = lower_32_bits(ab->phys);
> +	write->buf_addr_msw = upper_32_bits(ab->phys);
> +	write->buf_size = len;
> +	write->timestamp_lsw = lsw_ts;
> +	write->timestamp_msw = msw_ts;
> +	write->mem_map_handle = graph->rx_data.mem_map_handle;
> +
> +	if (wflags == NO_TIMESTAMP)
> +		write->flags = 0;
> +	else
> +		write->flags = 0x80000000;

BIT(31) ?

it's also odd to define NO_TIMESTAMP, it's usually when you want a
timestamp that you ask for it...

> +
> +	graph->rx_data.dsp_buf++;
> +
> +	if (graph->rx_data.dsp_buf >= graph->rx_data.num_periods)
> +		graph->rx_data.dsp_buf = 0;
> +
> +	spin_unlock_irqrestore(&graph->lock, flags);
> +
> +	rc = gpr_send_port_pkt(graph->port, pkt);
> +
> +	kfree(pkt);
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(q6apm_write_async);

