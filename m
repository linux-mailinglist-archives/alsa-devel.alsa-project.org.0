Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E5488410
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 22:30:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D53701668;
	Fri,  9 Aug 2019 22:30:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D53701668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565382657;
	bh=N4W24mIbHzaVni2pfhkVPsBdNE7KSOY4c31OdG1H4AA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JvZQOOeMK13y4li1lhauHrOUWPsgxeCshzaKd5SolQjLOk4v9xlNjg6xaXvoI6J5+
	 5KmJYndbjbTD0XI6cqyp48Vedr1fnJ0FEpcD9cXtqmwTSYhz9mk1cfGs7kqOXTVK/P
	 cTRuKfSon5J5wdIC3XIQX5JwrMxF8im2uOcNDdE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9CA3F805A8;
	Fri,  9 Aug 2019 22:28:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA105F804AB; Fri,  9 Aug 2019 22:28:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24757F804AB
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 22:28:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24757F804AB
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MeTwa-1iU8oE1gWa-00aSd6; Fri, 09 Aug 2019 22:28:46 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: soc@kernel.org
Date: Fri,  9 Aug 2019 22:27:36 +0200
Message-Id: <20190809202749.742267-9-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190809202749.742267-1-arnd@arndb.de>
References: <20190809202749.742267-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:ts85G1TOzezu2/A4EeIAJfnG7e4SzYrCCtrBZoqZdNnwjRmm4HT
 JtRP4xfGqRnxKxYPuy2YCeMvUxdDsMznR6U3DCf3O03rsPKAdmWGKwhnsylekNIDC2Oq6S2
 MM7T3aWJfhlU6fcZjubcEu81N1opZIm64tByAbc/6gtJMWAyM8Ml3vXXChaJU7LhhPLy9e1
 u/sZTBwb+6km0APWFk+lQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:x19icWnEGwU=:IPHhlV8GsIolZzPSZ2bFu5
 PzG/h64+fo1Rtc6PL85HZ+6VdziP0aIP6OShjNSTzGgYr/EIdKuFarNtxbOThtzdUNKrJmlzN
 yDLxtJO4Gqu3yUY8+XCOTEMKlvm4BX6Zz0OqnUCR04e9aCyDHQEGHgBcVkGN/QwCH84VDQBff
 Vn6sMmPGB3wGXQZi/kc5HLNPqONyXyuf7E6xemeXDPHoSX9T7aHMsFFLsaZeb41wVGr8xS9U5
 S9uyD3ruwetXxObi+IIYbIhV4B1lQg674RxUWNIGCDf6aMNCB9Aff+DdCCm8WfE3Jheo7w9ZN
 MSKqIUbDLlXCFEXyGV1f5rLfARqDV1N92KaTrPXit3icq3FfUG9j/A05gKHxJ+7rZrQMs7nIO
 JnIVonM0g7CXAzdxvJ9jEw1emsdP4qK/j8j8iDX0vj4com4ziJ6zx1wWyM5pHUx9VaeY7Eyr7
 xpag5VcWDm4H1ky81BA3qFnK+2s8txQw6JzfPLKBNSHGqB3chutV2ll2JckfKvNYZesadJgcU
 /2sU1ukMXCV0q6pBEtpiI6TPhZEHwJFj6ESfU2VbEtCfkVMh7Uk6dS7v66EEys6HNOoXdcYNS
 oBOVN3Gazl41vTmyBEIXEHtZ9C/9OrKq75a4159enBvKHGvI5FimZxLAw8t16v+tZ4MClicTM
 G3bPPYLC+5aYoSv1GKlL2lCS/t22QDUZ+QwaFSdpmkRJCZ4PZ41+UseozHjx/oLArLsUJwZ8I
 bg5R3YQQlrP5JiO4aWqdTcfAGbWqty926qlyjw==
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH 08/16] ASoC: remove w90x900/nuc900 platform
	drivers
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

The ARM w90x900 platform is getting removed, so this driver is obsolete.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/Kconfig               |   1 -
 sound/soc/Makefile              |   1 -
 sound/soc/nuc900/Kconfig        |  29 ---
 sound/soc/nuc900/Makefile       |  12 -
 sound/soc/nuc900/nuc900-ac97.c  | 391 --------------------------------
 sound/soc/nuc900/nuc900-audio.c |  73 ------
 sound/soc/nuc900/nuc900-audio.h | 108 ---------
 sound/soc/nuc900/nuc900-pcm.c   | 321 --------------------------
 8 files changed, 936 deletions(-)
 delete mode 100644 sound/soc/nuc900/Kconfig
 delete mode 100644 sound/soc/nuc900/Makefile
 delete mode 100644 sound/soc/nuc900/nuc900-ac97.c
 delete mode 100644 sound/soc/nuc900/nuc900-audio.c
 delete mode 100644 sound/soc/nuc900/nuc900-audio.h
 delete mode 100644 sound/soc/nuc900/nuc900-pcm.c

diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
index dc86e4073001..bdc305cece6e 100644
--- a/sound/soc/Kconfig
+++ b/sound/soc/Kconfig
@@ -51,7 +51,6 @@ source "sound/soc/dwc/Kconfig"
 source "sound/soc/fsl/Kconfig"
 source "sound/soc/hisilicon/Kconfig"
 source "sound/soc/jz4740/Kconfig"
