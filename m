Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0AA77BBA0
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 16:30:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10EC1827;
	Mon, 14 Aug 2023 16:29:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10EC1827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692023402;
	bh=SkoumC1B9zXSSvQUIQe9KxQYe6bIvD+iP1zEubQO0m4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Zu3mj2FnrLb0z79GGuiSeaqd6QH7zrqVt1MZ5n7w59HkffAhvxT8/ZxUmK62n+ZLJ
	 xiqW1oTekRYGibSBu537RH4ibvvAZVFpz1EiEEHKiW8IUZiO19wIde9YFDNLtUMl2l
	 nUe2jXqtsS6hEnPFzo/UuRX6J7sVfYp+daoqRytw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07ECDF805E2; Mon, 14 Aug 2023 16:27:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 557ADF805E2;
	Mon, 14 Aug 2023 16:27:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35B74F8025F; Mon, 14 Aug 2023 10:06:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 063A0F80254
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 10:06:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 063A0F80254
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 045248285;
	Mon, 14 Aug 2023 16:06:22 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 14 Aug
 2023 16:06:22 +0800
Received: from ubuntu.localdomain (183.27.98.20) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 14 Aug
 2023 16:06:21 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Claudiu
 Beznea" <claudiu.beznea@microchip.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Walker Chen <walker.chen@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/3] ASoC: starfive: Add JH7110 PWM-DAC driver
Date: Mon, 14 Aug 2023 16:06:17 +0800
Message-ID: <20230814080618.10036-3-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230814080618.10036-1-hal.feng@starfivetech.com>
References: <20230814080618.10036-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [183.27.98.20]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
X-MailFrom: hal.feng@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TNMFE22GE3U4DAMU5F6HUBREOH3H3HCJ
X-Message-ID-Hash: TNMFE22GE3U4DAMU5F6HUBREOH3H3HCJ
X-Mailman-Approved-At: Mon, 14 Aug 2023 14:26:37 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TNMFE22GE3U4DAMU5F6HUBREOH3H3HCJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add PWM-DAC driver support for the StarFive JH7110 SoC.

Reviewed-by: Walker Chen <walker.chen@starfivetech.com>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 MAINTAINERS                        |   7 +
 sound/soc/starfive/Kconfig         |   9 +
 sound/soc/starfive/Makefile        |   1 +
 sound/soc/starfive/jh7110_pwmdac.c | 529 +++++++++++++++++++++++++++++
 4 files changed, 546 insertions(+)
 create mode 100644 sound/soc/starfive/jh7110_pwmdac.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0903d87b17cb..686e71822383 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20281,6 +20281,13 @@ S:	Supported
 F:	Documentation/devicetree/bindings/mmc/starfive*
 F:	drivers/mmc/host/dw_mmc-starfive.c
=20
+STARFIVE JH7110 PWMDAC DRIVER
+M:	Hal Feng <hal.feng@starfivetech.com>
+M:	Xingyu Wu <xingyu.wu@starfivetech.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
+F:	sound/soc/starfive/jh7110_pwmdac.c
+
 STARFIVE JH7110 TDM DRIVER
 M:	Walker Chen <walker.chen@starfivetech.com>
 S:	Maintained
diff --git a/sound/soc/starfive/Kconfig b/sound/soc/starfive/Kconfig
index fafb681f8c0a..279ac5c1d309 100644
--- a/sound/soc/starfive/Kconfig
+++ b/sound/soc/starfive/Kconfig
@@ -7,6 +7,15 @@ config SND_SOC_STARFIVE
 	  the Starfive SoCs' Audio interfaces. You will also need to
 	  select the audio interfaces to support below.
=20
+config SND_SOC_JH7110_PWMDAC
+	tristate "JH7110 PWM-DAC device driver"
+	depends on HAVE_CLK && SND_SOC_STARFIVE
+	select SND_SOC_GENERIC_DMAENGINE_PCM
+	select SND_SOC_SPDIF
+	help
+	 Say Y or M if you want to add support for StarFive JH7110
+	 PWM-DAC driver.
+
 config SND_SOC_JH7110_TDM
 	tristate "JH7110 TDM device driver"
 	depends on HAVE_CLK && SND_SOC_STARFIVE
