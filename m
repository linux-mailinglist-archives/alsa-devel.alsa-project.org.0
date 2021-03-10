Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D23BA333E30
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 14:36:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FA061767;
	Wed, 10 Mar 2021 14:35:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FA061767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615383377;
	bh=pP0y3HJr7Iy3PpL3Zu//cu3ZruPcjJKUgUW08/6l6EY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h+EMLbOGUtHhhpw+TdxwmCbGya1KyBjHsUVux0a4QvDzPcIe2VDuhPdYADsz4HpNd
	 DnI5wi68XIIhK8fLlUuNqkShs8roenl6FcFlKGEUL1BLIRLaZ8QYpruQBR1xt/KsNe
	 80Hd++FkMwUGPeLUpD39RqEzhOqk7+Eu59VHUgrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C152DF80482;
	Wed, 10 Mar 2021 14:33:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6123F80423; Wed, 10 Mar 2021 14:33:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,UPPERCASE_50_75,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by alsa1.perex.cz (Postfix) with ESMTP id 02813F801D8
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 14:33:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02813F801D8
X-UUID: d9b116e7b1d94bc9a869575e5abd56b4-20210310
X-UUID: d9b116e7b1d94bc9a869575e5abd56b4-20210310
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <argus.lin@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 772634452; Wed, 10 Mar 2021 21:33:16 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 21:33:13 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 10 Mar 2021 21:33:13 +0800
From: Argus Lin <argus.lin@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH V2 2/2] ASoC: mediatek: mt6359: add MT6359 accdet jack driver
Date: Wed, 10 Mar 2021 21:33:06 +0800
Message-ID: <1615383186-18500-3-git-send-email-argus.lin@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1615383186-18500-1-git-send-email-argus.lin@mediatek.com>
References: <1615383186-18500-1-git-send-email-argus.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: F4F1ECF55AD6A81BB646A71F9E920EABC443D877B57C1F9C8F32EFD3ED0334A82000:8
X-MTK: N
Cc: Jack Yu <jack.yu@realtek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Argus Lin <argus.lin@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 "Shane.Chien" <shane.chien@mediatek.com>, linux-mediatek@lists.infradead.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-kernel@vger.kernel.org,
 Chipeng Chang <chipeng.chang@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>,
 devicetree@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dan Murphy <dmurphy@ti.com>, Shuming Fan <shumingf@realtek.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, wsd_upstream@mediatek.com
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

MT6359 audio codec supports jack detection feature, adds MT6359
accdet driver to support jack plugged detection and key detection.

Signed-off-by: Argus Lin <argus.lin@mediatek.com>

---
 sound/soc/codecs/Kconfig         |    8 +
 sound/soc/codecs/Makefile        |    2 +
 sound/soc/codecs/mt6359-accdet.c | 1080 +++++++++++++++++
 sound/soc/codecs/mt6359-accdet.h |  128 ++
 sound/soc/codecs/mt6359.h        | 1864 ++++++++++++++++++++++++++++--
 5 files changed, 2975 insertions(+), 107 deletions(-)
 create mode 100644 sound/soc/codecs/mt6359-accdet.c
 create mode 100644 sound/soc/codecs/mt6359-accdet.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index ba4eb54aafcb..1f4923c8d28f 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1775,6 +1775,14 @@ config SND_SOC_MT6359
 	  Enable support for the platform which uses MT6359 as
 	  external codec device.

+config SND_SOC_MT6359_ACCDET
+	tristate "MediaTek MT6359 ACCDET driver"
+	depends on MTK_PMIC_WRAP
+	help
+	  ACCDET means Accessory Detection technology, MediaTek develop it
+	  for ASoC codec soc-jack detection mechanism.
+	  Select N if you don't have jack on board.
+
 config SND_SOC_MT6660
 	tristate "Mediatek MT6660 Speaker Amplifier"
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index d277f0366e09..f77d0571a549 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -133,6 +133,7 @@ snd-soc-msm8916-digital-objs := msm8916-wcd-digital.o
 snd-soc-mt6351-objs := mt6351.o
 snd-soc-mt6358-objs := mt6358.o
 snd-soc-mt6359-objs := mt6359.o
+snd-soc-mt6359-accdet-objs := mt6359-accdet.o
 snd-soc-mt6660-objs := mt6660.o
 snd-soc-nau8315-objs := nau8315.o
 snd-soc-nau8540-objs := nau8540.o
@@ -448,6 +449,7 @@ obj-$(CONFIG_SND_SOC_MSM8916_WCD_DIGITAL) +=snd-soc-msm8916-digital.o
 obj-$(CONFIG_SND_SOC_MT6351)	+= snd-soc-mt6351.o
 obj-$(CONFIG_SND_SOC_MT6358)	+= snd-soc-mt6358.o
 obj-$(CONFIG_SND_SOC_MT6359)	+= snd-soc-mt6359.o
+obj-$(CONFIG_SND_SOC_MT6359_ACCDET) += mt6359-accdet.o
 obj-$(CONFIG_SND_SOC_MT6660)	+= snd-soc-mt6660.o
 obj-$(CONFIG_SND_SOC_NAU8315)   += snd-soc-nau8315.o
 obj-$(CONFIG_SND_SOC_NAU8540)   += snd-soc-nau8540.o
diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
new file mode 100644
index 000000000000..0bef6eaad5ad
--- /dev/null
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -0,0 +1,1080 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// mt6359-accdet.c  --  ALSA SoC mt6359 accdet driver
+//
+// Copyright (C) 2021 MediaTek Inc.
+// Author: Argus Lin <argus.lin@mediatek.com>
+//
+
+#include <linux/of_gpio.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/input.h>
+#include <linux/kthread.h>
+#include <linux/io.h>
+#include <linux/sched/clock.h>
+#include <linux/workqueue.h>
+#include <linux/timer.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/init.h>
+#include <linux/irqdomain.h>
+#include <linux/irq.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+#include <sound/jack.h>
+#include <linux/mfd/mt6397/core.h>
+
+#include "mt6359-accdet.h"
+#include "mt6359.h"
+
+/* global variable definitions */
+#define REGISTER_VAL(x)	((x) - 1)
+
+/* mt6359 accdet capability */
+#define ACCDET_PMIC_EINT_IRQ		BIT(0)
+#define ACCDET_AP_GPIO_EINT		BIT(1)
+
+#define ACCDET_PMIC_EINT0		BIT(2)
+#define ACCDET_PMIC_EINT1		BIT(3)
+#define ACCDET_PMIC_BI_EINT		BIT(4)
+
+#define ACCDET_PMIC_GPIO_TRIG_EINT	BIT(5)
+#define ACCDET_PMIC_INVERTER_TRIG_EINT	BIT(6)
+#define ACCDET_PMIC_RSV_EINT		BIT(7)
+
+#define ACCDET_THREE_KEY		BIT(8)
+#define ACCDET_FOUR_KEY			BIT(9)
+#define ACCDET_TRI_KEY_CDD		BIT(10)
+#define ACCDET_RSV_KEY			BIT(11)
+
+#define ACCDET_ANALOG_FASTDISCHARGE	BIT(12)
+#define ACCDET_DIGITAL_FASTDISCHARGE	BIT(13)
+#define ACCDET_AD_FASTDISCHRAGE		BIT(14)
+
+static struct platform_driver mt6359_accdet_driver;
+static const struct snd_soc_component_driver mt6359_accdet_soc_driver;
+
+/* local function declaration */
+static void accdet_set_debounce(struct mt6359_accdet *priv, int state,
+				unsigned int debounce);
+static unsigned int adjust_eint_analog_setting(struct mt6359_accdet *priv);
+static void config_digital_init_by_mode(struct mt6359_accdet *priv);
+static void config_eint_init_by_mode(struct mt6359_accdet *priv);
+static inline void mt6359_accdet_init(struct mt6359_accdet *priv);
+static unsigned int mt6359_accdet_jd_setting(struct mt6359_accdet *priv);
+static void mt6359_accdet_recover_jd_setting(struct mt6359_accdet *priv);
+static void mt6359_accdet_jack_report(struct mt6359_accdet *priv);
+static void recover_eint_analog_setting(struct mt6359_accdet *priv);
+static void recover_eint_digital_setting(struct mt6359_accdet *priv);
+static void recover_eint_setting(struct mt6359_accdet *priv);
+
+static unsigned int adjust_eint_analog_setting(struct mt6359_accdet *priv)
+{
+	if (priv->data->eint_detect_mode == 0x3 ||
+	    priv->data->eint_detect_mode == 0x4) {
+		/* ESD switches off */
+		regmap_update_bits(priv->regmap,
+				   RG_ACCDETSPARE_ADDR, 1 << 8, 0);
+	}
+	if (priv->data->eint_detect_mode == 0x4) {
+		if (priv->caps & ACCDET_PMIC_EINT0) {
+			/* enable RG_EINT0CONFIGACCDET */
+			regmap_update_bits(priv->regmap,
+					   RG_EINT0CONFIGACCDET_ADDR,
+					   RG_EINT0CONFIGACCDET_MASK_SFT,
+					   BIT(RG_EINT0CONFIGACCDET_SFT));
+		} else if (priv->caps & ACCDET_PMIC_EINT1) {
+			/* enable RG_EINT1CONFIGACCDET */
+			regmap_update_bits(priv->regmap,
+					   RG_EINT1CONFIGACCDET_ADDR,
+					   RG_EINT1CONFIGACCDET_MASK_SFT,
+					   BIT(RG_EINT1CONFIGACCDET_SFT));
+		}
+		if (priv->data->eint_use_ext_res == 0x3 ||
+		    priv->data->eint_use_ext_res == 0x4) {
+			/*select 500k, use internal resistor */
+			regmap_update_bits(priv->regmap,
+					   RG_EINT0HIRENB_ADDR,
+					   RG_EINT0HIRENB_MASK_SFT,
+					   BIT(RG_EINT0HIRENB_SFT));
+		}
+	}
+	return 0;
+}
+
+static unsigned int adjust_eint_digital_setting(struct mt6359_accdet *priv)
+{
+	if (priv->caps & ACCDET_PMIC_EINT0) {
+		/* disable inverter */
+		regmap_update_bits(priv->regmap,
+				   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
+				   ACCDET_EINT0_INVERTER_SW_EN_MASK_SFT, 0);
+	} else if (priv->caps & ACCDET_PMIC_EINT1) {
+		/* disable inverter */
+		regmap_update_bits(priv->regmap,
+				   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
+				   ACCDET_EINT1_INVERTER_SW_EN_MASK_SFT, 0);
+	}
+
+	if (priv->data->eint_detect_mode == 0x4) {
+		if (priv->caps & ACCDET_PMIC_EINT0) {
+			/* set DA stable signal */
+			regmap_update_bits(priv->regmap,
+					   ACCDET_DA_STABLE_ADDR,
+					   ACCDET_EINT0_CEN_STABLE_MASK_SFT, 0);
+		} else if (priv->caps & ACCDET_PMIC_EINT1) {
+			/* set DA stable signal */
+			regmap_update_bits(priv->regmap,
+					   ACCDET_DA_STABLE_ADDR,
+					   ACCDET_EINT1_CEN_STABLE_MASK_SFT, 0);
+		}
+	}
+	return 0;
+}
+
+static unsigned int mt6359_accdet_jd_setting(struct mt6359_accdet *priv)
+{
+	if (priv->jd_sts == M_PLUG_IN) {
+		/* adjust digital setting */
+		adjust_eint_digital_setting(priv);
+		/* adjust analog setting */
+		adjust_eint_analog_setting(priv);
+	} else if (priv->jd_sts == M_PLUG_OUT) {
+		/* set debounce to 1ms */
+		accdet_set_debounce(priv, eint_state000,
+				    priv->data->pwm_deb->eint_debounce0);
+	} else {
+		dev_dbg(priv->dev, "should not be here %s()\n", __func__);
+	}
+
+	return 0;
+}
+
+static void recover_eint_analog_setting(struct mt6359_accdet *priv)
+{
+	if (priv->data->eint_detect_mode == 0x3 ||
+	    priv->data->eint_detect_mode == 0x4) {
+		/* ESD switches on */
+		regmap_update_bits(priv->regmap, RG_ACCDETSPARE_ADDR,
+				   1 << 8, 1 << 8);
+	}
+	if (priv->data->eint_detect_mode == 0x4) {
+		if (priv->caps & ACCDET_PMIC_EINT0) {
+			/* disable RG_EINT0CONFIGACCDET */
+			regmap_update_bits(priv->regmap,
+					   RG_EINT0CONFIGACCDET_ADDR,
+					   RG_EINT0CONFIGACCDET_MASK_SFT, 0);
+		} else if (priv->caps & ACCDET_PMIC_EINT1) {
+			/* disable RG_EINT1CONFIGACCDET */
+			regmap_update_bits(priv->regmap,
+					   RG_EINT1CONFIGACCDET_ADDR,
+					   RG_EINT1CONFIGACCDET_MASK_SFT, 0);
+		}
+		regmap_update_bits(priv->regmap, RG_EINT0HIRENB_ADDR,
+				   RG_EINT0HIRENB_MASK_SFT, 0);
+	}
+}
+
+static void recover_eint_digital_setting(struct mt6359_accdet *priv)
+{
+	if (priv->caps & ACCDET_PMIC_EINT0) {
+		regmap_update_bits(priv->regmap,
+				   ACCDET_EINT0_M_SW_EN_ADDR,
+				   ACCDET_EINT0_M_SW_EN_MASK_SFT, 0);
+	} else if (priv->caps & ACCDET_PMIC_EINT1) {
+		regmap_update_bits(priv->regmap,
+				   ACCDET_EINT1_M_SW_EN_ADDR,
+				   ACCDET_EINT1_M_SW_EN_MASK_SFT, 0);
+	}
+	if (priv->data->eint_detect_mode == 0x4) {
+		/* enable eint0cen */
+		if (priv->caps & ACCDET_PMIC_EINT0) {
+			/* enable eint0cen */
+			regmap_update_bits(priv->regmap,
+					   ACCDET_DA_STABLE_ADDR,
+					   ACCDET_EINT0_CEN_STABLE_MASK_SFT,
+					   BIT(ACCDET_EINT0_CEN_STABLE_SFT));
+		} else if (priv->caps & ACCDET_PMIC_EINT1) {
+			/* enable eint1cen */
+			regmap_update_bits(priv->regmap,
+					   ACCDET_DA_STABLE_ADDR,
+					   ACCDET_EINT1_CEN_STABLE_MASK_SFT,
+					   BIT(ACCDET_EINT1_CEN_STABLE_SFT));
+		}
+	}
+
+	if (priv->data->eint_detect_mode != 0x1) {
+		if (priv->caps & ACCDET_PMIC_EINT0) {
+			/* enable inverter */
+			regmap_update_bits(priv->regmap,
+					   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
+					   ACCDET_EINT0_INVERTER_SW_EN_MASK_SFT,
+					   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT));
+		} else if (priv->caps & ACCDET_PMIC_EINT1) {
+			/* enable inverter */
+			regmap_update_bits(priv->regmap,
+					   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
+					   ACCDET_EINT1_INVERTER_SW_EN_MASK_SFT,
+					   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT));
+		}
+	}
+}
+
+static void recover_eint_setting(struct mt6359_accdet *priv)
+{
+	if (priv->jd_sts == M_PLUG_OUT) {
+		recover_eint_analog_setting(priv);
+		recover_eint_digital_setting(priv);
+	}
+}
+
+static void mt6359_accdet_recover_jd_setting(struct mt6359_accdet *priv)
+{
+	int ret = 0;
+	unsigned int value = 0;
+
+	regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
+			   ACCDET_IRQ_CLR_MASK_SFT, BIT(ACCDET_IRQ_CLR_SFT));
+	usleep_range(200, 300);
+	ret = regmap_read_poll_timeout(priv->regmap,
+				       ACCDET_IRQ_ADDR,
+				       value,
+				       (value & ACCDET_IRQ_MASK_SFT) == 0,
+				       0,
+				       1000);
+	if (ret)
+		dev_warn(priv->dev, "%s(), ret %d\n", __func__, ret);
+	/* clear accdet int, modify  for fix interrupt trigger twice error */
+	regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
+			   ACCDET_IRQ_CLR_MASK_SFT, 0);
+	regmap_update_bits(priv->regmap, RG_INT_STATUS_ACCDET_ADDR,
+			   RG_INT_STATUS_ACCDET_MASK_SFT,
+			   BIT(RG_INT_STATUS_ACCDET_SFT));
+
+	/* recover accdet debounce0,3 */
+	accdet_set_debounce(priv, accdet_state000,
+			    priv->data->pwm_deb->debounce0);
+	accdet_set_debounce(priv, accdet_state001,
+			    priv->data->pwm_deb->debounce1);
+	accdet_set_debounce(priv, accdet_state011,
+			    priv->data->pwm_deb->debounce3);
+
+	priv->jack_type = 0;
+	priv->btn_type = 0;
+	priv->accdet_status = 0x3;
+	mt6359_accdet_jack_report(priv);
+}
+
+static void accdet_set_debounce(struct mt6359_accdet *priv, int state,
+				unsigned int debounce)
+{
+	switch (state) {
+	case accdet_state000:
+		regmap_write(priv->regmap, ACCDET_DEBOUNCE0_ADDR, debounce);
+		break;
+	case accdet_state001:
+		regmap_write(priv->regmap, ACCDET_DEBOUNCE1_ADDR, debounce);
+		break;
+	case accdet_state010:
+		regmap_write(priv->regmap, ACCDET_DEBOUNCE2_ADDR, debounce);
+		break;
+	case accdet_state011:
+		regmap_write(priv->regmap, ACCDET_DEBOUNCE3_ADDR, debounce);
+		break;
+	case accdet_auxadc:
+		regmap_write(priv->regmap,
+			     ACCDET_CONNECT_AUXADC_TIME_DIG_ADDR, debounce);
+		break;
+	case eint_state000:
+		regmap_update_bits(priv->regmap, ACCDET_EINT_DEBOUNCE0_ADDR,
+				   0xF << ACCDET_EINT_DEBOUNCE0_SFT,
+				   debounce << ACCDET_EINT_DEBOUNCE0_SFT);
+		break;
+	case eint_state001:
+		regmap_update_bits(priv->regmap, ACCDET_EINT_DEBOUNCE1_ADDR,
+				   0xF << ACCDET_EINT_DEBOUNCE1_SFT,
+				   debounce << ACCDET_EINT_DEBOUNCE1_SFT);
+		break;
+	case eint_state010:
+		regmap_update_bits(priv->regmap, ACCDET_EINT_DEBOUNCE2_ADDR,
+				   0xF << ACCDET_EINT_DEBOUNCE2_SFT,
+				   debounce << ACCDET_EINT_DEBOUNCE2_SFT);
+		break;
+	case eint_state011:
+		regmap_update_bits(priv->regmap, ACCDET_EINT_DEBOUNCE3_ADDR,
+				   0xF << ACCDET_EINT_DEBOUNCE3_SFT,
+				   debounce << ACCDET_EINT_DEBOUNCE3_SFT);
+		break;
+	case eint_inverter_state000:
+		regmap_write(priv->regmap, ACCDET_EINT_INVERTER_DEBOUNCE_ADDR,
+			     debounce);
+		break;
+	default:
+		dev_warn(priv->dev, "Error: %s error state (%d)\n", __func__,
+			 state);
+		break;
+	}
+}
+
+static void mt6359_accdet_jack_report(struct mt6359_accdet *priv)
+{
+	int report = 0;
+
+	if (!priv->jack)
+		return;
+
+	report = priv->jack_type | priv->btn_type;
+	snd_soc_jack_report(priv->jack, report, MT6359_ACCDET_JACK_MASK);
+}
+
+static unsigned int check_button(struct mt6359_accdet *priv, unsigned int v)
+{
+	if (priv->caps & ACCDET_FOUR_KEY) {
+		if (v < priv->data->four_key.down &&
+		    v >= priv->data->four_key.up)
+			priv->btn_type = SND_JACK_BTN_1;
+		if (v < priv->data->four_key.up &&
+		    v >= priv->data->four_key.voice)
+			priv->btn_type = SND_JACK_BTN_2;
+		if (v < priv->data->four_key.voice &&
+		    v >= priv->data->four_key.mid)
+			priv->btn_type = SND_JACK_BTN_3;
+		if (v < priv->data->four_key.mid)
+			priv->btn_type = SND_JACK_BTN_0;
+	} else {
+		if (v < priv->data->three_key.down &&
+		    v >= priv->data->three_key.up)
+			priv->btn_type = SND_JACK_BTN_1;
+		if (v < priv->data->three_key.up &&
+		    v >= priv->data->three_key.mid)
+			priv->btn_type = SND_JACK_BTN_2;
+		if (v < priv->data->three_key.mid)
+			priv->btn_type = SND_JACK_BTN_0;
+	}
+	return 0;
+}
+
+static void is_key_pressed(struct mt6359_accdet *priv, bool pressed)
+{
+	priv->btn_type = priv->jack_type & ~MT6359_ACCDET_BTN_MASK;
+
+	if (pressed)
+		check_button(priv, priv->cali_voltage);
+}
+
+static inline void check_jack_btn_type(struct mt6359_accdet *priv)
+{
+	unsigned int val = 0;
+
+	regmap_read(priv->regmap, ACCDET_MEM_IN_ADDR, &val);
+
+	priv->accdet_status =
+		(val >> ACCDET_STATE_MEM_IN_OFFSET) & ACCDET_STATE_AB_MASK;
+
+	switch (priv->accdet_status) {
+	case 0:
+		if (priv->jack_type == SND_JACK_HEADSET)
+			is_key_pressed(priv, true);
+		else
+			priv->jack_type = SND_JACK_HEADPHONE;
+		break;
+	case 1:
+		if (priv->jack_type == SND_JACK_HEADSET) {
+			is_key_pressed(priv, false);
+		} else {
+			priv->jack_type = SND_JACK_HEADSET;
+			accdet_set_debounce(priv, eint_state011, 0x1);
+		}
+		break;
+	case 3:
+	default:
+		priv->jack_type = 0;
+		break;
+	}
+}
+
+static void mt6359_accdet_work(struct work_struct *work)
+{
+	struct mt6359_accdet *priv =
+		container_of(work, struct mt6359_accdet, accdet_work);
+
+	mutex_lock(&priv->res_lock);
+	priv->pre_accdet_status = priv->accdet_status;
+	check_jack_btn_type(priv);
+
+	if (priv->jack_plugged &&
+	    priv->pre_accdet_status != priv->accdet_status)
+		mt6359_accdet_jack_report(priv);
+	mutex_unlock(&priv->res_lock);
+}
+
+static void mt6359_accdet_jd_work(struct work_struct *work)
+{
+	int ret = 0;
+	unsigned int value = 0;
+
+	struct mt6359_accdet *priv =
+		container_of(work, struct mt6359_accdet, jd_work);
+
+	mutex_lock(&priv->res_lock);
+	if (priv->jd_sts == M_PLUG_IN) {
+		priv->jack_plugged = true;
+
+		/* set and clear initial bit every eint interrupt */
+		regmap_update_bits(priv->regmap, ACCDET_SEQ_INIT_ADDR,
+				   ACCDET_SEQ_INIT_MASK_SFT,
+				   BIT(ACCDET_SEQ_INIT_SFT));
+		regmap_update_bits(priv->regmap, ACCDET_SEQ_INIT_ADDR,
+				   ACCDET_SEQ_INIT_MASK_SFT, 0);
+		ret = regmap_read_poll_timeout(priv->regmap,
+					       ACCDET_SEQ_INIT_ADDR,
+					       value,
+					       (value & ACCDET_SEQ_INIT_MASK_SFT) == 0,
+					       0,
+					       1000);
+		if (ret)
+			dev_err(priv->dev, "%s(), ret %d\n", __func__, ret);
+
+		/* enable ACCDET unit */
+		regmap_update_bits(priv->regmap, ACCDET_SW_EN_ADDR,
+				   ACCDET_SW_EN_MASK_SFT, BIT(ACCDET_SW_EN_SFT));
+	} else if (priv->jd_sts == M_PLUG_OUT) {
+		priv->jack_plugged = false;
+
+		accdet_set_debounce(priv, accdet_state011,
+				    priv->data->pwm_deb->debounce3);
+		regmap_update_bits(priv->regmap, ACCDET_SW_EN_ADDR,
+				   ACCDET_SW_EN_MASK_SFT, 0);
+		mt6359_accdet_recover_jd_setting(priv);
+	}
+
+	if (priv->caps & ACCDET_PMIC_EINT_IRQ)
+		recover_eint_setting(priv);
+	mutex_unlock(&priv->res_lock);
+}
+
+static irqreturn_t mt6359_accdet_irq(int irq, void *data)
+{
+	struct mt6359_accdet *priv = data;
+	unsigned int irq_val = 0, val = 0, value = 0;
+	int ret = 0;
+
+	mutex_lock(&priv->res_lock);
+	regmap_read(priv->regmap, ACCDET_IRQ_ADDR, &irq_val);
+
+	if (irq_val & ACCDET_IRQ_MASK_SFT) {
+		regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
+				   ACCDET_IRQ_CLR_MASK_SFT,
+				   BIT(ACCDET_IRQ_CLR_SFT));
+		ret = regmap_read_poll_timeout(priv->regmap,
+					       ACCDET_IRQ_ADDR,
+					       value,
+					       (value & ACCDET_IRQ_MASK_SFT) == 0,
+					       0,
+					       1000);
+		if (ret) {
+			dev_err(priv->dev, "%s(), ret %d\n", __func__, ret);
+			mutex_unlock(&priv->res_lock);
+			return IRQ_NONE;
+		}
+		regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
+				   ACCDET_IRQ_CLR_MASK_SFT, 0);
+		regmap_update_bits(priv->regmap, RG_INT_STATUS_ACCDET_ADDR,
+				   RG_INT_STATUS_ACCDET_MASK_SFT,
+				   BIT(RG_INT_STATUS_ACCDET_SFT));
+
+		queue_work(priv->accdet_workqueue, &priv->accdet_work);
+	} else {
+		if (irq_val & ACCDET_EINT0_IRQ_MASK_SFT) {
+			regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
+					   ACCDET_EINT0_IRQ_CLR_MASK_SFT,
+					   BIT(ACCDET_EINT0_IRQ_CLR_SFT));
+			ret = regmap_read_poll_timeout(priv->regmap,
+						       ACCDET_IRQ_ADDR,
+						       value,
+						       (value & ACCDET_EINT0_IRQ_MASK_SFT) == 0,
+						       0,
+						       1000);
+			if (ret) {
+				dev_err(priv->dev, "%s(), ret %d\n", __func__,
+					ret);
+				mutex_unlock(&priv->res_lock);
+				return IRQ_NONE;
+			}
+			regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
+					   ACCDET_EINT0_IRQ_CLR_MASK_SFT, 0);
+			regmap_update_bits(priv->regmap,
+					   RG_INT_STATUS_ACCDET_ADDR,
+					   RG_INT_STATUS_ACCDET_EINT0_MASK_SFT,
+					   BIT(RG_INT_STATUS_ACCDET_EINT0_SFT));
+		}
+		if (irq_val & ACCDET_EINT1_IRQ_MASK_SFT) {
+			regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
+					   ACCDET_EINT1_IRQ_CLR_MASK_SFT,
+					   BIT(ACCDET_EINT1_IRQ_CLR_SFT));
+			ret = regmap_read_poll_timeout(priv->regmap,
+						       ACCDET_IRQ_ADDR,
+						       value,
+						       (value & ACCDET_EINT1_IRQ_MASK_SFT) == 0,
+						       0,
+						       1000);
+			if (ret) {
+				dev_err(priv->dev, "%s(), ret %d\n", __func__,
+					ret);
+				mutex_unlock(&priv->res_lock);
+				return IRQ_NONE;
+			}
+			regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
+					   ACCDET_EINT1_IRQ_CLR_MASK_SFT, 0);
+			regmap_update_bits(priv->regmap,
+					   RG_INT_STATUS_ACCDET_ADDR,
+					   RG_INT_STATUS_ACCDET_EINT1_MASK_SFT,
+					   BIT(RG_INT_STATUS_ACCDET_EINT1_SFT));
+		}
+		/* get jack detection status */
+		regmap_read(priv->regmap, ACCDET_EINT0_MEM_IN_ADDR, &val);
+		priv->jd_sts = ((val >> ACCDET_EINT0_MEM_IN_SFT) &
+				   ACCDET_EINT0_MEM_IN_MASK);
+		/* adjust eint digital/analog setting */
+		mt6359_accdet_jd_setting(priv);
+
+		queue_work(priv->jd_workqueue, &priv->jd_work);
+	}
+	mutex_unlock(&priv->res_lock);
+
+	return IRQ_HANDLED;
+}
+
+static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
+{
+	int ret = 0;
+	struct device *dev = priv->dev;
+	struct device_node *node = NULL;
+	int pwm_deb[15] = {0};
+	unsigned int tmp = 0;
+
+	node = of_get_child_by_name(dev->parent->of_node, "accdet");
+	if (!node)
+		return -EINVAL;
+
+	ret = of_property_read_u32(node, "mediatek,mic-vol",
+				   &priv->data->mic_vol);
+	if (ret)
+		priv->data->mic_vol = 8;
+
+	ret = of_property_read_u32(node, "mediatek,plugout-debounce",
+				   &priv->data->plugout_deb);
+	if (ret)
+		priv->data->plugout_deb = 1;
+
+	ret = of_property_read_u32(node, "mediatek,mic-mode",
+				   &priv->data->mic_mode);
+	if (ret)
+		priv->data->mic_mode = 2;
+
+	ret = of_property_read_u32_array(node, "mediatek,pwm-deb-setting",
+					 pwm_deb, ARRAY_SIZE(pwm_deb));
+	/* debounce8(auxadc debounce) is default, needn't get from dts */
+	if (!ret)
+		memcpy(priv->data->pwm_deb, pwm_deb, sizeof(pwm_deb));
+
+	ret = of_property_read_u32(node, "mediatek,eint-level-pol",
+				   &priv->data->eint_pol);
+	if (ret)
+		priv->data->eint_pol = 8;
+
+	ret = of_property_read_u32(node, "mediatek,eint-use-ap", &tmp);
+	if (ret)
+		tmp = 0;
+	if (tmp == 0)
+		priv->caps |= ACCDET_PMIC_EINT_IRQ;
+	else if (tmp == 1)
+		priv->caps |= ACCDET_AP_GPIO_EINT;
+
+	ret = of_property_read_u32(node, "mediatek,eint-detect-mode",
+				   &priv->data->eint_detect_mode);
+	if (ret) {
+		/* eint detection mode equals to EINT HW Mode */
+		priv->data->eint_detect_mode = 0x4;
+	}
+
+	ret = of_property_read_u32(node, "mediatek,eint-num", &tmp);
+	if (ret)
+		tmp = 0;
+	if (tmp == 0)
+		priv->caps |= ACCDET_PMIC_EINT0;
+	else if (tmp == 1)
+		priv->caps |= ACCDET_PMIC_EINT1;
+	else if (tmp == 2)
+		priv->caps |= ACCDET_PMIC_BI_EINT;
+
+	ret = of_property_read_u32(node, "mediatek,eint-trig-mode",
+				   &tmp);
+	if (ret)
+		tmp = 0;
+	if (tmp == 0)
+		priv->caps |= ACCDET_PMIC_GPIO_TRIG_EINT;
+	else if (tmp == 1)
+		priv->caps |= ACCDET_PMIC_INVERTER_TRIG_EINT;
+
+	ret = of_property_read_u32(node, "mediatek,eint-use-ext-res",
+				   &priv->data->eint_use_ext_res);
+	if (ret) {
+		/* eint use internal resister */
+		priv->data->eint_use_ext_res = 0x0;
+	}
+
+	ret = of_property_read_u32(node, "mediatek,eint-comp-vth",
+				   &priv->data->eint_comp_vth);
+	if (ret)
+		priv->data->eint_comp_vth = 0x0;
+
+	ret = of_property_read_u32(node, "mediatek,key-mode", &tmp);
+	if (ret)
+		tmp = 0;
+	if (tmp == 0) {
+		int three_key[4];
+
+		priv->caps |= ACCDET_THREE_KEY;
+		ret = of_property_read_u32_array(node,
+						 "mediatek,three-key-thr",
+						 three_key,
+						 ARRAY_SIZE(three_key));
+		if (!ret)
+			memcpy(&priv->data->three_key, three_key + 1,
+			       sizeof(struct three_key_threshold));
+	} else if (tmp == 1) {
+		int four_key[5];
+
+		priv->caps |= ACCDET_FOUR_KEY;
+		ret = of_property_read_u32_array(node,
+						 "mediatek,four-key-thr",
+						 four_key,
+						 ARRAY_SIZE(four_key));
+		if (!ret) {
+			memcpy(&priv->data->four_key, four_key + 1,
+			       sizeof(struct four_key_threshold));
+		} else {
+			dev_warn(priv->dev,
+				 "accdet no 4-key-thrsh dts, use efuse\n");
+		}
+	} else if (tmp == 2) {
+		int three_key[4];
+
+		priv->caps |= ACCDET_TRI_KEY_CDD;
+		ret = of_property_read_u32_array(node,
+						 "mediatek,tri-key-cdd-thr",
+						 three_key,
+						 ARRAY_SIZE(three_key));
+		if (!ret)
+			memcpy(&priv->data->three_key, three_key + 1,
+			       sizeof(struct three_key_threshold));
+	}
+
+	dev_warn(priv->dev, "accdet caps=%x\n", priv->caps);
+
+	return 0;
+}
+
+static void config_digital_init_by_mode(struct mt6359_accdet *priv)
+{
+	/* enable eint cmpmem pwm */
+	regmap_write(priv->regmap, ACCDET_EINT_CMPMEN_PWM_THRESH_ADDR,
+		     (priv->data->pwm_deb->eint_pwm_width << 4 |
+		     priv->data->pwm_deb->eint_pwm_thresh));
+	/* DA signal stable */
+	if (priv->caps & ACCDET_PMIC_EINT0) {
+		regmap_write(priv->regmap, ACCDET_DA_STABLE_ADDR,
+			     ACCDET_EINT0_STABLE_VAL);
+	} else if (priv->caps & ACCDET_PMIC_EINT1) {
+		regmap_write(priv->regmap, ACCDET_DA_STABLE_ADDR,
+			     ACCDET_EINT1_STABLE_VAL);
+	}
+	/* after receive n+1 number, interrupt issued. */
+	regmap_update_bits(priv->regmap, ACCDET_EINT_M_PLUG_IN_NUM_ADDR,
+			   ACCDET_EINT_M_PLUG_IN_NUM_MASK_SFT,
+			   BIT(ACCDET_EINT_M_PLUG_IN_NUM_SFT));
+	/* setting HW mode, enable digital fast discharge
+	 * if use EINT0 & EINT1 detection, please modify
+	 * ACCDET_HWMODE_EN_ADDR[2:1]
+	 */
+	regmap_write(priv->regmap, ACCDET_HWMODE_EN_ADDR, 0x100);
+
+	regmap_update_bits(priv->regmap, ACCDET_EINT_M_DETECT_EN_ADDR,
+			   ACCDET_EINT_M_DETECT_EN_MASK_SFT, 0);
+
+	/* enable PWM */
+	regmap_write(priv->regmap, ACCDET_CMP_PWM_EN_ADDR, 0x67);
+	/* enable inverter detection */
+	if (priv->data->eint_detect_mode == 0x1) {
+		/* disable inverter detection */
+		if (priv->caps & ACCDET_PMIC_EINT0) {
+			regmap_update_bits(priv->regmap,
+					   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
+					   ACCDET_EINT0_INVERTER_SW_EN_MASK_SFT,
+					   0);
+		} else if (priv->caps & ACCDET_PMIC_EINT1) {
+			regmap_update_bits(priv->regmap,
+					   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
+					   ACCDET_EINT1_INVERTER_SW_EN_MASK_SFT,
+					   0);
+		}
+	} else {
+		if (priv->caps & ACCDET_PMIC_EINT0) {
+			regmap_update_bits(priv->regmap,
+					   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
+					   ACCDET_EINT0_INVERTER_SW_EN_MASK_SFT,
+					   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT));
+		} else if (priv->caps & ACCDET_PMIC_EINT1) {
+			regmap_update_bits(priv->regmap,
+					   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
+					   ACCDET_EINT1_INVERTER_SW_EN_MASK_SFT,
+					   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT));
+		}
+	}
+}
+
+static void config_eint_init_by_mode(struct mt6359_accdet *priv)
+{
+	unsigned int val = 0;
+
+	if (priv->caps & ACCDET_PMIC_EINT0) {
+		regmap_update_bits(priv->regmap, RG_EINT0EN_ADDR,
+				   RG_EINT0EN_MASK_SFT, BIT(RG_EINT0EN_SFT));
+	} else if (priv->caps & ACCDET_PMIC_EINT1) {
+		regmap_update_bits(priv->regmap, RG_EINT1EN_ADDR,
+				   RG_EINT1EN_MASK_SFT, BIT(RG_EINT1EN_SFT));
+	}
+	/* ESD switches on */
+	regmap_update_bits(priv->regmap, RG_ACCDETSPARE_ADDR,
+			   1 << 8, 1 << 8);
+	/* before playback, set NCP pull low before nagative voltage */
+	regmap_update_bits(priv->regmap, RG_NCP_PDDIS_EN_ADDR,
+			   RG_NCP_PDDIS_EN_MASK_SFT, BIT(RG_NCP_PDDIS_EN_SFT));
+
+	if (priv->data->eint_detect_mode == 0x1 ||
+	    priv->data->eint_detect_mode == 0x2 ||
+	    priv->data->eint_detect_mode == 0x3) {
+		if (priv->data->eint_use_ext_res == 0x1) {
+			if (priv->caps & ACCDET_PMIC_EINT0) {
+				regmap_update_bits(priv->regmap,
+						   RG_EINT0CONFIGACCDET_ADDR,
+						   RG_EINT0CONFIGACCDET_MASK_SFT,
+						   0);
+			} else if (priv->caps & ACCDET_PMIC_EINT1) {
+				regmap_update_bits(priv->regmap,
+						   RG_EINT1CONFIGACCDET_ADDR,
+						   RG_EINT1CONFIGACCDET_MASK_SFT,
+						   0);
+			}
+		} else {
+			if (priv->caps & ACCDET_PMIC_EINT0) {
+				regmap_update_bits(priv->regmap,
+						   RG_EINT0CONFIGACCDET_ADDR,
+						   RG_EINT0CONFIGACCDET_MASK_SFT,
+						   BIT(RG_EINT0CONFIGACCDET_SFT));
+			} else if (priv->caps & ACCDET_PMIC_EINT1) {
+				regmap_update_bits(priv->regmap,
+						   RG_EINT1CONFIGACCDET_ADDR,
+						   RG_EINT1CONFIGACCDET_MASK_SFT,
+						   BIT(RG_EINT1CONFIGACCDET_SFT));
+			}
+		}
+	}
+
+	if (priv->data->eint_detect_mode != 0x1) {
+		/* current detect set 0.25uA */
+		regmap_update_bits(priv->regmap, RG_ACCDETSPARE_ADDR,
+				   0x3 << RG_ACCDETSPARE_SFT,
+				   0x3 << RG_ACCDETSPARE_SFT);
+	}
+	regmap_write(priv->regmap, RG_EINTCOMPVTH_ADDR,
+		     val | priv->data->eint_comp_vth << RG_EINTCOMPVTH_SFT);
+}
+
+static void mt6359_accdet_init(struct mt6359_accdet *priv)
+{
+	unsigned int reg = 0;
+
+	regmap_update_bits(priv->regmap, ACCDET_SEQ_INIT_ADDR,
+			   ACCDET_SEQ_INIT_MASK_SFT, BIT(ACCDET_SEQ_INIT_SFT));
+	mdelay(2);
+	regmap_update_bits(priv->regmap, ACCDET_SEQ_INIT_ADDR,
+			   ACCDET_SEQ_INIT_MASK_SFT, 0);
+	mdelay(1);
+	/* init the debounce time (debounce/32768)sec */
+	accdet_set_debounce(priv, accdet_state000,
+			    priv->data->pwm_deb->debounce0);
+	accdet_set_debounce(priv, accdet_state001,
+			    priv->data->pwm_deb->debounce1);
+	accdet_set_debounce(priv, accdet_state011,
+			    priv->data->pwm_deb->debounce3);
+	accdet_set_debounce(priv, accdet_auxadc,
+			    priv->data->pwm_deb->debounce4);
+
+	accdet_set_debounce(priv, eint_state000,
+			    priv->data->pwm_deb->eint_debounce0);
+	accdet_set_debounce(priv, eint_state001,
+			    priv->data->pwm_deb->eint_debounce1);
+	accdet_set_debounce(priv, eint_state011,
+			    priv->data->pwm_deb->eint_debounce3);
+	accdet_set_debounce(priv, eint_inverter_state000,
+			    priv->data->pwm_deb->eint_inverter_debounce);
+
+	regmap_update_bits(priv->regmap, RG_ACCDET_RST_ADDR,
+			   RG_ACCDET_RST_MASK_SFT, BIT(RG_ACCDET_RST_SFT));
+	regmap_update_bits(priv->regmap, RG_ACCDET_RST_ADDR,
+			   RG_ACCDET_RST_MASK_SFT, 0);
+
+	/* clear high micbias1 voltage setting */
+	regmap_update_bits(priv->regmap, RG_AUDPWDBMICBIAS1_ADDR,
+			   0x3 << RG_AUDMICBIAS1HVEN_SFT, 0);
+	regmap_update_bits(priv->regmap, RG_AUDPWDBMICBIAS1_ADDR,
+			   0x7 << RG_AUDMICBIAS1VREF_SFT, 0);
+
+	/* init pwm frequency, duty & rise/falling delay */
+	regmap_write(priv->regmap, ACCDET_PWM_WIDTH_ADDR,
+		     REGISTER_VAL(priv->data->pwm_deb->pwm_width));
+	regmap_write(priv->regmap, ACCDET_PWM_THRESH_ADDR,
+		     REGISTER_VAL(priv->data->pwm_deb->pwm_thresh));
+	regmap_write(priv->regmap, ACCDET_RISE_DELAY_ADDR,
+		     (priv->data->pwm_deb->fall_delay << 15 |
+		      priv->data->pwm_deb->rise_delay));
+
+	regmap_read(priv->regmap, RG_AUDPWDBMICBIAS1_ADDR, &reg);
+	if (priv->data->mic_vol <= 7) {
+		/* micbias1 <= 2.7V */
+		regmap_write(priv->regmap, RG_AUDPWDBMICBIAS1_ADDR,
+			     reg | (priv->data->mic_vol << RG_AUDMICBIAS1VREF_SFT) |
+			     RG_AUDMICBIAS1LOWPEN_MASK_SFT);
+	} else if (priv->data->mic_vol == 8) {
+		/* micbias1 = 2.8v */
+		regmap_write(priv->regmap, RG_AUDPWDBMICBIAS1_ADDR,
+			     reg | (3 << RG_AUDMICBIAS1HVEN_SFT) |
+			     RG_AUDMICBIAS1LOWPEN_MASK_SFT);
+	} else if (priv->data->mic_vol == 9) {
+		/* micbias1 = 2.85v */
+		regmap_write(priv->regmap, RG_AUDPWDBMICBIAS1_ADDR,
+			     reg | (1 << RG_AUDMICBIAS1HVEN_SFT) |
+			     RG_AUDMICBIAS1LOWPEN_MASK_SFT);
+	}
+	/* mic mode setting */
+	regmap_read(priv->regmap, RG_AUDACCDETMICBIAS0PULLLOW_ADDR, &reg);
+	if (priv->data->mic_mode == HEADSET_MODE_1) {
+		/* ACC mode*/
+		regmap_write(priv->regmap, RG_AUDACCDETMICBIAS0PULLLOW_ADDR,
+			     reg | RG_ACCDET_MODE_ANA11_MODE1);
+		/* enable analog fast discharge */
+		regmap_update_bits(priv->regmap, RG_ANALOGFDEN_ADDR,
+				   RG_ANALOGFDEN_MASK_SFT,
+				   BIT(RG_ANALOGFDEN_SFT));
+		regmap_update_bits(priv->regmap, RG_ACCDETSPARE_ADDR,
+				   0x3 << 11, 0x3 << 11);
+	} else if (priv->data->mic_mode == HEADSET_MODE_2) {
+		/* DCC mode Low cost mode without internal bias */
+		regmap_write(priv->regmap, RG_AUDACCDETMICBIAS0PULLLOW_ADDR,
+			     reg | RG_ACCDET_MODE_ANA11_MODE2);
+		/* enable analog fast discharge */
+		regmap_update_bits(priv->regmap, RG_ANALOGFDEN_ADDR,
+				   0x3 << RG_ANALOGFDEN_SFT,
+				   0x3 << RG_ANALOGFDEN_SFT);
+	} else if (priv->data->mic_mode == HEADSET_MODE_6) {
+		/* DCC mode Low cost mode with internal bias,
+		 * bit8 = 1 to use internal bias
+		 */
+		regmap_write(priv->regmap, RG_AUDACCDETMICBIAS0PULLLOW_ADDR,
+			     reg | RG_ACCDET_MODE_ANA11_MODE6);
+		regmap_update_bits(priv->regmap, RG_AUDPWDBMICBIAS1_ADDR,
+				   RG_AUDMICBIAS1DCSW1PEN_MASK_SFT,
+				   BIT(RG_AUDMICBIAS1DCSW1PEN_SFT));
+		/* enable analog fast discharge */
+		regmap_update_bits(priv->regmap, RG_ANALOGFDEN_ADDR,
+				   0x3 << RG_ANALOGFDEN_SFT,
+				   0x3 << RG_ANALOGFDEN_SFT);
+	}
+
+	if (priv->caps & ACCDET_PMIC_EINT_IRQ) {
+		config_eint_init_by_mode(priv);
+		config_digital_init_by_mode(priv);
+	}
+}
+
+int mt6359_accdet_enable_jack_detect(struct snd_soc_component *component,
+				     struct snd_soc_jack *jack)
+{
+	struct mt6359_accdet *priv =
+		snd_soc_component_get_drvdata(component);
+
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOLUMEDOWN);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOICECOMMAND);
+
+	priv->jack = jack;
+
+	mt6359_accdet_jack_report(priv);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt6359_accdet_enable_jack_detect);
+
+static int mt6359_accdet_probe(struct platform_device *pdev)
+{
+	struct mt6359_accdet *priv;
+	struct mt6397_chip *mt6397 = dev_get_drvdata(pdev->dev.parent);
+	int ret = 0;
+
+	dev_dbg(&pdev->dev, "%s(), dev name %s\n",
+		__func__, dev_name(&pdev->dev));
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(struct mt6359_accdet),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->data = devm_kzalloc(&pdev->dev, sizeof(struct dts_data),
+				  GFP_KERNEL);
+	if (!priv->data)
+		return -ENOMEM;
+
+	priv->data->pwm_deb = devm_kzalloc(&pdev->dev,
+					   sizeof(struct pwm_deb_settings),
+					   GFP_KERNEL);
+	if (!priv->data->pwm_deb)
+		return -ENOMEM;
+
+	priv->regmap = mt6397->regmap;
+	if (IS_ERR(priv->regmap)) {
+		ret = PTR_ERR(priv->regmap);
+		dev_err(&pdev->dev, "Failed to allocate register map: %d\n",
+			ret);
+		return ret;
+	}
+	priv->dev = &pdev->dev;
+
+	ret = mt6359_accdet_parse_dt(priv);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to parse dts\n");
+		return ret;
+	}
+	mutex_init(&priv->res_lock);
+
+	priv->accdet_irq = platform_get_irq(pdev, 0);
+	if (priv->accdet_irq) {
+		ret = devm_request_threaded_irq(&pdev->dev, priv->accdet_irq,
+						NULL, mt6359_accdet_irq,
+						IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+						"ACCDET_IRQ", priv);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"Failed to request IRQ: (%d)\n", ret);
+			return ret;
+		}
+	}
+
+	if (priv->caps & ACCDET_PMIC_EINT0) {
+		priv->accdet_eint0 = platform_get_irq(pdev, 1);
+		if (priv->accdet_eint0) {
+			ret = devm_request_threaded_irq(&pdev->dev,
+							priv->accdet_eint0,
+							NULL, mt6359_accdet_irq,
+							IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+							"ACCDET_EINT0", priv);
+			if (ret) {
+				dev_err(&pdev->dev,
+					"Failed to request eint0 IRQ (%d)\n",
+					ret);
+				return ret;
+			}
+		}
+	} else if (priv->caps & ACCDET_PMIC_EINT1) {
+		priv->accdet_eint1 = platform_get_irq(pdev, 2);
+		if (priv->accdet_eint1) {
+			ret = devm_request_threaded_irq(&pdev->dev,
+							priv->accdet_eint1,
+							NULL, mt6359_accdet_irq,
+							IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+							"ACCDET_EINT1", priv);
+			if (ret) {
+				dev_err(&pdev->dev,
+					"Failed to request eint1 IRQ (%d)\n",
+					ret);
+				return ret;
+			}
+		}
+	}
+
+	priv->accdet_workqueue = create_singlethread_workqueue("accdet");
+	INIT_WORK(&priv->accdet_work, mt6359_accdet_work);
+	if (!priv->accdet_workqueue) {
+		dev_err(&pdev->dev, "Failed to create accdet workqueue\n");
+		ret = -1;
+		goto err_accdet_wq;
+	}
+
+	priv->jd_workqueue = create_singlethread_workqueue("mt6359_accdet_jd");
+	INIT_WORK(&priv->jd_work, mt6359_accdet_jd_work);
+	if (!priv->jd_workqueue) {
+		dev_err(&pdev->dev, "Failed to reate jack detect workqueue\n");
+		ret = -1;
+		goto err_eint_wq;
+	}
+
+	platform_set_drvdata(pdev, priv);
+	ret = devm_snd_soc_register_component(&pdev->dev,
+					      &mt6359_accdet_soc_driver,
+					      NULL, 0);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register component\n");
+		return ret;
+	}
+
+	priv->jd_sts = M_PLUG_OUT;
+	priv->jack_type = 0;
+	priv->btn_type = 0;
+	priv->accdet_status = 0x3;
+	mt6359_accdet_init(priv);
+
+	mt6359_accdet_jack_report(priv);
+
+	return 0;
+
+err_eint_wq:
+	destroy_workqueue(priv->accdet_workqueue);
+err_accdet_wq:
+	dev_err(&pdev->dev, "%s error. now exit.!\n", __func__);
+	return ret;
+}
+
+static struct platform_driver mt6359_accdet_driver = {
+	.driver = {
+		.name = "pmic-codec-accdet",
+	},
+	.probe = mt6359_accdet_probe,
+};
+
+static int __init mt6359_accdet_driver_init(void)
+{
+	int ret = 0;
+
+	ret = platform_driver_register(&mt6359_accdet_driver);
+	if (ret)
+		return -ENODEV;
+	return 0;
+}
+
+static void __exit mt6359_accdet_driver_exit(void)
+{
+	platform_driver_unregister(&mt6359_accdet_driver);
+}
+module_init(mt6359_accdet_driver_init);
+module_exit(mt6359_accdet_driver_exit);
+
+/* Module information */
+MODULE_DESCRIPTION("MT6359 ALSA SoC codec jack driver");
+MODULE_AUTHOR("Argus Lin <argus.lin@mediatek.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/mt6359-accdet.h b/sound/soc/codecs/mt6359-accdet.h
new file mode 100644
index 000000000000..c234f2f4276a
--- /dev/null
+++ b/sound/soc/codecs/mt6359-accdet.h
@@ -0,0 +1,128 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ * Author: Argus Lin <argus.lin@mediatek.com>
+ */
+
+#ifndef _ACCDET_H_
+#define _ACCDET_H_
+
+#include <linux/ctype.h>
+#include <linux/string.h>
+
+#define ACCDET_DEVNAME "accdet"
+
+#define HEADSET_MODE_1		(1)
+#define HEADSET_MODE_2		(2)
+#define HEADSET_MODE_6		(6)
+
+#define MT6359_ACCDET_NUM_BUTTONS 4
+#define MT6359_ACCDET_JACK_MASK (SND_JACK_HEADPHONE | \
+				SND_JACK_HEADSET | \
+				SND_JACK_BTN_0 | \
+				SND_JACK_BTN_1 | \
+				SND_JACK_BTN_2 | \
+				SND_JACK_BTN_3)
+#define MT6359_ACCDET_BTN_MASK (SND_JACK_BTN_0 | \
+				SND_JACK_BTN_1 | \
+				SND_JACK_BTN_2 | \
+				SND_JACK_BTN_3)
+
+enum eint_moisture_status {
+	M_PLUG_IN =		0,
+	M_WATER_IN =		1,
+	M_HP_PLUG_IN =		2,
+	M_PLUG_OUT =		3,
+	M_NO_ACT =		4,
+	M_UNKNOWN =		5,
+};
+
+enum {
+	accdet_state000 = 0,
+	accdet_state001,
+	accdet_state010,
+	accdet_state011,
+	accdet_auxadc,
+	eint_state000,
+	eint_state001,
+	eint_state010,
+	eint_state011,
+	eint_inverter_state000,
+};
+
+struct three_key_threshold {
+	unsigned int mid;
+	unsigned int up;
+	unsigned int down;
+};
+
+struct four_key_threshold {
+	unsigned int mid;
+	unsigned int voice;
+	unsigned int up;
+	unsigned int down;
+};
+
+struct pwm_deb_settings {
+	unsigned int pwm_width;
+	unsigned int pwm_thresh;
+	unsigned int fall_delay;
+	unsigned int rise_delay;
+	unsigned int debounce0;
+	unsigned int debounce1;
+	unsigned int debounce3;
+	unsigned int debounce4;
+	unsigned int eint_pwm_width;
+	unsigned int eint_pwm_thresh;
+	unsigned int eint_debounce0;
+	unsigned int eint_debounce1;
+	unsigned int eint_debounce2;
+	unsigned int eint_debounce3;
+	unsigned int eint_inverter_debounce;
+
+};
+
+struct dts_data {
+	unsigned int mic_vol;
+	unsigned int mic_mode;
+	unsigned int plugout_deb;
+	unsigned int eint_pol;
+	struct pwm_deb_settings *pwm_deb;
+	struct three_key_threshold three_key;
+	struct four_key_threshold four_key;
+	unsigned int moisture_detect_enable;
+	unsigned int eint_detect_mode;
+	unsigned int eint_use_ext_res;
+	unsigned int eint_comp_vth;
+	unsigned int moisture_detect_mode;
+	unsigned int moisture_comp_vth;
+	unsigned int moisture_comp_vref2;
+	unsigned int moisture_use_ext_res;
+};
+
+struct mt6359_accdet {
+	struct snd_soc_jack *jack;
+	struct device *dev;
+	struct regmap *regmap;
+	struct dts_data *data;
+	unsigned int caps;
+	int accdet_irq;
+	int accdet_eint0;
+	int accdet_eint1;
+	struct mutex res_lock; /* lock protection */
+	bool jack_plugged;
+	unsigned int jack_type;
+	unsigned int btn_type;
+	unsigned int accdet_status;
+	unsigned int pre_accdet_status;
+	unsigned int cali_voltage;
+	unsigned int jd_sts;
+	struct work_struct accdet_work;
+	struct workqueue_struct *accdet_workqueue;
+	struct work_struct jd_work;
+	struct workqueue_struct *jd_workqueue;
+};
+
+int mt6359_accdet_enable_jack_detect(struct snd_soc_component *component,
+				     struct snd_soc_jack *jack);
+#endif
diff --git a/sound/soc/codecs/mt6359.h b/sound/soc/codecs/mt6359.h
index 35f806b7396d..296ffa7f50b5 100644
--- a/sound/soc/codecs/mt6359.h
+++ b/sound/soc/codecs/mt6359.h
@@ -8,129 +8,1779 @@
 #define _MT6359_H_

 /*************Register Bit Define*************/
