Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 715CF38BC6
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 15:38:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E01AA950;
	Fri,  7 Jun 2019 15:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E01AA950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559914689;
	bh=16ttf0aOyToaKEhUW75naKRpjEaUJPNCshNqIaNmgHA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZOpY+3QgoVolyZ9DUfwjhOirwmn0d1+GjPg3ZLIDCAmA8St0M6esRniJIJzGDj32J
	 ihLDHTNpYXSP3XXiL8LHJpurX6dSWILnSFI8+4r1KoI6MKI9ON7m92yC7xEDRejmeL
	 hp8Oev5IYbOKQ96mrS4FEUIeZzoxlJ4gc23Hs1aI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 233BDF896DD;
	Fri,  7 Jun 2019 15:36:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEC63F896DD; Fri,  7 Jun 2019 15:36:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF9C7F896CE
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 15:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF9C7F896CE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jun 2019 06:36:15 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 07 Jun 2019 06:36:15 -0700
Received: from kwong4-mobl.amr.corp.intel.com (unknown [10.252.203.122])
 by linux.intel.com (Postfix) with ESMTP id 4F7F558044F;
 Fri,  7 Jun 2019 06:36:14 -0700 (PDT)
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org, 
 vkoul@kernel.org
References: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
 <20190607085643.932-7-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <249f9647-94d0-41d7-3b95-64c36d90f8e8@linux.intel.com>
Date: Fri, 7 Jun 2019 08:36:02 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607085643.932-7-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org
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


> +config SOUNDWIRE_QCOM
> +	tristate "Qualcomm SoundWire Master driver"
> +	select SOUNDWIRE_BUS
> +	depends on SND_SOC

depends on SLIMBUS if you need the SlimBus link to talk to your 
SoundWire Master?

Also depends on device tree since you use of_ functions?

> +#define SWRM_COMP_HW_VERSION					0x00

Can we please use SDW_ or QCOM_SDW_ as prefix?

> +#define SWRM_INTERRUPT_STATUS_NEW_SLAVE_AUTO_ENUM_FINISHED	BIT(11)
> +#define SWRM_INTERRUPT_STATUS_AUTO_ENUM_FAILED			BIT(12)
> +#define SWRM_INTERRUPT_STATUS_AUTO_ENUM_TABLE_IS_FULL		BIT(13)

This hints at hardware support to assign Device Numbers automagically so 
will likely have impacts on the bus driver code, no?


> +#define SWRM_MAX_ROW_VAL	0 /* Rows = 48 */
> +#define SWRM_DEFAULT_ROWS	48
> +#define SWRM_MIN_COL_VAL	0 /* Cols = 2 */
> +#define SWRM_DEFAULT_COL	16
> +#define SWRM_SPECIAL_CMD_ID	0xF
> +#define MAX_FREQ_NUM		1
> +#define TIMEOUT_MS		1000
> +#define QCOM_SWRM_MAX_RD_LEN	0xf
> +#define DEFAULT_CLK_FREQ	9600000

The clocks and frame shape don't match usual expectations for PDM.
For a 9.6 MHz support, you would typically use 8 columns and 50 rows to 
transport PDM with a 50x oversampling. I've never seen anyone use 48x 
for PDM.

> +#define SWRM_MAX_DAIS		0xF
> +
> +struct qcom_swrm_port_config {
> +	u8 si;
> +	u8 off1;
> +	u8 off2;
> +};
> +
> +struct qcom_swrm_ctrl {
> +	struct sdw_bus bus;
> +	struct device *dev;
> +	struct regmap *regmap;
> +	struct completion sp_cmd_comp;
> +	struct work_struct slave_work;
> +	/* read/write lock */
> +	struct mutex lock;
> +	/* Port alloc/free lock */
> +	struct mutex port_lock;
> +	struct clk *hclk;
> +	int fifo_status;
> +	void __iomem *base;
> +	u8 wr_cmd_id;
> +	u8 rd_cmd_id;
> +	int irq;
> +	unsigned int version;
> +	int num_din_ports;
> +	int num_dout_ports;
> +	unsigned long dout_port_mask;
> +	unsigned long din_port_mask;
> +	struct qcom_swrm_port_config pconfig[SDW_MAX_PORTS];

this is not necessarily correct. the initial definitions for 
SDW_MAX_PORTS was for Slave devices. There is no definitions for Masters 
in the SoundWire spec, so you could use whatever constant you want for 
your hardware.

> +	struct sdw_stream_runtime *sruntime[SWRM_MAX_DAIS];
> +	enum sdw_slave_status status[SDW_MAX_DEVICES];
> +	u32 (*reg_read)(struct qcom_swrm_ctrl *ctrl, int reg);
> +	int (*reg_write)(struct qcom_swrm_ctrl *ctrl, int reg, int val);
> +};
> +
> +#define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
> +
> +struct usecase {
> +	u8 num_port;
> +	u8 num_ch;
> +	u32 chrate;
> +};