diff --git a/sound/soc/starfive/Makefile b/sound/soc/starfive/Makefile
index f7d960211d72..9e958f70ef51 100644
--- a/sound/soc/starfive/Makefile
+++ b/sound/soc/starfive/Makefile
@@ -1,2 +1,3 @@
 # StarFive Platform Support
+obj-$(CONFIG_SND_SOC_JH7110_PWMDAC) +=3D jh7110_pwmdac.o
 obj-$(CONFIG_SND_SOC_JH7110_TDM) +=3D jh7110_tdm.o
diff --git a/sound/soc/starfive/jh7110_pwmdac.c b/sound/soc/starfive/jh71=
10_pwmdac.c
new file mode 100644
index 000000000000..033a9064f06b
--- /dev/null
+++ b/sound/soc/starfive/jh7110_pwmdac.c
@@ -0,0 +1,529 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * jh7110_pwmdac.c -- StarFive JH7110 PWM-DAC driver
+ *
+ * Copyright (C) 2021-2023 StarFive Technology Co., Ltd.
+ *
+ * Authors: Jenny Zhang
+ *	    Curry Zhang
+ *	    Xingyu Wu <xingyu.wu@starfivetech.com>
+ *	    Hal Feng <hal.feng@starfivetech.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+#define JH7110_PWMDAC_WDATA				0x00
+#define JH7110_PWMDAC_CTRL				0x04
+	#define JH7110_PWMDAC_ENABLE			BIT(0)
+	#define JH7110_PWMDAC_SHIFT			BIT(1)
+	#define JH7110_PWMDAC_DUTY_CYCLE_SHIFT		2
+	#define JH7110_PWMDAC_DUTY_CYCLE_MASK		GENMASK(3, 2)
+	#define JH7110_PWMDAC_CNT_N_SHIFT		4
+	#define JH7110_PWMDAC_CNT_N_MASK		GENMASK(12, 4)
+	#define JH7110_PWMDAC_DATA_CHANGE		BIT(13)
+	#define JH7110_PWMDAC_DATA_MODE			BIT(14)
+	#define JH7110_PWMDAC_DATA_SHIFT_SHIFT		15
+	#define JH7110_PWMDAC_DATA_SHIFT_MASK		GENMASK(17, 15)
+
+enum JH7110_PWMDAC_SHIFT_VAL {
+	PWMDAC_SHIFT_8 =3D 0,
+	PWMDAC_SHIFT_10,
+};
+
+enum JH7110_PWMDAC_DUTY_CYCLE_VAL {
+	PWMDAC_CYCLE_LEFT =3D 0,
+	PWMDAC_CYCLE_RIGHT,
+	PWMDAC_CYCLE_CENTER,
+};
+
+enum JH7110_PWMDAC_CNT_N_VAL {
+	PWMDAC_SAMPLE_CNT_1 =3D 1,
+	PWMDAC_SAMPLE_CNT_2,
+	PWMDAC_SAMPLE_CNT_3,
+	PWMDAC_SAMPLE_CNT_512 =3D 512, /* max */
+};
+
+enum JH7110_PWMDAC_DATA_CHANGE_VAL {
+	NO_CHANGE =3D 0,
+	CHANGE,
+};
+
+enum JH7110_PWMDAC_DATA_MODE_VAL {
+	UNSIGNED_DATA =3D 0,
+	INVERTER_DATA_MSB,
+};
+
+enum JH7110_PWMDAC_DATA_SHIFT_VAL {
+	PWMDAC_DATA_LEFT_SHIFT_BIT_0 =3D 0,
+	PWMDAC_DATA_LEFT_SHIFT_BIT_1,
+	PWMDAC_DATA_LEFT_SHIFT_BIT_2,
+	PWMDAC_DATA_LEFT_SHIFT_BIT_3,
+	PWMDAC_DATA_LEFT_SHIFT_BIT_4,
+	PWMDAC_DATA_LEFT_SHIFT_BIT_5,
+	PWMDAC_DATA_LEFT_SHIFT_BIT_6,
+	PWMDAC_DATA_LEFT_SHIFT_BIT_7,
+};
+
+struct jh7110_pwmdac_cfg {
+	enum JH7110_PWMDAC_SHIFT_VAL shift;
+	enum JH7110_PWMDAC_DUTY_CYCLE_VAL duty_cycle;
+	u16 cnt_n;
+	enum JH7110_PWMDAC_DATA_CHANGE_VAL data_change;
+	enum JH7110_PWMDAC_DATA_MODE_VAL data_mode;
+	enum JH7110_PWMDAC_DATA_SHIFT_VAL data_shift;
+};
+
+struct jh7110_pwmdac_dev {
+	void __iomem *base;
+	resource_size_t	mapbase;
+	struct jh7110_pwmdac_cfg cfg;
+
+	struct clk_bulk_data clks[2];
+	struct reset_control *rst_apb;
+	struct device *dev;
+	struct snd_dmaengine_dai_dma_data play_dma_data;
+	u32 saved_ctrl;
+};
+
+static inline void jh7110_pwmdac_write_reg(void __iomem *io_base, int re=
g, u32 val)
+{
+	writel(val, io_base + reg);
+}
+
+static inline u32 jh7110_pwmdac_read_reg(void __iomem *io_base, int reg)
+{
+	return readl(io_base + reg);
+}
+
+static void jh7110_pwmdac_set_enable(struct jh7110_pwmdac_dev *dev, bool=
 enable)
