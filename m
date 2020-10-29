Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B147529EAB9
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 12:35:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41668950;
	Thu, 29 Oct 2020 12:34:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41668950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603971348;
	bh=XT9w38aER3QfPLW9pOb8M2xMkbYIIZr3urFbQ/dmyNk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oL6tuF9tP0EQcFyfB3CJHRb91iq2BBGxbeSHFH51+3VZKmnXr12K2seKnD1NjvqxG
	 NN1f2gVqgaVGWDRyDKRQnBGRTZ6JTWSchWAZ83AMAyzI+qQpDDsIHrOSTjcdBVOjJ/
	 vYwEaCMb/3Yw8WIjrjnFznvAmVZgZJil5VH0NEEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75F31F80217;
	Thu, 29 Oct 2020 12:34:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F145F8020D; Thu, 29 Oct 2020 12:34:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_78,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
 by alsa1.perex.cz (Postfix) with ESMTP id 30805F800FF
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 12:34:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30805F800FF
Received: from NTHCCAS01.nuvoton.com (nthccas01.nuvoton.com [10.1.8.28])
 by maillog.nuvoton.com (Postfix) with ESMTP id A7E9D1C805D3;
 Thu, 29 Oct 2020 19:33:58 +0800 (CST)
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1847.3; Thu, 29 Oct
 2020 19:33:58 +0800
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (TLS) id 15.0.1130.7; Thu, 29 Oct
 2020 19:33:58 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.1847.3 via Frontend
 Transport; Thu, 29 Oct 2020 19:33:58 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: nau8315: add codec driver
Date: Thu, 29 Oct 2020 19:33:12 +0800
Message-ID: <20201029113311.495413-1-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-NotRedirectTo-PP: TRUE
Cc: alsa-devel@alsa-project.org, WTLI@nuvoton.com, KCHSU0@nuvoton.com,
 lgirdwood@gmail.com, YHCHuang@nuvoton.com, CTLIN0@nuvoton.com
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

Add codec driver for Nuvoton NAU8315.

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
---
 .../devicetree/bindings/sound/nau8315.txt     |  18 ++
 sound/soc/codecs/Kconfig                      |   5 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/nau8315.c                    | 166 ++++++++++++++++++
 4 files changed, 191 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nau8315.txt
 create mode 100644 sound/soc/codecs/nau8315.c

diff --git a/Documentation/devicetree/bindings/sound/nau8315.txt b/Document=
ation/devicetree/bindings/sound/nau8315.txt
new file mode 100644
index 000000000000..6eaec46f384c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nau8315.txt
@@ -0,0 +1,18 @@
+Nuvoton NAU8315 Mono Class-D Amplifier
+
+Required properties:
+- compatible   : "nuvoton,nau8315"
+
+Optional properties:
+- enable-gpios : GPIO specifier for the chip's device enable input(EN) pin=
.
+        If this option is not specified then driver does not manage
+        the pin state (e.g. chip is always on).
+
+Example:
+
+#include <dt-bindings/gpio/gpio.h>
+
+nau8315 {
+       compatible =3D "nuvoton,nau8315";
+       enable-gpios =3D <&gpio1 5 GPIO_ACTIVE_HIGH>;
+};
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 5791b7056af6..2b6eceb3573c 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -130,6 +130,7 @@ config SND_SOC_ALL_CODECS
        imply SND_SOC_MT6358
        imply SND_SOC_MT6359
        imply SND_SOC_MT6660
+       imply SND_SOC_NAU8315
        imply SND_SOC_NAU8540
        imply SND_SOC_NAU8810
        imply SND_SOC_NAU8822
@@ -1760,6 +1761,10 @@ config SND_SOC_MT6660
          Select N if you don't have MT6660 on board.
          Select M to build this as module.

