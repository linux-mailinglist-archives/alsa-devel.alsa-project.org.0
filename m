Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D7D78E7F7
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 10:28:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC0E8825;
	Thu, 31 Aug 2023 10:27:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC0E8825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693470484;
	bh=KGQVrdXu4KjhTnA5yPNDC9SK0NOJBuvLrjnzaGec0Fc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Sr8CJ+syFbfWa1QjLDk93mqSYvMqMFcu7WUZpquNWiry64KpJthVyPGTy7EbMCdxl
	 7A6Xj/xDwknV/SsHal0TByERCwXjngIh5qds5iaZEWhVCqnKIYxw8SkYt1E6etpy9Y
	 FBG/ioEmoOi1LI892N3gbPUQdkYEEPLK+kFOV4qk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E652F805F2; Thu, 31 Aug 2023 10:24:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD06DF805F1;
	Thu, 31 Aug 2023 10:24:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5009AF80249; Wed, 30 Aug 2023 17:37:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BFD60F80158;
	Wed, 30 Aug 2023 17:37:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFD60F80158
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
Subject: [PATCH v4 11/11] ALSA: hda/i915: Remove extra argument from
 snd_hdac_i915_init
Date: Wed, 30 Aug 2023 17:36:52 +0200
Message-Id: <20230830153652.217855-12-maarten.lankhorst@linux.intel.com>
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
Message-ID-Hash: 43KTL6SQOIRB5MGTFKE4GF4E7B7QWGSI
X-Message-ID-Hash: 43KTL6SQOIRB5MGTFKE4GF4E7B7QWGSI
X-Mailman-Approved-At: Thu, 31 Aug 2023 08:22:59 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/43KTL6SQOIRB5MGTFKE4GF4E7B7QWGSI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now that all drivers have moved from modprobe loading to
handling -EPROBE_DEFER, we can remove the argument again.

Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
Changes since v1:
- Use dev_err_probe() to set reason in debugfs for deferred probe.
---
 include/sound/hda_i915.h        |  4 ++--
 sound/hda/hdac_i915.c           | 14 +++-----------
 sound/pci/hda/hda_intel.c       |  2 +-
 sound/soc/intel/avs/core.c      |  2 +-
 sound/soc/intel/skylake/skl.c   |  2 +-
 sound/soc/sof/intel/hda-codec.c |  2 +-
 6 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/include/sound/hda_i915.h b/include/sound/hda_i915.h
index f91bd66360865..6b79614a893b9 100644
--- a/include/sound/hda_i915.h
+++ b/include/sound/hda_i915.h
@@ -9,12 +9,12 @@
 
 #ifdef CONFIG_SND_HDA_I915
 void snd_hdac_i915_set_bclk(struct hdac_bus *bus);
-int snd_hdac_i915_init(struct hdac_bus *bus, bool allow_modprobe);
+int snd_hdac_i915_init(struct hdac_bus *bus);
 #else
 static inline void snd_hdac_i915_set_bclk(struct hdac_bus *bus)
 {
 }
-static inline int snd_hdac_i915_init(struct hdac_bus *bus, bool allow_modprobe)
+static inline int snd_hdac_i915_init(struct hdac_bus *bus)
 {
 	return -ENODEV;
 }
diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index 0765e5350e7ba..365c36fdf2058 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -156,7 +156,7 @@ static int i915_gfx_present(struct pci_dev *hdac_pci)
  *
  * Returns zero for success or a negative error code.
  */
-int snd_hdac_i915_init(struct hdac_bus *bus, bool allow_modprobe)
+int snd_hdac_i915_init(struct hdac_bus *bus)
 {
 	struct drm_audio_component *acomp;
 	int err;
@@ -172,18 +172,10 @@ int snd_hdac_i915_init(struct hdac_bus *bus, bool allow_modprobe)
 	acomp = bus->audio_component;
 	if (!acomp)
 		return -ENODEV;
-	if (allow_modprobe && !acomp->ops) {
-		if (!IS_ENABLED(CONFIG_MODULES) ||
-		    !request_module("i915")) {
-			/* 60s timeout */
-			wait_for_completion_killable_timeout(&acomp->master_bind_complete,
-							     msecs_to_jiffies(60 * 1000));
-		}
-	}
 	if (!acomp->ops) {
-		int err = allow_modprobe ? -ENODEV : -EPROBE_DEFER;
 		snd_hdac_acomp_exit(bus);
-		return dev_err_probe(bus->dev, err, "couldn't bind with audio component\n");
+		return dev_err_probe(bus->dev, -EPROBE_DEFER,
+				     "couldn't bind with audio component\n");
 	}
 	return 0;
 }
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index d529ef21f033a..e0f01a3ab231c 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2138,7 +2138,7 @@ static int azx_probe(struct pci_dev *pci,
 #ifdef CONFIG_SND_HDA_I915
 	/* bind with i915 if needed */
 	if (chip->driver_caps & AZX_DCAPS_I915_COMPONENT) {
-		err = snd_hdac_i915_init(azx_bus(chip), false);
+		err = snd_hdac_i915_init(azx_bus(chip));
 		if (err < 0) {
 			/* if the controller is bound only with HDMI/DP
 			 * (for HSW and BDW), we need to abort the probe;
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 8a20639582487..33044f353575d 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -461,7 +461,7 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	pci_set_drvdata(pci, bus);
 	device_disable_async_suspend(dev);
 
-	ret = snd_hdac_i915_init(bus, false);
+	ret = snd_hdac_i915_init(bus);
 	if (ret == -EPROBE_DEFER)
 		goto err_i915_init;
 	else if (ret < 0)
diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 24bdbe2a53bec..f46f109d5856e 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -1056,7 +1056,7 @@ static int skl_probe(struct pci_dev *pci,
 	}
 
 	if (IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI)) {
-		err = snd_hdac_i915_init(bus, false);
+		err = snd_hdac_i915_init(bus);
 		if (err < 0)
 			goto out_dmic_unregister;
 	}
diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index f1fd5b44aaac9..8a5e99a898ecb 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -415,7 +415,7 @@ int hda_codec_i915_init(struct snd_sof_dev *sdev)
 		return 0;
 
 	/* i915 exposes a HDA codec for HDMI audio */
-	ret = snd_hdac_i915_init(bus, true);
+	ret = snd_hdac_i915_init(bus);
 	if (ret < 0)
 		return ret;
 
-- 
2.39.2