+{
+	u32 value;
+
+	value =3D jh7110_pwmdac_read_reg(dev->base, JH7110_PWMDAC_CTRL);
+	if (enable)
+		value |=3D JH7110_PWMDAC_ENABLE;
+	else
+		value &=3D ~JH7110_PWMDAC_ENABLE;
+
+	jh7110_pwmdac_write_reg(dev->base, JH7110_PWMDAC_CTRL, value);
+}
+
+static void jh7110_pwmdac_set_shift(struct jh7110_pwmdac_dev *dev)
+{
+	u32 value;
+
+	value =3D jh7110_pwmdac_read_reg(dev->base, JH7110_PWMDAC_CTRL);
+	if (dev->cfg.shift =3D=3D PWMDAC_SHIFT_8)
+		value &=3D ~JH7110_PWMDAC_SHIFT;
+	else if (dev->cfg.shift =3D=3D PWMDAC_SHIFT_10)
+		value |=3D JH7110_PWMDAC_SHIFT;
+
+	jh7110_pwmdac_write_reg(dev->base, JH7110_PWMDAC_CTRL, value);
+}
+
+static void jh7110_pwmdac_set_duty_cycle(struct jh7110_pwmdac_dev *dev)
+{
+	u32 value;
+
+	value =3D jh7110_pwmdac_read_reg(dev->base, JH7110_PWMDAC_CTRL);
+	value &=3D ~JH7110_PWMDAC_DUTY_CYCLE_MASK;
+	value |=3D (dev->cfg.duty_cycle & 0x3) << JH7110_PWMDAC_DUTY_CYCLE_SHIF=
T;
+
+	jh7110_pwmdac_write_reg(dev->base, JH7110_PWMDAC_CTRL, value);
+}
+
+static void jh7110_pwmdac_set_cnt_n(struct jh7110_pwmdac_dev *dev)
+{
+	u32 value;
+
+	value =3D jh7110_pwmdac_read_reg(dev->base, JH7110_PWMDAC_CTRL);
+	value &=3D ~JH7110_PWMDAC_CNT_N_MASK;
+	value |=3D ((dev->cfg.cnt_n - 1) & 0x1ff) << JH7110_PWMDAC_CNT_N_SHIFT;
+
+	jh7110_pwmdac_write_reg(dev->base, JH7110_PWMDAC_CTRL, value);
+}
+
+static void jh7110_pwmdac_set_data_change(struct jh7110_pwmdac_dev *dev)
+{
+	u32 value;
+
+	value =3D jh7110_pwmdac_read_reg(dev->base, JH7110_PWMDAC_CTRL);
+	if (dev->cfg.data_change =3D=3D NO_CHANGE)
+		value &=3D ~JH7110_PWMDAC_DATA_CHANGE;
+	else if (dev->cfg.data_change =3D=3D CHANGE)
+		value |=3D JH7110_PWMDAC_DATA_CHANGE;
+
+	jh7110_pwmdac_write_reg(dev->base, JH7110_PWMDAC_CTRL, value);
+}
+
+static void jh7110_pwmdac_set_data_mode(struct jh7110_pwmdac_dev *dev)
+{
+	u32 value;
+
+	value =3D jh7110_pwmdac_read_reg(dev->base, JH7110_PWMDAC_CTRL);
+	if (dev->cfg.data_mode =3D=3D UNSIGNED_DATA)
+		value &=3D ~JH7110_PWMDAC_DATA_MODE;
+	else if (dev->cfg.data_mode =3D=3D INVERTER_DATA_MSB)
+		value |=3D JH7110_PWMDAC_DATA_MODE;
+
+	jh7110_pwmdac_write_reg(dev->base, JH7110_PWMDAC_CTRL, value);
+}
+
+static void jh7110_pwmdac_set_data_shift(struct jh7110_pwmdac_dev *dev)
+{
+	u32 value;
+
+	value =3D jh7110_pwmdac_read_reg(dev->base, JH7110_PWMDAC_CTRL);
+	value &=3D ~JH7110_PWMDAC_DATA_SHIFT_MASK;
+	value |=3D (dev->cfg.data_shift & 0x7) << JH7110_PWMDAC_DATA_SHIFT_SHIF=
T;
+
+	jh7110_pwmdac_write_reg(dev->base, JH7110_PWMDAC_CTRL, value);
+}
+
+static void jh7110_pwmdac_set(struct jh7110_pwmdac_dev *dev)
+{
+	jh7110_pwmdac_set_shift(dev);
+	jh7110_pwmdac_set_duty_cycle(dev);
+	jh7110_pwmdac_set_cnt_n(dev);
+	jh7110_pwmdac_set_enable(dev, true);
+
+	jh7110_pwmdac_set_data_change(dev);
+	jh7110_pwmdac_set_data_mode(dev);
+	jh7110_pwmdac_set_data_shift(dev);
+}
+
+static void jh7110_pwmdac_stop(struct jh7110_pwmdac_dev *dev)
+{
+	jh7110_pwmdac_set_enable(dev, false);
+}
+
+static int jh7110_pwmdac_startup(struct snd_pcm_substream *substream,
+				 struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd =3D asoc_substream_to_rtd(substream);
+	struct snd_soc_dai_link *dai_link =3D rtd->dai_link;
+
+	dai_link->trigger_stop =3D SND_SOC_TRIGGER_ORDER_LDC;
+
+	return 0;
+}
+
+static int jh7110_pwmdac_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params,
+				   struct snd_soc_dai *dai)
+{
+	struct jh7110_pwmdac_dev *dev =3D dev_get_drvdata(dai->dev);
+	unsigned long core_clk_rate;
+	int ret;
+
+	switch (params_rate(params)) {
+	case 8000:
+		dev->cfg.cnt_n =3D PWMDAC_SAMPLE_CNT_3;
+		core_clk_rate =3D 6144000;
+		break;
+	case 11025:
+		dev->cfg.cnt_n =3D PWMDAC_SAMPLE_CNT_2;
+		core_clk_rate =3D 5644800;
+		break;
+	case 16000:
+		dev->cfg.cnt_n =3D PWMDAC_SAMPLE_CNT_3;
+		core_clk_rate =3D 12288000;
+		break;
+	case 22050:
+		dev->cfg.cnt_n =3D PWMDAC_SAMPLE_CNT_1;
+		core_clk_rate =3D 5644800;
+		break;
+	case 32000:
+		dev->cfg.cnt_n =3D PWMDAC_SAMPLE_CNT_1;
+		core_clk_rate =3D 8192000;
+		break;
+	case 44100:
+		dev->cfg.cnt_n =3D PWMDAC_SAMPLE_CNT_1;
+		core_clk_rate =3D 11289600;
+		break;
+	case 48000:
+		dev->cfg.cnt_n =3D PWMDAC_SAMPLE_CNT_1;
+		core_clk_rate =3D 12288000;
+		break;
+	default:
+		dev_err(dai->dev, "%d rate not supported\n",
+			params_rate(params));
+		return -EINVAL;
+	}
+
+	switch (params_channels(params)) {
+	case 1:
+		dev->play_dma_data.addr_width =3D DMA_SLAVE_BUSWIDTH_2_BYTES;
+		break;
+	case 2:
+		dev->play_dma_data.addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
+		break;
+	default:
+		dev_err(dai->dev, "%d channels not supported\n",
+			params_channels(params));
+		return -EINVAL;
+	}
+
+	/*
+	 * The clock rate always rounds down when using clk_set_rate()
+	 * so increase the rate a bit
+	 */
+	core_clk_rate +=3D 64;
+	jh7110_pwmdac_set(dev);
+
+	ret =3D clk_set_rate(dev->clks[1].clk, core_clk_rate);
+	if (ret)
+		return dev_err_probe(dai->dev, ret,
+				     "failed to set rate %lu for core clock\n",
+				     core_clk_rate);
+
+	return 0;
+}
+
+static int jh7110_pwmdac_trigger(struct snd_pcm_substream *substream, in=
t cmd,
+				 struct snd_soc_dai *dai)
+{
+	struct jh7110_pwmdac_dev *dev =3D snd_soc_dai_get_drvdata(dai);
+	int ret =3D 0;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		jh7110_pwmdac_set(dev);
+		break;
+
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		jh7110_pwmdac_stop(dev);
+		break;
+	default:
+		ret =3D -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int jh7110_pwmdac_crg_enable(struct jh7110_pwmdac_dev *dev, bool =
enable)
+{
+	int ret;
+
+	if (enable) {
+		ret =3D clk_bulk_prepare_enable(ARRAY_SIZE(dev->clks), dev->clks);
+		if (ret)
+			return dev_err_probe(dev->dev, ret,
+					     "failed to enable pwmdac clocks\n");
+
+		ret =3D reset_control_deassert(dev->rst_apb);
+		if (ret) {
+			dev_err(dev->dev, "failed to deassert pwmdac apb reset\n");
+			goto err_rst_apb;
+		}
+	} else {
+		clk_bulk_disable_unprepare(ARRAY_SIZE(dev->clks), dev->clks);
+	}
+
+	return 0;
+
+err_rst_apb:
+	clk_bulk_disable_unprepare(ARRAY_SIZE(dev->clks), dev->clks);
+
+	return ret;
+}
+
+static int jh7110_pwmdac_dai_probe(struct snd_soc_dai *dai)
+{
+	struct jh7110_pwmdac_dev *dev =3D dev_get_drvdata(dai->dev);
+
+	snd_soc_dai_init_dma_data(dai, &dev->play_dma_data, NULL);
+	snd_soc_dai_set_drvdata(dai, dev);
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops jh7110_pwmdac_dai_ops =3D {
+	.startup	=3D jh7110_pwmdac_startup,
+	.hw_params	=3D jh7110_pwmdac_hw_params,
+	.trigger	=3D jh7110_pwmdac_trigger,
+};
+
+static const struct snd_soc_component_driver jh7110_pwmdac_component =3D=
 {
+	.name		=3D "jh7110-pwmdac",
+};
+
+static struct snd_soc_dai_driver jh7110_pwmdac_dai =3D {
+	.name		=3D "jh7110-pwmdac",
+	.id		=3D 0,
+	.probe		=3D jh7110_pwmdac_dai_probe,
+	.playback =3D {
+		.channels_min =3D 1,
+		.channels_max =3D 2,
+		.rates =3D SNDRV_PCM_RATE_8000_48000,
+		.formats =3D SNDRV_PCM_FMTBIT_S16_LE,
+	},
+	.ops =3D &jh7110_pwmdac_dai_ops,
+};
+
+static int jh7110_pwmdac_runtime_suspend(struct device *dev)
+{
+	struct jh7110_pwmdac_dev *pwmdac =3D dev_get_drvdata(dev);
+
+	return jh7110_pwmdac_crg_enable(pwmdac, false);
+}
+
+static int jh7110_pwmdac_runtime_resume(struct device *dev)
+{
+	struct jh7110_pwmdac_dev *pwmdac =3D dev_get_drvdata(dev);
+
+	return jh7110_pwmdac_crg_enable(pwmdac, true);
+}
+
+static int jh7110_pwmdac_system_suspend(struct device *dev)
+{
+	struct jh7110_pwmdac_dev *pwmdac =3D dev_get_drvdata(dev);
+
+	/* save the CTRL register value */
+	pwmdac->saved_ctrl =3D jh7110_pwmdac_read_reg(pwmdac->base,
+						    JH7110_PWMDAC_CTRL);
+	return pm_runtime_force_suspend(dev);
+}
+
+static int jh7110_pwmdac_system_resume(struct device *dev)
+{
+	struct jh7110_pwmdac_dev *pwmdac =3D dev_get_drvdata(dev);
+	int ret;
+
+	ret =3D pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
+	/* restore the CTRL register value */
+	jh7110_pwmdac_write_reg(pwmdac->base, JH7110_PWMDAC_CTRL,
+				pwmdac->saved_ctrl);
+	return 0;
+}
+
+static const struct dev_pm_ops jh7110_pwmdac_pm_ops =3D {
+	RUNTIME_PM_OPS(jh7110_pwmdac_runtime_suspend,
+		       jh7110_pwmdac_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(jh7110_pwmdac_system_suspend,
+			    jh7110_pwmdac_system_resume)
+};
+
+static void jh7110_pwmdac_init_params(struct jh7110_pwmdac_dev *dev)
+{
+	dev->cfg.shift =3D PWMDAC_SHIFT_8;
+	dev->cfg.duty_cycle =3D PWMDAC_CYCLE_CENTER;
+	dev->cfg.cnt_n =3D PWMDAC_SAMPLE_CNT_1;
+	dev->cfg.data_change =3D NO_CHANGE;
+	dev->cfg.data_mode =3D INVERTER_DATA_MSB;
+	dev->cfg.data_shift =3D PWMDAC_DATA_LEFT_SHIFT_BIT_0;
+
+	dev->play_dma_data.addr =3D dev->mapbase + JH7110_PWMDAC_WDATA;
+	dev->play_dma_data.addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
+	dev->play_dma_data.fifo_size =3D 1;
+	dev->play_dma_data.maxburst =3D 16;
+}
+
+static int jh7110_pwmdac_probe(struct platform_device *pdev)
+{
+	struct jh7110_pwmdac_dev *dev;
+	struct resource *res;
+	int ret;
+
+	dev =3D devm_kzalloc(&pdev->dev, sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
+
+	dev->base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(dev->base))
+		return PTR_ERR(dev->base);
+
+	dev->mapbase =3D res->start;
+
+	dev->clks[0].id =3D "apb";
+	dev->clks[1].id =3D "core";
+
+	ret =3D devm_clk_bulk_get(&pdev->dev, ARRAY_SIZE(dev->clks), dev->clks)=
;
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to get pwmdac clocks\n");
+
+	dev->rst_apb =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(dev->rst_apb))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->rst_apb),
+				     "failed to get pwmdac apb reset\n");
+
+	jh7110_pwmdac_init_params(dev);
+
+	dev->dev =3D &pdev->dev;
+	dev_set_drvdata(&pdev->dev, dev);
+	ret =3D devm_snd_soc_register_component(&pdev->dev,
+					      &jh7110_pwmdac_component,
+					      &jh7110_pwmdac_dai, 1);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to register dai\n");
+
+	ret =3D devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to register pcm\n");
+
+	pm_runtime_enable(dev->dev);
+	if (!pm_runtime_enabled(&pdev->dev)) {
+		ret =3D jh7110_pwmdac_runtime_resume(&pdev->dev);
+		if (ret)
+			goto err_pm_disable;
+	}
+
+	return 0;
+
+err_pm_disable:
+	pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static int jh7110_pwmdac_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+	return 0;
+}
+
+static const struct of_device_id jh7110_pwmdac_of_match[] =3D {
+	{ .compatible =3D "starfive,jh7110-pwmdac" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jh7110_pwmdac_of_match);
+
+static struct platform_driver jh7110_pwmdac_driver =3D {
+	.driver		=3D {
+		.name	=3D "jh7110-pwmdac",
+		.of_match_table =3D jh7110_pwmdac_of_match,
+		.pm =3D pm_ptr(&jh7110_pwmdac_pm_ops),
+	},
+	.probe		=3D jh7110_pwmdac_probe,
+	.remove		=3D jh7110_pwmdac_remove,
+};
+module_platform_driver(jh7110_pwmdac_driver);
+
+MODULE_AUTHOR("Jenny Zhang");
+MODULE_AUTHOR("Curry Zhang");
+MODULE_AUTHOR("Xingyu Wu <xingyu.wu@starfivetech.com>");
+MODULE_AUTHOR("Hal Feng <hal.feng@starfivetech.com>");
+MODULE_DESCRIPTION("StarFive JH7110 PWM-DAC driver");
+MODULE_LICENSE("GPL");
--=20
2.38.1