this structure doesn't seem to be used?

> +static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, u8 cmd_data,
> +				     u8 dev_addr, u16 reg_addr)
> +{
> +	int ret = 0;
> +	u8 cmd_id;
> +	u32 val;
> +
> +	mutex_lock(&ctrl->lock);
> +	if (dev_addr == SDW_BROADCAST_DEV_NUM) {
> +		cmd_id = SWRM_SPECIAL_CMD_ID;
> +	} else {
> +		if (++ctrl->wr_cmd_id == SWRM_SPECIAL_CMD_ID)
> +			ctrl->wr_cmd_id = 0;
> +
> +		cmd_id = ctrl->wr_cmd_id;
> +	}

might be worth having a helper/macro since you are doing the same thing 
below.

> +
> +	val = SWRM_REG_VAL_PACK(cmd_data, dev_addr, cmd_id, reg_addr);
> +	ret = ctrl->reg_write(ctrl, SWRM_CMD_FIFO_WR_CMD, val);
> +	if (ret < 0) {
> +		dev_err(ctrl->dev, "%s: reg 0x%x write failed, err:%d\n",
> +			__func__, val, ret);
> +		goto err;
> +	}
> +
> +	if (dev_addr == SDW_BROADCAST_DEV_NUM) {
> +		ctrl->fifo_status = 0;
> +		ret = wait_for_completion_timeout(&ctrl->sp_cmd_comp,
> +						  msecs_to_jiffies(TIMEOUT_MS));

This is odd. The SoundWire spec does not handle writes to a single 
device or broadcast writes differently. I don't see a clear reason why 
you would only timeout for a broadcast write.

> +
> +		if (!ret || ctrl->fifo_status) {
> +			dev_err(ctrl->dev, "reg 0x%x write failed\n", val);
> +			ret = -ENODATA;
> +			goto err;
> +		}
> +	}
> +err:
> +	mutex_unlock(&ctrl->lock);
> +	return ret;
> +}
> +
> +static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *ctrl,
> +				     u8 dev_addr, u16 reg_addr,
> +				     u32 len, u8 *rval)
> +{
> +	int i, ret = 0;
> +	u8 cmd_id = 0;
> +	u32 val;
> +
> +	mutex_lock(&ctrl->lock);
> +	if (dev_addr == SDW_ENUM_DEV_NUM) {
> +		cmd_id = SWRM_SPECIAL_CMD_ID;
> +	} else {
> +		if (++ctrl->rd_cmd_id == SWRM_SPECIAL_CMD_ID)
> +			ctrl->rd_cmd_id = 0;
> +
> +		cmd_id = ctrl->rd_cmd_id;
> +	}

helper?

> +	val = SWRM_REG_VAL_PACK(len, dev_addr, cmd_id, reg_addr);
> +	ret = ctrl->reg_write(ctrl, SWRM_CMD_FIFO_RD_CMD, val);
> +	if (ret < 0) {
> +		dev_err(ctrl->dev, "reg 0x%x write failed err:%d\n", val, ret);
> +		goto err;
> +	}
> +
> +	if (dev_addr == SDW_ENUM_DEV_NUM) {
> +		ctrl->fifo_status = 0;
> +		ret = wait_for_completion_timeout(&ctrl->sp_cmd_comp,
> +						  msecs_to_jiffies(TIMEOUT_MS));
> 
same comment here, there isn't a clear reason to only timeout for a read 
from device0.

> +		if (!ret || ctrl->fifo_status) {
> +			dev_err(ctrl->dev, "reg 0x%x read failed\n", val);
> +			ret = -ENODATA;
> +			goto err;
> +		}
> +	}
> +
> +	for (i = 0; i < len; i++) {
> +		rval[i] = ctrl->reg_read(ctrl, SWRM_CMD_FIFO_RD_FIFO_ADDR);
> +		rval[i] &= 0xFF;
> +	}
> +
> +err:
> +	mutex_unlock(&ctrl->lock);
> +	return ret;
> +}
> +
> +static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
> +{
> +	u32 val = ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS);
> +	int i;
> +
> +	for (i = 1; i < SDW_MAX_DEVICES; i++) {
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
> +
> +	sts = ctrl->reg_read(ctrl, SWRM_INTERRUPT_STATUS);
> +
> +	if (sts & SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED)
> +		complete(&ctrl->sp_cmd_comp);
> +
> +	if (sts & SWRM_INTERRUPT_STATUS_CMD_ERROR) {
> +		value = ctrl->reg_read(ctrl, SWRM_CMD_FIFO_STATUS);
> +		dev_err_ratelimited(ctrl->dev,
> +				    "CMD error, fifo status 0x%x\n",
> +				     value);
> +		ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CMD, 0x1);
> +		if ((value & 0xF) == 0xF) {
> +			ctrl->fifo_status = -ENODATA;
> +			complete(&ctrl->sp_cmd_comp);
> +		}
> +	}
> +
> +	if ((sts & SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED) ||
> +	    sts & SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS) {
> +		if (sts & SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED)
> +			ctrl->status[0] = SDW_SLAVE_ATTACHED;
> +
> +		schedule_work(&ctrl->slave_work);
> +	}
> +
> +	if (sts & SWRM_INTERRUPT_STATUS_SLAVE_PEND_IRQ)
> +		dev_dbg(ctrl->dev, "Slave pend irq\n");
> +
> +	if (sts & SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED)
> +		dev_dbg(ctrl->dev, "New slave attached\n");
> +
> +	if (sts & SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET)
> +		dev_err_ratelimited(ctrl->dev, "Bus clash detected\n");
> +
> +	if (sts & SWRM_INTERRUPT_STATUS_RD_FIFO_OVERFLOW)
> +		dev_err(ctrl->dev, "Read FIFO overflow\n");
> +
> +	if (sts & SWRM_INTERRUPT_STATUS_RD_FIFO_UNDERFLOW)
> +		dev_err(ctrl->dev, "Read FIFO underflow\n");
> +
> +	if (sts & SWRM_INTERRUPT_STATUS_WR_CMD_FIFO_OVERFLOW)
> +		dev_err(ctrl->dev, "Write FIFO overflow\n");
> +
> +	if (sts & SWRM_INTERRUPT_STATUS_DOUT_PORT_COLLISION)
> +		dev_err(ctrl->dev, "Port collision detected\n");
> +
> +	if (sts & SWRM_INTERRUPT_STATUS_READ_EN_RD_VALID_MISMATCH)
> +		dev_err(ctrl->dev, "Read enable valid mismatch\n");
> +
> +	if (sts & SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED)
> +		dev_err(ctrl->dev, "Cmd id finished\n");
> +
> +	if (sts & SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED)
> +		dev_err(ctrl->dev, "Bus reset finished\n");