-#define PMIC_ACCDET_IRQ_SHIFT				0
-#define PMIC_ACCDET_EINT0_IRQ_SHIFT			2
-#define PMIC_ACCDET_EINT1_IRQ_SHIFT			3
-#define PMIC_ACCDET_IRQ_CLR_SHIFT			8
-#define PMIC_ACCDET_EINT0_IRQ_CLR_SHIFT			10
-#define PMIC_ACCDET_EINT1_IRQ_CLR_SHIFT			11
-#define PMIC_RG_INT_STATUS_ACCDET_SHIFT			5
-#define PMIC_RG_INT_STATUS_ACCDET_EINT0_SHIFT		6
-#define PMIC_RG_INT_STATUS_ACCDET_EINT1_SHIFT		7
-#define PMIC_RG_EINT0CONFIGACCDET_SHIFT			11
-#define PMIC_RG_EINT1CONFIGACCDET_SHIFT			0
-#define PMIC_ACCDET_EINT0_INVERTER_SW_EN_SHIFT		6
-#define PMIC_ACCDET_EINT1_INVERTER_SW_EN_SHIFT		8
-#define PMIC_RG_MTEST_EN_SHIFT				8
-#define PMIC_RG_MTEST_SEL_SHIFT				9
-#define PMIC_ACCDET_EINT0_M_SW_EN_SHIFT			10
-#define PMIC_ACCDET_EINT1_M_SW_EN_SHIFT			11
-#define PMIC_ACCDET_EINT0_CEN_STABLE_SHIFT		5
-#define PMIC_ACCDET_EINT1_CEN_STABLE_SHIFT		10
-#define PMIC_ACCDET_DA_STABLE_SHIFT			0
-#define PMIC_ACCDET_EINT0_EN_STABLE_SHIFT		1
-#define PMIC_ACCDET_EINT0_CMPEN_STABLE_SHIFT		2
-#define PMIC_ACCDET_EINT1_EN_STABLE_SHIFT		6
-#define PMIC_ACCDET_EINT1_CMPEN_STABLE_SHIFT		7
-#define PMIC_ACCDET_EINT_CTURBO_SEL_SHIFT		7
-#define PMIC_ACCDET_EINT0_CTURBO_SW_SHIFT		7
-#define PMIC_RG_EINTCOMPVTH_SHIFT			4
-#define PMIC_RG_EINT0HIRENB_SHIFT			12
-#define PMIC_RG_EINT0NOHYS_SHIFT			10
-#define PMIC_ACCDET_SW_EN_SHIFT				0
-#define PMIC_ACCDET_EINT0_MEM_IN_SHIFT			6
-#define PMIC_ACCDET_MEM_IN_SHIFT			6
-#define PMIC_ACCDET_EINT_DEBOUNCE0_SHIFT		0
-#define PMIC_ACCDET_EINT_DEBOUNCE1_SHIFT		4
-#define PMIC_ACCDET_EINT_DEBOUNCE2_SHIFT		8
-#define PMIC_ACCDET_EINT_DEBOUNCE3_SHIFT		12
-#define PMIC_RG_ACCDET2AUXSWEN_SHIFT			14
-#define PMIC_AUDACCDETAUXADCSWCTRL_SEL_SHIFT		9
-#define PMIC_AUDACCDETAUXADCSWCTRL_SW_SHIFT		10
-#define PMIC_RG_EINT0CTURBO_SHIFT			5
-#define PMIC_RG_EINT1CTURBO_SHIFT			13
-#define PMIC_ACCDET_EINT_M_PLUG_IN_NUM_SHIFT		12
-#define PMIC_ACCDET_EINT_M_DETECT_EN_SHIFT		12
-#define PMIC_ACCDET_EINT0_SW_EN_SHIFT			2
-#define PMIC_ACCDET_EINT1_SW_EN_SHIFT			4
-#define PMIC_ACCDET_EINT_CMPMOUT_SEL_SHIFT		12
-#define PMIC_ACCDET_EINT_CMPMEN_SEL_SHIFT		6
-#define PMIC_RG_HPLOUTPUTSTBENH_VAUDP32_SHIFT		0
-#define PMIC_RG_HPROUTPUTSTBENH_VAUDP32_SHIFT		4
-#define PMIC_RG_EINT0EN_SHIFT				2
-#define PMIC_RG_EINT1EN_SHIFT				10
-#define PMIC_RG_NCP_PDDIS_EN_SHIFT			0
-#define PMIC_RG_ACCDETSPARE_SHIFT			0
-#define PMIC_RG_ACCDET_RST_SHIFT			1
-#define PMIC_RG_AUDMICBIAS1HVEN_SHIFT			12
-#define PMIC_RG_AUDMICBIAS1VREF_SHIFT			4
-#define PMIC_RG_ANALOGFDEN_SHIFT			12
-#define PMIC_RG_AUDMICBIAS1DCSW1PEN_SHIFT		8
-#define PMIC_RG_AUDMICBIAS1LOWPEN_SHIFT			2
-#define PMIC_ACCDET_SEQ_INIT_SHIFT			1
-#define PMIC_RG_EINTCOMPVTH_MASK			0xf
-#define PMIC_ACCDET_EINT0_MEM_IN_MASK			0x3
-#define PMIC_ACCDET_EINT_DEBOUNCE0_MASK			0xf
-#define PMIC_ACCDET_EINT_DEBOUNCE1_MASK			0xf
-#define PMIC_ACCDET_EINT_DEBOUNCE2_MASK			0xf
-#define PMIC_ACCDET_EINT_DEBOUNCE3_MASK			0xf
-#define PMIC_ACCDET_EINT0_IRQ_SHIFT			2
-#define PMIC_ACCDET_EINT1_IRQ_SHIFT			3
-
-/* AUDENC_ANA_CON16: */
-#define RG_AUD_MICBIAS1_LOWP_EN		BIT(PMIC_RG_AUDMICBIAS1LOWPEN_SHIFT)
-
+#define MT6359_TOP0_ID                       0x0
+#define MT6359_SMT_CON1                      0x32
+#define MT6359_DRV_CON2                      0x3c
+#define MT6359_DRV_CON3                      0x3e
+#define MT6359_DRV_CON4                      0x40
+#define MT6359_TOP_CKPDN_CON0                0x10c
+#define MT6359_TOP_CKPDN_CON0_SET            0x10e
+#define MT6359_TOP_CKPDN_CON0_CLR            0x110
+#define MT6359_AUXADC_RQST0                  0x1108
+#define MT6359_AUXADC_CON10                  0x11a0
+#define MT6359_AUXADC_ACCDET                 0x11ba
+#define MT6359_LDO_VUSB_OP_EN                0x1d0c
+#define MT6359_LDO_VUSB_OP_EN_SET            0x1d0e
+#define MT6359_LDO_VUSB_OP_EN_CLR            0x1d10
+#define MT6359_AUD_TOP_CKPDN_CON0            0x230c
+#define MT6359_AUD_TOP_CKPDN_CON0_SET        0x230e
+#define MT6359_AUD_TOP_CKPDN_CON0_CLR        0x2310
+#define MT6359_AUD_TOP_RST_CON0              0x2320
+#define MT6359_AUD_TOP_RST_CON0_SET          0x2322
+#define MT6359_AUD_TOP_RST_CON0_CLR          0x2324
+#define MT6359_AUD_TOP_INT_CON0              0x2328
+#define MT6359_AUD_TOP_INT_CON0_SET          0x232a
+#define MT6359_AUD_TOP_INT_CON0_CLR          0x232c
+#define MT6359_AUD_TOP_INT_MASK_CON0         0x232e
+#define MT6359_AUD_TOP_INT_MASK_CON0_SET     0x2330
+#define MT6359_AUD_TOP_INT_MASK_CON0_CLR     0x2332
+#define MT6359_AUD_TOP_INT_STATUS0           0x2334
+#define MT6359_AFE_NCP_CFG2                  0x24e2
+#define MT6359_AUDENC_DSN_ID                 0x2500
+#define MT6359_AUDENC_DSN_REV0               0x2502
+#define MT6359_AUDENC_DSN_DBI                0x2504
+#define MT6359_AUDENC_DSN_FPI                0x2506
+#define MT6359_AUDENC_ANA_CON0               0x2508
+#define MT6359_AUDENC_ANA_CON1               0x250a
+#define MT6359_AUDENC_ANA_CON2               0x250c
+#define MT6359_AUDENC_ANA_CON3               0x250e
+#define MT6359_AUDENC_ANA_CON4               0x2510
+#define MT6359_AUDENC_ANA_CON5               0x2512
+#define MT6359_AUDENC_ANA_CON6               0x2514
+#define MT6359_AUDENC_ANA_CON7               0x2516
+#define MT6359_AUDENC_ANA_CON8               0x2518
+#define MT6359_AUDENC_ANA_CON9               0x251a
+#define MT6359_AUDENC_ANA_CON10              0x251c
+#define MT6359_AUDENC_ANA_CON11              0x251e
+#define MT6359_AUDENC_ANA_CON12              0x2520
+#define MT6359_AUDENC_ANA_CON13              0x2522
+#define MT6359_AUDENC_ANA_CON14              0x2524
+#define MT6359_AUDENC_ANA_CON15              0x2526
+#define MT6359_AUDENC_ANA_CON16              0x2528
+#define MT6359_AUDENC_ANA_CON17              0x252a
+#define MT6359_AUDENC_ANA_CON18              0x252c
+#define MT6359_AUDENC_ANA_CON19              0x252e
+#define MT6359_AUDENC_ANA_CON20              0x2530
+#define MT6359_AUDENC_ANA_CON21              0x2532
+#define MT6359_AUDENC_ANA_CON22              0x2534
+#define MT6359_AUDENC_ANA_CON23              0x2536
+#define MT6359_AUDDEC_DSN_ID                 0x2580
+#define MT6359_AUDDEC_DSN_REV0               0x2582
+#define MT6359_AUDDEC_DSN_DBI                0x2584
+#define MT6359_AUDDEC_DSN_FPI                0x2586
+#define MT6359_AUDDEC_ANA_CON0               0x2588
+#define MT6359_AUDDEC_ANA_CON1               0x258a
+#define MT6359_AUDDEC_ANA_CON2               0x258c
+#define MT6359_AUDDEC_ANA_CON3               0x258e
+#define MT6359_AUDDEC_ANA_CON4               0x2590
+#define MT6359_AUDDEC_ANA_CON5               0x2592
+#define MT6359_AUDDEC_ANA_CON6               0x2594
+#define MT6359_AUDDEC_ANA_CON7               0x2596
+#define MT6359_AUDDEC_ANA_CON8               0x2598
+#define MT6359_AUDDEC_ANA_CON9               0x259a
+#define MT6359_AUDDEC_ANA_CON10              0x259c
+#define MT6359_AUDDEC_ANA_CON11              0x259e
+#define MT6359_AUDDEC_ANA_CON12              0x25a0
+#define MT6359_AUDDEC_ANA_CON13              0x25a2
+#define MT6359_AUDDEC_ANA_CON14              0x25a4
+#define MT6359_ACCDET_DSN_DIG_ID             0x2680
+#define MT6359_ACCDET_DSN_DIG_REV0           0x2682
+#define MT6359_ACCDET_DSN_DBI                0x2684
+#define MT6359_ACCDET_DSN_FPI                0x2686
+#define MT6359_ACCDET_CON0                   0x2688
+#define MT6359_ACCDET_CON1                   0x268a
+#define MT6359_ACCDET_CON2                   0x268c
+#define MT6359_ACCDET_CON3                   0x268e
+#define MT6359_ACCDET_CON4                   0x2690
+#define MT6359_ACCDET_CON5                   0x2692
+#define MT6359_ACCDET_CON6                   0x2694
+#define MT6359_ACCDET_CON7                   0x2696
+#define MT6359_ACCDET_CON8                   0x2698
+#define MT6359_ACCDET_CON9                   0x269a
+#define MT6359_ACCDET_CON10                  0x269c
+#define MT6359_ACCDET_CON11                  0x269e
+#define MT6359_ACCDET_CON12                  0x26a0
+#define MT6359_ACCDET_CON13                  0x26a2
+#define MT6359_ACCDET_CON14                  0x26a4
+#define MT6359_ACCDET_CON15                  0x26a6
+#define MT6359_ACCDET_CON16                  0x26a8
+#define MT6359_ACCDET_CON17                  0x26aa
+#define MT6359_ACCDET_CON18                  0x26ac
+#define MT6359_ACCDET_CON19                  0x26ae
+#define MT6359_ACCDET_CON20                  0x26b0
+#define MT6359_ACCDET_CON21                  0x26b2
+#define MT6359_ACCDET_CON22                  0x26b4
+#define MT6359_ACCDET_CON23                  0x26b6
+#define MT6359_ACCDET_CON24                  0x26b8
+#define MT6359_ACCDET_CON25                  0x26ba
+#define MT6359_ACCDET_CON26                  0x26bc
+#define MT6359_ACCDET_CON27                  0x26be
+#define MT6359_ACCDET_CON28                  0x26c0
+#define MT6359_ACCDET_CON29                  0x26c2
+#define MT6359_ACCDET_CON30                  0x26c4
+#define MT6359_ACCDET_CON31                  0x26c6
+#define MT6359_ACCDET_CON32                  0x26c8
+#define MT6359_ACCDET_CON33                  0x26ca
+#define MT6359_ACCDET_CON34                  0x26cc
+#define MT6359_ACCDET_CON35                  0x26ce
+#define MT6359_ACCDET_CON36                  0x26d0
+#define MT6359_ACCDET_CON37                  0x26d2
+#define MT6359_ACCDET_CON38                  0x26d4
+#define MT6359_ACCDET_CON39                  0x26d6
+#define MT6359_ACCDET_CON40                  0x26d8
+
+#define TOP0_ANA_ID_ADDR                               \
+	MT6359_TOP0_ID
+#define TOP0_ANA_ID_SFT                                0
+#define TOP0_ANA_ID_MASK                               0xFF
+#define TOP0_ANA_ID_MASK_SFT                           (0xFF << 0)
+#define AUXADC_RQST_CH0_ADDR                           \
+	MT6359_AUXADC_RQST0
+#define AUXADC_RQST_CH0_SFT                            0
+#define AUXADC_RQST_CH0_MASK                           0x1
+#define AUXADC_RQST_CH0_MASK_SFT                       (0x1 << 0)
+#define AUXADC_ACCDET_ANASWCTRL_EN_ADDR                \
+	MT6359_AUXADC_CON15
+#define AUXADC_ACCDET_ANASWCTRL_EN_SFT                 6
+#define AUXADC_ACCDET_ANASWCTRL_EN_MASK                0x1
+#define AUXADC_ACCDET_ANASWCTRL_EN_MASK_SFT            (0x1 << 6)
+
+#define AUXADC_ACCDET_AUTO_SPL_ADDR                    \
+	MT6359_AUXADC_ACCDET
+#define AUXADC_ACCDET_AUTO_SPL_SFT                     0
+#define AUXADC_ACCDET_AUTO_SPL_MASK                    0x1
+#define AUXADC_ACCDET_AUTO_SPL_MASK_SFT                (0x1 << 0)
+#define AUXADC_ACCDET_AUTO_RQST_CLR_ADDR               \
+	MT6359_AUXADC_ACCDET
+#define AUXADC_ACCDET_AUTO_RQST_CLR_SFT                1
+#define AUXADC_ACCDET_AUTO_RQST_CLR_MASK               0x1
+#define AUXADC_ACCDET_AUTO_RQST_CLR_MASK_SFT           (0x1 << 1)
+#define AUXADC_ACCDET_DIG1_RSV0_ADDR                   \
+	MT6359_AUXADC_ACCDET
+#define AUXADC_ACCDET_DIG1_RSV0_SFT                    2
+#define AUXADC_ACCDET_DIG1_RSV0_MASK                   0x3F
+#define AUXADC_ACCDET_DIG1_RSV0_MASK_SFT               (0x3F << 2)
+#define AUXADC_ACCDET_DIG0_RSV0_ADDR                   \
+	MT6359_AUXADC_ACCDET
+#define AUXADC_ACCDET_DIG0_RSV0_SFT                    8
+#define AUXADC_ACCDET_DIG0_RSV0_MASK                   0xFF
+#define AUXADC_ACCDET_DIG0_RSV0_MASK_SFT               (0xFF << 8)
+
+#define RG_ACCDET_CK_PDN_ADDR                          \
+	MT6359_AUD_TOP_CKPDN_CON0
+#define RG_ACCDET_CK_PDN_SFT                           0
+#define RG_ACCDET_CK_PDN_MASK                          0x1
+#define RG_ACCDET_CK_PDN_MASK_SFT                      (0x1 << 0)
+
+#define RG_ACCDET_RST_ADDR                             \
+	MT6359_AUD_TOP_RST_CON0
+#define RG_ACCDET_RST_SFT                              1
+#define RG_ACCDET_RST_MASK                             0x1
+#define RG_ACCDET_RST_MASK_SFT                         (0x1 << 1)
+#define BANK_ACCDET_SWRST_ADDR                         \
+	MT6359_AUD_TOP_RST_BANK_CON0
+#define BANK_ACCDET_SWRST_SFT                          0
+#define BANK_ACCDET_SWRST_MASK                         0x1
+#define BANK_ACCDET_SWRST_MASK_SFT                     (0x1 << 0)
+
+#define RG_INT_EN_ACCDET_ADDR                          \
+	MT6359_AUD_TOP_INT_CON0
+#define RG_INT_EN_ACCDET_SFT                           5
+#define RG_INT_EN_ACCDET_MASK                          0x1
+#define RG_INT_EN_ACCDET_MASK_SFT                      (0x1 << 5)
+#define RG_INT_EN_ACCDET_EINT0_ADDR                    \
+	MT6359_AUD_TOP_INT_CON0
+#define RG_INT_EN_ACCDET_EINT0_SFT                     6
+#define RG_INT_EN_ACCDET_EINT0_MASK                    0x1
+#define RG_INT_EN_ACCDET_EINT0_MASK_SFT                (0x1 << 6)
+#define RG_INT_EN_ACCDET_EINT1_ADDR                    \
+	MT6359_AUD_TOP_INT_CON0
+#define RG_INT_EN_ACCDET_EINT1_SFT                     7
+#define RG_INT_EN_ACCDET_EINT1_MASK                    0x1
+#define RG_INT_EN_ACCDET_EINT1_MASK_SFT                (0x1 << 7)
+
+#define RG_INT_MASK_ACCDET_ADDR                        \
+	MT6359_AUD_TOP_INT_MASK_CON0
+#define RG_INT_MASK_ACCDET_SFT                         5
+#define RG_INT_MASK_ACCDET_MASK                        0x1
+#define RG_INT_MASK_ACCDET_MASK_SFT                    (0x1 << 5)
+#define RG_INT_MASK_ACCDET_EINT0_ADDR                  \
+	MT6359_AUD_TOP_INT_MASK_CON0
+#define RG_INT_MASK_ACCDET_EINT0_SFT                   6
+#define RG_INT_MASK_ACCDET_EINT0_MASK                  0x1
+#define RG_INT_MASK_ACCDET_EINT0_MASK_SFT              (0x1 << 6)
+#define RG_INT_MASK_ACCDET_EINT1_ADDR                  \
+	MT6359_AUD_TOP_INT_MASK_CON0
+#define RG_INT_MASK_ACCDET_EINT1_SFT                   7
+#define RG_INT_MASK_ACCDET_EINT1_MASK                  0x1
+#define RG_INT_MASK_ACCDET_EINT1_MASK_SFT              (0x1 << 7)
+
+#define RG_INT_STATUS_ACCDET_ADDR                      \
+	MT6359_AUD_TOP_INT_STATUS0
+#define RG_INT_STATUS_ACCDET_SFT                       5
+#define RG_INT_STATUS_ACCDET_MASK                      0x1
+#define RG_INT_STATUS_ACCDET_MASK_SFT                  (0x1 << 5)
+#define RG_INT_STATUS_ACCDET_EINT0_ADDR                \
+	MT6359_AUD_TOP_INT_STATUS0
+#define RG_INT_STATUS_ACCDET_EINT0_SFT                 6
+#define RG_INT_STATUS_ACCDET_EINT0_MASK                0x1
+#define RG_INT_STATUS_ACCDET_EINT0_MASK_SFT            (0x1 << 6)
+#define RG_INT_STATUS_ACCDET_EINT1_ADDR                \
+	MT6359_AUD_TOP_INT_STATUS0
+#define RG_INT_STATUS_ACCDET_EINT1_SFT                 7
+#define RG_INT_STATUS_ACCDET_EINT1_MASK                0x1
+#define RG_INT_STATUS_ACCDET_EINT1_MASK_SFT            (0x1 << 7)
+
+#define RG_INT_RAW_STATUS_ACCDET_ADDR                  \
+	MT6359_AUD_TOP_INT_RAW_STATUS0
+#define RG_INT_RAW_STATUS_ACCDET_SFT                   5
+#define RG_INT_RAW_STATUS_ACCDET_MASK                  0x1
+#define RG_INT_RAW_STATUS_ACCDET_MASK_SFT              (0x1 << 5)
+#define RG_INT_RAW_STATUS_ACCDET_EINT0_ADDR            \
+	MT6359_AUD_TOP_INT_RAW_STATUS0
+#define RG_INT_RAW_STATUS_ACCDET_EINT0_SFT             6
+#define RG_INT_RAW_STATUS_ACCDET_EINT0_MASK            0x1
+#define RG_INT_RAW_STATUS_ACCDET_EINT0_MASK_SFT        (0x1 << 6)
+#define RG_INT_RAW_STATUS_ACCDET_EINT1_ADDR            \
+	MT6359_AUD_TOP_INT_RAW_STATUS0
+#define RG_INT_RAW_STATUS_ACCDET_EINT1_SFT             7
+#define RG_INT_RAW_STATUS_ACCDET_EINT1_MASK            0x1
+#define RG_INT_RAW_STATUS_ACCDET_EINT1_MASK_SFT        (0x1 << 7)
+
+#define RG_AUDACCDETMICBIAS0PULLLOW_ADDR               \
+	MT6359_AUDENC_ANA_CON18
+#define RG_AUDACCDETMICBIAS0PULLLOW_SFT                0
+#define RG_AUDACCDETMICBIAS0PULLLOW_MASK               0x1
+#define RG_AUDACCDETMICBIAS0PULLLOW_MASK_SFT           (0x1 << 0)
+#define RG_AUDACCDETMICBIAS1PULLLOW_ADDR               \
+	MT6359_AUDENC_ANA_CON18
+#define RG_AUDACCDETMICBIAS1PULLLOW_SFT                1
+#define RG_AUDACCDETMICBIAS1PULLLOW_MASK               0x1
+#define RG_AUDACCDETMICBIAS1PULLLOW_MASK_SFT           (0x1 << 1)
+#define RG_AUDACCDETMICBIAS2PULLLOW_ADDR               \
+	MT6359_AUDENC_ANA_CON18
+#define RG_AUDACCDETMICBIAS2PULLLOW_SFT                2
+#define RG_AUDACCDETMICBIAS2PULLLOW_MASK               0x1
+#define RG_AUDACCDETMICBIAS2PULLLOW_MASK_SFT           (0x1 << 2)
+#define RG_AUDACCDETVIN1PULLLOW_ADDR                   \
+	MT6359_AUDENC_ANA_CON18
+#define RG_AUDACCDETVIN1PULLLOW_SFT                    3
+#define RG_AUDACCDETVIN1PULLLOW_MASK                   0x1
+#define RG_AUDACCDETVIN1PULLLOW_MASK_SFT               (0x1 << 3)
+#define RG_AUDACCDETVTHACAL_ADDR                       \
+	MT6359_AUDENC_ANA_CON18
+#define RG_AUDACCDETVTHACAL_SFT                        4
+#define RG_AUDACCDETVTHACAL_MASK                       0x1
+#define RG_AUDACCDETVTHACAL_MASK_SFT                   (0x1 << 4)
+#define RG_AUDACCDETVTHBCAL_ADDR                       \
+	MT6359_AUDENC_ANA_CON18
+#define RG_AUDACCDETVTHBCAL_SFT                        5
+#define RG_AUDACCDETVTHBCAL_MASK                       0x1
+#define RG_AUDACCDETVTHBCAL_MASK_SFT                   (0x1 << 5)
+#define RG_AUDACCDETTVDET_ADDR                         \
+	MT6359_AUDENC_ANA_CON18
+#define RG_AUDACCDETTVDET_SFT                          6
+#define RG_AUDACCDETTVDET_MASK                         0x1
+#define RG_AUDACCDETTVDET_MASK_SFT                     (0x1 << 6)
+#define RG_ACCDETSEL_ADDR                              \
+	MT6359_AUDENC_ANA_CON18
+#define RG_ACCDETSEL_SFT                               7
+#define RG_ACCDETSEL_MASK                              0x1
+#define RG_ACCDETSEL_MASK_SFT                          (0x1 << 7)
+
+#define RG_AUDPWDBMICBIAS1_ADDR                        \
+	MT6359_AUDENC_ANA_CON16
+#define RG_AUDPWDBMICBIAS1_SFT                         0
+#define RG_AUDPWDBMICBIAS1_MASK                        0x1
+#define RG_AUDPWDBMICBIAS1_MASK_SFT                    (0x1 << 0)
+#define RG_AUDMICBIAS1BYPASSEN_ADDR                    \
+	MT6359_AUDENC_ANA_CON16
+#define RG_AUDMICBIAS1BYPASSEN_SFT                     1
+#define RG_AUDMICBIAS1BYPASSEN_MASK                    0x1
+#define RG_AUDMICBIAS1BYPASSEN_MASK_SFT                (0x1 << 1)
+#define RG_AUDMICBIAS1LOWPEN_ADDR                      \
+	MT6359_AUDENC_ANA_CON16
+#define RG_AUDMICBIAS1LOWPEN_SFT                       2
+#define RG_AUDMICBIAS1LOWPEN_MASK                      0x1
+#define RG_AUDMICBIAS1LOWPEN_MASK_SFT                  (0x1 << 2)
+#define RG_AUDMICBIAS1VREF_ADDR                        \
+	MT6359_AUDENC_ANA_CON16
+#define RG_AUDMICBIAS1VREF_SFT                         4
+#define RG_AUDMICBIAS1VREF_MASK                        0x7
+#define RG_AUDMICBIAS1VREF_MASK_SFT                    (0x7 << 4)
+#define RG_AUDMICBIAS1DCSW1PEN_ADDR                    \
+	MT6359_AUDENC_ANA_CON16
+#define RG_AUDMICBIAS1DCSW1PEN_SFT                     8
+#define RG_AUDMICBIAS1DCSW1PEN_MASK                    0x1
+#define RG_AUDMICBIAS1DCSW1PEN_MASK_SFT                (0x1 << 8)
+#define RG_AUDMICBIAS1DCSW1NEN_ADDR                    \
+	MT6359_AUDENC_ANA_CON16
+#define RG_AUDMICBIAS1DCSW1NEN_SFT                     9
+#define RG_AUDMICBIAS1DCSW1NEN_MASK                    0x1
+#define RG_AUDMICBIAS1DCSW1NEN_MASK_SFT                (0x1 << 9)
+#define RG_BANDGAPGEN_ADDR                             \
+	MT6359_AUDENC_ANA_CON16
+#define RG_BANDGAPGEN_SFT                              10
+#define RG_BANDGAPGEN_MASK                             0x1
+#define RG_BANDGAPGEN_MASK_SFT                         (0x1 << 10)
+#define RG_AUDMICBIAS1HVEN_ADDR                        \
+	MT6359_AUDENC_ANA_CON16
+#define RG_AUDMICBIAS1HVEN_SFT                         12
+#define RG_AUDMICBIAS1HVEN_MASK                        0x1
+#define RG_AUDMICBIAS1HVEN_MASK_SFT                    (0x1 << 12)
+#define RG_AUDMICBIAS1HVVREF_ADDR                      \
+	MT6359_AUDENC_ANA_CON16
+#define RG_AUDMICBIAS1HVVREF_SFT                       13
+#define RG_AUDMICBIAS1HVVREF_MASK                      0x1
+#define RG_AUDMICBIAS1HVVREF_MASK_SFT                  (0x1 << 13)
+
+#define RG_EINT0NOHYS_ADDR                             \
+	MT6359_AUDENC_ANA_CON18
+#define RG_EINT0NOHYS_SFT                              10
+#define RG_EINT0NOHYS_MASK                             0x1
+#define RG_EINT0NOHYS_MASK_SFT                         (0x1 << 10)
+#define RG_EINT0CONFIGACCDET_ADDR                      \
+	MT6359_AUDENC_ANA_CON18
+#define RG_EINT0CONFIGACCDET_SFT                       11
+#define RG_EINT0CONFIGACCDET_MASK                      0x1
+#define RG_EINT0CONFIGACCDET_MASK_SFT                  (0x1 << 11)
+#define RG_EINT0HIRENB_ADDR                            \
+	MT6359_AUDENC_ANA_CON18
+#define RG_EINT0HIRENB_SFT                             12
+#define RG_EINT0HIRENB_MASK                            0x1
+#define RG_EINT0HIRENB_MASK_SFT                        (0x1 << 12)
+#define RG_ACCDET2AUXRESBYPASS_ADDR                    \
+	MT6359_AUDENC_ANA_CON18
+#define RG_ACCDET2AUXRESBYPASS_SFT                     13
+#define RG_ACCDET2AUXRESBYPASS_MASK                    0x1
+#define RG_ACCDET2AUXRESBYPASS_MASK_SFT                (0x1 << 13)
+#define RG_ACCDET2AUXSWEN_ADDR                         \
+	MT6359_AUDENC_ANA_CON18
+#define RG_ACCDET2AUXSWEN_SFT                          14
+#define RG_ACCDET2AUXSWEN_MASK                         0x1
+#define RG_ACCDET2AUXSWEN_MASK_SFT                     (0x1 << 14)
+#define RG_AUDACCDETMICBIAS3PULLLOW_ADDR               \
+	MT6359_AUDENC_ANA_CON18
+#define RG_AUDACCDETMICBIAS3PULLLOW_SFT                15
+#define RG_AUDACCDETMICBIAS3PULLLOW_MASK               0x1
+#define RG_AUDACCDETMICBIAS3PULLLOW_MASK_SFT           (0x1 << 15)
+#define RG_EINT1CONFIGACCDET_ADDR                      \
+	MT6359_AUDENC_ANA_CON19
+#define RG_EINT1CONFIGACCDET_SFT                       0
+#define RG_EINT1CONFIGACCDET_MASK                      0x1
+#define RG_EINT1CONFIGACCDET_MASK_SFT                  (0x1 << 0)
+#define RG_EINT1HIRENB_ADDR                            \
+	MT6359_AUDENC_ANA_CON19
+#define RG_EINT1HIRENB_SFT                             1
+#define RG_EINT1HIRENB_MASK                            0x1
+#define RG_EINT1HIRENB_MASK_SFT                        (0x1 << 1)
+#define RG_EINT1NOHYS_ADDR                             \
+	MT6359_AUDENC_ANA_CON19
+#define RG_EINT1NOHYS_SFT                              2
+#define RG_EINT1NOHYS_MASK                             0x1
+#define RG_EINT1NOHYS_MASK_SFT                         (0x1 << 2)
+#define RG_EINTCOMPVTH_ADDR                            \
+	MT6359_AUDENC_ANA_CON19
+#define RG_MTEST_EN_ADDR                               \
+	MT6359_AUDENC_ANA_CON19
+#define RG_MTEST_EN_SFT                                8
+#define RG_MTEST_EN_MASK                               0x1
+#define RG_MTEST_EN_MASK_SFT                           (0x1 << 8)
+#define RG_MTEST_SEL_ADDR                              \
+	MT6359_AUDENC_ANA_CON19
+#define RG_MTEST_SEL_SFT                               9
+#define RG_MTEST_SEL_MASK                              0x1
+#define RG_MTEST_SEL_MASK_SFT                          (0x1 << 9)
+#define RG_MTEST_CURRENT_ADDR                          \
+	MT6359_AUDENC_ANA_CON19
+#define RG_MTEST_CURRENT_SFT                           10
+#define RG_MTEST_CURRENT_MASK                          0x1
+#define RG_MTEST_CURRENT_MASK_SFT                      (0x1 << 10)
+#define RG_ANALOGFDEN_ADDR                             \
+	MT6359_AUDENC_ANA_CON19
+#define RG_ANALOGFDEN_SFT                              12
+#define RG_ANALOGFDEN_MASK                             0x1
+#define RG_ANALOGFDEN_MASK_SFT                         (0x1 << 12)
+#define RG_FDVIN1PPULLLOW_ADDR                         \
+	MT6359_AUDENC_ANA_CON19
+#define RG_FDVIN1PPULLLOW_SFT                          13
+#define RG_FDVIN1PPULLLOW_MASK                         0x1
+#define RG_FDVIN1PPULLLOW_MASK_SFT                     (0x1 << 13)
+#define RG_FDEINT0TYPE_ADDR                            \
+	MT6359_AUDENC_ANA_CON19
+#define RG_FDEINT0TYPE_SFT                             14
+#define RG_FDEINT0TYPE_MASK                            0x1
+#define RG_FDEINT0TYPE_MASK_SFT                        (0x1 << 14)
+#define RG_FDEINT1TYPE_ADDR                            \
+	MT6359_AUDENC_ANA_CON19
+#define RG_FDEINT1TYPE_SFT                             15
+#define RG_FDEINT1TYPE_MASK                            0x1
+#define RG_FDEINT1TYPE_MASK_SFT                        (0x1 << 15)
+#define RG_EINT0CMPEN_ADDR                             \
+	MT6359_AUDENC_ANA_CON20
+#define RG_EINT0CMPEN_SFT                              0
+#define RG_EINT0CMPEN_MASK                             0x1
+#define RG_EINT0CMPEN_MASK_SFT                         (0x1 << 0)
+#define RG_EINT0CMPMEN_ADDR                            \
+	MT6359_AUDENC_ANA_CON20
+#define RG_EINT0CMPMEN_SFT                             1
+#define RG_EINT0CMPMEN_MASK                            0x1
+#define RG_EINT0CMPMEN_MASK_SFT                        (0x1 << 1)
+#define RG_EINT0EN_ADDR                                \
+	MT6359_AUDENC_ANA_CON20
+#define RG_EINT0EN_SFT                                 2
+#define RG_EINT0EN_MASK                                0x1
+#define RG_EINT0EN_MASK_SFT                            (0x1 << 2)
+#define RG_EINT0CEN_ADDR                               \
+	MT6359_AUDENC_ANA_CON20
+#define RG_EINT0CEN_SFT                                3
+#define RG_EINT0CEN_MASK                               0x1
+#define RG_EINT0CEN_MASK_SFT                           (0x1 << 3)
+#define RG_EINT0INVEN_ADDR                             \
+	MT6359_AUDENC_ANA_CON20
+#define RG_EINT0INVEN_SFT                              4
+#define RG_EINT0INVEN_MASK                             0x1
+#define RG_EINT0INVEN_MASK_SFT                         (0x1 << 4)
+#define RG_EINT0CTURBO_ADDR                            \
+	MT6359_AUDENC_ANA_CON20
+#define RG_EINT0CTURBO_SFT                             5
+#define RG_EINT0CTURBO_MASK                            0x7
+#define RG_EINT0CTURBO_MASK_SFT                        (0x7 << 5)
+#define RG_EINT1CMPEN_ADDR                             \
+	MT6359_AUDENC_ANA_CON20
+#define RG_EINT1CMPEN_SFT                              8
+#define RG_EINT1CMPEN_MASK                             0x1
+#define RG_EINT1CMPEN_MASK_SFT                         (0x1 << 8)
+#define RG_EINT1CMPMEN_ADDR                            \
+	MT6359_AUDENC_ANA_CON20
+#define RG_EINT1CMPMEN_SFT                             9
+#define RG_EINT1CMPMEN_MASK                            0x1
+#define RG_EINT1CMPMEN_MASK_SFT                        (0x1 << 9)
+#define RG_EINT1EN_ADDR                                \
+	MT6359_AUDENC_ANA_CON20
+#define RG_EINT1EN_SFT                                 10
+#define RG_EINT1EN_MASK                                0x1
+#define RG_EINT1EN_MASK_SFT                            (0x1 << 10)
+#define RG_EINT1CEN_ADDR                               \
+	MT6359_AUDENC_ANA_CON20
+#define RG_EINT1CEN_SFT                                11
+#define RG_EINT1CEN_MASK                               0x1
+#define RG_EINT1CEN_MASK_SFT                           (0x1 << 11)
+#define RG_EINT1INVEN_ADDR                             \
+	MT6359_AUDENC_ANA_CON20
+#define RG_EINT1INVEN_SFT                              12
+#define RG_EINT1INVEN_MASK                             0x1
+#define RG_EINT1INVEN_MASK_SFT                         (0x1 << 12)
+#define RG_EINT1CTURBO_ADDR                            \
+	MT6359_AUDENC_ANA_CON20
+#define RG_EINT1CTURBO_SFT                             13
+#define RG_EINT1CTURBO_MASK                            0x7
+#define RG_EINT1CTURBO_MASK_SFT                        (0x7 << 13)
+#define RG_ACCDETSPARE_ADDR                            \
+	MT6359_AUDENC_ANA_CON21
+
+#define ACCDET_ANA_ID_ADDR                             \
+	MT6359_ACCDET_DSN_DIG_ID
+#define ACCDET_ANA_ID_SFT                              0
+#define ACCDET_ANA_ID_MASK                             0xFF
+#define ACCDET_ANA_ID_MASK_SFT                         (0xFF << 0)
+#define ACCDET_DIG_ID_ADDR                             \
+	MT6359_ACCDET_DSN_DIG_ID
+#define ACCDET_DIG_ID_SFT                              8
+#define ACCDET_DIG_ID_MASK                             0xFF
+#define ACCDET_DIG_ID_MASK_SFT                         (0xFF << 8)
+#define ACCDET_ANA_MINOR_REV_ADDR                      \
+	MT6359_ACCDET_DSN_DIG_REV0
+#define ACCDET_ANA_MINOR_REV_SFT                       0
+#define ACCDET_ANA_MINOR_REV_MASK                      0xF
+#define ACCDET_ANA_MINOR_REV_MASK_SFT                  (0xF << 0)
+#define ACCDET_ANA_MAJOR_REV_ADDR                      \
+	MT6359_ACCDET_DSN_DIG_REV0
+#define ACCDET_ANA_MAJOR_REV_SFT                       4
+#define ACCDET_ANA_MAJOR_REV_MASK                      0xF
+#define ACCDET_ANA_MAJOR_REV_MASK_SFT                  (0xF << 4)
+#define ACCDET_DIG_MINOR_REV_ADDR                      \
+	MT6359_ACCDET_DSN_DIG_REV0
+#define ACCDET_DIG_MINOR_REV_SFT                       8
+#define ACCDET_DIG_MINOR_REV_MASK                      0xF
+#define ACCDET_DIG_MINOR_REV_MASK_SFT                  (0xF << 8)
+#define ACCDET_DIG_MAJOR_REV_ADDR                      \
+	MT6359_ACCDET_DSN_DIG_REV0
+#define ACCDET_DIG_MAJOR_REV_SFT                       12
+#define ACCDET_DIG_MAJOR_REV_MASK                      0xF
+#define ACCDET_DIG_MAJOR_REV_MASK_SFT                  (0xF << 12)
+#define ACCDET_DSN_CBS_ADDR                            \
+	MT6359_ACCDET_DSN_DBI
+#define ACCDET_DSN_CBS_SFT                             0
+#define ACCDET_DSN_CBS_MASK                            0x3
+#define ACCDET_DSN_CBS_MASK_SFT                        (0x3 << 0)
+#define ACCDET_DSN_BIX_ADDR                            \
+	MT6359_ACCDET_DSN_DBI
+#define ACCDET_DSN_BIX_SFT                             2
+#define ACCDET_DSN_BIX_MASK                            0x3
+#define ACCDET_DSN_BIX_MASK_SFT                        (0x3 << 2)
+#define ACCDET_ESP_ADDR                                \
+	MT6359_ACCDET_DSN_DBI
+#define ACCDET_ESP_SFT                                 8
+#define ACCDET_ESP_MASK                                0xFF
+#define ACCDET_ESP_MASK_SFT                            (0xFF << 8)
+#define ACCDET_DSN_FPI_ADDR                            \
+	MT6359_ACCDET_DSN_FPI
+#define ACCDET_DSN_FPI_SFT                             0
+#define ACCDET_DSN_FPI_MASK                            0xFF
+#define ACCDET_DSN_FPI_MASK_SFT                        (0xFF << 0)
+#define ACCDET_AUXADC_SEL_ADDR                         \
+	MT6359_ACCDET_CON0
+#define ACCDET_AUXADC_SEL_SFT                          0
+#define ACCDET_AUXADC_SEL_MASK                         0x1
+#define ACCDET_AUXADC_SEL_MASK_SFT                     (0x1 << 0)
+#define ACCDET_AUXADC_SW_ADDR                          \
+	MT6359_ACCDET_CON0
+#define ACCDET_AUXADC_SW_SFT                           1
+#define ACCDET_AUXADC_SW_MASK                          0x1
+#define ACCDET_AUXADC_SW_MASK_SFT                      (0x1 << 1)
+#define ACCDET_TEST_AUXADC_ADDR                        \
+	MT6359_ACCDET_CON0
+#define ACCDET_TEST_AUXADC_SFT                         2
+#define ACCDET_TEST_AUXADC_MASK                        0x1
+#define ACCDET_TEST_AUXADC_MASK_SFT                    (0x1 << 2)
+#define ACCDET_AUXADC_ANASWCTRL_SEL_ADDR               \
+	MT6359_ACCDET_CON0
+#define ACCDET_AUXADC_ANASWCTRL_SEL_SFT                8
+#define ACCDET_AUXADC_ANASWCTRL_SEL_MASK               0x1
+#define ACCDET_AUXADC_ANASWCTRL_SEL_MASK_SFT           (0x1 << 8)
+#define AUDACCDETAUXADCSWCTRL_SEL_ADDR                 \
+	MT6359_ACCDET_CON0
+#define AUDACCDETAUXADCSWCTRL_SEL_SFT                  9
+#define AUDACCDETAUXADCSWCTRL_SEL_MASK                 0x1
+#define AUDACCDETAUXADCSWCTRL_SEL_MASK_SFT             (0x1 << 9)
+#define AUDACCDETAUXADCSWCTRL_SW_ADDR                  \
+	MT6359_ACCDET_CON0
+#define AUDACCDETAUXADCSWCTRL_SW_SFT                   10
+#define AUDACCDETAUXADCSWCTRL_SW_MASK                  0x1
+#define AUDACCDETAUXADCSWCTRL_SW_MASK_SFT              (0x1 << 10)
+#define ACCDET_TEST_ANA_ADDR                           \
+	MT6359_ACCDET_CON0
+#define ACCDET_TEST_ANA_SFT                            11
+#define ACCDET_TEST_ANA_MASK                           0x1
+#define ACCDET_TEST_ANA_MASK_SFT                       (0x1 << 11)
+#define RG_AUDACCDETRSV_ADDR                           \
+	MT6359_ACCDET_CON0
+#define RG_AUDACCDETRSV_SFT                            13
+#define RG_AUDACCDETRSV_MASK                           0x3
+#define RG_AUDACCDETRSV_MASK_SFT                       (0x3 << 13)
+#define ACCDET_SW_EN_ADDR                              \
+	MT6359_ACCDET_CON1
+#define ACCDET_SW_EN_SFT                               0
+#define ACCDET_SW_EN_MASK                              0x1
+#define ACCDET_SW_EN_MASK_SFT                          (0x1 << 0)
+#define ACCDET_SEQ_INIT_ADDR                           \
+	MT6359_ACCDET_CON1
+#define ACCDET_SEQ_INIT_SFT                            1
+#define ACCDET_SEQ_INIT_MASK                           0x1
+#define ACCDET_SEQ_INIT_MASK_SFT                       (0x1 << 1)
+#define ACCDET_EINT0_SW_EN_ADDR                        \
+	MT6359_ACCDET_CON1
+#define ACCDET_EINT0_SW_EN_SFT                         2
+#define ACCDET_EINT0_SW_EN_MASK                        0x1
+#define ACCDET_EINT0_SW_EN_MASK_SFT                    (0x1 << 2)
+#define ACCDET_EINT0_SEQ_INIT_ADDR                     \
+	MT6359_ACCDET_CON1
+#define ACCDET_EINT0_SEQ_INIT_SFT                      3
+#define ACCDET_EINT0_SEQ_INIT_MASK                     0x1
+#define ACCDET_EINT0_SEQ_INIT_MASK_SFT                 (0x1 << 3)
+#define ACCDET_EINT1_SW_EN_ADDR                        \
+	MT6359_ACCDET_CON1
+#define ACCDET_EINT1_SW_EN_SFT                         4
+#define ACCDET_EINT1_SW_EN_MASK                        0x1
+#define ACCDET_EINT1_SW_EN_MASK_SFT                    (0x1 << 4)
+#define ACCDET_EINT1_SEQ_INIT_ADDR                     \
+	MT6359_ACCDET_CON1
+#define ACCDET_EINT1_SEQ_INIT_SFT                      5
+#define ACCDET_EINT1_SEQ_INIT_MASK                     0x1
+#define ACCDET_EINT1_SEQ_INIT_MASK_SFT                 (0x1 << 5)
+#define ACCDET_EINT0_INVERTER_SW_EN_ADDR               \
+	MT6359_ACCDET_CON1
+#define ACCDET_EINT0_INVERTER_SW_EN_SFT                6
+#define ACCDET_EINT0_INVERTER_SW_EN_MASK               0x1
+#define ACCDET_EINT0_INVERTER_SW_EN_MASK_SFT           (0x1 << 6)
+#define ACCDET_EINT0_INVERTER_SEQ_INIT_ADDR            \
+	MT6359_ACCDET_CON1
+#define ACCDET_EINT0_INVERTER_SEQ_INIT_SFT             7
+#define ACCDET_EINT0_INVERTER_SEQ_INIT_MASK            0x1
+#define ACCDET_EINT0_INVERTER_SEQ_INIT_MASK_SFT        (0x1 << 7)
+#define ACCDET_EINT1_INVERTER_SW_EN_ADDR               \
+	MT6359_ACCDET_CON1
+#define ACCDET_EINT1_INVERTER_SW_EN_SFT                8
+#define ACCDET_EINT1_INVERTER_SW_EN_MASK               0x1
+#define ACCDET_EINT1_INVERTER_SW_EN_MASK_SFT           (0x1 << 8)
+#define ACCDET_EINT1_INVERTER_SEQ_INIT_ADDR            \
+	MT6359_ACCDET_CON1
+#define ACCDET_EINT1_INVERTER_SEQ_INIT_SFT             9
+#define ACCDET_EINT1_INVERTER_SEQ_INIT_MASK            0x1
+#define ACCDET_EINT1_INVERTER_SEQ_INIT_MASK_SFT        (0x1 << 9)
+#define ACCDET_EINT0_M_SW_EN_ADDR                      \
+	MT6359_ACCDET_CON1
+#define ACCDET_EINT0_M_SW_EN_SFT                       10
+#define ACCDET_EINT0_M_SW_EN_MASK                      0x1
+#define ACCDET_EINT0_M_SW_EN_MASK_SFT                  (0x1 << 10)
+#define ACCDET_EINT1_M_SW_EN_ADDR                      \
+	MT6359_ACCDET_CON1
+#define ACCDET_EINT1_M_SW_EN_SFT                       11
+#define ACCDET_EINT1_M_SW_EN_MASK                      0x1
+#define ACCDET_EINT1_M_SW_EN_MASK_SFT                  (0x1 << 11)
+#define ACCDET_EINT_M_DETECT_EN_ADDR                   \
+	MT6359_ACCDET_CON1
+#define ACCDET_EINT_M_DETECT_EN_SFT                    12
+#define ACCDET_EINT_M_DETECT_EN_MASK                   0x1
+#define ACCDET_EINT_M_DETECT_EN_MASK_SFT               (0x1 << 12)
+#define ACCDET_CMP_PWM_EN_ADDR                         \
+	MT6359_ACCDET_CON2
+#define ACCDET_CMP_PWM_EN_SFT                          0
+#define ACCDET_CMP_PWM_EN_MASK                         0x1
+#define ACCDET_CMP_PWM_EN_MASK_SFT                     (0x1 << 0)
+#define ACCDET_VTH_PWM_EN_ADDR                         \
+	MT6359_ACCDET_CON2
+#define ACCDET_VTH_PWM_EN_SFT                          1
+#define ACCDET_VTH_PWM_EN_MASK                         0x1
+#define ACCDET_VTH_PWM_EN_MASK_SFT                     (0x1 << 1)
+#define ACCDET_MBIAS_PWM_EN_ADDR                       \
+	MT6359_ACCDET_CON2
+#define ACCDET_MBIAS_PWM_EN_SFT                        2
+#define ACCDET_MBIAS_PWM_EN_MASK                       0x1
+#define ACCDET_MBIAS_PWM_EN_MASK_SFT                   (0x1 << 2)
+#define ACCDET_EINT_EN_PWM_EN_ADDR                     \
+	MT6359_ACCDET_CON2
+#define ACCDET_EINT_EN_PWM_EN_SFT                      3
+#define ACCDET_EINT_EN_PWM_EN_MASK                     0x1
+#define ACCDET_EINT_EN_PWM_EN_MASK_SFT                 (0x1 << 3)
+#define ACCDET_EINT_CMPEN_PWM_EN_ADDR                  \
+	MT6359_ACCDET_CON2
+#define ACCDET_EINT_CMPEN_PWM_EN_SFT                   4
+#define ACCDET_EINT_CMPEN_PWM_EN_MASK                  0x1
+#define ACCDET_EINT_CMPEN_PWM_EN_MASK_SFT              (0x1 << 4)
+#define ACCDET_EINT_CMPMEN_PWM_EN_ADDR                 \
+	MT6359_ACCDET_CON2
+#define ACCDET_EINT_CMPMEN_PWM_EN_SFT                  5
+#define ACCDET_EINT_CMPMEN_PWM_EN_MASK                 0x1
+#define ACCDET_EINT_CMPMEN_PWM_EN_MASK_SFT             (0x1 << 5)
+#define ACCDET_EINT_CTURBO_PWM_EN_ADDR                 \
+	MT6359_ACCDET_CON2
+#define ACCDET_EINT_CTURBO_PWM_EN_SFT                  6
+#define ACCDET_EINT_CTURBO_PWM_EN_MASK                 0x1
+#define ACCDET_EINT_CTURBO_PWM_EN_MASK_SFT             (0x1 << 6)
+#define ACCDET_CMP_PWM_IDLE_ADDR                       \
+	MT6359_ACCDET_CON2
+#define ACCDET_CMP_PWM_IDLE_SFT                        8
+#define ACCDET_CMP_PWM_IDLE_MASK                       0x1
+#define ACCDET_CMP_PWM_IDLE_MASK_SFT                   (0x1 << 8)
+#define ACCDET_VTH_PWM_IDLE_ADDR                       \
+	MT6359_ACCDET_CON2
+#define ACCDET_VTH_PWM_IDLE_SFT                        9
+#define ACCDET_VTH_PWM_IDLE_MASK                       0x1
+#define ACCDET_VTH_PWM_IDLE_MASK_SFT                   (0x1 << 9)
+#define ACCDET_MBIAS_PWM_IDLE_ADDR                     \
+	MT6359_ACCDET_CON2
+#define ACCDET_MBIAS_PWM_IDLE_SFT                      10
+#define ACCDET_MBIAS_PWM_IDLE_MASK                     0x1
+#define ACCDET_MBIAS_PWM_IDLE_MASK_SFT                 (0x1 << 10)
+#define ACCDET_EINT0_CMPEN_PWM_IDLE_ADDR               \
+	MT6359_ACCDET_CON2
+#define ACCDET_EINT0_CMPEN_PWM_IDLE_SFT                11
+#define ACCDET_EINT0_CMPEN_PWM_IDLE_MASK               0x1
+#define ACCDET_EINT0_CMPEN_PWM_IDLE_MASK_SFT           (0x1 << 11)
+#define ACCDET_EINT1_CMPEN_PWM_IDLE_ADDR               \
+	MT6359_ACCDET_CON2
+#define ACCDET_EINT1_CMPEN_PWM_IDLE_SFT                12
+#define ACCDET_EINT1_CMPEN_PWM_IDLE_MASK               0x1
+#define ACCDET_EINT1_CMPEN_PWM_IDLE_MASK_SFT           (0x1 << 12)
+#define ACCDET_PWM_EN_SW_ADDR                          \
+	MT6359_ACCDET_CON2
+#define ACCDET_PWM_EN_SW_SFT                           13
+#define ACCDET_PWM_EN_SW_MASK                          0x1
+#define ACCDET_PWM_EN_SW_MASK_SFT                      (0x1 << 13)
+#define ACCDET_PWM_EN_SEL_ADDR                         \
+	MT6359_ACCDET_CON2
+#define ACCDET_PWM_EN_SEL_SFT                          14
+#define ACCDET_PWM_EN_SEL_MASK                         0x3
+#define ACCDET_PWM_EN_SEL_MASK_SFT                     (0x3 << 14)
+#define ACCDET_PWM_WIDTH_ADDR                          \
+	MT6359_ACCDET_CON3
+#define ACCDET_PWM_WIDTH_SFT                           0
+#define ACCDET_PWM_WIDTH_MASK                          0xFFFF
+#define ACCDET_PWM_WIDTH_MASK_SFT                      (0xFFFF << 0)
+#define ACCDET_PWM_THRESH_ADDR                         \
+	MT6359_ACCDET_CON4
+#define ACCDET_PWM_THRESH_SFT                          0
+#define ACCDET_PWM_THRESH_MASK                         0xFFFF
+#define ACCDET_PWM_THRESH_MASK_SFT                     (0xFFFF << 0)
+#define ACCDET_RISE_DELAY_ADDR                         \
+	MT6359_ACCDET_CON5
+#define ACCDET_RISE_DELAY_SFT                          0
+#define ACCDET_RISE_DELAY_MASK                         0x7FFF
+#define ACCDET_RISE_DELAY_MASK_SFT                     (0x7FFF << 0)
+#define ACCDET_FALL_DELAY_ADDR                         \
+	MT6359_ACCDET_CON5
+#define ACCDET_FALL_DELAY_SFT                          15
+#define ACCDET_FALL_DELAY_MASK                         0x1
+#define ACCDET_FALL_DELAY_MASK_SFT                     (0x1 << 15)
+#define ACCDET_EINT_CMPMEN_PWM_THRESH_ADDR             \
+	MT6359_ACCDET_CON6
+#define ACCDET_EINT_CMPMEN_PWM_THRESH_SFT              0
+#define ACCDET_EINT_CMPMEN_PWM_THRESH_MASK             0x7
+#define ACCDET_EINT_CMPMEN_PWM_THRESH_MASK_SFT         (0x7 << 0)
+#define ACCDET_EINT_CMPMEN_PWM_WIDTH_ADDR              \
+	MT6359_ACCDET_CON6
+#define ACCDET_EINT_CMPMEN_PWM_WIDTH_SFT               4
+#define ACCDET_EINT_CMPMEN_PWM_WIDTH_MASK              0x7
+#define ACCDET_EINT_CMPMEN_PWM_WIDTH_MASK_SFT          (0x7 << 4)
+#define ACCDET_EINT_EN_PWM_THRESH_ADDR                 \
+	MT6359_ACCDET_CON7
+#define ACCDET_EINT_EN_PWM_THRESH_SFT                  0
+#define ACCDET_EINT_EN_PWM_THRESH_MASK                 0x7
+#define ACCDET_EINT_EN_PWM_THRESH_MASK_SFT             (0x7 << 0)
+#define ACCDET_EINT_EN_PWM_WIDTH_ADDR                  \
+	MT6359_ACCDET_CON7
+#define ACCDET_EINT_EN_PWM_WIDTH_SFT                   4
+#define ACCDET_EINT_EN_PWM_WIDTH_MASK                  0x3
+#define ACCDET_EINT_EN_PWM_WIDTH_MASK_SFT              (0x3 << 4)
+#define ACCDET_EINT_CMPEN_PWM_THRESH_ADDR              \
+	MT6359_ACCDET_CON7
+#define ACCDET_EINT_CMPEN_PWM_THRESH_SFT               8
+#define ACCDET_EINT_CMPEN_PWM_THRESH_MASK              0x7
+#define ACCDET_EINT_CMPEN_PWM_THRESH_MASK_SFT          (0x7 << 8)
+#define ACCDET_EINT_CMPEN_PWM_WIDTH_ADDR               \
+	MT6359_ACCDET_CON7
+#define ACCDET_EINT_CMPEN_PWM_WIDTH_SFT                12
+#define ACCDET_EINT_CMPEN_PWM_WIDTH_MASK               0x3
+#define ACCDET_EINT_CMPEN_PWM_WIDTH_MASK_SFT           (0x3 << 12)
+#define ACCDET_DEBOUNCE0_ADDR                          \
+	MT6359_ACCDET_CON8
+#define ACCDET_DEBOUNCE0_SFT                           0
+#define ACCDET_DEBOUNCE0_MASK                          0xFFFF
+#define ACCDET_DEBOUNCE0_MASK_SFT                      (0xFFFF << 0)
+#define ACCDET_DEBOUNCE1_ADDR                          \
+	MT6359_ACCDET_CON9
+#define ACCDET_DEBOUNCE1_SFT                           0
+#define ACCDET_DEBOUNCE1_MASK                          0xFFFF
+#define ACCDET_DEBOUNCE1_MASK_SFT                      (0xFFFF << 0)
+#define ACCDET_DEBOUNCE2_ADDR                          \
+	MT6359_ACCDET_CON10
+#define ACCDET_DEBOUNCE2_SFT                           0
+#define ACCDET_DEBOUNCE2_MASK                          0xFFFF
+#define ACCDET_DEBOUNCE2_MASK_SFT                      (0xFFFF << 0)
+#define ACCDET_DEBOUNCE3_ADDR                          \
+	MT6359_ACCDET_CON11
+#define ACCDET_DEBOUNCE3_SFT                           0
+#define ACCDET_DEBOUNCE3_MASK                          0xFFFF
+#define ACCDET_DEBOUNCE3_MASK_SFT                      (0xFFFF << 0)
+#define ACCDET_CONNECT_AUXADC_TIME_DIG_ADDR            \
+	MT6359_ACCDET_CON12
+#define ACCDET_CONNECT_AUXADC_TIME_DIG_SFT             0
+#define ACCDET_CONNECT_AUXADC_TIME_DIG_MASK            0xFFFF
+#define ACCDET_CONNECT_AUXADC_TIME_DIG_MASK_SFT        (0xFFFF << 0)
+#define ACCDET_CONNECT_AUXADC_TIME_ANA_ADDR            \
+	MT6359_ACCDET_CON13
+#define ACCDET_CONNECT_AUXADC_TIME_ANA_SFT             0
+#define ACCDET_CONNECT_AUXADC_TIME_ANA_MASK            0xFFFF
+#define ACCDET_CONNECT_AUXADC_TIME_ANA_MASK_SFT        (0xFFFF << 0)
+#define ACCDET_EINT_DEBOUNCE0_ADDR                     \
+	MT6359_ACCDET_CON14
+#define ACCDET_EINT_DEBOUNCE0_SFT                      0
+#define ACCDET_EINT_DEBOUNCE0_MASK                     0xF
+#define ACCDET_EINT_DEBOUNCE0_MASK_SFT                 (0xF << 0)
+#define ACCDET_EINT_DEBOUNCE1_ADDR                     \
+	MT6359_ACCDET_CON14
+#define ACCDET_EINT_DEBOUNCE1_SFT                      4
+#define ACCDET_EINT_DEBOUNCE1_MASK                     0xF
+#define ACCDET_EINT_DEBOUNCE1_MASK_SFT                 (0xF << 4)
+#define ACCDET_EINT_DEBOUNCE2_ADDR                     \
+	MT6359_ACCDET_CON14
+#define ACCDET_EINT_DEBOUNCE2_SFT                      8
+#define ACCDET_EINT_DEBOUNCE2_MASK                     0xF
+#define ACCDET_EINT_DEBOUNCE2_MASK_SFT                 (0xF << 8)
+#define ACCDET_EINT_DEBOUNCE3_ADDR                     \
+	MT6359_ACCDET_CON14
+#define ACCDET_EINT_DEBOUNCE3_SFT                      12
+#define ACCDET_EINT_DEBOUNCE3_MASK                     0xF
+#define ACCDET_EINT_DEBOUNCE3_MASK_SFT                 (0xF << 12)
+#define ACCDET_EINT_INVERTER_DEBOUNCE_ADDR             \
+	MT6359_ACCDET_CON15
+#define ACCDET_EINT_INVERTER_DEBOUNCE_SFT              0
+#define ACCDET_EINT_INVERTER_DEBOUNCE_MASK             0xF
+#define ACCDET_EINT_INVERTER_DEBOUNCE_MASK_SFT         (0xF << 0)
+#define ACCDET_IVAL_CUR_IN_ADDR                        \
+	MT6359_ACCDET_CON16
+#define ACCDET_IVAL_CUR_IN_SFT                         0
+#define ACCDET_IVAL_CUR_IN_MASK                        0x3
+#define ACCDET_IVAL_CUR_IN_MASK_SFT                    (0x3 << 0)
+#define ACCDET_IVAL_SAM_IN_ADDR                        \
+	MT6359_ACCDET_CON16
+#define ACCDET_IVAL_SAM_IN_SFT                         2
+#define ACCDET_IVAL_SAM_IN_MASK                        0x3
+#define ACCDET_IVAL_SAM_IN_MASK_SFT                    (0x3 << 2)
+#define ACCDET_IVAL_MEM_IN_ADDR                        \
+	MT6359_ACCDET_CON16
+#define ACCDET_IVAL_MEM_IN_SFT                         4
+#define ACCDET_IVAL_MEM_IN_MASK                        0x3
+#define ACCDET_IVAL_MEM_IN_MASK_SFT                    (0x3 << 4)
+#define ACCDET_EINT_IVAL_CUR_IN_ADDR                   \
+	MT6359_ACCDET_CON16
+#define ACCDET_EINT_IVAL_CUR_IN_SFT                    6
+#define ACCDET_EINT_IVAL_CUR_IN_MASK                   0x3
+#define ACCDET_EINT_IVAL_CUR_IN_MASK_SFT               (0x3 << 6)
+#define ACCDET_EINT_IVAL_SAM_IN_ADDR                   \
+	MT6359_ACCDET_CON16
+#define ACCDET_EINT_IVAL_SAM_IN_SFT                    8
+#define ACCDET_EINT_IVAL_SAM_IN_MASK                   0x3
+#define ACCDET_EINT_IVAL_SAM_IN_MASK_SFT               (0x3 << 8)
+#define ACCDET_EINT_IVAL_MEM_IN_ADDR                   \
+	MT6359_ACCDET_CON16
+#define ACCDET_EINT_IVAL_MEM_IN_SFT                    10
+#define ACCDET_EINT_IVAL_MEM_IN_MASK                   0x3
+#define ACCDET_EINT_IVAL_MEM_IN_MASK_SFT               (0x3 << 10)
+#define ACCDET_IVAL_SEL_ADDR                           \
+	MT6359_ACCDET_CON16
+#define ACCDET_IVAL_SEL_SFT                            12
+#define ACCDET_IVAL_SEL_MASK                           0x1
+#define ACCDET_IVAL_SEL_MASK_SFT                       (0x1 << 12)
+#define ACCDET_EINT_IVAL_SEL_ADDR                      \
+	MT6359_ACCDET_CON16
+#define ACCDET_EINT_IVAL_SEL_SFT                       13
+#define ACCDET_EINT_IVAL_SEL_MASK                      0x1
+#define ACCDET_EINT_IVAL_SEL_MASK_SFT                  (0x1 << 13)
+#define ACCDET_EINT_INVERTER_IVAL_CUR_IN_ADDR          \
+	MT6359_ACCDET_CON17
+#define ACCDET_EINT_INVERTER_IVAL_CUR_IN_SFT           0
+#define ACCDET_EINT_INVERTER_IVAL_CUR_IN_MASK          0x1
+#define ACCDET_EINT_INVERTER_IVAL_CUR_IN_MASK_SFT      (0x1 << 0)
+#define ACCDET_EINT_INVERTER_IVAL_SAM_IN_ADDR          \
+	MT6359_ACCDET_CON17
+#define ACCDET_EINT_INVERTER_IVAL_SAM_IN_SFT           1
+#define ACCDET_EINT_INVERTER_IVAL_SAM_IN_MASK          0x1
+#define ACCDET_EINT_INVERTER_IVAL_SAM_IN_MASK_SFT      (0x1 << 1)
+#define ACCDET_EINT_INVERTER_IVAL_MEM_IN_ADDR          \
+	MT6359_ACCDET_CON17
+#define ACCDET_EINT_INVERTER_IVAL_MEM_IN_SFT           2
+#define ACCDET_EINT_INVERTER_IVAL_MEM_IN_MASK          0x1
+#define ACCDET_EINT_INVERTER_IVAL_MEM_IN_MASK_SFT      (0x1 << 2)
+#define ACCDET_EINT_INVERTER_IVAL_SEL_ADDR             \
+	MT6359_ACCDET_CON17
+#define ACCDET_EINT_INVERTER_IVAL_SEL_SFT              3
+#define ACCDET_EINT_INVERTER_IVAL_SEL_MASK             0x1
+#define ACCDET_EINT_INVERTER_IVAL_SEL_MASK_SFT         (0x1 << 3)
+#define ACCDET_IRQ_ADDR                                \
+	MT6359_ACCDET_CON18
+#define ACCDET_IRQ_SFT                                 0
+#define ACCDET_IRQ_MASK                                0x1
+#define ACCDET_IRQ_MASK_SFT                            (0x1 << 0)
+#define ACCDET_EINT0_IRQ_ADDR                          \
+	MT6359_ACCDET_CON18
+#define ACCDET_EINT0_IRQ_SFT                           2
+#define ACCDET_EINT0_IRQ_MASK                          0x1
+#define ACCDET_EINT0_IRQ_MASK_SFT                      (0x1 << 2)
+#define ACCDET_EINT1_IRQ_ADDR                          \
+	MT6359_ACCDET_CON18
+#define ACCDET_EINT1_IRQ_SFT                           3
+#define ACCDET_EINT1_IRQ_MASK                          0x1
+#define ACCDET_EINT1_IRQ_MASK_SFT                      (0x1 << 3)
+#define ACCDET_EINT_IN_INVERSE_ADDR                    \
+	MT6359_ACCDET_CON18
+#define ACCDET_EINT_IN_INVERSE_SFT                     4
+#define ACCDET_EINT_IN_INVERSE_MASK                    0x1
+#define ACCDET_EINT_IN_INVERSE_MASK_SFT                (0x1 << 4)
+#define ACCDET_IRQ_CLR_ADDR                            \
+	MT6359_ACCDET_CON18
+#define ACCDET_IRQ_CLR_SFT                             8
+#define ACCDET_IRQ_CLR_MASK                            0x1
+#define ACCDET_IRQ_CLR_MASK_SFT                        (0x1 << 8)
+#define ACCDET_EINT0_IRQ_CLR_ADDR                      \
+	MT6359_ACCDET_CON18
+#define ACCDET_EINT0_IRQ_CLR_SFT                       10
+#define ACCDET_EINT0_IRQ_CLR_MASK                      0x1
+#define ACCDET_EINT0_IRQ_CLR_MASK_SFT                  (0x1 << 10)
+#define ACCDET_EINT1_IRQ_CLR_ADDR                      \
+	MT6359_ACCDET_CON18
+#define ACCDET_EINT1_IRQ_CLR_SFT                       11
+#define ACCDET_EINT1_IRQ_CLR_MASK                      0x1
+#define ACCDET_EINT1_IRQ_CLR_MASK_SFT                  (0x1 << 11)
+#define ACCDET_EINT_M_PLUG_IN_NUM_ADDR                 \
+	MT6359_ACCDET_CON18
+#define ACCDET_EINT_M_PLUG_IN_NUM_SFT                  12
+#define ACCDET_EINT_M_PLUG_IN_NUM_MASK                 0x7
+#define ACCDET_EINT_M_PLUG_IN_NUM_MASK_SFT             (0x7 << 12)
+#define ACCDET_DA_STABLE_ADDR                          \
+	MT6359_ACCDET_CON19
+#define ACCDET_DA_STABLE_SFT                           0
+#define ACCDET_DA_STABLE_MASK                          0x1
+#define ACCDET_DA_STABLE_MASK_SFT                      (0x1 << 0)
+#define ACCDET_EINT0_EN_STABLE_ADDR                    \
+	MT6359_ACCDET_CON19
+#define ACCDET_EINT0_EN_STABLE_SFT                     1
+#define ACCDET_EINT0_EN_STABLE_MASK                    0x1
+#define ACCDET_EINT0_EN_STABLE_MASK_SFT                (0x1 << 1)
+#define ACCDET_EINT0_CMPEN_STABLE_ADDR                 \
+	MT6359_ACCDET_CON19
+#define ACCDET_EINT0_CMPEN_STABLE_SFT                  2
+#define ACCDET_EINT0_CMPEN_STABLE_MASK                 0x1
+#define ACCDET_EINT0_CMPEN_STABLE_MASK_SFT             (0x1 << 2)
+#define ACCDET_EINT0_CMPMEN_STABLE_ADDR                \
+	MT6359_ACCDET_CON19
+#define ACCDET_EINT0_CMPMEN_STABLE_SFT                 3
+#define ACCDET_EINT0_CMPMEN_STABLE_MASK                0x1
+#define ACCDET_EINT0_CMPMEN_STABLE_MASK_SFT            (0x1 << 3)
+#define ACCDET_EINT0_CTURBO_STABLE_ADDR                \
+	MT6359_ACCDET_CON19
+#define ACCDET_EINT0_CTURBO_STABLE_SFT                 4
+#define ACCDET_EINT0_CTURBO_STABLE_MASK                0x1
+#define ACCDET_EINT0_CTURBO_STABLE_MASK_SFT            (0x1 << 4)
+#define ACCDET_EINT0_CEN_STABLE_ADDR                   \
+	MT6359_ACCDET_CON19
+#define ACCDET_EINT0_CEN_STABLE_SFT                    5
+#define ACCDET_EINT0_CEN_STABLE_MASK                   0x1
+#define ACCDET_EINT0_CEN_STABLE_MASK_SFT               (0x1 << 5)
+#define ACCDET_EINT1_EN_STABLE_ADDR                    \
+	MT6359_ACCDET_CON19
+#define ACCDET_EINT1_EN_STABLE_SFT                     6
+#define ACCDET_EINT1_EN_STABLE_MASK                    0x1
+#define ACCDET_EINT1_EN_STABLE_MASK_SFT                (0x1 << 6)
+#define ACCDET_EINT1_CMPEN_STABLE_ADDR                 \
+	MT6359_ACCDET_CON19
+#define ACCDET_EINT1_CMPEN_STABLE_SFT                  7
+#define ACCDET_EINT1_CMPEN_STABLE_MASK                 0x1
+#define ACCDET_EINT1_CMPEN_STABLE_MASK_SFT             (0x1 << 7)
+#define ACCDET_EINT1_CMPMEN_STABLE_ADDR                \
+	MT6359_ACCDET_CON19
+#define ACCDET_EINT1_CMPMEN_STABLE_SFT                 8
+#define ACCDET_EINT1_CMPMEN_STABLE_MASK                0x1
+#define ACCDET_EINT1_CMPMEN_STABLE_MASK_SFT            (0x1 << 8)
+#define ACCDET_EINT1_CTURBO_STABLE_ADDR                \
+	MT6359_ACCDET_CON19
+#define ACCDET_EINT1_CTURBO_STABLE_SFT                 9
+#define ACCDET_EINT1_CTURBO_STABLE_MASK                0x1
+#define ACCDET_EINT1_CTURBO_STABLE_MASK_SFT            (0x1 << 9)
+#define ACCDET_EINT1_CEN_STABLE_ADDR                   \
+	MT6359_ACCDET_CON19
+#define ACCDET_EINT1_CEN_STABLE_SFT                    10
+#define ACCDET_EINT1_CEN_STABLE_MASK                   0x1
+#define ACCDET_EINT1_CEN_STABLE_MASK_SFT               (0x1 << 10)
+#define ACCDET_HWMODE_EN_ADDR                          \
+	MT6359_ACCDET_CON20
+#define ACCDET_HWMODE_EN_SFT                           0
+#define ACCDET_HWMODE_EN_MASK                          0x1
+#define ACCDET_HWMODE_EN_MASK_SFT                      (0x1 << 0)
+#define ACCDET_HWMODE_SEL_ADDR                         \
+	MT6359_ACCDET_CON20
+#define ACCDET_HWMODE_SEL_SFT                          1
+#define ACCDET_HWMODE_SEL_MASK                         0x3
+#define ACCDET_HWMODE_SEL_MASK_SFT                     (0x3 << 1)
+#define ACCDET_PLUG_OUT_DETECT_ADDR                    \
+	MT6359_ACCDET_CON20
+#define ACCDET_PLUG_OUT_DETECT_SFT                     3
+#define ACCDET_PLUG_OUT_DETECT_MASK                    0x1
+#define ACCDET_PLUG_OUT_DETECT_MASK_SFT                (0x1 << 3)
+#define ACCDET_EINT0_REVERSE_ADDR                      \
+	MT6359_ACCDET_CON20
+#define ACCDET_EINT0_REVERSE_SFT                       4
+#define ACCDET_EINT0_REVERSE_MASK                      0x1
+#define ACCDET_EINT0_REVERSE_MASK_SFT                  (0x1 << 4)
+#define ACCDET_EINT1_REVERSE_ADDR                      \
+	MT6359_ACCDET_CON20
+#define ACCDET_EINT1_REVERSE_SFT                       5
+#define ACCDET_EINT1_REVERSE_MASK                      0x1
+#define ACCDET_EINT1_REVERSE_MASK_SFT                  (0x1 << 5)
+#define ACCDET_EINT_HWMODE_EN_ADDR                     \
+	MT6359_ACCDET_CON20
+#define ACCDET_EINT_HWMODE_EN_SFT                      8
+#define ACCDET_EINT_HWMODE_EN_MASK                     0x1
+#define ACCDET_EINT_HWMODE_EN_MASK_SFT                 (0x1 << 8)
+#define ACCDET_EINT_PLUG_OUT_BYPASS_DEB_ADDR           \
+	MT6359_ACCDET_CON20
+#define ACCDET_EINT_PLUG_OUT_BYPASS_DEB_SFT            9
+#define ACCDET_EINT_PLUG_OUT_BYPASS_DEB_MASK           0x1
+#define ACCDET_EINT_PLUG_OUT_BYPASS_DEB_MASK_SFT       (0x1 << 9)
+#define ACCDET_EINT_M_PLUG_IN_EN_ADDR                  \
+	MT6359_ACCDET_CON20
+#define ACCDET_EINT_M_PLUG_IN_EN_SFT                   10
+#define ACCDET_EINT_M_PLUG_IN_EN_MASK                  0x1
+#define ACCDET_EINT_M_PLUG_IN_EN_MASK_SFT              (0x1 << 10)
+#define ACCDET_EINT_M_HWMODE_EN_ADDR                   \
+	MT6359_ACCDET_CON20
+#define ACCDET_EINT_M_HWMODE_EN_SFT                    11
+#define ACCDET_EINT_M_HWMODE_EN_MASK                   0x1
+#define ACCDET_EINT_M_HWMODE_EN_MASK_SFT               (0x1 << 11)
+#define ACCDET_TEST_CMPEN_ADDR                         \
+	MT6359_ACCDET_CON21
+#define ACCDET_TEST_CMPEN_SFT                          0
+#define ACCDET_TEST_CMPEN_MASK                         0x1
+#define ACCDET_TEST_CMPEN_MASK_SFT                     (0x1 << 0)
+#define ACCDET_TEST_VTHEN_ADDR                         \
+	MT6359_ACCDET_CON21
+#define ACCDET_TEST_VTHEN_SFT                          1
+#define ACCDET_TEST_VTHEN_MASK                         0x1
+#define ACCDET_TEST_VTHEN_MASK_SFT                     (0x1 << 1)
+#define ACCDET_TEST_MBIASEN_ADDR                       \
+	MT6359_ACCDET_CON21
+#define ACCDET_TEST_MBIASEN_SFT                        2
+#define ACCDET_TEST_MBIASEN_MASK                       0x1
+#define ACCDET_TEST_MBIASEN_MASK_SFT                   (0x1 << 2)
+#define ACCDET_EINT_TEST_EN_ADDR                       \
+	MT6359_ACCDET_CON21
+#define ACCDET_EINT_TEST_EN_SFT                        3
+#define ACCDET_EINT_TEST_EN_MASK                       0x1
+#define ACCDET_EINT_TEST_EN_MASK_SFT                   (0x1 << 3)
+#define ACCDET_EINT_TEST_INVEN_ADDR                    \
+	MT6359_ACCDET_CON21
+#define ACCDET_EINT_TEST_INVEN_SFT                     4
+#define ACCDET_EINT_TEST_INVEN_MASK                    0x1
+#define ACCDET_EINT_TEST_INVEN_MASK_SFT                (0x1 << 4)
+#define ACCDET_EINT_TEST_CMPEN_ADDR                    \
+	MT6359_ACCDET_CON21
+#define ACCDET_EINT_TEST_CMPEN_SFT                     5
+#define ACCDET_EINT_TEST_CMPEN_MASK                    0x1
+#define ACCDET_EINT_TEST_CMPEN_MASK_SFT                (0x1 << 5)
+#define ACCDET_EINT_TEST_CMPMEN_ADDR                   \
+	MT6359_ACCDET_CON21
+#define ACCDET_EINT_TEST_CMPMEN_SFT                    6
+#define ACCDET_EINT_TEST_CMPMEN_MASK                   0x1
+#define ACCDET_EINT_TEST_CMPMEN_MASK_SFT               (0x1 << 6)
+#define ACCDET_EINT_TEST_CTURBO_ADDR                   \
+	MT6359_ACCDET_CON21
+#define ACCDET_EINT_TEST_CTURBO_SFT                    7
+#define ACCDET_EINT_TEST_CTURBO_MASK                   0x1
+#define ACCDET_EINT_TEST_CTURBO_MASK_SFT               (0x1 << 7)
+#define ACCDET_EINT_TEST_CEN_ADDR                      \
+	MT6359_ACCDET_CON21
+#define ACCDET_EINT_TEST_CEN_SFT                       8
+#define ACCDET_EINT_TEST_CEN_MASK                      0x1
+#define ACCDET_EINT_TEST_CEN_MASK_SFT                  (0x1 << 8)
+#define ACCDET_TEST_B_ADDR                             \
+	MT6359_ACCDET_CON21
+#define ACCDET_TEST_B_SFT                              9
+#define ACCDET_TEST_B_MASK                             0x1
+#define ACCDET_TEST_B_MASK_SFT                         (0x1 << 9)
+#define ACCDET_TEST_A_ADDR                             \
+	MT6359_ACCDET_CON21
+#define ACCDET_TEST_A_SFT                              10
+#define ACCDET_TEST_A_MASK                             0x1
+#define ACCDET_TEST_A_MASK_SFT                         (0x1 << 10)
+#define ACCDET_EINT_TEST_CMPOUT_ADDR                   \
+	MT6359_ACCDET_CON21
+#define ACCDET_EINT_TEST_CMPOUT_SFT                    11
+#define ACCDET_EINT_TEST_CMPOUT_MASK                   0x1
+#define ACCDET_EINT_TEST_CMPOUT_MASK_SFT               (0x1 << 11)
+#define ACCDET_EINT_TEST_CMPMOUT_ADDR                  \
+	MT6359_ACCDET_CON21
+#define ACCDET_EINT_TEST_CMPMOUT_SFT                   12
+#define ACCDET_EINT_TEST_CMPMOUT_MASK                  0x1
+#define ACCDET_EINT_TEST_CMPMOUT_MASK_SFT              (0x1 << 12)
+#define ACCDET_EINT_TEST_INVOUT_ADDR                   \
+	MT6359_ACCDET_CON21
+#define ACCDET_EINT_TEST_INVOUT_SFT                    13
+#define ACCDET_EINT_TEST_INVOUT_MASK                   0x1
+#define ACCDET_EINT_TEST_INVOUT_MASK_SFT               (0x1 << 13)
+#define ACCDET_CMPEN_SEL_ADDR                          \
+	MT6359_ACCDET_CON22
+#define ACCDET_CMPEN_SEL_SFT                           0
+#define ACCDET_CMPEN_SEL_MASK                          0x1
+#define ACCDET_CMPEN_SEL_MASK_SFT                      (0x1 << 0)
+#define ACCDET_VTHEN_SEL_ADDR                          \
+	MT6359_ACCDET_CON22
+#define ACCDET_VTHEN_SEL_SFT                           1
+#define ACCDET_VTHEN_SEL_MASK                          0x1
+#define ACCDET_VTHEN_SEL_MASK_SFT                      (0x1 << 1)
+#define ACCDET_MBIASEN_SEL_ADDR                        \
+	MT6359_ACCDET_CON22
+#define ACCDET_MBIASEN_SEL_SFT                         2
+#define ACCDET_MBIASEN_SEL_MASK                        0x1
+#define ACCDET_MBIASEN_SEL_MASK_SFT                    (0x1 << 2)
+#define ACCDET_EINT_EN_SEL_ADDR                        \
+	MT6359_ACCDET_CON22
+#define ACCDET_EINT_EN_SEL_SFT                         3
+#define ACCDET_EINT_EN_SEL_MASK                        0x1
+#define ACCDET_EINT_EN_SEL_MASK_SFT                    (0x1 << 3)
+#define ACCDET_EINT_INVEN_SEL_ADDR                     \
+	MT6359_ACCDET_CON22
+#define ACCDET_EINT_INVEN_SEL_SFT                      4
+#define ACCDET_EINT_INVEN_SEL_MASK                     0x1
+#define ACCDET_EINT_INVEN_SEL_MASK_SFT                 (0x1 << 4)
+#define ACCDET_EINT_CMPEN_SEL_ADDR                     \
+	MT6359_ACCDET_CON22
+#define ACCDET_EINT_CMPEN_SEL_SFT                      5
+#define ACCDET_EINT_CMPEN_SEL_MASK                     0x1
+#define ACCDET_EINT_CMPEN_SEL_MASK_SFT                 (0x1 << 5)
+#define ACCDET_EINT_CMPMEN_SEL_ADDR                    \
+	MT6359_ACCDET_CON22
+#define ACCDET_EINT_CMPMEN_SEL_SFT                     6
+#define ACCDET_EINT_CMPMEN_SEL_MASK                    0x1
+#define ACCDET_EINT_CMPMEN_SEL_MASK_SFT                (0x1 << 6)
+#define ACCDET_EINT_CTURBO_SEL_ADDR                    \
+	MT6359_ACCDET_CON22
+#define ACCDET_EINT_CTURBO_SEL_SFT                     7
+#define ACCDET_EINT_CTURBO_SEL_MASK                    0x1
+#define ACCDET_EINT_CTURBO_SEL_MASK_SFT                (0x1 << 7)
+#define ACCDET_B_SEL_ADDR                              \
+	MT6359_ACCDET_CON22
+#define ACCDET_B_SEL_SFT                               9
+#define ACCDET_B_SEL_MASK                              0x1
+#define ACCDET_B_SEL_MASK_SFT                          (0x1 << 9)
+#define ACCDET_A_SEL_ADDR                              \
+	MT6359_ACCDET_CON22
+#define ACCDET_A_SEL_SFT                               10
+#define ACCDET_A_SEL_MASK                              0x1
+#define ACCDET_A_SEL_MASK_SFT                          (0x1 << 10)
+#define ACCDET_EINT_CMPOUT_SEL_ADDR                    \
+	MT6359_ACCDET_CON22
+#define ACCDET_EINT_CMPOUT_SEL_SFT                     11
+#define ACCDET_EINT_CMPOUT_SEL_MASK                    0x1
+#define ACCDET_EINT_CMPOUT_SEL_MASK_SFT                (0x1 << 11)
+#define ACCDET_EINT_CMPMOUT_SEL_ADDR                   \
+	MT6359_ACCDET_CON22
+#define ACCDET_EINT_CMPMOUT_SEL_SFT                    12
+#define ACCDET_EINT_CMPMOUT_SEL_MASK                   0x1
+#define ACCDET_EINT_CMPMOUT_SEL_MASK_SFT               (0x1 << 12)
+#define ACCDET_EINT_INVOUT_SEL_ADDR                    \
+	MT6359_ACCDET_CON22
+#define ACCDET_EINT_INVOUT_SEL_SFT                     13
+#define ACCDET_EINT_INVOUT_SEL_MASK                    0x1
+#define ACCDET_EINT_INVOUT_SEL_MASK_SFT                (0x1 << 13)
+#define ACCDET_CMPEN_SW_ADDR                           \
+	MT6359_ACCDET_CON23
+#define ACCDET_CMPEN_SW_SFT                            0
+#define ACCDET_CMPEN_SW_MASK                           0x1
+#define ACCDET_CMPEN_SW_MASK_SFT                       (0x1 << 0)
+#define ACCDET_VTHEN_SW_ADDR                           \
+	MT6359_ACCDET_CON23
+#define ACCDET_VTHEN_SW_SFT                            1
+#define ACCDET_VTHEN_SW_MASK                           0x1
+#define ACCDET_VTHEN_SW_MASK_SFT                       (0x1 << 1)
+#define ACCDET_MBIASEN_SW_ADDR                         \
+	MT6359_ACCDET_CON23
+#define ACCDET_MBIASEN_SW_SFT                          2
+#define ACCDET_MBIASEN_SW_MASK                         0x1
+#define ACCDET_MBIASEN_SW_MASK_SFT                     (0x1 << 2)
+#define ACCDET_EINT0_EN_SW_ADDR                        \
+	MT6359_ACCDET_CON23
+#define ACCDET_EINT0_EN_SW_SFT                         3
+#define ACCDET_EINT0_EN_SW_MASK                        0x1
+#define ACCDET_EINT0_EN_SW_MASK_SFT                    (0x1 << 3)
+#define ACCDET_EINT0_INVEN_SW_ADDR                     \
+	MT6359_ACCDET_CON23
+#define ACCDET_EINT0_INVEN_SW_SFT                      4
+#define ACCDET_EINT0_INVEN_SW_MASK                     0x1
+#define ACCDET_EINT0_INVEN_SW_MASK_SFT                 (0x1 << 4)
+#define ACCDET_EINT0_CMPEN_SW_ADDR                     \
+	MT6359_ACCDET_CON23
+#define ACCDET_EINT0_CMPEN_SW_SFT                      5
+#define ACCDET_EINT0_CMPEN_SW_MASK                     0x1
+#define ACCDET_EINT0_CMPEN_SW_MASK_SFT                 (0x1 << 5)
+#define ACCDET_EINT0_CMPMEN_SW_ADDR                    \
+	MT6359_ACCDET_CON23
+#define ACCDET_EINT0_CMPMEN_SW_SFT                     6
+#define ACCDET_EINT0_CMPMEN_SW_MASK                    0x1
+#define ACCDET_EINT0_CMPMEN_SW_MASK_SFT                (0x1 << 6)
+#define ACCDET_EINT0_CTURBO_SW_ADDR                    \
+	MT6359_ACCDET_CON23
+#define ACCDET_EINT0_CTURBO_SW_SFT                     7
+#define ACCDET_EINT0_CTURBO_SW_MASK                    0x1
+#define ACCDET_EINT0_CTURBO_SW_MASK_SFT                (0x1 << 7)
+#define ACCDET_EINT1_EN_SW_ADDR                        \
+	MT6359_ACCDET_CON23
+#define ACCDET_EINT1_EN_SW_SFT                         8
+#define ACCDET_EINT1_EN_SW_MASK                        0x1
+#define ACCDET_EINT1_EN_SW_MASK_SFT                    (0x1 << 8)
+#define ACCDET_EINT1_INVEN_SW_ADDR                     \
+	MT6359_ACCDET_CON23
+#define ACCDET_EINT1_INVEN_SW_SFT                      9
+#define ACCDET_EINT1_INVEN_SW_MASK                     0x1
+#define ACCDET_EINT1_INVEN_SW_MASK_SFT                 (0x1 << 9)
+#define ACCDET_EINT1_CMPEN_SW_ADDR                     \
+	MT6359_ACCDET_CON23
+#define ACCDET_EINT1_CMPEN_SW_SFT                      10
+#define ACCDET_EINT1_CMPEN_SW_MASK                     0x1
+#define ACCDET_EINT1_CMPEN_SW_MASK_SFT                 (0x1 << 10)
+#define ACCDET_EINT1_CMPMEN_SW_ADDR                    \
+	MT6359_ACCDET_CON23
+#define ACCDET_EINT1_CMPMEN_SW_SFT                     11
+#define ACCDET_EINT1_CMPMEN_SW_MASK                    0x1
+#define ACCDET_EINT1_CMPMEN_SW_MASK_SFT                (0x1 << 11)
+#define ACCDET_EINT1_CTURBO_SW_ADDR                    \
+	MT6359_ACCDET_CON23
+#define ACCDET_EINT1_CTURBO_SW_SFT                     12
+#define ACCDET_EINT1_CTURBO_SW_MASK                    0x1
+#define ACCDET_EINT1_CTURBO_SW_MASK_SFT                (0x1 << 12)
+#define ACCDET_B_SW_ADDR                               \
+	MT6359_ACCDET_CON24
+#define ACCDET_B_SW_SFT                                0
+#define ACCDET_B_SW_MASK                               0x1
+#define ACCDET_B_SW_MASK_SFT                           (0x1 << 0)
+#define ACCDET_A_SW_ADDR                               \
+	MT6359_ACCDET_CON24
+#define ACCDET_A_SW_SFT                                1
+#define ACCDET_A_SW_MASK                               0x1
+#define ACCDET_A_SW_MASK_SFT                           (0x1 << 1)
+#define ACCDET_EINT0_CMPOUT_SW_ADDR                    \
+	MT6359_ACCDET_CON24
+#define ACCDET_EINT0_CMPOUT_SW_SFT                     2
+#define ACCDET_EINT0_CMPOUT_SW_MASK                    0x1
+#define ACCDET_EINT0_CMPOUT_SW_MASK_SFT                (0x1 << 2)
+#define ACCDET_EINT0_CMPMOUT_SW_ADDR                   \
+	MT6359_ACCDET_CON24
+#define ACCDET_EINT0_CMPMOUT_SW_SFT                    3
+#define ACCDET_EINT0_CMPMOUT_SW_MASK                   0x1
+#define ACCDET_EINT0_CMPMOUT_SW_MASK_SFT               (0x1 << 3)
+#define ACCDET_EINT0_INVOUT_SW_ADDR                    \
+	MT6359_ACCDET_CON24
+#define ACCDET_EINT0_INVOUT_SW_SFT                     4
+#define ACCDET_EINT0_INVOUT_SW_MASK                    0x1
+#define ACCDET_EINT0_INVOUT_SW_MASK_SFT                (0x1 << 4)
+#define ACCDET_EINT1_CMPOUT_SW_ADDR                    \
+	MT6359_ACCDET_CON24
+#define ACCDET_EINT1_CMPOUT_SW_SFT                     5
+#define ACCDET_EINT1_CMPOUT_SW_MASK                    0x1
+#define ACCDET_EINT1_CMPOUT_SW_MASK_SFT                (0x1 << 5)
+#define ACCDET_EINT1_CMPMOUT_SW_ADDR                   \
+	MT6359_ACCDET_CON24
+#define ACCDET_EINT1_CMPMOUT_SW_SFT                    6
+#define ACCDET_EINT1_CMPMOUT_SW_MASK                   0x1
+#define ACCDET_EINT1_CMPMOUT_SW_MASK_SFT               (0x1 << 6)
+#define ACCDET_EINT1_INVOUT_SW_ADDR                    \
+	MT6359_ACCDET_CON24
+#define ACCDET_EINT1_INVOUT_SW_SFT                     7
+#define ACCDET_EINT1_INVOUT_SW_MASK                    0x1
+#define ACCDET_EINT1_INVOUT_SW_MASK_SFT                (0x1 << 7)
+#define AD_AUDACCDETCMPOB_ADDR                         \
+	MT6359_ACCDET_CON25
+#define AD_AUDACCDETCMPOB_SFT                          0
+#define AD_AUDACCDETCMPOB_MASK                         0x1
+#define AD_AUDACCDETCMPOB_MASK_SFT                     (0x1 << 0)
+#define AD_AUDACCDETCMPOA_ADDR                         \
+	MT6359_ACCDET_CON25
+#define AD_AUDACCDETCMPOA_SFT                          1
+#define AD_AUDACCDETCMPOA_MASK                         0x1
+#define AD_AUDACCDETCMPOA_MASK_SFT                     (0x1 << 1)
+#define ACCDET_CUR_IN_ADDR                             \
+	MT6359_ACCDET_CON25
+#define ACCDET_CUR_IN_SFT                              2
+#define ACCDET_CUR_IN_MASK                             0x3
+#define ACCDET_CUR_IN_MASK_SFT                         (0x3 << 2)
+#define ACCDET_SAM_IN_ADDR                             \
+	MT6359_ACCDET_CON25
+#define ACCDET_SAM_IN_SFT                              4
+#define ACCDET_SAM_IN_MASK                             0x3
+#define ACCDET_SAM_IN_MASK_SFT                         (0x3 << 4)
+#define ACCDET_MEM_IN_ADDR                             \
+	MT6359_ACCDET_CON25
+#define ACCDET_MEM_IN_SFT                              6
+#define ACCDET_MEM_IN_MASK                             0x3
+#define ACCDET_MEM_IN_MASK_SFT                         (0x3 << 6)
+#define ACCDET_STATE_ADDR                              \
+	MT6359_ACCDET_CON25
+#define ACCDET_STATE_SFT                               8
+#define ACCDET_STATE_MASK                              0x7
+#define ACCDET_STATE_MASK_SFT                          (0x7 << 8)
+#define DA_AUDACCDETMBIASCLK_ADDR                      \
+	MT6359_ACCDET_CON25
+#define DA_AUDACCDETMBIASCLK_SFT                       12
+#define DA_AUDACCDETMBIASCLK_MASK                      0x1
+#define DA_AUDACCDETMBIASCLK_MASK_SFT                  (0x1 << 12)
+#define DA_AUDACCDETVTHCLK_ADDR                        \
+	MT6359_ACCDET_CON25
+#define DA_AUDACCDETVTHCLK_SFT                         13
+#define DA_AUDACCDETVTHCLK_MASK                        0x1
+#define DA_AUDACCDETVTHCLK_MASK_SFT                    (0x1 << 13)
+#define DA_AUDACCDETCMPCLK_ADDR                        \
+	MT6359_ACCDET_CON25
+#define DA_AUDACCDETCMPCLK_SFT                         14
+#define DA_AUDACCDETCMPCLK_MASK                        0x1
+#define DA_AUDACCDETCMPCLK_MASK_SFT                    (0x1 << 14)
+#define DA_AUDACCDETAUXADCSWCTRL_ADDR                  \
+	MT6359_ACCDET_CON25
+#define DA_AUDACCDETAUXADCSWCTRL_SFT                   15
+#define DA_AUDACCDETAUXADCSWCTRL_MASK                  0x1
+#define DA_AUDACCDETAUXADCSWCTRL_MASK_SFT              (0x1 << 15)
+#define AD_EINT0CMPMOUT_ADDR                           \
+	MT6359_ACCDET_CON26
+#define AD_EINT0CMPMOUT_SFT                            0
+#define AD_EINT0CMPMOUT_MASK                           0x1
+#define AD_EINT0CMPMOUT_MASK_SFT                       (0x1 << 0)
+#define AD_EINT0CMPOUT_ADDR                            \
+	MT6359_ACCDET_CON26
+#define AD_EINT0CMPOUT_SFT                             1
+#define AD_EINT0CMPOUT_MASK                            0x1
+#define AD_EINT0CMPOUT_MASK_SFT                        (0x1 << 1)
+#define ACCDET_EINT0_CUR_IN_ADDR                       \
+	MT6359_ACCDET_CON26
+#define ACCDET_EINT0_CUR_IN_SFT                        2
+#define ACCDET_EINT0_CUR_IN_MASK                       0x3
+#define ACCDET_EINT0_CUR_IN_MASK_SFT                   (0x3 << 2)
+#define ACCDET_EINT0_SAM_IN_ADDR                       \
+	MT6359_ACCDET_CON26
+#define ACCDET_EINT0_SAM_IN_SFT                        4
+#define ACCDET_EINT0_SAM_IN_MASK                       0x3
+#define ACCDET_EINT0_SAM_IN_MASK_SFT                   (0x3 << 4)
+#define ACCDET_EINT0_MEM_IN_ADDR                       \
+	MT6359_ACCDET_CON26
+#define ACCDET_EINT0_MEM_IN_SFT                        6
+#define ACCDET_EINT0_MEM_IN_MASK                       0x3
+#define ACCDET_EINT0_MEM_IN_MASK_SFT                   (0x3 << 6)
+#define ACCDET_EINT0_STATE_ADDR                        \
+	MT6359_ACCDET_CON26
+#define ACCDET_EINT0_STATE_SFT                         8
+#define ACCDET_EINT0_STATE_MASK                        0x7
+#define ACCDET_EINT0_STATE_MASK_SFT                    (0x7 << 8)
+#define DA_EINT0CMPEN_ADDR                             \
+	MT6359_ACCDET_CON26
+#define DA_EINT0CMPEN_SFT                              13
+#define DA_EINT0CMPEN_MASK                             0x1
+#define DA_EINT0CMPEN_MASK_SFT                         (0x1 << 13)
+#define DA_EINT0CMPMEN_ADDR                            \
+	MT6359_ACCDET_CON26
+#define DA_EINT0CMPMEN_SFT                             14
+#define DA_EINT0CMPMEN_MASK                            0x1
+#define DA_EINT0CMPMEN_MASK_SFT                        (0x1 << 14)
+#define DA_EINT0CTURBO_ADDR                            \
+	MT6359_ACCDET_CON26
+#define DA_EINT0CTURBO_SFT                             15
+#define DA_EINT0CTURBO_MASK                            0x1
+#define DA_EINT0CTURBO_MASK_SFT                        (0x1 << 15)
+#define AD_EINT1CMPMOUT_ADDR                           \
+	MT6359_ACCDET_CON27
+#define AD_EINT1CMPMOUT_SFT                            0
+#define AD_EINT1CMPMOUT_MASK                           0x1
+#define AD_EINT1CMPMOUT_MASK_SFT                       (0x1 << 0)
+#define AD_EINT1CMPOUT_ADDR                            \
+	MT6359_ACCDET_CON27
+#define AD_EINT1CMPOUT_SFT                             1
+#define AD_EINT1CMPOUT_MASK                            0x1
+#define AD_EINT1CMPOUT_MASK_SFT                        (0x1 << 1)
+#define ACCDET_EINT1_CUR_IN_ADDR                       \
+	MT6359_ACCDET_CON27
+#define ACCDET_EINT1_CUR_IN_SFT                        2
+#define ACCDET_EINT1_CUR_IN_MASK                       0x3
+#define ACCDET_EINT1_CUR_IN_MASK_SFT                   (0x3 << 2)
+#define ACCDET_EINT1_SAM_IN_ADDR                       \
+	MT6359_ACCDET_CON27
+#define ACCDET_EINT1_SAM_IN_SFT                        4
+#define ACCDET_EINT1_SAM_IN_MASK                       0x3
+#define ACCDET_EINT1_SAM_IN_MASK_SFT                   (0x3 << 4)
+#define ACCDET_EINT1_MEM_IN_ADDR                       \
+	MT6359_ACCDET_CON27
+#define ACCDET_EINT1_MEM_IN_SFT                        6
+#define ACCDET_EINT1_MEM_IN_MASK                       0x3
+#define ACCDET_EINT1_MEM_IN_MASK_SFT                   (0x3 << 6)
+#define ACCDET_EINT1_STATE_ADDR                        \
+	MT6359_ACCDET_CON27
+#define ACCDET_EINT1_STATE_SFT                         8
+#define ACCDET_EINT1_STATE_MASK                        0x7
+#define ACCDET_EINT1_STATE_MASK_SFT                    (0x7 << 8)
+#define DA_EINT1CMPEN_ADDR                             \
+	MT6359_ACCDET_CON27
+#define DA_EINT1CMPEN_SFT                              13
+#define DA_EINT1CMPEN_MASK                             0x1
+#define DA_EINT1CMPEN_MASK_SFT                         (0x1 << 13)
+#define DA_EINT1CMPMEN_ADDR                            \
+	MT6359_ACCDET_CON27
+#define DA_EINT1CMPMEN_SFT                             14
+#define DA_EINT1CMPMEN_MASK                            0x1
+#define DA_EINT1CMPMEN_MASK_SFT                        (0x1 << 14)
+#define DA_EINT1CTURBO_ADDR                            \
+	MT6359_ACCDET_CON27
+#define DA_EINT1CTURBO_SFT                             15
+#define DA_EINT1CTURBO_MASK                            0x1
+#define DA_EINT1CTURBO_MASK_SFT                        (0x1 << 15)
+#define AD_EINT0INVOUT_ADDR                            \
+	MT6359_ACCDET_CON28
+#define AD_EINT0INVOUT_SFT                             0
+#define AD_EINT0INVOUT_MASK                            0x1
+#define AD_EINT0INVOUT_MASK_SFT                        (0x1 << 0)
+#define ACCDET_EINT0_INVERTER_CUR_IN_ADDR              \
+	MT6359_ACCDET_CON28
+#define ACCDET_EINT0_INVERTER_CUR_IN_SFT               1
+#define ACCDET_EINT0_INVERTER_CUR_IN_MASK              0x1
+#define ACCDET_EINT0_INVERTER_CUR_IN_MASK_SFT          (0x1 << 1)
+#define ACCDET_EINT0_INVERTER_SAM_IN_ADDR              \
+	MT6359_ACCDET_CON28
+#define ACCDET_EINT0_INVERTER_SAM_IN_SFT               2
+#define ACCDET_EINT0_INVERTER_SAM_IN_MASK              0x1
+#define ACCDET_EINT0_INVERTER_SAM_IN_MASK_SFT          (0x1 << 2)
+#define ACCDET_EINT0_INVERTER_MEM_IN_ADDR              \
+	MT6359_ACCDET_CON28
+#define ACCDET_EINT0_INVERTER_MEM_IN_SFT               3
+#define ACCDET_EINT0_INVERTER_MEM_IN_MASK              0x1
+#define ACCDET_EINT0_INVERTER_MEM_IN_MASK_SFT          (0x1 << 3)
+#define ACCDET_EINT0_INVERTER_STATE_ADDR               \
+	MT6359_ACCDET_CON28
+#define ACCDET_EINT0_INVERTER_STATE_SFT                8
+#define ACCDET_EINT0_INVERTER_STATE_MASK               0x7
+#define ACCDET_EINT0_INVERTER_STATE_MASK_SFT           (0x7 << 8)
+#define DA_EINT0EN_ADDR                                \
+	MT6359_ACCDET_CON28
+#define DA_EINT0EN_SFT                                 12
+#define DA_EINT0EN_MASK                                0x1
+#define DA_EINT0EN_MASK_SFT                            (0x1 << 12)
+#define DA_EINT0INVEN_ADDR                             \
+	MT6359_ACCDET_CON28
+#define DA_EINT0INVEN_SFT                              13
+#define DA_EINT0INVEN_MASK                             0x1
+#define DA_EINT0INVEN_MASK_SFT                         (0x1 << 13)
+#define DA_EINT0CEN_ADDR                               \
+	MT6359_ACCDET_CON28
+#define DA_EINT0CEN_SFT                                14
+#define DA_EINT0CEN_MASK                               0x1
+#define DA_EINT0CEN_MASK_SFT                           (0x1 << 14)
+#define AD_EINT1INVOUT_ADDR                            \
+	MT6359_ACCDET_CON29
+#define AD_EINT1INVOUT_SFT                             0
+#define AD_EINT1INVOUT_MASK                            0x1
+#define AD_EINT1INVOUT_MASK_SFT                        (0x1 << 0)
+#define ACCDET_EINT1_INVERTER_CUR_IN_ADDR              \
+	MT6359_ACCDET_CON29
+#define ACCDET_EINT1_INVERTER_CUR_IN_SFT               1
+#define ACCDET_EINT1_INVERTER_CUR_IN_MASK              0x1
+#define ACCDET_EINT1_INVERTER_CUR_IN_MASK_SFT          (0x1 << 1)
+#define ACCDET_EINT1_INVERTER_SAM_IN_ADDR              \
+	MT6359_ACCDET_CON29
+#define ACCDET_EINT1_INVERTER_SAM_IN_SFT               2
+#define ACCDET_EINT1_INVERTER_SAM_IN_MASK              0x1
+#define ACCDET_EINT1_INVERTER_SAM_IN_MASK_SFT          (0x1 << 2)
+#define ACCDET_EINT1_INVERTER_MEM_IN_ADDR              \
+	MT6359_ACCDET_CON29
+#define ACCDET_EINT1_INVERTER_MEM_IN_SFT               3
+#define ACCDET_EINT1_INVERTER_MEM_IN_MASK              0x1
+#define ACCDET_EINT1_INVERTER_MEM_IN_MASK_SFT          (0x1 << 3)
+#define ACCDET_EINT1_INVERTER_STATE_ADDR               \
+	MT6359_ACCDET_CON29
+#define ACCDET_EINT1_INVERTER_STATE_SFT                8
+#define ACCDET_EINT1_INVERTER_STATE_MASK               0x7
+#define ACCDET_EINT1_INVERTER_STATE_MASK_SFT           (0x7 << 8)
+#define DA_EINT1EN_ADDR                                \
+	MT6359_ACCDET_CON29
+#define DA_EINT1EN_SFT                                 12
+#define DA_EINT1EN_MASK                                0x1
+#define DA_EINT1EN_MASK_SFT                            (0x1 << 12)
+#define DA_EINT1INVEN_ADDR                             \
+	MT6359_ACCDET_CON29
+#define DA_EINT1INVEN_SFT                              13
+#define DA_EINT1INVEN_MASK                             0x1
+#define DA_EINT1INVEN_MASK_SFT                         (0x1 << 13)
+#define DA_EINT1CEN_ADDR                               \
+	MT6359_ACCDET_CON29
+#define DA_EINT1CEN_SFT                                14
+#define DA_EINT1CEN_MASK                               0x1
+#define DA_EINT1CEN_MASK_SFT                           (0x1 << 14)
+#define ACCDET_EN_ADDR                                 \
+	MT6359_ACCDET_CON30
+#define ACCDET_EN_SFT                                  0
+#define ACCDET_EN_MASK                                 0x1
+#define ACCDET_EN_MASK_SFT                             (0x1 << 0)
+#define ACCDET_EINT0_EN_ADDR                           \
+	MT6359_ACCDET_CON30
+#define ACCDET_EINT0_EN_SFT                            1
+#define ACCDET_EINT0_EN_MASK                           0x1
+#define ACCDET_EINT0_EN_MASK_SFT                       (0x1 << 1)
+#define ACCDET_EINT1_EN_ADDR                           \
+	MT6359_ACCDET_CON30
+#define ACCDET_EINT1_EN_SFT                            2
+#define ACCDET_EINT1_EN_MASK                           0x1
+#define ACCDET_EINT1_EN_MASK_SFT                       (0x1 << 2)
+#define ACCDET_EINT0_M_EN_ADDR                         \
+	MT6359_ACCDET_CON30
+#define ACCDET_EINT0_M_EN_SFT                          3
+#define ACCDET_EINT0_M_EN_MASK                         0x1
+#define ACCDET_EINT0_M_EN_MASK_SFT                     (0x1 << 3)
+#define ACCDET_EINT0_DETECT_MOISTURE_ADDR              \
+	MT6359_ACCDET_CON30
+#define ACCDET_EINT0_DETECT_MOISTURE_SFT               4
+#define ACCDET_EINT0_DETECT_MOISTURE_MASK              0x1
+#define ACCDET_EINT0_DETECT_MOISTURE_MASK_SFT          (0x1 << 4)
+#define ACCDET_EINT0_PLUG_IN_ADDR                      \
+	MT6359_ACCDET_CON30
+#define ACCDET_EINT0_PLUG_IN_SFT                       5
+#define ACCDET_EINT0_PLUG_IN_MASK                      0x1
+#define ACCDET_EINT0_PLUG_IN_MASK_SFT                  (0x1 << 5)
+#define ACCDET_EINT0_M_PLUG_IN_ADDR                    \
+	MT6359_ACCDET_CON30
+#define ACCDET_EINT0_M_PLUG_IN_SFT                     6
+#define ACCDET_EINT0_M_PLUG_IN_MASK                    0x1
+#define ACCDET_EINT0_M_PLUG_IN_MASK_SFT                (0x1 << 6)
+#define ACCDET_EINT1_M_EN_ADDR                         \
+	MT6359_ACCDET_CON30
+#define ACCDET_EINT1_M_EN_SFT                          7
+#define ACCDET_EINT1_M_EN_MASK                         0x1
+#define ACCDET_EINT1_M_EN_MASK_SFT                     (0x1 << 7)
+#define ACCDET_EINT1_DETECT_MOISTURE_ADDR              \
+	MT6359_ACCDET_CON30
+#define ACCDET_EINT1_DETECT_MOISTURE_SFT               8
+#define ACCDET_EINT1_DETECT_MOISTURE_MASK              0x1
+#define ACCDET_EINT1_DETECT_MOISTURE_MASK_SFT          (0x1 << 8)
+#define ACCDET_EINT1_PLUG_IN_ADDR                      \
+	MT6359_ACCDET_CON30
+#define ACCDET_EINT1_PLUG_IN_SFT                       9
+#define ACCDET_EINT1_PLUG_IN_MASK                      0x1
+#define ACCDET_EINT1_PLUG_IN_MASK_SFT                  (0x1 << 9)
+#define ACCDET_EINT1_M_PLUG_IN_ADDR                    \
+	MT6359_ACCDET_CON30
+#define ACCDET_EINT1_M_PLUG_IN_SFT                     10
+#define ACCDET_EINT1_M_PLUG_IN_MASK                    0x1
+#define ACCDET_EINT1_M_PLUG_IN_MASK_SFT                (0x1 << 10)
+#define ACCDET_CUR_DEB_ADDR                            \
+	MT6359_ACCDET_CON31
+#define ACCDET_CUR_DEB_SFT                             0
+#define ACCDET_CUR_DEB_MASK                            0xFFFF
+#define ACCDET_CUR_DEB_MASK_SFT                        (0xFFFF << 0)
+#define ACCDET_EINT0_CUR_DEB_ADDR                      \
+	MT6359_ACCDET_CON32
+#define ACCDET_EINT0_CUR_DEB_SFT                       0
+#define ACCDET_EINT0_CUR_DEB_MASK                      0x7FFF
+#define ACCDET_EINT0_CUR_DEB_MASK_SFT                  (0x7FFF << 0)
+#define ACCDET_EINT1_CUR_DEB_ADDR                      \
+	MT6359_ACCDET_CON33
+#define ACCDET_EINT1_CUR_DEB_SFT                       0
+#define ACCDET_EINT1_CUR_DEB_MASK                      0x7FFF
+#define ACCDET_EINT1_CUR_DEB_MASK_SFT                  (0x7FFF << 0)
+#define ACCDET_EINT0_INVERTER_CUR_DEB_ADDR             \
+	MT6359_ACCDET_CON34
+#define ACCDET_EINT0_INVERTER_CUR_DEB_SFT              0
+#define ACCDET_EINT0_INVERTER_CUR_DEB_MASK             0x7FFF
+#define ACCDET_EINT0_INVERTER_CUR_DEB_MASK_SFT         (0x7FFF << 0)
+#define ACCDET_EINT1_INVERTER_CUR_DEB_ADDR             \
+	MT6359_ACCDET_CON35
+#define ACCDET_EINT1_INVERTER_CUR_DEB_SFT              0
+#define ACCDET_EINT1_INVERTER_CUR_DEB_MASK             0x7FFF
+#define ACCDET_EINT1_INVERTER_CUR_DEB_MASK_SFT         (0x7FFF << 0)
+#define AD_AUDACCDETCMPOB_MON_ADDR                     \
+	MT6359_ACCDET_CON36
+#define AD_AUDACCDETCMPOB_MON_SFT                      0
+#define AD_AUDACCDETCMPOB_MON_MASK                     0x1
+#define AD_AUDACCDETCMPOB_MON_MASK_SFT                 (0x1 << 0)
+#define AD_AUDACCDETCMPOA_MON_ADDR                     \
+	MT6359_ACCDET_CON36
+#define AD_AUDACCDETCMPOA_MON_SFT                      1
+#define AD_AUDACCDETCMPOA_MON_MASK                     0x1
+#define AD_AUDACCDETCMPOA_MON_MASK_SFT                 (0x1 << 1)
+#define AD_EINT0CMPMOUT_MON_ADDR                       \
+	MT6359_ACCDET_CON36
+#define AD_EINT0CMPMOUT_MON_SFT                        2
+#define AD_EINT0CMPMOUT_MON_MASK                       0x1
+#define AD_EINT0CMPMOUT_MON_MASK_SFT                   (0x1 << 2)
+#define AD_EINT0CMPOUT_MON_ADDR                        \
+	MT6359_ACCDET_CON36
+#define AD_EINT0CMPOUT_MON_SFT                         3
+#define AD_EINT0CMPOUT_MON_MASK                        0x1
+#define AD_EINT0CMPOUT_MON_MASK_SFT                    (0x1 << 3)
+#define AD_EINT0INVOUT_MON_ADDR                        \
+	MT6359_ACCDET_CON36
+#define AD_EINT0INVOUT_MON_SFT                         4
+#define AD_EINT0INVOUT_MON_MASK                        0x1
+#define AD_EINT0INVOUT_MON_MASK_SFT                    (0x1 << 4)
+#define AD_EINT1CMPMOUT_MON_ADDR                       \
+	MT6359_ACCDET_CON36
+#define AD_EINT1CMPMOUT_MON_SFT                        5
+#define AD_EINT1CMPMOUT_MON_MASK                       0x1
+#define AD_EINT1CMPMOUT_MON_MASK_SFT                   (0x1 << 5)
+#define AD_EINT1CMPOUT_MON_ADDR                        \
+	MT6359_ACCDET_CON36
+#define AD_EINT1CMPOUT_MON_SFT                         6
+#define AD_EINT1CMPOUT_MON_MASK                        0x1
+#define AD_EINT1CMPOUT_MON_MASK_SFT                    (0x1 << 6)
+#define AD_EINT1INVOUT_MON_ADDR                        \
+	MT6359_ACCDET_CON36
+#define AD_EINT1INVOUT_MON_SFT                         7
+#define AD_EINT1INVOUT_MON_MASK                        0x1
+#define AD_EINT1INVOUT_MON_MASK_SFT                    (0x1 << 7)
+#define DA_AUDACCDETCMPCLK_MON_ADDR                    \
+	MT6359_ACCDET_CON37
+#define DA_AUDACCDETCMPCLK_MON_SFT                     0
+#define DA_AUDACCDETCMPCLK_MON_MASK                    0x1
+#define DA_AUDACCDETCMPCLK_MON_MASK_SFT                (0x1 << 0)
+#define DA_AUDACCDETVTHCLK_MON_ADDR                    \
+	MT6359_ACCDET_CON37
+#define DA_AUDACCDETVTHCLK_MON_SFT                     1
+#define DA_AUDACCDETVTHCLK_MON_MASK                    0x1
+#define DA_AUDACCDETVTHCLK_MON_MASK_SFT                (0x1 << 1)
+#define DA_AUDACCDETMBIASCLK_MON_ADDR                  \
+	MT6359_ACCDET_CON37
+#define DA_AUDACCDETMBIASCLK_MON_SFT                   2
+#define DA_AUDACCDETMBIASCLK_MON_MASK                  0x1
+#define DA_AUDACCDETMBIASCLK_MON_MASK_SFT              (0x1 << 2)
+#define DA_AUDACCDETAUXADCSWCTRL_MON_ADDR              \
+	MT6359_ACCDET_CON37
+#define DA_AUDACCDETAUXADCSWCTRL_MON_SFT               3
+#define DA_AUDACCDETAUXADCSWCTRL_MON_MASK              0x1
+#define DA_AUDACCDETAUXADCSWCTRL_MON_MASK_SFT          (0x1 << 3)
+#define DA_EINT0CTURBO_MON_ADDR                        \
+	MT6359_ACCDET_CON38
+#define DA_EINT0CTURBO_MON_SFT                         0
+#define DA_EINT0CTURBO_MON_MASK                        0x1
+#define DA_EINT0CTURBO_MON_MASK_SFT                    (0x1 << 0)
+#define DA_EINT0CMPMEN_MON_ADDR                        \
+	MT6359_ACCDET_CON38
+#define DA_EINT0CMPMEN_MON_SFT                         1
+#define DA_EINT0CMPMEN_MON_MASK                        0x1
+#define DA_EINT0CMPMEN_MON_MASK_SFT                    (0x1 << 1)
+#define DA_EINT0CMPEN_MON_ADDR                         \
+	MT6359_ACCDET_CON38
+#define DA_EINT0CMPEN_MON_SFT                          2
+#define DA_EINT0CMPEN_MON_MASK                         0x1
+#define DA_EINT0CMPEN_MON_MASK_SFT                     (0x1 << 2)
+#define DA_EINT0INVEN_MON_ADDR                         \
+	MT6359_ACCDET_CON38
+#define DA_EINT0INVEN_MON_SFT                          3
+#define DA_EINT0INVEN_MON_MASK                         0x1
+#define DA_EINT0INVEN_MON_MASK_SFT                     (0x1 << 3)
+#define DA_EINT0CEN_MON_ADDR                           \
+	MT6359_ACCDET_CON38
+#define DA_EINT0CEN_MON_SFT                            4
+#define DA_EINT0CEN_MON_MASK                           0x1
+#define DA_EINT0CEN_MON_MASK_SFT                       (0x1 << 4)
+#define DA_EINT0EN_MON_ADDR                            \
+	MT6359_ACCDET_CON38
+#define DA_EINT0EN_MON_SFT                             5
+#define DA_EINT0EN_MON_MASK                            0x1
+#define DA_EINT0EN_MON_MASK_SFT                        (0x1 << 5)
+#define DA_EINT1CTURBO_MON_ADDR                        \
+	MT6359_ACCDET_CON38
+#define DA_EINT1CTURBO_MON_SFT                         8
+#define DA_EINT1CTURBO_MON_MASK                        0x1
+#define DA_EINT1CTURBO_MON_MASK_SFT                    (0x1 << 8)
+#define DA_EINT1CMPMEN_MON_ADDR                        \
+	MT6359_ACCDET_CON38
+#define DA_EINT1CMPMEN_MON_SFT                         9
+#define DA_EINT1CMPMEN_MON_MASK                        0x1
+#define DA_EINT1CMPMEN_MON_MASK_SFT                    (0x1 << 9)
+#define DA_EINT1CMPEN_MON_ADDR                         \
+	MT6359_ACCDET_CON38
+#define DA_EINT1CMPEN_MON_SFT                          10
+#define DA_EINT1CMPEN_MON_MASK                         0x1
+#define DA_EINT1CMPEN_MON_MASK_SFT                     (0x1 << 10)
+#define DA_EINT1INVEN_MON_ADDR                         \
+	MT6359_ACCDET_CON38
+#define DA_EINT1INVEN_MON_SFT                          11
+#define DA_EINT1INVEN_MON_MASK                         0x1
+#define DA_EINT1INVEN_MON_MASK_SFT                     (0x1 << 11)
+#define DA_EINT1CEN_MON_ADDR                           \
+	MT6359_ACCDET_CON38
+#define DA_EINT1CEN_MON_SFT                            12
+#define DA_EINT1CEN_MON_MASK                           0x1
+#define DA_EINT1CEN_MON_MASK_SFT                       (0x1 << 12)
+#define DA_EINT1EN_MON_ADDR                            \
+	MT6359_ACCDET_CON38
+#define DA_EINT1EN_MON_SFT                             13
+#define DA_EINT1EN_MON_MASK                            0x1
+#define DA_EINT1EN_MON_MASK_SFT                        (0x1 << 13)
+#define ACCDET_EINT0_M_PLUG_IN_COUNT_ADDR              \
+	MT6359_ACCDET_CON39
+#define ACCDET_EINT0_M_PLUG_IN_COUNT_SFT               0
+#define ACCDET_EINT0_M_PLUG_IN_COUNT_MASK              0x7
+#define ACCDET_EINT0_M_PLUG_IN_COUNT_MASK_SFT          (0x7 << 0)
+#define ACCDET_EINT1_M_PLUG_IN_COUNT_ADDR              \
+	MT6359_ACCDET_CON39
+#define ACCDET_EINT1_M_PLUG_IN_COUNT_SFT               4
+#define ACCDET_EINT1_M_PLUG_IN_COUNT_MASK              0x7
+#define ACCDET_EINT1_M_PLUG_IN_COUNT_MASK_SFT          (0x7 << 4)
+#define ACCDET_MON_FLAG_EN_ADDR                        \
+	MT6359_ACCDET_CON40
+#define ACCDET_MON_FLAG_EN_SFT                         0
+#define ACCDET_MON_FLAG_EN_MASK                        0x1
+#define ACCDET_MON_FLAG_EN_MASK_SFT                    (0x1 << 0)
+#define ACCDET_MON_FLAG_SEL_ADDR                       \
+	MT6359_ACCDET_CON40
+#define ACCDET_MON_FLAG_SEL_SFT                        4
+#define ACCDET_MON_FLAG_SEL_MASK                       0xF
+#define ACCDET_MON_FLAG_SEL_MASK_SFT                   (0xF << 4)
+
+#define RG_AUDPWDBMICBIAS0_ADDR                        \
+	MT6359_AUDENC_ANA_CON15
+#define RG_AUDPWDBMICBIAS0_SFT                         0
+#define RG_AUDPWDBMICBIAS0_MASK                        0x1
+#define RG_AUDPWDBMICBIAS0_MASK_SFT                    (0x1 << 0)
+#define RG_AUDPREAMPLON_ADDR                           \
+	MT6359_AUDENC_ANA_CON0
+#define RG_AUDPREAMPLON_SFT                            0
+#define RG_AUDPREAMPLON_MASK                           0x1
+#define RG_AUDPREAMPLON_MASK_SFT                       (0x1 << 0)
+#define RG_CLKSQ_EN_ADDR                               \
+	MT6359_AUDENC_ANA_CON23
+#define RG_CLKSQ_EN_SFT                                0
+#define RG_CLKSQ_EN_MASK                               0x1
+#define RG_CLKSQ_EN_MASK_SFT                           (0x1 << 0)
+#define RG_RTC32K_CK_PDN_ADDR                          \
+	MT6359_TOP_CKPDN_CON0
+#define RG_RTC32K_CK_PDN_SFT                           15
+#define RG_RTC32K_CK_PDN_MASK                          0x1
+#define RG_RTC32K_CK_PDN_MASK_SFT                      (0x1 << 15)
+#define RG_HPLOUTPUTSTBENH_VAUDP32_ADDR                \
+	MT6359_AUDDEC_ANA_CON2
+#define RG_HPLOUTPUTSTBENH_VAUDP32_SFT                 0
+#define RG_HPLOUTPUTSTBENH_VAUDP32_MASK                0x7
+#define RG_HPLOUTPUTSTBENH_VAUDP32_MASK_SFT            (0x7 << 0)
+#define AUXADC_RQST_CH5_ADDR                           \
+	MT6359_AUXADC_RQST0
+#define AUXADC_RQST_CH5_SFT                            5
+#define AUXADC_RQST_CH5_MASK                           0x1
+#define AUXADC_RQST_CH5_MASK_SFT                       (0x1 << 5)
+#define RG_LDO_VUSB_HW0_OP_EN_ADDR                     \
+	MT6359_LDO_VUSB_OP_EN
+#define RG_LDO_VUSB_HW0_OP_EN_SFT                      0
+#define RG_LDO_VUSB_HW0_OP_EN_MASK                     0x1
+#define RG_LDO_VUSB_HW0_OP_EN_MASK_SFT                 (0x1 << 0)
+#define RG_HPROUTPUTSTBENH_VAUDP32_ADDR                \
+	MT6359_AUDDEC_ANA_CON2
+#define RG_HPROUTPUTSTBENH_VAUDP32_SFT                 4
+#define RG_HPROUTPUTSTBENH_VAUDP32_MASK                0x7
+#define RG_HPROUTPUTSTBENH_VAUDP32_MASK_SFT            (0x7 << 4)
+#define RG_NCP_PDDIS_EN_ADDR                           \
+	MT6359_AFE_NCP_CFG2
+#define RG_NCP_PDDIS_EN_SFT                            0
+#define RG_NCP_PDDIS_EN_MASK                           0x1
+#define RG_NCP_PDDIS_EN_MASK_SFT                       (0x1 << 0)
+#define RG_SCK32K_CK_PDN_ADDR                          \
+	MT6359_TOP_CKPDN_CON0
+#define RG_SCK32K_CK_PDN_SFT                           0
+#define RG_SCK32K_CK_PDN_MASK                          0x1
+#define RG_SCK32K_CK_PDN_MASK_SFT                      (0x1 << 0)
 /* AUDENC_ANA_CON18: */
