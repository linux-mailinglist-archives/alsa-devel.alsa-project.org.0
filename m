Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A82133A23B
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Jun 2019 23:56:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 157E01669;
	Sat,  8 Jun 2019 23:55:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 157E01669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560030964;
	bh=sQ9BwIlbo0/oha8+PyliPMqJ1S2JT5xnnmq5oyzRF58=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M3sxhMdrBsgKi0ER0TAWdRsv/iFfDunYMoNCUlLHYz3Ea7FToIJNC8bm9sJZ8ow6c
	 KB7foQPl/Otx/J3X0tu7xHCeLiwZLJPpFFUxktmky8OKA0pLjonAjhwJJIY+SQFaRv
	 GzwBv2pkU4uQCfsm15SfFH/o03hnmZDi5F3EF2PM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95332F896F8;
	Sat,  8 Jun 2019 23:54:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 800C9F896F7; Sat,  8 Jun 2019 23:54:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14C06F8070E
 for <alsa-devel@alsa-project.org>; Sat,  8 Jun 2019 23:54:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14C06F8070E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jun 2019 14:54:06 -0700
X-ExtLoop1: 1
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.251.93.16])
 ([10.251.93.16])
 by orsmga006.jf.intel.com with ESMTP; 08 Jun 2019 14:54:00 -0700
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org, 
 vkoul@kernel.org
References: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
 <20190607085643.932-7-srinivas.kandagatla@linaro.org>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <644c7aec-1844-d19b-4620-9da26020752f@intel.com>
Date: Sat, 8 Jun 2019 23:53:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607085643.932-7-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
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

On 2019-06-07 10:56, Srinivas Kandagatla wrote:
> Qualcomm SoundWire Master controller is present in most Qualcomm SoCs
> either integrated as part of WCD audio codecs via slimbus or
> as part of SOC I/O.
> 
> This patchset adds support to a very basic controller which has been
> tested with WCD934x SoundWire controller connected to WSA881x smart
> speaker amplifiers.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   drivers/soundwire/Kconfig  |   9 +
>   drivers/soundwire/Makefile |   4 +
>   drivers/soundwire/qcom.c   | 983 +++++++++++++++++++++++++++++++++++++
>   3 files changed, 996 insertions(+)
>   create mode 100644 drivers/soundwire/qcom.c
> 
> diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
> index 53b55b79c4af..f44d4f36dbbb 100644
> --- a/drivers/soundwire/Kconfig
> +++ b/drivers/soundwire/Kconfig
> @@ -34,4 +34,13 @@ config SOUNDWIRE_INTEL
>   	  enable this config option to get the SoundWire support for that
>   	  device.
>   
> +config SOUNDWIRE_QCOM
> +	tristate "Qualcomm SoundWire Master driver"
> +	select SOUNDWIRE_BUS
> +	depends on SND_SOC
> +	help
> +	  SoundWire Qualcomm Master driver.
> +	  If you have an Qualcomm platform which has a SoundWire Master then
> +	  enable this config option to get the SoundWire support for that
> +	  device
>   endif
> diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
> index 5817beaca0e1..f4ebfde31372 100644
> --- a/drivers/soundwire/Makefile
> +++ b/drivers/soundwire/Makefile
> @@ -16,3 +16,7 @@ obj-$(CONFIG_SOUNDWIRE_INTEL) += soundwire-intel.o
>   
>   soundwire-intel-init-objs := intel_init.o
>   obj-$(CONFIG_SOUNDWIRE_INTEL) += soundwire-intel-init.o
> +
> +#Qualcomm driver
> +soundwire-qcom-objs :=	qcom.o
> +obj-$(CONFIG_SOUNDWIRE_QCOM) += soundwire-qcom.o
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> new file mode 100644
> index 000000000000..d1722d44d217
> --- /dev/null
> +++ b/drivers/soundwire/qcom.c
> @@ -0,0 +1,983 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2019, Linaro Limited
> +
> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/slimbus.h>
> +#include <linux/soundwire/sdw.h>
> +#include <linux/soundwire/sdw_registers.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include "bus.h"
> +

