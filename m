Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AE971DB9
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 19:30:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6197D1927;
	Tue, 23 Jul 2019 19:29:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6197D1927
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563903043;
	bh=tXZjjJAGyyfQwyhEiRLVBXuDsPRch54Tfw/XWm3trV8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Ox6MOVsAuZGMB00jTHJeR6QrQTsNDdPaTG9TRLoJmkgc87ZSy7tg8yLMOIlaBDtSo
	 Prh2Tk3oJHoAnWkP97l1bJGjOFsw1WLxg9Bob+HKJYNO1t6hJWwa4EbQFC/y55LndL
	 SWcQdJjDbBc/KitzpTom240zd0aW4aD+CtH5gBB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 656A9F8063D;
	Tue, 23 Jul 2019 19:19:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF831F80518; Tue, 23 Jul 2019 19:19:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65305F8049B
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 19:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65305F8049B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="jX59u0V6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=SlZsg3KTLWDPYcG0moDqR864x5IDGBgoeUaEgfrgNz4=; b=jX59u0V6cxym
 EJ80VmmRxho9I+taV7lIlHqu7NJd30UHfmG7QER6jpGTVi2j6oFNdoTqL4ftHYRux5VniNBGDLwQ/
 Rcx1rUhBPCnwxjEmuYCol8x66KbLvj9GlmjJbFlPIGjQZNYr7NViGIBsalpL6N7VBp/HUHsx3J9/T
 XotIs=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpyRC-0004ML-1j; Tue, 23 Jul 2019 17:18:54 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6147A2742BAB; Tue, 23 Jul 2019 18:18:53 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <871ryij1r6.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190723171853.6147A2742BAB@ypsilon.sirena.org.uk>
Date: Tue, 23 Jul 2019 18:18:53 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: add soc-dai.c" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: add soc-dai.c

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 06f6e1d41427f394ad3f67ecf06efcd28a46932c Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 22 Jul 2019 10:32:12 +0900
Subject: [PATCH] ASoC: add soc-dai.c

Current ALSA SoC has many snd_soc_dai_xxx() function which is
using dai->driver->ops->xxx.
But, some of them are implemented as snd_soc_dai_xxx(),
but others are directly using dai->driver->ops->xxx.
Because of it, the code is not easy to read.

This patch creats new soc-dai.c and moves snd_soc_dai_xxx()
functions into it.
One exception is snd_soc_dai_is_dummy() which is based on
soc-utils local variable. We need to keep it as-is there.

Others which is directly using dai->driver->ops->xxx will be
implemented at soc-dai.c by incremental patches.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/871ryij1r6.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/Makefile   |   2 +-
 sound/soc/soc-core.c | 243 -----------------------------------------
 sound/soc/soc-dai.c  | 254 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 255 insertions(+), 244 deletions(-)
 create mode 100644 sound/soc/soc-dai.c

diff --git a/sound/soc/Makefile b/sound/soc/Makefile
index d90ce8a32887..919c3c027c62 100644
--- a/sound/soc/Makefile
+++ b/sound/soc/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-snd-soc-core-objs := soc-core.o soc-dapm.o soc-jack.o soc-utils.o
+snd-soc-core-objs := soc-core.o soc-dapm.o soc-jack.o soc-utils.o soc-dai.o
 snd-soc-core-objs += soc-pcm.o soc-io.o soc-devres.o soc-ops.o
 snd-soc-core-$(CONFIG_SND_SOC_COMPRESS) += soc-compress.o
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index fd6eaae6c0ed..6e8c5c8eeaec 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2394,26 +2394,6 @@ int snd_soc_add_dai_controls(struct snd_soc_dai *dai,
 }
 EXPORT_SYMBOL_GPL(snd_soc_add_dai_controls);
 
