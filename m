Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D613F435740
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Oct 2021 02:23:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44003167F;
	Thu, 21 Oct 2021 02:22:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44003167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634775806;
	bh=x+6dzmd619xe8lO99XfD0CP1ulQHd2aNB9HUi6b1bPk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tZCq3G6wzZ8Xt7Vy8Gm+hY/Ulo/l3i05sswWSUmusfWVN7SPWWF2L70n3U6mFZtgW
	 0JseuM33XLLAxwrgXNC2eXa40cLVTqqBjMFCsnIPMGYbd6ORrRMQpCFA5Tw/FS9jjB
	 uELM7pq3YUOV/ZP6usmgin4bu0zdDpU7Ia4cXVdE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1A57F802DF;
	Thu, 21 Oct 2021 02:22:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2FDBF80253; Thu, 21 Oct 2021 02:22:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E45DF802DF
 for <alsa-devel@alsa-project.org>; Thu, 21 Oct 2021 02:22:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E45DF802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ORa89Av4"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B769C60EE3;
 Thu, 21 Oct 2021 00:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634775728;
 bh=x+6dzmd619xe8lO99XfD0CP1ulQHd2aNB9HUi6b1bPk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ORa89Av47iKodzkW3R1TmfZsfFkcOQDeDeltG5e5Q0IzUOEes8l13kSoTdGKqw8PU
 Nu+BIKblNuPi5S4qAguGqj4jXRXkhTCCfyhFLS2raMAQvDcktFWifypGTAUVjh4ccs
 rqX2gbeVYgjMWhO0jlGhpcA7goBv/vfB/1jcawrkOU/QQKfZVRly7nIxmwmbhTmz8l
 5Z93Fm6uoYv+pg5UcPLywpDJUFnmOhWNpGllIWl2/e+w3xXoOdJAw5ZF1VXGWmmkXC
 56niqECkK5TJdNL5Y63HXuLmY0PtZYN0wVzC96VHLn1+ygpDvcWmScXX4/OLsCbzc1
 mDqsn226o8f9w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 02/14] ALSA: hda: intel: Allow repeatedly probing
 on codec configuration errors
Date: Wed, 20 Oct 2021 20:21:43 -0400
Message-Id: <20211021002155.1129292-2-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211021002155.1129292-1-sashal@kernel.org>
References: <20211021002155.1129292-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, leon@kernel.org, kai.vehmanen@linux.intel.com,
 Takashi Iwai <tiwai@suse.de>, imre.deak@intel.com,
 ranjani.sridharan@linux.intel.com, tiwai@suse.com, hui.wang@canonical.com,
 kai.heng.feng@canonical.com, broonie@kernel.org, joe@perches.com
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

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit c0f1886de7e173865f1a0fa7680a1c07954a987f ]

It seems that a few recent AMD systems show the codec configuration
errors at the early boot, while loading the driver at a later stage
works magically.  Although the root cause of the error isn't clear,
it's certainly not bad to allow retrying the codec probe in such a
case if that helps.

This patch adds the capability for retrying the probe upon codec probe
errors on the certain AMD platforms.  The probe_work is changed to a
delayed work, and at the secondary call, it'll jump to the codec
probing.

Note that, not only adding the re-probing, this includes the behavior
changes in the codec configuration function.  Namely,
snd_hda_codec_configure() won't unregister the codec at errors any
longer.  Instead, its caller, azx_codec_configure() unregisters the
codecs with the probe failures *if* any codec has been successfully
configured.  If all codec probe failed, it doesn't unregister but let
it re-probed -- which is the most case we're seeing and this patch
tries to improve.

Even if the driver doesn't re-probe or give up, it will go to the
"free-all" error path, hence the leftover codecs shall be disabled /
deleted in anyway.

BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1190801
Link: https://lore.kernel.org/r/20211006141940.2897-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/sound/hda_codec.h      |  1 +
 sound/pci/hda/hda_bind.c       | 20 +++++++++++---------
 sound/pci/hda/hda_codec.c      |  1 +
 sound/pci/hda/hda_controller.c | 24 ++++++++++++++++--------
 sound/pci/hda/hda_controller.h |  2 +-
 sound/pci/hda/hda_intel.c      | 29 +++++++++++++++++++++++------
 sound/pci/hda/hda_intel.h      |  4 +++-
 7 files changed, 56 insertions(+), 25 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 73827b7d17e0..cf530e9fb5f5 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -225,6 +225,7 @@ struct hda_codec {
 #endif
 
 	/* misc flags */
+	unsigned int configured:1; /* codec was configured */
 	unsigned int in_freeing:1; /* being released */
 	unsigned int registered:1; /* codec was registered */
 	unsigned int display_power_control:1; /* needs display power */
diff --git a/sound/pci/hda/hda_bind.c b/sound/pci/hda/hda_bind.c
index 17a25e453f60..4efbcc41fdfb 100644
--- a/sound/pci/hda/hda_bind.c
+++ b/sound/pci/hda/hda_bind.c
@@ -301,29 +301,31 @@ int snd_hda_codec_configure(struct hda_codec *codec)
 {
 	int err;
 
+	if (codec->configured)
+		return 0;
+
 	if (is_generic_config(codec))
 		codec->probe_id = HDA_CODEC_ID_GENERIC;
 	else
 		codec->probe_id = 0;
 
-	err = snd_hdac_device_register(&codec->core);
-	if (err < 0)
-		return err;
+	if (!device_is_registered(&codec->core.dev)) {
+		err = snd_hdac_device_register(&codec->core);
+		if (err < 0)
+			return err;
+	}
 
 	if (!codec->preset)
 		codec_bind_module(codec);
 	if (!codec->preset) {
 		err = codec_bind_generic(codec);
 		if (err < 0) {
-			codec_err(codec, "Unable to bind the codec\n");
-			goto error;
+			codec_dbg(codec, "Unable to bind the codec\n");
+			return err;
 		}
 	}
 
+	codec->configured = 1;
 	return 0;
-
- error:
-	snd_hdac_device_unregister(&codec->core);
-	return err;
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_configure);
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 4cec1bd77e6f..6dece719be66 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -791,6 +791,7 @@ void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec)
 	snd_array_free(&codec->nids);
 	remove_conn_list(codec);
 	snd_hdac_regmap_exit(&codec->core);
+	codec->configured = 0;
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_cleanup_for_unbind);
 
diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index b972d59eb1ec..3de7dc34def2 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -25,6 +25,7 @@
 #include <sound/core.h>
 #include <sound/initval.h>
 #include "hda_controller.h"
+#include "hda_local.h"
 
 #define CREATE_TRACE_POINTS
 #include "hda_controller_trace.h"
@@ -1259,17 +1260,24 @@ EXPORT_SYMBOL_GPL(azx_probe_codecs);
 int azx_codec_configure(struct azx *chip)
 {
 	struct hda_codec *codec, *next;
+	int success = 0;
 
-	/* use _safe version here since snd_hda_codec_configure() deregisters
-	 * the device upon error and deletes itself from the bus list.
-	 */
-	list_for_each_codec_safe(codec, next, &chip->bus) {
-		snd_hda_codec_configure(codec);
+	list_for_each_codec(codec, &chip->bus) {
+		if (!snd_hda_codec_configure(codec))
+			success++;
 	}
 
-	if (!azx_bus(chip)->num_codecs)
-		return -ENODEV;
-	return 0;
+	if (success) {
+		/* unregister failed codecs if any codec has been probed */
+		list_for_each_codec_safe(codec, next, &chip->bus) {
+			if (!codec->configured) {
+				codec_err(codec, "Unable to configure, disabling\n");
+				snd_hdac_device_unregister(&codec->core);
+			}
+		}
+	}
+
+	return success ? 0 : -ENODEV;
 }
 EXPORT_SYMBOL_GPL(azx_codec_configure);
 
diff --git a/sound/pci/hda/hda_controller.h b/sound/pci/hda/hda_controller.h
index 68f9668788ea..324cba13c7ba 100644
--- a/sound/pci/hda/hda_controller.h
+++ b/sound/pci/hda/hda_controller.h
@@ -41,7 +41,7 @@
 /* 24 unused */
 #define AZX_DCAPS_COUNT_LPIB_DELAY  (1 << 25)	/* Take LPIB as delay */
 #define AZX_DCAPS_PM_RUNTIME	(1 << 26)	/* runtime PM support */
-/* 27 unused */
+#define AZX_DCAPS_RETRY_PROBE	(1 << 27)	/* retry probe if no codec is configured */
 #define AZX_DCAPS_CORBRP_SELF_CLEAR (1 << 28)	/* CORBRP clears itself after reset */
 #define AZX_DCAPS_NO_MSI64      (1 << 29)	/* Stick to 32-bit MSIs */
 #define AZX_DCAPS_SEPARATE_STREAM_TAG	(1 << 30) /* capture and playback use separate stream tag */
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 4c8b281c3992..8bc27e7c0590 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -341,7 +341,8 @@ enum {
 /* quirks for AMD SB */
 #define AZX_DCAPS_PRESET_AMD_SB \
 	(AZX_DCAPS_NO_TCSEL | AZX_DCAPS_AMD_WORKAROUND |\
-	 AZX_DCAPS_SNOOP_TYPE(ATI) | AZX_DCAPS_PM_RUNTIME)
+	 AZX_DCAPS_SNOOP_TYPE(ATI) | AZX_DCAPS_PM_RUNTIME |\
+	 AZX_DCAPS_RETRY_PROBE)
 
 /* quirks for Nvidia */
 #define AZX_DCAPS_PRESET_NVIDIA \
@@ -1758,7 +1759,7 @@ static void azx_check_snoop_available(struct azx *chip)
 
 static void azx_probe_work(struct work_struct *work)
 {
-	struct hda_intel *hda = container_of(work, struct hda_intel, probe_work);
+	struct hda_intel *hda = container_of(work, struct hda_intel, probe_work.work);
 	azx_probe_continue(&hda->chip);
 }
 
@@ -1867,7 +1868,7 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 	}
 
 	/* continue probing in work context as may trigger request module */
