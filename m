Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BBB3B0BA
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2019 10:29:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C2B016C7;
	Mon, 10 Jun 2019 10:28:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C2B016C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560155370;
	bh=WL9wxL66lcs0ln3idhCFkYenWTiLgeZTQ9CxOK/2BUI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dR64yBhm8oRRJfF4Pv06GzhfvnP1Z72eKiC5S/cm7sCRPEVczpgm4jOP+2I0awqgz
	 WoDBq9e6ZzhOkf6OpZhSUBvO27q0ZvuTropW878fprgGOYkr3/JuyhZ6oy6POlYN89
	 qIDJL4zWJbwEaM0OULKTngHhW9I2EDvLtOncAyZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF9B8F896E0;
	Mon, 10 Jun 2019 10:27:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C09CCF896E0; Mon, 10 Jun 2019 10:27:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1880EF8070E
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 10:27:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1880EF8070E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="GfwAcreq"
Received: by mail-wr1-x441.google.com with SMTP id b17so8190491wrq.11
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 01:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=A37KVk/TxifJsVNalXVoRHH861G3sRXMWjHmk2uFY2M=;
 b=GfwAcreqPVer5VZpTnACEitJnXlm0m+ZJTICWWGT8anLZ0XG5b2OYbIHY7/wfXcNWv
 lmzjOOm23dCDWC1KALbuTOzbWGCBrbBP66+ldH0WNYApE3GXys1W5oPwYpfMlwKXfcz6
 ucxS2IGC0hGnZyaEGkviU2eyJGicMkqr4JRnMf068/JTszGTaDJjowjC4tEKgEoDaVMr
 3QEALegKlofNNsRgt8NTGeetL6unawnjTvQf6hGUiMfHFvEH4u49OUMSo/MDSdGdbIqe
 Bgua22q3EUnAmEBskpe8GLbq2fAdmn8lVxG9JCmWcHMfiJB6KX/jfyXTSQohi2bXHl2W
 WfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A37KVk/TxifJsVNalXVoRHH861G3sRXMWjHmk2uFY2M=;
 b=ns3oVGEMzHvhj6wK8cKwvYx7/kpDCicBIAqBd+nVcuoqg6dnPMq4mhKLriz+wR44vH
 4zLHqWLm25MLqrNC1a0biTmS3rH9bXYhznlayCvvlYiVHrgA/goyo4wc3y4VCCq7APxl
 eHLF5eGq0aHmz2yVXrm5zCcLRsKhQleUIRCuFmpgZzXDDHBlokmMVeXLj7RokX/7Pk5N
 oEPcMOJgnY0kjLo75FaeoDC1yH8fPxre/2BwLYcSbvC2ZRx/74CvlSdaujOnIxBHl1Cl
 kXBi78sxqk4Zd0T5FZnt+QyXVG9/ymw160vFmAOQShQuuStpryryjDbkyprS7YsHuJ2i
 GG0Q==
X-Gm-Message-State: APjAAAVCk7qbVo2mdqu/9GFpmbHC14JsR46VQxTCugZaIkn9t+L85ujs
 frxcCQXxsQSeD+D+jy4+nboCkQ==
X-Google-Smtp-Source: APXvYqyU0P1s2pRG5AtbsgnoLVeAozBW9+nm5u6a2qJdGzEp/UYtuWum3mqTg5H52gD7qEe/59GjRA==
X-Received: by 2002:a5d:4992:: with SMTP id r18mr29891457wrq.107.1560155259056; 
 Mon, 10 Jun 2019 01:27:39 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id
 f204sm12730331wme.18.2019.06.10.01.27.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 01:27:38 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>
References: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
 <20190607085643.932-7-srinivas.kandagatla@linaro.org>
 <20190610064025.GK9160@vkoul-mobl.Dlink>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <2938660d-81e1-d6b2-4179-9f32c6ca1644@linaro.org>
Date: Mon, 10 Jun 2019 09:27:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190610064025.GK9160@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org
Subject: Re: [alsa-devel] [RFC PATCH 6/6] soundwire: qcom: add support for
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

Thanks for taking time to review!


On 10/06/2019 07:40, Vinod Koul wrote:
> On 07-06-19, 09:56, Srinivas Kandagatla wrote:
>> Qualcomm SoundWire Master controller is present in most Qualcomm SoCs
>> either integrated as part of WCD audio codecs via slimbus or
>> as part of SOC I/O.
>>
>> This patchset adds support to a very basic controller which has been
>> tested with WCD934x SoundWire controller connected to WSA881x smart
>> speaker amplifiers.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/soundwire/Kconfig  |   9 +
>>   drivers/soundwire/Makefile |   4 +
>>   drivers/soundwire/qcom.c   | 983 +++++++++++++++++++++++++++++++++++++
> 
> Can you split this to two patches (at least), master driver followed by
> DAI driver

