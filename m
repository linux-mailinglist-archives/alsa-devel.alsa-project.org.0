Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC8ED4761
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 20:19:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1036F166C;
	Fri, 11 Oct 2019 20:18:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1036F166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570817965;
	bh=gulsCIA5qLzhy6AJsgRIk9wPWEQTu0OofM2zsowjnrU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S6djo7bbJMs02uF2MgIunL5J1IxZvjulIn9dWZKXMLmHnbmDiT4xAQBHpwifZkwKf
	 xY7LNnpjKSjV0Uid+jzKSiRQ/tL/LBY/+rkFSnOF4sNePUorvAzf2twuhRF9PCFGtL
	 kSEJXDNqKdM/nSjcUWWEcT8lKEF67tVCU632XT60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CB46F802BD;
	Fri, 11 Oct 2019 20:17:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2149F802BD; Fri, 11 Oct 2019 20:17:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43C6FF8026F
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 20:17:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43C6FF8026F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Oct 2019 11:17:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,285,1566889200"; d="scan'208";a="193606520"
Received: from askelkar-mobl.amr.corp.intel.com (HELO [10.254.181.148])
 ([10.254.181.148])
 by fmsmga008.fm.intel.com with ESMTP; 11 Oct 2019 11:17:28 -0700
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, robh@kernel.org,
 vkoul@kernel.org
References: <20191011154423.2506-1-srinivas.kandagatla@linaro.org>
 <20191011154423.2506-3-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9d00c94b-1bce-9fdf-55fe-ee681466a97a@linux.intel.com>
Date: Fri, 11 Oct 2019 12:50:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011154423.2506-3-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH v3 2/2] soundwire: qcom: add support for
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

It's odd to report CMD_IGNORED on a timeout. CMD_IGNORED is a valid 
answer that should be retrieved immediately. You probably need to 
translate the soundwire errors into -ETIMEOUT or something.

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

same comment on reporting SDW_CMD_IGNORED on timeout, this is very odd.

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
> +} > +

[snip]

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


Wouldn't it be simpler if you declared the completion structure as part 
of your controller definitions, as done for the Intel stuff?

[snip]

> +static void qcom_swrm_stream_free_ports(struct qcom_swrm_ctrl *ctrl,
> +					struct sdw_stream_runtime *stream)
> +{
> +	struct sdw_master_runtime *m_rt;
> +	struct sdw_port_runtime *p_rt;
> +	unsigned long *port_mask;
> +
> +	mutex_lock(&ctrl->port_lock);

is this lock to avoid races between alloc/free? if yes maybe document it?

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
> +	sconfig.ch_count = 1;
> +	sconfig.frame_rate = params_rate(params);
> +	sconfig.type = stream->type;
> +	sconfig.bps = 1;

Should probably add a note that hw_params is ignored since it's PDM 
content, so only 1ch 1bit data.

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

[snip]

> +static int qcom_swrm_hw_free(struct snd_pcm_substream *substream,
> +			     struct snd_soc_dai *dai)
> +{
> +	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
> +	struct sdw_stream_runtime *sruntime = ctrl->sruntime[dai->id];
> +
> +	qcom_swrm_stream_free_ports(ctrl, sruntime);
> +	sdw_stream_remove_master(&ctrl->bus, sruntime);
> +	sdw_deprepare_stream(sruntime);
> +	sdw_disable_stream(sruntime);

Should is be the reverse order? Removing ports/master before disabling 
doesn't seem too good.

> +
> +	return 0;
> +}
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
> +
> +		if (i < ctrl->num_dout_ports) {
> +			stream = &dais[i].playback;
> +			stream->stream_name = devm_kasprintf(dev, GFP_KERNEL,
> +							     "SDW Tx%d", i);
> +		} else {
> +			stream = &dais[i].capture;
> +			stream->stream_name = devm_kasprintf(dev, GFP_KERNEL,
> +							     "SDW Rx%d", i);
> +		}

For the Intel stuff, we removed the stream_name assignment since it 
conflicted with the DAI widgets added by the topology. Since the code 
looks inspired by the Intel DAI handling, you should look into this.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
