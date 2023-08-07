Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 066E47739B2
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 12:40:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D5F1DF1;
	Tue,  8 Aug 2023 12:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D5F1DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691491240;
	bh=8McqbbezO271+KC7qDPXniQh571+OqINkYhgn+UNFyk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O0pP99rSqbpHkTI2ihChQPX4la4OgMv3eKTpNVi6P8RUjIa+5bQELW0pYCuTLFIFj
	 OAcMg3QFPxmlJDveU3vkqTkqM84nrenVu3n0Wioo+Ty1/JCYcyLFwVgkapzelzxMK6
	 lWKV7QYQTTGr7v4zycZT2dCjKXbtL855h84+lgHY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A9D2F8061E; Tue,  8 Aug 2023 12:36:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F08FFF80619;
	Tue,  8 Aug 2023 12:36:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4A8DF80534; Mon,  7 Aug 2023 11:01:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60D3BF80116;
	Mon,  7 Aug 2023 11:01:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60D3BF80116
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: Maarten Lankhorst <dev@lankhorst.se>,
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
	sound-open-firmware@alsa-project.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH v3 3/9] ALSA: hda/i915: Add an allow_modprobe argument to
 snd_hdac_i915_init
Date: Mon,  7 Aug 2023 11:00:39 +0200
Message-Id: <20230807090045.198993-4-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807090045.198993-1-maarten.lankhorst@linux.intel.com>
References: <20230807090045.198993-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: mlankhorst@mblankhorst.nl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: S6HSORSZVBEUFCU5V6GO3FTXXGUO65YP
X-Message-ID-Hash: S6HSORSZVBEUFCU5V6GO3FTXXGUO65YP
X-Mailman-Approved-At: Tue, 08 Aug 2023 10:35:42 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S6HSORSZVBEUFCU5V6GO3FTXXGUO65YP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Xe is a new GPU driver that re-uses the display (and sound) code from
i915. It's no longer possible to load i915, as the GPU can be driven
by the xe driver instead.

The new behavior will return -EPROBE_DEFER, and wait for a compatible
driver to be loaded instead of modprobing i915.

Converting all drivers at the same time is a lot of work, instead we
will convert each user one by one.

Changes since v1:
- Use dev_err_probe to set a probe reason for debugfs' deferred_devices.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/hda_i915.h        | 4 ++--
 sound/hda/hdac_i915.c           | 8 ++++----
 sound/pci/hda/hda_intel.c       | 2 +-
 sound/soc/intel/avs/core.c      | 2 +-
 sound/soc/intel/skylake/skl.c   | 2 +-
 sound/soc/sof/intel/hda-codec.c | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/sound/hda_i915.h b/include/sound/hda_i915.h
index 6b79614a893b..f91bd6636086 100644
--- a/include/sound/hda_i915.h
+++ b/include/sound/hda_i915.h
@@ -9,12 +9,12 @@
 
 #ifdef CONFIG_SND_HDA_I915
 void snd_hdac_i915_set_bclk(struct hdac_bus *bus);
-int snd_hdac_i915_init(struct hdac_bus *bus);
+int snd_hdac_i915_init(struct hdac_bus *bus, bool allow_modprobe);
 #else
 static inline void snd_hdac_i915_set_bclk(struct hdac_bus *bus)
 {
 }
-static inline int snd_hdac_i915_init(struct hdac_bus *bus)
+static inline int snd_hdac_i915_init(struct hdac_bus *bus, bool allow_modprobe)
 {
 	return -ENODEV;
 }
diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index c32709fa4115..961fcd3397f4 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -155,7 +155,7 @@ static int i915_gfx_present(struct pci_dev *hdac_pci)
  *
  * Returns zero for success or a negative error code.
  */
-int snd_hdac_i915_init(struct hdac_bus *bus)
+int snd_hdac_i915_init(struct hdac_bus *bus, bool allow_modprobe)
 {
 	struct drm_audio_component *acomp;
 	int err;
@@ -171,7 +171,7 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
 	acomp = bus->audio_component;
 	if (!acomp)
 		return -ENODEV;
-	if (!acomp->ops) {
+	if (allow_modprobe && !acomp->ops) {
 		if (!IS_ENABLED(CONFIG_MODULES) ||
 		    !request_module("i915")) {
 			/* 60s timeout */
@@ -180,9 +180,9 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
 		}
 	}
 	if (!acomp->ops) {
-		dev_info(bus->dev, "couldn't bind with audio component\n");
+		int err = allow_modprobe ? -ENODEV : -EPROBE_DEFER;
 		snd_hdac_acomp_exit(bus);
-		return -ENODEV;
+		return dev_err_probe(bus->dev, err, "couldn't bind with audio component\n");
 	}
 	return 0;
 }
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 0d2d6bc6c75e..11cf9907f039 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2277,7 +2277,7 @@ static int azx_probe_continue(struct azx *chip)
 
 	/* bind with i915 if needed */
 	if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT) {
-		err = snd_hdac_i915_init(bus);
+		err = snd_hdac_i915_init(bus, true);
 		if (err < 0) {
 			/* if the controller is bound only with HDMI/DP
 			 * (for HSW and BDW), we need to abort the probe;
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 637501850728..3311a6f14200 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -191,7 +191,7 @@ static void avs_hda_probe_work(struct work_struct *work)
 
 	pm_runtime_set_active(bus->dev); /* clear runtime_error flag */
 
-	ret = snd_hdac_i915_init(bus);
+	ret = snd_hdac_i915_init(bus, true);
 	if (ret < 0)
 		dev_info(bus->dev, "i915 init unsuccessful: %d\n", ret);
 
diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 998bd0232cf1..4d93b8690467 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -791,7 +791,7 @@ static int skl_i915_init(struct hdac_bus *bus)
 	 * The HDMI codec is in GPU so we need to ensure that it is powered
 	 * up and ready for probe
 	 */
-	err = snd_hdac_i915_init(bus);
+	err = snd_hdac_i915_init(bus, true);
 	if (err < 0)
 		return err;
 
diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 8a5e99a898ec..f1fd5b44aaac 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -415,7 +415,7 @@ int hda_codec_i915_init(struct snd_sof_dev *sdev)
 		return 0;
 
 	/* i915 exposes a HDA codec for HDMI audio */
-	ret = snd_hdac_i915_init(bus);
+	ret = snd_hdac_i915_init(bus, true);
 	if (ret < 0)
 		return ret;
 
-- 
2.39.2

