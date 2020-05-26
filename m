Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1966C1A3B26
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 22:09:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B323516AE;
	Thu,  9 Apr 2020 22:08:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B323516AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586462940;
	bh=9RXJfmIAeGQdzBTqqlIxr8DhkW7/Lj6G7bZCTPh0Gy8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cW8cfUHXTjuRXoy3WKVRT8jWM4MZwKuRHwxcTy3ptMV+sE2Z7CldKV1f8n6hgO6XN
	 XCJJOcjxMd3ve6lZKE42z4TlPviwmJbpO9tT50bFhdlNHtfpRhnzZyxhp/2V7/8c60
	 xt5cZSXWYD63CAfDE2PCIDuEAATS1dZung3Xmb9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9601FF80329;
	Thu,  9 Apr 2020 21:59:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E59E3F80333; Thu,  9 Apr 2020 21:59:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60B78F80322
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 21:59:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60B78F80322
IronPort-SDR: zAbUHPLp5iNhNfdsu3iJtDuVA930lFKyHSNGSaRSvA+D2G12dWagkrZDcdWinn7No6GpCdL7wT
 nzhs2s/4uRuw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 12:59:27 -0700
IronPort-SDR: imxHvrZXMLNHUYGSiQcV5HFUF80TucBbpCOlIZhjSXo373BkTwb6zmGIgRgyfIjdKMnPHp7DwU
 AmA8lDTtduRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; d="scan'208";a="242745401"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
 by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 12:59:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 14/16] clk: hifiberry-dacpro: toggle GPIOs on
 prepare/unprepare
Date: Thu,  9 Apr 2020 14:58:39 -0500
Message-Id: <20200409195841.18901-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, tiwai@suse.de,
 Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Daniel Matuschek <daniel@hifiberry.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, Matthias Reichl <hias@horus.com>,
 broonie@kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
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

Now that the PCM512x driver exposes GPIOs, we can set their values as
needed in this clk driver (instead of doing nothing).

This clk driver does not have access to the codec regmap, so it only
toggles GPIOs. The user (typically a machine driver) should verify
that the clocks are present by testing the PCM512x_RATE4_DET register
(reports if the sclk is seen by the codec).

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/clk/clk-hifiberry-dacpro.c | 110 +++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/clk/clk-hifiberry-dacpro.c b/drivers/clk/clk-hifiberry-dacpro.c
index 36210f52c624..f1f5af260083 100644
--- a/drivers/clk/clk-hifiberry-dacpro.c
+++ b/drivers/clk/clk-hifiberry-dacpro.c
@@ -9,6 +9,8 @@
 
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -20,16 +22,35 @@
 /* Clock rate of CLK48EN attached to GPIO3 pin */
 #define CLK_48EN_RATE 24576000UL
 
