Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABB532666F
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 18:47:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4BEF1688;
	Fri, 26 Feb 2021 18:46:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4BEF1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614361655;
	bh=nlrAupLDNJXQ3FoUaIuZqIrf8ZETfgqtyzI4536bqVY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b4V0xOL+Fv4Y6EuNkIAN1KW8/NlGkU9iwvb004qGVH3GHUQIZjx1qASelkNUv74yb
	 lG5SF3MB7zSQQAuwVruxtpgQBZyiI58JtppJDHBz7srJny1hh1Z3vsJ1AVVL9sMaH2
	 BhjMBbpJvnbTFLMOZJnsMD6Dl8VaySpx2xBJ+npY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECF79F8022B;
	Fri, 26 Feb 2021 18:46:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D961F8022B; Fri, 26 Feb 2021 18:46:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E681F8012C
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 18:45:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E681F8012C
IronPort-SDR: 2To+Fg7X2qTECCc0VryhNjnZwWh9l1GDI8j5fUHi8K3kWIt36oca/lA+gvcSn1kVAmpzMHgJIq
 iFCGj998P+Mw==
X-IronPort-AV: E=McAfee;i="6000,8403,9907"; a="185262044"
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; d="scan'208";a="185262044"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2021 09:45:37 -0800
IronPort-SDR: euc8B0W1H4NFKQOSN7g5l2A4ovhz1sX9su9tk7znskuX1brkoXRu6dcT6iMPX8ATrqEuvThh7b
 QUd9MlpVjAGg==
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; d="scan'208";a="432857273"
Received: from esnyder-desk.amr.corp.intel.com (HELO [10.255.230.205])
 ([10.255.230.205])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2021 09:45:35 -0800
Subject: Re: [PATCH 3/3] soundwire: qcom: add clock stop via runtime pm support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20210226170250.9067-1-srinivas.kandagatla@linaro.org>
 <20210226170250.9067-4-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2899ca9e-2938-4d8d-5e56-49eba8cdb920@linux.intel.com>
Date: Fri, 26 Feb 2021 11:41:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210226170250.9067-4-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: sanyog.r.kale@intel.com, alsa-devel@alsa-project.org,
 yung-chuan.liao@linux.intel.com, linux-kernel@vger.kernel.org
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


> +	pm_runtime_get_sync(ctrl->dev);

if this fails you've got to do a put_noidle().

we use this for Intel:

	ret = pm_runtime_get_sync(cdns->dev);
	if (ret < 0 && ret != -EACCES) {
		dev_err_ratelimited(cdns->dev,
				    "pm_runtime_get_sync failed in %s, ret %d\n",
				    __func__, ret);
		pm_runtime_put_noidle(cdns->dev);
		return ret;
	}


