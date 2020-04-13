Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E0A1A6403
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Apr 2020 10:23:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9468116DA;
	Mon, 13 Apr 2020 10:22:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9468116DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586766210;
	bh=JCIFvhsIcOn8XyRS8TqK6NkrKIFKcaBWm/YroFqVTM8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ccbApyOsI5ZqcOGkZzV2+NZcXBUdfeOvybQqySLJ9E+gV8w+/DBok0bbP0Q2/xreu
	 23KL9Ozngl1QsgfZY1PvlaGAZ092wg+T8rVitd0ptsuxt6aoW/y88+A6w2QoTvbx2p
	 +A5eQpX44O4kopmxe3AAUGFFKhFmQMcPErhVv9Oc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 944F6F80115;
	Mon, 13 Apr 2020 10:20:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13B9EF80290; Mon, 13 Apr 2020 10:20:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82547F8026A
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 10:20:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82547F8026A
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AE517AD48;
 Mon, 13 Apr 2020 08:20:39 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/6] ALSA: hda: Skip controller resume if not needed
Date: Mon, 13 Apr 2020 10:20:33 +0200
Message-Id: <20200413082034.25166-6-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200413082034.25166-1-tiwai@suse.de>
References: <20200413082034.25166-1-tiwai@suse.de>
Cc: Roy Spliet <nouveau@spliet.org>
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

The HD-audio controller does system-suspend and resume operations by
directly calling its helpers __azx_runtime_suspend() and
__azx_runtime_resume().  However, in general, we don't have to resume
always the device fully at the system resume; typically, if a device
has been runtime-suspended, we can leave it to runtime resume.

Usually for achieving this, the driver would call
pm_runtime_force_suspend() and pm_runtime_force_resume() pairs in the
system suspend and resume ops.  Unfortunately, this doesn't work for
the resume path in our case.  For handling the jack detection at the
system resume, a child codec device may need the (literally) forcibly
resume even if it's been runtime-suspended, and for that, the
controller device must be also resumed even if it's been suspended.

This patch is an attempt to improve the situation.  It replaces the
direct __azx_runtime_suspend()/_resume() calls with with
pm_runtime_force_suspend() and pm_runtime_force_resume() with a slight
trick as we've done for the codec side.  More exactly:

- azx_has_pm_runtime() check is dropped from azx_runtime_suspend() and
  azx_runtime_resume(), so that it can be properly executed from the
  system-suspend/resume path

- The WAKEEN handling depends on the card's power state now; it's set
  and cleared only for the runtime-suspend

- azx_resume() checks whether any codec may need the forcible resume
  beforehand.  If the forcible resume is required, it does temporary
  PM refcount up/down for actually triggering the runtime resume.

- A new helper function, hda_codec_need_resume(), is introduced for
  checking whether the codec needs a forcible runtime-resume, and the
  existing code is rewritten with that.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207043
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hda_codec.h |  5 +++++
 sound/pci/hda/hda_codec.c |  2 +-
 sound/pci/hda/hda_intel.c | 38 +++++++++++++++++++++++++++-----------
 3 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 3ee8036f5436..225154a4f2ed 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -494,6 +494,11 @@ void snd_hda_update_power_acct(struct hda_codec *codec);
 static inline void snd_hda_set_power_save(struct hda_bus *bus, int delay) {}
 #endif
 
+static inline bool hda_codec_need_resume(struct hda_codec *codec)
+{
+	return !codec->relaxed_resume && codec->jacktbl.used;
+}
+
 #ifdef CONFIG_SND_HDA_PATCH_LOADER
 /*
  * patch firmware
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index a34a2c9f4bcf..86a632bf4d50 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -2951,7 +2951,7 @@ static int hda_codec_runtime_resume(struct device *dev)
 static int hda_codec_force_resume(struct device *dev)
 {
 	struct hda_codec *codec = dev_to_hda_codec(dev);
-	bool forced_resume = !codec->relaxed_resume && codec->jacktbl.used;
+	bool forced_resume = hda_codec_need_resume(codec);
 	int ret;
 
 	/* The get/put pair below enforces the runtime resume even if the
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index aa0be85614b6..02c6308502b1 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1027,7 +1027,7 @@ static int azx_suspend(struct device *dev)
 	chip = card->private_data;
 	bus = azx_bus(chip);
 	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
-	__azx_runtime_suspend(chip);
+	pm_runtime_force_suspend(dev);
 	if (bus->irq >= 0) {
 		free_irq(bus->irq, chip);
 		bus->irq = -1;
@@ -1044,7 +1044,9 @@ static int azx_suspend(struct device *dev)
 static int azx_resume(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
+	struct hda_codec *codec;
 	struct azx *chip;
+	bool forced_resume = false;
 
 	if (!azx_is_pm_ready(card))
 		return 0;
@@ -1055,7 +1057,20 @@ static int azx_resume(struct device *dev)
 			chip->msi = 0;
 	if (azx_acquire_irq(chip, 1) < 0)
 		return -EIO;
-	__azx_runtime_resume(chip, false);
+
+	/* check for the forced resume */
+	list_for_each_codec(codec, &chip->bus) {
+		if (hda_codec_need_resume(codec)) {
+			forced_resume = true;
+			break;
+		}
+	}
+
+	if (forced_resume)
+		pm_runtime_get_noresume(dev);
+	pm_runtime_force_resume(dev);
+	if (forced_resume)
+		pm_runtime_put(dev);
 	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
 
 	trace_azx_resume(chip);
@@ -1102,12 +1117,12 @@ static int azx_runtime_suspend(struct device *dev)
 	if (!azx_is_pm_ready(card))
 		return 0;
 	chip = card->private_data;
-	if (!azx_has_pm_runtime(chip))
-		return 0;
 
 	/* enable controller wake up event */
-	azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) |
-		  STATESTS_INT_MASK);
+	if (snd_power_get_state(card) == SNDRV_CTL_POWER_D0) {
+		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) |
+			   STATESTS_INT_MASK);
+	}
 
 	__azx_runtime_suspend(chip);
 	trace_azx_runtime_suspend(chip);
@@ -1118,17 +1133,18 @@ static int azx_runtime_resume(struct device *dev)
 {
 	struct snd_card *card = dev_get_drvdata(dev);
 	struct azx *chip;
+	bool from_rt = snd_power_get_state(card) == SNDRV_CTL_POWER_D0;
 
 	if (!azx_is_pm_ready(card))
 		return 0;
 	chip = card->private_data;
-	if (!azx_has_pm_runtime(chip))
-		return 0;
-	__azx_runtime_resume(chip, true);
+	__azx_runtime_resume(chip, from_rt);
 
 	/* disable controller Wake Up event*/
-	azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) &
-			~STATESTS_INT_MASK);
+	if (from_rt) {
+		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) &
+			   ~STATESTS_INT_MASK);
+	}
 
 	trace_azx_runtime_resume(chip);
 	return 0;
-- 
2.16.4

