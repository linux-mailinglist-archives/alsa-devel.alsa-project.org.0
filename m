Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CDC4C8BE1
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 13:43:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 256031B08;
	Tue,  1 Mar 2022 13:42:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 256031B08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646138628;
	bh=wZUrsMBY6+5d7gxUTFFdvoJ87ATmGhzUBUGIFH8Aol8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vNzmmI+8ggxyMkIovZ/64QPd9Mqku9C1EJcCsLSzYsGdwJ2VLsbghSV4NAe5I/rdp
	 Hg4xga2UwEBM+woxZ4KRu/H5/hyHw/xHi2Asbu2dZA65+QgDpglsEQIVN/uDwx7ISx
	 0w+zzI9lXPHuiXr9zD/5xHW3vGU3W07n7jBsW970=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66F04F80516;
	Tue,  1 Mar 2022 13:42:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCC6EF80511; Tue,  1 Mar 2022 13:42:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC00AF801D8
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 13:42:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC00AF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="huZ+tCVm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1646138526;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=2KtJQ1RKQJblfXNU6efNM3rKLhsvuJUUsD0HH9WcNJ8=;
 b=huZ+tCVmlmS9C8CoJga+fjSVPwAzigVsJf3GI5hTrrt2CIMouz+AAOT7A/Oe5UP88O
 mEXdH87BMKCAa5TpiFEBiY7/2Gtlm8aLQGkc30oLTvjWe+nTlMFRx20Voz0ogI3wuIlT
 ADA/bL32IbW7+SFsyUMjW0ZC9JgyurQcqlwuAQ1lAMNgRv6zX+1/YTF8g84euPMhHPc0
 piDOqVktcAUZUIQP7iFVPy67hvrs2cV6dYe6WhqioeTFyOjgYyu9nEs7+fVKf7yJLXY+
 t8bz37dCyVcZHtwBmWWlUUVUQ1bYQPyztSJ4WHRnsCQfDGNxzumiZ+OWtRoN1nNTSOfa
 ENhA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL2ZP6Q"
X-RZG-CLASS-ID: mo00
Received: from droid.. by smtp.strato.de (RZmta 47.40.1 AUTH)
 with ESMTPSA id kdc58dy21Cg5a4o
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 1 Mar 2022 13:42:05 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: codecs: Add Awinic AW8738 audio amplifier driver
Date: Tue,  1 Mar 2022 13:37:42 +0100
Message-Id: <20220301123742.72146-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301123742.72146-1-stephan@gerhold.net>
References: <20220301123742.72146-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 Jonathan Albrieux <jonathan.albrieux@gmail.com>
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

From: Jonathan Albrieux <jonathan.albrieux@gmail.com>

The Awinic AW8738 is a simple audio amplifier using an enable GPIO.
The main difference to simple-amplifier is that there is a "one-wire
pulse control" that allows configuring the amplifier to one of a few
pre-defined modes.

Add a simple driver that allows setting it up in the device tree
with a specified mode number.

Signed-off-by: Jonathan Albrieux <jonathan.albrieux@gmail.com>
Co-developed-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/codecs/Kconfig  |  10 ++++
 sound/soc/codecs/Makefile |   2 +
 sound/soc/codecs/aw8738.c | 104 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 116 insertions(+)
 create mode 100644 sound/soc/codecs/aw8738.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 4de029ae377c..0e35d33f8590 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -53,6 +53,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_AK5558
 	imply SND_SOC_ALC5623
 	imply SND_SOC_ALC5632
+	imply SND_SOC_AW8738
 	imply SND_SOC_BT_SCO
 	imply SND_SOC_BD28623
 	imply SND_SOC_CQ0093VC
@@ -579,6 +580,15 @@ config SND_SOC_ALC5632
 	tristate
 	depends on I2C
 
+config SND_SOC_AW8738
+	tristate "Awinic AW8738 Audio Amplifier"
+	select GPIOLIB
+	help
+	  Enable support for the Awinic AW8738 audio amplifier (or similar).
+	  The driver supports simple audio amplifiers similar to
+	  SND_SOC_SIMPLE_AMPLIFIER, but additionally allows setting the
+	  amplifier mode using the Awinic-specific one-wire pulse control.
+
 config SND_SOC_BD28623
 	tristate "ROHM BD28623 CODEC"
 	help
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index c3c6059a5f8a..8637e9e869e3 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -45,6 +45,7 @@ snd-soc-ak4671-objs := ak4671.o
 snd-soc-ak5386-objs := ak5386.o
 snd-soc-ak5558-objs := ak5558.o
 snd-soc-arizona-objs := arizona.o arizona-jack.o