Pierre already pointed this out - SWR looks odd. During my time with 
Soundwire I've met SDW and SNDW, but it's the first time I see SWR.

> +#define SWRM_COMP_HW_VERSION					0x00
> +#define SWRM_COMP_CFG_ADDR					0x04
> +#define SWRM_COMP_CFG_IRQ_LEVEL_OR_PULSE_MSK			BIT(1)
> +#define SWRM_COMP_CFG_ENABLE_MSK				BIT(0)
> +#define SWRM_COMP_PARAMS					0x100
> +#define SWRM_COMP_PARAMS_DOUT_PORTS_MASK			GENMASK(4, 0)
> +#define SWRM_COMP_PARAMS_DIN_PORTS_MASK				GENMASK(9, 5)
> +#define SWRM_COMP_PARAMS_WR_FIFO_DEPTH				GENMASK(14, 10)
> +#define SWRM_COMP_PARAMS_RD_FIFO_DEPTH				GENMASK(19, 15)
> +#define SWRM_COMP_PARAMS_AUTO_ENUM_SLAVES			GENMASK(32. 20)
> +#define SWRM_INTERRUPT_STATUS					0x200
> +#define SWRM_INTERRUPT_STATUS_RMSK				GENMASK(16, 0)
> +#define SWRM_INTERRUPT_STATUS_SLAVE_PEND_IRQ			BIT(0)
> +#define SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED		BIT(1)
> +#define SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS		BIT(2)
> +#define SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET			BIT(3)
> +#define SWRM_INTERRUPT_STATUS_RD_FIFO_OVERFLOW			BIT(4)
> +#define SWRM_INTERRUPT_STATUS_RD_FIFO_UNDERFLOW			BIT(5)
> +#define SWRM_INTERRUPT_STATUS_WR_CMD_FIFO_OVERFLOW		BIT(6)
> +#define SWRM_INTERRUPT_STATUS_CMD_ERROR				BIT(7)
> +#define SWRM_INTERRUPT_STATUS_DOUT_PORT_COLLISION		BIT(8)
> +#define SWRM_INTERRUPT_STATUS_READ_EN_RD_VALID_MISMATCH		BIT(9)
> +#define SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED		BIT(10)
> +#define SWRM_INTERRUPT_STATUS_NEW_SLAVE_AUTO_ENUM_FINISHED	BIT(11)
> +#define SWRM_INTERRUPT_STATUS_AUTO_ENUM_FAILED			BIT(12)
> +#define SWRM_INTERRUPT_STATUS_AUTO_ENUM_TABLE_IS_FULL		BIT(13)
> +#define SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED		BIT(14)
> +#define SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED			BIT(15)
> +#define SWRM_INTERRUPT_STATUS_ERROR_PORT_TEST			BIT(16)
> +#define SWRM_INTERRUPT_MASK_ADDR				0x204
> +#define SWRM_INTERRUPT_CLEAR					0x208

You seem to shortcut every reg here similarly to how it's done in SDW 
spec. INTERRUPT is represented by INT there, and by doing so, this 
define block would look more like a real family.

> +#define SWRM_CMD_FIFO_WR_CMD					0x300
> +#define SWRM_CMD_FIFO_RD_CMD					0x304
> +#define SWRM_CMD_FIFO_CMD					0x308
> +#define SWRM_CMD_FIFO_STATUS					0x30C
> +#define SWRM_CMD_FIFO_CFG_ADDR					0x314
> +#define SWRM_CMD_FIFO_CFG_NUM_OF_CMD_RETRY_SHFT			0x0
> +#define SWRM_CMD_FIFO_RD_FIFO_ADDR				0x318
> +#define SWRM_ENUMERATOR_CFG_ADDR				0x500
> +#define SWRM_MCP_FRAME_CTRL_BANK_ADDR(m)		(0x101C + 0x40 * (m))
> +#define SWRM_MCP_FRAME_CTRL_BANK_SSP_PERIOD_SHFT		16
> +#define SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT			3
> +#define SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK			GENMASK(2, 0)
> +#define SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT			0
> +#define SWRM_MCP_CFG_ADDR					0x1048
> +#define SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK		GENMASK(21, 17)
> +#define SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_SHFT		0x11
> +#define SWRM_MCP_STATUS						0x104C
> +#define SWRM_MCP_STATUS_BANK_NUM_MASK				BIT(0)
> +#define SWRM_MCP_SLV_STATUS					0x1090
> +#define SWRM_MCP_SLV_STATUS_MASK				GENMASK(1, 0)
> +#define SWRM_DP_PORT_CTRL_BANK(n, m)	(0x1124 + 0x100 * (n - 1) + 0x40 * m)