> +	pm_runtime_mark_last_busy(ctrl->dev);
> +	pm_runtime_put_autosuspend(ctrl->dev);
>   
>   	complete(&ctrl->enumeration);
>   	return 0;
> @@ -421,6 +427,7 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>   	u8 devnum = 0;
>   	int ret = IRQ_HANDLED;
>   
> +	clk_prepare_enable(swrm->hclk);
>   	swrm->reg_read(swrm, SWRM_INTERRUPT_STATUS, &intr_sts);
>   	intr_sts_masked = intr_sts & swrm->intr_mask;
>   
> @@ -529,6 +536,7 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>   		intr_sts_masked = intr_sts & swrm->intr_mask;
>   	} while (intr_sts_masked);
>   
> +	clk_disable_unprepare(swrm->hclk);
>   	return ret;
>   }
>   
> @@ -587,6 +595,8 @@ static enum sdw_command_response qcom_swrm_xfer_msg(struct sdw_bus *bus,
>   	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
>   	int ret, i, len;
>   
> +	pm_runtime_get_sync(ctrl->dev);
> +
>   	if (msg->flags == SDW_MSG_FLAG_READ) {
>   		for (i = 0; i < msg->len;) {
>   			if ((msg->len - i) < QCOM_SWRM_MAX_RD_LEN)
> @@ -598,7 +608,7 @@ static enum sdw_command_response qcom_swrm_xfer_msg(struct sdw_bus *bus,
>   							msg->addr + i, len,
>   						       &msg->buf[i]);
>   			if (ret)
> -				return ret;
> +				goto done;
>   
>   			i = i + len;
>   		}
> @@ -607,12 +617,20 @@ static enum sdw_command_response qcom_swrm_xfer_msg(struct sdw_bus *bus,
>   			ret = qcom_swrm_cmd_fifo_wr_cmd(ctrl, msg->buf[i],
>   							msg->dev_num,
>   						       msg->addr + i);
> -			if (ret)
> -				return SDW_CMD_IGNORED;
> +			if (ret) {
> +				ret = SDW_CMD_IGNORED;
> +				goto done;
> +			}
>   		}
>   	}
>   
> +	pm_runtime_put_autosuspend(ctrl->dev);
> +	pm_runtime_mark_last_busy(ctrl->dev);

wrong order, you've got to mark_last_busy before the put().

>   	return SDW_CMD_OK;
> +done:
> +	pm_runtime_mark_last_busy(ctrl->dev);
> +	pm_runtime_put_autosuspend(ctrl->dev);
> +	return ret;

this looks weird. why not reuse the same flow and return ret in all cases?

>   }
>   
>   static int qcom_swrm_pre_bank_switch(struct sdw_bus *bus)
> @@ -620,13 +638,19 @@ static int qcom_swrm_pre_bank_switch(struct sdw_bus *bus)
>   	u32 reg = SWRM_MCP_FRAME_CTRL_BANK_ADDR(bus->params.next_bank);
>   	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
>   	u32 val;
> +	int ret;
>   
> +	pm_runtime_get_sync(ctrl->dev);
>   	ctrl->reg_read(ctrl, reg, &val);
>   
>   	u32p_replace_bits(&val, ctrl->cols_index, SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK);
>   	u32p_replace_bits(&val, ctrl->rows_index, SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK);
>   
> -	return ctrl->reg_write(ctrl, reg, val);
> +	ret = ctrl->reg_write(ctrl, reg, val);
> +	pm_runtime_mark_last_busy(ctrl->dev);
> +	pm_runtime_put_autosuspend(ctrl->dev);
> +
> +	return ret;
>   }
>   
>   static int qcom_swrm_port_params(struct sdw_bus *bus,
> @@ -634,13 +658,18 @@ static int qcom_swrm_port_params(struct sdw_bus *bus,
>   				 unsigned int bank)
>   {
>   	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
> +	int ret = 0;
> +	pm_runtime_get_sync(ctrl->dev);
>   
>   	if (p_params->bps != SWR_INVALID_PARAM)
> -		return ctrl->reg_write(ctrl,
> +		ret = ctrl->reg_write(ctrl,
>   				       SWRM_DP_BLOCK_CTRL_1(p_params->num),
>   				       p_params->bps - 1);
> +	pm_runtime_mark_last_busy(ctrl->dev);
> +	pm_runtime_put_autosuspend(ctrl->dev);

it feels like all you pm_runtime_get/put() should be moved to your 
register read/write operations?

>   
> -	return 0;
> +
> +	return ret;
>   }
>   
>   static int qcom_swrm_transport_params(struct sdw_bus *bus,
> @@ -651,6 +680,7 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
>   	u32 value;
>   	int reg = SWRM_DP_PORT_CTRL_BANK((params->port_num), bank);
>   	int ret;
> +	pm_runtime_get_sync(ctrl->dev);
>   
>   	value = params->offset1 << SWRM_DP_PORT_CTRL_OFFSET1_SHFT;
>   	value |= params->offset2 << SWRM_DP_PORT_CTRL_OFFSET2_SHFT;
> @@ -685,6 +715,9 @@ static int qcom_swrm_transport_params(struct sdw_bus *bus,
>   		reg = SWRM_DP_BLOCK_CTRL3_BANK(params->port_num, bank);
>   		ret = ctrl->reg_write(ctrl, reg, params->blk_pkg_mode);
>   	}
> +	pm_runtime_mark_last_busy(ctrl->dev);
> +	pm_runtime_put_autosuspend(ctrl->dev);
> +
>   
>   	return ret;
>   }
> @@ -696,6 +729,9 @@ static int qcom_swrm_port_enable(struct sdw_bus *bus,
>   	u32 reg = SWRM_DP_PORT_CTRL_BANK(enable_ch->port_num, bank);
>   	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
>   	u32 val;
> +	int ret;
> +
> +	pm_runtime_get_sync(ctrl->dev);
>   
>   	ctrl->reg_read(ctrl, reg, &val);
>   
> @@ -704,7 +740,11 @@ static int qcom_swrm_port_enable(struct sdw_bus *bus,
>   	else
>   		val &= ~(0xff << SWRM_DP_PORT_CTRL_EN_CHAN_SHFT);
>   
> -	return ctrl->reg_write(ctrl, reg, val);
> +	ret  = ctrl->reg_write(ctrl, reg, val);
> +	pm_runtime_mark_last_busy(ctrl->dev);
> +	pm_runtime_put_autosuspend(ctrl->dev);
> +
> +	return ret;
>   }
>   
>   static const struct sdw_master_port_ops qcom_swrm_port_ops = {
> @@ -1194,6 +1234,13 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   		 (ctrl->version >> 24) & 0xff, (ctrl->version >> 16) & 0xff,
>   		 ctrl->version & 0xffff);
>   
> +	pm_runtime_set_autosuspend_delay(dev, 30000);

30s? that sounds very very long for an audio device.

> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_mark_last_busy(dev);
> +
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
>   	return 0;
>   
>   err_master_add:
> @@ -1214,6 +1261,47 @@ static int qcom_swrm_remove(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static int swrm_runtime_resume(struct device *dev)
> +{
> +	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
> +
> +	reinit_completion(&ctrl->enumeration);
> +	clk_prepare_enable(ctrl->hclk);
> +	ctrl->reg_write(ctrl, SWRM_COMP_SW_RESET, 0x01);
> +	qcom_swrm_get_device_status(ctrl);
> +	sdw_handle_slave_status(&ctrl->bus, ctrl->status);
> +	qcom_swrm_init(ctrl);
> +	wait_for_completion_timeout(&ctrl->enumeration,
> +					msecs_to_jiffies(TIMEOUT_MS));
> +	usleep_range(100, 105);
> +
> +	pm_runtime_mark_last_busy(dev);

Humm, what 'clock stop' are we talking about here?

In SoundWire 1.x devices, you can stop the BUS clock and not have to 
redo any enumeration on resume, devices are required to save their 
context.  You have to also follow the pattern of preparing and 
broadcasting the CLOCK STOP NOW message.

It looks like you are stopping something else, and completely resetting 
the hardware. It's fine, it's just a reset but not clock stop support as 
defined in the SoundWire spec.

> +
> +	return 0;
> +}
> +
> +static int __maybe_unused swrm_runtime_suspend(struct device *dev)
> +{
> +	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
> +
> +	/* Mask bus clash interrupt */
> +	ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
> +	ctrl->reg_write(ctrl, SWRM_INTERRUPT_MASK_ADDR, ctrl->intr_mask);
> +	ctrl->reg_write(ctrl, SWRM_INTERRUPT_CPU_EN, ctrl->intr_mask);
> +	/* clock stop sequence */
> +	qcom_swrm_cmd_fifo_wr_cmd(ctrl, 0x2, 0xF, SDW_SCP_CTRL);

Humm, this looks like writing in SCP_CTRL::ClockStopNow, so why is 
enumeration required on restart?

If you take down the bus and reset everything, you don't need to do this 
sequence. a hardware reset will do...

> +
> +	clk_disable_unprepare(ctrl->hclk);
> +
> +	usleep_range(100, 105);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops swrm_dev_pm_ops = {
> +	SET_RUNTIME_PM_OPS(swrm_runtime_suspend, swrm_runtime_resume, NULL)
> +};
> +
>   static const struct of_device_id qcom_swrm_of_match[] = {
>   	{ .compatible = "qcom,soundwire-v1.3.0", .data = &swrm_v1_3_data },
>   	{ .compatible = "qcom,soundwire-v1.5.1", .data = &swrm_v1_5_data },
> @@ -1228,6 +1316,7 @@ static struct platform_driver qcom_swrm_driver = {
>   	.driver = {
>   		.name	= "qcom-soundwire",
>   		.of_match_table = qcom_swrm_of_match,
> +		.pm = &swrm_dev_pm_ops,
>   	}
>   };
>   module_platform_driver(qcom_swrm_driver);
> 
