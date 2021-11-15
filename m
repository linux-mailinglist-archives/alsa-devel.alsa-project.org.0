Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B34A54500C1
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 10:01:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B3F916A5;
	Mon, 15 Nov 2021 10:00:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B3F916A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636966862;
	bh=rWn7fwL4jE1Ib3BnxgNaC10hhrTID/u9x8pJYbds6hA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HN1TYOTsCVcN39wZ+gMZRf9tAvyuhZUZ76RGJ5KmNtezkjYk5eiF+/VM+CIjwboxp
	 ROhdRmFZ0Jo+SvWWFQuuXoogoAJAD2tqBaXBCrWg+v2EqeoKVrVLdWNf8gkQZ7LgnJ
	 WH4TY1KuQRLvZQgehdj1qzSNuRKOpwGK9SKNgGBQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4961FF80518;
	Mon, 15 Nov 2021 09:57:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB95BF8028B; Mon, 15 Nov 2021 09:55:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EBDCF80163
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 09:55:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EBDCF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rwUrTphl"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2650E63231;
 Mon, 15 Nov 2021 08:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636966532;
 bh=rWn7fwL4jE1Ib3BnxgNaC10hhrTID/u9x8pJYbds6hA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rwUrTphlMw8HJ9VnDWmnfi04Z++0QMRlAz95GaW7OS1q8qZNIBTkO5QiaZugxOt8N
 1mbE/z9LO+912MOTgqOy2Fu3iCnfylRNZNLUEtErYihz3U3/3OKs3xK7fC0hImtGX7
 vvd3cBsUg8KPgEovHhXExGCLl18S9ZT1m5Z7LCfmcsgzx1kJEdB42MUvVK4s2VTYl7
 Jah3Us03hw3EKccqeON6WwAeJJzFj7wvT3lDlSzZkJMfLKbLy1s1f0CeTmN6Jmt3zF
 ke7usfxwY8raXd5BVWxGUFEyZnwrkpaX/uOdw9bVtALCO2Dwk4LWpad8wzTSNIAQKm
 9X1AzkWRKWXoA==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 07/11] dmaengine: qcom-adm: stop abusing slave_id config
Date: Mon, 15 Nov 2021 09:53:59 +0100
Message-Id: <20211115085403.360194-8-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211115085403.360194-1-arnd@kernel.org>
References: <20211115085403.360194-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 15 Nov 2021 09:57:03 +0100
Cc: alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-spi@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Lars-Peter Clausen <lars@metafoo.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-staging@lists.linux.dev, Michal Simek <michal.simek@xilinx.com>,
 Jon Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-serial@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Laxman Dewangan <ldewangan@nvidia.com>, Baolin Wang <baolin.wang7@gmail.com>
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

From: Arnd Bergmann <arnd@arndb.de>

The slave_id was previously used to pick one DMA slave instead of another,
but this is now done through the DMA descriptors in device tree.

For the qcom_adm driver, the configuration is documented in the DT
binding to contain a tuple of device identifier and a "crci" field,
but the implementation ends up using only a single cell for identifying
the slave, with the crci getting passed in nonstandard properties of
the device, and passed through the dma driver using the old slave_id
field. Part of the problem apparently is that the nand driver ends up
using only a single DMA request ID, but requires distinct values for
"crci" depending on the type of transfer.

Change both the dmaengine driver and the two slave drivers to allow
the documented binding to work in addition to the ad-hoc passing
of crci values. In order to no longer abuse the slave_id field, pass
the data using the "peripheral_config" mechanism instead.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/dma/qcom/qcom_adm.c       | 56 +++++++++++++++++++++++++++----
 drivers/mtd/nand/raw/qcom_nandc.c | 14 ++++++--
 drivers/tty/serial/msm_serial.c   | 15 +++++++--
 include/linux/dma/qcom_adm.h      | 12 +++++++
 4 files changed, 86 insertions(+), 11 deletions(-)
 create mode 100644 include/linux/dma/qcom_adm.h