Some of these you align, others leave with the equal amount of tabs 
despite different widths.

> +#define SWRM_DP_PORT_CTRL2_BANK(n, m)	(0x1126 + 0x100 * (n - 1) + 0x40 * m)

Consider reusing _CTRL_ and simply adding offset for 2_.

> +#define SWRM_DP_PORT_CTRL_EN_CHAN_SHFT				0x18
> +#define SWRM_DP_PORT_CTRL_OFFSET2_SHFT				0x10
> +#define SWRM_DP_PORT_CTRL_OFFSET1_SHFT				0x08
> +#define SWRM_AHB_BRIDGE_WR_DATA_0				0xc885
> +#define SWRM_AHB_BRIDGE_WR_ADDR_0				0xc889
> +#define SWRM_AHB_BRIDGE_RD_ADDR_0				0xc88d
> +#define SWRM_AHB_BRIDGE_RD_DATA_0				0xc891
> +
> +#define SWRM_REG_VAL_PACK(data, dev, id, reg)	\
> +			((reg) | ((id) << 16) | ((dev) << 20) | ((data) << 24))
> +
> +#define SWRM_MAX_ROW_VAL	0 /* Rows = 48 */
> +#define SWRM_DEFAULT_ROWS	48
> +#define SWRM_MIN_COL_VAL	0 /* Cols = 2 */
> +#define SWRM_DEFAULT_COL	16
> +#define SWRM_SPECIAL_CMD_ID	0xF
> +#define MAX_FREQ_NUM		1
> +#define TIMEOUT_MS		1000
> +#define QCOM_SWRM_MAX_RD_LEN	0xf
> +#define DEFAULT_CLK_FREQ	9600000
> +#define SWRM_MAX_DAIS		0xF

Given the scale of this block, it might be good to reiterate all defines 
and see if indeed all are QCom specific. Maybe some could be replaced by 
equivalents from common code.

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

Given the fact you don't use version field directly and always shift it, 
I'd consider making use of union here to listing version bits 
explicitly. Overall size won't change.

> +	int num_din_ports;
> +	int num_dout_ports;
> +	unsigned long dout_port_mask;
> +	unsigned long din_port_mask;
> +	struct qcom_swrm_port_config pconfig[SDW_MAX_PORTS];
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
> +

"usecase" looks ambiguous at best.

> +static u32 qcom_swrm_slim_reg_read(struct qcom_swrm_ctrl *ctrl, int reg)
> +{
> +	struct regmap *wcd_regmap = ctrl->regmap;
> +	u32 val = 0, ret;
> +
> +	/* pg register + offset */
> +	regmap_bulk_write(wcd_regmap, SWRM_AHB_BRIDGE_RD_ADDR_0,
> +			  (u8 *)&reg, 4);
> +
> +	ret = regmap_bulk_read(wcd_regmap, SWRM_AHB_BRIDGE_RD_DATA_0,
> +			       (u8 *)&val, 4);
> +	if (ret < 0)
> +		dev_err(ctrl->dev, "Read Failure (%d)\n", ret);
> +
> +	return val;
> +}
> +
> +static u32 qcom_swrm_mmio_reg_read(struct qcom_swrm_ctrl *ctrl, int reg)
> +{
> +	return readl_relaxed(ctrl->base + reg);
> +}
> +
> +static int qcom_swrm_mmio_reg_write(struct qcom_swrm_ctrl *ctrl,
> +				    int reg, int val)
> +{
> +	writel_relaxed(val, ctrl->base + reg);
> +
> +	return 0;
> +}
> +
> +static int qcom_swrm_slim_reg_write(struct qcom_swrm_ctrl *ctrl,
> +				    int reg, int val)
> +{
> +	struct regmap *wcd_regmap = ctrl->regmap;
> +
> +	/* pg register + offset */
> +	regmap_bulk_write(wcd_regmap, SWRM_AHB_BRIDGE_WR_DATA_0,
> +			  (u8 *)&val, 4);
> +	/* write address register */
> +	regmap_bulk_write(wcd_regmap, SWRM_AHB_BRIDGE_WR_ADDR_0,
> +			  (u8 *)&reg, 4);
> +
> +	return 0;
> +}

