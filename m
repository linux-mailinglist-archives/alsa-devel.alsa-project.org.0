Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAB878E7F2
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 10:27:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB21D1FC;
	Thu, 31 Aug 2023 10:26:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB21D1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693470440;
	bh=dzFf4hVC6rODjs6jPNMNAegX/tzWYItlJQ18wRqyZN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZY1Poi5j0Eiyl2HjEZAxSwVJp0mNWtClT+40PdTsVacWH6eHEnj9b10NmTq0HGZo3
	 Qsnx47P5tXKRZhFkxoF61Np/5yCavZ7kqu5WmmQLAV7kjLa/ypmaEw+TqnADlzFxyS
	 Fbp9JwcZJTivfL6WuWqUPHnZLITAL9w51ht8W54s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DECEF805DF; Thu, 31 Aug 2023 10:24:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1662FF805DF;
	Thu, 31 Aug 2023 10:24:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60B37F8055B; Wed, 30 Aug 2023 17:37:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6797CF805A8;
	Wed, 30 Aug 2023 17:37:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6797CF805A8
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: [PATCH v4 09/11] ALSA: hda/intel: Move snd_hdac_i915_init to before
 probe_work.
Date: Wed, 30 Aug 2023 17:36:50 +0200
Message-Id: <20230830153652.217855-10-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230830153652.217855-1-maarten.lankhorst@linux.intel.com>
References: <20230830153652.217855-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: mlankhorst@mblankhorst.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: AG3FGWAWFSY4DNPONKDCXFJ2QFTLXW74
X-Message-ID-Hash: AG3FGWAWFSY4DNPONKDCXFJ2QFTLXW74
X-Mailman-Approved-At: Thu, 31 Aug 2023 08:22:59 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AG3FGWAWFSY4DNPONKDCXFJ2QFTLXW74/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now that we can use -EPROBE_DEFER, it's no longer required to spin off
the snd_hdac_i915_init into a workqueue.

Use the -EPROBE_DEFER mechanism instead, which must be returned in the
probe function.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

---
Changes since v1:
- Use dev_err_probe()
- Don't move probed_devs bitmap unnecessarily. (tiwai)
- Move snd_hdac_i915_init slightly upward, to ensure
  it's always initialised before vga-switcheroo is called.
---
 sound/pci/hda/hda_intel.c | 59 ++++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 29 deletions(-)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 85fa15bbd8513..d529ef21f033a 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2135,6 +2135,36 @@ static int azx_probe(struct pci_dev *pci,
 
 	pci_set_drvdata(pci, card);
 
+#ifdef CONFIG_SND_HDA_I915
+	/* bind with i915 if needed */
+	if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT) {
+		err = snd_hdac_i915_init(azx_bus(chip), false);
+		if (err < 0) {
+			/* if the controller is bound only with HDMI/DP
+			 * (for HSW and BDW), we need to abort the probe;
+			 * for other chips, still continue probing as other
+			 * codecs can be on the same link.
+			 */
+			if (HDA_CONTROLLER_IN_GPU(pci)) {
+				dev_err_probe(card->dev, err,
+					     "HSW/BDW HD-audio HDMI/DP requires binding with gfx driver\n");
+
+				goto out_free;
+			} else {
+				/* don't bother any longer */
+				chip->driver_caps &= ~AZX_DCAPS_I915_COMPONENT;
+			}
+		}
+
+		/* HSW/BDW controllers need this power */
+		if (HDA_CONTROLLER_IN_GPU(pci))
+			hda->need_i915_power = true;
+	}
+#else
+	if (HDA_CONTROLLER_IN_GPU(pci))
+		dev_err(card->dev, "Haswell/Broadwell HDMI/DP must build in CONFIG_SND_HDA_I915\n");
+#endif
+
 	err = register_vga_switcheroo(chip);
 	if (err < 0) {
 		dev_err(card->dev, "Error registering vga_switcheroo client\n");
@@ -2162,11 +2192,6 @@ static int azx_probe(struct pci_dev *pci,
 	}
 #endif /* CONFIG_SND_HDA_PATCH_LOADER */
 
-#ifndef CONFIG_SND_HDA_I915
-	if (HDA_CONTROLLER_IN_GPU(pci))
-		dev_err(card->dev, "Haswell/Broadwell HDMI/DP must build in CONFIG_SND_HDA_I915\n");
-#endif
-
 	if (schedule_probe)
 		schedule_delayed_work(&hda->probe_work, 0);
 
@@ -2263,30 +2288,6 @@ static int azx_probe_continue(struct azx *chip)
 	to_hda_bus(bus)->bus_probing = 1;
 	hda->probe_continued = 1;
 
-	/* bind with i915 if needed */
-	if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT) {
-		err = snd_hdac_i915_init(bus, true);
-		if (err < 0) {
-			/* if the controller is bound only with HDMI/DP
-			 * (for HSW and BDW), we need to abort the probe;
-			 * for other chips, still continue probing as other
-			 * codecs can be on the same link.
-			 */
-			if (HDA_CONTROLLER_IN_GPU(pci)) {
-				dev_err(chip->card->dev,
-					"HSW/BDW HD-audio HDMI/DP requires binding with gfx driver\n");
-				goto out_free;
-			} else {
-				/* don't bother any longer */
-				chip->driver_caps &= ~AZX_DCAPS_I915_COMPONENT;
-			}
-		}
-
-		/* HSW/BDW controllers need this power */
-		if (HDA_CONTROLLER_IN_GPU(pci))
-			hda->need_i915_power = true;
-	}
-
 	/* Request display power well for the HDA controller or codec. For
 	 * Haswell/Broadwell, both the display HDA controller and codec need
 	 * this power. For other platforms, like Baytrail/Braswell, only the
-- 
2.39.2