+config SND_SOC_NAU8315
+       tristate "Nuvoton Technology Corporation NAU8315 CODEC"
+       depends on GPIOLIB
+
 config SND_SOC_NAU8540
        tristate "Nuvoton Technology Corporation NAU85L40 CODEC"
        depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 11ce98c25d6c..144d9256d4d5 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -129,6 +129,7 @@ snd-soc-mt6351-objs :=3D mt6351.o
 snd-soc-mt6358-objs :=3D mt6358.o
 snd-soc-mt6359-objs :=3D mt6359.o
 snd-soc-mt6660-objs :=3D mt6660.o
+snd-soc-nau8315-objs :=3D nau8315.o
 snd-soc-nau8540-objs :=3D nau8540.o
 snd-soc-nau8810-objs :=3D nau8810.o
 snd-soc-nau8822-objs :=3D nau8822.o
@@ -438,6 +439,7 @@ obj-$(CONFIG_SND_SOC_MT6351)        +=3D snd-soc-mt6351=
.o
 obj-$(CONFIG_SND_SOC_MT6358)   +=3D snd-soc-mt6358.o
 obj-$(CONFIG_SND_SOC_MT6359)   +=3D snd-soc-mt6359.o
 obj-$(CONFIG_SND_SOC_MT6660)   +=3D snd-soc-mt6660.o
+obj-$(CONFIG_SND_SOC_NAU8315)   +=3D snd-soc-nau8315.o
 obj-$(CONFIG_SND_SOC_NAU8540)   +=3D snd-soc-nau8540.o
 obj-$(CONFIG_SND_SOC_NAU8810)   +=3D snd-soc-nau8810.o
 obj-$(CONFIG_SND_SOC_NAU8822)   +=3D snd-soc-nau8822.o
