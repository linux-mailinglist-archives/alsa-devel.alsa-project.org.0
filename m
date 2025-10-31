Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF925C23907
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Oct 2025 08:34:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED51C60226;
	Fri, 31 Oct 2025 08:34:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED51C60226
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1761896074;
	bh=geq5DyBJqS1DrcV3T+kwYknXfXGfVCHGkjlngra4p5o=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mBTz6GCCjwf4oIHoBFVr58t2Xeal46Xq37qcdcv5q6lUDxwEvUdwJVYbiHIhsRzlz
	 SUVr1Q4omgWFdwYxN8s/PLjZ98vCjikssOZITr8QXpYSg05b2nzq3jeN/4U6dve8IX
	 PAY7CAwbTUcmhG0lgvLDGhjTKb8Z1cDi4teviCZ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05D46F805F0; Fri, 31 Oct 2025 08:33:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AE70F805F5;
	Fri, 31 Oct 2025 08:33:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 266F3F80254; Fri, 31 Oct 2025 08:31:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0F1FF80038
	for <alsa-devel@alsa-project.org>; Fri, 31 Oct 2025 08:31:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0F1FF80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=v7f4ZDNQ
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 59V7UtCT23389767,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1761895855; bh=FkF1kpWTp+g6vPitXKVRmCJYtes6/c9HImHCBxdlUaI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=v7f4ZDNQkHnQ7/lqiu7j/qgkKPJYxFfBs9YiCY7oOdezBxR11K0r3/dJANmWfoCOl
	 k4BJWuCevVGqIzQPbfVC0bBbCpPtq+cToHCDOD2kcpWuRPo+lQAkJd3As9E0X26RRK
	 y6MXZUzwWSuE81OqZ5juRTO0+MhArFxA4U313I8evtdBT342pjCZfBXToJATapIQQr
	 rQu/W5GTV/BqOUflrtn1BLCjnaPHuIF6Wn5BqQBSRwsUVVYi16Dah8zMbSm1+O3Fnm
	 NrbQ7jqy/38kPHbH1hf2BbJ2/oxrnw+qEBMMCyRJBjMRnbYsDxJJc5mfBFEKjnemup
	 gmFsbOLivcUSg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.13/5.93) with ESMTPS id 59V7UtCT23389767
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Oct 2025 15:30:55 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Fri, 31 Oct 2025 15:30:54 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Fri, 31 Oct 2025 15:30:53 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server id
 15.2.1544.27 via Frontend Transport; Fri, 31 Oct 2025 15:30:53 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <alsa-devel@alsa-project.org>, <flove@realtek.com>,
 <shumingf@realtek.com>,
        <jack.yu@realtek.com>, <derek.fang@realtek.com>,
        "Oder Chiou" <oder_chiou@realtek.com>
Subject: [PATCH v6 1/2] ASoC: rt5575: Add the codec driver for the ALC5575
Date: Fri, 31 Oct 2025 15:32:44 +0800
Message-ID: <20251031073245.3629060-1-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: 3C6DLLC3WTB3L32J7MGUH3PR2VL2P5YU
X-Message-ID-Hash: 3C6DLLC3WTB3L32J7MGUH3PR2VL2P5YU
X-MailFrom: oder_chiou@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3C6DLLC3WTB3L32J7MGUH3PR2VL2P5YU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The ALC5575 integrates an audio DSP that typically loads its firmware
from an external flash via its own SPI host interface. In certain
hardware configurations, the firmware can alternatively be loaded
through the SPI client interface. The driver provides basic mute and
volume control functions. When the SPI client interface is enabled,
firmware loading is handled by the SPI driver.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 sound/soc/codecs/Kconfig      |  10 +
 sound/soc/codecs/Makefile     |   4 +
 sound/soc/codecs/rt5575-spi.c |  95 +++++++++
 sound/soc/codecs/rt5575-spi.h |  16 ++
 sound/soc/codecs/rt5575.c     | 366 ++++++++++++++++++++++++++++++++++
 sound/soc/codecs/rt5575.h     |  54 +++++
 6 files changed, 545 insertions(+)
 create mode 100644 sound/soc/codecs/rt5575-spi.c
 create mode 100644 sound/soc/codecs/rt5575-spi.h
 create mode 100644 sound/soc/codecs/rt5575.c
 create mode 100644 sound/soc/codecs/rt5575.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index a0dfef57200c..cb4e14013cc8 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -211,6 +211,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_RT1305
 	imply SND_SOC_RT1308
 	imply SND_SOC_RT5514
