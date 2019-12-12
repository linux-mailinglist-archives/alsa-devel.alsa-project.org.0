Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB92111D6E6
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 20:14:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65CFB16FC;
	Thu, 12 Dec 2019 20:13:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65CFB16FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576178063;
	bh=rFqxwgyBLGI4L2xaJ4RRthl79Il1s6fxDI1Rk9dAafs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eVYjG5JFumhY5wjfVeaM4gGil4mGfR9QMVhOgm2qxci+6GknuNkwCNUX6FUElpH72
	 Nmmw+TVKKIl23+Qr89gc+OdnqZaQvwGtTN0aj0QmmyoNJSug2JHwSL8guLbKlfR3lB
	 bnuHhJg1zs/RsRCUs7Yx2CF+kFeGmzVxlDlgruhs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80891F80257;
	Thu, 12 Dec 2019 20:11:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5251F801D8; Thu, 12 Dec 2019 20:11:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8555DF801D8
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 20:11:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8555DF801D8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 254C9B135;
 Thu, 12 Dec 2019 19:11:03 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Thu, 12 Dec 2019 20:11:01 +0100
Message-Id: <20191212191101.19517-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191212191101.19517-1-tiwai@suse.de>
References: <20191212191101.19517-1-tiwai@suse.de>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 2/2] ALSA: hda: Unify get_response handling
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

Now most of the get_response handling became quite similar between
HDA-core and legacy drivers, and the only differences are:

- the handling of extra-long polling delay for some codecs
- the debug message for the stalled communication

and both are worth to share in the common code.

