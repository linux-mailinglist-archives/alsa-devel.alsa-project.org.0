Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5FB6101DB
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 21:40:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B5D92DC5;
	Thu, 27 Oct 2022 21:39:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B5D92DC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666899610;
	bh=3l31m3UNM5J6SqzitpcKaeqqD4ntI7MZ+7QJFKiOZxc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MS7PDYh67peGwIs5f2YJSxwGTLK6PsyHfGtxTrYFd6BpjMEIwNIit8MGZhhM7K3Qg
	 AgdjuaDqSBbg1lrU3gP43Cb2s4sRNDuQq+cx4V55xT9IsMofsN9T265n8pDBiNlnr9
	 5lXJVK3fsjw6mHWVFySpejJ20HZXiziTszg6mcvE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9DF9F80579;
	Thu, 27 Oct 2022 21:36:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34219F8058C; Thu, 27 Oct 2022 21:36:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 674CFF80100
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 21:36:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 674CFF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Cm9YTbrh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666899375; x=1698435375;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3l31m3UNM5J6SqzitpcKaeqqD4ntI7MZ+7QJFKiOZxc=;
 b=Cm9YTbrhEZSZta2kGGfKGuIFQwjchKYpXxfgqOoUZHuG51FXB8VeYFtB
 z8ycfZmJPQbVCVOLVAh64lXdCODrCwRdtjUqI5RjZoh1ZaDXFGwdoUayA
 6z+jp4q/URDutATGWs2VkVVPMBSKUXitAPTafrHfbu9vsAQzMBgkWZkYJ
 jmneK/ypAk/RqBRmgZBWaXj4ZSuUznFnLRht9OhsA6Eabxdnk0qdEaO24
 7IP9qpTujmti9PN41UHgshmQGIr8VdZ/8MrHFvLv2FCvw1GaThCDB8Zt7
 3I3hXm03rOV8AqwS9VO4ZrCKGccO6WtKO5o4I8WKuUiIKFEHZZY1mo6kk A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="334957829"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="334957829"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:13 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="632527012"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="632527012"
Received: from vmehta-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.6.254])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/21] ASoC: SOF: Intel: hda-codec: add
 hda_codec_device_remove() helper
Date: Thu, 27 Oct 2022 15:35:28 -0400
Message-Id: <20221027193540.259520-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
References: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Continue split between controller and codec.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 9 +++++++++
 sound/soc/sof/intel/hda.c       | 5 +----
 sound/soc/sof/intel/hda.h       | 2 ++
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index ff40ec623118..1e8e184151f2 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -280,6 +280,15 @@ void hda_codec_set_codec_wakeup(struct snd_sof_dev *sdev, bool status)
 }
 EXPORT_SYMBOL_NS_GPL(hda_codec_set_codec_wakeup, SND_SOC_SOF_HDA_AUDIO_CODEC);
 
+void hda_codec_device_remove(struct snd_sof_dev *sdev)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+
+	/* codec removal, invoke bus_device_remove */
+	snd_hdac_ext_bus_device_remove(bus);
+}
+EXPORT_SYMBOL_NS_GPL(hda_codec_device_remove, SND_SOC_SOF_HDA_AUDIO_CODEC);
+
 #endif /* CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC */
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC) && IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI)
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 6a1ee7f81d61..e08b57fa3bfc 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1173,10 +1173,7 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 	/* cancel any attempt for DSP D0I3 */
 	cancel_delayed_work_sync(&hda->d0i3_work);
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	/* codec removal, invoke bus_device_remove */
-	snd_hdac_ext_bus_device_remove(bus);
-#endif
+	hda_codec_device_remove(sdev);
 
 	hda_sdw_exit(sdev);
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 8705ddd6f8ed..a2b90784fac0 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -722,6 +722,7 @@ void hda_codec_init_cmd_io(struct snd_sof_dev *sdev);
 void hda_codec_detect_mask(struct snd_sof_dev *sdev);
 void hda_codec_rirb_status_clear(struct snd_sof_dev *sdev);
 void hda_codec_set_codec_wakeup(struct snd_sof_dev *sdev, bool status);
+void hda_codec_device_remove(struct snd_sof_dev *sdev);
 
 #else
 
@@ -733,6 +734,7 @@ static inline void hda_codec_init_cmd_io(struct snd_sof_dev *sdev) { }
 static inline void hda_codec_detect_mask(struct snd_sof_dev *sdev) { }
 static inline void hda_codec_rirb_status_clear(struct snd_sof_dev *sdev) { }
 static inline void hda_codec_set_codec_wakeup(struct snd_sof_dev *sdev, bool status) { }
+static inline void hda_codec_device_remove(struct snd_sof_dev *sdev) { }
 
 #endif /* CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC */
 
-- 
2.34.1

