Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A128B2AC
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 10:41:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 639861663;
	Tue, 13 Aug 2019 10:40:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 639861663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565685667;
	bh=I5naMQa1GwZZzGaxRUwINw6KDZsOccBYbwMK+xLlzhE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pfEjEQOKuoQO104Bz7YIE5dz4vM4wToJ3Ik3gp1vsd9R3/zhg+jAqHAIck3oHG/BV
	 7V7O38ESDicBZCcqeb9Sxg9IlPDkzXOdJ1g0Ycckq9lpGGaeaY7bTVJgCnAbGhzvNY
	 app4wB4VIQdQD3t0fIMpRllciO82HZNj4OfQc5IU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B79D1F80636;
	Tue, 13 Aug 2019 10:36:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9E43F8058C; Tue, 13 Aug 2019 10:36:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE550F80273
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 10:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE550F80273
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="wyX/r8P/"
Received: by mail-wr1-x443.google.com with SMTP id r3so13212124wrt.3
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 01:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YGM7Gxwst0XYXuH0LX9D8gBnYmP3aL5yoOPWvgwMokU=;
 b=wyX/r8P/gv07+uMWjxpBdBUli9kBt4GcUNPLYGYa+6Vfj/NiWsmABPt2s2djdcUP98
 U8HZod0DHojqK5tl1iXAgjdIAaQci1mKziTLAR1e0JpEsaQJPvkd+yc95JoQprOu1Pxg
 2zv9UWYjKeF07/rG885DxydYSx8+UZWPMqsRE08viydbBKxOMK2BMP9Q9VB6gC83UpOX
 93eXxYP19K+7EEt3CyEyNrnd3t89rbLT6thlutlFYRSycpIZsZ9pjaaJ20YKJV7RVXhb
 ZypO2hvIY0mRkbDTIEKmDL4F+tcNosVLQd1+PxS2KMHnPe/Do3CoJNLGFbkH2nt9STT1
 kagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YGM7Gxwst0XYXuH0LX9D8gBnYmP3aL5yoOPWvgwMokU=;
 b=DCAgxRd5QqI+53C7euUoROYJh1+jb6X7eb9aEfC5Sz0pwov0xVXdrcu6Fg0jreI0SA
 eZ5cbB384LBZMl8hwUWE8J11Td3iloWu1J5s/54mg5APIOuPT3cRWQ0ylXfWYer5xFw1
 5dNWD5Se+vqmLUpkMlWZ8/s20xGVekklj/aCm3y42faVVdpWZ+1n/b7VnFsKKSy3rb3v
 Q4hceZIuJeUqMySUss0bBcB8ixavtSZtuB3is4qT0eCFxUxTstL0CcPz/a5GTEwzlJXj
 7Pn3s9UBOqap6jMLxPCpNL8jLpmxarRythhiKbOb8MSZ4788LaBO2rcoY7dzGFTgmUwn
 cVug==
X-Gm-Message-State: APjAAAVzIbTDkrU4/0krC7qw5FRQdhdZufOX1WNkYKrWoTFuMx+xDgKW
 SJmVlfA/tet24r/5UIDuDTNulQ==
X-Google-Smtp-Source: APXvYqyvq5k02Iwd291nJmofXcEnxQjpuZa2AZMESAK0vNC4gDzoqpL5WkExF4qmjey/WgapXZ7xBw==
X-Received: by 2002:adf:f991:: with SMTP id f17mr17289708wrr.233.1565685360431; 
 Tue, 13 Aug 2019 01:36:00 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id o11sm8651822wrw.19.2019.08.13.01.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2019 01:35:59 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	broonie@kernel.org
Date: Tue, 13 Aug 2019 09:35:50 +0100
Message-Id: <20190813083550.5877-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
References: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, spapothi@codeaurora.org
Subject: [alsa-devel] [PATCH v2 5/5] soundwire: qcom: add support for
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Qualcomm SoundWire Master controller is present in most Qualcomm SoCs
either integrated as part of WCD audio codecs via slimbus or
as part of SOC I/O.

This patchset adds support to a very basic controller which has been
tested with WCD934x SoundWire controller connected to WSA881x smart
speaker amplifiers.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/Kconfig  |   9 +
 drivers/soundwire/Makefile |   4 +
 drivers/soundwire/qcom.c   | 919 +++++++++++++++++++++++++++++++++++++
 3 files changed, 932 insertions(+)
 create mode 100644 drivers/soundwire/qcom.c

diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
index f518273cfbe3..69f3b0e36b3d 100644
--- a/drivers/soundwire/Kconfig
+++ b/drivers/soundwire/Kconfig
@@ -30,4 +30,13 @@ config SOUNDWIRE_INTEL
 	  enable this config option to get the SoundWire support for that
 	  device.
 
