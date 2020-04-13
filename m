Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2731A6405
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Apr 2020 10:24:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A153B16EE;
	Mon, 13 Apr 2020 10:23:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A153B16EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586766248;
	bh=HJPh6rA2HnJ0D4BRRcvFauyc0omNPWABOuiMwEzAbKI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vfBfw4oJpspRaS8o95nxhl4Xc8CCLH6w/fehedQyApoYCzKARfkr9lZQs+e446pTE
	 evlWEfMPeNV7kOwf0aUk/q8ZsSRbACuUh0LYY4TBDiSl67Gc6dBF/qM/KK6WjSlgN3
	 NHrLfC1YzayPWiZaQWRgsR3FSijwyrxWAOZJkR3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A615F80291;
	Mon, 13 Apr 2020 10:20:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91DB1F80299; Mon, 13 Apr 2020 10:20:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C3EAF80115
 for <alsa-devel@alsa-project.org>; Mon, 13 Apr 2020 10:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C3EAF80115
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A12F1AD10;
 Mon, 13 Apr 2020 08:20:39 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/6] ALSA: hda: Keep the controller initialization even if no
 codecs found
Date: Mon, 13 Apr 2020 10:20:32 +0200
Message-Id: <20200413082034.25166-5-tiwai@suse.de>
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

Currently, when the HD-audio controller driver doesn't detect any
codecs, it tries to abort the probe.  But this abort happens at the
delayed probe, i.e. the primary probe call already returned success,
hence the driver is never unbound until user does so explicitly.
As a result, it may leave the HD-audio device in the running state
without the runtime PM.  More badly, if the device is a HD-audio bus
that is tied with a GPU, GPU cannot reach to the full power down and
consumes unnecessarily much power.

This patch changes the logic after no-codec situation; it continues
probing without the further codec initialization but keep the
controller driver running normally.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207043
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_intel.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 692857904d49..aa0be85614b6 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2009,7 +2009,7 @@ static int azx_first_init(struct azx *chip)
 	/* codec detection */
 	if (!azx_bus(chip)->codec_mask) {
 		dev_err(card->dev, "no codecs found!\n");
-		return -ENODEV;
+		/* keep running the rest for the runtime PM */
 	}
 
 	if (azx_acquire_irq(chip, 0) < 0)
@@ -2303,9 +2303,11 @@ static int azx_probe_continue(struct azx *chip)
 #endif
 
 	/* create codec instances */
-	err = azx_probe_codecs(chip, azx_max_codecs[chip->driver_type]);
-	if (err < 0)
-		goto out_free;
+	if (bus->codec_mask) {
+		err = azx_probe_codecs(chip, azx_max_codecs[chip->driver_type]);
+		if (err < 0)
+			goto out_free;
+	}
 
 #ifdef CONFIG_SND_HDA_PATCH_LOADER
 	if (chip->fw) {
@@ -2319,7 +2321,7 @@ static int azx_probe_continue(struct azx *chip)
 #endif
 	}
 #endif
-	if ((probe_only[dev] & 1) == 0) {
+	if (bus->codec_mask && !(probe_only[dev] & 1)) {
 		err = azx_codec_configure(chip);
 		if (err < 0)
 			goto out_free;
-- 
2.16.4