Sure.

> 
>> +
>> +#define SWRM_COMP_HW_VERSION					0x00
> 
> What does COMP stand for?

Controller splits registers into "Component(core configuration 
registers)", "Interrupt" "Command Fifo" and so on...

> 
>> +#define SWRM_COMP_CFG_ADDR					0x04
>> +#define SWRM_COMP_CFG_IRQ_LEVEL_OR_PULSE_MSK			BIT(1)
>> +#define SWRM_COMP_CFG_ENABLE_MSK				BIT(0)
>> +#define SWRM_COMP_PARAMS					0x100
>> +#define SWRM_COMP_PARAMS_DOUT_PORTS_MASK			GENMASK(4, 0)
>> +#define SWRM_COMP_PARAMS_DIN_PORTS_MASK				GENMASK(9, 5)
>> +#define SWRM_COMP_PARAMS_WR_FIFO_DEPTH				GENMASK(14, 10)
>> +#define SWRM_COMP_PARAMS_RD_FIFO_DEPTH				GENMASK(19, 15)
>> +#define SWRM_COMP_PARAMS_AUTO_ENUM_SLAVES			GENMASK(32. 20)
> 
> Thats a lot of text, So as others have said we need to rethink the
> naming conventions, perhaps QC_SDW_PARAM_AUTO_ENUM (feel free to drop
> SDW as well from here as it QC specific!
> 
> Also move common ones to core..
> 
>> +#define SWRM_INTERRUPT_STATUS					0x200
>> +#define SWRM_INTERRUPT_STATUS_RMSK				GENMASK(16, 0)
>> +#define SWRM_INTERRUPT_STATUS_SLAVE_PEND_IRQ			BIT(0)
>> +#define SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED		BIT(1)
>> +#define SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS		BIT(2)
>> +#define SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET			BIT(3)
>> +#define SWRM_INTERRUPT_STATUS_RD_FIFO_OVERFLOW			BIT(4)
>> +#define SWRM_INTERRUPT_STATUS_RD_FIFO_UNDERFLOW			BIT(5)
>> +#define SWRM_INTERRUPT_STATUS_WR_CMD_FIFO_OVERFLOW		BIT(6)
>> +#define SWRM_INTERRUPT_STATUS_CMD_ERROR				BIT(7)
>> +#define SWRM_INTERRUPT_STATUS_DOUT_PORT_COLLISION		BIT(8)
>> +#define SWRM_INTERRUPT_STATUS_READ_EN_RD_VALID_MISMATCH		BIT(9)
>> +#define SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED		BIT(10)
>> +#define SWRM_INTERRUPT_STATUS_NEW_SLAVE_AUTO_ENUM_FINISHED	BIT(11)
>> +#define SWRM_INTERRUPT_STATUS_AUTO_ENUM_FAILED			BIT(12)
>> +#define SWRM_INTERRUPT_STATUS_AUTO_ENUM_TABLE_IS_FULL		BIT(13)
>> +#define SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED		BIT(14)
>> +#define SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED			BIT(15)
>> +#define SWRM_INTERRUPT_STATUS_ERROR_PORT_TEST			BIT(16)
>> +#define SWRM_INTERRUPT_MASK_ADDR				0x204
>> +#define SWRM_INTERRUPT_CLEAR					0x208
>> +#define SWRM_CMD_FIFO_WR_CMD					0x300
>> +#define SWRM_CMD_FIFO_RD_CMD					0x304
>> +#define SWRM_CMD_FIFO_CMD					0x308
>> +#define SWRM_CMD_FIFO_STATUS					0x30C
>> +#define SWRM_CMD_FIFO_CFG_ADDR					0x314
>> +#define SWRM_CMD_FIFO_CFG_NUM_OF_CMD_RETRY_SHFT			0x0
>> +#define SWRM_CMD_FIFO_RD_FIFO_ADDR				0x318
>> +#define SWRM_ENUMERATOR_CFG_ADDR				0x500
>> +#define SWRM_MCP_FRAME_CTRL_BANK_ADDR(m)		(0x101C + 0x40 * (m))
>> +#define SWRM_MCP_FRAME_CTRL_BANK_SSP_PERIOD_SHFT		16
>> +#define SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT			3
>> +#define SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK			GENMASK(2, 0)
>> +#define SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT			0
>> +#define SWRM_MCP_CFG_ADDR					0x1048
>> +#define SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK		GENMASK(21, 17)
>> +#define SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_SHFT		0x11
>> +#define SWRM_MCP_STATUS						0x104C
>> +#define SWRM_MCP_STATUS_BANK_NUM_MASK				BIT(0)
>> +#define SWRM_MCP_SLV_STATUS					0x1090
>> +#define SWRM_MCP_SLV_STATUS_MASK				GENMASK(1, 0)
>> +#define SWRM_DP_PORT_CTRL_BANK(n, m)	(0x1124 + 0x100 * (n - 1) + 0x40 * m)
>> +#define SWRM_DP_PORT_CTRL2_BANK(n, m)	(0x1126 + 0x100 * (n - 1) + 0x40 * m)
>> +#define SWRM_DP_PORT_CTRL_EN_CHAN_SHFT				0x18
>> +#define SWRM_DP_PORT_CTRL_OFFSET2_SHFT				0x10
>> +#define SWRM_DP_PORT_CTRL_OFFSET1_SHFT				0x08
>> +#define SWRM_AHB_BRIDGE_WR_DATA_0				0xc885
>> +#define SWRM_AHB_BRIDGE_WR_ADDR_0				0xc889
>> +#define SWRM_AHB_BRIDGE_RD_ADDR_0				0xc88d
>> +#define SWRM_AHB_BRIDGE_RD_DATA_0				0xc891
>> +
>> +#define SWRM_REG_VAL_PACK(data, dev, id, reg)	\
>> +			((reg) | ((id) << 16) | ((dev) << 20) | ((data) << 24))
>> +
>> +#define SWRM_MAX_ROW_VAL	0 /* Rows = 48 */
>> +#define SWRM_DEFAULT_ROWS	48
>> +#define SWRM_MIN_COL_VAL	0 /* Cols = 2 */
>> +#define SWRM_DEFAULT_COL	16
>> +#define SWRM_SPECIAL_CMD_ID	0xF
>> +#define MAX_FREQ_NUM		1
>> +#define TIMEOUT_MS		1000
>> +#define QCOM_SWRM_MAX_RD_LEN	0xf
>> +#define DEFAULT_CLK_FREQ	9600000
>> +#define SWRM_MAX_DAIS		0xF
> 
> I was thinking it would make sense to move this to DT, DAI is after all
> a hw property!

I will give that a try before sending out next version.
> 
>> +static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, u8 cmd_data,
>> +				     u8 dev_addr, u16 reg_addr)
>> +{
>> +	int ret = 0;
>> +	u8 cmd_id;
>> +	u32 val;
>> +
>> +	mutex_lock(&ctrl->lock);
>> +	if (dev_addr == SDW_BROADCAST_DEV_NUM) {
>> +		cmd_id = SWRM_SPECIAL_CMD_ID;
>> +	} else {
>> +		if (++ctrl->wr_cmd_id == SWRM_SPECIAL_CMD_ID)
>> +			ctrl->wr_cmd_id = 0;
>> +
>> +		cmd_id = ctrl->wr_cmd_id;
>> +	}
>> +
>> +	val = SWRM_REG_VAL_PACK(cmd_data, dev_addr, cmd_id, reg_addr);
>> +	ret = ctrl->reg_write(ctrl, SWRM_CMD_FIFO_WR_CMD, val);
>> +	if (ret < 0) {
>> +		dev_err(ctrl->dev, "%s: reg 0x%x write failed, err:%d\n",
>> +			__func__, val, ret);
>> +		goto err;
>> +	}
>> +
>> +	if (dev_addr == SDW_BROADCAST_DEV_NUM) {
>> +		ctrl->fifo_status = 0;
>> +		ret = wait_for_completion_timeout(&ctrl->sp_cmd_comp,
>> +						  msecs_to_jiffies(TIMEOUT_MS));
> 
> why not wait for completion on non broadcast?
> 

This could lead to dead-lock if we endup reading registers from 
interrupt handler.

>> +static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *ctrl,
>> +				     u8 dev_addr, u16 reg_addr,
>> +				     u32 len, u8 *rval)
>> +{
>> +	int i, ret = 0;
> 
> Superfluous initialization of ret
> 
I agree.
>> +static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>> +{
>> +	struct qcom_swrm_ctrl *ctrl = dev_id;
>> +	u32 sts, value;
>> +
>> +	sts = ctrl->reg_read(ctrl, SWRM_INTERRUPT_STATUS);
>> +
>> +	if (sts & SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED)
>> +		complete(&ctrl->sp_cmd_comp);
>> +
>> +	if (sts & SWRM_INTERRUPT_STATUS_CMD_ERROR) {
>> +		value = ctrl->reg_read(ctrl, SWRM_CMD_FIFO_STATUS);
>> +		dev_err_ratelimited(ctrl->dev,
>> +				    "CMD error, fifo status 0x%x\n",
>> +				     value);
>> +		ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CMD, 0x1);
>> +		if ((value & 0xF) == 0xF) {
>> +			ctrl->fifo_status = -ENODATA;
>> +			complete(&ctrl->sp_cmd_comp);
>> +		}
>> +	}
>> +
>> +	if ((sts & SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED) ||
>> +	    sts & SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS) {
>> +		if (sts & SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED)
>> +			ctrl->status[0] = SDW_SLAVE_ATTACHED;
>> +
>> +		schedule_work(&ctrl->slave_work);
> 
> So why are we scheduling work, you are the thread handler so I think it
> should be okay and better to invoke bus for status update.

I had seen lockup issues as this would trigger broadcast messages which 
would wait on completion interrupt!

> 
>> +	}
>> +
>> +	if (sts & SWRM_INTERRUPT_STATUS_SLAVE_PEND_IRQ)
>> +		dev_dbg(ctrl->dev, "Slave pend irq\n");
>> +
>> +	if (sts & SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED)
>> +		dev_dbg(ctrl->dev, "New slave attached\n");
> 
> No updating bus on the status?
> 
Its done down below this function! These are debug messages only!
looks redundant, will remove it.

>> +static enum sdw_command_response qcom_swrm_xfer_msg(struct sdw_bus *bus,
>> +						    struct sdw_msg *msg)
>> +{
>> +	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
>> +	int ret, i, len;
>> +
>> +	if (msg->flags == SDW_MSG_FLAG_READ) {
>> +		for (i = 0; i < msg->len;) {
>> +			if ((msg->len - i) < QCOM_SWRM_MAX_RD_LEN)
>> +				len = msg->len - i;
>> +			else
>> +				len = QCOM_SWRM_MAX_RD_LEN;
>> +
>> +			ret = qcom_swrm_cmd_fifo_rd_cmd(ctrl, msg->dev_num,
>> +							msg->addr + i, len,
>> +						       &msg->buf[i]);
>> +			if (ret < 0) {
>> +				if (ret == -ENODATA)
>> +					return SDW_CMD_IGNORED;
>> +
>> +				return ret;
>> +			}
>> +
>> +			i = i + len;
>> +		}
>> +	} else if (msg->flags == SDW_MSG_FLAG_WRITE) {
>> +		for (i = 0; i < msg->len; i++) {
>> +			ret = qcom_swrm_cmd_fifo_wr_cmd(ctrl, msg->buf[i],
>> +							msg->dev_num,
>> +						       msg->addr + i);
>> +			if (ret < 0) {
>> +				if (ret == -ENODATA)
>> +					return SDW_CMD_IGNORED;
>> +
>> +				return ret;
> 
> So we need to convert this to sdw_command_response before returning.
> 
Sure!

>> +static int qcom_swrm_prepare(struct snd_pcm_substream *substream,
>> +			     struct snd_soc_dai *dai)
>> +{
>> +	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
>> +
>> +	if (!ctrl->sruntime[dai->id])
>> +		return -EINVAL;
>> +
>> +	return sdw_enable_stream(ctrl->sruntime[dai->id]);
> 
> Hmm you need to handle dai prepare being called for multiple times.
> Thanks for pointing this out, Will fix this.

>> +static int qcom_pdm_set_sdw_stream(struct snd_soc_dai *dai,
>> +				   void *stream, int direction)
>> +{
>> +	return 0;
>> +}
> 
> lets remove if we dont intend to do anything!
> 
Hm, not sure how I missed this one!

>> +static int qcom_swrm_runtime_suspend(struct device *device)
>> +{
>> +	/* TBD */
>> +	return 0;
>> +}
>> +
>> +static int qcom_swrm_runtime_resume(struct device *device)
>> +{
>> +	/* TBD */
>> +	return 0;
>> +}
> 
> Again, lets remove these, add when we have the functionality
We have issues without this, as soundwire bus would return error on 
runtime pm get/set. For RFC, I had to make this dummy, I will be able to 
add and test some code in next 1/2 spins.

Thanks,
srini
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