This list is odd as well. It makes sense to only log error cases if you 
don't really know how to handle them, but a 'NEW SLAVE ATTACHED' should 
lead to an action, no?

> +
> +	ctrl->reg_write(ctrl, SWRM_INTERRUPT_CLEAR, sts);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
> +{
> +	u32 val;
> +	u8 row_ctrl = SWRM_MAX_ROW_VAL;
> +	u8 col_ctrl = SWRM_MIN_COL_VAL;
> +	u8 ssp_period = 1;
> +	u8 retry_cmd_num = 3;

probably want a define for those magic values, they are quite important.

> +
> +	/* Clear Rows and Cols */
> +	val = ((row_ctrl << SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT) |
> +		(col_ctrl << SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT) |
> +		(ssp_period << SWRM_MCP_FRAME_CTRL_BANK_SSP_PERIOD_SHFT));
> +
> +	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
> +
> +	/* Disable Auto enumeration */
> +	ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 0);

This goes back to my earlier comment. Do you disable this 
auto-enumeration to avoid conflicts with the existing bus management? 
That's not necessarily smart, we may want to change that bus layer to 
reduce the enumeration time if hardware can do it.

> +
> +	/* Mask soundwire interrupts */
> +	ctrl->reg_write(ctrl, SWRM_INTERRUPT_MASK_ADDR,
> +					SWRM_INTERRUPT_STATUS_RMSK);
> +
> +	/* Configure No pings */
> +	val = ctrl->reg_read(ctrl, SWRM_MCP_CFG_ADDR);

