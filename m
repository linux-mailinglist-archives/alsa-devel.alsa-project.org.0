Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5190B29ACB1
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 14:03:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBF4216AF;
	Tue, 27 Oct 2020 14:02:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBF4216AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603803810;
	bh=xAQ4k1rWkP19J8AzRm0DN/M3SI5gmjfi7WIdVg3fNy0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sg7KYigMtRLPMCVjg/bP/SqOqZCkxSXcuovhWo+IBSO8iUsIxKE+AcVKk5T4/hUy+
	 UGHk3E8vF665b4JawtjJvGKXb3UVP5JKkDvp2hNba/DpntuETorgZrp73qMH27HeFD
	 2smtAdSO11Ao0YmKJ6AU3+EH+AScNkcqYgowjIdU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42854F804B3;
	Tue, 27 Oct 2020 14:01:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAD03F804B4; Tue, 27 Oct 2020 14:01:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14CBFF80240
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 14:01:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14CBFF80240
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1kXOao-0007hm-Bo; Tue, 27 Oct 2020 13:00:50 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Subject: [PATCH v3 2/3] ALSA: hda: Separate runtime and system suspend
Date: Tue, 27 Oct 2020 21:00:37 +0800
Message-Id: <20201027130038.16463-3-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201027130038.16463-1-kai.heng.feng@canonical.com>
References: <20201027130038.16463-1-kai.heng.feng@canonical.com>
Cc: alsa-devel@alsa-project.org, mwolf@adiumentum.com,
 kai.vehmanen@linux.intel.com, linux-kernel@vger.kernel.org,
 hui.wang@canonical.com, Kai-Heng Feng <kai.heng.feng@canonical.com>
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

Both pm_runtime_force_suspend() and pm_runtime_force_resume() have
some implicit checks, so it can make code flow more straightforward if
we separate runtime and system suspend callbacks.

High Definition Audio Specification, 4.5.9.3 Codec Wake From System S3
states that codec can wake the system up from S3 if WAKEEN is toggled.
Since HDA controller has different wakeup settings for runtime and
system susend, we also need to explicitly disable direct-complete which
can be enabled automatically by PCI core. In addition to that, avoid
waking up codec if runtime resume is for system suspend, to not break
direct-complete for codecs.

