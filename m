Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CB06101CC
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 21:38:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A0BE2DCD;
	Thu, 27 Oct 2022 21:37:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A0BE2DCD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666899501;
	bh=P+3fvC6F+PtLPd+S7foMDLNjZmGixhlLUSt+8p9tnE0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xay/6j3BI1BxXMJg8e5WF9MA4vm+3Q7AcT3EFqDirGBwqabU0TKRQzfWLuw4lXzly
	 jzaV2r9200NQ9m+AdL7LL1YZVXCD9C/ntbqYMHyYkU0BygcpouyoYbipKEPWs1UfT/
	 c/DCQUOSgUhMvA5yytxRyTiJSi7G8p0gzxbJFTZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F15C9F8057D;
	Thu, 27 Oct 2022 21:36:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D281AF80578; Thu, 27 Oct 2022 21:36:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FE6EF804F3
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 21:36:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FE6EF804F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FDq71MMm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666899370; x=1698435370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P+3fvC6F+PtLPd+S7foMDLNjZmGixhlLUSt+8p9tnE0=;
 b=FDq71MMmzLhmZFLdPSCpec/PdnzumYRRjtZvqBrvEieMESuRw7DkikDZ
 /YxN5gIX7/brr79Lqlm8j9AMYFqxsu7Wk5kRuz2IPZczkEC993xjN3NGo
 BFc1V24DBi9IIC3/RT2zvQ3G8HU89O8WsGaiK1SYiA1RfmUXcphNXnXtJ
 mkEUWp6MrxbnqGVCreL8vRJNLnMCPt6Vq5ksrBd+VEek77rvSjVx9wiLb
 SaVDlEm4PJvThEZbZsqOmt8vHI9QiE1AJYtHAIPwb362X/G+zT4Tfy6bX
 E6bBBPv2HRCE76ZiXhEbjQpehJPsrPtObdQFNOooqHBTMel1Sm2cTd5Ju Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="334957814"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="334957814"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:07 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="632526969"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="632526969"
Received: from vmehta-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.6.254])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:06 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/21] ASoC: SOF: Intel: move codec state change to hda-codec.c
Date: Thu, 27 Oct 2022 15:35:23 -0400
Message-Id: <20221027193540.259520-5-pierre-louis.bossart@linux.intel.com>
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

The codec_mask and codec-related handling should depend on
SOF_HDA_AUDIO_CODEC, not SOF_HDA.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 13 +++++++++++++
 sound/soc/sof/intel/hda.c       | 16 +---------------
 sound/soc/sof/intel/hda.h       |  2 ++
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 3b2ccf10be43..c493d5664475 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -216,6 +216,19 @@ void hda_codec_probe_bus(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL_NS(hda_codec_probe_bus, SND_SOC_SOF_HDA_AUDIO_CODEC);
 
+void hda_codec_check_for_state_change(struct snd_sof_dev *sdev)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+	unsigned int codec_mask;
+
+	codec_mask = snd_hdac_chip_readw(bus, STATESTS);
+	if (codec_mask) {
+		hda_codec_jack_check(sdev);
+		snd_hdac_chip_writew(bus, STATESTS, codec_mask);
+	}
+}
+EXPORT_SYMBOL_NS(hda_codec_check_for_state_change, SND_SOC_SOF_HDA_AUDIO_CODEC);
+
 #endif /* CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC */
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC) && IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI)
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index fe0e8221534e..fe2f1e42420c 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -937,20 +937,6 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	return 0;
 }
 
-static void hda_check_for_state_change(struct snd_sof_dev *sdev)
-{
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	struct hdac_bus *bus = sof_to_bus(sdev);
-	unsigned int codec_mask;
-
-	codec_mask = snd_hdac_chip_readw(bus, STATESTS);
-	if (codec_mask) {
-		hda_codec_jack_check(sdev);
-		snd_hdac_chip_writew(bus, STATESTS, codec_mask);
-	}
-#endif
-}
-
 static irqreturn_t hda_dsp_interrupt_handler(int irq, void *context)
 {
 	struct snd_sof_dev *sdev = context;
@@ -1000,7 +986,7 @@ static irqreturn_t hda_dsp_interrupt_thread(int irq, void *context)
 		hda_sdw_process_wakeen(sdev);
 	}
 
-	hda_check_for_state_change(sdev);
+	hda_codec_check_for_state_change(sdev);
 
 	/* enable GIE interrupt */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 0506c0a8afac..e5932763d1fc 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -717,12 +717,14 @@ void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev);
 void hda_codec_probe_bus(struct snd_sof_dev *sdev);
 void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev, bool enable);
 void hda_codec_jack_check(struct snd_sof_dev *sdev);
+void hda_codec_check_for_state_change(struct snd_sof_dev *sdev);
 
 #else
 
 static inline void hda_codec_probe_bus(struct snd_sof_dev *sdev) { }
 static inline void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev, bool enable) { }
 static inline void hda_codec_jack_check(struct snd_sof_dev *sdev) { }
+static inline void hda_codec_check_for_state_change(struct snd_sof_dev *sdev) { }
 
 #endif /* CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC */
 
-- 
2.34.1

