Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACAB117473
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 19:41:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5246166B;
	Mon,  9 Dec 2019 19:40:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5246166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575916880;
	bh=GadpBcrZIkUVsfmCs2j+r4hOO+yYBOgMb1blURB5kx0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UsVTWqC3Hfn+ihW95/JEFX9Dy79tYimrBNTpK8hP0ZgM69Y6AE81VR6S8WrtqAO5p
	 402QmngiR/Bn5JfEDW0y//FxQQ5ociVf7iWorJVZ+eBn6tUezFQhLNDTXoj8GkwoCN
	 7pxkiQDoivAnxRSjWi1VMGFGx2ILM0elW2jRzgKM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2B2BF8028D;
	Mon,  9 Dec 2019 19:35:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B93E0F80278; Mon,  9 Dec 2019 19:35:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
 by alsa1.perex.cz (Postfix) with ESMTP id 629E1F80255
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 19:35:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 629E1F80255
Received: from zenbar.fritz.box (pD95EF75D.dip0.t-ipconnect.de [217.94.247.93])
 by mail.bugwerft.de (Postfix) with ESMTPSA id 294F82E5CEC;
 Mon,  9 Dec 2019 18:29:14 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Date: Mon,  9 Dec 2019 19:35:08 +0100
Message-Id: <20191209183511.3576038-9-daniel@zonque.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209183511.3576038-1-daniel@zonque.org>
References: <20191209183511.3576038-1-daniel@zonque.org>
MIME-Version: 1.0
Cc: lars@metafoo.de, sboyd@kernel.org, mturquette@baylibre.com,
 robh+dt@kernel.org, broonie@kernel.org, pascal.huerst@gmail.com,
 lee.jones@linaro.org, Daniel Mack <daniel@zonque.org>
Subject: [alsa-devel] [PATCH 07/10] i2c: Add driver for AD242x bus controller
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

This device must be instantiated as a sub-device of the AD242x MFD
device.

In order to access remote I2C peripherals, the master node is configured
to the slave node number and the remote I2C client address on the remote
side, and then the payload is sent to the BUS client of the master node,
which transparently proxies the traffic through.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/i2c/busses/Kconfig      |  10 ++
 drivers/i2c/busses/Makefile     |   1 +
 drivers/i2c/busses/i2c-ad242x.c | 178 ++++++++++++++++++++++++++++++++
 3 files changed, 189 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-ad242x.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 6a0aa76859f3..b9cf049bedb0 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -365,6 +365,16 @@ config I2C_POWERMAC
 
 comment "I2C system bus drivers (mostly embedded / system-on-chip)"
 
+config I2C_AD242X
+	tristate "Analog Devices AD242x"
+	depends on MFD_AD242X
+	help
+	  If you say yes to this option, support will be included for the
+	  I2C bus controller function of AD242x slave nodes.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called i2c-ad242x.
+
 config I2C_ALTERA
 	tristate "Altera Soft IP I2C"
 	depends on (ARCH_SOCFPGA || NIOS2) && OF
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 3ab8aebc39c9..57c31ea8a477 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -32,6 +32,7 @@ obj-$(CONFIG_I2C_HYDRA)		+= i2c-hydra.o
 obj-$(CONFIG_I2C_POWERMAC)	+= i2c-powermac.o
 
 # Embedded system I2C/SMBus host controller drivers
+obj-$(CONFIG_I2C_AD242X)	+= i2c-ad242x.o
 obj-$(CONFIG_I2C_ALTERA)	+= i2c-altera.o
 obj-$(CONFIG_I2C_AMD_MP2)	+= i2c-amd-mp2-pci.o i2c-amd-mp2-plat.o
 obj-$(CONFIG_I2C_ASPEED)	+= i2c-aspeed.o