-	INIT_WORK(&hda->probe_work, azx_probe_work);
+	INIT_DELAYED_WORK(&hda->probe_work, azx_probe_work);
 
 	*rchip = chip;
 
@@ -2202,7 +2203,7 @@ static int azx_probe(struct pci_dev *pci,
 #endif
 
 	if (schedule_probe)
-		schedule_work(&hda->probe_work);
+		schedule_delayed_work(&hda->probe_work, 0);
 
 	dev++;
 	if (chip->disabled)
@@ -2290,6 +2291,11 @@ static int azx_probe_continue(struct azx *chip)
 	int dev = chip->dev_index;
 	int err;
 
+	if (chip->disabled || hda->init_failed)
+		return -EIO;
+	if (hda->probe_retry)
+		goto probe_retry;
+
 	to_hda_bus(bus)->bus_probing = 1;
 	hda->probe_continued = 1;
 
@@ -2351,10 +2357,20 @@ static int azx_probe_continue(struct azx *chip)
 #endif
 	}
 #endif
+
+ probe_retry:
 	if (bus->codec_mask && !(probe_only[dev] & 1)) {
 		err = azx_codec_configure(chip);
-		if (err < 0)
+		if (err) {
+			if ((chip->driver_caps & AZX_DCAPS_RETRY_PROBE) &&
+			    ++hda->probe_retry < 60) {
+				schedule_delayed_work(&hda->probe_work,
+						      msecs_to_jiffies(1000));
+				return 0; /* keep things up */
+			}
+			dev_err(chip->card->dev, "Cannot probe codecs, giving up\n");
 			goto out_free;
+		}
 	}
 
 	err = snd_card_register(chip->card);
@@ -2384,6 +2400,7 @@ static int azx_probe_continue(struct azx *chip)
 		display_power(chip, false);
 	complete_all(&hda->probe_wait);
 	to_hda_bus(bus)->bus_probing = 0;
+	hda->probe_retry = 0;
 	return 0;
 }
 
@@ -2409,7 +2426,7 @@ static void azx_remove(struct pci_dev *pci)
 		 * device during cancel_work_sync() call.
 		 */
 		device_unlock(&pci->dev);
-		cancel_work_sync(&hda->probe_work);
+		cancel_delayed_work_sync(&hda->probe_work);
 		device_lock(&pci->dev);
 
 		snd_card_free(card);
diff --git a/sound/pci/hda/hda_intel.h b/sound/pci/hda/hda_intel.h
index 3fb119f09040..0f39418f9328 100644
--- a/sound/pci/hda/hda_intel.h
+++ b/sound/pci/hda/hda_intel.h
@@ -14,7 +14,7 @@ struct hda_intel {
 
 	/* sync probing */
 	struct completion probe_wait;
-	struct work_struct probe_work;
+	struct delayed_work probe_work;
 
 	/* card list (for power_save trigger) */
 	struct list_head list;
@@ -30,6 +30,8 @@ struct hda_intel {
 	unsigned int freed:1; /* resources already released */
 
 	bool need_i915_power:1; /* the hda controller needs i915 power */
+
+	int probe_retry;	/* being probe-retry */
 };
 
 #endif
-- 
2.33.0

