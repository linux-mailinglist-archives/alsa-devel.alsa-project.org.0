Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 589A07691A1
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 11:24:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26366A4D;
	Mon, 31 Jul 2023 11:23:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26366A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690795488;
	bh=17ImG3Zwl5IU83miEch1qnTDHtQW9bukuWO1hIM+WYM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n68+YHN5jRmk74OFLhn1cmPys06zjpr2oLeQD9BSLKCXBHuDAJUWGNqukQ584S7OW
	 ucmgAh2X7ZhSN26oMQ9ipoqwt3RZlrMq8N8AQ4boZ5TeYjBoLknEuI94+wDkH56r9L
	 bhiiYjPIEW2iw9GwZ/UNPcyXMOv6O+2Kf2QjJyWI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C45B1F80551; Mon, 31 Jul 2023 11:19:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83DE1F80680;
	Mon, 31 Jul 2023 11:19:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6765F80549; Mon, 31 Jul 2023 05:29:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A07D8F801D5
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 05:28:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A07D8F801D5
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id EB58B80BE;
	Mon, 31 Jul 2023 11:28:33 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 31 Jul
 2023 11:28:34 +0800
Received: from ubuntu.localdomain (113.72.147.196) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 31 Jul
 2023 11:28:32 +0800
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
Subject: [PATCH v2 2/3] ASoC: starfive: Add JH7110 PWM-DAC driver
Date: Mon, 31 Jul 2023 11:28:28 +0800
Message-ID: <20230731032829.127864-3-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230731032829.127864-1-hal.feng@starfivetech.com>
References: <20230731032829.127864-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [113.72.147.196]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
X-MailFrom: hal.feng@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SLLZE2CUMCHL3U2J22GU2ARMFLQNQKG7
X-Message-ID-Hash: SLLZE2CUMCHL3U2J22GU2ARMFLQNQKG7
X-Mailman-Approved-At: Mon, 31 Jul 2023 09:18:36 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
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
 sound/soc/starfive/jh7110_pwmdac.c | 787 +++++++++++++++++++++++++++++
 4 files changed, 804 insertions(+)
 create mode 100644 sound/soc/starfive/jh7110_pwmdac.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d516295978a4..beaabad028bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20284,6 +20284,13 @@ S:	Supported
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
index 000000000000..473e2a8abc36
--- /dev/null
+++ b/sound/soc/starfive/jh7110_pwmdac.c
@@ -0,0 +1,787 @@
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
+struct jh7110_pwmdac_dev {
+	void __iomem *base;
+	resource_size_t	mapbase;
+	u8 shift;
+	u8 duty_cycle;
+	u8 cnt_n;
+	u8 data_change;
+	u8 data_mode;
+	u8 data_shift;
+
+	struct clk_bulk_data clks[2];
+	struct reset_control *rst_apb;
+	struct device *dev;
+	struct snd_dmaengine_dai_dma_data play_dma_data;
+	u32 saved_ctrl;
+};
+
+enum jh7110_ct_pwmdac_name {
+	PWMDAC_CT_SHIFT =3D 0,
+	PWMDAC_CT_DUTY_CYCLE,
+	PWMDAC_CT_DATA_CHANGE,
+	PWMDAC_CT_DATA_MODE,
+	PWMDAC_CT_DATA_SHIFT,
+};
+
+struct jh7110_ct_pwmdac {
+	char *name;
+	unsigned int vals;
+};
+
+static const struct jh7110_ct_pwmdac pwmdac_ct_shift[] =3D {
+	{ .name =3D "8bit", .vals =3D PWMDAC_SHIFT_8 },
+	{ .name =3D "10bit", .vals =3D PWMDAC_SHIFT_10 }
+};
+
+static const struct jh7110_ct_pwmdac pwmdac_ct_duty_cycle[] =3D {
+	{ .name =3D "left", .vals =3D PWMDAC_CYCLE_LEFT },
+	{ .name =3D "right", .vals =3D PWMDAC_CYCLE_RIGHT },
+	{ .name =3D "center", .vals =3D PWMDAC_CYCLE_CENTER }
+};
+
+static const struct jh7110_ct_pwmdac pwmdac_ct_data_change[] =3D {
+	{ .name =3D "no_change", .vals =3D NO_CHANGE },
+	{ .name =3D "change", .vals =3D CHANGE }
+};
+
+static const struct jh7110_ct_pwmdac pwmdac_ct_data_mode[] =3D {
+	{ .name =3D "unsigned", .vals =3D UNSIGNED_DATA },
+	{ .name =3D "inverter", .vals =3D INVERTER_DATA_MSB }
+};
+
+static const struct jh7110_ct_pwmdac pwmdac_ct_data_shift[] =3D {
+	{ .name =3D "left 0 bit", .vals =3D PWMDAC_DATA_LEFT_SHIFT_BIT_0 },
+	{ .name =3D "left 1 bit", .vals =3D PWMDAC_DATA_LEFT_SHIFT_BIT_1 },
+	{ .name =3D "left 2 bit", .vals =3D PWMDAC_DATA_LEFT_SHIFT_BIT_2 },
+	{ .name =3D "left 3 bit", .vals =3D PWMDAC_DATA_LEFT_SHIFT_BIT_3 },
+	{ .name =3D "left 4 bit", .vals =3D PWMDAC_DATA_LEFT_SHIFT_BIT_4 },
+	{ .name =3D "left 5 bit", .vals =3D PWMDAC_DATA_LEFT_SHIFT_BIT_5 },
+	{ .name =3D "left 6 bit", .vals =3D PWMDAC_DATA_LEFT_SHIFT_BIT_6 },
+	{ .name =3D "left 7 bit", .vals =3D PWMDAC_DATA_LEFT_SHIFT_BIT_7 }
+};
+
+static int jh7110_pwmdac_info(struct snd_ctl_elem_info *uinfo, int pwmda=
c_ct)
+{
+	unsigned int items;
+
+	if (pwmdac_ct =3D=3D PWMDAC_CT_SHIFT) {
+		items =3D ARRAY_SIZE(pwmdac_ct_shift);
+		strcpy(uinfo->value.enumerated.name,
+		       pwmdac_ct_shift[uinfo->value.enumerated.item].name);
+	} else if (pwmdac_ct =3D=3D PWMDAC_CT_DUTY_CYCLE) {
+		items =3D ARRAY_SIZE(pwmdac_ct_duty_cycle);
+		strcpy(uinfo->value.enumerated.name,
+		       pwmdac_ct_duty_cycle[uinfo->value.enumerated.item].name);
+	} else if (pwmdac_ct =3D=3D PWMDAC_CT_DATA_CHANGE) {
+		items =3D ARRAY_SIZE(pwmdac_ct_data_change);
+		strcpy(uinfo->value.enumerated.name,
+		       pwmdac_ct_data_change[uinfo->value.enumerated.item].name);
+	} else if (pwmdac_ct =3D=3D PWMDAC_CT_DATA_MODE) {
+		items =3D ARRAY_SIZE(pwmdac_ct_data_mode);
+		strcpy(uinfo->value.enumerated.name,
+		       pwmdac_ct_data_mode[uinfo->value.enumerated.item].name);
+	} else if (pwmdac_ct =3D=3D PWMDAC_CT_DATA_SHIFT) {
+		items =3D ARRAY_SIZE(pwmdac_ct_data_shift);
+		strcpy(uinfo->value.enumerated.name,
+		       pwmdac_ct_data_shift[uinfo->value.enumerated.item].name);
+	}
+
+	uinfo->type =3D SNDRV_CTL_ELEM_TYPE_ENUMERATED;
+	uinfo->count =3D 1;
+	uinfo->value.enumerated.items =3D items;
+	if (uinfo->value.enumerated.item >=3D items)
+		uinfo->value.enumerated.item =3D items - 1;
+
+	return 0;
+}
+
+static int jh7110_pwmdac_get(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol,
+			     int pwmdac_ct)
+{
+	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
+	struct jh7110_pwmdac_dev *dev =3D snd_soc_component_get_drvdata(compone=
nt);
+
+	if (pwmdac_ct =3D=3D PWMDAC_CT_SHIFT)
+		ucontrol->value.enumerated.item[0] =3D dev->shift;
+	else if (pwmdac_ct =3D=3D PWMDAC_CT_DUTY_CYCLE)
+		ucontrol->value.enumerated.item[0] =3D dev->duty_cycle;
+	else if (pwmdac_ct =3D=3D PWMDAC_CT_DATA_CHANGE)
+		ucontrol->value.enumerated.item[0] =3D dev->data_change;
+	else if (pwmdac_ct =3D=3D PWMDAC_CT_DATA_MODE)
+		ucontrol->value.enumerated.item[0] =3D dev->data_mode;
+	else if (pwmdac_ct =3D=3D PWMDAC_CT_DATA_SHIFT)
+		ucontrol->value.enumerated.item[0] =3D dev->data_shift;
+
+	return 0;
+}
+
+static int jh7110_pwmdac_put(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol,
+			     int pwmdac_ct)
+{
+	struct snd_soc_component *component =3D snd_kcontrol_chip(kcontrol);
+	struct jh7110_pwmdac_dev *dev =3D snd_soc_component_get_drvdata(compone=
nt);
+	int sel =3D ucontrol->value.enumerated.item[0];
+	unsigned int items;
+
+	if (pwmdac_ct =3D=3D PWMDAC_CT_SHIFT)
+		items =3D ARRAY_SIZE(pwmdac_ct_shift);
+	else if (pwmdac_ct =3D=3D PWMDAC_CT_DUTY_CYCLE)
+		items =3D ARRAY_SIZE(pwmdac_ct_duty_cycle);
+	else if (pwmdac_ct =3D=3D PWMDAC_CT_DATA_CHANGE)
+		items =3D ARRAY_SIZE(pwmdac_ct_data_change);
+	else if (pwmdac_ct =3D=3D PWMDAC_CT_DATA_MODE)
+		items =3D ARRAY_SIZE(pwmdac_ct_data_mode);
+	else if (pwmdac_ct =3D=3D PWMDAC_CT_DATA_SHIFT)
+		items =3D ARRAY_SIZE(pwmdac_ct_data_shift);
+
+	if (sel >=3D items)
+		return -EINVAL;
+
+	if (pwmdac_ct =3D=3D PWMDAC_CT_SHIFT)
+		dev->shift =3D pwmdac_ct_shift[sel].vals;
+	else if (pwmdac_ct =3D=3D PWMDAC_CT_DUTY_CYCLE)
+		dev->duty_cycle =3D pwmdac_ct_duty_cycle[sel].vals;
+	else if (pwmdac_ct =3D=3D PWMDAC_CT_DATA_CHANGE)
+		dev->data_change =3D pwmdac_ct_data_change[sel].vals;
+	else if (pwmdac_ct =3D=3D PWMDAC_CT_DATA_MODE)
+		dev->data_mode =3D pwmdac_ct_data_mode[sel].vals;
+	else if (pwmdac_ct =3D=3D PWMDAC_CT_DATA_SHIFT)
+		dev->data_shift =3D pwmdac_ct_data_shift[sel].vals;
+
+	return 0;
+}
+
+static int jh7110_pwmdac_shift_info(struct snd_kcontrol *kcontrol,
+				    struct snd_ctl_elem_info *uinfo)
+{
+	return jh7110_pwmdac_info(uinfo, PWMDAC_CT_SHIFT);
+}
+
+static int jh7110_pwmdac_shift_get(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	return jh7110_pwmdac_get(kcontrol, ucontrol, PWMDAC_CT_SHIFT);
+}
+
+static int jh7110_pwmdac_shift_put(struct snd_kcontrol *kcontrol,
+				   struct snd_ctl_elem_value *ucontrol)
+{
+	return jh7110_pwmdac_put(kcontrol, ucontrol, PWMDAC_CT_SHIFT);
+}
+
+static int jh7110_pwmdac_duty_cycle_info(struct snd_kcontrol *kcontrol,
+					 struct snd_ctl_elem_info *uinfo)
+{
+	return jh7110_pwmdac_info(uinfo, PWMDAC_CT_DUTY_CYCLE);
+}
+
+static int jh7110_pwmdac_duty_cycle_get(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	return jh7110_pwmdac_get(kcontrol, ucontrol, PWMDAC_CT_DUTY_CYCLE);
+}
+
+static int jh7110_pwmdac_duty_cycle_put(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	return jh7110_pwmdac_put(kcontrol, ucontrol, PWMDAC_CT_DUTY_CYCLE);
+}
+
+static int jh7110_pwmdac_data_change_info(struct snd_kcontrol *kcontrol,
+					  struct snd_ctl_elem_info *uinfo)
+{
+	return jh7110_pwmdac_info(uinfo, PWMDAC_CT_DATA_CHANGE);
+}
+
+static int jh7110_pwmdac_data_change_get(struct snd_kcontrol *kcontrol,
+					 struct snd_ctl_elem_value *ucontrol)
+{
+	return jh7110_pwmdac_get(kcontrol, ucontrol, PWMDAC_CT_DATA_CHANGE);
+}
+
+static int jh7110_pwmdac_data_change_put(struct snd_kcontrol *kcontrol,
+					 struct snd_ctl_elem_value *ucontrol)
+{
+	return jh7110_pwmdac_put(kcontrol, ucontrol, PWMDAC_CT_DATA_CHANGE);
+}
+
+static int jh7110_pwmdac_data_mode_info(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_info *uinfo)
+{
+	return jh7110_pwmdac_info(uinfo, PWMDAC_CT_DATA_MODE);
+}
+
+static int jh7110_pwmdac_data_mode_get(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	return jh7110_pwmdac_get(kcontrol, ucontrol, PWMDAC_CT_DATA_MODE);
+}
+
+static int jh7110_pwmdac_data_mode_put(struct snd_kcontrol *kcontrol,
+				       struct snd_ctl_elem_value *ucontrol)
+{
+	return jh7110_pwmdac_put(kcontrol, ucontrol, PWMDAC_CT_DATA_MODE);
+}
+
+static int jh7110_pwmdac_data_shift_info(struct snd_kcontrol *kcontrol,
+					 struct snd_ctl_elem_info *uinfo)
+{
+	return jh7110_pwmdac_info(uinfo, PWMDAC_CT_DATA_SHIFT);
+}
+
+static int jh7110_pwmdac_data_shift_get(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	return jh7110_pwmdac_get(kcontrol, ucontrol, PWMDAC_CT_DATA_SHIFT);
+}
+
+static int jh7110_pwmdac_data_shift_put(struct snd_kcontrol *kcontrol,
+					struct snd_ctl_elem_value *ucontrol)
+{
+	return jh7110_pwmdac_put(kcontrol, ucontrol, PWMDAC_CT_DATA_SHIFT);
+}
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
+	if (dev->shift =3D=3D PWMDAC_SHIFT_8)
+		value &=3D ~JH7110_PWMDAC_SHIFT;
+	else if (dev->shift =3D=3D PWMDAC_SHIFT_10)
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
+	value |=3D (dev->duty_cycle & 0x3) << JH7110_PWMDAC_DUTY_CYCLE_SHIFT;
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
+	value |=3D ((dev->cnt_n - 1) & 0x1ff) << JH7110_PWMDAC_CNT_N_SHIFT;
+
+	jh7110_pwmdac_write_reg(dev->base, JH7110_PWMDAC_CTRL, value);
+}
+
+static void jh7110_pwmdac_set_data_change(struct jh7110_pwmdac_dev *dev)
+{
+	u32 value;
+
+	value =3D jh7110_pwmdac_read_reg(dev->base, JH7110_PWMDAC_CTRL);
+	if (dev->data_change =3D=3D NO_CHANGE)
+		value &=3D ~JH7110_PWMDAC_DATA_CHANGE;
+	else if (dev->data_change =3D=3D CHANGE)
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
+	if (dev->data_mode =3D=3D UNSIGNED_DATA)
+		value &=3D ~JH7110_PWMDAC_DATA_MODE;
+	else if (dev->data_mode =3D=3D INVERTER_DATA_MSB)
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
+	value |=3D (dev->data_shift & 0x7) << JH7110_PWMDAC_DATA_SHIFT_SHIFT;
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
+	unsigned long core_clk_rate;
+	int ret;
+	struct jh7110_pwmdac_dev *dev =3D dev_get_drvdata(dai->dev);
+
+	switch (params_rate(params)) {
+	case 8000:
+		dev->cnt_n =3D PWMDAC_SAMPLE_CNT_3;
+		core_clk_rate =3D 6144000;
+		break;
+	case 11025:
+		dev->cnt_n =3D PWMDAC_SAMPLE_CNT_2;
+		core_clk_rate =3D 5644800;
+		break;
+	case 16000:
+		dev->cnt_n =3D PWMDAC_SAMPLE_CNT_3;
+		core_clk_rate =3D 12288000;
+		break;
+	case 22050:
+		dev->cnt_n =3D PWMDAC_SAMPLE_CNT_1;
+		core_clk_rate =3D 5644800;
+		break;
+	case 32000:
+		dev->cnt_n =3D PWMDAC_SAMPLE_CNT_1;
+		core_clk_rate =3D 8192000;
+		break;
+	case 44100:
+		dev->cnt_n =3D PWMDAC_SAMPLE_CNT_1;
+		core_clk_rate =3D 11289600;
+		break;
+	case 48000:
+		dev->cnt_n =3D PWMDAC_SAMPLE_CNT_1;
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
+	if (ret) {
+		dev_err(dai->dev,
+			"failed to set rate %lu for core clock\n",
+			core_clk_rate);
+		return ret;
+	}
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
+		if (ret) {
+			dev_err(dev->dev, "failed to enable pwmdac clocks\n");
+			return ret;
+		}
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
+	dev->play_dma_data.addr =3D dev->mapbase + JH7110_PWMDAC_WDATA;
+	dev->play_dma_data.addr_width =3D DMA_SLAVE_BUSWIDTH_4_BYTES;
+	dev->play_dma_data.fifo_size =3D 1;
+	dev->play_dma_data.maxburst =3D 16;
+
+	snd_soc_dai_init_dma_data(dai, &dev->play_dma_data, NULL);
+	snd_soc_dai_set_drvdata(dai, dev);
+
+	return 0;
+}
+
+#define JH7110_PWMDAC_ENUM_DECL(xname, xinfo, xget, xput) \
+{	.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER, .name =3D xname, \
+	.info =3D xinfo, .get =3D xget, .put =3D xput,}
+
+static const struct snd_kcontrol_new jh7110_pwmdac_snd_controls[] =3D {
+	JH7110_PWMDAC_ENUM_DECL("shift", jh7110_pwmdac_shift_info,
+				jh7110_pwmdac_shift_get,
+				jh7110_pwmdac_shift_put),
+	JH7110_PWMDAC_ENUM_DECL("duty_cycle", jh7110_pwmdac_duty_cycle_info,
+				jh7110_pwmdac_duty_cycle_get,
+				jh7110_pwmdac_duty_cycle_put),
+	JH7110_PWMDAC_ENUM_DECL("data_change", jh7110_pwmdac_data_change_info,
+				jh7110_pwmdac_data_change_get,
+				jh7110_pwmdac_data_change_put),
+	JH7110_PWMDAC_ENUM_DECL("data_mode", jh7110_pwmdac_data_mode_info,
+				jh7110_pwmdac_data_mode_get,
+				jh7110_pwmdac_data_mode_put),
+	JH7110_PWMDAC_ENUM_DECL("data_shift", jh7110_pwmdac_data_shift_info,
+				jh7110_pwmdac_data_shift_get,
+				jh7110_pwmdac_data_shift_put),
+};
+
+static int jh7110_pwmdac_component_probe(struct snd_soc_component *compo=
nent)
+{
+	snd_soc_add_component_controls(component, jh7110_pwmdac_snd_controls,
+				       ARRAY_SIZE(jh7110_pwmdac_snd_controls));
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
+	.probe		=3D jh7110_pwmdac_component_probe,
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
+	if (ret) {
+		dev_err(&pdev->dev, "failed to get pwmdac clocks\n");
+		return ret;
+	}
+
+	dev->rst_apb =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(dev->rst_apb)) {
+		dev_err(&pdev->dev, "failed to get pwmdac apb reset\n");
+		return PTR_ERR(dev->rst_apb);
+	}
+
+	dev->dev =3D &pdev->dev;
+	dev->shift =3D PWMDAC_SHIFT_8;
+	dev->duty_cycle =3D PWMDAC_CYCLE_CENTER;
+	dev->cnt_n =3D PWMDAC_SAMPLE_CNT_1;
+	dev->data_change =3D NO_CHANGE;
+	dev->data_mode =3D INVERTER_DATA_MSB;
+	dev->data_shift =3D PWMDAC_DATA_LEFT_SHIFT_BIT_0;
+
+	dev_set_drvdata(&pdev->dev, dev);
+	ret =3D devm_snd_soc_register_component(&pdev->dev,
+					      &jh7110_pwmdac_component,
+					      &jh7110_pwmdac_dai, 1);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register dai\n");
+		return ret;
+	}
+
+	ret =3D devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to register pcm\n");
+		return ret;
+	}
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