-source "sound/soc/nuc900/Kconfig"
 source "sound/soc/kirkwood/Kconfig"
 source "sound/soc/img/Kconfig"
 source "sound/soc/intel/Kconfig"
diff --git a/sound/soc/Makefile b/sound/soc/Makefile
index d90ce8a32887..3fe3e7f3b7d5 100644
--- a/sound/soc/Makefile
+++ b/sound/soc/Makefile
@@ -39,7 +39,6 @@ obj-$(CONFIG_SND_SOC)	+= intel/
 obj-$(CONFIG_SND_SOC)	+= mediatek/
 obj-$(CONFIG_SND_SOC)	+= meson/
 obj-$(CONFIG_SND_SOC)	+= mxs/
-obj-$(CONFIG_SND_SOC)	+= nuc900/
 obj-$(CONFIG_SND_SOC)	+= kirkwood/
 obj-$(CONFIG_SND_SOC)	+= pxa/
 obj-$(CONFIG_SND_SOC)	+= qcom/
diff --git a/sound/soc/nuc900/Kconfig b/sound/soc/nuc900/Kconfig
deleted file mode 100644
index e1b22fbcb159..000000000000
--- a/sound/soc/nuc900/Kconfig
+++ /dev/null
@@ -1,29 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-##
-## NUC900 series AC97 API
-##
-config SND_SOC_NUC900
-	tristate "SoC Audio for NUC900 series"
-	depends on ARCH_W90X900
-	select SND_SOC_NUC900_AC97
-	help
-	  This option enables support for AC97 mode on the NUC900 SoC.
-
-config SND_SOC_NUC900_AC97
-	tristate
-	select AC97_BUS
-	select SND_AC97_CODEC
-	select SND_SOC_AC97_BUS
-
-
-##
-## Boards
-##
-config SND_SOC_NUC900EVB
-	tristate "NUC900 AC97 support for demo board"
-	depends on SND_SOC_NUC900
-	select SND_SOC_NUC900_AC97
-	select SND_SOC_AC97_CODEC
-	help
-	  Select this option to enable audio (AC97) on the
-	  NUC900 demoboard.
diff --git a/sound/soc/nuc900/Makefile b/sound/soc/nuc900/Makefile
deleted file mode 100644
index c7ba2b9549d2..000000000000
--- a/sound/soc/nuc900/Makefile
+++ /dev/null
@@ -1,12 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-# NUC900 series audio
-snd-soc-nuc900-pcm-objs := nuc900-pcm.o
-snd-soc-nuc900-ac97-objs := nuc900-ac97.o
-
-obj-$(CONFIG_SND_SOC_NUC900) += snd-soc-nuc900-pcm.o
-obj-$(CONFIG_SND_SOC_NUC900_AC97) += snd-soc-nuc900-ac97.o
-
-# Boards
-snd-soc-nuc900-audio-objs := nuc900-audio.o
-
-obj-$(CONFIG_SND_SOC_NUC900EVB) += snd-soc-nuc900-audio.o
diff --git a/sound/soc/nuc900/nuc900-ac97.c b/sound/soc/nuc900/nuc900-ac97.c
deleted file mode 100644
index 5f2e5c069377..000000000000
--- a/sound/soc/nuc900/nuc900-ac97.c
+++ /dev/null
@@ -1,391 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2009-2010 Nuvoton technology corporation.
- *
- * Wan ZongShun <mcuos.com@gmail.com>
- */
-
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/slab.h>
-#include <linux/device.h>
-#include <linux/delay.h>
-#include <linux/mutex.h>
-#include <linux/suspend.h>
-#include <sound/core.h>
-#include <sound/pcm.h>
-#include <sound/initval.h>
-#include <sound/soc.h>
-#include <linux/clk.h>
-
-#include <mach/mfp.h>
-
-#include "nuc900-audio.h"
-
-static DEFINE_MUTEX(ac97_mutex);
-struct nuc900_audio *nuc900_ac97_data;
-EXPORT_SYMBOL_GPL(nuc900_ac97_data);
-
-static int nuc900_checkready(void)
-{
-	struct nuc900_audio *nuc900_audio = nuc900_ac97_data;
-
-	if (!(AUDIO_READ(nuc900_audio->mmio + ACTL_ACIS0) & CODEC_READY))
-		return -EPERM;
-
-	return 0;
-}
-
-/* AC97 controller reads codec register */
-static unsigned short nuc900_ac97_read(struct snd_ac97 *ac97,
-					unsigned short reg)
-{
-	struct nuc900_audio *nuc900_audio = nuc900_ac97_data;
-	unsigned long timeout = 0x10000, val;
-
-	mutex_lock(&ac97_mutex);
-
-	val = nuc900_checkready();
-	if (val) {
-		dev_err(nuc900_audio->dev, "AC97 codec is not ready\n");
-		goto out;
-	}
-
-	/* set the R_WB bit and write register index */
-	AUDIO_WRITE(nuc900_audio->mmio + ACTL_ACOS1, R_WB | reg);
-
-	/* set the valid frame bit and valid slots */
-	val = AUDIO_READ(nuc900_audio->mmio + ACTL_ACOS0);
-	val |= (VALID_FRAME | SLOT1_VALID);
-	AUDIO_WRITE(nuc900_audio->mmio + ACTL_ACOS0, val);
-
-	udelay(100);
-
-	/* polling the AC_R_FINISH */
-	while (!(AUDIO_READ(nuc900_audio->mmio + ACTL_ACCON) & AC_R_FINISH)
-								&& --timeout)
-		mdelay(1);
-
-	if (!timeout) {
-		dev_err(nuc900_audio->dev, "AC97 read register time out !\n");
-		val = -EPERM;
-		goto out;
-	}
-
-	val = AUDIO_READ(nuc900_audio->mmio + ACTL_ACOS0) ;
-	val &= ~SLOT1_VALID;
-	AUDIO_WRITE(nuc900_audio->mmio + ACTL_ACOS0, val);
-
-	if (AUDIO_READ(nuc900_audio->mmio + ACTL_ACIS1) >> 2 != reg) {
-		dev_err(nuc900_audio->dev,
-				"R_INDEX of REG_ACTL_ACIS1 not match!\n");
-	}
-
-	udelay(100);
-	val = (AUDIO_READ(nuc900_audio->mmio + ACTL_ACIS2) & 0xFFFF);
-
-out:
-	mutex_unlock(&ac97_mutex);
-	return val;
-}
-
-/* AC97 controller writes to codec register */
-static void nuc900_ac97_write(struct snd_ac97 *ac97, unsigned short reg,
-				unsigned short val)
-{
-	struct nuc900_audio *nuc900_audio = nuc900_ac97_data;
-	unsigned long tmp, timeout = 0x10000;
-
-	mutex_lock(&ac97_mutex);
-
-	tmp = nuc900_checkready();
-	if (tmp)
-		dev_err(nuc900_audio->dev, "AC97 codec is not ready\n");
-
-	/* clear the R_WB bit and write register index */
-	AUDIO_WRITE(nuc900_audio->mmio + ACTL_ACOS1, reg);
-
-	/* write register value */
-	AUDIO_WRITE(nuc900_audio->mmio + ACTL_ACOS2, val);
-
-	/* set the valid frame bit and valid slots */
-	tmp = AUDIO_READ(nuc900_audio->mmio + ACTL_ACOS0);
-	tmp |= SLOT1_VALID | SLOT2_VALID | VALID_FRAME;
-	AUDIO_WRITE(nuc900_audio->mmio + ACTL_ACOS0, tmp);
-
-	udelay(100);
-
-	/* polling the AC_W_FINISH */
-	while ((AUDIO_READ(nuc900_audio->mmio + ACTL_ACCON) & AC_W_FINISH)
-								&& --timeout)
-		mdelay(1);
-
-	if (!timeout)
-		dev_err(nuc900_audio->dev, "AC97 write register time out !\n");
-
-	tmp = AUDIO_READ(nuc900_audio->mmio + ACTL_ACOS0);
-	tmp &= ~(SLOT1_VALID | SLOT2_VALID);
-	AUDIO_WRITE(nuc900_audio->mmio + ACTL_ACOS0, tmp);
-
-	mutex_unlock(&ac97_mutex);
-
-}
-
-static void nuc900_ac97_warm_reset(struct snd_ac97 *ac97)
-{
-	struct nuc900_audio *nuc900_audio = nuc900_ac97_data;
-	unsigned long val;
-
-	mutex_lock(&ac97_mutex);
-
-	/* warm reset AC 97 */
-	val = AUDIO_READ(nuc900_audio->mmio + ACTL_ACCON);
-	val |= AC_W_RES;
-	AUDIO_WRITE(nuc900_audio->mmio + ACTL_ACCON, val);
-
-	udelay(100);
-
-	val = nuc900_checkready();
-	if (val)
-		dev_err(nuc900_audio->dev, "AC97 codec is not ready\n");
-
-	mutex_unlock(&ac97_mutex);
-}
-
-static void nuc900_ac97_cold_reset(struct snd_ac97 *ac97)
-{
-	struct nuc900_audio *nuc900_audio = nuc900_ac97_data;
-	unsigned long val;
-
-	mutex_lock(&ac97_mutex);
-
-	/* reset Audio Controller */
-	val = AUDIO_READ(nuc900_audio->mmio + ACTL_RESET);
-	val |= ACTL_RESET_BIT;
-	AUDIO_WRITE(nuc900_audio->mmio + ACTL_RESET, val);
-
-	val = AUDIO_READ(nuc900_audio->mmio + ACTL_RESET);
-	val &= (~ACTL_RESET_BIT);
-	AUDIO_WRITE(nuc900_audio->mmio + ACTL_RESET, val);
-
-	/* reset AC-link interface */
-
-	val = AUDIO_READ(nuc900_audio->mmio + ACTL_RESET);
-	val |= AC_RESET;
-	AUDIO_WRITE(nuc900_audio->mmio + ACTL_RESET, val);
-
-	val = AUDIO_READ(nuc900_audio->mmio + ACTL_RESET);
-	val &= ~AC_RESET;
-	AUDIO_WRITE(nuc900_audio->mmio + ACTL_RESET, val);
-
-	/* cold reset AC 97 */
-	val = AUDIO_READ(nuc900_audio->mmio + ACTL_ACCON);
-	val |= AC_C_RES;
-	AUDIO_WRITE(nuc900_audio->mmio + ACTL_ACCON, val);
-
-	val = AUDIO_READ(nuc900_audio->mmio + ACTL_ACCON);
-	val &= (~AC_C_RES);
-	AUDIO_WRITE(nuc900_audio->mmio + ACTL_ACCON, val);
-
-	udelay(100);
-
-	mutex_unlock(&ac97_mutex);
-
-}
-
-/* AC97 controller operations */
-static struct snd_ac97_bus_ops nuc900_ac97_ops = {
-	.read		= nuc900_ac97_read,
-	.write		= nuc900_ac97_write,
-	.reset		= nuc900_ac97_cold_reset,
-	.warm_reset	= nuc900_ac97_warm_reset,
-};
-
-static int nuc900_ac97_trigger(struct snd_pcm_substream *substream,
-				int cmd, struct snd_soc_dai *dai)
-{
-	struct nuc900_audio *nuc900_audio = nuc900_ac97_data;
-	int ret;
-	unsigned long val, tmp;
-
-	ret = 0;
-
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
-	case SNDRV_PCM_TRIGGER_RESUME:
-		val = AUDIO_READ(nuc900_audio->mmio + ACTL_RESET);
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			tmp = AUDIO_READ(nuc900_audio->mmio + ACTL_ACOS0);
-			tmp |= (SLOT3_VALID | SLOT4_VALID | VALID_FRAME);
-			AUDIO_WRITE(nuc900_audio->mmio + ACTL_ACOS0, tmp);
-
-			tmp = AUDIO_READ(nuc900_audio->mmio + ACTL_PSR);
-			tmp |= (P_DMA_END_IRQ | P_DMA_MIDDLE_IRQ);
-			AUDIO_WRITE(nuc900_audio->mmio + ACTL_PSR, tmp);
-			val |= AC_PLAY;
-		} else {
-			tmp = AUDIO_READ(nuc900_audio->mmio + ACTL_RSR);
-			tmp |= (R_DMA_END_IRQ | R_DMA_MIDDLE_IRQ);
-
-			AUDIO_WRITE(nuc900_audio->mmio + ACTL_RSR, tmp);
-			val |= AC_RECORD;
-		}
-
-		AUDIO_WRITE(nuc900_audio->mmio + ACTL_RESET, val);
-
-		break;
-	case SNDRV_PCM_TRIGGER_STOP:
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-		val = AUDIO_READ(nuc900_audio->mmio + ACTL_RESET);
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			tmp = AUDIO_READ(nuc900_audio->mmio + ACTL_ACOS0);
-			tmp &= ~(SLOT3_VALID | SLOT4_VALID);
-			AUDIO_WRITE(nuc900_audio->mmio + ACTL_ACOS0, tmp);
-
-			AUDIO_WRITE(nuc900_audio->mmio + ACTL_PSR, RESET_PRSR);
-			val &= ~AC_PLAY;
-		} else {
-			AUDIO_WRITE(nuc900_audio->mmio + ACTL_RSR, RESET_PRSR);
-			val &= ~AC_RECORD;
-		}
-
-		AUDIO_WRITE(nuc900_audio->mmio + ACTL_RESET, val);
-
-		break;
-	default:
-		ret = -EINVAL;
-	}
-
-	return ret;
-}
-
-static int nuc900_ac97_probe(struct snd_soc_dai *dai)
-{
-	struct nuc900_audio *nuc900_audio = nuc900_ac97_data;
-	unsigned long val;
-
-	mutex_lock(&ac97_mutex);
-
-	/* enable unit clock */
-	clk_enable(nuc900_audio->clk);
-
-	/* enable audio controller and AC-link interface */
-	val = AUDIO_READ(nuc900_audio->mmio + ACTL_CON);
-	val |= (IIS_AC_PIN_SEL | ACLINK_EN);
-	AUDIO_WRITE(nuc900_audio->mmio + ACTL_CON, val);
-
-	mutex_unlock(&ac97_mutex);
-
-	return 0;
-}
-
-static int nuc900_ac97_remove(struct snd_soc_dai *dai)
-{
-	struct nuc900_audio *nuc900_audio = nuc900_ac97_data;
-
-	clk_disable(nuc900_audio->clk);
-	return 0;
-}
-
-static const struct snd_soc_dai_ops nuc900_ac97_dai_ops = {
-	.trigger	= nuc900_ac97_trigger,
-};
-
-static struct snd_soc_dai_driver nuc900_ac97_dai = {
-	.probe			= nuc900_ac97_probe,
-	.remove			= nuc900_ac97_remove,
-	.bus_control		= true,
-	.playback = {
-		.rates		= SNDRV_PCM_RATE_8000_48000,
-		.formats	= SNDRV_PCM_FMTBIT_S16_LE,
-		.channels_min	= 1,
-		.channels_max	= 2,
-	},
-	.capture = {
-		.rates		= SNDRV_PCM_RATE_8000_48000,
-		.formats	= SNDRV_PCM_FMTBIT_S16_LE,
-		.channels_min	= 1,
-		.channels_max	= 2,
-	},
-	.ops = &nuc900_ac97_dai_ops,
-};
-
-static const struct snd_soc_component_driver nuc900_ac97_component = {
-	.name		= "nuc900-ac97",
-};
-
-static int nuc900_ac97_drvprobe(struct platform_device *pdev)
-{
-	struct nuc900_audio *nuc900_audio;
-	int ret;
-
-	if (nuc900_ac97_data)
-		return -EBUSY;
-
-	nuc900_audio = devm_kzalloc(&pdev->dev, sizeof(struct nuc900_audio),
-				    GFP_KERNEL);
-	if (!nuc900_audio)
-		return -ENOMEM;
-
-	spin_lock_init(&nuc900_audio->lock);
-
-	nuc900_audio->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	nuc900_audio->mmio = devm_ioremap_resource(&pdev->dev,
-						   nuc900_audio->res);
-	if (IS_ERR(nuc900_audio->mmio))
-		return PTR_ERR(nuc900_audio->mmio);
-
-	nuc900_audio->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(nuc900_audio->clk)) {
-		ret = PTR_ERR(nuc900_audio->clk);
-		goto out;
-	}
-
-	ret = platform_get_irq(pdev, 0);
-	if (ret < 0)
-		goto out;
-	nuc900_audio->irq_num = ret;
-
-	nuc900_ac97_data = nuc900_audio;
-
-	ret = snd_soc_set_ac97_ops(&nuc900_ac97_ops);
-	if (ret)
-		goto out;
-
-	ret = devm_snd_soc_register_component(&pdev->dev, &nuc900_ac97_component,
-					 &nuc900_ac97_dai, 1);
-	if (ret)
-		goto out;
-
-	/* enbale ac97 multifunction pin */
-	mfp_set_groupg(nuc900_audio->dev, NULL);
-
-	return 0;
-
-out:
-	snd_soc_set_ac97_ops(NULL);
-	return ret;
-}
-
-static int nuc900_ac97_drvremove(struct platform_device *pdev)
-{
-	nuc900_ac97_data = NULL;
-	snd_soc_set_ac97_ops(NULL);
-
-	return 0;
-}
-
-static struct platform_driver nuc900_ac97_driver = {
-	.driver	= {
-		.name	= "nuc900-ac97",
-	},
-	.probe		= nuc900_ac97_drvprobe,
-	.remove		= nuc900_ac97_drvremove,
-};
-
-module_platform_driver(nuc900_ac97_driver);
-
-MODULE_AUTHOR("Wan ZongShun <mcuos.com@gmail.com>");
-MODULE_DESCRIPTION("NUC900 AC97 SoC driver!");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:nuc900-ac97");
diff --git a/sound/soc/nuc900/nuc900-audio.c b/sound/soc/nuc900/nuc900-audio.c
deleted file mode 100644
index 19146690d514..000000000000
--- a/sound/soc/nuc900/nuc900-audio.c
+++ /dev/null
@@ -1,73 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2010 Nuvoton technology corporation.
- *
- * Wan ZongShun <mcuos.com@gmail.com>
- */
-
-#include <linux/module.h>
-#include <linux/moduleparam.h>
-#include <linux/timer.h>
-#include <linux/interrupt.h>
-#include <linux/platform_device.h>
-
-#include <sound/core.h>
-#include <sound/pcm.h>
-#include <sound/soc.h>
-
-#include "nuc900-audio.h"
-
-SND_SOC_DAILINK_DEFS(ac97,
-	DAILINK_COMP_ARRAY(COMP_CPU("nuc900-ac97")),
-	DAILINK_COMP_ARRAY(COMP_CODEC("ac97-codec", "ac97-hifi")),
-	DAILINK_COMP_ARRAY(COMP_PLATFORM("nuc900-pcm-audio")));
-
-static struct snd_soc_dai_link nuc900evb_ac97_dai = {
-	.name		= "AC97",
-	.stream_name	= "AC97 HiFi",
-	SND_SOC_DAILINK_REG(ac97),
-};
-
-static struct snd_soc_card nuc900evb_audio_machine = {
-	.name		= "NUC900EVB_AC97",
-	.owner		= THIS_MODULE,
-	.dai_link	= &nuc900evb_ac97_dai,
-	.num_links	= 1,
-};
-
-static struct platform_device *nuc900evb_asoc_dev;
-
-static int __init nuc900evb_audio_init(void)
-{
-	int ret;
-
-	ret = -ENOMEM;
-	nuc900evb_asoc_dev = platform_device_alloc("soc-audio", -1);
-	if (!nuc900evb_asoc_dev)
-		goto out;
-
-	/* nuc900 board audio device */
-	platform_set_drvdata(nuc900evb_asoc_dev, &nuc900evb_audio_machine);
-
-	ret = platform_device_add(nuc900evb_asoc_dev);
-
-	if (ret) {
-		platform_device_put(nuc900evb_asoc_dev);
-		nuc900evb_asoc_dev = NULL;
-	}
-
-out:
-	return ret;
-}
-
-static void __exit nuc900evb_audio_exit(void)
-{
-	platform_device_unregister(nuc900evb_asoc_dev);
-}
-
-module_init(nuc900evb_audio_init);
-module_exit(nuc900evb_audio_exit);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("NUC900 Series ASoC audio support");
-MODULE_AUTHOR("Wan ZongShun");
diff --git a/sound/soc/nuc900/nuc900-audio.h b/sound/soc/nuc900/nuc900-audio.h
deleted file mode 100644
index 90ffa7bbce01..000000000000
--- a/sound/soc/nuc900/nuc900-audio.h
+++ /dev/null
@@ -1,108 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2010 Nuvoton technology corporation.
- *
- * Wan ZongShun <mcuos.com@gmail.com>
- */
-
-#ifndef _NUC900_AUDIO_H
-#define _NUC900_AUDIO_H
-
-#include <linux/io.h>
-
-/* Audio Control Registers */
-#define ACTL_CON		0x00
-#define ACTL_RESET		0x04
-#define ACTL_RDSTB		0x08
-#define ACTL_RDST_LENGTH	0x0C
-#define ACTL_RDSTC		0x10
-#define ACTL_RSR		0x14
-#define ACTL_PDSTB		0x18
-#define ACTL_PDST_LENGTH	0x1C
-#define ACTL_PDSTC		0x20
-#define ACTL_PSR		0x24
-#define ACTL_IISCON		0x28
-#define ACTL_ACCON		0x2C
-#define ACTL_ACOS0		0x30
-#define ACTL_ACOS1		0x34
-#define ACTL_ACOS2		0x38
-#define ACTL_ACIS0		0x3C
-#define ACTL_ACIS1		0x40
-#define ACTL_ACIS2		0x44
-#define ACTL_COUNTER		0x48
-
-/* bit definition of REG_ACTL_CON register */
-#define R_DMA_IRQ		0x1000
-#define T_DMA_IRQ		0x0800
-#define IIS_AC_PIN_SEL		0x0100
-#define FIFO_TH			0x0080
-#define ADC_EN			0x0010
-#define M80_EN			0x0008
-#define ACLINK_EN		0x0004
-#define IIS_EN			0x0002
-
-/* bit definition of REG_ACTL_RESET register */
-#define W5691_PLAY		0x20000
-#define ACTL_RESET_BIT		0x10000
-#define RECORD_RIGHT_CHNNEL	0x08000
-#define RECORD_LEFT_CHNNEL	0x04000
-#define PLAY_RIGHT_CHNNEL	0x02000
-#define PLAY_LEFT_CHNNEL	0x01000
-#define DAC_PLAY		0x00800
-#define ADC_RECORD		0x00400
-#define M80_PLAY		0x00200
-#define AC_RECORD		0x00100
-#define AC_PLAY			0x00080
-#define IIS_RECORD		0x00040
-#define IIS_PLAY		0x00020
-#define DAC_RESET		0x00010
-#define ADC_RESET		0x00008
-#define M80_RESET		0x00004
-#define AC_RESET		0x00002
-#define IIS_RESET		0x00001
-
-/* bit definition of REG_ACTL_ACCON register */
-#define AC_BCLK_PU_EN		0x20
-#define AC_R_FINISH		0x10
-#define AC_W_FINISH		0x08
-#define AC_W_RES		0x04
-#define AC_C_RES		0x02
-
-/* bit definition of ACTL_RSR register */
-#define R_FIFO_EMPTY		0x04
-#define R_DMA_END_IRQ		0x02
-#define R_DMA_MIDDLE_IRQ	0x01
-
-/* bit definition of ACTL_PSR register */
-#define P_FIFO_EMPTY		0x04
-#define P_DMA_END_IRQ		0x02
-#define P_DMA_MIDDLE_IRQ	0x01
-
-/* bit definition of ACTL_ACOS0 register */
-#define SLOT1_VALID		0x01
-#define SLOT2_VALID		0x02
-#define SLOT3_VALID		0x04
-#define SLOT4_VALID		0x08
-#define VALID_FRAME		0x10
-
-/* bit definition of ACTL_ACOS1 register */
-#define R_WB			0x80
-
-#define CODEC_READY		0x10
-#define RESET_PRSR		0x00
-#define AUDIO_WRITE(addr, val)	__raw_writel(val, addr)
-#define AUDIO_READ(addr)	__raw_readl(addr)
-
-struct nuc900_audio {
-	void __iomem *mmio;
-	spinlock_t lock;
-	unsigned long irq_num;
-	struct resource *res;
-	struct clk *clk;
-	struct device *dev;
-
-};
-
-extern struct nuc900_audio *nuc900_ac97_data;
-
-#endif /*end _NUC900_AUDIO_H */
diff --git a/sound/soc/nuc900/nuc900-pcm.c b/sound/soc/nuc900/nuc900-pcm.c
deleted file mode 100644
index 4442a26e9502..000000000000
--- a/sound/soc/nuc900/nuc900-pcm.c
+++ /dev/null
@@ -1,321 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2010 Nuvoton technology corporation.
- *
- * Wan ZongShun <mcuos.com@gmail.com>
- */
-
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/io.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-#include <linux/dma-mapping.h>
-
-#include <sound/core.h>
-#include <sound/pcm.h>
-#include <sound/pcm_params.h>
-#include <sound/soc.h>
-
-#include <mach/hardware.h>
-
-#include "nuc900-audio.h"
-
-static const struct snd_pcm_hardware nuc900_pcm_hardware = {
-	.info			= SNDRV_PCM_INFO_INTERLEAVED |
-					SNDRV_PCM_INFO_BLOCK_TRANSFER |
-					SNDRV_PCM_INFO_MMAP |
-					SNDRV_PCM_INFO_MMAP_VALID |
-					SNDRV_PCM_INFO_PAUSE |
-					SNDRV_PCM_INFO_RESUME,
-	.buffer_bytes_max	= 4*1024,
-	.period_bytes_min	= 1*1024,
-	.period_bytes_max	= 4*1024,
-	.periods_min		= 1,
-	.periods_max		= 1024,
-};
-
-static int nuc900_dma_hw_params(struct snd_pcm_substream *substream,
-	struct snd_pcm_hw_params *params)
-{
-	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
-}
-
-static void nuc900_update_dma_register(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct nuc900_audio *nuc900_audio = runtime->private_data;
-	void __iomem *mmio_addr, *mmio_len;
-
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		mmio_addr = nuc900_audio->mmio + ACTL_PDSTB;
-		mmio_len = nuc900_audio->mmio + ACTL_PDST_LENGTH;
-	} else {
-		mmio_addr = nuc900_audio->mmio + ACTL_RDSTB;
-		mmio_len = nuc900_audio->mmio + ACTL_RDST_LENGTH;
-	}
-
-	AUDIO_WRITE(mmio_addr, runtime->dma_addr);
-	AUDIO_WRITE(mmio_len, runtime->dma_bytes);
-}
-
-static void nuc900_dma_start(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct nuc900_audio *nuc900_audio = runtime->private_data;
-	unsigned long val;
-
-	val = AUDIO_READ(nuc900_audio->mmio + ACTL_CON);
-	val |= (T_DMA_IRQ | R_DMA_IRQ);
-	AUDIO_WRITE(nuc900_audio->mmio + ACTL_CON, val);
-}
-
-static void nuc900_dma_stop(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct nuc900_audio *nuc900_audio = runtime->private_data;
-	unsigned long val;
-
-	val = AUDIO_READ(nuc900_audio->mmio + ACTL_CON);
-	val &= ~(T_DMA_IRQ | R_DMA_IRQ);
-	AUDIO_WRITE(nuc900_audio->mmio + ACTL_CON, val);
-}
-
-static irqreturn_t nuc900_dma_interrupt(int irq, void *dev_id)
-{
-	struct snd_pcm_substream *substream = dev_id;
-	struct nuc900_audio *nuc900_audio = substream->runtime->private_data;
-	unsigned long val;
-
-	spin_lock(&nuc900_audio->lock);
-
-	val = AUDIO_READ(nuc900_audio->mmio + ACTL_CON);
-
-	if (val & R_DMA_IRQ) {
-		AUDIO_WRITE(nuc900_audio->mmio + ACTL_CON, val | R_DMA_IRQ);
-
-		val = AUDIO_READ(nuc900_audio->mmio + ACTL_RSR);
-
-		if (val & R_DMA_MIDDLE_IRQ) {
-			val |= R_DMA_MIDDLE_IRQ;
-			AUDIO_WRITE(nuc900_audio->mmio + ACTL_RSR, val);
-		}
-
-		if (val & R_DMA_END_IRQ) {
-			val |= R_DMA_END_IRQ;
-			AUDIO_WRITE(nuc900_audio->mmio + ACTL_RSR, val);
-		}
-	} else if (val & T_DMA_IRQ) {
-		AUDIO_WRITE(nuc900_audio->mmio + ACTL_CON, val | T_DMA_IRQ);
-
-		val = AUDIO_READ(nuc900_audio->mmio + ACTL_PSR);
-
-		if (val & P_DMA_MIDDLE_IRQ) {
-			val |= P_DMA_MIDDLE_IRQ;
-			AUDIO_WRITE(nuc900_audio->mmio + ACTL_PSR, val);
-		}
-
-		if (val & P_DMA_END_IRQ) {
-			val |= P_DMA_END_IRQ;
-			AUDIO_WRITE(nuc900_audio->mmio + ACTL_PSR, val);
-		}
-	} else {
-		dev_err(nuc900_audio->dev, "Wrong DMA interrupt status!\n");
-		spin_unlock(&nuc900_audio->lock);
-		return IRQ_HANDLED;
-	}
-
-	spin_unlock(&nuc900_audio->lock);
-
-	snd_pcm_period_elapsed(substream);
-
-	return IRQ_HANDLED;
-}
-
-static int nuc900_dma_hw_free(struct snd_pcm_substream *substream)
-{
-	snd_pcm_lib_free_pages(substream);
-	return 0;
-}
-
-static int nuc900_dma_prepare(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct nuc900_audio *nuc900_audio = runtime->private_data;
-	unsigned long flags, val;
-	int ret = 0;
-
-	spin_lock_irqsave(&nuc900_audio->lock, flags);
-
-	nuc900_update_dma_register(substream);
-
-	val = AUDIO_READ(nuc900_audio->mmio + ACTL_RESET);
-
-	switch (runtime->channels) {
-	case 1:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-			val &= ~(PLAY_LEFT_CHNNEL | PLAY_RIGHT_CHNNEL);
-			val |= PLAY_RIGHT_CHNNEL;
-		} else {
-			val &= ~(RECORD_LEFT_CHNNEL | RECORD_RIGHT_CHNNEL);
-			val |= RECORD_RIGHT_CHNNEL;
-		}
-		AUDIO_WRITE(nuc900_audio->mmio + ACTL_RESET, val);
-		break;
-	case 2:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			val |= (PLAY_LEFT_CHNNEL | PLAY_RIGHT_CHNNEL);
-		else
-			val |= (RECORD_LEFT_CHNNEL | RECORD_RIGHT_CHNNEL);
-		AUDIO_WRITE(nuc900_audio->mmio + ACTL_RESET, val);
-		break;
-	default:
-		ret = -EINVAL;
-	}
-	spin_unlock_irqrestore(&nuc900_audio->lock, flags);
-	return ret;
-}
-
-static int nuc900_dma_trigger(struct snd_pcm_substream *substream, int cmd)
-{
-	int ret = 0;
-
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
-	case SNDRV_PCM_TRIGGER_RESUME:
-		nuc900_dma_start(substream);
-		break;
-
-	case SNDRV_PCM_TRIGGER_STOP:
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-		nuc900_dma_stop(substream);
-		break;
-
-	default:
-		ret = -EINVAL;
-		break;
-	}
-
-	return ret;
-}
-
-static int nuc900_dma_getposition(struct snd_pcm_substream *substream,
-					dma_addr_t *src, dma_addr_t *dst)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct nuc900_audio *nuc900_audio = runtime->private_data;
-
-	if (src != NULL)
-		*src = AUDIO_READ(nuc900_audio->mmio + ACTL_PDSTC);
-
-	if (dst != NULL)
-		*dst = AUDIO_READ(nuc900_audio->mmio + ACTL_RDSTC);
-
-	return 0;
-}
-
-static snd_pcm_uframes_t nuc900_dma_pointer(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	dma_addr_t src, dst;
-	unsigned long res;
-
-	nuc900_dma_getposition(substream, &src, &dst);
-
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
-		res = dst - runtime->dma_addr;
-	else
-		res = src - runtime->dma_addr;
-
-	return bytes_to_frames(substream->runtime, res);
-}
-
-static int nuc900_dma_open(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct nuc900_audio *nuc900_audio;
-
-	snd_soc_set_runtime_hwparams(substream, &nuc900_pcm_hardware);
-
-	nuc900_audio = nuc900_ac97_data;
-
-	if (request_irq(nuc900_audio->irq_num, nuc900_dma_interrupt,
-			0, "nuc900-dma", substream))
-		return -EBUSY;
-
-	runtime->private_data = nuc900_audio;
-
-	return 0;
-}
-
-static int nuc900_dma_close(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct nuc900_audio *nuc900_audio = runtime->private_data;
-
-	free_irq(nuc900_audio->irq_num, substream);
-
-	return 0;
-}
-
-static int nuc900_dma_mmap(struct snd_pcm_substream *substream,
-	struct vm_area_struct *vma)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-
-	return dma_mmap_wc(substream->pcm->card->dev, vma, runtime->dma_area,
-			   runtime->dma_addr, runtime->dma_bytes);
-}
-
-static const struct snd_pcm_ops nuc900_dma_ops = {
-	.open		= nuc900_dma_open,
-	.close		= nuc900_dma_close,
-	.ioctl		= snd_pcm_lib_ioctl,
-	.hw_params	= nuc900_dma_hw_params,
-	.hw_free	= nuc900_dma_hw_free,
-	.prepare	= nuc900_dma_prepare,
-	.trigger	= nuc900_dma_trigger,
-	.pointer	= nuc900_dma_pointer,
-	.mmap		= nuc900_dma_mmap,
-};
-
-static int nuc900_dma_new(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_card *card = rtd->card->snd_card;
-	struct snd_pcm *pcm = rtd->pcm;
-	int ret;
-
-	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
-	if (ret)
-		return ret;
-
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-		card->dev, 4 * 1024, (4 * 1024) - 1);
-
-	return 0;
-}
-
-static const struct snd_soc_component_driver nuc900_soc_component = {
-	.ops		= &nuc900_dma_ops,
-	.pcm_new	= nuc900_dma_new,
-};
-
-static int nuc900_soc_platform_probe(struct platform_device *pdev)
-{
-	return devm_snd_soc_register_component(&pdev->dev, &nuc900_soc_component,
-					       NULL, 0);
-}
-
-static struct platform_driver nuc900_pcm_driver = {
-	.driver = {
-			.name = "nuc900-pcm-audio",
-	},
-
-	.probe = nuc900_soc_platform_probe,
-};
-
-module_platform_driver(nuc900_pcm_driver);
-
-MODULE_AUTHOR("Wan ZongShun, <mcuos.com@gmail.com>");
-MODULE_DESCRIPTION("nuc900 Audio DMA module");
-MODULE_LICENSE("GPL");
-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