+	imply SND_SOC_RT5575
 	imply SND_SOC_RT5616
 	imply SND_SOC_RT5631
 	imply SND_SOC_RT5640
@@ -1767,6 +1768,15 @@ config SND_SOC_RT5514_SPI_BUILTIN
 	bool # force RT5514_SPI to be built-in to avoid link errors
 	default SND_SOC_RT5514=y && SND_SOC_RT5514_SPI=m
 
+config SND_SOC_RT5575
+	tristate
+	depends on I2C
+
+config SND_SOC_RT5575_SPI
+	tristate
+	depends on SPI_MASTER
+	select SND_SOC_RT5575
+
 config SND_SOC_RT5616
 	tristate "Realtek RT5616 CODEC"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 39138d96a720..82f660cbe8ec 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -252,6 +252,8 @@ snd-soc-rt286-y := rt286.o
 snd-soc-rt298-y := rt298.o
 snd-soc-rt5514-y := rt5514.o
 snd-soc-rt5514-spi-y := rt5514-spi.o
+snd-soc-rt5575-y := rt5575.o
+snd-soc-rt5575-spi-y := rt5575-spi.o
 snd-soc-rt5616-y := rt5616.o
 snd-soc-rt5631-y := rt5631.o
 snd-soc-rt5640-y := rt5640.o
@@ -684,6 +686,8 @@ obj-$(CONFIG_SND_SOC_RT298)	+= snd-soc-rt298.o
 obj-$(CONFIG_SND_SOC_RT5514)	+= snd-soc-rt5514.o
 obj-$(CONFIG_SND_SOC_RT5514_SPI)	+= snd-soc-rt5514-spi.o
 obj-$(CONFIG_SND_SOC_RT5514_SPI_BUILTIN)	+= snd-soc-rt5514-spi.o
+obj-$(CONFIG_SND_SOC_RT5575)	+= snd-soc-rt5575.o
+obj-$(CONFIG_SND_SOC_RT5575_SPI)	+= snd-soc-rt5575-spi.o
 obj-$(CONFIG_SND_SOC_RT5616)	+= snd-soc-rt5616.o
 obj-$(CONFIG_SND_SOC_RT5631)	+= snd-soc-rt5631.o
 obj-$(CONFIG_SND_SOC_RT5640)	+= snd-soc-rt5640.o