diff --git a/drivers/dma/qcom/qcom_adm.c b/drivers/dma/qcom/qcom_adm.c
index ee78bed8d60d..bb338b303af6 100644
--- a/drivers/dma/qcom/qcom_adm.c
+++ b/drivers/dma/qcom/qcom_adm.c
@@ -8,6 +8,7 @@
 #include <linux/device.h>
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma/qcom_adm.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -140,6 +141,8 @@ struct adm_chan {
 
 	struct adm_async_desc *curr_txd;
 	struct dma_slave_config slave;
+	u32 crci;
+	u32 mux;
 	struct list_head node;
 
 	int error;
@@ -379,8 +382,8 @@ static struct dma_async_tx_descriptor *adm_prep_slave_sg(struct dma_chan *chan,
 			return ERR_PTR(-EINVAL);
 		}
 
-		crci = achan->slave.slave_id & 0xf;
-		if (!crci || achan->slave.slave_id > 0x1f) {
+		crci = achan->crci & 0xf;
+		if (!crci || achan->crci > 0x1f) {
 			dev_err(adev->dev, "invalid crci value\n");
 			return ERR_PTR(-EINVAL);
 		}
@@ -403,9 +406,7 @@ static struct dma_async_tx_descriptor *adm_prep_slave_sg(struct dma_chan *chan,
 	if (!async_desc)
 		return ERR_PTR(-ENOMEM);
 
-	if (crci)
-		async_desc->mux = achan->slave.slave_id & ADM_CRCI_MUX_SEL ?
-					ADM_CRCI_CTL_MUX_SEL : 0;
+	async_desc->mux = achan->mux ? ADM_CRCI_CTL_MUX_SEL : 0;
 	async_desc->crci = crci;
 	async_desc->blk_size = blk_size;
 	async_desc->dma_len = single_count * sizeof(struct adm_desc_hw_single) +
@@ -488,10 +489,13 @@ static int adm_terminate_all(struct dma_chan *chan)
 static int adm_slave_config(struct dma_chan *chan, struct dma_slave_config *cfg)
 {
 	struct adm_chan *achan = to_adm_chan(chan);
+	struct qcom_adm_peripheral_config *config = cfg->peripheral_config;
 	unsigned long flag;
 
 	spin_lock_irqsave(&achan->vc.lock, flag);
 	memcpy(&achan->slave, cfg, sizeof(struct dma_slave_config));
+	if (cfg->peripheral_size == sizeof(config))
+		achan->crci = config->crci;
 	spin_unlock_irqrestore(&achan->vc.lock, flag);
 
 	return 0;
@@ -694,6 +698,45 @@ static void adm_channel_init(struct adm_device *adev, struct adm_chan *achan,
 	achan->vc.desc_free = adm_dma_free_desc;
 }
 
+/**
+ * adm_dma_xlate
+ * @dma_spec:	pointer to DMA specifier as found in the device tree
+ * @ofdma:	pointer to DMA controller data
+ *
+ * This can use either 1-cell or 2-cell formats, the first cell
+ * identifies the slave device, while the optional second cell
+ * contains the crci value.
+ *
+ * Returns pointer to appropriate dma channel on success or NULL on error.
+ */
+struct dma_chan *adm_dma_xlate(struct of_phandle_args *dma_spec,
+			       struct of_dma *ofdma)
+{
+	struct dma_device *dev = ofdma->of_dma_data;
+	struct dma_chan *chan, *candidate = NULL;
+	struct adm_chan *achan;
+
+	if (!dev || dma_spec->args_count > 2)
+		return NULL;
+
+	list_for_each_entry(chan, &dev->channels, device_node)
+		if (chan->chan_id == dma_spec->args[0]) {
+			candidate = chan;
+			break;
+		}
+
+	if (!candidate)
+		return NULL;
+
+	achan = to_adm_chan(candidate);
+	if (dma_spec->args_count == 2)
+		achan->crci = dma_spec->args[1];
+	else
+		achan->crci = 0;
+
+	return dma_get_slave_channel(candidate);
+}
+
 static int adm_dma_probe(struct platform_device *pdev)
 {
 	struct adm_device *adev;
@@ -838,8 +881,7 @@ static int adm_dma_probe(struct platform_device *pdev)
 		goto err_disable_clks;
 	}
 
-	ret = of_dma_controller_register(pdev->dev.of_node,
-					 of_dma_xlate_by_chan_id,
+	ret = of_dma_controller_register(pdev->dev.of_node, adm_dma_xlate,
 					 &adev->common);
 	if (ret)
 		goto err_unregister_dma;
diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 04e6f7b26706..7c6efa3b6255 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -6,6 +6,7 @@
 #include <linux/clk.h>
 #include <linux/slab.h>
 #include <linux/bitops.h>
+#include <linux/dma/qcom_adm.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <linux/module.h>
@@ -952,6 +953,7 @@ static int prep_adm_dma_desc(struct qcom_nand_controller *nandc, bool read,
 	struct dma_async_tx_descriptor *dma_desc;
 	struct scatterlist *sgl;
 	struct dma_slave_config slave_conf;
+	struct qcom_adm_peripheral_config periph_conf = {};
 	enum dma_transfer_direction dir_eng;
 	int ret;
 
@@ -983,11 +985,19 @@ static int prep_adm_dma_desc(struct qcom_nand_controller *nandc, bool read,
 	if (read) {
 		slave_conf.src_maxburst = 16;
 		slave_conf.src_addr = nandc->base_dma + reg_off;
-		slave_conf.slave_id = nandc->data_crci;
+		if (nandc->data_crci) {
+			periph_conf.crci = nandc->data_crci;
+			slave_conf.peripheral_config = &periph_conf;
+			slave_conf.peripheral_size = sizeof(periph_conf);
+		}
 	} else {
 		slave_conf.dst_maxburst = 16;
 		slave_conf.dst_addr = nandc->base_dma + reg_off;
-		slave_conf.slave_id = nandc->cmd_crci;
+		if (nandc->cmd_crci) {
+			periph_conf.crci = nandc->cmd_crci;
+			slave_conf.peripheral_config = &periph_conf;
+			slave_conf.peripheral_size = sizeof(periph_conf);
+		}
 	}
 
 	ret = dmaengine_slave_config(nandc->chan, &slave_conf);
diff --git a/drivers/tty/serial/msm_serial.c b/drivers/tty/serial/msm_serial.c
index fcef7a961430..c6be09f44dc1 100644
--- a/drivers/tty/serial/msm_serial.c
+++ b/drivers/tty/serial/msm_serial.c
@@ -9,6 +9,7 @@
 
 #include <linux/kernel.h>
 #include <linux/atomic.h>
+#include <linux/dma/qcom_adm.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <linux/module.h>
@@ -290,6 +291,7 @@ static void msm_request_tx_dma(struct msm_port *msm_port, resource_size_t base)
 {
 	struct device *dev = msm_port->uart.dev;
 	struct dma_slave_config conf;
+	struct qcom_adm_peripheral_config periph_conf = {};
 	struct msm_dma *dma;
 	u32 crci = 0;
 	int ret;
@@ -308,7 +310,11 @@ static void msm_request_tx_dma(struct msm_port *msm_port, resource_size_t base)
 	conf.device_fc = true;
 	conf.dst_addr = base + UARTDM_TF;
 	conf.dst_maxburst = UARTDM_BURST_SIZE;
-	conf.slave_id = crci;
+	if (crci) {
+		conf.peripheral_config = &periph_conf;
+		conf.peripheral_size = sizeof(periph_conf);
+		periph_conf.crci = crci;
+	}
 
 	ret = dmaengine_slave_config(dma->chan, &conf);
 	if (ret)
@@ -333,6 +339,7 @@ static void msm_request_rx_dma(struct msm_port *msm_port, resource_size_t base)
 {
 	struct device *dev = msm_port->uart.dev;
 	struct dma_slave_config conf;
+	struct qcom_adm_peripheral_config periph_conf = {};
 	struct msm_dma *dma;
 	u32 crci = 0;
 	int ret;
@@ -355,7 +362,11 @@ static void msm_request_rx_dma(struct msm_port *msm_port, resource_size_t base)
 	conf.device_fc = true;
 	conf.src_addr = base + UARTDM_RF;
 	conf.src_maxburst = UARTDM_BURST_SIZE;
-	conf.slave_id = crci;
+	if (crci) {
+		conf.peripheral_config = &periph_conf;
+		conf.peripheral_size = sizeof(periph_conf);
+		periph_conf.crci = crci;
+	}
 
 	ret = dmaengine_slave_config(dma->chan, &conf);
 	if (ret)
diff --git a/include/linux/dma/qcom_adm.h b/include/linux/dma/qcom_adm.h
new file mode 100644
index 000000000000..af20df674f0c
--- /dev/null
+++ b/include/linux/dma/qcom_adm.h
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#ifndef __LINUX_DMA_QCOM_ADM_H
+#define __LINUX_DMA_QCOM_ADM_H
+
+#include <linux/types.h>
+
+struct qcom_adm_peripheral_config {
+	u32 crci;
+	u32 mux;
+};
+
+#endif /* __LINUX_DMA_QCOM_ADM_H */
-- 
2.30.2