diff --git a/sound/soc/codecs/nau8315.c b/sound/soc/codecs/nau8315.c
new file mode 100644
index 000000000000..e6bc5c0a5036
--- /dev/null
+++ b/sound/soc/codecs/nau8315.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// nau8315.c  --  NAU8315 ALSA SoC Audio Amplifier Driver
+//
+// Copyright 2020 Nuvoton Technology Crop.
+//
+// Author: David Lin <ctlin0@nuvoton.com>
+//
+// Based on MAX98357A.c
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+#include <sound/soc-dapm.h>
+
+struct nau8315_priv {
+       struct gpio_desc *enable;
+       int enpin_switch;
+};
+
+static int nau8315_daiops_trigger(struct snd_pcm_substream *substream,
+               int cmd, struct snd_soc_dai *dai)
+{
+       struct snd_soc_component *component =3D dai->component;
+       struct nau8315_priv *nau8315 =3D
+               snd_soc_component_get_drvdata(component);
+
+       if (!nau8315->enable)
+               return 0;
+
+       switch (cmd) {
+       case SNDRV_PCM_TRIGGER_START:
+       case SNDRV_PCM_TRIGGER_RESUME:
+       case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+               if (nau8315->enpin_switch) {
+                       gpiod_set_value(nau8315->enable, 1);
+                       dev_dbg(component->dev, "set enable to 1");
+               }
+               break;
+       case SNDRV_PCM_TRIGGER_STOP:
+       case SNDRV_PCM_TRIGGER_SUSPEND:
+       case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+               gpiod_set_value(nau8315->enable, 0);
+               dev_dbg(component->dev, "set enable to 0");
+               break;
+       }
+
+       return 0;
+}
+
+static int nau8315_enpin_event(struct snd_soc_dapm_widget *w,
+               struct snd_kcontrol *kcontrol, int event)
+{
+       struct snd_soc_component *component =3D
+               snd_soc_dapm_to_component(w->dapm);
+       struct nau8315_priv *nau8315 =3D
+               snd_soc_component_get_drvdata(component);
+
+       if (event & SND_SOC_DAPM_POST_PMU)
+               nau8315->enpin_switch =3D 1;
+       else if (event & SND_SOC_DAPM_POST_PMD)
+               nau8315->enpin_switch =3D 0;
+
+       return 0;
+}
+
+static const struct snd_soc_dapm_widget nau8315_dapm_widgets[] =3D {
+       SND_SOC_DAPM_OUTPUT("Speaker"),
+       SND_SOC_DAPM_OUT_DRV_E("EN_Pin", SND_SOC_NOPM, 0, 0, NULL, 0,
+                       nau8315_enpin_event,
+                       SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_POST_PMD),
+};
+
+static const struct snd_soc_dapm_route nau8315_dapm_routes[] =3D {
+       {"EN_Pin", NULL, "HiFi Playback"},
+       {"Speaker", NULL, "EN_Pin"},
+};
+
+static const struct snd_soc_component_driver nau8315_component_driver =3D =
{
+       .dapm_widgets           =3D nau8315_dapm_widgets,
+       .num_dapm_widgets       =3D ARRAY_SIZE(nau8315_dapm_widgets),
+       .dapm_routes            =3D nau8315_dapm_routes,
+       .num_dapm_routes        =3D ARRAY_SIZE(nau8315_dapm_routes),
+       .idle_bias_on           =3D 1,
+       .use_pmdown_time        =3D 1,
+       .endianness             =3D 1,
+       .non_legacy_dai_naming  =3D 1,
+};
+
+static const struct snd_soc_dai_ops nau8315_dai_ops =3D {
+       .trigger        =3D nau8315_daiops_trigger,
+};
+
+#define NAU8315_RATES SNDRV_PCM_RATE_8000_96000
+#define NAU8315_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_3L=
E)
+
+static struct snd_soc_dai_driver nau8315_dai_driver =3D {
+       .name =3D "nau8315-hifi",
+       .playback =3D {
+               .stream_name    =3D "HiFi Playback",
+               .formats        =3D NAU8315_FORMATS,
+               .rates          =3D NAU8315_RATES,
+               .channels_min   =3D 1,
+               .channels_max   =3D 2,
+       },
+       .ops    =3D &nau8315_dai_ops,
+};
+
+static int nau8315_platform_probe(struct platform_device *pdev)
+{
+       struct nau8315_priv *nau8315;
+
+       nau8315 =3D devm_kzalloc(&pdev->dev, sizeof(*nau8315), GFP_KERNEL);
+       if (!nau8315)
+               return -ENOMEM;
+
+       nau8315->enable =3D devm_gpiod_get_optional(&pdev->dev,
+                               "enable", GPIOD_OUT_LOW);
+       if (IS_ERR(nau8315->enable))
+               return PTR_ERR(nau8315->enable);
+
+       dev_set_drvdata(&pdev->dev, nau8315);
+
+       return devm_snd_soc_register_component(&pdev->dev,
+                       &nau8315_component_driver,
+                       &nau8315_dai_driver, 1);
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id nau8315_device_id[] =3D {
+       { .compatible =3D "nuvoton,nau8315" },
+       {}
+};
+MODULE_DEVICE_TABLE(of, nau8315_device_id);
+#endif
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id nau8315_acpi_match[] =3D {
+       { "NVTN2010", 0 },
+       {},
+};
+MODULE_DEVICE_TABLE(acpi, nau8315_acpi_match);
+#endif
+
+static struct platform_driver nau8315_platform_driver =3D {
+       .driver =3D {
+               .name =3D "nau8315",
+               .of_match_table =3D of_match_ptr(nau8315_device_id),
+               .acpi_match_table =3D ACPI_PTR(nau8315_acpi_match),
+       },
+       .probe  =3D nau8315_platform_probe,
+};
+module_platform_driver(nau8315_platform_driver);
+
+MODULE_DESCRIPTION("ASoC NAU8315 Mono Class-D Amplifier Driver");
+MODULE_AUTHOR("David Lin <ctlin0@nuvoton.com>");
+MODULE_LICENSE("GPL v2");
--
2.25.1



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email to such a person, please kindly reply to=
 the sender indicating this fact and delete all copies of it from your comp=
uter and network server immediately. Your cooperation is highly appreciated=
. It is advised that any unauthorized use of confidential information of Nu=
voton is strictly prohibited; and any information in this email irrelevant =
to the official business of Nuvoton shall be deemed as neither given nor en=
dorsed by Nuvoton.