diff --git a/sound/soc/codecs/rt5575-spi.c b/sound/soc/codecs/rt5575-spi.c
new file mode 100644
index 000000000000..cf30d22e8a8f
--- /dev/null
+++ b/sound/soc/codecs/rt5575-spi.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * rt5575-spi.c  --  ALC5575 SPI driver
+ *
+ * Copyright(c) 2025 Realtek Semiconductor Corp.
+ *
+ */
+
+#include <linux/of.h>
+#include <linux/spi/spi.h>
+
+#include "rt5575-spi.h"
+
+#define RT5575_SPI_BUF_LEN	240
+
+/* SPI Command */
+enum {
+	RT5575_SPI_CMD_16_READ = 0,
+	RT5575_SPI_CMD_16_WRITE,
+	RT5575_SPI_CMD_32_READ,
+	RT5575_SPI_CMD_32_WRITE,
+	RT5575_SPI_CMD_BURST_READ,
+	RT5575_SPI_CMD_BURST_WRITE,
+};
+
+struct rt5575_spi_burst_write {
+	u8 cmd;
+	u32 addr;
+	u8 data[RT5575_SPI_BUF_LEN];
+	u8 dummy;
+} __packed;
+
+bool rt5575_spi_ready;
+static struct spi_device *rt5575_spi;
+
+/**
+ * rt5575_spi_burst_write - Write data to SPI by rt5575 address.
+ * @addr: Start address.
+ * @txbuf: Data buffer for writng.
+ * @len: Data length.
+ *
+ */
+int rt5575_spi_burst_write(u32 addr, const u8 *txbuf, size_t len)
+{
+	struct rt5575_spi_burst_write buf = {
+		.cmd = RT5575_SPI_CMD_BURST_WRITE
+	};
+	unsigned int end, offset = 0;
+
+	while (offset < len) {
+		if (offset + RT5575_SPI_BUF_LEN <= len)
+			end = RT5575_SPI_BUF_LEN;
+		else
+			end = len % RT5575_SPI_BUF_LEN;
+
+		buf.addr = cpu_to_le32(addr + offset);
+
+		memcpy(&buf.data, &txbuf[offset], end);
+
+		spi_write(rt5575_spi, &buf, sizeof(struct rt5575_spi_burst_write));
+
+		offset += RT5575_SPI_BUF_LEN;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(rt5575_spi_burst_write);
+
+static int rt5575_spi_probe(struct spi_device *spi)
+{
+	rt5575_spi = spi;
+
+	rt5575_spi_ready = true;
+
+	return 0;
+}
+
+static const struct of_device_id rt5575_of_match[] = {
+	{ .compatible = "realtek,rt5575" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rt5575_of_match);
+
+static struct spi_driver rt5575_spi_driver = {
+	.driver = {
+		.name = "rt5575",
+		.of_match_table = of_match_ptr(rt5575_of_match),
+	},
+	.probe = rt5575_spi_probe,
+};
+module_spi_driver(rt5575_spi_driver);
+
+MODULE_DESCRIPTION("ALC5575 SPI driver");
+MODULE_AUTHOR("Oder Chiou <oder_chiou@realtek.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/rt5575-spi.h b/sound/soc/codecs/rt5575-spi.h
new file mode 100644
index 000000000000..cafe49a7ecc2
--- /dev/null
+++ b/sound/soc/codecs/rt5575-spi.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * rt5575-spi.h  --  ALC5575 SPI driver
+ *
+ * Copyright(c) 2025 Realtek Semiconductor Corp.
+ *
+ */
+
+#ifndef __RT5575_SPI_H__
+#define __RT5575_SPI_H__
+
+extern bool rt5575_spi_ready;
+
+int rt5575_spi_burst_write(u32 addr, const u8 *txbuf, size_t len);
+
+#endif /* __RT5575_SPI_H__ */
diff --git a/sound/soc/codecs/rt5575.c b/sound/soc/codecs/rt5575.c
new file mode 100644
index 000000000000..58cceaac0705
--- /dev/null
+++ b/sound/soc/codecs/rt5575.c
@@ -0,0 +1,366 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * rt5575.c  --  ALC5575 ALSA SoC audio component driver
+ *
+ * Copyright(c) 2025 Realtek Semiconductor Corp.
+ *
+ */
+
+#include <linux/firmware.h>
+#include <linux/i2c.h>
+#include <sound/soc.h>
+#include <sound/tlv.h>
+
+#include "rt5575.h"
+#if IS_ENABLED(CONFIG_SND_SOC_RT5575_SPI)
+#include "rt5575-spi.h"
+#endif
+
+static bool rt5575_readable_register(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case RT5575_ID:
+	case RT5575_ID_1:
+	case RT5575_MIXL_VOL:
+	case RT5575_MIXR_VOL:
+	case RT5575_PROMPT_VOL:
+	case RT5575_SPK01_VOL:
+	case RT5575_SPK23_VOL:
+	case RT5575_MIC1_VOL:
+	case RT5575_MIC2_VOL:
+	case RT5575_WNC_CTRL:
+	case RT5575_MODE_CTRL:
+	case RT5575_I2S_RATE_CTRL:
+	case RT5575_SLEEP_CTRL:
+	case RT5575_ALG_BYPASS_CTRL:
+	case RT5575_PINMUX_CTRL_2:
+	case RT5575_GPIO_CTRL_1:
+	case RT5575_DSP_BUS_CTRL:
+	case RT5575_SW_INT:
+	case RT5575_DSP_BOOT_ERR:
+	case RT5575_DSP_READY:
+	case RT5575_DSP_CMD_ADDR:
+	case RT5575_EFUSE_DATA_2:
+	case RT5575_EFUSE_DATA_3:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const DECLARE_TLV_DB_SCALE(ob_tlv, -9525, 75, 0);
+
+#if IS_ENABLED(CONFIG_SND_SOC_RT5575_SPI)
+static void rt5575_spi_fw_loaded(const struct firmware *fw, void *context)
+{
+	struct rt5575_priv *rt5575 = context;
+	struct i2c_client *i2c = rt5575->i2c;
+	const struct firmware *firmware;
+	static const char * const fw_path[] = {
+		"realtek/rt5575/rt5575_fw2.bin", "realtek/rt5575/rt5575_fw3.bin",
+		"realtek/rt5575/rt5575_fw4.bin"
+	};
+	static const u32 fw_addr[] = { 0x5f600000, 0x5f7fe000, 0x5f7ff000 };
+	int i, ret;
+
+	regmap_write(rt5575->dsp_regmap, 0xfafafafa, 0x00000004);
+	regmap_write(rt5575->dsp_regmap, 0x18008064, 0x00000000);
+	regmap_write(rt5575->dsp_regmap, 0x18008068, 0x0002ffff);
+
+	rt5575_spi_burst_write(0x5f400000, fw->data, fw->size);
+	release_firmware(fw);
+
+	for (i = 0; i < ARRAY_SIZE(fw_addr); i++) {
+		ret = request_firmware(&firmware, fw_path[i], &i2c->dev);
+		if (ret == 0) {
+			rt5575_spi_burst_write(fw_addr[i], firmware->data, firmware->size);
+			release_firmware(firmware);
+		}
+	}
+
+	regmap_write(rt5575->dsp_regmap, 0x18000000, 0x00000000);
+
+	regmap_update_bits(rt5575->regmap, RT5575_SW_INT, 1, 1);
+
+	regmap_read_poll_timeout(rt5575->regmap, RT5575_SW_INT, ret, !ret, 100000, 10000000);
+
+	if (ret)
+		dev_err(&i2c->dev, "Firmware failure\n");
+}
+#endif
+
+static const struct snd_kcontrol_new rt5575_snd_controls[] = {
+	SOC_DOUBLE("Speaker01 Playback Switch", RT5575_SPK01_VOL, 31, 15, 1, 1),
+	SOC_DOUBLE_TLV("Speaker01 Playback Volume", RT5575_SPK01_VOL, 17, 1, 167, 0, ob_tlv),
+	SOC_DOUBLE("Speaker23 Playback Switch", RT5575_SPK23_VOL, 31, 15, 1, 1),
+	SOC_DOUBLE_TLV("Speaker23 Playback Volume", RT5575_SPK23_VOL, 17, 1, 167, 0, ob_tlv),
+	SOC_DOUBLE("Mic1 Capture Switch", RT5575_MIC1_VOL, 31, 15, 1, 1),
+	SOC_DOUBLE_TLV("Mic1 Capture Volume", RT5575_MIC1_VOL, 17, 1, 167, 0, ob_tlv),
+	SOC_DOUBLE("Mic2 Capture Switch", RT5575_MIC2_VOL, 31, 15, 1, 1),
+	SOC_DOUBLE_TLV("Mic2 Capture Volume", RT5575_MIC2_VOL, 17, 1, 167, 0, ob_tlv),
+	SOC_DOUBLE_R("Mix Playback Switch", RT5575_MIXL_VOL, RT5575_MIXR_VOL, 31, 1, 1),
+	SOC_DOUBLE_R_TLV("Mix Playback Volume", RT5575_MIXL_VOL, RT5575_MIXR_VOL, 1, 127, 0,
+		ob_tlv),
+	SOC_DOUBLE("Prompt Playback Switch", RT5575_PROMPT_VOL, 31, 15, 1, 1),
+	SOC_DOUBLE_TLV("Prompt Playback Volume", RT5575_PROMPT_VOL, 17, 1, 167, 0, ob_tlv),
+};
+
+static const struct snd_soc_dapm_widget rt5575_dapm_widgets[] = {
+	SND_SOC_DAPM_AIF_IN("AIF1RX", "AIF1 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("AIF1TX", "AIF1 Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("AIF2RX", "AIF2 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("AIF2TX", "AIF2 Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("AIF3RX", "AIF3 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("AIF3TX", "AIF3 Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("AIF4RX", "AIF4 Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("AIF4TX", "AIF4 Capture", 0, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_INPUT("INPUT"),
+	SND_SOC_DAPM_OUTPUT("OUTPUT"),
+};
+
+static const struct snd_soc_dapm_route rt5575_dapm_routes[] = {
+	{ "AIF1TX", NULL, "INPUT" },
+	{ "AIF2TX", NULL, "INPUT" },
+	{ "AIF3TX", NULL, "INPUT" },
+	{ "AIF4TX", NULL, "INPUT" },
+	{ "OUTPUT", NULL, "AIF1RX" },
+	{ "OUTPUT", NULL, "AIF2RX" },
+	{ "OUTPUT", NULL, "AIF3RX" },
+	{ "OUTPUT", NULL, "AIF4RX" },
+};
+
+static long long rt5575_get_priv_id(struct rt5575_priv *rt5575)
+{
+	int priv_id_low, priv_id_high;
+
+	regmap_write(rt5575->regmap, RT5575_EFUSE_PID, 0xa0000000);
+	regmap_read(rt5575->regmap, RT5575_EFUSE_DATA_2, &priv_id_low);
+	regmap_read(rt5575->regmap, RT5575_EFUSE_DATA_3, &priv_id_high);
+	regmap_write(rt5575->regmap, RT5575_EFUSE_PID, 0);
+
+	return ((long long)priv_id_high << 32) | (long long)priv_id_low;
+}
+
+static int rt5575_probe(struct snd_soc_component *component)
+{
+	struct rt5575_priv *rt5575 = snd_soc_component_get_drvdata(component);
+
+	rt5575->component = component;
+
+	dev_info(component->dev, "Private ID: %llx\n", rt5575_get_priv_id(rt5575));
+
+#if IS_ENABLED(CONFIG_SND_SOC_RT5575_SPI)
+	request_firmware_nowait(THIS_MODULE, FW_ACTION_UEVENT, "realtek/rt5575/rt5575_fw1.bin",
+		component->dev, GFP_KERNEL, rt5575, rt5575_spi_fw_loaded);
+#endif
+
+	return 0;
+}
+
+#define RT5575_STEREO_RATES SNDRV_PCM_RATE_8000_192000
+#define RT5575_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
+			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S8 | \
+			SNDRV_PCM_FMTBIT_S32_LE)
+
+static struct snd_soc_dai_driver rt5575_dai[] = {
+	{
+		.name = "rt5575-aif1",
+		.id = RT5575_AIF1,
+		.playback = {
+			.stream_name = "AIF1 Playback",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = RT5575_STEREO_RATES,
+			.formats = RT5575_FORMATS,
+		},
+		.capture = {
+			.stream_name = "AIF1 Capture",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = RT5575_STEREO_RATES,
+			.formats = RT5575_FORMATS,
+		},
+	},
+	{
+		.name = "rt5575-aif2",
+		.id = RT5575_AIF2,
+		.playback = {
+			.stream_name = "AIF2 Playback",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = RT5575_STEREO_RATES,
+			.formats = RT5575_FORMATS,
+		},
+		.capture = {
+			.stream_name = "AIF2 Capture",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = RT5575_STEREO_RATES,
+			.formats = RT5575_FORMATS,
+		},
+	},
+	{
+		.name = "rt5575-aif3",
+		.id = RT5575_AIF3,
+		.playback = {
+			.stream_name = "AIF3 Playback",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = RT5575_STEREO_RATES,
+			.formats = RT5575_FORMATS,
+		},
+		.capture = {
+			.stream_name = "AIF3 Capture",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = RT5575_STEREO_RATES,
+			.formats = RT5575_FORMATS,
+		},
+	},
+	{
+		.name = "rt5575-aif4",
+		.id = RT5575_AIF4,
+		.playback = {
+			.stream_name = "AIF4 Playback",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = RT5575_STEREO_RATES,
+			.formats = RT5575_FORMATS,
+		},
+		.capture = {
+			.stream_name = "AIF4 Capture",
+			.channels_min = 1,
+			.channels_max = 8,
+			.rates = RT5575_STEREO_RATES,
+			.formats = RT5575_FORMATS,
+		},
+	},
+};
+
+static const struct snd_soc_component_driver rt5575_soc_component_dev = {
+	.probe = rt5575_probe,
+	.controls = rt5575_snd_controls,
+	.num_controls = ARRAY_SIZE(rt5575_snd_controls),
+	.dapm_widgets = rt5575_dapm_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(rt5575_dapm_widgets),
+	.dapm_routes = rt5575_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(rt5575_dapm_routes),
+	.use_pmdown_time = 1,
+	.endianness = 1,
+};
+
+static const struct regmap_config rt5575_dsp_regmap = {
+	.name = "dsp",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 2,
+};
+
+static int rt5575_i2c_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct i2c_client *client = context;
+	struct rt5575_priv *rt5575 = i2c_get_clientdata(client);
+
+	regmap_read(rt5575->dsp_regmap, reg | RT5575_DSP_MAPPING, val);
+
+	return 0;
+}
+
+static int rt5575_i2c_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct i2c_client *client = context;
+	struct rt5575_priv *rt5575 = i2c_get_clientdata(client);
+
+	regmap_write(rt5575->dsp_regmap, reg | RT5575_DSP_MAPPING, val);
+
+	return 0;
+}
+
+static const struct regmap_config rt5575_regmap = {
+	.reg_bits = 16,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = 0xfffc,
+	.readable_reg = rt5575_readable_register,
+	.reg_read = rt5575_i2c_read,
+	.reg_write = rt5575_i2c_write,
+	.use_single_read = true,
+	.use_single_write = true,
+};
+
+static const struct i2c_device_id rt5575_i2c_id[] = {
+	{ "rt5575" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, rt5575_i2c_id);
+
+static int rt5575_i2c_probe(struct i2c_client *i2c)
+{
+	struct rt5575_priv *rt5575;
+	int ret, val;
+
+#if IS_ENABLED(CONFIG_SND_SOC_RT5575_SPI)
+	if (!rt5575_spi_ready)
+		return -EPROBE_DEFER;
+#endif
+
+	rt5575 = devm_kzalloc(&i2c->dev, sizeof(struct rt5575_priv),
+				GFP_KERNEL);
+	if (rt5575 == NULL)
+		return -ENOMEM;
+
+	i2c_set_clientdata(i2c, rt5575);
+
+	rt5575->i2c = i2c;
+
+	rt5575->dsp_regmap = devm_regmap_init_i2c(i2c, &rt5575_dsp_regmap);
+	if (IS_ERR(rt5575->dsp_regmap)) {
+		ret = PTR_ERR(rt5575->dsp_regmap);
+		dev_err(&i2c->dev, "Failed to allocate register map: %d\n", ret);
+		return ret;
+	}
+
+	rt5575->regmap = devm_regmap_init(&i2c->dev, NULL, i2c, &rt5575_regmap);
+	if (IS_ERR(rt5575->regmap)) {
+		ret = PTR_ERR(rt5575->regmap);
+		dev_err(&i2c->dev, "Failed to allocate register map: %d\n", ret);
+		return ret;
+	}
+
+	regmap_read(rt5575->regmap, RT5575_ID, &val);
+	if (val != RT5575_DEVICE_ID) {
+		dev_err(&i2c->dev, "Device with ID register %08x is not rt5575\n", val);
+		return -ENODEV;
+	}
+
+	regmap_read(rt5575->regmap, RT5575_ID_1, &val);
+	if (!val) {
+		dev_err(&i2c->dev, "This is not formal version\n");
+		return -ENODEV;
+	}
+
+	return devm_snd_soc_register_component(&i2c->dev, &rt5575_soc_component_dev, rt5575_dai,
+		ARRAY_SIZE(rt5575_dai));
+}
+
+static const struct of_device_id rt5575_of_match[] = {
+	{ .compatible = "realtek,rt5575" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, rt5575_of_match);
+
+static struct i2c_driver rt5575_i2c_driver = {
+	.driver = {
+		.name = "rt5575",
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(rt5575_of_match),
+	},
+	.probe = rt5575_i2c_probe,
+	.id_table = rt5575_i2c_id,
+};
+module_i2c_driver(rt5575_i2c_driver);
+
+MODULE_DESCRIPTION("ASoC ALC5575 driver");
+MODULE_AUTHOR("Oder Chiou <oder_chiou@realtek.com>");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/rt5575.h b/sound/soc/codecs/rt5575.h
new file mode 100644
index 000000000000..11149612274a
--- /dev/null
+++ b/sound/soc/codecs/rt5575.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * rt5575.h  --  ALC5575 ALSA SoC audio driver
+ *
+ * Copyright(c) 2025 Realtek Semiconductor Corp.
+ *
+ */
+
+#ifndef __RT5575_H__
+#define __RT5575_H__
+
+#define RT5575_DEVICE_ID	0x10ec5575
+#define RT5575_DSP_MAPPING	0x18000000
+
+#define RT5575_ID		0x8008
+#define RT5575_ID_1		0x800c
+#define RT5575_MIXL_VOL		0x8a14
+#define RT5575_MIXR_VOL		0x8a18
+#define RT5575_PROMPT_VOL	0x8a84
+#define RT5575_SPK01_VOL	0x8a88
+#define RT5575_SPK23_VOL	0x8a8c
+#define RT5575_MIC1_VOL		0x8a98
+#define RT5575_MIC2_VOL		0x8a9c
+#define RT5575_WNC_CTRL		0x80ec
+#define RT5575_MODE_CTRL	0x80f0
+#define RT5575_I2S_RATE_CTRL	0x80f4
+#define RT5575_SLEEP_CTRL	0x80f8
+#define RT5575_ALG_BYPASS_CTRL	0x80fc
+#define RT5575_PINMUX_CTRL_2	0x81a4
+#define RT5575_GPIO_CTRL_1	0x8208
+#define RT5575_DSP_BUS_CTRL	0x880c
+#define RT5575_SW_INT		0x0018
+#define RT5575_DSP_BOOT_ERR	0x8e14
+#define RT5575_DSP_READY	0x8e24
+#define RT5575_DSP_CMD_ADDR	0x8e28
+#define RT5575_EFUSE_DATA_2	0xc638
+#define RT5575_EFUSE_DATA_3	0xc63c
+#define RT5575_EFUSE_PID	0xc660
+
+enum {
+	RT5575_AIF1,
+	RT5575_AIF2,
+	RT5575_AIF3,
+	RT5575_AIF4,
+	RT5575_AIFS,
+};
+
+struct rt5575_priv {
+	struct i2c_client *i2c;
+	struct snd_soc_component *component;
+	struct regmap *dsp_regmap, *regmap;
+};
+
+#endif /* __RT5575_H__ */
-- 
2.51.1

