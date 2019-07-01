Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED032386B2
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 11:02:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A1CB1614;
	Fri,  7 Jun 2019 11:02:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A1CB1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559898179;
	bh=NR3/TxfoirlTu4Mh6l29IxXyA8oHg/bZgA1pn4fI20g=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iqRdza87uyOcBE8w9HBATjSAX7NXcqHPrBOVxh8SCF++30EI8w7f1tHAKLdHTmB41
	 6as+NJIxgfhSMrIcZaRorEHoaFbtOv2HraBxWU2ellV8daQc6/DzTGP6Uyj2Qq/MWQ
	 6A3nRS+Zyr4Okwf4F49+hptsUGDsinONu25qLI1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83CE0F8974A;
	Fri,  7 Jun 2019 10:57:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19D7CF89731; Fri,  7 Jun 2019 10:57:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B819F8971C
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 10:57:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B819F8971C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="oMmgxmcZ"
Received: by mail-wr1-x443.google.com with SMTP id e16so1345038wrn.1
 for <alsa-devel@alsa-project.org>; Fri, 07 Jun 2019 01:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=68t1WK3+5HfovnyLAr4Pibd0oP5PR9mxzjRIoqG4DTY=;
 b=oMmgxmcZkHc2iDm644wNgPEN1RDNHfCqrA3h6vMlAff4I+J5koSvdXG+1peRdnGwa/
 IDIzeKZ+M8ClmotGF7gKeyE3rSpu56aoYqQL8FqUIhwR1YR6RyBXWUiMGQWeT4kgFw3y
 fo1ing6v7yYfRAkor5x3tO+rGp0wZs7WPX+ELyFLTI5FGAcu4qGBrLO+W6/p/6z0Ci+w
 uNjP/ax1fTK5+Sm3LnnFSVwzZ9Nl9d2QEsQNmMkiRgHq9EFlR/3EyrTexzP+c8EJSBWb
 /hLcMSwt4tBh+dML4VE5wMl7jvlxB5PJ2xciO24r/hUULh5J52K/w0FlYpJ/iivQVubb
 Kiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=68t1WK3+5HfovnyLAr4Pibd0oP5PR9mxzjRIoqG4DTY=;
 b=Q5tuzABwAPXoZdcU/EUj5erwQKWW6WrwjNcR/mAx5emyGybsXV2YzN6j8eYnuaNTXr
 qeJoBnIYROHn1rL4e4qVjID1Q0VURx6nYql+fnRT1/mrRnNMWQ8sAiFCHaEZ38u22q3A
 4rDiacIP+LSSOUxqqFdw0RoNvp5G3V+V1lTjqnpiTmrJ46x98g6fKSvfuwcliSKH6PrK
 CYrgEI6g86zsfb6hfpaU1/4uMfH+DXln0gAtUTGupKDzF73QLsFgPM+46iridIPzGdPo
 6egv/ukrexHc5Jmi5Qs5O+83HJN/u7JUW6UqQF0KNAvy1Orrz7Y/nuQfS2hfEJylZrXw
 ZHqw==
X-Gm-Message-State: APjAAAUD0ahjZqNu7NFaniqtLGRayDCMV1LQzqI8b+7PRPz9oE3rzPVm
 dquyUQ+MJ/PiK+9TZ8lgOFFpuQ==
X-Google-Smtp-Source: APXvYqygSjfRrbuiUHXtV064nRepHnbKUgMTZnIrPoT3aVsSl7lB2SmMCAZXwyvfgKmOoiQKdorCEg==
X-Received: by 2002:adf:e309:: with SMTP id b9mr694983wrj.135.1559897834356;
 Fri, 07 Jun 2019 01:57:14 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id d10sm2035308wrh.91.2019.06.07.01.57.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 07 Jun 2019 01:57:13 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Date: Fri,  7 Jun 2019 09:56:43 +0100
Message-Id: <20190607085643.932-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
References: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [RFC PATCH 6/6] soundwire: qcom: add support for
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
 drivers/soundwire/qcom.c   | 983 +++++++++++++++++++++++++++++++++++++
 3 files changed, 996 insertions(+)
 create mode 100644 drivers/soundwire/qcom.c

diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
index 53b55b79c4af..f44d4f36dbbb 100644
--- a/drivers/soundwire/Kconfig
+++ b/drivers/soundwire/Kconfig
@@ -34,4 +34,13 @@ config SOUNDWIRE_INTEL
 	  enable this config option to get the SoundWire support for that
 	  device.
 
+config SOUNDWIRE_QCOM
+	tristate "Qualcomm SoundWire Master driver"
+	select SOUNDWIRE_BUS
+	depends on SND_SOC
+	help
+	  SoundWire Qualcomm Master driver.
+	  If you have an Qualcomm platform which has a SoundWire Master then
+	  enable this config option to get the SoundWire support for that
+	  device
 endif
diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index 5817beaca0e1..f4ebfde31372 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -16,3 +16,7 @@ obj-$(CONFIG_SOUNDWIRE_INTEL) += soundwire-intel.o
 
 soundwire-intel-init-objs := intel_init.o
 obj-$(CONFIG_SOUNDWIRE_INTEL) += soundwire-intel-init.o
+
+#Qualcomm driver
+soundwire-qcom-objs :=	qcom.o
+obj-$(CONFIG_SOUNDWIRE_QCOM) += soundwire-qcom.o
diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
new file mode 100644
index 000000000000..d1722d44d217
--- /dev/null
+++ b/drivers/soundwire/qcom.c
@@ -0,0 +1,983 @@
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
+#define SWRM_COMP_PARAMS_WR_FIFO_DEPTH				GENMASK(14, 10)
+#define SWRM_COMP_PARAMS_RD_FIFO_DEPTH				GENMASK(19, 15)
+#define SWRM_COMP_PARAMS_AUTO_ENUM_SLAVES			GENMASK(32. 20)
+#define SWRM_INTERRUPT_STATUS					0x200
+#define SWRM_INTERRUPT_STATUS_RMSK				GENMASK(16, 0)
+#define SWRM_INTERRUPT_STATUS_SLAVE_PEND_IRQ			BIT(0)
+#define SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED		BIT(1)
+#define SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS		BIT(2)
+#define SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET			BIT(3)
+#define SWRM_INTERRUPT_STATUS_RD_FIFO_OVERFLOW			BIT(4)
+#define SWRM_INTERRUPT_STATUS_RD_FIFO_UNDERFLOW			BIT(5)
+#define SWRM_INTERRUPT_STATUS_WR_CMD_FIFO_OVERFLOW		BIT(6)
+#define SWRM_INTERRUPT_STATUS_CMD_ERROR				BIT(7)
+#define SWRM_INTERRUPT_STATUS_DOUT_PORT_COLLISION		BIT(8)
+#define SWRM_INTERRUPT_STATUS_READ_EN_RD_VALID_MISMATCH		BIT(9)
+#define SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED		BIT(10)
+#define SWRM_INTERRUPT_STATUS_NEW_SLAVE_AUTO_ENUM_FINISHED	BIT(11)
+#define SWRM_INTERRUPT_STATUS_AUTO_ENUM_FAILED			BIT(12)
+#define SWRM_INTERRUPT_STATUS_AUTO_ENUM_TABLE_IS_FULL		BIT(13)
+#define SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED		BIT(14)
+#define SWRM_INTERRUPT_STATUS_CLK_STOP_FINISHED			BIT(15)
+#define SWRM_INTERRUPT_STATUS_ERROR_PORT_TEST			BIT(16)
+#define SWRM_INTERRUPT_MASK_ADDR				0x204
+#define SWRM_INTERRUPT_CLEAR					0x208
+#define SWRM_CMD_FIFO_WR_CMD					0x300
+#define SWRM_CMD_FIFO_RD_CMD					0x304
+#define SWRM_CMD_FIFO_CMD					0x308
+#define SWRM_CMD_FIFO_STATUS					0x30C
+#define SWRM_CMD_FIFO_CFG_ADDR					0x314
+#define SWRM_CMD_FIFO_CFG_NUM_OF_CMD_RETRY_SHFT			0x0
+#define SWRM_CMD_FIFO_RD_FIFO_ADDR				0x318
+#define SWRM_ENUMERATOR_CFG_ADDR				0x500
+#define SWRM_MCP_FRAME_CTRL_BANK_ADDR(m)		(0x101C + 0x40 * (m))
+#define SWRM_MCP_FRAME_CTRL_BANK_SSP_PERIOD_SHFT		16
+#define SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT			3
+#define SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_BMSK			GENMASK(2, 0)
+#define SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT			0
+#define SWRM_MCP_CFG_ADDR					0x1048
+#define SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK		GENMASK(21, 17)
+#define SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_SHFT		0x11
+#define SWRM_MCP_STATUS						0x104C
+#define SWRM_MCP_STATUS_BANK_NUM_MASK				BIT(0)
+#define SWRM_MCP_SLV_STATUS					0x1090
+#define SWRM_MCP_SLV_STATUS_MASK				GENMASK(1, 0)
+#define SWRM_DP_PORT_CTRL_BANK(n, m)	(0x1124 + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_DP_PORT_CTRL2_BANK(n, m)	(0x1126 + 0x100 * (n - 1) + 0x40 * m)
+#define SWRM_DP_PORT_CTRL_EN_CHAN_SHFT				0x18
+#define SWRM_DP_PORT_CTRL_OFFSET2_SHFT				0x10
+#define SWRM_DP_PORT_CTRL_OFFSET1_SHFT				0x08
+#define SWRM_AHB_BRIDGE_WR_DATA_0				0xc885
+#define SWRM_AHB_BRIDGE_WR_ADDR_0				0xc889
+#define SWRM_AHB_BRIDGE_RD_ADDR_0				0xc88d
+#define SWRM_AHB_BRIDGE_RD_DATA_0				0xc891
+
+#define SWRM_REG_VAL_PACK(data, dev, id, reg)	\
+			((reg) | ((id) << 16) | ((dev) << 20) | ((data) << 24))
+
+#define SWRM_MAX_ROW_VAL	0 /* Rows = 48 */
+#define SWRM_DEFAULT_ROWS	48
+#define SWRM_MIN_COL_VAL	0 /* Cols = 2 */
+#define SWRM_DEFAULT_COL	16
+#define SWRM_SPECIAL_CMD_ID	0xF
+#define MAX_FREQ_NUM		1
+#define TIMEOUT_MS		1000
+#define QCOM_SWRM_MAX_RD_LEN	0xf
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
+	struct completion sp_cmd_comp;
+	struct work_struct slave_work;
+	/* read/write lock */
+	struct mutex lock;
+	/* Port alloc/free lock */
+	struct mutex port_lock;
+	struct clk *hclk;
+	int fifo_status;
+	void __iomem *base;
+	u8 wr_cmd_id;
+	u8 rd_cmd_id;
+	int irq;
+	unsigned int version;
+	int num_din_ports;
+	int num_dout_ports;
+	unsigned long dout_port_mask;
+	unsigned long din_port_mask;
+	struct qcom_swrm_port_config pconfig[SDW_MAX_PORTS];
+	struct sdw_stream_runtime *sruntime[SWRM_MAX_DAIS];
+	enum sdw_slave_status status[SDW_MAX_DEVICES];
+	u32 (*reg_read)(struct qcom_swrm_ctrl *ctrl, int reg);
+	int (*reg_write)(struct qcom_swrm_ctrl *ctrl, int reg, int val);
+};
+
+#define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
+
+struct usecase {
+	u8 num_port;
+	u8 num_ch;
+	u32 chrate;
+};
+
+static u32 qcom_swrm_slim_reg_read(struct qcom_swrm_ctrl *ctrl, int reg)
+{
+	struct regmap *wcd_regmap = ctrl->regmap;
+	u32 val = 0, ret;
+
+	/* pg register + offset */
+	regmap_bulk_write(wcd_regmap, SWRM_AHB_BRIDGE_RD_ADDR_0,
+			  (u8 *)&reg, 4);
+
+	ret = regmap_bulk_read(wcd_regmap, SWRM_AHB_BRIDGE_RD_DATA_0,
+			       (u8 *)&val, 4);
+	if (ret < 0)
+		dev_err(ctrl->dev, "Read Failure (%d)\n", ret);
+
+	return val;
+}
+
+static u32 qcom_swrm_mmio_reg_read(struct qcom_swrm_ctrl *ctrl, int reg)
+{
+	return readl_relaxed(ctrl->base + reg);
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
+static int qcom_swrm_slim_reg_write(struct qcom_swrm_ctrl *ctrl,
+				    int reg, int val)
+{
+	struct regmap *wcd_regmap = ctrl->regmap;
+
+	/* pg register + offset */
+	regmap_bulk_write(wcd_regmap, SWRM_AHB_BRIDGE_WR_DATA_0,
+			  (u8 *)&val, 4);
+	/* write address register */
+	regmap_bulk_write(wcd_regmap, SWRM_AHB_BRIDGE_WR_ADDR_0,
+			  (u8 *)&reg, 4);
+
+	return 0;
+}
+
+static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, u8 cmd_data,
+				     u8 dev_addr, u16 reg_addr)
+{
+	int ret = 0;
+	u8 cmd_id;
+	u32 val;
+
+	mutex_lock(&ctrl->lock);
+	if (dev_addr == SDW_BROADCAST_DEV_NUM) {
+		cmd_id = SWRM_SPECIAL_CMD_ID;
+	} else {
+		if (++ctrl->wr_cmd_id == SWRM_SPECIAL_CMD_ID)
+			ctrl->wr_cmd_id = 0;
+
+		cmd_id = ctrl->wr_cmd_id;
+	}
+
+	val = SWRM_REG_VAL_PACK(cmd_data, dev_addr, cmd_id, reg_addr);
+	ret = ctrl->reg_write(ctrl, SWRM_CMD_FIFO_WR_CMD, val);
+	if (ret < 0) {
+		dev_err(ctrl->dev, "%s: reg 0x%x write failed, err:%d\n",
+			__func__, val, ret);
+		goto err;
+	}
+
+	if (dev_addr == SDW_BROADCAST_DEV_NUM) {
+		ctrl->fifo_status = 0;
+		ret = wait_for_completion_timeout(&ctrl->sp_cmd_comp,
+						  msecs_to_jiffies(TIMEOUT_MS));
+
+		if (!ret || ctrl->fifo_status) {
+			dev_err(ctrl->dev, "reg 0x%x write failed\n", val);
+			ret = -ENODATA;
+			goto err;
+		}
+	}
+err:
+	mutex_unlock(&ctrl->lock);
+	return ret;
+}
+
+static int qcom_swrm_cmd_fifo_rd_cmd(struct qcom_swrm_ctrl *ctrl,
+				     u8 dev_addr, u16 reg_addr,
+				     u32 len, u8 *rval)
+{
+	int i, ret = 0;
+	u8 cmd_id = 0;
+	u32 val;
+
+	mutex_lock(&ctrl->lock);
+	if (dev_addr == SDW_ENUM_DEV_NUM) {
+		cmd_id = SWRM_SPECIAL_CMD_ID;
+	} else {
+		if (++ctrl->rd_cmd_id == SWRM_SPECIAL_CMD_ID)
+			ctrl->rd_cmd_id = 0;
+
+		cmd_id = ctrl->rd_cmd_id;
+	}
+
+	val = SWRM_REG_VAL_PACK(len, dev_addr, cmd_id, reg_addr);
+	ret = ctrl->reg_write(ctrl, SWRM_CMD_FIFO_RD_CMD, val);
+	if (ret < 0) {
+		dev_err(ctrl->dev, "reg 0x%x write failed err:%d\n", val, ret);
+		goto err;
+	}
+
+	if (dev_addr == SDW_ENUM_DEV_NUM) {
+		ctrl->fifo_status = 0;
+		ret = wait_for_completion_timeout(&ctrl->sp_cmd_comp,
+						  msecs_to_jiffies(TIMEOUT_MS));
+
+		if (!ret || ctrl->fifo_status) {
+			dev_err(ctrl->dev, "reg 0x%x read failed\n", val);
+			ret = -ENODATA;
+			goto err;
+		}
+	}
+
+	for (i = 0; i < len; i++) {
+		rval[i] = ctrl->reg_read(ctrl, SWRM_CMD_FIFO_RD_FIFO_ADDR);
+		rval[i] &= 0xFF;
+	}
+
+err:
+	mutex_unlock(&ctrl->lock);
+	return ret;
+}
+
+static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
+{
+	u32 val = ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS);
+	int i;
+
+	for (i = 1; i < SDW_MAX_DEVICES; i++) {
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
+
+	sts = ctrl->reg_read(ctrl, SWRM_INTERRUPT_STATUS);
+
+	if (sts & SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED)
+		complete(&ctrl->sp_cmd_comp);
+
+	if (sts & SWRM_INTERRUPT_STATUS_CMD_ERROR) {
+		value = ctrl->reg_read(ctrl, SWRM_CMD_FIFO_STATUS);
+		dev_err_ratelimited(ctrl->dev,
+				    "CMD error, fifo status 0x%x\n",
+				     value);
+		ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CMD, 0x1);
+		if ((value & 0xF) == 0xF) {
+			ctrl->fifo_status = -ENODATA;
+			complete(&ctrl->sp_cmd_comp);
+		}
+	}
+
+	if ((sts & SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED) ||
+	    sts & SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS) {
+		if (sts & SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED)
+			ctrl->status[0] = SDW_SLAVE_ATTACHED;
+
+		schedule_work(&ctrl->slave_work);
+	}
+
+	if (sts & SWRM_INTERRUPT_STATUS_SLAVE_PEND_IRQ)
+		dev_dbg(ctrl->dev, "Slave pend irq\n");
+
+	if (sts & SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED)
+		dev_dbg(ctrl->dev, "New slave attached\n");
+
+	if (sts & SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET)
+		dev_err_ratelimited(ctrl->dev, "Bus clash detected\n");
+
+	if (sts & SWRM_INTERRUPT_STATUS_RD_FIFO_OVERFLOW)
+		dev_err(ctrl->dev, "Read FIFO overflow\n");
+
+	if (sts & SWRM_INTERRUPT_STATUS_RD_FIFO_UNDERFLOW)
+		dev_err(ctrl->dev, "Read FIFO underflow\n");
+
+	if (sts & SWRM_INTERRUPT_STATUS_WR_CMD_FIFO_OVERFLOW)
+		dev_err(ctrl->dev, "Write FIFO overflow\n");
+
+	if (sts & SWRM_INTERRUPT_STATUS_DOUT_PORT_COLLISION)
+		dev_err(ctrl->dev, "Port collision detected\n");
+
+	if (sts & SWRM_INTERRUPT_STATUS_READ_EN_RD_VALID_MISMATCH)
+		dev_err(ctrl->dev, "Read enable valid mismatch\n");
+
+	if (sts & SWRM_INTERRUPT_STATUS_SPECIAL_CMD_ID_FINISHED)
+		dev_err(ctrl->dev, "Cmd id finished\n");
+
+	if (sts & SWRM_INTERRUPT_STATUS_BUS_RESET_FINISHED)
+		dev_err(ctrl->dev, "Bus reset finished\n");
+
+	ctrl->reg_write(ctrl, SWRM_INTERRUPT_CLEAR, sts);
+
+	return IRQ_HANDLED;
+}
+
+static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
+{
+	u32 val;
+	u8 row_ctrl = SWRM_MAX_ROW_VAL;
+	u8 col_ctrl = SWRM_MIN_COL_VAL;
+	u8 ssp_period = 1;
+	u8 retry_cmd_num = 3;
+
+	/* Clear Rows and Cols */
+	val = ((row_ctrl << SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT) |
+		(col_ctrl << SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT) |
+		(ssp_period << SWRM_MCP_FRAME_CTRL_BANK_SSP_PERIOD_SHFT));
+
+	ctrl->reg_write(ctrl, SWRM_MCP_FRAME_CTRL_BANK_ADDR(0), val);
+
+	/* Disable Auto enumeration */
+	ctrl->reg_write(ctrl, SWRM_ENUMERATOR_CFG_ADDR, 0);
+
+	/* Mask soundwire interrupts */
+	ctrl->reg_write(ctrl, SWRM_INTERRUPT_MASK_ADDR,
+					SWRM_INTERRUPT_STATUS_RMSK);
+
+	/* Configure No pings */
+	val = ctrl->reg_read(ctrl, SWRM_MCP_CFG_ADDR);
+
+	val &= ~SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_BMSK;
+	val |= (0x1f << SWRM_MCP_CFG_MAX_NUM_OF_CMD_NO_PINGS_SHFT);
+	ctrl->reg_write(ctrl, SWRM_MCP_CFG_ADDR, val);
+
+	/* Configure number of retries of a read/write cmd */
+	val = (retry_cmd_num << SWRM_CMD_FIFO_CFG_NUM_OF_CMD_RETRY_SHFT);
+	ctrl->reg_write(ctrl, SWRM_CMD_FIFO_CFG_ADDR, val);
+
+	/* Set IRQ to PULSE */
+	ctrl->reg_write(ctrl, SWRM_COMP_CFG_ADDR,
+				SWRM_COMP_CFG_IRQ_LEVEL_OR_PULSE_MSK |
+				SWRM_COMP_CFG_ENABLE_MSK);
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
+			if (ret < 0) {
+				if (ret == -ENODATA)
+					return SDW_CMD_IGNORED;
+
+				return ret;
+			}
+
+			i = i + len;
+		}
+	} else if (msg->flags == SDW_MSG_FLAG_WRITE) {
+		for (i = 0; i < msg->len; i++) {
+			ret = qcom_swrm_cmd_fifo_wr_cmd(ctrl, msg->buf[i],
+							msg->dev_num,
+						       msg->addr + i);
+			if (ret < 0) {
+				if (ret == -ENODATA)
+					return SDW_CMD_IGNORED;
+
+				return ret;
+			}
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
+
+	val = ctrl->reg_read(ctrl, reg);
+	val |= ((0 << SWRM_MCP_FRAME_CTRL_BANK_ROW_CTRL_SHFT) |
+		(7l << SWRM_MCP_FRAME_CTRL_BANK_COL_CTRL_SHFT));
+	ctrl->reg_write(ctrl, reg, val);
+
+	return 0;
+}
+
+static int qcom_swrm_port_params(struct sdw_bus *bus,
+				 struct sdw_port_params *p_params,
+				unsigned int bank)
+{
+	/* TBD */
+	return 0;
+}
+
+static int qcom_swrm_transport_params(struct sdw_bus *bus,
+				      struct sdw_transport_params *params,
+				     enum sdw_reg_bank bank)
+{
+	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
+	u32 value;
+
+	value = params->offset1 << SWRM_DP_PORT_CTRL_OFFSET1_SHFT;
+	value |= params->offset2 << SWRM_DP_PORT_CTRL_OFFSET2_SHFT;
+	value |= params->sample_interval - 1;
+
+	ctrl->reg_write(ctrl, SWRM_DP_PORT_CTRL_BANK((params->port_num), bank),
+			value);
+
+	return 0;
+}
+
+static int qcom_swrm_port_enable(struct sdw_bus *bus,
+				 struct sdw_enable_ch *enable_ch,
+				unsigned int bank)
+{
+	u32 reg = SWRM_DP_PORT_CTRL_BANK(enable_ch->port_num, bank);
+	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
+	u32 val;
+
+	val = ctrl->reg_read(ctrl, reg);
+	if (enable_ch->enable)
+		val |= (enable_ch->ch_mask << SWRM_DP_PORT_CTRL_EN_CHAN_SHFT);
+	else
+		val &= ~(enable_ch->ch_mask << SWRM_DP_PORT_CTRL_EN_CHAN_SHFT);
+
+	ctrl->reg_write(ctrl, reg, val);
+
+	return 0;
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
+	int i = 0;
+
+	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
+		list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
+			p_rt->transport_params.port_num = p_rt->num;
+			p_rt->transport_params.sample_interval =
+					ctrl->pconfig[p_rt->num - 1].si + 1;
+			p_rt->transport_params.offset1 =
+					ctrl->pconfig[p_rt->num - 1].off1;
+			p_rt->transport_params.offset2 =
+					ctrl->pconfig[p_rt->num - 1].off2;
+		}
+
+		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
+			list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
+				p_rt->transport_params.port_num = p_rt->num;
+				p_rt->transport_params.sample_interval =
+						ctrl->pconfig[i].si + 1;
+				p_rt->transport_params.offset1 =
+						ctrl->pconfig[i].off1;
+				p_rt->transport_params.offset2 =
+						ctrl->pconfig[i].off2;
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
+		list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
+			clear_bit(p_rt->num - 1, port_mask);
+		}
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
+	struct sdw_port_config pconfig[SDW_MAX_PORTS];
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
+	int ret;
+
+	ret = qcom_swrm_stream_alloc_ports(ctrl, ctrl->sruntime[dai->id],
+					   params, substream->stream);
+	if (ret)
+		return ret;
+
+	return sdw_prepare_stream(ctrl->sruntime[dai->id]);
+}
+
+static int qcom_swrm_hw_free(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai)
+{
+	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
+
+	qcom_swrm_stream_free_ports(ctrl, ctrl->sruntime[dai->id]);
+	sdw_stream_remove_master(&ctrl->bus, ctrl->sruntime[dai->id]);
+	sdw_deprepare_stream(ctrl->sruntime[dai->id]);
+	sdw_disable_stream(ctrl->sruntime[dai->id]);
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
+static int qcom_pdm_set_sdw_stream(struct snd_soc_dai *dai,
+				   void *stream, int direction)
+{
+	return 0;
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
+	.set_sdw_stream = qcom_pdm_set_sdw_stream,
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
+	int i;
+
+	/* PDM dais are only tested for now */
+	dais = devm_kcalloc(ctrl->dev, num_dais, sizeof(*dais), GFP_KERNEL);
+	if (!dais)
+		return -ENOMEM;
+
+	for (i = 0; i < num_dais; i++) {
+		dais[i].name = kasprintf(GFP_KERNEL, "SDW Pin%d", i);
+		if (i < ctrl->num_dout_ports) {
+			dais[i].playback.stream_name = kasprintf(GFP_KERNEL,
+								 "SDW Tx%d", i);
+			if (!dais[i].playback.stream_name) {
+				kfree(dais[i].name);
+				return -ENOMEM;
+			}
+			dais[i].playback.channels_min = 1;
+			dais[i].playback.channels_max = 1;
+			dais[i].playback.rates = SNDRV_PCM_RATE_48000;
+			dais[i].playback.formats = SNDRV_PCM_FMTBIT_S16_LE;
+		} else {
+			dais[i].capture.stream_name = kasprintf(GFP_KERNEL,
+								"SDW Rx%d", i);
+			if (!dais[i].capture.stream_name) {
+				kfree(dais[i].name);
+				kfree(dais[i].playback.stream_name);
+				return -ENOMEM;
+			}
+
+			dais[i].capture.channels_min = 1;
+			dais[i].capture.channels_max = 1;
+			dais[i].capture.rates = SNDRV_PCM_RATE_48000;
+			dais[i].capture.formats = SNDRV_PCM_FMTBIT_S16_LE;
+		}
+		dais[i].ops = &qcom_swrm_pdm_dai_ops;
+		dais[i].id = i;
+	}
+
+	return devm_snd_soc_register_component(ctrl->dev,
+						&qcom_swrm_dai_component,
+						dais, num_dais);
+}
+
+static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
+{
+	struct device_node *np = ctrl->dev->of_node;
+	u8 off1[SDW_MAX_PORTS];
+	u8 off2[SDW_MAX_PORTS];
+	u8 si[SDW_MAX_PORTS];
+	int i, ret, nports, val;
+
+	val = ctrl->reg_read(ctrl, SWRM_COMP_PARAMS);
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
+
+	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
+	if (dev->parent->bus == &slimbus_bus) {
+		ctrl->reg_read = qcom_swrm_slim_reg_read;
+		ctrl->reg_write = qcom_swrm_slim_reg_write;
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
+	ctrl->irq = platform_get_irq(pdev, 0);
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
+	init_completion(&ctrl->sp_cmd_comp);
+	mutex_init(&ctrl->lock);
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
+	params->curr_bank = ctrl->reg_read(ctrl, SWRM_MCP_STATUS) &
+				SWRM_MCP_STATUS_BANK_NUM_MASK;
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
+	ctrl->version = ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION);
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
