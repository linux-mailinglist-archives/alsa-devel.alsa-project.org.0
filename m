Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6326C11747B
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 19:42:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1D68166E;
	Mon,  9 Dec 2019 19:41:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1D68166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575916958;
	bh=yyefpVy8G70sUqcI6NTY9wr8koY/YSkU6McGITHGEf0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LjNmKDFEefj6Wlfy6IiMGH9hPDkOUER9HobEzgs/T25YldXZ/KXV3vLgYbdlxBIw/
	 S7frRQAtESWUBhjjiE6hbVq2adyQr9RX+eM9n9w1Gelap1gklzA0cI+nR2E4rGyjka
	 Wz1kTBBRpm86vE6yN/RCm3C+Vf6jOyW/C/TO5hCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B619AF802BD;
	Mon,  9 Dec 2019 19:35:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D0FBF80234; Mon,  9 Dec 2019 19:35:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
 by alsa1.perex.cz (Postfix) with ESMTP id A2DEDF80234
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 19:35:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2DEDF80234
Received: from zenbar.fritz.box (pD95EF75D.dip0.t-ipconnect.de [217.94.247.93])
 by mail.bugwerft.de (Postfix) with ESMTPSA id 834332E5CEB;
 Mon,  9 Dec 2019 18:29:15 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Date: Mon,  9 Dec 2019 19:35:10 +0100
Message-Id: <20191209183511.3576038-11-daniel@zonque.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191209183511.3576038-1-daniel@zonque.org>
References: <20191209183511.3576038-1-daniel@zonque.org>
MIME-Version: 1.0
Cc: lars@metafoo.de, sboyd@kernel.org, mturquette@baylibre.com,
 robh+dt@kernel.org, broonie@kernel.org, pascal.huerst@gmail.com,
 lee.jones@linaro.org, Daniel Mack <daniel@zonque.org>
Subject: [alsa-devel] [PATCH 09/10] clk: Add support for AD242x clock output
	providers
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

AD242x have two pins that can be used as clock outputs. This driver makes
that functionality available through the common clock framework.

Apart from gating the clocks and setting their rates, the hardware also
allows for a phase shift of 180 degrees.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/clk/Kconfig      |   6 +
 drivers/clk/Makefile     |   1 +
 drivers/clk/clk-ad242x.c | 231 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 238 insertions(+)
 create mode 100644 drivers/clk/clk-ad242x.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 45653a0e6ecd..28b700d068fe 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -39,6 +39,12 @@ config CLK_HSDK
 	  This driver supports the HSDK core, system, ddr, tunnel and hdmi PLLs
 	  control.
 
+config COMMON_CLK_AD242X
+	tristate "Clock driver for AD242x A2B nodes"
+	depends on MFD_AD242X
+	---help---
+	  This driver supports clock outputs on AD242x A2B nodes.
+
 config COMMON_CLK_MAX77686
 	tristate "Clock driver for Maxim 77620/77686/77802 MFD"
 	depends on MFD_MAX77686 || MFD_MAX77620 || COMPILE_TEST
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 0696a0c1ab58..3f8cbddb48c7 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -18,6 +18,7 @@ endif
 
 # hardware specific clock types
 # please keep this section sorted lexicographically by file path name
+obj-$(CONFIG_COMMON_CLK_AD242X)		+= clk-ad242x.o
 obj-$(CONFIG_MACH_ASM9260)		+= clk-asm9260.o
 obj-$(CONFIG_COMMON_CLK_AXI_CLKGEN)	+= clk-axi-clkgen.o
 obj-$(CONFIG_ARCH_AXXIA)		+= clk-axm5516.o
