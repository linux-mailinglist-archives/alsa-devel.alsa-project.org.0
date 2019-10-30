Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE808EA1E1
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 17:38:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B58E233B;
	Wed, 30 Oct 2019 17:37:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B58E233B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572453485;
	bh=popwnrOI97AisE1X7+0dcw77q2dNIlp8NueKdXRiP7M=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EBE/2kmy0+J/UujJeYAeZMJ2WzhwkqRxviA4VJFxO1JzeqtPVlheJBx36s7BfuCeU
	 QERBcENckNdkjOMmpo3/TmxlzLyzgp8yjIwW1x6Y42oT1XHOBIL+E+Kd/aJP4OboS2
	 CmdFxWj27NLtTQNDfYIFN6UQkhkQ0lRNVsqtlW3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF679F8015A;
	Wed, 30 Oct 2019 17:36:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2685F8044A; Wed, 30 Oct 2019 17:33:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 TIME_LIMIT_EXCEEDED autolearn=unavailable version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25FE2F802A1
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 17:28:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25FE2F802A1
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Oct 2019 09:28:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,248,1569308400"; d="scan'208";a="374938440"
Received: from kmbarley-mobl.amr.corp.intel.com (HELO [10.252.135.193])
 ([10.252.135.193])
 by orsmga005.jf.intel.com with ESMTP; 30 Oct 2019 09:28:15 -0700
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, robh@kernel.org,
 vkoul@kernel.org
References: <20191030153150.18303-1-srinivas.kandagatla@linaro.org>
 <20191030153150.18303-3-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <af29ec6e-d89e-7fa4-a8cd-29ab944ecd5c@linux.intel.com>
Date: Wed, 30 Oct 2019 11:28:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191030153150.18303-3-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v4 2/2] soundwire: qcom: add support for
 SoundWire controller
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 10/30/19 10:31 AM, Srinivas Kandagatla wrote:
> Qualcomm SoundWire Master controller is present in most Qualcomm SoCs
> either integrated as part of WCD audio codecs via slimbus or
> as part of SOC I/O.
> 
> This patchset adds support to a very basic controller which has been
> tested with WCD934x SoundWire controller connected to WSA881x smart
> speaker amplifiers.

Sorry for the delay in reviewing this patch.

I have a set of comments mostly on error handling and mapping between 
ASoC callbacks and stream states (which took a lot of work on our side 
and required an updated state machine in the patches shared last week).

[snip]

> +static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, u8 cmd_data,
> +				     u8 dev_addr, u16 reg_addr)
> +{
> +	DECLARE_COMPLETION_ONSTACK(comp);
> +	unsigned long flags;
> +	u32 val;
> +	int ret;
> +
> +	spin_lock_irqsave(&ctrl->comp_lock, flags);
> +	ctrl->comp = &comp;
> +	spin_unlock_irqrestore(&ctrl->comp_lock, flags);
> +	val = SWRM_REG_VAL_PACK(cmd_data, dev_addr,
> +				SWRM_SPECIAL_CMD_ID, reg_addr);
> +	ret = ctrl->reg_write(ctrl, SWRM_CMD_FIFO_WR_CMD, val);
> +	if (ret)
> +		goto err;
> +
> +	ret = wait_for_completion_timeout(ctrl->comp,
> +					  msecs_to_jiffies(TIMEOUT_MS));
> +
> +	if (!ret)
> +		ret = SDW_CMD_IGNORED;
> +	else
> +		ret = SDW_CMD_OK;
> +err:
> +	spin_lock_irqsave(&ctrl->comp_lock, flags);
> +	ctrl->comp = NULL;
> +	spin_unlock_irqrestore(&ctrl->comp_lock, flags);
> +
> +	return ret;
> +}
> +
> +static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *ctrl,
> +				     u8 dev_addr, u16 reg_addr,
> +				     u32 len, u8 *rval)
> +{
> +	int i, ret;
> +	u32 val;
> +	DECLARE_COMPLETION_ONSTACK(comp);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ctrl->comp_lock, flags);
> +	ctrl->comp = &comp;
> +	spin_unlock_irqrestore(&ctrl->comp_lock, flags);
> +
> +	val = SWRM_REG_VAL_PACK(len, dev_addr, SWRM_SPECIAL_CMD_ID, reg_addr);
> +	ret = ctrl->reg_write(ctrl, SWRM_CMD_FIFO_RD_CMD, val);
> +	if (ret)
> +		goto err;
> +
> +	ret = wait_for_completion_timeout(ctrl->comp,
> +					  msecs_to_jiffies(TIMEOUT_MS));
> +
> +	if (!ret) {
> +		ret = SDW_CMD_IGNORED;
> +		goto err;
> +	} else {
> +		ret = SDW_CMD_OK;
> +	}
> +
> +	for (i = 0; i < len; i++) {
> +		ret = ctrl->reg_read(ctrl, SWRM_CMD_FIFO_RD_FIFO_ADDR, &val);
> +		if (ret)
> +			return ret;
> +
> +		rval[i] = val & 0xFF;
> +	}
> +
> +err:
> +	spin_lock_irqsave(&ctrl->comp_lock, flags);
> +	ctrl->comp = NULL;
> +	spin_unlock_irqrestore(&ctrl->comp_lock, flags);
> +
> +	return ret;
> +}
> +
> +static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
> +{
> +	u32 val;
> +	int i;
> +
> +	ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);