If there is any sort of PREQ signaling for Slave-initiated interrupts, 
disabling PINGs is likely a non-conformant implementation since the 
master is required to issue a PING command within 32 frames. That's also 
the only way to know if a device is attached, so additional comments are 
likely required.

> +
> +	val &= ~SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK;
> +	val |= (0x1f << SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_SHFT);
> +	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
> +
> +	/* Configure number of retries of a read/write cmd */
> +	val = (retry_cmd_num << SWRM_CMD_FIFO_CFG_NUM_OF_CMD_RETRY_SHFT);
> +	ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CFG_ADDR, val);
> +
> +	/* Set IRQ to PULSE */
> +	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
> +				SWRM_COMP_CFG_IRQ_LEVEL_OR_PULSE_MSK |
> +				SWRM_COMP_CFG_ENABLE_MSK);

indentation seems off in this code?

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
> +			if (ret < 0) {
> +				if (ret == -ENODATA)
> +					return SDW_CMD_IGNORED;
> +
> +				return ret;
> +			}
> +
> +			i = i + len;
> +		}
> +	} else if (msg->flags == SDW_MSG_FLAG_WRITE) {
> +		for (i = 0; i < msg->len; i++) {
> +			ret = qcom_swrm_cmd_fifo_wr_cmd(ctrl, msg->buf[i],
> +							msg->dev_num,
> +						       msg->addr + i);
> +			if (ret < 0) {
> +				if (ret == -ENODATA)
> +					return SDW_CMD_IGNORED;
> +
> +				return ret;
> +			}
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
> +
> +	val = ctrl->reg_read(ctrl, reg);
> +	val |= ((0 << SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT) |
> +		(7l << SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT));

magic values, probably need a macro here?

> +	ctrl->reg_write(ctrl, reg, val);
> +
> +	return 0;
> +}
> +

> +static int qcom_swrm_register_dais(struct qcom_swrm_ctrl *ctrl)
> +{
> +	int num_dais = ctrl->num_dout_ports + ctrl->num_din_ports;
> +	struct snd_soc_dai_driver *dais;
> +	int i;
> +
> +	/* PDM dais are only tested for now */
> +	dais = devm_kcalloc(ctrl->dev, num_dais, sizeof(*dais), GFP_KERNEL);
> +	if (!dais)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < num_dais; i++) {
> +		dais[i].name = kasprintf(GFP_KERNEL, "SDW Pin%d", i);

if (!dais[i].name)

> +		if (i < ctrl->num_dout_ports) {
> +			dais[i].playback.stream_name = kasprintf(GFP_KERNEL,
> +								 "SDW Tx%d", i);
> +			if (!dais[i].playback.stream_name) {
> +				kfree(dais[i].name);
> +				return -ENOMEM;
> +			}

also need to free previously allocated memory in earlier iterations, or 
use devm_

> +			dais[i].playback.channels_min = 1;
> +			dais[i].playback.channels_max = 1;
> +			dais[i].playback.rates = SNDRV_PCM_RATE_48000;
> +			dais[i].playback.formats = SNDRV_PCM_FMTBIT_S16_LE;
> +		} else {
> +			dais[i].capture.stream_name = kasprintf(GFP_KERNEL,
> +								"SDW Rx%d", i);
> +			if (!dais[i].capture.stream_name) {
> +				kfree(dais[i].name);
> +				kfree(dais[i].playback.stream_name);
> +				return -ENOMEM;
> +			}
> +
> +			dais[i].capture.channels_min = 1;
> +			dais[i].capture.channels_max = 1;
> +			dais[i].capture.rates = SNDRV_PCM_RATE_48000;
> +			dais[i].capture.formats = SNDRV_PCM_FMTBIT_S16_LE;
> +		}
> +		dais[i].ops = &qcom_swrm_pdm_dai_ops;
> +		dais[i].id = i;
> +	}
> +
> +	return devm_snd_soc_register_component(ctrl->dev,
> +						&qcom_swrm_dai_component,
> +						dais, num_dais);
> +}
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