diff --git a/drivers/clk/clk-ad242x.c b/drivers/clk/clk-ad242x.c
new file mode 100644
index 000000000000..201789d8f174
--- /dev/null
+++ b/drivers/clk/clk-ad242x.c
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/errno.h>
+#include <linux/mfd/ad242x.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/adi,ad242x.h>
+
+#define AD242X_NUM_CLKS 2
+
+struct ad242x_clk_hw {
+	struct clk_hw hw;
+	struct clk_init_data init;
+	struct ad242x_node *node;
+	u8 reg;
+};
+
+struct ad242x_clk_driver_data {
+	struct ad242x_clk_hw hw[AD242X_NUM_CLKS];
+};
+
+static inline struct ad242x_clk_hw *to_ad242x_clk(struct clk_hw *hw)
+{
+	return container_of(hw, struct ad242x_clk_hw, hw);
+}
+
+static int ad242x_clk_prepare(struct clk_hw *hw)
+{
+	struct ad242x_clk_hw *clk_hw = to_ad242x_clk(hw);
+
+	return regmap_update_bits(clk_hw->node->regmap, clk_hw->reg,
+				  AD242X_CLKCFG_EN, AD242X_CLKCFG_EN);
+}
+
+static void ad242x_clk_unprepare(struct clk_hw *hw)
+{
+	struct ad242x_clk_hw *clk_hw = to_ad242x_clk(hw);
+
+	regmap_update_bits(clk_hw->node->regmap, clk_hw->reg,
+			   AD242X_CLKCFG_EN, 0);
+}
+
+static void ad242x_do_div(unsigned long rate, unsigned long parent_rate,
+			  unsigned long *prediv, unsigned long *div)
+{
+	if (rate < parent_rate / 32UL)
+		*prediv = 32UL;
+	else
+		*prediv = 2UL;
+
+	parent_rate /= *prediv;
+	*div = parent_rate / rate;
+}
+
+static int ad242x_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long parent_rate)
+{
+	struct ad242x_clk_hw *clk_hw = to_ad242x_clk(hw);
+	unsigned long pll_rate = parent_rate * 2048UL;
+	unsigned long prediv, div;
+	unsigned int val = 0;
+
+	if (rate > pll_rate / 4 || rate < pll_rate / 1024UL)
+		return -EINVAL;
+
+	ad242x_do_div(rate, pll_rate, &prediv, &div);
+
+	if (prediv == 32UL)
+		val |= AD242X_CLKCFG_PDIV32;
+
+	val |= AD242X_CLKCFG_DIV((div / 2UL) - 1UL);
+
+	return regmap_update_bits(clk_hw->node->regmap, clk_hw->reg,
+				  AD242X_CLKCFG_DIVMSK | AD242X_CLKCFG_PDIV32,
+				  val);
+}
+
+static unsigned long ad242x_clk_recalc_rate(struct clk_hw *hw,
+					    unsigned long parent_rate)
+{
+	struct ad242x_clk_hw *clk_hw = to_ad242x_clk(hw);
+	unsigned long pll_rate = parent_rate * 2048UL;
+	unsigned long prediv, div;
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(clk_hw->node->regmap, clk_hw->reg, &val);
+	if (ret < 0)
+		return ret;
+
+	prediv = (val & AD242X_CLKCFG_PDIV32) ? 32UL : 2UL;
+	div = 2UL * ((val & AD242X_CLKCFG_DIVMSK) + 1UL);
+
+	return pll_rate / (prediv * div);
+}
+
+static long ad242x_clk_round_rate(struct clk_hw *hw, unsigned long rate,
+				  unsigned long *parent_rate)
+{
+	unsigned long pll_rate = *parent_rate * 2048UL;
+	unsigned long prediv, div;
+
+	if (rate > pll_rate / 4 || rate < pll_rate / 1024UL)
+		return -EINVAL;
+
+	ad242x_do_div(rate, pll_rate, &prediv, &div);
+
+	return pll_rate / (prediv * div);
+}
+
+static int ad242x_clk_get_phase(struct clk_hw *hw)
+{
+	struct ad242x_clk_hw *clk_hw = to_ad242x_clk(hw);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(clk_hw->node->regmap, clk_hw->reg, &val);
+	if (ret < 0)
+		return ret;
+
+	return (val & AD242X_CLKCFG_INV) ? 180 : 0;
+}
+
+static int ad242x_clk_set_phase(struct clk_hw *hw, int phase)
+{
+	struct ad242x_clk_hw *clk_hw = to_ad242x_clk(hw);
+	unsigned int val;
+
+	switch (phase) {
+	case 0:
+		val = 0;
+		break;
+	case 180:
+		val = AD242X_CLKCFG_INV;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(clk_hw->node->regmap, clk_hw->reg,
+				  AD242X_CLKCFG_INV, val);
+}
+
+static const struct clk_ops ad242x_clk_ops = {
+	.prepare	= ad242x_clk_prepare,
+	.unprepare	= ad242x_clk_unprepare,
+	.get_phase	= ad242x_clk_get_phase,
+	.set_phase	= ad242x_clk_set_phase,
+	.recalc_rate	= ad242x_clk_recalc_rate,
+	.round_rate	= ad242x_clk_round_rate,
+	.set_rate	= ad242x_clk_set_rate,
+};
+
+static struct clk_hw *
+ad242x_of_clk_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct ad242x_clk_driver_data *drvdata = data;
+	unsigned int idx = clkspec->args[0];
+
+	return &drvdata->hw[idx].hw;
+}
+
+static int ad242x_clk_probe(struct platform_device *pdev)
+{
+	const char *clk_names[AD242X_NUM_CLKS] = { "clkout1", "clkout2" };
+	u8 regs[AD242X_NUM_CLKS] = { AD242X_CLK1CFG, AD242X_CLK2CFG };
+	struct ad242x_clk_driver_data *drvdata;
+	struct device *dev = &pdev->dev;
+	const char *sync_clk_name;
+	struct ad242x_node *node;
+	int i, ret;
+
+	if (!dev->of_node)
+		return -ENODEV;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	node = dev_get_drvdata(dev->parent);
+	sync_clk_name = ad242x_master_get_clk_name(node->master);
+
+	for (i = 0; i < AD242X_NUM_CLKS; i++) {
+		const char *name;
+
+		if (of_property_read_string_index(dev->of_node,
+						  "clock-output-names",
+						  i, &name) == 0)
+			drvdata->hw[i].init.name = name;
+		else
+			drvdata->hw[i].init.name = clk_names[i];
+
+		drvdata->hw[i].reg = regs[i];
+		drvdata->hw[i].init.ops = &ad242x_clk_ops;
+		drvdata->hw[i].init.num_parents = 1;
+		drvdata->hw[i].init.parent_names = &sync_clk_name;
+		drvdata->hw[i].hw.init = &drvdata->hw[i].init;
+		drvdata->hw[i].node = node;
+
+		ret = devm_clk_hw_register(dev, &drvdata->hw[i].hw);
+		if (ret < 0)
+			return ret;
+	}
+
+	return devm_of_clk_add_hw_provider(dev, ad242x_of_clk_get, drvdata);
+}
+
+static const struct of_device_id ad242x_dt_ids[] = {
+	{ .compatible = "adi,ad2428w-clk", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, ad242x_dt_ids);
+
+static struct platform_driver ad242x_clk_driver = {
+	.probe = ad242x_clk_probe,
+	.driver = {
+		.name = "ad242x-clk",
+		.of_match_table	= ad242x_dt_ids,
+	},
+};
+module_platform_driver(ad242x_clk_driver);
+
+MODULE_AUTHOR("Daniel Mack <daniel@zonque.org>");
+MODULE_DESCRIPTION("AD242x clock driver");
+MODULE_LICENSE("GPL v2");
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