+snd-soc-aw8738-objs := aw8738.o
 snd-soc-bd28623-objs := bd28623.o
 snd-soc-bt-sco-objs := bt-sco.o
 snd-soc-cpcap-objs := cpcap.o
@@ -388,6 +389,7 @@ obj-$(CONFIG_SND_SOC_AK5558)	+= snd-soc-ak5558.o
 obj-$(CONFIG_SND_SOC_ALC5623)    += snd-soc-alc5623.o
 obj-$(CONFIG_SND_SOC_ALC5632)	+= snd-soc-alc5632.o
 obj-$(CONFIG_SND_SOC_ARIZONA)	+= snd-soc-arizona.o
+obj-$(CONFIG_SND_SOC_AW8738)	+= snd-soc-aw8738.o
 obj-$(CONFIG_SND_SOC_BD28623)	+= snd-soc-bd28623.o
 obj-$(CONFIG_SND_SOC_BT_SCO)	+= snd-soc-bt-sco.o
 obj-$(CONFIG_SND_SOC_CQ0093VC) += snd-soc-cq93vc.o
diff --git a/sound/soc/codecs/aw8738.c b/sound/soc/codecs/aw8738.c
new file mode 100644
index 000000000000..b075c7c0efd0
--- /dev/null
+++ b/sound/soc/codecs/aw8738.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+#include <sound/soc.h>
+
+struct aw8738_priv {
+	struct gpio_desc *gpiod_enable;
+	unsigned int mode;
+};
+
+static int aw8738_drv_event(struct snd_soc_dapm_widget *w,
+			    struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *c = snd_soc_dapm_to_component(w->dapm);
+	struct aw8738_priv *aw = snd_soc_component_get_drvdata(c);
+	int i;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		for (i = 0; i < aw->mode; i++) {
+			gpiod_set_value_cansleep(aw->gpiod_enable, 0);
+			udelay(2);
+			gpiod_set_value_cansleep(aw->gpiod_enable, 1);
+			udelay(2);
+		}
+		msleep(40);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		gpiod_set_value_cansleep(aw->gpiod_enable, 0);
+		usleep_range(1000, 2000);
+		break;
+	default:
+		WARN(1, "Unexpected event");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget aw8738_dapm_widgets[] = {
+	SND_SOC_DAPM_INPUT("IN"),
+	SND_SOC_DAPM_OUT_DRV_E("DRV", SND_SOC_NOPM, 0, 0, NULL, 0, aw8738_drv_event,
+			       SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
+	SND_SOC_DAPM_OUTPUT("OUT"),
+};
+
+static const struct snd_soc_dapm_route aw8738_dapm_routes[] = {
+	{ "DRV", NULL, "IN" },
+	{ "OUT", NULL, "DRV" },
+};
+
+static const struct snd_soc_component_driver aw8738_component_driver = {
+	.dapm_widgets = aw8738_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(aw8738_dapm_widgets),
+	.dapm_routes = aw8738_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(aw8738_dapm_routes),
+};
+
+static int aw8738_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct aw8738_priv *aw;
+	int ret;
+
+	aw = devm_kzalloc(dev, sizeof(*aw), GFP_KERNEL);
+	if (!aw)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, aw);
+
+	aw->gpiod_enable = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(aw->gpiod_enable))
+		return dev_err_probe(dev, PTR_ERR(aw->gpiod_enable),
+				     "Failed to get 'enable' gpio");
+
+	ret = device_property_read_u32(dev, "awinic,mode", &aw->mode);
+	if (ret)
+		return -EINVAL;
+
+	return devm_snd_soc_register_component(&pdev->dev,
+					       &aw8738_component_driver,
+					       NULL, 0);
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id aw8738_of_match[] = {
+	{ .compatible = "awinic,aw8738" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, aw8738_of_match);
+#endif
+
+static struct platform_driver aw8738_driver = {
+	.probe	= aw8738_probe,
+	.driver = {
+		.name = "aw8738",
+		.of_match_table = of_match_ptr(aw8738_of_match),
+	},
+};
+module_platform_driver(aw8738_driver);
+
+MODULE_DESCRIPTION("Awinic AW8738 Amplifier Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.35.1

