Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2C373DE36
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:52:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 245151510;
	Mon, 26 Jun 2023 13:51:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 245151510
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687780344;
	bh=t2iwz8NdocWztQ729MinHyVy3bil+Oor3cmxL6XggpM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I4Y9RU8Njwonj/IQlgfsrUpCWVHOXpyYvJSY4MIHRMzfcf9ZatkGCCheY1VOEaGlS
	 ejT/W0Jw2TnISuz7wNbN6kUQ0R+6si9B1yUG2VI6puainlqzKbWfGBpOjqAoJeH63D
	 8aSbEtTs+kCJWrQdKBQqdJB21DM8V2dLqcOWbPPM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36EBAF806E3; Mon, 26 Jun 2023 13:43:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2E9AF806D8;
	Mon, 26 Jun 2023 13:43:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B4D0F8055B; Mon, 26 Jun 2023 13:09:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8BAF0F80548
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 13:09:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BAF0F80548
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id C230524DEC3;
	Mon, 26 Jun 2023 19:09:12 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 26 Jun
 2023 19:09:12 +0800
Received: from ubuntu.localdomain (113.72.146.167) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 26 Jun
 2023 19:09:11 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Walker
 Chen" <walker.chen@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Hal Feng
	<hal.feng@starfivetech.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/5] ASoC: codecs: Add StarFive JH7110 dummy PWM-DAC
 transmitter driver
Date: Mon, 26 Jun 2023 19:09:06 +0800
Message-ID: <20230626110909.38718-3-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230626110909.38718-1-hal.feng@starfivetech.com>
References: <20230626110909.38718-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [113.72.146.167]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
X-MailFrom: hal.feng@starfivetech.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: N6V5MHQ5ALAHTRVILDPWO5AJXNVXBHJQ
X-Message-ID-Hash: N6V5MHQ5ALAHTRVILDPWO5AJXNVXBHJQ
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:42:26 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N6V5MHQ5ALAHTRVILDPWO5AJXNVXBHJQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a dummy transmitter driver for StarFive JH7110 PWM-DAC module.
StarFive JH7110 PWM-DAC controller uses this driver.

Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 sound/soc/codecs/Kconfig                     |  4 ++
 sound/soc/codecs/Makefile                    |  2 +
 sound/soc/codecs/jh7110_pwmdac_transmitter.c | 74 ++++++++++++++++++++
 3 files changed, 80 insertions(+)
 create mode 100644 sound/soc/codecs/jh7110_pwmdac_transmitter.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 8020097d4e4c..f2cd8f999649 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -115,6 +115,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_IDT821034
 	imply SND_SOC_INNO_RK3036
 	imply SND_SOC_ISABELLE
+	imply SND_SOC_JH7110_PWMDAC_DIT
 	imply SND_SOC_JZ4740_CODEC
 	imply SND_SOC_JZ4725B_CODEC
 	imply SND_SOC_JZ4760_CODEC
@@ -903,6 +904,9 @@ config SND_SOC_CX2072X
 	help
 	  Enable support for Conexant CX20721 and CX20723 codec chips.
=20
+config SND_SOC_JH7110_PWMDAC_DIT
+	tristate "StarFive JH7110 dummy PWM-DAC transmitter"
+
 config SND_SOC_JZ4740_CODEC
 	depends on MACH_INGENIC || COMPILE_TEST
 	depends on OF
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 5cdbae88e6e3..8e0e12d7b959 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -122,6 +122,7 @@ snd-soc-ics43432-objs :=3D ics43432.o
 snd-soc-idt821034-objs :=3D idt821034.o
 snd-soc-inno-rk3036-objs :=3D inno_rk3036.o
 snd-soc-isabelle-objs :=3D isabelle.o
+snd-soc-jh7110-pwmdac-dit-objs :=3D jh7110_pwmdac_transmitter.o
 snd-soc-jz4740-codec-objs :=3D jz4740.o
 snd-soc-jz4725b-codec-objs :=3D jz4725b.o
 snd-soc-jz4760-codec-objs :=3D jz4760.o
