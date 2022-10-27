Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5586101E3
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 21:41:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A86CE29EB;
	Thu, 27 Oct 2022 21:40:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A86CE29EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666899675;
	bh=nMBgbZhHGE0Z3R1LDGUifJGuICeAUk/11KfQAoSNJko=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o9PRG1l0P8L9vMdg/e/vNyxX5jWRdWmZUHYMtwDJ0zmTInXbm1sLm8q0i3K3p3sXC
	 ewwtgnHkMUp+cbIW9WJfKyu4bUARqlcqiag0o1SGyNjV1DnR8C5uoj4TbiCNb6JGma
	 BcWHr9wzLZBHA1VE61b63V+CURR5gy71wkpzXVSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C49A0F804D9;
	Thu, 27 Oct 2022 21:36:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C99DF805C1; Thu, 27 Oct 2022 21:36:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93E58F8057E
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 21:36:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93E58F8057E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ey/T6ZMa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666899383; x=1698435383;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nMBgbZhHGE0Z3R1LDGUifJGuICeAUk/11KfQAoSNJko=;
 b=ey/T6ZMaFYMXxqW+a5c2LPS5VoKAqVUwxdhI2WfmG/0OyozNu31nJaPU
 WvrF0T8xlNplE0KlxToVDOJFlDM/7WsXtDbe+v7g1mDMwU+zcPXDgr1ro
 6SqazdJb/t9wkaAm79auiHl9LKm3WFsqtZR7WXnKQ7L4pjoqM3WfEkFSB
 v6TVuFMWmNBTurlEwMSD2puaG5jAaNvZLa17g/oqEoC7UwAZTB4at1eda
 OY+uBI6VblrabSacxQnHAHpxnApXkSmBXDWFUOn6uUbw89AWDhRrk2LyT
 nKM8qQXdAtXaRM4e5G4GS09BxgaHKorOS0fg3Ke2JzWn82XB5vLxTnUNp A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="334957852"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="334957852"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:21 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="632527051"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="632527051"
Received: from vmehta-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.6.254])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 15/21] ASoC: SOF: Intel: hda-codec: add helpers to suspend and
 resume cmd_io
Date: Thu, 27 Oct 2022 15:35:34 -0400
Message-Id: <20221027193540.259520-16-pierre-louis.bossart@linux.intel.com>
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

No functionality change, code move to have better split between
HDaudio codec management and core parts.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 21 +++++++++++++++++++++
 sound/soc/sof/intel/hda-dsp.c   | 10 ++++------
 sound/soc/sof/intel/hda.h       |  4 ++++
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 4abce4ebec5a..60c15f9f0f3c 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -263,6 +263,16 @@ void hda_codec_init_cmd_io(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL_NS_GPL(hda_codec_init_cmd_io, SND_SOC_SOF_HDA_AUDIO_CODEC);
 
+void hda_codec_resume_cmd_io(struct snd_sof_dev *sdev)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+
+	/* set up CORB/RIRB buffers if was on before suspend */
+	if (bus->cmd_dma_state)
+		snd_hdac_bus_init_cmd_io(bus);
+}
+EXPORT_SYMBOL_NS_GPL(hda_codec_resume_cmd_io, SND_SOC_SOF_HDA_AUDIO_CODEC);
+
 void hda_codec_stop_cmd_io(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
@@ -272,6 +282,17 @@ void hda_codec_stop_cmd_io(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL_NS_GPL(hda_codec_stop_cmd_io, SND_SOC_SOF_HDA_AUDIO_CODEC);
 
+void hda_codec_suspend_cmd_io(struct snd_sof_dev *sdev)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+
+	/* stop the CORB/RIRB DMA if it is On */
+	if (bus->cmd_dma_state)
+		snd_hdac_bus_stop_cmd_io(bus);
+
+}
+EXPORT_SYMBOL_NS_GPL(hda_codec_suspend_cmd_io, SND_SOC_SOF_HDA_AUDIO_CODEC);
+
 void hda_codec_rirb_status_clear(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index d325e82aff4c..2596de5e24d6 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -745,11 +745,10 @@ int hda_dsp_resume(struct snd_sof_dev *sdev)
 				}
 			}
 		}
+#endif
 
 		/* set up CORB/RIRB buffers if was on before suspend */
-		if (bus->cmd_dma_state)
-			snd_hdac_bus_init_cmd_io(bus);
-#endif
+		hda_codec_resume_cmd_io(sdev);
 
 		/* Set DSP power state */
 		ret = snd_sof_dsp_set_power_state(sdev, &target_state);
@@ -858,11 +857,10 @@ int hda_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 						HDA_VS_INTEL_EM2_L1SEN,
 						HDA_VS_INTEL_EM2_L1SEN);
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 		/* stop the CORB/RIRB DMA if it is On */
-		if (bus->cmd_dma_state)
-			snd_hdac_bus_stop_cmd_io(bus);
+		hda_codec_suspend_cmd_io(sdev);
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 		/* no link can be powered in s0ix state */
 		ret = snd_hdac_ext_bus_link_power_down_all(bus);
 		if (ret < 0) {
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 3b3e05e71663..e1f3d03cd4f7 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -719,7 +719,9 @@ void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev, bool enable);
 void hda_codec_jack_check(struct snd_sof_dev *sdev);
 void hda_codec_check_for_state_change(struct snd_sof_dev *sdev);
 void hda_codec_init_cmd_io(struct snd_sof_dev *sdev);
+void hda_codec_resume_cmd_io(struct snd_sof_dev *sdev);
 void hda_codec_stop_cmd_io(struct snd_sof_dev *sdev);
+void hda_codec_suspend_cmd_io(struct snd_sof_dev *sdev);
 void hda_codec_detect_mask(struct snd_sof_dev *sdev);
 void hda_codec_rirb_status_clear(struct snd_sof_dev *sdev);
 bool hda_codec_check_rirb_status(struct snd_sof_dev *sdev);
@@ -733,7 +735,9 @@ static inline void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev, bool ena
 static inline void hda_codec_jack_check(struct snd_sof_dev *sdev) { }
 static inline void hda_codec_check_for_state_change(struct snd_sof_dev *sdev) { }
 static inline void hda_codec_init_cmd_io(struct snd_sof_dev *sdev) { }
+static inline void hda_codec_resume_cmd_io(struct snd_sof_dev *sdev) { }
 static inline void hda_codec_stop_cmd_io(struct snd_sof_dev *sdev) { }
+static inline void hda_codec_suspend_cmd_io(struct snd_sof_dev *sdev) { }
 static inline void hda_codec_detect_mask(struct snd_sof_dev *sdev) { }
 static inline void hda_codec_rirb_status_clear(struct snd_sof_dev *sdev) { }
 static inline bool hda_codec_check_rirb_status(struct snd_sof_dev *sdev) { return false; }
-- 
2.34.1

