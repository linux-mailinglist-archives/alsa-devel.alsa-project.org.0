Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA6F40CA6E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 18:37:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52425182F;
	Wed, 15 Sep 2021 18:36:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52425182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631723846;
	bh=jxiNyEjXza+tzwDi7Q9pVKbVKTbkekVbdKrc2/jjWrw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B8C/lFZOv2lsFkQTg77/k0GO5GEWVQ1K6pKoF+MM9rTWcoj3hcuMrL0QFjBigSnRc
	 kIsMxulhRAZKLd5/mOiSQ28hgT2GJ198I0I5vu6HrvoLrvDPgfu02moLb5sv+IK05A
	 Zv6dB1j2LLg6mWMw5eL1PSjJA19CSeUFtFD4ecDA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD8B6F804FD;
	Wed, 15 Sep 2021 18:34:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A1E5F8049E; Wed, 15 Sep 2021 18:34:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C886BF804BD
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 18:34:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C886BF804BD
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="286060913"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="286060913"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 09:34:39 -0700
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="583352205"
Received: from mvetrive-mobl3.amr.corp.intel.com (HELO [10.212.69.198])
 ([10.212.69.198])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 09:34:38 -0700
Subject: Re: [PATCH v6 16/22] ASoC: qdsp6: audioreach: add module
 configuration command helpers
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210915131333.19047-1-srinivas.kandagatla@linaro.org>
 <20210915131333.19047-17-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4cd0e63f-107b-d10a-11e9-bced83f487a5@linux.intel.com>
Date: Wed, 15 Sep 2021 11:11:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210915131333.19047-17-srinivas.kandagatla@linaro.org>
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


> +int q6apm_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, phys_addr_t phys,
> +			     size_t period_sz, unsigned int periods)
> +{
> +	struct audioreach_graph_data *data;
> +	struct audio_buffer *buf;
> +	int cnt;
> +	int rc;
> +
> +	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
> +		data = &graph->rx_data;
> +	else
> +		data = &graph->tx_data;
> +
> +	mutex_lock(&graph->lock);
> +
> +	if (data->buf) {
> +		dev_err(graph->dev, "Buffer already allocated\n");
> +		mutex_unlock(&graph->lock);
> +		return 0;

is this an error worth of dev_err() if you return 0?

> +	}
> +
> +	buf = kzalloc(((sizeof(struct audio_buffer)) * periods), GFP_KERNEL);
> +	if (!buf) {
> +		mutex_unlock(&graph->lock);
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
> +	mutex_unlock(&graph->lock);
> +
> +	rc = audioreach_map_memory_regions(graph, dir, period_sz, periods, 1);
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
> +	struct apm_data_cmd_wr_sh_mem_ep_data_buffer_v2 *write;
> +	int rc, payload_size, iid;
> +	struct audio_buffer *ab;
> +	struct gpr_pkt *pkt;
> +
> +	payload_size = sizeof(*write);

nit-pick on variable-naming: I get confused between actions and objects.

> +
> +	iid = q6apm_graph_get_rx_shmem_module_iid(graph);
> +	pkt = audioreach_alloc_pkt(payload_size, DATA_CMD_WR_SH_MEM_EP_DATA_BUFFER_V2,
> +				 graph->rx_data.dsp_buf | (len << APM_WRITE_TOKEN_LEN_SHIFT),
> +				 graph->port->id, iid);
> +	if (IS_ERR(pkt))
> +		return -ENOMEM;
> +
> +	write = (void *)pkt + GPR_HDR_SIZE;
> +
> +	mutex_lock(&graph->lock);
> +	ab = &graph->rx_data.buf[graph->rx_data.dsp_buf];
> +
> +	write->buf_addr_lsw = lower_32_bits(ab->phys);
> +	write->buf_addr_msw = upper_32_bits(ab->phys);
> +	write->buf_size = len;
> +	write->timestamp_lsw = lsw_ts;
> +	write->timestamp_msw = msw_ts;
> +	write->mem_map_handle = graph->rx_data.mem_map_handle;
> +	write->flags = wflags;
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
> +	struct data_cmd_rd_sh_mem_ep_data_buffer_v2 *read;
> +	struct audioreach_graph_data *port;
> +	struct audio_buffer *ab;
> +	struct gpr_pkt *pkt;
> +	int rc, iid;
> +
> +	iid = q6apm_graph_get_tx_shmem_module_iid(graph);
> +	pkt = audioreach_alloc_pkt(sizeof(*read), DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER_V2,
> +				 graph->tx_data.dsp_buf, graph->port->id, iid);
> +	if (IS_ERR(pkt))
> +		return -ENOMEM;
> +
> +	read = (void *)pkt + GPR_HDR_SIZE;

same nit-pick on variable naming, with the additional present/past
grammar issue that you don't know if it's a read buffer or a pointer to
data read in the past.

> +
> +	mutex_lock(&graph->lock);
> +	port = &graph->tx_data;
> +	ab = &port->buf[port->dsp_buf];
> +
> +	read->buf_addr_lsw = lower_32_bits(ab->phys);
> +	read->buf_addr_msw = upper_32_bits(ab->phys);
> +	read->mem_map_handle = port->mem_map_handle;
> +	read->buf_size = ab->size;
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
> +EXPORT_SYMBOL_GPL(q6apm_read);
> +
>  static int graph_callback(struct gpr_resp_pkt *data, void *priv, int op)
>  {
>  	struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done_v2 *rd_done;
> 