-/**
- * snd_soc_dai_set_sysclk - configure DAI system or master clock.
- * @dai: DAI
- * @clk_id: DAI specific clock ID
- * @freq: new clock frequency in Hz
- * @dir: new clock direction - input/output.
- *
- * Configures the DAI master (MCLK) or system (SYSCLK) clocking.
- */
-int snd_soc_dai_set_sysclk(struct snd_soc_dai *dai, int clk_id,
-	unsigned int freq, int dir)
-{
-	if (dai->driver->ops->set_sysclk)
-		return dai->driver->ops->set_sysclk(dai, clk_id, freq, dir);
-
-	return snd_soc_component_set_sysclk(dai->component, clk_id, 0,
-					    freq, dir);
-}
-EXPORT_SYMBOL_GPL(snd_soc_dai_set_sysclk);
-
 /**
  * snd_soc_component_set_sysclk - configure COMPONENT system or master clock.
  * @component: COMPONENT
@@ -2436,48 +2416,6 @@ int snd_soc_component_set_sysclk(struct snd_soc_component *component,
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_set_sysclk);
 
-/**
- * snd_soc_dai_set_clkdiv - configure DAI clock dividers.
- * @dai: DAI
- * @div_id: DAI specific clock divider ID
- * @div: new clock divisor.
- *
- * Configures the clock dividers. This is used to derive the best DAI bit and
- * frame clocks from the system or master clock. It's best to set the DAI bit
- * and frame clocks as low as possible to save system power.
- */
-int snd_soc_dai_set_clkdiv(struct snd_soc_dai *dai,
-	int div_id, int div)
-{
-	if (dai->driver->ops->set_clkdiv)
-		return dai->driver->ops->set_clkdiv(dai, div_id, div);
-	else
-		return -EINVAL;
-}
-EXPORT_SYMBOL_GPL(snd_soc_dai_set_clkdiv);
-
-/**
- * snd_soc_dai_set_pll - configure DAI PLL.
- * @dai: DAI
- * @pll_id: DAI specific PLL ID
- * @source: DAI specific source for the PLL
- * @freq_in: PLL input clock frequency in Hz
- * @freq_out: requested PLL output clock frequency in Hz
- *
- * Configures and enables PLL to generate output clock based on input clock.
- */
-int snd_soc_dai_set_pll(struct snd_soc_dai *dai, int pll_id, int source,
-	unsigned int freq_in, unsigned int freq_out)
-{
-	if (dai->driver->ops->set_pll)
-		return dai->driver->ops->set_pll(dai, pll_id, source,
-					 freq_in, freq_out);
-
-	return snd_soc_component_set_pll(dai->component, pll_id, source,
-					 freq_in, freq_out);
-}
-EXPORT_SYMBOL_GPL(snd_soc_dai_set_pll);
-
 /*
  * snd_soc_component_set_pll - configure component PLL.
  * @component: COMPONENT
@@ -2500,187 +2438,6 @@ int snd_soc_component_set_pll(struct snd_soc_component *component, int pll_id,
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_set_pll);
 
-/**
- * snd_soc_dai_set_bclk_ratio - configure BCLK to sample rate ratio.
- * @dai: DAI
- * @ratio: Ratio of BCLK to Sample rate.
- *
- * Configures the DAI for a preset BCLK to sample rate ratio.
- */
-int snd_soc_dai_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
-{
-	if (dai->driver->ops->set_bclk_ratio)
-		return dai->driver->ops->set_bclk_ratio(dai, ratio);
-	else
-		return -EINVAL;
-}
-EXPORT_SYMBOL_GPL(snd_soc_dai_set_bclk_ratio);
-
-/**
- * snd_soc_dai_set_fmt - configure DAI hardware audio format.
- * @dai: DAI
- * @fmt: SND_SOC_DAIFMT_* format value.
- *
- * Configures the DAI hardware format and clocking.
- */
-int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
-{
-	if (dai->driver->ops->set_fmt == NULL)
-		return -ENOTSUPP;
-	return dai->driver->ops->set_fmt(dai, fmt);
-}
-EXPORT_SYMBOL_GPL(snd_soc_dai_set_fmt);
-
-/**
- * snd_soc_xlate_tdm_slot - generate tx/rx slot mask.
- * @slots: Number of slots in use.
- * @tx_mask: bitmask representing active TX slots.
- * @rx_mask: bitmask representing active RX slots.
- *
- * Generates the TDM tx and rx slot default masks for DAI.
- */
-static int snd_soc_xlate_tdm_slot_mask(unsigned int slots,
-				       unsigned int *tx_mask,
-				       unsigned int *rx_mask)
-{
-	if (*tx_mask || *rx_mask)
-		return 0;
-
-	if (!slots)
-		return -EINVAL;
-
-	*tx_mask = (1 << slots) - 1;
-	*rx_mask = (1 << slots) - 1;
-
-	return 0;
-}
-
-/**
- * snd_soc_dai_set_tdm_slot() - Configures a DAI for TDM operation
- * @dai: The DAI to configure
- * @tx_mask: bitmask representing active TX slots.
- * @rx_mask: bitmask representing active RX slots.
- * @slots: Number of slots in use.
- * @slot_width: Width in bits for each slot.
- *
- * This function configures the specified DAI for TDM operation. @slot contains
- * the total number of slots of the TDM stream and @slot_with the width of each
- * slot in bit clock cycles. @tx_mask and @rx_mask are bitmasks specifying the
- * active slots of the TDM stream for the specified DAI, i.e. which slots the
- * DAI should write to or read from. If a bit is set the corresponding slot is
- * active, if a bit is cleared the corresponding slot is inactive. Bit 0 maps to
- * the first slot, bit 1 to the second slot and so on. The first active slot
- * maps to the first channel of the DAI, the second active slot to the second
- * channel and so on.
- *
- * TDM mode can be disabled by passing 0 for @slots. In this case @tx_mask,
- * @rx_mask and @slot_width will be ignored.
- *
- * Returns 0 on success, a negative error code otherwise.
- */
-int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
-	unsigned int tx_mask, unsigned int rx_mask, int slots, int slot_width)
-{
-	if (dai->driver->ops->xlate_tdm_slot_mask)
-		dai->driver->ops->xlate_tdm_slot_mask(slots,
-						&tx_mask, &rx_mask);
-	else
-		snd_soc_xlate_tdm_slot_mask(slots, &tx_mask, &rx_mask);
-
-	dai->tx_mask = tx_mask;
-	dai->rx_mask = rx_mask;
-
-	if (dai->driver->ops->set_tdm_slot)
-		return dai->driver->ops->set_tdm_slot(dai, tx_mask, rx_mask,
-				slots, slot_width);
-	else
-		return -ENOTSUPP;
-}
-EXPORT_SYMBOL_GPL(snd_soc_dai_set_tdm_slot);
-
-/**
- * snd_soc_dai_set_channel_map - configure DAI audio channel map
- * @dai: DAI
- * @tx_num: how many TX channels
- * @tx_slot: pointer to an array which imply the TX slot number channel
- *           0~num-1 uses
- * @rx_num: how many RX channels
- * @rx_slot: pointer to an array which imply the RX slot number channel
- *           0~num-1 uses
- *
- * configure the relationship between channel number and TDM slot number.
- */
-int snd_soc_dai_set_channel_map(struct snd_soc_dai *dai,
-	unsigned int tx_num, unsigned int *tx_slot,
-	unsigned int rx_num, unsigned int *rx_slot)
-{
-	if (dai->driver->ops->set_channel_map)
-		return dai->driver->ops->set_channel_map(dai, tx_num, tx_slot,
-			rx_num, rx_slot);
-	else
-		return -ENOTSUPP;
-}
-EXPORT_SYMBOL_GPL(snd_soc_dai_set_channel_map);
-
-/**
- * snd_soc_dai_get_channel_map - Get DAI audio channel map
- * @dai: DAI
- * @tx_num: how many TX channels
- * @tx_slot: pointer to an array which imply the TX slot number channel
- *           0~num-1 uses
- * @rx_num: how many RX channels
- * @rx_slot: pointer to an array which imply the RX slot number channel
- *           0~num-1 uses
- */
-int snd_soc_dai_get_channel_map(struct snd_soc_dai *dai,
-	unsigned int *tx_num, unsigned int *tx_slot,
-	unsigned int *rx_num, unsigned int *rx_slot)
-{
-	if (dai->driver->ops->get_channel_map)
-		return dai->driver->ops->get_channel_map(dai, tx_num, tx_slot,
-			rx_num, rx_slot);
-	else
-		return -ENOTSUPP;
-}
-EXPORT_SYMBOL_GPL(snd_soc_dai_get_channel_map);
-
-/**
- * snd_soc_dai_set_tristate - configure DAI system or master clock.
- * @dai: DAI
- * @tristate: tristate enable
- *
- * Tristates the DAI so that others can use it.
- */
-int snd_soc_dai_set_tristate(struct snd_soc_dai *dai, int tristate)
-{
-	if (dai->driver->ops->set_tristate)
-		return dai->driver->ops->set_tristate(dai, tristate);
-	else
-		return -EINVAL;
-}
-EXPORT_SYMBOL_GPL(snd_soc_dai_set_tristate);
-
-/**
- * snd_soc_dai_digital_mute - configure DAI system or master clock.
- * @dai: DAI
- * @mute: mute enable
- * @direction: stream to mute
- *
- * Mutes the DAI DAC.
- */
-int snd_soc_dai_digital_mute(struct snd_soc_dai *dai, int mute,
-			     int direction)
-{
-	if (dai->driver->ops->mute_stream)
-		return dai->driver->ops->mute_stream(dai, mute, direction);
-	else if (direction == SNDRV_PCM_STREAM_PLAYBACK &&
-		 dai->driver->ops->digital_mute)
-		return dai->driver->ops->digital_mute(dai, mute);
-	else
-		return -ENOTSUPP;
-}
-EXPORT_SYMBOL_GPL(snd_soc_dai_digital_mute);
-
 static int snd_soc_bind_card(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
new file mode 100644
index 000000000000..a1009ead40de
--- /dev/null
+++ b/sound/soc/soc-dai.c
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// soc-dai.c
+//
+// Copyright (C) 2019 Renesas Electronics Corp.
+// Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+//
+
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+/**
+ * snd_soc_dai_set_sysclk - configure DAI system or master clock.
+ * @dai: DAI
+ * @clk_id: DAI specific clock ID
+ * @freq: new clock frequency in Hz
+ * @dir: new clock direction - input/output.
+ *
+ * Configures the DAI master (MCLK) or system (SYSCLK) clocking.
+ */
+int snd_soc_dai_set_sysclk(struct snd_soc_dai *dai, int clk_id,
+			   unsigned int freq, int dir)
+{
+	if (dai->driver->ops->set_sysclk)
+		return dai->driver->ops->set_sysclk(dai, clk_id, freq, dir);
+
+	return snd_soc_component_set_sysclk(dai->component, clk_id, 0,
+					    freq, dir);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_set_sysclk);
+
+/**
+ * snd_soc_dai_set_clkdiv - configure DAI clock dividers.
+ * @dai: DAI
+ * @div_id: DAI specific clock divider ID
+ * @div: new clock divisor.
+ *
+ * Configures the clock dividers. This is used to derive the best DAI bit and
+ * frame clocks from the system or master clock. It's best to set the DAI bit
+ * and frame clocks as low as possible to save system power.
+ */
+int snd_soc_dai_set_clkdiv(struct snd_soc_dai *dai,
+			   int div_id, int div)
+{
+	if (dai->driver->ops->set_clkdiv)
+		return dai->driver->ops->set_clkdiv(dai, div_id, div);
+	else
+		return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_set_clkdiv);
+
+/**
+ * snd_soc_dai_set_pll - configure DAI PLL.
+ * @dai: DAI
+ * @pll_id: DAI specific PLL ID
+ * @source: DAI specific source for the PLL
+ * @freq_in: PLL input clock frequency in Hz
+ * @freq_out: requested PLL output clock frequency in Hz
+ *
+ * Configures and enables PLL to generate output clock based on input clock.
+ */
+int snd_soc_dai_set_pll(struct snd_soc_dai *dai, int pll_id, int source,
+			unsigned int freq_in, unsigned int freq_out)
+{
+	if (dai->driver->ops->set_pll)
+		return dai->driver->ops->set_pll(dai, pll_id, source,
+						 freq_in, freq_out);
+
+	return snd_soc_component_set_pll(dai->component, pll_id, source,
+					 freq_in, freq_out);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_set_pll);
+
+/**
+ * snd_soc_dai_set_bclk_ratio - configure BCLK to sample rate ratio.
+ * @dai: DAI
+ * @ratio: Ratio of BCLK to Sample rate.
+ *
+ * Configures the DAI for a preset BCLK to sample rate ratio.
+ */
+int snd_soc_dai_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
+{
+	if (dai->driver->ops->set_bclk_ratio)
+		return dai->driver->ops->set_bclk_ratio(dai, ratio);
+	else
+		return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_set_bclk_ratio);
+
+/**
+ * snd_soc_dai_set_fmt - configure DAI hardware audio format.
+ * @dai: DAI
+ * @fmt: SND_SOC_DAIFMT_* format value.
+ *
+ * Configures the DAI hardware format and clocking.
+ */
+int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	if (dai->driver->ops->set_fmt == NULL)
+		return -ENOTSUPP;
+	return dai->driver->ops->set_fmt(dai, fmt);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_set_fmt);
+
+/**
+ * snd_soc_xlate_tdm_slot - generate tx/rx slot mask.
+ * @slots: Number of slots in use.
+ * @tx_mask: bitmask representing active TX slots.
+ * @rx_mask: bitmask representing active RX slots.
+ *
+ * Generates the TDM tx and rx slot default masks for DAI.
+ */
+static int snd_soc_xlate_tdm_slot_mask(unsigned int slots,
+				       unsigned int *tx_mask,
+				       unsigned int *rx_mask)
+{
+	if (*tx_mask || *rx_mask)
+		return 0;
+
+	if (!slots)
+		return -EINVAL;
+
+	*tx_mask = (1 << slots) - 1;
+	*rx_mask = (1 << slots) - 1;
+
+	return 0;
+}
+
+/**
+ * snd_soc_dai_set_tdm_slot() - Configures a DAI for TDM operation
+ * @dai: The DAI to configure
+ * @tx_mask: bitmask representing active TX slots.
+ * @rx_mask: bitmask representing active RX slots.
+ * @slots: Number of slots in use.
+ * @slot_width: Width in bits for each slot.
+ *
+ * This function configures the specified DAI for TDM operation. @slot contains
+ * the total number of slots of the TDM stream and @slot_with the width of each
+ * slot in bit clock cycles. @tx_mask and @rx_mask are bitmasks specifying the
+ * active slots of the TDM stream for the specified DAI, i.e. which slots the
+ * DAI should write to or read from. If a bit is set the corresponding slot is
+ * active, if a bit is cleared the corresponding slot is inactive. Bit 0 maps to
+ * the first slot, bit 1 to the second slot and so on. The first active slot
+ * maps to the first channel of the DAI, the second active slot to the second
+ * channel and so on.
+ *
+ * TDM mode can be disabled by passing 0 for @slots. In this case @tx_mask,
+ * @rx_mask and @slot_width will be ignored.
+ *
+ * Returns 0 on success, a negative error code otherwise.
+ */
+int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
+			     unsigned int tx_mask, unsigned int rx_mask,
+			     int slots, int slot_width)
+{
+	if (dai->driver->ops->xlate_tdm_slot_mask)
+		dai->driver->ops->xlate_tdm_slot_mask(slots,
+						      &tx_mask, &rx_mask);
+	else
+		snd_soc_xlate_tdm_slot_mask(slots, &tx_mask, &rx_mask);
+
+	dai->tx_mask = tx_mask;
+	dai->rx_mask = rx_mask;
+
+	if (dai->driver->ops->set_tdm_slot)
+		return dai->driver->ops->set_tdm_slot(dai, tx_mask, rx_mask,
+						      slots, slot_width);
+	else
+		return -ENOTSUPP;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_set_tdm_slot);
+
+/**
+ * snd_soc_dai_set_channel_map - configure DAI audio channel map
+ * @dai: DAI
+ * @tx_num: how many TX channels
+ * @tx_slot: pointer to an array which imply the TX slot number channel
+ *           0~num-1 uses
+ * @rx_num: how many RX channels
+ * @rx_slot: pointer to an array which imply the RX slot number channel
+ *           0~num-1 uses
+ *
+ * configure the relationship between channel number and TDM slot number.
+ */
+int snd_soc_dai_set_channel_map(struct snd_soc_dai *dai,
+				unsigned int tx_num, unsigned int *tx_slot,
+				unsigned int rx_num, unsigned int *rx_slot)
+{
+	if (dai->driver->ops->set_channel_map)
+		return dai->driver->ops->set_channel_map(dai, tx_num, tx_slot,
+							 rx_num, rx_slot);
+	else
+		return -ENOTSUPP;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_set_channel_map);
+
+/**
+ * snd_soc_dai_get_channel_map - Get DAI audio channel map
+ * @dai: DAI
+ * @tx_num: how many TX channels
+ * @tx_slot: pointer to an array which imply the TX slot number channel
+ *           0~num-1 uses
+ * @rx_num: how many RX channels
+ * @rx_slot: pointer to an array which imply the RX slot number channel
+ *           0~num-1 uses
+ */
+int snd_soc_dai_get_channel_map(struct snd_soc_dai *dai,
+				unsigned int *tx_num, unsigned int *tx_slot,
+				unsigned int *rx_num, unsigned int *rx_slot)
+{
+	if (dai->driver->ops->get_channel_map)
+		return dai->driver->ops->get_channel_map(dai, tx_num, tx_slot,
+							 rx_num, rx_slot);
+	else
+		return -ENOTSUPP;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_get_channel_map);
+
+/**
+ * snd_soc_dai_set_tristate - configure DAI system or master clock.
+ * @dai: DAI
+ * @tristate: tristate enable
+ *
+ * Tristates the DAI so that others can use it.
+ */
+int snd_soc_dai_set_tristate(struct snd_soc_dai *dai, int tristate)
+{
+	if (dai->driver->ops->set_tristate)
+		return dai->driver->ops->set_tristate(dai, tristate);
+	else
+		return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_set_tristate);
+
+/**
+ * snd_soc_dai_digital_mute - configure DAI system or master clock.
+ * @dai: DAI
+ * @mute: mute enable
+ * @direction: stream to mute
+ *
+ * Mutes the DAI DAC.
+ */
+int snd_soc_dai_digital_mute(struct snd_soc_dai *dai, int mute,
+			     int direction)
+{
+	if (dai->driver->ops->mute_stream)
+		return dai->driver->ops->mute_stream(dai, mute, direction);
+	else if (direction == SNDRV_PCM_STREAM_PLAYBACK &&
+		 dai->driver->ops->digital_mute)
+		return dai->driver->ops->digital_mute(dai, mute);
+	else
+		return -ENOTSUPP;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_digital_mute);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