+static struct gpiod_lookup_table pcm512x_gpios_table = {
+	/* .dev_id set during probe */
+	.table = {
+		GPIO_LOOKUP("pcm512x-gpio", 2, "PCM512x-GPIO3", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("pcm512x-gpio", 5, "PCM512x-GPIO6", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 /**
  * struct clk_hifiberry_hw - Common struct to the HiFiBerry DAC Pro
+ * @dev: device
  * @hw: clk_hw for the common clk framework
  * @mode: 0 => CLK44EN, 1 => CLK48EN
  * @sclk_lookup: handle for "sclk"
+ * @gpio_44: gpiod desc for 44.1kHz support
+ * @gpio_48: gpiod desc for 48 kHz support
+ * @prepared: boolean caching clock state
+ * @gpio_initialized: boolean flag used to take gpio references.
  */
 struct clk_hifiberry_hw {
+	struct device *dev;
 	struct clk_hw hw;
 	u8 mode;
 	struct clk_lookup *sclk_lookup;
+	struct gpio_desc *gpio_44;
+	struct gpio_desc *gpio_48;
+	bool prepared;
+	bool gpio_initialized;
 };
 
 #define to_hifiberry_clk(_hw) container_of(_hw, struct clk_hifiberry_hw, hw)
@@ -69,6 +90,88 @@ static long clk_hifiberry_dacpro_round_rate(struct clk_hw *hw,
 	return actual_rate;
 }
 
+static int clk_hifiberry_dacpro_is_prepared(struct clk_hw *hw)
+{
+	struct clk_hifiberry_hw *clk = to_hifiberry_clk(hw);
+
+	return clk->prepared;
+}
+
+static int clk_hifiberry_dacpro_prepare(struct clk_hw *hw)
+{
+	struct clk_hifiberry_hw *clk = to_hifiberry_clk(hw);
+
+	/*
+	 * The gpios are handled here to avoid any dependencies on
+	 * probe.
+	 *
+	 * The user of the clock should verify with the PCM512
+	 * registers that the clock are actually present and stable.
+	 * This driver only toggles the relevant GPIOs.
+	 */
+	if (!clk->gpio_initialized) {
+
+		clk->gpio_44 = devm_gpiod_get(clk->dev,
+					      "PCM512x-GPIO6",
+					      GPIOD_OUT_LOW);
+		if (IS_ERR(clk->gpio_44)) {
+			dev_err(clk->dev, "gpio44 not found\n");
+			return PTR_ERR(clk->gpio_44);
+		}
+
+		clk->gpio_48 = devm_gpiod_get(clk->dev,
+					      "PCM512x-GPIO3",
+					      GPIOD_OUT_LOW);
+		if (IS_ERR(clk->gpio_48)) {
+			dev_err(clk->dev, "gpio48 not found\n");
+			return PTR_ERR(clk->gpio_48);
+		}
+
+		clk->gpio_initialized = true;
+	}
+
+	if (clk->prepared)
+		return 0;
+
+	switch (clk->mode) {
+	case 0:
+		/* 44.1 kHz */
+		gpiod_set_value(clk->gpio_44, 1);
+		break;
+	case 1:
+		/* 48 kHz */
+		gpiod_set_value(clk->gpio_48, 1);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	clk->prepared = 1;
+
+	return 0;
+}
+
+static void clk_hifiberry_dacpro_unprepare(struct clk_hw *hw)
+{
+	struct clk_hifiberry_hw *clk = to_hifiberry_clk(hw);
+
+	if (!clk->prepared)
+		return;
+
+	switch (clk->mode) {
+	case 0:
+		gpiod_set_value(clk->gpio_44, 0);
+		break;
+	case 1:
+		gpiod_set_value(clk->gpio_48, 0);
+		break;
+	default:
+		return;
+	}
+
+	clk->prepared = false;
+}
+
 static int clk_hifiberry_dacpro_set_rate(struct clk_hw *hw,
 					 unsigned long rate,
 					 unsigned long parent_rate)
@@ -83,6 +186,9 @@ static int clk_hifiberry_dacpro_set_rate(struct clk_hw *hw,
 }
 
 static const struct clk_ops clk_hifiberry_dacpro_rate_ops = {
+	.is_prepared = clk_hifiberry_dacpro_is_prepared,
+	.prepare = clk_hifiberry_dacpro_prepare,
+	.unprepare = clk_hifiberry_dacpro_unprepare,
 	.recalc_rate = clk_hifiberry_dacpro_recalc_rate,
 	.round_rate = clk_hifiberry_dacpro_round_rate,
 	.set_rate = clk_hifiberry_dacpro_set_rate,
@@ -97,6 +203,9 @@ static int clk_hifiberry_dacpro_probe(struct platform_device *pdev)
 
 	dev = &pdev->dev;
 
+	pcm512x_gpios_table.dev_id = dev_name(dev);
+	gpiod_add_lookup_table(&pcm512x_gpios_table);
+
 	proclk = devm_kzalloc(dev, sizeof(*proclk), GFP_KERNEL);
 	if (!proclk)
 		return -ENOMEM;
@@ -107,6 +216,7 @@ static int clk_hifiberry_dacpro_probe(struct platform_device *pdev)
 	init.parent_names = NULL;
 	init.num_parents = 0;
 
+	proclk->dev = dev;
 	proclk->mode = 0;
 	proclk->hw.init = &init;
 
-- 
2.20.1

