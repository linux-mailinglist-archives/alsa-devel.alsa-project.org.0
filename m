Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2E81A3B04
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 22:01:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 795CD16AA;
	Thu,  9 Apr 2020 22:00:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 795CD16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586462499;
	bh=SEyh1KtOhmn1V16O/kUsWI/JyZ/H1iTbf8RbvFUOiZ8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QafsPYlR7LhxjE1AUK8xRxY+jufEAS3cj8NaN7jJQLPHJF5c15B/vQkscPN6OS5xS
	 vUKqm7locNkcKvSa/tCePRc3FmdcpXuOFavP1bpx5r5gRPp0nHb2AJ/Qc7kZh0BXCU
	 Ig07HzukZQBBGZUpwRVRdytspio04THJyzAPE8X4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC54BF801D8;
	Thu,  9 Apr 2020 21:59:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF9F2F800FD; Thu,  9 Apr 2020 21:59:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D269F800FD
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 21:59:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D269F800FD
IronPort-SDR: YDwQiRrB/f0PCInS78X6f4gEGL5j5CDrLG6z3oiNFtX1iqWrhE/3rkU/pPcCDKIjGsG8ZV4XMl
 gRJQ9NigIk7Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 12:59:01 -0700
IronPort-SDR: zsBoogpDr0xCLQhOQuZGn/J3+C17ujzvoAH00VGakkshqxRHh5LiH77aD24T7xzO9BYY9XqE5E
 WPB4xf//z4Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; d="scan'208";a="242745277"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
 by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 12:58:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 01/16] ASoC: pcm512x: expose 6 GPIOs
Date: Thu,  9 Apr 2020 14:58:26 -0500
Message-Id: <20200409195841.18901-2-pierre-louis.bossart@linux.intel.com>
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

The GPIOs are used e.g. on HifiBerry DAC+ HATs to control the LED
(GPIO3) and the choice of the 44.1 (GPIO6) or 48 (GPIO3) kHz
oscillator (when present).

Enable basic gpio_chip to get/set values and get/set
directions. Tested with GPIO_LIB from sys/class/gpio, the LED turns
on/off as desired.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/pcm512x.c | 108 +++++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index 4cbef9affffd..4f895a588c31 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -10,6 +10,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/clk.h>
+#include <linux/gpio/driver.h>
 #include <linux/kernel.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -32,6 +33,7 @@ static const char * const pcm512x_supply_names[PCM512x_NUM_SUPPLIES] = {
 struct pcm512x_priv {
 	struct regmap *regmap;
 	struct clk *sclk;
+	struct gpio_chip chip;
 	struct regulator_bulk_data supplies[PCM512x_NUM_SUPPLIES];
 	struct notifier_block supply_nb[PCM512x_NUM_SUPPLIES];
 	int fmt;
@@ -1503,6 +1505,102 @@ const struct regmap_config pcm512x_regmap = {
 };
 EXPORT_SYMBOL_GPL(pcm512x_regmap);
 
+static int pcm512x_gpio_get_direction(struct gpio_chip *chip,
+				      unsigned int offset)
+{
+	struct pcm512x_priv *pcm512x = gpiochip_get_data(chip);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(pcm512x->regmap, PCM512x_GPIO_EN, &val);
+	if (ret < 0)
+		return ret;
+
+	val = (val >> offset) & 1;
+
+	/* val is 0 for input, 1 for output, return inverted */
+	return val ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
+}
+
+static int pcm512x_gpio_direction_input(struct gpio_chip *chip,
+					unsigned int offset)
+{
+	struct pcm512x_priv *pcm512x = gpiochip_get_data(chip);
+
+	return regmap_update_bits(pcm512x->regmap, PCM512x_GPIO_EN,
+				  BIT(offset), 0);
+}
+
+static int pcm512x_gpio_direction_output(struct gpio_chip *chip,
+					 unsigned int offset,
+					 int value)
+{
+	struct pcm512x_priv *pcm512x = gpiochip_get_data(chip);
+	unsigned int reg;
+	int ret;
+
+	/* select Register GPIOx output for OUTPUT_x (1..6) */
+	reg = PCM512x_GPIO_OUTPUT_1 + offset;
+	ret = regmap_update_bits(pcm512x->regmap, reg, 0x0f, 0x02);
+	if (ret < 0)
+		return ret;
+
+	/* enable output x */
+	ret = regmap_update_bits(pcm512x->regmap, PCM512x_GPIO_EN,
+				 BIT(offset), BIT(offset));
+	if (ret < 0)
+		return ret;
+
+	/* set value */
+	return regmap_update_bits(pcm512x->regmap, PCM512x_GPIO_CONTROL_1,
+				  BIT(offset), value << offset);
+}
+
+static int pcm512x_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct pcm512x_priv *pcm512x = gpiochip_get_data(chip);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(pcm512x->regmap, PCM512x_GPIO_CONTROL_1, &val);
+	if (ret < 0)
+		return ret;
+
+	return (val >> offset) & 1;
+}
+
+static void pcm512x_gpio_set(struct gpio_chip *chip, unsigned int offset,
+			     int value)
+{
+	struct pcm512x_priv *pcm512x = gpiochip_get_data(chip);
+	int ret;
+
+	ret = regmap_update_bits(pcm512x->regmap, PCM512x_GPIO_CONTROL_1,
+				 BIT(offset), value << offset);
+
+	if (ret < 0)
+		pr_debug("%s: regmap_update_bits failed: %d\n", __func__, ret);
+}
+
+/* list human-readable names, makes GPIOLIB usage straightforward */
+static const char * const pcm512x_gpio_names[] = {
+	"PCM512x-GPIO1", "PCM512x-GPIO2", "PCM512x-GPIO3",
+	"PCM512x-GPIO4", "PCM512x-GPIO5", "PCM512x-GPIO6"
+};
+
+static const struct gpio_chip template_chip = {
+	.label			= "pcm512x-gpio",
+	.names			= pcm512x_gpio_names,
+	.owner			= THIS_MODULE,
+	.get_direction		= pcm512x_gpio_get_direction,
+	.direction_input	= pcm512x_gpio_direction_input,
+	.direction_output	= pcm512x_gpio_direction_output,
+	.get			= pcm512x_gpio_get,
+	.set			= pcm512x_gpio_set,
+	.base			= -1, /* let gpiolib select the base */
+	.ngpio			= ARRAY_SIZE(pcm512x_gpio_names),
+};
+
 int pcm512x_probe(struct device *dev, struct regmap *regmap)
 {
 	struct pcm512x_priv *pcm512x;
@@ -1563,6 +1661,16 @@ int pcm512x_probe(struct device *dev, struct regmap *regmap)
 		goto err;
 	}
 
+	/* expose 6 GPIO pins, numbered from 1 to 6 */
+	pcm512x->chip = template_chip;
+	pcm512x->chip.parent = dev;
+
+	ret = devm_gpiochip_add_data(dev, &pcm512x->chip, pcm512x);
+	if (ret != 0) {
+		dev_err(dev, "Failed to register gpio chip: %d\n", ret);
+		goto err;
+	}
+
 	pcm512x->sclk = devm_clk_get(dev, NULL);
 	if (PTR_ERR(pcm512x->sclk) == -EPROBE_DEFER) {
 		ret = -EPROBE_DEFER;
-- 
2.20.1