@@ -496,6 +497,7 @@ obj-$(CONFIG_SND_SOC_ICS43432)	+=3D snd-soc-ics43432.=
o
 obj-$(CONFIG_SND_SOC_IDT821034)	+=3D snd-soc-idt821034.o
 obj-$(CONFIG_SND_SOC_INNO_RK3036)	+=3D snd-soc-inno-rk3036.o
 obj-$(CONFIG_SND_SOC_ISABELLE)	+=3D snd-soc-isabelle.o
+obj-$(CONFIG_SND_SOC_JH7110_PWMDAC_DIT)	+=3D snd-soc-jh7110-pwmdac-dit.o
 obj-$(CONFIG_SND_SOC_JZ4740_CODEC)	+=3D snd-soc-jz4740-codec.o
 obj-$(CONFIG_SND_SOC_JZ4725B_CODEC)	+=3D snd-soc-jz4725b-codec.o
 obj-$(CONFIG_SND_SOC_JZ4760_CODEC)      +=3D snd-soc-jz4760-codec.o
diff --git a/sound/soc/codecs/jh7110_pwmdac_transmitter.c b/sound/soc/cod=
ecs/jh7110_pwmdac_transmitter.c
new file mode 100644
index 000000000000..69077be840c7
--- /dev/null
+++ b/sound/soc/codecs/jh7110_pwmdac_transmitter.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Dummy PWM-DAC transmitter driver for the StarFive JH7110 SoC
+ *
+ * Copyright (C) 2021-2023 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <sound/initval.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
+
+#define DRV_NAME "pwmdac-dit"
+
+static const struct snd_soc_dapm_widget dit_widgets[] =3D {
+	SND_SOC_DAPM_OUTPUT("pwmdac-out"),
+};
+
+static const struct snd_soc_dapm_route dit_routes[] =3D {
+	{ "pwmdac-out", NULL, "Playback" },
+};
+
+static const struct snd_soc_component_driver soc_codec_pwmdac_dit =3D {
+	.dapm_widgets		=3D dit_widgets,
+	.num_dapm_widgets	=3D ARRAY_SIZE(dit_widgets),
+	.dapm_routes		=3D dit_routes,
+	.num_dapm_routes	=3D ARRAY_SIZE(dit_routes),
+	.idle_bias_on		=3D 1,
+	.use_pmdown_time	=3D 1,
+	.endianness		=3D 1,
+};
+
+static struct snd_soc_dai_driver dit_stub_dai =3D {
+	.name		=3D "pwmdac-dit-hifi",
+	.playback	=3D {
+		.stream_name	=3D "Playback",
+		.channels_min	=3D 1,
+		.channels_max	=3D 384,
+		.rates		=3D SNDRV_PCM_RATE_8000_48000,
+		.formats	=3D SNDRV_PCM_FMTBIT_S16_LE,
+	},
+};
+
+static int pwmdac_dit_probe(struct platform_device *pdev)
+{
+	return devm_snd_soc_register_component(&pdev->dev,
+					       &soc_codec_pwmdac_dit,
+					       &dit_stub_dai, 1);
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id pwmdac_dit_dt_ids[] =3D {
+	{ .compatible =3D "starfive,jh7110-pwmdac-dit", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pwmdac_dit_dt_ids);
+#endif
+
+static struct platform_driver pwmdac_dit_driver =3D {
+	.probe		=3D pwmdac_dit_probe,
+	.driver		=3D {
+		.name	=3D DRV_NAME,
+		.of_match_table =3D of_match_ptr(pwmdac_dit_dt_ids),
+	},
+};
+
+module_platform_driver(pwmdac_dit_driver);
+
+MODULE_DESCRIPTION("StarFive JH7110 dummy PWM-DAC transmitter driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DRV_NAME);
--=20
2.38.1