While at it, also remove AZX_DCAPS_SUSPEND_SPURIOUS_WAKEUP, as the
original bug commit a6630529aecb ("ALSA: hda: Workaround for spurious
wakeups on some Intel platforms") solves doesn't happen with this
patch.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v3:
 - Fix typos.
 - Remove from_rt from __azx_runtime_resume().
 - Change prepared to pm_prepared.
 - Concatenate azx_writew() into one line.

v2:
 - Make sure WAKEEN is disabled for system suspend.
 - Avoid waking up codec if runtime resume is for system suspend

 sound/pci/hda/hda_controller.h |  3 +-
 sound/pci/hda/hda_intel.c      | 62 +++++++++++++++++++---------------
 2 files changed, 36 insertions(+), 29 deletions(-)

diff --git a/sound/pci/hda/hda_controller.h b/sound/pci/hda/hda_controller.h
index be63ead8161f..68f9668788ea 100644
--- a/sound/pci/hda/hda_controller.h
+++ b/sound/pci/hda/hda_controller.h
@@ -41,7 +41,7 @@
 /* 24 unused */
 #define AZX_DCAPS_COUNT_LPIB_DELAY  (1 << 25)	/* Take LPIB as delay */
 #define AZX_DCAPS_PM_RUNTIME	(1 << 26)	/* runtime PM support */
-#define AZX_DCAPS_SUSPEND_SPURIOUS_WAKEUP (1 << 27) /* Workaround for spurious wakeups after suspend */
+/* 27 unused */
 #define AZX_DCAPS_CORBRP_SELF_CLEAR (1 << 28)	/* CORBRP clears itself after reset */
 #define AZX_DCAPS_NO_MSI64      (1 << 29)	/* Stick to 32-bit MSIs */
 #define AZX_DCAPS_SEPARATE_STREAM_TAG	(1 << 30) /* capture and playback use separate stream tag */
@@ -143,6 +143,7 @@ struct azx {
 	unsigned int align_buffer_size:1;
 	unsigned int region_requested:1;
 	unsigned int disabled:1; /* disabled by vga_switcheroo */
+	unsigned int pm_prepared:1;
 
 	/* GTS present */
 	unsigned int gts_present:1;
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 749b88090970..be83f1747c5f 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -297,8 +297,7 @@ enum {
 /* PCH for HSW/BDW; with runtime PM */
 /* no i915 binding for this as HSW/BDW has another controller for HDMI */
 #define AZX_DCAPS_INTEL_PCH \
-	(AZX_DCAPS_INTEL_PCH_BASE | AZX_DCAPS_PM_RUNTIME |\
-	 AZX_DCAPS_SUSPEND_SPURIOUS_WAKEUP)
+	(AZX_DCAPS_INTEL_PCH_BASE | AZX_DCAPS_PM_RUNTIME)
 
 /* HSW HDMI */
 #define AZX_DCAPS_INTEL_HASWELL \
@@ -985,7 +984,7 @@ static void __azx_runtime_suspend(struct azx *chip)
 	display_power(chip, false);
 }
 
-static void __azx_runtime_resume(struct azx *chip, bool from_rt)
+static void __azx_runtime_resume(struct azx *chip)
 {
 	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
 	struct hdac_bus *bus = azx_bus(chip);
@@ -1002,7 +1001,8 @@ static void __azx_runtime_resume(struct azx *chip, bool from_rt)
 	azx_init_pci(chip);
 	hda_intel_init_chip(chip, true);
 
-	if (from_rt) {
+	/* Avoid codec resume if runtime resume is for system suspend */
+	if (!chip->pm_prepared) {
 		list_for_each_codec(codec, &chip->bus) {
 			if (codec->relaxed_resume)
 				continue;
@@ -1018,6 +1018,29 @@ static void __azx_runtime_resume(struct azx *chip, bool from_rt)
 }
 
 #ifdef CONFIG_PM_SLEEP
+static int azx_prepare(struct device *dev)
+{
+	struct snd_card *card = dev_get_drvdata(dev);
+	struct azx *chip;
+
+	chip = card->private_data;
+	chip->pm_prepared = 1;
+
+	/* HDA controller always requires different WAKEEN for runtime suspend
+	 * and system suspend, so don't use direct-complete here.
+	 */
+	return 0;
+}
+
+static void azx_complete(struct device *dev)
+{
+	struct snd_card *card = dev_get_drvdata(dev);
+	struct azx *chip;
+
+	chip = card->private_data;
+	chip->pm_prepared = 0;
+}
+
 static int azx_suspend(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
@@ -1029,15 +1052,7 @@ static int azx_suspend(struct device *dev)
 
 	chip = card->private_data;
 	bus = azx_bus(chip);
-	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
-	/* An ugly workaround: direct call of __azx_runtime_suspend() and
-	 * __azx_runtime_resume() for old Intel platforms that suffer from
-	 * spurious wakeups after S3 suspend
-	 */
-	if (chip->driver_caps & AZX_DCAPS_SUSPEND_SPURIOUS_WAKEUP)
-		__azx_runtime_suspend(chip);
-	else
-		pm_runtime_force_suspend(dev);
+	__azx_runtime_suspend(chip);
 	if (bus->irq >= 0) {
 		free_irq(bus->irq, chip);
 		bus->irq = -1;
@@ -1066,11 +1081,7 @@ static int azx_resume(struct device *dev)
 	if (azx_acquire_irq(chip, 1) < 0)
 		return -EIO;
 
-	if (chip->driver_caps & AZX_DCAPS_SUSPEND_SPURIOUS_WAKEUP)
-		__azx_runtime_resume(chip, false);
-	else
-		pm_runtime_force_resume(dev);
-	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
+	__azx_runtime_resume(chip);
 
 	trace_azx_resume(chip);
 	return 0;
@@ -1118,10 +1129,7 @@ static int azx_runtime_suspend(struct device *dev)
 	chip = card->private_data;
 
 	/* enable controller wake up event */
-	if (snd_power_get_state(card) == SNDRV_CTL_POWER_D0) {
-		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) |
-			   STATESTS_INT_MASK);
-	}
+	azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) | STATESTS_INT_MASK);
 
 	__azx_runtime_suspend(chip);
 	trace_azx_runtime_suspend(chip);
@@ -1132,18 +1140,14 @@ static int azx_runtime_resume(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
 	struct azx *chip;
-	bool from_rt = snd_power_get_state(card) == SNDRV_CTL_POWER_D0;
 
 	if (!azx_is_pm_ready(card))
 		return 0;
 	chip = card->private_data;
-	__azx_runtime_resume(chip, from_rt);
+	__azx_runtime_resume(chip);
 
 	/* disable controller Wake Up event*/
-	if (from_rt) {
-		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) &
-			   ~STATESTS_INT_MASK);
-	}
+	azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) & ~STATESTS_INT_MASK);
 
 	trace_azx_runtime_resume(chip);
 	return 0;
@@ -1177,6 +1181,8 @@ static int azx_runtime_idle(struct device *dev)
 static const struct dev_pm_ops azx_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(azx_suspend, azx_resume)
 #ifdef CONFIG_PM_SLEEP
+	.prepare = azx_prepare,
+	.complete = azx_complete,
 	.freeze_noirq = azx_freeze_noirq,
 	.thaw_noirq = azx_thaw_noirq,
 #endif
-- 
2.17.1