Ok, so you choose to declare write op as returning "int" yet either it 
cannot do so (void writel_relaxed) or ret is completely ignored 
(regmap_bulk_write does return an int value). Either switch to void or 
check against returned value whenever possible.

> +
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
> +
> +		if (!ret || ctrl->fifo_status) {
> +			dev_err(ctrl->dev, "reg 0x%x write failed\n", val);

Both, this and err msg above are generic enough to be put into goto to 
save some space.

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
> +
> +	val = SWRM_REG_VAL_PACK(len, dev_addr, cmd_id, reg_addr);
> +	ret = ctrl->reg_write(ctrl, SWRM_CMD_FIFO_RD_CMD, val);
> +	if (ret < 0) {
> +		dev_err(ctrl->dev, "reg 0x%x write failed err:%d\n", val, ret);

Same for _rt_.

> +		goto err;
> +	}
> +
> +	if (dev_addr == SDW_ENUM_DEV_NUM) {
> +		ctrl->fifo_status = 0;
> +		ret = wait_for_completion_timeout(&ctrl->sp_cmd_comp,
> +						  msecs_to_jiffies(TIMEOUT_MS));
> +
> +		if (!ret || ctrl->fifo_status) {
> +			dev_err(ctrl->dev, "reg 0x%x read failed\n", val);

Just to be sure. It is really "read" that is failing here?

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

If you do not handle these errors at all, consider declaring 
ERROR-message table. I believe leaving erroneus status as is may lead to 
fatal consequences. If there is no intention for handling even the most 
critical cases, please add TODO/ comment here.

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
> +
> +	/* Mask soundwire interrupts */
> +	ctrl->reg_write(ctrl, SWRM_INTERRUPT_MASK_ADDR,
> +					SWRM_INTERRUPT_STATUS_RMSK);
> +
> +	/* Configure No pings */
> +	val = ctrl->reg_read(ctrl, SWRM_MCP_CFG_ADDR);
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
> +	return 0;

As in my previous comment, you should check against ret from reg_write 
if void approach is not chosen.

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

Any reason for inlining this incrementation? If _rd_ fails, we leave the 
loop anyway.

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
> +	ctrl->reg_write(ctrl, reg, val);
> +
> +	return 0;

s/return 0/return ctrl->reg_write(ctrl, reg, val)/

> +}
> +
> +static int qcom_swrm_port_params(struct sdw_bus *bus,
> +				 struct sdw_port_params *p_params,
> +				unsigned int bank)
> +{
> +	/* TBD */
> +	return 0;
> +}
> +
> +static int qcom_swrm_transport_params(struct sdw_bus *bus,
> +				      struct sdw_transport_params *params,
> +				     enum sdw_reg_bank bank)
> +{
> +	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
> +	u32 value;
> +
> +	value = params->offset1 << SWRM_DP_PORT_CTRL_OFFSET1_SHFT;
> +	value |= params->offset2 << SWRM_DP_PORT_CTRL_OFFSET2_SHFT;
> +	value |= params->sample_interval - 1;
> +
> +	ctrl->reg_write(ctrl, SWRM_DP_PORT_CTRL_BANK((params->port_num), bank),
> +			value);
> +
> +	return 0;

Another "return issue" here.

> +}
> +
> +static int qcom_swrm_port_enable(struct sdw_bus *bus,
> +				 struct sdw_enable_ch *enable_ch,
> +				unsigned int bank)
> +{
> +	u32 reg = SWRM_DP_PORT_CTRL_BANK(enable_ch->port_num, bank);
> +	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
> +	u32 val;
> +
> +	val = ctrl->reg_read(ctrl, reg);
> +	if (enable_ch->enable)
> +		val |= (enable_ch->ch_mask << SWRM_DP_PORT_CTRL_EN_CHAN_SHFT);
> +	else
> +		val &= ~(enable_ch->ch_mask << SWRM_DP_PORT_CTRL_EN_CHAN_SHFT);
> +
> +	ctrl->reg_write(ctrl, reg, val);
> +
> +	return 0;
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
> +	int i = 0;
> +
> +	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
> +		list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
> +			p_rt->transport_params.port_num = p_rt->num;
> +			p_rt->transport_params.sample_interval =
> +					ctrl->pconfig[p_rt->num - 1].si + 1;
> +			p_rt->transport_params.offset1 =
> +					ctrl->pconfig[p_rt->num - 1].off1;
> +			p_rt->transport_params.offset2 =
> +					ctrl->pconfig[p_rt->num - 1].off2;

ctrl->pconfig[ <idx> ] colleagues bellow make use of local index 
variable which clearly makes it more readable.

> +		}
> +
> +		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
> +			list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
> +				p_rt->transport_params.port_num = p_rt->num;
> +				p_rt->transport_params.sample_interval =
> +						ctrl->pconfig[i].si + 1;
> +				p_rt->transport_params.offset1 =
> +						ctrl->pconfig[i].off1;
> +				p_rt->transport_params.offset2 =
> +						ctrl->pconfig[i].off2;
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
> +		list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
> +			clear_bit(p_rt->num - 1, port_mask);
> +		}

Unnecessary brackets.

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
> +	struct sdw_port_config pconfig[SDW_MAX_PORTS];
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

Hmm. frame_rate and type gets assigned based on "input" data yet the 
rest is hardcoded. Is this intended?

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
> +	int ret;
> +
> +	ret = qcom_swrm_stream_alloc_ports(ctrl, ctrl->sruntime[dai->id],
> +					   params, substream->stream);
> +	if (ret)
> +		return ret;
> +
> +	return sdw_prepare_stream(ctrl->sruntime[dai->id]);
> +}
> +
> +static int qcom_swrm_hw_free(struct snd_pcm_substream *substream,
> +			     struct snd_soc_dai *dai)
> +{
> +	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
> +
> +	qcom_swrm_stream_free_ports(ctrl, ctrl->sruntime[dai->id]);
> +	sdw_stream_remove_master(&ctrl->bus, ctrl->sruntime[dai->id]);
> +	sdw_deprepare_stream(ctrl->sruntime[dai->id]);
> +	sdw_disable_stream(ctrl->sruntime[dai->id]);

Declaring local variable initialized with ctrl->sruntime[dai->id] should 
prove more readable.

> +
> +	return 0;
> +}
> +
> +static void *qcom_pdm_get_sdw_stream(struct snd_soc_dai *dai,
> +				     int direction)
> +{
> +	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
> +
> +	return ctrl->sruntime[dai->id];
> +}
> +
> +static int qcom_pdm_set_sdw_stream(struct snd_soc_dai *dai,
> +				   void *stream, int direction)
> +{
> +	return 0;
> +}
> +
> +static int qcom_swrm_startup(struct snd_pcm_substream *stream,
> +			     struct snd_soc_dai *dai)
> +{
> +	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
> +	struct sdw_stream_runtime *sruntime;
> +
> +	sruntime = sdw_alloc_stream(dai->name);
> +	if (!sruntime)
> +		return -ENOMEM;
> +
> +	ctrl->sruntime[dai->id] = sruntime;
> +
> +	return 0;
> +}
> +
> +static void qcom_swrm_shutdown(struct snd_pcm_substream *stream,
> +			       struct snd_soc_dai *dai)
> +{
> +	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
> +
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
> +	.set_sdw_stream = qcom_pdm_set_sdw_stream,
> +	.get_sdw_stream = qcom_pdm_get_sdw_stream,
> +};
> +
> +static const struct snd_soc_component_driver qcom_swrm_dai_component = {
> +	.name           = "soundwire",
> +};
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
> +		if (i < ctrl->num_dout_ports) {
> +			dais[i].playback.stream_name = kasprintf(GFP_KERNEL,
> +								 "SDW Tx%d", i);
> +			if (!dais[i].playback.stream_name) {
> +				kfree(dais[i].name);
> +				return -ENOMEM;

Now this got me worried. What about memory allocated in iterations 
before the failure? It must be freed in error handling path. goto should 
be of help here.

> +			}
> +			dais[i].playback.channels_min = 1;
> +			dais[i].playback.channels_max = 1;
> +			dais[i].playback.rates = SNDRV_PCM_RATE_48000;
> +			dais[i].playback.formats = SNDRV_PCM_FMTBIT_S16_LE;

All of these formats are hardcoded. Consider declaring a "template" 
format above and simply initialize each dai with it.

> +		} else {
> +			dais[i].capture.stream_name = kasprintf(GFP_KERNEL,
> +								"SDW Rx%d", i);
> +			if (!dais[i].capture.stream_name) {
> +				kfree(dais[i].name);
> +				kfree(dais[i].playback.stream_name);
> +				return -ENOMEM;

Same memory deallocation issue here.

> +			}
> +
> +			dais[i].capture.channels_min = 1;
> +			dais[i].capture.channels_max = 1;
> +			dais[i].capture.rates = SNDRV_PCM_RATE_48000;
> +			dais[i].capture.formats = SNDRV_PCM_FMTBIT_S16_LE;

Comment regarding playback dai initialization applies here too.

> +		}
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
> +	u8 off1[SDW_MAX_PORTS];
> +	u8 off2[SDW_MAX_PORTS];
> +	u8 si[SDW_MAX_PORTS];