+config SOUNDWIRE_QCOM
+	tristate "Qualcomm SoundWire Master driver"
+	depends on SLIMBUS
+	depends on SND_SOC
+	help
+	  SoundWire Qualcomm Master driver.
+	  If you have an Qualcomm platform which has a SoundWire Master then
+	  enable this config option to get the SoundWire support for that
+	  device
 endif
diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index 45b7e5001653..e2028a1df6d5 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -17,3 +17,7 @@ obj-$(CONFIG_SOUNDWIRE_INTEL) += soundwire-intel.o
 
 soundwire-intel-init-objs := intel_init.o
 obj-$(CONFIG_SOUNDWIRE_INTEL) += soundwire-intel-init.o
+
+#Qualcomm driver
+soundwire-qcom-objs :=	qcom.o
+obj-$(CONFIG_SOUNDWIRE_QCOM) += soundwire-qcom.o
diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
new file mode 100644
index 000000000000..5634912e113c
--- /dev/null
+++ b/drivers/soundwire/qcom.c
@@ -0,0 +1,919 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2019, Linaro Limited
+
+#include <linux/clk.h>
+#include <linux/completion.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/slimbus.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_registers.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include "bus.h"
+
+#define SWRM_COMP_HW_VERSION					0x00
+#define SWRM_COMP_CFG_ADDR					0x04
+#define SWRM_COMP_CFG_IRQ_LEVEL_OR_PULSE_MSK			BIT(1)
+#define SWRM_COMP_CFG_ENABLE_MSK				BIT(0)
+#define SWRM_COMP_PARAMS					0x100
+#define SWRM_COMP_PARAMS_DOUT_PORTS_MASK			GENMASK(4, 0)
+#define SWRM_COMP_PARAMS_DIN_PORTS_MASK				GENMASK(9, 5)
+#define SWRM_INTERRUPT_STATUS					0x200
+#define SWRM_INTERRUPT_STATUS_RMSK				GENMASK(16, 0)
+#define SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED		BIT(1)
+#define SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS		BIT(2)
+#define SWRM_INTERRUPT_STATUS_CMD_ERROR				BIT(7)
+#define SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED		BIT(10)
+#define SWRM_INTERRUPT_MASK_ADDR				0x204
+#define SWRM_INTERRUPT_CLEAR					0x208
+#define SWRM_CMD_FIFO_WR_CMD					0x300
+#define SWRM_CMD_FIFO_RD_CMD					0x304
+#define SWRM_CMD_FIFO_CMD					0x308
+#define SWRM_CMD_FIFO_STATUS					0x30C
+#define SWRM_CMD_FIFO_CFG_ADDR					0x314
+#define SWRM_RD_WR_CMD_RETRIES					0x7
+#define SWRM_CMD_FIFO_RD_FIFO_ADDR				0x318
+#define SWRM_ENUMERATOR_CFG_ADDR				0x500
+#define SWRM_MCP_FRAME_CTRL_BANK_ADDR(m)		(0x101C + 0x40 * (m))
+#define SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT			3
+#define SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK			GENMASK(2, 0)
+#define SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK			GENMASK(7, 3)
+#define SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT			0
+#define SWRM_MCP_CFG_ADDR					0x1048
+#define SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK		GENMASK(21, 17)
+#define SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_SHFT		0x11
+#define SWRM_DEF_CMD_NO_PINGS					0x1f
+#define SWRM_MCP_STATUS						0x104C
+#define SWRM_MCP_STATUS_BANK_NUM_MASK				BIT(0)
+#define SWRM_MCP_SLV_STATUS					0x1090
+#define SWRM_MCP_SLV_STATUS_MASK				GENMASK(1, 0)
+#define SWRM_DP_PORT_CTRL_BANK(n, m)	(0x1124 + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_DP_PORT_CTRL_EN_CHAN_SHFT				0x18
+#define SWRM_DP_PORT_CTRL_OFFSET2_SHFT				0x10
+#define SWRM_DP_PORT_CTRL_OFFSET1_SHFT				0x08
+#define SWRM_AHB_BRIDGE_WR_DATA_0				0xc85
+#define SWRM_AHB_BRIDGE_WR_ADDR_0				0xc89
+#define SWRM_AHB_BRIDGE_RD_ADDR_0				0xc8d
+#define SWRM_AHB_BRIDGE_RD_DATA_0				0xc91
+
+#define SWRM_REG_VAL_PACK(data, dev, id, reg)	\
+			((reg) | ((id) << 16) | ((dev) << 20) | ((data) << 24))
+
+#define SWRM_MAX_ROW_VAL	0 /* Rows = 48 */
+#define SWRM_DEFAULT_ROWS	48
+#define SWRM_MIN_COL_VAL	0 /* Cols = 2 */
+#define SWRM_DEFAULT_COL	16
+#define SWRM_MAX_COL_VAL	7
+#define SWRM_SPECIAL_CMD_ID	0xF
+#define MAX_FREQ_NUM		1
+#define TIMEOUT_MS		(2 * HZ)
+#define QCOM_SWRM_MAX_RD_LEN	0xf
+#define QCOM_SDW_MAX_PORTS	14
+#define DEFAULT_CLK_FREQ	9600000
+#define SWRM_MAX_DAIS		0xF
+
+struct qcom_swrm_port_config {
+	u8 si;
+	u8 off1;
+	u8 off2;
+};
+
+struct qcom_swrm_ctrl {
+	struct sdw_bus bus;
+	struct device *dev;
+	struct regmap *regmap;
+	struct completion *comp;
+	struct work_struct slave_work;
+	/* read/write lock */
+	spinlock_t comp_lock;
+	/* Port alloc/free lock */
+	struct mutex port_lock;
+	struct clk *hclk;
+	void __iomem *base;
+	u8 wr_cmd_id;
+	u8 rd_cmd_id;
+	int irq;
+	unsigned int version;
+	int num_din_ports;
+	int num_dout_ports;
+	unsigned long dout_port_mask;
+	unsigned long din_port_mask;
+	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS];
+	struct sdw_stream_runtime *sruntime[SWRM_MAX_DAIS];
+	enum sdw_slave_status status[SDW_MAX_DEVICES];
+	int (*reg_read)(struct qcom_swrm_ctrl *ctrl, int reg, u32 *val);
+	int (*reg_write)(struct qcom_swrm_ctrl *ctrl, int reg, int val);
+};
+
+#define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
+
+static int qcom_swrm_abh_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
+				  u32 *val)
+{
+	struct regmap *wcd_regmap = ctrl->regmap;
+	int ret;
+
+	/* pg register + offset */
+	ret = regmap_bulk_write(wcd_regmap, SWRM_AHB_BRIDGE_RD_ADDR_0,
+			  (u8 *)&reg, 4);
+	if (ret < 0)
+		return SDW_CMD_FAIL;
+
+	ret = regmap_bulk_read(wcd_regmap, SWRM_AHB_BRIDGE_RD_DATA_0,
+			       val, 4);
+	if (ret < 0)
+		return SDW_CMD_FAIL;
+
+	return SDW_CMD_OK;
+}
+
+static int qcom_swrm_mmio_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
+				   u32 *val)
+{
+	*val = readl_relaxed(ctrl->base + reg);
+
+	return 0;
+}
+
+static int qcom_swrm_mmio_reg_write(struct qcom_swrm_ctrl *ctrl,
+				    int reg, int val)
+{
+	writel_relaxed(val, ctrl->base + reg);
+
+	return 0;
+}
+
+static int qcom_swrm_ahb_reg_write(struct qcom_swrm_ctrl *ctrl,
+				   int reg, int val)
+{
+	struct regmap *wcd_regmap = ctrl->regmap;
+	int ret;
+	/* pg register + offset */
+	ret = regmap_bulk_write(wcd_regmap, SWRM_AHB_BRIDGE_WR_DATA_0,
+			  (u8 *)&val, 4);
+	if (ret)
+		return SDW_CMD_FAIL;
+
+	/* write address register */
+	ret = regmap_bulk_write(wcd_regmap, SWRM_AHB_BRIDGE_WR_ADDR_0,
+			  (u8 *)&reg, 4);
+	if (ret)
+		return SDW_CMD_FAIL;
+
+	return SDW_CMD_OK;
+}
+
+static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, u8 cmd_data,
+				     u8 dev_addr, u16 reg_addr)
+{
+	DECLARE_COMPLETION_ONSTACK(comp);
+	unsigned long flags;
+	u32 val;
+	int ret;
+
+	spin_lock_irqsave(&ctrl->comp_lock, flags);
+	ctrl->comp = &comp;
+	spin_unlock_irqrestore(&ctrl->comp_lock, flags);
+	val = SWRM_REG_VAL_PACK(cmd_data, dev_addr,
+				SWRM_SPECIAL_CMD_ID, reg_addr);
+	ret = ctrl->reg_write(ctrl, SWRM_CMD_FIFO_WR_CMD, val);
+	if (ret)
+		goto err;
+
+	ret = wait_for_completion_timeout(ctrl->comp,
+					  msecs_to_jiffies(TIMEOUT_MS));
+
+	if (!ret)
+		ret = SDW_CMD_IGNORED;
+	else
+		ret = SDW_CMD_OK;
+err:
+	spin_lock_irqsave(&ctrl->comp_lock, flags);
+	ctrl->comp = NULL;
+	spin_unlock_irqrestore(&ctrl->comp_lock, flags);
+
+	return ret;
+}
+
+static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *ctrl,
+				     u8 dev_addr, u16 reg_addr,
+				     u32 len, u8 *rval)
+{
+	int i, ret;
+	u32 val;
+	DECLARE_COMPLETION_ONSTACK(comp);
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctrl->comp_lock, flags);
+	ctrl->comp = &comp;
+	spin_unlock_irqrestore(&ctrl->comp_lock, flags);
+
+	val = SWRM_REG_VAL_PACK(len, dev_addr, SWRM_SPECIAL_CMD_ID, reg_addr);
+	ret = ctrl->reg_write(ctrl, SWRM_CMD_FIFO_RD_CMD, val);
+	if (ret)
+		goto err;
+
+	ret = wait_for_completion_timeout(ctrl->comp,
+					  msecs_to_jiffies(TIMEOUT_MS));
+
+	if (!ret) {
+		ret = SDW_CMD_IGNORED;
+		goto err;
+	} else {
+		ret = SDW_CMD_OK;
+	}
+
+	for (i = 0; i < len; i++) {
+		ret = ctrl->reg_read(ctrl, SWRM_CMD_FIFO_RD_FIFO_ADDR, &val);
+		if (ret)
+			return ret;
+
+		rval[i] = val & 0xFF;
+	}
+
+err:
+	spin_lock_irqsave(&ctrl->comp_lock, flags);
+	ctrl->comp = NULL;
+	spin_unlock_irqrestore(&ctrl->comp_lock, flags);
+
+	return ret;
+}
+
+static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
+{
+	u32 val;
+	int i;
+
+	ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
+
+	for (i = 0; i < SDW_MAX_DEVICES; i++) {
+		u32 s;
+
+		s = (val >> (i * 2));
+		s &= SWRM_MCP_SLV_STATUS_MASK;
+		ctrl->status[i] = s;
+	}
+}
+
+static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
+{
+	struct qcom_swrm_ctrl *ctrl = dev_id;
+	u32 sts, value;
+	unsigned long flags;
+
+	ctrl->reg_read(ctrl, SWRM_INTERRUPT_STATUS, &sts);
+
+	if (sts & SWRM_INTERRUPT_STATUS_CMD_ERROR) {
+		ctrl->reg_read(ctrl, SWRM_CMD_FIFO_STATUS, &value);
+		dev_err_ratelimited(ctrl->dev,
+				    "CMD error, fifo status 0x%x\n",
+				     value);
+		ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CMD, 0x1);
+	}
+
+	if ((sts & SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED) ||
+	    sts & SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS)
+		schedule_work(&ctrl->slave_work);
+
+	ctrl->reg_write(ctrl, SWRM_INTERRUPT_CLEAR, sts);
+
+	if (sts & SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED) {
+		spin_lock_irqsave(&ctrl->comp_lock, flags);
+		if (ctrl->comp)
+			complete(ctrl->comp);
+		spin_unlock_irqrestore(&ctrl->comp_lock, flags);
+	}
+
+	return IRQ_HANDLED;
+}
+static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
+{
+	u32 val;
+
+	/* Clear Rows and Cols */
+	val = (SWRM_MAX_ROW_VAL << SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT |
+	       SWRM_MIN_COL_VAL << SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT);
+
+	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
+
+	/* Disable Auto enumeration */
+	ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 0);
+
+	/* Mask soundwire interrupts */
+	ctrl->reg_write(ctrl, SWRM_INTERRUPT_MASK_ADDR,
+			SWRM_INTERRUPT_STATUS_RMSK);
+
+	/* Configure No pings */
+	ctrl->reg_read(ctrl, SWRM_MCP_CFG_ADDR, &val);
+	val &= ~SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK;
+	val |= (SWRM_DEF_CMD_NO_PINGS <<
+		SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_SHFT);
+	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
+
+	/* Configure number of retries of a read/write cmd */
+	ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CFG_ADDR, SWRM_RD_WR_CMD_RETRIES);
+
+	/* Set IRQ to PULSE */
+	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
+			SWRM_COMP_CFG_IRQ_LEVEL_OR_PULSE_MSK |
+			SWRM_COMP_CFG_ENABLE_MSK);
+	return 0;
+}
+
+static enum sdw_command_response qcom_swrm_xfer_msg(struct sdw_bus *bus,
+						    struct sdw_msg *msg)
+{
+	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
+	int ret, i, len;
+
+	if (msg->flags == SDW_MSG_FLAG_READ) {
+		for (i = 0; i < msg->len;) {
+			if ((msg->len - i) < QCOM_SWRM_MAX_RD_LEN)
+				len = msg->len - i;
+			else
+				len = QCOM_SWRM_MAX_RD_LEN;
+
+			ret = qcom_swrm_cmd_fifo_rd_cmd(ctrl, msg->dev_num,
+							msg->addr + i, len,
+						       &msg->buf[i]);
+			if (ret)
+				return ret;
+
+			i = i + len;
+		}
+	} else if (msg->flags == SDW_MSG_FLAG_WRITE) {
+		for (i = 0; i < msg->len; i++) {
+			ret = qcom_swrm_cmd_fifo_wr_cmd(ctrl, msg->buf[i],
+							msg->dev_num,
+						       msg->addr + i);
+			if (ret)
+				return SDW_CMD_IGNORED;
+		}
+	}
+
+	return SDW_CMD_OK;
+}
+
+static int qcom_swrm_pre_bank_switch(struct sdw_bus *bus)
+{
+	u32 reg = SWRM_MCP_FRAME_CTRL_BANK_ADDR(bus->params.next_bank);
+	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
+	u32 val;
+	int ret;
+
+	ret = ctrl->reg_read(ctrl, reg, &val);
+	if (ret)
+		return ret;
+
+	val &= ~SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK;
+	val &= ~SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_BMSK;
+
+	val |= (SWRM_MAX_ROW_VAL << SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT |
+		SWRM_MAX_COL_VAL << SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT);
+
+	return ctrl->reg_write(ctrl, reg, val);
+}
+
+static int qcom_swrm_port_params(struct sdw_bus *bus,
+				 struct sdw_port_params *p_params,
+				 unsigned int bank)
+{
+	/* TBD */
+	return 0;
+}
+
+static int qcom_swrm_transport_params(struct sdw_bus *bus,
+				      struct sdw_transport_params *params,
+				      enum sdw_reg_bank bank)
+{
+	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
+	u32 value;
+
+	value = params->offset1 << SWRM_DP_PORT_CTRL_OFFSET1_SHFT;
+	value |= params->offset2 << SWRM_DP_PORT_CTRL_OFFSET2_SHFT;
+	value |= params->sample_interval - 1;
+
+	return ctrl->reg_write(ctrl,
+			       SWRM_DP_PORT_CTRL_BANK((params->port_num), bank),
+			       value);
+}
+
+static int qcom_swrm_port_enable(struct sdw_bus *bus,
+				 struct sdw_enable_ch *enable_ch,
+				 unsigned int bank)
+{
+	u32 reg = SWRM_DP_PORT_CTRL_BANK(enable_ch->port_num, bank);
+	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
+	u32 val;
+	int ret;
+
+	ret = ctrl->reg_read(ctrl, reg, &val);
+	if (ret)
+		return ret;
+
+	if (enable_ch->enable)
+		val |= (enable_ch->ch_mask << SWRM_DP_PORT_CTRL_EN_CHAN_SHFT);
+	else
+		val &= ~(enable_ch->ch_mask << SWRM_DP_PORT_CTRL_EN_CHAN_SHFT);
+
+	return ctrl->reg_write(ctrl, reg, val);
+}
+
+static struct sdw_master_port_ops qcom_swrm_port_ops = {
+	.dpn_set_port_params = qcom_swrm_port_params,
+	.dpn_set_port_transport_params = qcom_swrm_transport_params,
+	.dpn_port_enable_ch = qcom_swrm_port_enable,
+};
+
+static struct sdw_master_ops qcom_swrm_ops = {
+	.xfer_msg = qcom_swrm_xfer_msg,
+	.pre_bank_switch = qcom_swrm_pre_bank_switch,
+};
+
+static int qcom_swrm_compute_params(struct sdw_bus *bus)
+{
+	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
+	struct sdw_master_runtime *m_rt;
+	struct sdw_slave_runtime *s_rt;
+	struct sdw_port_runtime *p_rt;
+	struct qcom_swrm_port_config *pcfg;
+	int i = 0;
+
+	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
+		list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
+			pcfg = &ctrl->pconfig[p_rt->num - 1];
+			p_rt->transport_params.port_num = p_rt->num;
+			p_rt->transport_params.sample_interval = pcfg->si + 1;
+			p_rt->transport_params.offset1 = pcfg->off1;
+			p_rt->transport_params.offset2 = pcfg->off2;
+		}
+
+		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
+			list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
+				pcfg = &ctrl->pconfig[i];
+				p_rt->transport_params.port_num = p_rt->num;
+				p_rt->transport_params.sample_interval =
+					pcfg->si + 1;
+				p_rt->transport_params.offset1 = pcfg->off1;
+				p_rt->transport_params.offset2 = pcfg->off2;
+				i++;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static u32 qcom_swrm_freq_tbl[MAX_FREQ_NUM] = {
+	DEFAULT_CLK_FREQ,
+};
+
+static void qcom_swrm_slave_wq(struct work_struct *work)
+{
+	struct qcom_swrm_ctrl *ctrl =
+			container_of(work, struct qcom_swrm_ctrl, slave_work);
+
+	qcom_swrm_get_device_status(ctrl);
+	sdw_handle_slave_status(&ctrl->bus, ctrl->status);
+}
+
+static int qcom_swrm_prepare(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai)
+{
+	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
+
+	if (!ctrl->sruntime[dai->id])
+		return -EINVAL;
+
+	return sdw_enable_stream(ctrl->sruntime[dai->id]);
+}
+
+static void qcom_swrm_stream_free_ports(struct qcom_swrm_ctrl *ctrl,
+					struct sdw_stream_runtime *stream)
+{
+	struct sdw_master_runtime *m_rt;
+	struct sdw_port_runtime *p_rt;
+	unsigned long *port_mask;
+
+	mutex_lock(&ctrl->port_lock);
+
+	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
+		if (m_rt->direction == SDW_DATA_DIR_RX)
+			port_mask = &ctrl->dout_port_mask;
+		else
+			port_mask = &ctrl->din_port_mask;
+
+		list_for_each_entry(p_rt, &m_rt->port_list, port_node)
+			clear_bit(p_rt->num - 1, port_mask);
+	}
+
+	mutex_unlock(&ctrl->port_lock);
+}
+
+static int qcom_swrm_stream_alloc_ports(struct qcom_swrm_ctrl *ctrl,
+					struct sdw_stream_runtime *stream,
+				       struct snd_pcm_hw_params *params,
+				       int direction)
+{
+	struct sdw_port_config pconfig[QCOM_SDW_MAX_PORTS];
+	struct sdw_stream_config sconfig;
+	struct sdw_master_runtime *m_rt;
+	struct sdw_slave_runtime *s_rt;
+	struct sdw_port_runtime *p_rt;
+	unsigned long *port_mask;
+	int i, maxport, pn, nports = 0, ret = 0;
+
+	mutex_lock(&ctrl->port_lock);
+	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
+		if (m_rt->direction == SDW_DATA_DIR_RX) {
+			maxport = ctrl->num_dout_ports;
+			port_mask = &ctrl->dout_port_mask;
+		} else {
+			maxport = ctrl->num_din_ports;
+			port_mask = &ctrl->din_port_mask;
+		}
+
+		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
+			list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
+				/* Port numbers start from 1 - 14*/
+				pn = find_first_zero_bit(port_mask, maxport);
+				if (pn > (maxport - 1)) {
+					dev_err(ctrl->dev, "All ports busy\n");
+					ret = -EBUSY;
+					goto err;
+				}
+				set_bit(pn, port_mask);
+				pconfig[nports].num = pn + 1;
+				pconfig[nports].ch_mask = p_rt->ch_mask;
+				nports++;
+			}
+		}
+	}
+
+	if (direction == SNDRV_PCM_STREAM_CAPTURE)
+		sconfig.direction = SDW_DATA_DIR_TX;
+	else
+		sconfig.direction = SDW_DATA_DIR_RX;
+
+	sconfig.ch_count = 1;
+	sconfig.frame_rate = params_rate(params);
+	sconfig.type = stream->type;
+	sconfig.bps = 1;
+	sdw_stream_add_master(&ctrl->bus, &sconfig, pconfig,
+			      nports, stream);
+err:
+	if (ret) {
+		for (i = 0; i < nports; i++)
+			clear_bit(pconfig[i].num - 1, port_mask);
+	}
+
+	mutex_unlock(&ctrl->port_lock);
+
+	return ret;
+}
+
+static int qcom_swrm_hw_params(struct snd_pcm_substream *substream,
+			       struct snd_pcm_hw_params *params,
+			      struct snd_soc_dai *dai)
+{
+	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
+	struct sdw_stream_runtime *sruntime = ctrl->sruntime[dai->id];
+	int ret;
+
+	ret = qcom_swrm_stream_alloc_ports(ctrl, sruntime, params,
+					   substream->stream);
+	if (ret)
+		return ret;
+
+	ret = sdw_prepare_stream(sruntime);
+	if (ret)
+		qcom_swrm_stream_free_ports(ctrl, sruntime);
+
+	return ret;
+}
+
+static int qcom_swrm_hw_free(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai)
+{
+	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
+	struct sdw_stream_runtime *sruntime = ctrl->sruntime[dai->id];
+
+	qcom_swrm_stream_free_ports(ctrl, sruntime);
+	sdw_stream_remove_master(&ctrl->bus, sruntime);
+	sdw_deprepare_stream(sruntime);
+	sdw_disable_stream(sruntime);
+
+	return 0;
+}
+
+static void *qcom_pdm_get_sdw_stream(struct snd_soc_dai *dai,
+				     int direction)
+{
+	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
+
+	return ctrl->sruntime[dai->id];
+}
+
+static int qcom_swrm_startup(struct snd_pcm_substream *stream,
+			     struct snd_soc_dai *dai)
+{
+	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
+	struct sdw_stream_runtime *sruntime;
+
+	sruntime = sdw_alloc_stream(dai->name);
+	if (!sruntime)
+		return -ENOMEM;
+
+	ctrl->sruntime[dai->id] = sruntime;
+
+	return 0;
+}
+
+static void qcom_swrm_shutdown(struct snd_pcm_substream *stream,
+			       struct snd_soc_dai *dai)
+{
+	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
+
+	sdw_release_stream(ctrl->sruntime[dai->id]);
+	ctrl->sruntime[dai->id] = NULL;
+}
+
+static const struct snd_soc_dai_ops qcom_swrm_pdm_dai_ops = {
+	.hw_params = qcom_swrm_hw_params,
+	.prepare = qcom_swrm_prepare,
+	.hw_free = qcom_swrm_hw_free,
+	.startup = qcom_swrm_startup,
+	.shutdown = qcom_swrm_shutdown,
+	.get_sdw_stream = qcom_pdm_get_sdw_stream,
+};
+
+static const struct snd_soc_component_driver qcom_swrm_dai_component = {
+	.name           = "soundwire",
+};
+
+static int qcom_swrm_register_dais(struct qcom_swrm_ctrl *ctrl)
+{
+	int num_dais = ctrl->num_dout_ports + ctrl->num_din_ports;
+	struct snd_soc_dai_driver *dais;
+	struct snd_soc_pcm_stream *stream;
+	struct device *dev = ctrl->dev;
+	int i;
+
+	/* PDM dais are only tested for now */
+	dais = devm_kcalloc(dev, num_dais, sizeof(*dais), GFP_KERNEL);
+	if (!dais)
+		return -ENOMEM;
+
+	for (i = 0; i < num_dais; i++) {
+		dais[i].name = devm_kasprintf(dev, GFP_KERNEL, "SDW Pin%d", i);
+		if (!dais[i].name)
+			return -ENOMEM;
+
+		if (i < ctrl->num_dout_ports) {
+			stream = &dais[i].playback;
+			stream->stream_name = devm_kasprintf(dev, GFP_KERNEL,
+							     "SDW Tx%d", i);
+		} else {
+			stream = &dais[i].capture;
+			stream->stream_name = devm_kasprintf(dev, GFP_KERNEL,
+							     "SDW Rx%d", i);
+		}
+
+		if (!stream->stream_name)
+			return -ENOMEM;
+
+		stream->channels_min = 1;
+		stream->channels_max = 1;
+		stream->rates = SNDRV_PCM_RATE_48000;
+		stream->formats = SNDRV_PCM_FMTBIT_S16_LE;
+
+		dais[i].ops = &qcom_swrm_pdm_dai_ops;
+		dais[i].id = i;
+	}
+
+	return devm_snd_soc_register_component(dev, &qcom_swrm_dai_component,
+					       dais, num_dais);
+}
+
+static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
+{
+	struct device_node *np = ctrl->dev->of_node;
+	u8 off1[QCOM_SDW_MAX_PORTS];
+	u8 off2[QCOM_SDW_MAX_PORTS];
+	u8 si[QCOM_SDW_MAX_PORTS];
+	int i, ret, nports, val;
+
+	ret = ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
+	if (ret)
+		return ret;
+
+	ctrl->num_dout_ports = val & SWRM_COMP_PARAMS_DOUT_PORTS_MASK;
+	ctrl->num_din_ports = (val & SWRM_COMP_PARAMS_DIN_PORTS_MASK) >> 5;
+
+	ret = of_property_read_u32(np, "qcom,din-ports", &val);
+	if (ret)
+		return ret;
+
+	if (val > ctrl->num_din_ports)
+		return -EINVAL;
+
+	ctrl->num_din_ports = val;
+
+	ret = of_property_read_u32(np, "qcom,dout-ports", &val);
+	if (ret)
+		return ret;
+
+	if (val > ctrl->num_dout_ports)
+		return -EINVAL;
+
+	ctrl->num_dout_ports = val;
+
+	nports = ctrl->num_dout_ports + ctrl->num_din_ports;
+
+	ret = of_property_read_u8_array(np, "qcom,ports-offset1",
+					off1, nports);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u8_array(np, "qcom,ports-offset2",
+					off2, nports);
+	if (ret)
+		return ret;
+
+	ret = of_property_read_u8_array(np, "qcom,ports-sinterval-low",
+					si, nports);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < nports; i++) {
+		ctrl->pconfig[i].si = si[i];
+		ctrl->pconfig[i].off1 = off1[i];
+		ctrl->pconfig[i].off2 = off2[i];
+	}
+
+	return 0;
+}
+
+static int qcom_swrm_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sdw_master_prop *prop;
+	struct sdw_bus_params *params;
+	struct qcom_swrm_ctrl *ctrl;
+	struct resource *res;
+	int ret;
+	u32 val;
+
+	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
+	if (dev->parent->bus == &slimbus_bus) {
+		ctrl->reg_read = qcom_swrm_abh_reg_read;
+		ctrl->reg_write = qcom_swrm_ahb_reg_write;
+		ctrl->regmap = dev_get_regmap(dev->parent, NULL);
+		if (!ctrl->regmap)
+			return -EINVAL;
+	} else {
+		ctrl->reg_read = qcom_swrm_mmio_reg_read;
+		ctrl->reg_write = qcom_swrm_mmio_reg_write;
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		ctrl->base = devm_ioremap_resource(dev, res);
+		if (IS_ERR(ctrl->base))
+			return PTR_ERR(ctrl->base);
+	}
+
+	ctrl->irq = of_irq_get(dev->of_node, 0);
+	if (ctrl->irq < 0)
+		return ctrl->irq;
+
+	ctrl->hclk = devm_clk_get(dev, "iface");
+	if (IS_ERR(ctrl->hclk))
+		return PTR_ERR(ctrl->hclk);
+
+	clk_prepare_enable(ctrl->hclk);
+
+	ctrl->dev = dev;
+	dev_set_drvdata(&pdev->dev, ctrl);
+	spin_lock_init(&ctrl->comp_lock);
+	mutex_init(&ctrl->port_lock);
+	INIT_WORK(&ctrl->slave_work, qcom_swrm_slave_wq);
+
+	ctrl->bus.dev = dev;
+	ctrl->bus.ops = &qcom_swrm_ops;
+	ctrl->bus.port_ops = &qcom_swrm_port_ops;
+	ctrl->bus.compute_params = &qcom_swrm_compute_params;
+
+	ret = qcom_swrm_get_port_config(ctrl);
+	if (ret)
+		return ret;
+
+	params = &ctrl->bus.params;
+	params->max_dr_freq = DEFAULT_CLK_FREQ;
+	params->curr_dr_freq = DEFAULT_CLK_FREQ;
+	params->col = SWRM_DEFAULT_COL;
+	params->row = SWRM_DEFAULT_ROWS;
+	ctrl->reg_read(ctrl, SWRM_MCP_STATUS, &val);
+	params->curr_bank = val & SWRM_MCP_STATUS_BANK_NUM_MASK;
+	params->next_bank = !params->curr_bank;
+
+	prop = &ctrl->bus.prop;
+	prop->max_clk_freq = DEFAULT_CLK_FREQ;
+	prop->num_clk_gears = 0;
+	prop->num_clk_freq = MAX_FREQ_NUM;
+	prop->clk_freq = &qcom_swrm_freq_tbl[0];
+	prop->default_col = SWRM_DEFAULT_COL;
+	prop->default_row = SWRM_DEFAULT_ROWS;
+
+	ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION, &ctrl->version);
+
+	ret = devm_request_threaded_irq(dev, ctrl->irq, NULL,
+					qcom_swrm_irq_handler,
+					IRQF_TRIGGER_RISING,
+					"soundwire", ctrl);
+	if (ret) {
+		dev_err(dev, "Failed to request soundwire irq\n");
+		goto err;
+	}
+
+	ret = sdw_add_bus_master(&ctrl->bus);
+	if (ret) {
+		dev_err(dev, "Failed to register Soundwire controller (%d)\n",
+			ret);
+		goto err;
+	}
+
+	qcom_swrm_init(ctrl);
+	ret = qcom_swrm_register_dais(ctrl);
+	if (ret)
+		goto err;
+
+	dev_info(dev, "Qualcomm Soundwire controller v%x.%x.%x Registered\n",
+		 (ctrl->version >> 24) & 0xff, (ctrl->version >> 16) & 0xff,
+		 ctrl->version & 0xffff);
+
+	return 0;
+err:
+	clk_disable_unprepare(ctrl->hclk);
+	return ret;
+}
+
+static int qcom_swrm_remove(struct platform_device *pdev)
+{
+	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(&pdev->dev);
+
+	sdw_delete_bus_master(&ctrl->bus);
+	clk_disable_unprepare(ctrl->hclk);
+
+	return 0;
+}
+
+static int qcom_swrm_runtime_suspend(struct device *device)
+{
+	/* TBD */
+	return 0;
+}
+
+static int qcom_swrm_runtime_resume(struct device *device)
+{
+	/* TBD */
+	return 0;
+}
+
+static const struct dev_pm_ops qcom_swrm_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(qcom_swrm_runtime_suspend,
+			   qcom_swrm_runtime_resume,
+			   NULL
+	)
+};
+
+static const struct of_device_id qcom_swrm_of_match[] = {
+	{ .compatible = "qcom,soundwire-v1.3.0",},
+	{ .compatible = "qcom,soundwire-v1.5.0",},
+	{ .compatible = "qcom,soundwire-v1.6.0",},
+	{/* sentinel */},
+};
+
+MODULE_DEVICE_TABLE(of, qcom_swrm_of_match);
+
+static struct platform_driver qcom_swrm_driver = {
+	.probe	= &qcom_swrm_probe,
+	.remove = &qcom_swrm_remove,
+	.driver = {
+		.name	= "qcom-soundwire",
+		.of_match_table = qcom_swrm_of_match,
+		.pm = &qcom_swrm_dev_pm_ops,
+	}
+};
+module_platform_driver(qcom_swrm_driver);
+
+MODULE_DESCRIPTION("Qualcomm soundwire driver");
+MODULE_LICENSE("GPL v2");
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
