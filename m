Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FDF284FBC
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 18:22:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFFDC171C;
	Tue,  6 Oct 2020 18:21:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFFDC171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602001333;
	bh=5FACkKkPigbQvpZquFZSiyrzRXyL9U2LnePewUC3eZY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GxVJBpuRu9+hk6OlkWd5Jg7AmLC7hD1jVHWm8eBivJyqyYMshIAooW35cEYsuWBee
	 u8oPkBE7vz4fksF6LRp7k+8CARfaeTbtlHJFEStJvJSj0WtUjFXLu4Hx1sQKrA16wC
	 gXuV66TCwHaHJ04NUegGN6E/J58zxoAnN16Q6/ts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98594F80127;
	Tue,  6 Oct 2020 18:20:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CCE9F8012A; Tue,  6 Oct 2020 18:20:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A86B4F80127
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 18:20:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A86B4F80127
IronPort-SDR: JQCZtcnK49SFPqSRGY2i6dwrXyRKL9EmbiUNUYyMR8C1c7Ws3xtne/1M1TWpDYDL0M3DER1KrV
 k55+UVQ7IkSQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="226159758"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="226159758"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 09:19:45 -0700
IronPort-SDR: rykPb+F00eOIYzeQ87BYpQocUltM8yEEajjSDyj1Nm5O8tCPOAI6GlKp2JR9zlnMJJlExydZMi
 LOsAllcW2TdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="327619123"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 06 Oct 2020 09:19:40 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: tiwai@suse.de, alsa-devel@alsa-project.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH] ALSA: hda/i915 - fix list corruption with concurrent probes
Date: Tue,  6 Oct 2020 19:17:22 +0300
Message-Id: <20201006161722.500256-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

Current hdac_i915 uses a static completion instance to wait
for i915 driver to complete the component bind.

This design is not safe if multiple HDA controllers are active and
communicating with different i915 instances, and can lead to list
corruption and failed audio driver probe.

Fix the design by moving completion mechanism to common acomp
code and remove the related code from hdac_i915.

Co-developed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/drm/drm_audio_component.h |  4 ++++
 sound/hda/hdac_component.c        |  3 +++
 sound/hda/hdac_i915.c             | 23 +++--------------------
 3 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/include/drm/drm_audio_component.h b/include/drm/drm_audio_component.h
index a45f93487039..0d36bfd1a4cd 100644
--- a/include/drm/drm_audio_component.h
+++ b/include/drm/drm_audio_component.h
@@ -117,6 +117,10 @@ struct drm_audio_component {
 	 * @audio_ops: Ops implemented by hda driver, called by DRM driver
 	 */
 	const struct drm_audio_component_audio_ops *audio_ops;
+	/**
+	 * @master_bind_complete: completion held during component master binding
+	 */
+	struct completion master_bind_complete;
 };
 
 #endif /* _DRM_AUDIO_COMPONENT_H_ */
diff --git a/sound/hda/hdac_component.c b/sound/hda/hdac_component.c
index 89126c6fd216..bb37e7e0bd79 100644
--- a/sound/hda/hdac_component.c
+++ b/sound/hda/hdac_component.c
@@ -210,12 +210,14 @@ static int hdac_component_master_bind(struct device *dev)
 			goto module_put;
 	}
 
+	complete_all(&acomp->master_bind_complete);
 	return 0;
 
  module_put:
 	module_put(acomp->ops->owner);
 out_unbind:
 	component_unbind_all(dev, acomp);
+	complete_all(&acomp->master_bind_complete);
 
 	return ret;
 }
@@ -296,6 +298,7 @@ int snd_hdac_acomp_init(struct hdac_bus *bus,
 	if (!acomp)
 		return -ENOMEM;
 	acomp->audio_ops = aops;
+	init_completion(&acomp->master_bind_complete);
 	bus->audio_component = acomp;
 	devres_add(dev, acomp);
 
diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index 5f0a1aa6ad84..454474ac5716 100644
--- a/sound/hda/hdac_i915.c
+++ b/sound/hda/hdac_i915.c
@@ -11,8 +11,6 @@
 #include <sound/hda_i915.h>
 #include <sound/hda_register.h>
 
-static struct completion bind_complete;
-
 #define IS_HSW_CONTROLLER(pci) (((pci)->device == 0x0a0c) || \
 				((pci)->device == 0x0c0c) || \
 				((pci)->device == 0x0d0c) || \
@@ -130,19 +128,6 @@ static bool i915_gfx_present(void)
 	return pci_dev_present(ids);
 }
 
-static int i915_master_bind(struct device *dev,
-			    struct drm_audio_component *acomp)
-{
-	complete_all(&bind_complete);
-	/* clear audio_ops here as it was needed only for completion call */
-	acomp->audio_ops = NULL;
-	return 0;
-}
-
-static const struct drm_audio_component_audio_ops i915_init_ops = {
-	.master_bind = i915_master_bind
-};
-
 /**
  * snd_hdac_i915_init - Initialize i915 audio component
  * @bus: HDA core bus
@@ -163,9 +148,7 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
 	if (!i915_gfx_present())
 		return -ENODEV;
 
-	init_completion(&bind_complete);
-
-	err = snd_hdac_acomp_init(bus, &i915_init_ops,
+	err = snd_hdac_acomp_init(bus, NULL,
 				  i915_component_master_match,
 				  sizeof(struct i915_audio_component) - sizeof(*acomp));
 	if (err < 0)
@@ -177,8 +160,8 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
 		if (!IS_ENABLED(CONFIG_MODULES) ||
 		    !request_module("i915")) {
 			/* 60s timeout */
-			wait_for_completion_timeout(&bind_complete,
-						   msecs_to_jiffies(60 * 1000));
+			wait_for_completion_timeout(&acomp->master_bind_complete,
+						    msecs_to_jiffies(60 * 1000));
 		}
 	}
 	if (!acomp->ops) {
-- 
2.28.0

