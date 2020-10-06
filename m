Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33030284AFE
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 13:35:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF9791752;
	Tue,  6 Oct 2020 13:34:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF9791752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601984112;
	bh=6fY0AL8El51jR8+7VKbaRWNL56TXVZB6GvVDJkPsnQM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QIsytr/atrAx5cro0eq3qO8IsPIB96VkcssB2Z8ljJ5pvyhBJz6lxZyq4JUaXRlUz
	 eNNqzQMCXVotBUWCdjVihBH4LATU2aIa2mPcdrcjTvWuAQGxXkJPekOtvW7av02eLb
	 PnxIVuvR5MY73Auar1K2H2WJ5IeKEV8chBtGa4HI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 465AEF8015B;
	Tue,  6 Oct 2020 13:32:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0032F8012B; Tue,  6 Oct 2020 13:32:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C214FF80053
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 13:32:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C214FF80053
IronPort-SDR: M7ckcz4d5PBGGGJa0WtIW5QVSQ+iO3g0eXPeXyEeOtqMMm/GiUjKd0bHyPA5xPEocPaPWvH16p
 MquyuYojdZog==
X-IronPort-AV: E=McAfee;i="6000,8403,9765"; a="163682601"
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="163682601"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2020 04:32:30 -0700
IronPort-SDR: rTEJ2ByDI1oBACzvtRc7Qs8XmRM9lzWtI2kZBHnyLi5xjIegFL7DjydImp49YeJV2Q+u275Koy
 MBYU0CJ4NADQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,343,1596524400"; d="scan'208";a="460759629"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004.jf.intel.com with ESMTP; 06 Oct 2020 04:32:29 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [RFC PATCH 2/2] ALSA: hda/i915 - fix list corruption with concurrent
 probes
Date: Tue,  6 Oct 2020 14:30:42 +0300
Message-Id: <20201006113042.471718-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201006113042.471718-1-kai.vehmanen@linux.intel.com>
References: <20201006113042.471718-1-kai.vehmanen@linux.intel.com>
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

Current hdac_i915 uses a static completion instance to synchronous
communication with i915 driver. This design is not safe if multiple
HDA controllers are active and talking to different i915 instances,
and can lead to list corruption and failed audio driver probe.

Fix the design by storing the completion object to hdac_bus,
and signaling completions on a per-bus basis.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/hdaudio.h |  2 ++
 sound/hda/hdac_i915.c   | 16 +++++++++-------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index 6eed61e6cf8a..116c89074d79 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -6,6 +6,7 @@
 #ifndef __SOUND_HDAUDIO_H
 #define __SOUND_HDAUDIO_H
 
+#include <linux/completion.h>
 #include <linux/device.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -359,6 +360,7 @@ struct hdac_bus {
 	struct drm_audio_component *audio_component;
 	long display_power_status;
 	unsigned long display_power_active;
+	struct completion display_bind_complete;
 
 	/* parameters required for enhanced capabilities */
 	int num_streams;
diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
index 5f0a1aa6ad84..fee3d379d7e0 100644
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
@@ -133,9 +131,14 @@ static bool i915_gfx_present(void)
 static int i915_master_bind(struct device *dev,
 			    struct drm_audio_component *acomp)
 {
-	complete_all(&bind_complete);
+	struct hdac_bus *bus = snd_hdac_acomp_get_bus(dev);
+
+	if (!bus)
+		return -EINVAL;
+	complete_all(&bus->display_bind_complete);
 	/* clear audio_ops here as it was needed only for completion call */
 	acomp->audio_ops = NULL;
+
 	return 0;
 }
 
@@ -163,8 +166,7 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
 	if (!i915_gfx_present())
 		return -ENODEV;
 
-	init_completion(&bind_complete);
-
+	init_completion(&bus->display_bind_complete);
 	err = snd_hdac_acomp_init(bus, &i915_init_ops,
 				  i915_component_master_match,
 				  sizeof(struct i915_audio_component) - sizeof(*acomp));
@@ -177,8 +179,8 @@ int snd_hdac_i915_init(struct hdac_bus *bus)
 		if (!IS_ENABLED(CONFIG_MODULES) ||
 		    !request_module("i915")) {
 			/* 60s timeout */
-			wait_for_completion_timeout(&bind_complete,
-						   msecs_to_jiffies(60 * 1000));
+			wait_for_completion_timeout(&bus->display_bind_complete,
+						    msecs_to_jiffies(60 * 1000));
 		}
 	}
 	if (!acomp->ops) {
-- 
2.28.0