Array of struct qcom_swrm_port_config instead of this trio?

> +	int i, ret, nports, val;
> +
> +	val = ctrl->reg_read(ctrl, SWRM_COMP_PARAMS);
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

Using array I spoke of earlier leads to brackets being redundant here.

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
> +	struct resource *res;
> +	int ret;
> +
> +	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
> +	if (!ctrl)
> +		return -ENOMEM;
> +
> +	if (dev->parent->bus == &slimbus_bus) {
> +		ctrl->reg_read = qcom_swrm_slim_reg_read;
> +		ctrl->reg_write = qcom_swrm_slim_reg_write;
> +		ctrl->regmap = dev_get_regmap(dev->parent, NULL);
> +		if (!ctrl->regmap)
> +			return -EINVAL;
> +	} else {
> +		ctrl->reg_read = qcom_swrm_mmio_reg_read;
> +		ctrl->reg_write = qcom_swrm_mmio_reg_write;
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +		ctrl->base = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(ctrl->base))
> +			return PTR_ERR(ctrl->base);
> +	}
> +
> +	ctrl->irq = platform_get_irq(pdev, 0);
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
> +	init_completion(&ctrl->sp_cmd_comp);
> +	mutex_init(&ctrl->lock);
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
> +	params->curr_bank = ctrl->reg_read(ctrl, SWRM_MCP_STATUS) &
> +				SWRM_MCP_STATUS_BANK_NUM_MASK;
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
> +	ctrl->version = ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION);
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
> +
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
> +
> +static const struct of_device_id qcom_swrm_of_match[] = {
> +	{ .compatible = "qcom,soundwire-v1.3.0",},
> +	{ .compatible = "qcom,soundwire-v1.5.0",},
> +	{ .compatible = "qcom,soundwire-v1.6.0",},
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
