Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B60736101D9
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 21:39:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55D952DD6;
	Thu, 27 Oct 2022 21:38:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55D952DD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666899580;
	bh=MZJxEaftH899L8RgVoxzpkvxS6U3XMklbSyOyLqeHCI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u9oQI8rNgPAgJRP7sCURFJqUR8QT5qrI7fR/Bqkb31apXT75vtVtGniOqsuR/Dtt2
	 XH+saQ+0quSrkpfr+5Y/GMbYqx91uFbL84OrhUDNMRoZJvwTb6tcfeaZUDPUdDrSzx
	 uq+PW+saeNAIw598IWvWwELkVVuMeTlUMk8OZLk0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 579E2F805B1;
	Thu, 27 Oct 2022 21:36:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6F5EF80558; Thu, 27 Oct 2022 21:36:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 423B8F8054A
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 21:36:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 423B8F8054A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DyS6a8QV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666899374; x=1698435374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MZJxEaftH899L8RgVoxzpkvxS6U3XMklbSyOyLqeHCI=;
 b=DyS6a8QVrGZSJikSFNGrUJGmHbhLxSmbSLk+caDe2YeY8GcE7fboWokm
 NoRTBgMNRvWWZ+32YX684lDLZ3NxcdCk1FYglWarVxQqmktzmv2qOI+xU
 IwavpLaRQgotyo1t+Mj0DPvVWtVPhClLdI+3Pr72A4JsBVWzUgJCR1iC8
 3lEM03sPwvEcrEHDL/8UyJuMeM4a7orYhQr0CtGaVGJuwixtAcl1Q3WHU
 mc+6YmrpV3CSuXMohl0x0lmLtvLvMqy19MxXLAx6lQxifJ/epsVsAtwF5
 grnYgFTCcFHBKcBB79j/6oWTUVR1MHKDhrX3kE4KaA+tizwfhOi1O1ZL4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="334957825"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="334957825"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:12 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="632527004"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="632527004"
Received: from vmehta-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.6.254])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/21] ASoC: SOF: Intel: hda-ctrl: add codec wakeup helper
Date: Thu, 27 Oct 2022 15:35:27 -0400
Message-Id: <20221027193540.259520-9-pierre-louis.bossart@linux.intel.com>
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

Add new helper in hda-codec.c for a clean split between controller and
codec.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c |  8 ++++++++
 sound/soc/sof/intel/hda-ctrl.c  | 10 ++++------
 sound/soc/sof/intel/hda.h       |  2 ++
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index e04a350dd52c..ff40ec623118 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -272,6 +272,14 @@ void hda_codec_rirb_status_clear(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL_NS_GPL(hda_codec_rirb_status_clear, SND_SOC_SOF_HDA_AUDIO_CODEC);
 
+void hda_codec_set_codec_wakeup(struct snd_sof_dev *sdev, bool status)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+
+	snd_hdac_set_codec_wakeup(bus, status);
+}
+EXPORT_SYMBOL_NS_GPL(hda_codec_set_codec_wakeup, SND_SOC_SOF_HDA_AUDIO_CODEC);
+
 #endif /* CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC */
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC) && IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI)
diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index e65562618ab8..63a5b5961726 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -185,9 +185,8 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev)
 	if (bus->chip_init)
 		return 0;
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	snd_hdac_set_codec_wakeup(bus, true);
-#endif
+	hda_codec_set_codec_wakeup(sdev, true);
+
 	hda_dsp_ctrl_misc_clock_gating(sdev, false);
 
 	/* reset HDA controller */
@@ -245,9 +244,8 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev)
 
 err:
 	hda_dsp_ctrl_misc_clock_gating(sdev, true);
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	snd_hdac_set_codec_wakeup(bus, false);
-#endif
+
+	hda_codec_set_codec_wakeup(sdev, false);
 
 	return ret;
 }
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index d43af8c5f483..8705ddd6f8ed 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -721,6 +721,7 @@ void hda_codec_check_for_state_change(struct snd_sof_dev *sdev);
 void hda_codec_init_cmd_io(struct snd_sof_dev *sdev);
 void hda_codec_detect_mask(struct snd_sof_dev *sdev);
 void hda_codec_rirb_status_clear(struct snd_sof_dev *sdev);
+void hda_codec_set_codec_wakeup(struct snd_sof_dev *sdev, bool status);
 
 #else
 
@@ -731,6 +732,7 @@ static inline void hda_codec_check_for_state_change(struct snd_sof_dev *sdev) {
 static inline void hda_codec_init_cmd_io(struct snd_sof_dev *sdev) { }
 static inline void hda_codec_detect_mask(struct snd_sof_dev *sdev) { }
 static inline void hda_codec_rirb_status_clear(struct snd_sof_dev *sdev) { }
+static inline void hda_codec_set_codec_wakeup(struct snd_sof_dev *sdev, bool status) { }
 
 #endif /* CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC */
 
-- 
2.34.1