-#define RG_ACCDET_MODE_ANA11_MODE1			(0x000f)
-#define RG_ACCDET_MODE_ANA11_MODE2			(0x008f)
-#define RG_ACCDET_MODE_ANA11_MODE6			(0x008f)
+#define RG_ACCDET_MODE_ANA11_MODE1	(0x000F)
+#define RG_ACCDET_MODE_ANA11_MODE2	(0x008F)
+#define RG_ACCDET_MODE_ANA11_MODE6	(0x008F)

 /* AUXADC_ADC5:  Auxadc CH5 read data */
 #define AUXADC_DATA_RDY_CH5		BIT(15)
 #define AUXADC_DATA_PROCEED_CH5		BIT(15)
-#define AUXADC_DATA_MASK				(0x0fff)
+#define AUXADC_DATA_MASK		(0x0FFF)

 /* AUXADC_RQST0_SET:  Auxadc CH5 request, relevant 0x07EC */
 #define AUXADC_RQST_CH5_SET		BIT(5)
 /* AUXADC_RQST0_CLR:  Auxadc CH5 request, relevant 0x07EC */
 #define AUXADC_RQST_CH5_CLR		BIT(5)

-#define ACCDET_CALI_MASK0				(0xff)
-#define ACCDET_CALI_MASK1				(0xff << 8)
-#define ACCDET_CALI_MASK2				(0xff)
-#define ACCDET_CALI_MASK3				(0xff << 8)
-#define ACCDET_CALI_MASK4				(0xff)
-
-#define ACCDET_EINT1_IRQ_CLR_B11	BIT(PMIC_ACCDET_EINT1_IRQ_CLR_SHIFT)
-#define ACCDET_EINT0_IRQ_CLR_B10	BIT(PMIC_ACCDET_EINT0_IRQ_CLR_SHIFT)
-#define ACCDET_EINT_IRQ_CLR_B10_11	(0x03 << \
-					 PMIC_ACCDET_EINT0_IRQ_CLR_SHIFT)
-#define ACCDET_IRQ_CLR_B8		BIT(PMIC_ACCDET_IRQ_CLR_SHIFT)
+#define ACCDET_CALI_MASK0		(0xFF)
+#define ACCDET_CALI_MASK1		(0xFF << 8)
+#define ACCDET_CALI_MASK2		(0xFF)
+#define ACCDET_CALI_MASK3		(0xFF << 8)
+#define ACCDET_CALI_MASK4		(0xFF)