Sometimes you test the return value of reg_read(), and sometimes you 
don't? same for read_write()?

For the Intel stuff, we typically don't check the read/writes to 
controller registers, but anything that goes out on the bus is checked.

> +
> +	for (i = 0; i < SDW_MAX_DEVICES; i++) {
> +		u32 s;
> +
> +		s = (val >> (i * 2));
> +		s &= SWRM_MCP_SLV_STATUS_MASK;
> +		ctrl->status[i] = s;
> +	}
> +}
> +
> +static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
> +{
> +	struct qcom_swrm_ctrl *ctrl = dev_id;
> +	u32 sts, value;
> +	unsigned long flags;
> +
> +	ctrl->reg_read(ctrl, SWRM_INTERRUPT_STATUS, &sts);
> +
> +	if (sts & SWRM_INTERRUPT_STATUS_CMD_ERROR) {
> +		ctrl->reg_read(ctrl, SWRM_CMD_FIFO_STATUS, &value);
> +		dev_err_ratelimited(ctrl->dev,
> +				    "CMD error, fifo status 0x%x\n",
> +				     value);
> +		ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CMD, 0x1);
> +	}
> +
> +	if ((sts & SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED) ||
> +	    sts & SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS)
> +		schedule_work(&ctrl->slave_work);
> +
> +	ctrl->reg_write(ctrl, SWRM_INTERRUPT_CLEAR, sts);
> +
> +	if (sts & SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED) {
> +		spin_lock_irqsave(&ctrl->comp_lock, flags);
> +		if (ctrl->comp)
> +			complete(ctrl->comp);
> +		spin_unlock_irqrestore(&ctrl->comp_lock, flags);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
> +{
> +	u32 val;
> +
> +	/* Clear Rows and Cols */
> +	val = (SWRM_MAX_ROW_VAL << SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT |
> +	       SWRM_MIN_COL_VAL << SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT);
> +
> +	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
> +
> +	/* Disable Auto enumeration */
> +	ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 0);
> +
> +	/* Mask soundwire interrupts */
> +	ctrl->reg_write(ctrl, SWRM_INTERRUPT_MASK_ADDR,
> +			SWRM_INTERRUPT_STATUS_RMSK);
> +
> +	/* Configure No pings */
> +	ctrl->reg_read(ctrl, SWRM_MCP_CFG_ADDR, &val);
> +	val &= ~SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK;
> +	val |= (SWRM_DEF_CMD_NO_PINGS <<
> +		SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_SHFT);
> +	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
> +
> +	/* Configure number of retries of a read/write cmd */
> +	ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CFG_ADDR, SWRM_RD_WR_CMD_RETRIES);
> +
> +	/* Set IRQ to PULSE */
> +	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
> +			SWRM_COMP_CFG_IRQ_LEVEL_OR_PULSE_MSK |
> +			SWRM_COMP_CFG_ENABLE_MSK);
> +	return 0;
> +}
> +
> +static enum sdw_command_response qcom_swrm_xfer_msg(struct sdw_bus *bus,
> +						    struct sdw_msg *msg)
> +{
> +	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
> +	int ret, i, len;
> +
> +	if (msg->flags == SDW_MSG_FLAG_READ) {
> +		for (i = 0; i < msg->len;) {
> +			if ((msg->len - i) < QCOM_SWRM_MAX_RD_LEN)
> +				len = msg->len - i;
> +			else
> +				len = QCOM_SWRM_MAX_RD_LEN;
> +
> +			ret = qcom_swrm_cmd_fifo_rd_cmd(ctrl, msg->dev_num,
> +							msg->addr + i, len,
> +						       &msg->buf[i]);
> +			if (ret)
> +				return ret;

fifo_rd_cmd and fifo_wr_cmd return the same values, but the code is 
different between the two cases, e.g....
> +
> +			i = i + len;
> +		}
> +	} else if (msg->flags == SDW_MSG_FLAG_WRITE) {
> +		for (i = 0; i < msg->len; i++) {
> +			ret = qcom_swrm_cmd_fifo_wr_cmd(ctrl, msg->buf[i],
> +							msg->dev_num,
> +						       msg->addr + i);
> +			if (ret)
> +				return SDW_CMD_IGNORED;

... should it be return(ret) here for symmetry?

> +		}
> +	}
> +
> +	return SDW_CMD_OK;
> +}
> +
> +static int qcom_swrm_pre_bank_switch(struct sdw_bus *bus)
> +{
> +	u32 reg = SWRM_MCP_FRAME_CTRL_BANK_ADDR(bus->params.next_bank);
> +	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
> +	u32 val;
> +	int ret;
> +
> +	ret = ctrl->reg_read(ctrl, reg, &val);
> +	if (ret)
> +		return ret;
> +
> +	val &= ~SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK;
> +	val &= ~SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK;
> +
> +	val |= (SWRM_MAX_ROW_VAL << SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT |
> +		SWRM_MAX_COL_VAL << SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT);
> +
> +	return ctrl->reg_write(ctrl, reg, val);
> +}
> +
> +static int qcom_swrm_port_params(struct sdw_bus *bus,
> +				 struct sdw_port_params *p_params,
> +				 unsigned int bank)
> +{
> +	/* TBD */
> +	return 0;
> +}
> +
> +static int qcom_swrm_transport_params(struct sdw_bus *bus,
> +				      struct sdw_transport_params *params,
> +				      enum sdw_reg_bank bank)
> +{
> +	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
> +	u32 value;
> +
> +	value = params->offset1 << SWRM_DP_PORT_CTRL_OFFSET1_SHFT;
> +	value |= params->offset2 << SWRM_DP_PORT_CTRL_OFFSET2_SHFT;
> +	value |= params->sample_interval - 1;
> +
> +	return ctrl->reg_write(ctrl,
> +			       SWRM_DP_PORT_CTRL_BANK((params->port_num), bank),
> +			       value);
> +}
> +
> +static int qcom_swrm_port_enable(struct sdw_bus *bus,
> +				 struct sdw_enable_ch *enable_ch,
> +				 unsigned int bank)
> +{
> +	u32 reg = SWRM_DP_PORT_CTRL_BANK(enable_ch->port_num, bank);
> +	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
> +	u32 val;
> +	int ret;
> +
> +	ret = ctrl->reg_read(ctrl, reg, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (enable_ch->enable)
> +		val |= (enable_ch->ch_mask << SWRM_DP_PORT_CTRL_EN_CHAN_SHFT);
> +	else
> +		val &= ~(enable_ch->ch_mask << SWRM_DP_PORT_CTRL_EN_CHAN_SHFT);
> +
> +	return ctrl->reg_write(ctrl, reg, val);
> +}
> +
> +static struct sdw_master_port_ops qcom_swrm_port_ops = {
> +	.dpn_set_port_params = qcom_swrm_port_params,
> +	.dpn_set_port_transport_params = qcom_swrm_transport_params,
> +	.dpn_port_enable_ch = qcom_swrm_port_enable,
> +};
> +
> +static struct sdw_master_ops qcom_swrm_ops = {
> +	.xfer_msg = qcom_swrm_xfer_msg,
> +	.pre_bank_switch = qcom_swrm_pre_bank_switch,
> +};
> +
> +static int qcom_swrm_compute_params(struct sdw_bus *bus)
> +{
> +	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
> +	struct sdw_master_runtime *m_rt;
> +	struct sdw_slave_runtime *s_rt;
> +	struct sdw_port_runtime *p_rt;
> +	struct qcom_swrm_port_config *pcfg;
> +	int i = 0;
> +
> +	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
> +		list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
> +			pcfg = &ctrl->pconfig[p_rt->num - 1];
> +			p_rt->transport_params.port_num = p_rt->num;
> +			p_rt->transport_params.sample_interval = pcfg->si + 1;
> +			p_rt->transport_params.offset1 = pcfg->off1;
> +			p_rt->transport_params.offset2 = pcfg->off2;
> +		}
> +
> +		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
> +			list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
> +				pcfg = &ctrl->pconfig[i];
> +				p_rt->transport_params.port_num = p_rt->num;
> +				p_rt->transport_params.sample_interval =
> +					pcfg->si + 1;
> +				p_rt->transport_params.offset1 = pcfg->off1;
> +				p_rt->transport_params.offset2 = pcfg->off2;
> +				i++;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static u32 qcom_swrm_freq_tbl[MAX_FREQ_NUM] = {
> +	DEFAULT_CLK_FREQ,
> +};
> +
> +static void qcom_swrm_slave_wq(struct work_struct *work)
> +{
> +	struct qcom_swrm_ctrl *ctrl =
> +			container_of(work, struct qcom_swrm_ctrl, slave_work);
> +
> +	qcom_swrm_get_device_status(ctrl);
> +	sdw_handle_slave_status(&ctrl->bus, ctrl->status);
> +}
> +
> +static int qcom_swrm_prepare(struct snd_pcm_substream *substream,
> +			     struct snd_soc_dai *dai)
> +{
> +	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
> +
> +	if (!ctrl->sruntime[dai->id])
> +		return -EINVAL;
> +
> +	return sdw_enable_stream(ctrl->sruntime[dai->id]);

So in hw_params you call sdw_prepare_stream() and in _prepare you call 
sdw_enable_stream()?

Shouldn't this be handled in a .trigger operation as per the 
documentation "From ASoC DPCM framework, this stream state is linked to
.trigger() start operation."

It's also my understanding that .prepare will be called multiples times, 
including for underflows and resume if you don't support INFO_RESUME.

the sdw_disable_stream() is in .hw_free, which is not necessarily called 
by the core, so you may have a risk of not being able to recover?

> +}
> +
> +static void qcom_swrm_stream_free_ports(struct qcom_swrm_ctrl *ctrl,
> +					struct sdw_stream_runtime *stream)
> +{
> +	struct sdw_master_runtime *m_rt;
> +	struct sdw_port_runtime *p_rt;
> +	unsigned long *port_mask;
> +
> +	mutex_lock(&ctrl->port_lock);
> +
> +	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
> +		if (m_rt->direction == SDW_DATA_DIR_RX)
> +			port_mask = &ctrl->dout_port_mask;
> +		else
> +			port_mask = &ctrl->din_port_mask;
> +
> +		list_for_each_entry(p_rt, &m_rt->port_list, port_node)
> +			clear_bit(p_rt->num - 1, port_mask);
> +	}
> +
> +	mutex_unlock(&ctrl->port_lock);
> +}
> +
> +static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
> +					struct sdw_stream_runtime *stream,
> +				       struct snd_pcm_hw_params *params,
> +				       int direction)
> +{
> +	struct sdw_port_config pconfig[QCOM_SDW_MAX_PORTS];
> +	struct sdw_stream_config sconfig;
> +	struct sdw_master_runtime *m_rt;
> +	struct sdw_slave_runtime *s_rt;
> +	struct sdw_port_runtime *p_rt;
> +	unsigned long *port_mask;
> +	int i, maxport, pn, nports = 0, ret = 0;
> +
> +	mutex_lock(&ctrl->port_lock);
> +	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
> +		if (m_rt->direction == SDW_DATA_DIR_RX) {
> +			maxport = ctrl->num_dout_ports;
> +			port_mask = &ctrl->dout_port_mask;
> +		} else {
> +			maxport = ctrl->num_din_ports;
> +			port_mask = &ctrl->din_port_mask;
> +		}
> +
> +		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
> +			list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
> +				/* Port numbers start from 1 - 14*/
> +				pn = find_first_zero_bit(port_mask, maxport);
> +				if (pn > (maxport - 1)) {
> +					dev_err(ctrl->dev, "All ports busy\n");
> +					ret = -EBUSY;
> +					goto err;
> +				}
> +				set_bit(pn, port_mask);
> +				pconfig[nports].num = pn + 1;
> +				pconfig[nports].ch_mask = p_rt->ch_mask;
> +				nports++;
> +			}
> +		}
> +	}
> +
> +	if (direction == SNDRV_PCM_STREAM_CAPTURE)
> +		sconfig.direction = SDW_DATA_DIR_TX;
> +	else
> +		sconfig.direction = SDW_DATA_DIR_RX;
> +
> +	/* hw parameters wil be ignored as we only support PDM */
> +	sconfig.ch_count = 1;
> +	sconfig.frame_rate = params_rate(params);
> +	sconfig.type = stream->type;
> +	sconfig.bps = 1;
> +	sdw_stream_add_master(&ctrl->bus, &sconfig, pconfig,
> +			      nports, stream);
> +err:
> +	if (ret) {
> +		for (i = 0; i < nports; i++)
> +			clear_bit(pconfig[i].num - 1, port_mask);
> +	}
> +
> +	mutex_unlock(&ctrl->port_lock);
> +
> +	return ret;
> +}
> +
> +static int qcom_swrm_hw_params(struct snd_pcm_substream *substream,
> +			       struct snd_pcm_hw_params *params,
> +			      struct snd_soc_dai *dai)
> +{
> +	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
> +	struct sdw_stream_runtime *sruntime = ctrl->sruntime[dai->id];
> +	int ret;
> +
> +	ret = qcom_swrm_stream_alloc_ports(ctrl, sruntime, params,
> +					   substream->stream);
> +	if (ret)
> +		return ret;
> +
> +	ret = sdw_prepare_stream(sruntime);
> +	if (ret)
> +		qcom_swrm_stream_free_ports(ctrl, sruntime);
> +
> +	return ret;
> +}
> +
> +static int qcom_swrm_hw_free(struct snd_pcm_substream *substream,
> +			     struct snd_soc_dai *dai)
> +{
> +	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
> +	struct sdw_stream_runtime *sruntime = ctrl->sruntime[dai->id];
> +
> +	qcom_swrm_stream_free_ports(ctrl, sruntime);
> +	sdw_stream_remove_master(&ctrl->bus, sruntime);
> +	sdw_disable_stream(sruntime);
> +	sdw_deprepare_stream(sruntime);

is the order correct here?

On the Intel side we do

trigger_stop:
sdw_disable_stream(sruntime);

hw_free
sdw_deprepare_stream(sruntime);
sdw_stream_remove_master(&ctrl->bus, sruntime);
sdw_release_stream(dma->stream);

> +
> +	return 0;
> +}
> +
> +static int qcom_swrm_set_sdw_stream(struct snd_soc_dai *dai,
> +				    void *stream, int direction)
> +{
> +	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
> +
> +	ctrl->sruntime[dai->id] = stream;
> +
> +	return 0;
> +}
> +
> +static int qcom_swrm_startup(struct snd_pcm_substream *substream,
> +			     struct snd_soc_dai *dai)
> +{
> +	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct sdw_stream_runtime *sruntime;
> +	int ret, i;

if you supported pm_runtime, that's where you'd want to take a reference?

> +	sruntime = sdw_alloc_stream(dai->name);
> +	if (!sruntime)
> +		return -ENOMEM;
> +
> +	ctrl->sruntime[dai->id] = sruntime;
> +
> +	for (i = 0; i < rtd->num_codecs; i++) {
> +		ret = snd_soc_dai_set_sdw_stream(rtd->codec_dais[i], sruntime,
> +						 substream->stream);
> +		if (ret < 0 && ret != -ENOTSUPP) {
> +			dev_err(dai->dev, "Failed to set sdw stream on %s",
> +				rtd->codec_dais[i]->name);
> +			sdw_release_stream(sruntime);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void qcom_swrm_shutdown(struct snd_pcm_substream *substream,
> +			       struct snd_soc_dai *dai)
> +{
> +	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);

and that's where you'd want to  call pm_runtime_put()

> +	sdw_release_stream(ctrl->sruntime[dai->id]);
> +	ctrl->sruntime[dai->id] = NULL;
> +}
> +
> +static const struct snd_soc_dai_ops qcom_swrm_pdm_dai_ops = {
> +	.hw_params = qcom_swrm_hw_params,
> +	.prepare = qcom_swrm_prepare,
> +	.hw_free = qcom_swrm_hw_free,
> +	.startup = qcom_swrm_startup,
> +	.shutdown = qcom_swrm_shutdown,
> +	.set_sdw_stream = qcom_swrm_set_sdw_stream,

no .trigger?

> +};
> +
> +static const struct snd_soc_component_driver qcom_swrm_dai_component = {
> +	.name = "soundwire",
> +};
> +
> +static int qcom_swrm_register_dais(struct qcom_swrm_ctrl *ctrl)
> +{
> +	int num_dais = ctrl->num_dout_ports + ctrl->num_din_ports;
> +	struct snd_soc_dai_driver *dais;
> +	struct snd_soc_pcm_stream *stream;
> +	struct device *dev = ctrl->dev;
> +	int i;
> +
> +	/* PDM dais are only tested for now */
> +	dais = devm_kcalloc(dev, num_dais, sizeof(*dais), GFP_KERNEL);
> +	if (!dais)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < num_dais; i++) {
> +		dais[i].name = devm_kasprintf(dev, GFP_KERNEL, "SDW Pin%d", i);
> +		if (!dais[i].name)
> +			return -ENOMEM;

I think I mentioned we don't do this in the Intel stuff since it 
conflicts with topology? is this required on the QCOM side?

> +
> +		if (i < ctrl->num_dout_ports)
> +			stream = &dais[i].playback;
> +		else
> +			stream = &dais[i].capture;
> +
> +		stream->channels_min = 1;
> +		stream->channels_max = 1;
> +		stream->rates = SNDRV_PCM_RATE_48000;
> +		stream->formats = SNDRV_PCM_FMTBIT_S16_LE;
> +
> +		dais[i].ops = &qcom_swrm_pdm_dai_ops;
> +		dais[i].id = i;
> +	}
> +
> +	return devm_snd_soc_register_component(ctrl->dev,
> +						&qcom_swrm_dai_component,
> +						dais, num_dais);
> +}
> +
> +static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
> +{
> +	struct device_node *np = ctrl->dev->of_node;
> +	u8 off1[QCOM_SDW_MAX_PORTS];
> +	u8 off2[QCOM_SDW_MAX_PORTS];
> +	u8 si[QCOM_SDW_MAX_PORTS];
> +	int i, ret, nports, val;
> +
> +	ret = ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
> +	if (ret)
> +		return ret;
> +
> +	ctrl->num_dout_ports = val & SWRM_COMP_PARAMS_DOUT_PORTS_MASK;
> +	ctrl->num_din_ports = (val & SWRM_COMP_PARAMS_DIN_PORTS_MASK) >> 5;
> +
> +	ret = of_property_read_u32(np, "qcom,din-ports", &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val > ctrl->num_din_ports)
> +		return -EINVAL;
> +
> +	ctrl->num_din_ports = val;
> +
> +	ret = of_property_read_u32(np, "qcom,dout-ports", &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val > ctrl->num_dout_ports)
> +		return -EINVAL;
> +
> +	ctrl->num_dout_ports = val;
> +
> +	nports = ctrl->num_dout_ports + ctrl->num_din_ports;
> +
> +	ret = of_property_read_u8_array(np, "qcom,ports-offset1",
> +					off1, nports);
> +	if (ret)
> +		return ret;
> +
> +	ret = of_property_read_u8_array(np, "qcom,ports-offset2",
> +					off2, nports);
> +	if (ret)
> +		return ret;
> +
> +	ret = of_property_read_u8_array(np, "qcom,ports-sinterval-low",
> +					si, nports);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < nports; i++) {
> +		ctrl->pconfig[i].si = si[i];
> +		ctrl->pconfig[i].off1 = off1[i];
> +		ctrl->pconfig[i].off2 = off2[i];
> +	}
> +
> +	return 0;
> +}
> +
> +static int qcom_swrm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct sdw_master_prop *prop;
> +	struct sdw_bus_params *params;
> +	struct qcom_swrm_ctrl *ctrl;
> +	int ret;
> +	u32 val;
> +
> +	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
> +	if (!ctrl)
> +		return -ENOMEM;
> +
> +	if (dev->parent->bus == &slimbus_bus) {
> +		ctrl->reg_read = qcom_swrm_abh_reg_read;
> +		ctrl->reg_write = qcom_swrm_ahb_reg_write;
> +		ctrl->regmap = dev_get_regmap(dev->parent, NULL);
> +		if (!ctrl->regmap)
> +			return -EINVAL;
> +	} else {
> +		/* Only WCD based SoundWire controller is supported */
> +		return -ENOTSUPP;
> +	}
> +
> +	ctrl->irq = of_irq_get(dev->of_node, 0);
> +	if (ctrl->irq < 0)
> +		return ctrl->irq;
> +
> +	ctrl->hclk = devm_clk_get(dev, "iface");
> +	if (IS_ERR(ctrl->hclk))
> +		return PTR_ERR(ctrl->hclk);
> +
> +	clk_prepare_enable(ctrl->hclk);
> +
> +	ctrl->dev = dev;
> +	dev_set_drvdata(&pdev->dev, ctrl);
> +	spin_lock_init(&ctrl->comp_lock);
> +	mutex_init(&ctrl->port_lock);
> +	INIT_WORK(&ctrl->slave_work, qcom_swrm_slave_wq);
> +
> +	ctrl->bus.dev = dev;
> +	ctrl->bus.ops = &qcom_swrm_ops;
> +	ctrl->bus.port_ops = &qcom_swrm_port_ops;
> +	ctrl->bus.compute_params = &qcom_swrm_compute_params;
> +
> +	ret = qcom_swrm_get_port_config(ctrl);
> +	if (ret)
> +		return ret;
> +
> +	params = &ctrl->bus.params;
> +	params->max_dr_freq = DEFAULT_CLK_FREQ;
> +	params->curr_dr_freq = DEFAULT_CLK_FREQ;
> +	params->col = SWRM_DEFAULT_COL;
> +	params->row = SWRM_DEFAULT_ROWS;
> +	ctrl->reg_read(ctrl, SWRM_MCP_STATUS, &val);
> +	params->curr_bank = val & SWRM_MCP_STATUS_BANK_NUM_MASK;
> +	params->next_bank = !params->curr_bank;
> +
> +	prop = &ctrl->bus.prop;
> +	prop->max_clk_freq = DEFAULT_CLK_FREQ;
> +	prop->num_clk_gears = 0;
> +	prop->num_clk_freq = MAX_FREQ_NUM;
> +	prop->clk_freq = &qcom_swrm_freq_tbl[0];
> +	prop->default_col = SWRM_DEFAULT_COL;
> +	prop->default_row = SWRM_DEFAULT_ROWS;
> +
> +	ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION, &ctrl->version);
> +
> +	ret = devm_request_threaded_irq(dev, ctrl->irq, NULL,
> +					qcom_swrm_irq_handler,
> +					IRQF_TRIGGER_RISING,
> +					"soundwire", ctrl);
> +	if (ret) {
> +		dev_err(dev, "Failed to request soundwire irq\n");
> +		goto err;
> +	}
> +
> +	ret = sdw_add_bus_master(&ctrl->bus);
> +	if (ret) {
> +		dev_err(dev, "Failed to register Soundwire controller (%d)\n",
> +			ret);
> +		goto err;
> +	}
> +
> +	qcom_swrm_init(ctrl);
> +	ret = qcom_swrm_register_dais(ctrl);
> +	if (ret)
> +		goto err;
> +
> +	dev_info(dev, "Qualcomm Soundwire controller v%x.%x.%x Registered\n",
> +		 (ctrl->version >> 24) & 0xff, (ctrl->version >> 16) & 0xff,
> +		 ctrl->version & 0xffff);
> +
> +	return 0;
> +err:
> +	clk_disable_unprepare(ctrl->hclk);
> +	return ret;
> +}
> +
> +static int qcom_swrm_remove(struct platform_device *pdev)
> +{
> +	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(&pdev->dev);


for the Intel stuff we added a pm_runtime_disable() here to prevent 
races between remove and resume.

> +	sdw_delete_bus_master(&ctrl->bus);
> +	clk_disable_unprepare(ctrl->hclk);
> +
> +	return 0;
> +}
> +
> +static int qcom_swrm_runtime_suspend(struct device *device)
> +{
> +	/* TBD */
> +	return 0;
> +}
> +
> +static int qcom_swrm_runtime_resume(struct device *device)
> +{
> +	/* TBD */
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops qcom_swrm_dev_pm_ops = {
> +	SET_RUNTIME_PM_OPS(qcom_swrm_runtime_suspend,
> +			   qcom_swrm_runtime_resume,
> +			   NULL
> +	)
> +};

Maybe define pm_runtime at a later time then? We've had a lot of race 
conditions to deal with, and it's odd that you don't support plain 
vanilla suspend first?

> +static const struct of_device_id qcom_swrm_of_match[] = {
> +	{ .compatible = "qcom,soundwire-v1.3.0", },
> +	{/* sentinel */},
> +};
> +
> +MODULE_DEVICE_TABLE(of, qcom_swrm_of_match);
> +
> +static struct platform_driver qcom_swrm_driver = {
> +	.probe	= &qcom_swrm_probe,
> +	.remove = &qcom_swrm_remove,
> +	.driver = {
> +		.name	= "qcom-soundwire",
> +		.of_match_table = qcom_swrm_of_match,
> +		.pm = &qcom_swrm_dev_pm_ops,
> +	}
> +};
> +module_platform_driver(qcom_swrm_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm soundwire driver");
> +MODULE_LICENSE("GPL v2");
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