This patch unifies the code into snd_hdac_bus_get_response(), and use
this from the legacy get_response callback.  It results in a good
amount of code reduction in the end.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hda_codec.h      |  1 -
 include/sound/hdaudio.h        |  1 +
 sound/hda/hdac_controller.c    | 11 +++++++++-
 sound/pci/hda/hda_controller.c | 49 ++++--------------------------------------
 sound/pci/hda/hda_intel.c      |  2 +-
 sound/pci/hda/hda_tegra.c      |  2 +-
 sound/pci/hda/patch_ca0110.c   |  2 +-
 sound/pci/hda/patch_sigmatel.c |  2 +-
 8 files changed, 19 insertions(+), 51 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index ac18f428eda6..3ee8036f5436 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -51,7 +51,6 @@ struct hda_bus {
 	DECLARE_BITMAP(pcm_dev_bits, SNDRV_PCM_DEVICES);
 
 	/* misc op flags */
-	unsigned int needs_damn_long_delay :1;
 	unsigned int allow_bus_reset:1;	/* allow bus reset at fatal error */
 	/* status for codec/controller */
 	unsigned int shutdown :1;	/* being unloaded */
diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 81373a2efd96..bc2f77a6f17b 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -338,6 +338,7 @@ struct hdac_bus {
 	bool reverse_assign:1;		/* assign devices in reverse order */
 	bool corbrp_self_clear:1;	/* CORBRP clears itself after reset */
 	bool polling_mode:1;
+	bool needs_damn_long_delay:1;
 
 	int poll_count;
 
diff --git a/sound/hda/hdac_controller.c b/sound/hda/hdac_controller.c
index 61950b83b8c9..01787081552d 100644
--- a/sound/hda/hdac_controller.c
+++ b/sound/hda/hdac_controller.c
@@ -242,6 +242,7 @@ int snd_hdac_bus_get_response(struct hdac_bus *bus, unsigned int addr,
 	unsigned long timeout;
 	unsigned long loopcounter;
 	wait_queue_entry_t wait;
+	bool warned = false;
 
 	init_wait_entry(&wait, 0);
 	timeout = jiffies + msecs_to_jiffies(1000);
@@ -264,9 +265,17 @@ int snd_hdac_bus_get_response(struct hdac_bus *bus, unsigned int addr,
 		spin_unlock_irq(&bus->reg_lock);
 		if (time_after(jiffies, timeout))
 			break;
+#define LOOP_COUNT_MAX	3000
 		if (!bus->polling_mode) {
 			schedule_timeout(msecs_to_jiffies(2));
-		} else if (loopcounter > 3000) {
+		} else if (bus->needs_damn_long_delay ||
+			   loopcounter > LOOP_COUNT_MAX) {
+			if (loopcounter > LOOP_COUNT_MAX && !warned) {
+				dev_dbg_ratelimited(bus->dev,
+						    "too slow response, last cmd=%#08x\n",
+						    bus->last_cmd[addr]);
+				warned = true;
+			}
 			msleep(2); /* temporary workaround */
 		} else {
 			udelay(10);
diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 870102f00efd..d6a7bda28925 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -784,53 +784,12 @@ static int azx_rirb_get_response(struct hdac_bus *bus, unsigned int addr,
 {
 	struct azx *chip = bus_to_azx(bus);
 	struct hda_bus *hbus = &chip->bus;
-	unsigned long timeout;
-	unsigned long loopcounter;
-	wait_queue_entry_t wait;
-	bool warned = false;
+	int err;
 
-	init_wait_entry(&wait, 0);
  again:
-	timeout = jiffies + msecs_to_jiffies(1000);
-
-	for (loopcounter = 0;; loopcounter++) {
-		spin_lock_irq(&bus->reg_lock);
-		if (!bus->polling_mode)
-			prepare_to_wait(&bus->rirb_wq, &wait,
-					TASK_UNINTERRUPTIBLE);
-		if (bus->polling_mode)
-			snd_hdac_bus_update_rirb(bus);
-		if (!bus->rirb.cmds[addr]) {
-			if (res)
-				*res = bus->rirb.res[addr]; /* the last value */
-			if (!bus->polling_mode)
-				finish_wait(&bus->rirb_wq, &wait);
-			spin_unlock_irq(&bus->reg_lock);
-			return 0;
-		}
-		spin_unlock_irq(&bus->reg_lock);
-		if (time_after(jiffies, timeout))
-			break;
-#define LOOP_COUNT_MAX	3000
-		if (!bus->polling_mode) {
-			schedule_timeout(msecs_to_jiffies(2));
-		} else if (hbus->needs_damn_long_delay ||
-		    loopcounter > LOOP_COUNT_MAX) {
-			if (loopcounter > LOOP_COUNT_MAX && !warned) {
-				dev_dbg_ratelimited(chip->card->dev,
-						    "too slow response, last cmd=%#08x\n",
-						    bus->last_cmd[addr]);
-				warned = true;
-			}
-			msleep(2); /* temporary workaround */
-		} else {
-			udelay(10);
-			cond_resched();
-		}
-	}
-
-	if (!bus->polling_mode)
-		finish_wait(&bus->rirb_wq, &wait);
+	err = snd_hdac_bus_get_response(bus, addr, res);
+	if (!err)
+		return 0;
 
 	if (hbus->no_response_fallback)
 		return -EIO;
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index c86539cdbd4b..c7efb6f66bdc 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -1809,7 +1809,7 @@ static int azx_create(struct snd_card *card, struct pci_dev *pci,
 
 	if (chip->driver_type == AZX_DRIVER_NVIDIA) {
 		dev_dbg(chip->card->dev, "Enable delay in RIRB handling\n");
-		chip->bus.needs_damn_long_delay = 1;
+		chip->bus.core.needs_damn_long_delay = 1;
 	}
 
 	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 269f242fcbfd..9d0784aed9e4 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -394,7 +394,7 @@ static int hda_tegra_create(struct snd_card *card,
 	if (err < 0)
 		return err;
 
-	chip->bus.needs_damn_long_delay = 1;
+	chip->bus.core.needs_damn_long_delay = 1;
 
 	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
 	if (err < 0) {
diff --git a/sound/pci/hda/patch_ca0110.c b/sound/pci/hda/patch_ca0110.c
index e780922a1190..1818ce67f761 100644
--- a/sound/pci/hda/patch_ca0110.c
+++ b/sound/pci/hda/patch_ca0110.c
@@ -53,7 +53,7 @@ static int patch_ca0110(struct hda_codec *codec)
 	codec->patch_ops = ca0110_patch_ops;
 
 	spec->multi_cap_vol = 1;
-	codec->bus->needs_damn_long_delay = 1;
+	codec->bus->core.needs_damn_long_delay = 1;
 
 	err = ca0110_parse_auto_config(codec);
 	if (err < 0)
diff --git a/sound/pci/hda/patch_sigmatel.c b/sound/pci/hda/patch_sigmatel.c
index 894f3f509e76..8ecb53bce509 100644
--- a/sound/pci/hda/patch_sigmatel.c
+++ b/sound/pci/hda/patch_sigmatel.c
@@ -4908,7 +4908,7 @@ static int patch_stac927x(struct hda_codec *codec)
 	 * The below flag enables the longer delay (see get_response
 	 * in hda_intel.c).
 	 */
-	codec->bus->needs_damn_long_delay = 1;
+	codec->bus->core.needs_damn_long_delay = 1;
 
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PROBE);
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