-#define ACCDET_EINT1_IRQ_B3		BIT(PMIC_ACCDET_EINT1_IRQ_SHIFT)
-#define ACCDET_EINT0_IRQ_B2		BIT(PMIC_ACCDET_EINT0_IRQ_SHIFT)
-#define ACCDET_EINT_IRQ_B2_B3		(0x03 << PMIC_ACCDET_EINT0_IRQ_SHIFT)
-#define ACCDET_IRQ_B0			BIT(PMIC_ACCDET_IRQ_SHIFT)
+#define ACCDET_EINT_IRQ_B2_B3		(0x03 << ACCDET_EINT0_IRQ_SFT)

 /* ACCDET_CON25: RO, accdet FSM state,etc.*/
-#define ACCDET_STATE_MEM_IN_OFFSET	(PMIC_ACCDET_MEM_IN_SHIFT)
-#define ACCDET_STATE_AB_MASK				(0x03)
-#define ACCDET_STATE_AB_00				(0x00)
-#define ACCDET_STATE_AB_01				(0x01)
-#define ACCDET_STATE_AB_10				(0x02)
-#define ACCDET_STATE_AB_11				(0x03)
+#define ACCDET_STATE_MEM_IN_OFFSET	(ACCDET_MEM_IN_SFT)
+#define ACCDET_STATE_AB_MASK		(0x03)
+#define ACCDET_STATE_AB_00		(0x00)
+#define ACCDET_STATE_AB_01		(0x01)
+#define ACCDET_STATE_AB_10		(0x02)
+#define ACCDET_STATE_AB_11		(0x03)

 /* ACCDET_CON19 */