diff --git a/drivers/i2c/busses/i2c-ad242x.c b/drivers/i2c/busses/i2c-ad242x.c
new file mode 100644
index 000000000000..b94056653898
--- /dev/null
+++ b/drivers/i2c/busses/i2c-ad242x.c
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mfd/ad242x.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+struct ad242x_i2c {
+	struct device		*dev;
+	struct ad242x_node	*node;
+	struct i2c_adapter	adap;
+	u32			node_index;
+};
+
+static int ad242x_set_addr(struct ad242x_node *mnode,
+			   struct ad242x_i2c_bus *bus,
+			   uint8_t node_id, uint8_t addr)
+{
+	int ret;
+	uint8_t buf[2] = { AD242X_CHIP, addr };
+
+	ret = regmap_update_bits(mnode->regmap, AD242X_NODEADR,
+				 AD242X_NODEADR_PERI | AD242X_NODEADR_MASK,
+				 node_id);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * We can't use the slave's regmap here as it holds the same
+	 * lock we also need to guard this context.
+	 */
+	ret = i2c_transfer_buffer_flags(bus->client,
+					buf, sizeof(buf), 0);
+	if (ret < 0)
+		return ret;
+
+	return regmap_update_bits(mnode->regmap, AD242X_NODEADR,
+				  AD242X_NODEADR_PERI, AD242X_NODEADR_PERI);
+}
+
+static int ad242x_i2c_xfer(struct i2c_adapter *adap,
+			   struct i2c_msg msgs[], int num)
+{
+	struct ad242x_i2c *i2c = adap->algo_data;
+	struct ad242x_i2c_bus *bus = ad242x_master_get_bus(i2c->node->master);
+	struct ad242x_node *mnode = ad242x_master_get_node(i2c->node->master);
+	int ret, i, current_addr = -1;
+
+	mutex_lock(&bus->mutex);
+
+	for (i = 0; i < num; i++) {
+		struct i2c_msg *msg = msgs + i;
+
+		if (msg->addr != current_addr) {
+			ret = ad242x_set_addr(mnode, bus,
+					      i2c->node->id, msg->addr);
+			if (ret < 0) {
+				dev_err(i2c->node->dev,
+					"Cannot set address: %d\n", ret);
+				break;
+			}
+
+			current_addr = msg->addr;
+		}
+
+		ret = i2c_transfer_buffer_flags(bus->client,
+						msg->buf, msg->len, msg->flags);
+		if (ret < 0)
+			break;
+	}
+
+	mutex_unlock(&bus->mutex);
+
+	return ret < 0 ? ret : num;
+}
+
+static u32 ad242x_i2c_functionality(struct i2c_adapter *adap)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static const struct i2c_algorithm ad242x_i2c_algorithm = {
+	.master_xfer	= ad242x_i2c_xfer,
+	.functionality	= ad242x_i2c_functionality,
+};
+
+static int ad242x_i2c_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct ad242x_node *node;
+	struct ad242x_i2c *i2c;
+	u32 freq, val = 0;
+	int ret;
+
+	if (!dev->of_node)
+		return -ENODEV;
+
+	node = dev_get_drvdata(dev->parent);
+	if ((node->caps & AD242X_CAPABILITY_I2C) == 0) {
+		dev_err(dev, "Node %d has no I2C capability", node->id);
+		return -ENOTSUPP;
+	}
+
+	if (ad242x_node_is_master(node))
+		return -EINVAL;
+
+	freq = ad242x_master_get_clk_rate(node->master);
+	if (freq == 44100)
+		val |= AD242X_I2CCFG_FRAMERATE;
+
+	if (!of_property_read_u32(dev->of_node, "clock-frequency", &freq)) {
+		if (freq == 400000)
+			val |= AD242X_I2CCFG_DATARATE;
+		else if (freq != 100000)
+			dev_warn(dev, "Unsupported frequency %d\n", freq);
+	}
+
+	ret = regmap_write(node->regmap, AD242X_I2CCFG, val);
+	if (ret < 0)
+		return ret;
+
+	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
+	if (!i2c)
+		return -ENOMEM;
+
+	i2c->node = node;
+	i2c->adap.algo = &ad242x_i2c_algorithm;
+	i2c->adap.algo_data = i2c;
+	i2c->adap.dev.parent = dev;
+	i2c->adap.dev.of_node = dev->of_node;
+	i2c_set_adapdata(&i2c->adap, i2c);
+	strlcpy(i2c->adap.name, "ad242x remote I2C bus",
+		sizeof(i2c->adap.name));
+
+	ret = i2c_add_adapter(&i2c->adap);
+	if (ret < 0) {
+		dev_err(dev, "error registering adapter: %d\n", ret);
+		return ret;
+	}
+
+	dev_info(dev, "ad242x i2c driver, node ID %d\n", node->id);
+	platform_set_drvdata(pdev, i2c);
+
+	return 0;
+}
+
+static int ad242x_i2c_remove(struct platform_device *dev)
+{
+	struct ad242x_i2c *i2c = platform_get_drvdata(dev);
+
+	i2c_del_adapter(&i2c->adap);
+
+	return 0;
+}
+
+static const struct of_device_id ad242x_i2c_of_match[] = {
+	{ .compatible = "adi,ad2428w-i2c" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ad242x_i2c_of_match);
+
+static struct platform_driver ad242x_i2c_driver = {
+	.driver = {
+		.name = "ad242x-i2c",
+		.of_match_table = ad242x_i2c_of_match,
+	},
+	.probe = ad242x_i2c_probe,
+	.remove = ad242x_i2c_remove,
+};
+
+module_platform_driver(ad242x_i2c_driver);
+MODULE_LICENSE("GPL");
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
