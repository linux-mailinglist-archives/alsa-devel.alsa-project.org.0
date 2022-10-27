Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A58186101D8
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 21:39:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 440452DB4;
	Thu, 27 Oct 2022 21:38:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 440452DB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666899571;
	bh=YjD/TdUQhbIXiutgv39YDSmkX3PdB3Pvhluoa5bVeLI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FNaedCUkX7TtsL5AFRuYeUAJpIDZr2/Z1be1EXjdnnEzQmvwG3ikBFtooPXG1jO1t
	 AZKXfJWZtctkP7P5MDJ+laU+b8B3t3FKQyaNyEBbuizAZpFKRZIGkElW8O/vtXE69H
	 kKBKeVleR7CVYyHMTGAro9f096YmhrRGxMr42a7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D142F805AC;
	Thu, 27 Oct 2022 21:36:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9953BF8059F; Thu, 27 Oct 2022 21:36:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D01FF80558
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 21:36:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D01FF80558
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kwwRAcF1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666899377; x=1698435377;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YjD/TdUQhbIXiutgv39YDSmkX3PdB3Pvhluoa5bVeLI=;
 b=kwwRAcF1jYMmNCmOhulwBfBXLrtkmIzNJp5S5dtOzSX1I+Iiz7Ub4XaJ
 XzADHNIw4da1joIw8xkbQ140w7KPQPo0C4N9o4BrAdv28pzPQXr0OuDJt
 0UbPzaWaxxEVFACkFKP13ZSOrF27rPhAgufdHVRobKWcp7FRJIWggT3VB
 ked9xUdZGuun8M4JthyZ/xS7UwoK/f//2poVq9pSr7Bi0bRMGGBcreZX3
 Aawc5VpKNxNF6C0d/tMlVacBJrzPkMUWEx9QR01mD0+06gMbLguzy5c3A
 GwvtUEvQCAiMwQRU7VqrtH9XB2GAlqBO34qNlm9YCxmY85Aca8SfwRVlX Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="334957833"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="334957833"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:15 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="632527022"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="632527022"
Received: from vmehta-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.6.254])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/21] ASoC: SOF: Intel: hda-codec: add stop_cmd_io helper
Date: Thu, 27 Oct 2022 15:35:29 -0400
Message-Id: <20221027193540.259520-11-pierre-louis.bossart@linux.intel.com>
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

One more helper to split controller and codec

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 9 +++++++++
 sound/soc/sof/intel/hda-ctrl.c  | 6 ++----
 sound/soc/sof/intel/hda.h       | 2 ++
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 1e8e184151f2..bbdd4ba0f1ba 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -263,6 +263,15 @@ void hda_codec_init_cmd_io(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL_NS_GPL(hda_codec_init_cmd_io, SND_SOC_SOF_HDA_AUDIO_CODEC);
 
+void hda_codec_stop_cmd_io(struct snd_sof_dev *sdev)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+
+	/* initialize the codec command I/O */
+	snd_hdac_bus_stop_cmd_io(bus);
+}
+EXPORT_SYMBOL_NS_GPL(hda_codec_stop_cmd_io, SND_SOC_SOF_HDA_AUDIO_CODEC);
+
 void hda_codec_rirb_status_clear(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index 63a5b5961726..f94c6be336f3 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -299,10 +299,8 @@ void hda_dsp_ctrl_stop_chip(struct snd_sof_dev *sdev)
 	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTSTS,
 			  SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_ALL_STREAM);
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	/* disable CORB/RIRB */
-	snd_hdac_bus_stop_cmd_io(bus);
-#endif
+	hda_codec_stop_cmd_io(sdev);
+
 	/* disable position buffer */
 	if (bus->use_posbuf && bus->posbuf.addr) {
 		snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index a2b90784fac0..8fefff6fcce6 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -719,6 +719,7 @@ void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev, bool enable);
 void hda_codec_jack_check(struct snd_sof_dev *sdev);
 void hda_codec_check_for_state_change(struct snd_sof_dev *sdev);
 void hda_codec_init_cmd_io(struct snd_sof_dev *sdev);
+void hda_codec_stop_cmd_io(struct snd_sof_dev *sdev);
 void hda_codec_detect_mask(struct snd_sof_dev *sdev);
 void hda_codec_rirb_status_clear(struct snd_sof_dev *sdev);
 void hda_codec_set_codec_wakeup(struct snd_sof_dev *sdev, bool status);
@@ -731,6 +732,7 @@ static inline void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev, bool ena
 static inline void hda_codec_jack_check(struct snd_sof_dev *sdev) { }
 static inline void hda_codec_check_for_state_change(struct snd_sof_dev *sdev) { }
 static inline void hda_codec_init_cmd_io(struct snd_sof_dev *sdev) { }
+static inline void hda_codec_stop_cmd_io(struct snd_sof_dev *sdev) { }
 static inline void hda_codec_detect_mask(struct snd_sof_dev *sdev) { }
 static inline void hda_codec_rirb_status_clear(struct snd_sof_dev *sdev) { }
 static inline void hda_codec_set_codec_wakeup(struct snd_sof_dev *sdev, bool status) { }
-- 
2.34.1