-#define ACCDET_EINT0_STABLE_VAL ((1 << PMIC_ACCDET_DA_STABLE_SHIFT) | \
-				(1 << PMIC_ACCDET_EINT0_EN_STABLE_SHIFT) | \
-				(1 << PMIC_ACCDET_EINT0_CMPEN_STABLE_SHIFT) | \
-				(1 << PMIC_ACCDET_EINT0_CEN_STABLE_SHIFT))
-
-#define ACCDET_EINT1_STABLE_VAL ((1 << PMIC_ACCDET_DA_STABLE_SHIFT) | \
-				(1 << PMIC_ACCDET_EINT1_EN_STABLE_SHIFT) | \
-				(1 << PMIC_ACCDET_EINT1_CMPEN_STABLE_SHIFT) | \
-				(1 << PMIC_ACCDET_EINT1_CEN_STABLE_SHIFT))
-
+#define ACCDET_EINT0_STABLE_VAL ((ACCDET_DA_STABLE_MASK_SFT) | \
+				(ACCDET_EINT0_EN_STABLE_MASK_SFT) | \
+				(ACCDET_EINT0_CMPEN_STABLE_MASK_SFT) | \
+				(ACCDET_EINT0_CEN_STABLE_MASK_SFT))
+
+#define ACCDET_EINT1_STABLE_VAL ((ACCDET_DA_STABLE_MASK_SFT) | \
+				(ACCDET_EINT1_EN_STABLE_MASK_SFT) | \
+				(ACCDET_EINT1_CMPEN_STABLE_MASK_SFT) | \
+				(ACCDET_EINT1_CEN_STABLE_MASK_SFT))
 /* The following are used for mt6359.c */
 /* MT6359_DCXO_CW12 */
 #define RG_XO_AUDIO_EN_M_SFT				13
--
2.18.0

