Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A1E13DCF6
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 15:08:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3244F17C8;
	Thu, 16 Jan 2020 15:08:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3244F17C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579183738;
	bh=UW/a/e04yh8i/IQQeMRYQ1P1h5qB9KgVL34wvSlGE/4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EzomEr+EZKf87Ejqk3zVW3h1wmqO7E1SprYbROKGTjyO7PH1A34jAHhwYOJ8VTIKv
	 msY4yrFSKX9USYV8n646QuJIsuGhzMVGh1xRBd9zwXtm202SeAZ98zoe7fzBum8tAa
	 4a3HJy2Q681yPOmGACycE27hiY4yb1xY6e1DjRUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE4FDF8026F;
	Thu, 16 Jan 2020 15:06:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 535EEF80216; Thu, 16 Jan 2020 15:06:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B67DF8014D
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 15:06:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B67DF8014D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2020 06:06:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,326,1574150400"; d="scan'208";a="373319937"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004.jf.intel.com with ESMTP; 16 Jan 2020 06:06:15 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Thu, 16 Jan 2020 16:06:08 +0200
Message-Id: <20200116140610.7247-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200116140610.7247-1-kai.vehmanen@linux.intel.com>
References: <20200116140610.7247-1-kai.vehmanen@linux.intel.com>
Cc: cujomalainey@chromium.org, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [PATCH 1/3] ASoC: SOF: Intel: refactor i915_get/put
	functions
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

The current interface to control i915 display power is misleading.
The hda_codec_i915_get() and hda_codec_i915_put() names suggest
a refcounting based interface. This is confusing as no refcounting
is done and the underlying HDAC library interface does not support
refcounts eithers.

Clarify the code by replacing the functions with a single
hda_codec_i915_display_power() that is aligned with
snd_hdac_display_power().

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 21 ++++++---------------
 sound/soc/sof/intel/hda.c       |  2 +-
 sound/soc/sof/intel/hda.h       |  7 +++----
 3 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 827f84a0722e..55d7f6a68bc5 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -171,23 +171,14 @@ EXPORT_SYMBOL(hda_codec_probe_bus);
 #if IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI) || \
 	IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI)
 
-void hda_codec_i915_get(struct snd_sof_dev *sdev)
+void hda_codec_i915_display_power(struct snd_sof_dev *sdev, bool enable)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 
-	dev_dbg(bus->dev, "Turning i915 HDAC power on\n");
-	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, true);
+	dev_dbg(bus->dev, "Turning i915 HDAC power %d\n", enable);
+	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, enable);
 }
-EXPORT_SYMBOL(hda_codec_i915_get);
-
-void hda_codec_i915_put(struct snd_sof_dev *sdev)
-{
-	struct hdac_bus *bus = sof_to_bus(sdev);
-
-	dev_dbg(bus->dev, "Turning i915 HDAC power off\n");
-	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, false);
-}
-EXPORT_SYMBOL(hda_codec_i915_put);
+EXPORT_SYMBOL_NS(hda_codec_i915_display_power, SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
 
 int hda_codec_i915_init(struct snd_sof_dev *sdev)
 {
@@ -199,7 +190,7 @@ int hda_codec_i915_init(struct snd_sof_dev *sdev)
 	if (ret < 0)
 		return ret;
 
-	hda_codec_i915_get(sdev);
+	hda_codec_i915_display_power(sdev, true);
 
 	return 0;
 }
@@ -210,7 +201,7 @@ int hda_codec_i915_exit(struct snd_sof_dev *sdev)
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	int ret;
 
-	hda_codec_i915_put(sdev);
+	hda_codec_i915_display_power(sdev, false);
 
 	ret = snd_hdac_i915_exit(bus);
 
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 91bd88fddac7..efe85a4d2cd0 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -477,7 +477,7 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	/* create codec instances */
 	hda_codec_probe_bus(sdev);
 
-	hda_codec_i915_put(sdev);
+	hda_codec_i915_display_power(sdev, false);
 
 	/*
 	 * we are done probing so decrement link counts
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 18d7e72bf9b7..f8ebb7a3da4f 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -584,15 +584,14 @@ void hda_codec_jack_check(struct snd_sof_dev *sdev);
 	(IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI) || \
 	 IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI))
 
-void hda_codec_i915_get(struct snd_sof_dev *sdev);
-void hda_codec_i915_put(struct snd_sof_dev *sdev);
+void hda_codec_i915_display_power(struct snd_sof_dev *sdev, bool enable);
 int hda_codec_i915_init(struct snd_sof_dev *sdev);
 int hda_codec_i915_exit(struct snd_sof_dev *sdev);
 
 #else
 
-static inline void hda_codec_i915_get(struct snd_sof_dev *sdev)  { }
-static inline void hda_codec_i915_put(struct snd_sof_dev *sdev)  { }
+static inline void hda_codec_i915_display_power(struct snd_sof_dev *sdev,
+						bool enable) { }
 static inline int hda_codec_i915_init(struct snd_sof_dev *sdev) { return 0; }
 static inline int hda_codec_i915_exit(struct snd_sof_dev *sdev) { return 0; }
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
