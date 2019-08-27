Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E20E9ECAA
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 17:30:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAE7F1667;
	Tue, 27 Aug 2019 17:29:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAE7F1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566919804;
	bh=RNRpmJ+NQEntCI9dthn+VzG17jK/nH37xf2Nnq/7+JI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cASIbGK10fVDNsAeOCWJkL4X4G/1GrO5QYAIQouGc8y7iP9BWJ41sG09PcE0EJ+0f
	 NZMCieTl/J/SZ5KWLuMxhLq6SD46+28nUb3bjd1A7Qy8LL5Mj8HMOzHBDroVsWNYuT
	 5vC7dOPIIOyLs1GQ56WNRzGBoh3G4wxZL5pviLPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75278F80274;
	Tue, 27 Aug 2019 17:28:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F38EF80274; Tue, 27 Aug 2019 17:28:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C21C0F80142
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 17:28:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C21C0F80142
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9BEA2AFBB;
 Tue, 27 Aug 2019 15:28:08 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue, 27 Aug 2019 17:28:06 +0200
Message-Id: <20190827152806.3012-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: [alsa-devel] [PATCH] ALSA: hda - Allow runtime PM for controller if
	component notifier is used
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

Currently we disallow the runtime PM of the HD-audio controller if
it's bound with HDMI/DP on Nvidia / AMD unless it's for dGPU.  This is
for keeping the link up to get the proper notification for ELD
hotplug.

As explained in the commit 37a3a98ef601 ("ALSA: hda - Enable runtime
PM only for discrete GPU"), this keep-power-up behavior is rather a
stop-gap solution until the ELD notification via audio component.
And now we finally got the audio component for these graphics drivers
via commit ade49db337a9 ("ALSA: hda/hdmi - Allow audio component for
AMD/ATI and Nvidia HDMI"), so it's time to change.

This patch makes HD-audio controller again runtime-suspendable when
the device gets bound with audio component in HDMI codec driver.  For
making it easier to access from the codec driver, move the flag into
the common hda_bus object instead of hda_intel flag.  Also rename it
to keep_power, to indicate the actual meaning.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hda_codec.h  |  1 +
 sound/pci/hda/hda_intel.c  | 11 +++++------
 sound/pci/hda/hda_intel.h  |  1 -
 sound/pci/hda/patch_hdmi.c |  4 +++-
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 871993696c5f..9a0393cf024c 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -59,6 +59,7 @@ struct hda_bus {
 	unsigned int in_reset:1;	/* during reset operation */
 	unsigned int no_response_fallback:1; /* don't fallback at RIRB error */
 	unsigned int bus_probing :1;	/* during probing process */
+	unsigned int keep_power:1;	/* keep power up for notification */
 
 	int primary_dig_out_type;	/* primary digital out PCM type */
 	unsigned int mixer_assigned;	/* codec addr for mixer name */
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 4496fce21300..91e71be42fa4 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -356,7 +356,7 @@ enum {
  */
 #ifdef SUPPORT_VGA_SWITCHEROO
 #define use_vga_switcheroo(chip)	((chip)->use_vga_switcheroo)
-#define needs_eld_notify_link(chip)	((chip)->need_eld_notify_link)
+#define needs_eld_notify_link(chip)	((chip)->bus.keep_power)
 #else
 #define use_vga_switcheroo(chip)	0
 #define needs_eld_notify_link(chip)	false
@@ -1145,7 +1145,7 @@ static int azx_runtime_idle(struct device *dev)
 		return -EBUSY;
 
 	/* ELD notification gets broken when HD-audio bus is off */
-	if (needs_eld_notify_link(hda))
+	if (needs_eld_notify_link(chip))
 		return -EBUSY;
 
 	return 0;
@@ -1256,7 +1256,7 @@ static void setup_vga_switcheroo_runtime_pm(struct azx *chip)
 	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
 	struct hda_codec *codec;
 
-	if (hda->use_vga_switcheroo && !hda->need_eld_notify_link) {
+	if (hda->use_vga_switcheroo && !needs_eld_notify_link(chip)) {
 		list_for_each_codec(codec, &chip->bus)
 			codec->auto_runtime_pm = 1;
 		/* reset the power save setup */
@@ -1270,10 +1270,9 @@ static void azx_vs_gpu_bound(struct pci_dev *pci,
 {
 	struct snd_card *card = pci_get_drvdata(pci);
 	struct azx *chip = card->private_data;
-	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
 
 	if (client_id == VGA_SWITCHEROO_DIS)
-		hda->need_eld_notify_link = 0;
+		chip->bus.keep_power = 0;
 	setup_vga_switcheroo_runtime_pm(chip);
 }
 
@@ -1285,7 +1284,7 @@ static void init_vga_switcheroo(struct azx *chip)
 		dev_info(chip->card->dev,
 			 "Handle vga_switcheroo audio client\n");
 		hda->use_vga_switcheroo = 1;
-		hda->need_eld_notify_link = 1; /* cleared in gpu_bound op */
+		chip->bus.keep_power = 1; /* cleared in either gpu_bound op or codec probe */
 		chip->driver_caps |= AZX_DCAPS_PM_RUNTIME;
 		pci_dev_put(p);
 	}
diff --git a/sound/pci/hda/hda_intel.h b/sound/pci/hda/hda_intel.h
index 1468865e0342..2acfff3da1a0 100644
--- a/sound/pci/hda/hda_intel.h
+++ b/sound/pci/hda/hda_intel.h
@@ -25,7 +25,6 @@ struct hda_intel {
 
 	/* vga_switcheroo setup */
 	unsigned int use_vga_switcheroo:1;
-	unsigned int need_eld_notify_link:1;
 	unsigned int vga_switcheroo_registered:1;
 	unsigned int init_failed:1; /* delayed init failed */
 
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 933c7bf47ef6..83b8b9d27711 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2542,8 +2542,10 @@ static void generic_acomp_init(struct hda_codec *codec,
 	spec->port2pin = port2pin;
 	setup_drm_audio_ops(codec, ops);
 	if (!snd_hdac_acomp_init(&codec->bus->core, &spec->drm_audio_ops,
-				 match_bound_vga, 0))
+				 match_bound_vga, 0)) {
 		spec->acomp_registered = true;
+		codec->bus->keep_power = 0;
+	}
 }
 
 /*
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
