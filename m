Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 561706101DE
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 21:40:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB7442DC6;
	Thu, 27 Oct 2022 21:39:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB7442DC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666899629;
	bh=5CsmwYv94iNkLd1wZND6dNeRtCHVcQU83jv/jRT9WN8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d0yebBIoUEZA98hH/Gc0Vv9TFaD8YzwuRIoW/mb/o1iJBIgouRGRwsA0c7zO9NYsn
	 I9V9SMN7cXHbLSq8VcDuutq7YRzqz3/mpA+ruTR6iwcEozS3OXfFvdbL2JOhPnobC+
	 OuH8YGVCgh28R6D7S3L3yWh572wFVcvlitB7jbxs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12DD4F805BF;
	Thu, 27 Oct 2022 21:36:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8190FF805A8; Thu, 27 Oct 2022 21:36:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71D1AF80566
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 21:36:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71D1AF80566
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Mu5S2ZaI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666899379; x=1698435379;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5CsmwYv94iNkLd1wZND6dNeRtCHVcQU83jv/jRT9WN8=;
 b=Mu5S2ZaIwYpRrjdO+9+8G7PL+jsaH5mm1Aqz5WWWcdZ2OiFagoqjXBL7
 MqH3BRMSqD6l/Q3800Us/aYX9SFHHsExliu0tpsDlHRQpMTOGSbpBzm6O
 bVPkOkqVkVJKjr3hzEnUAVz7ySZTg5CgB8e1oP0lDw2RcyxZpVq74gRxP
 UofcdSdtmb9FDDCMTid2B9ziA9I61Y+j4RqaRy4XewpgXUerSmpo2h2fD
 scrDFJ7qwjP5S6xWxGNpJexGcjC6X+ZCbP5xBqSopGAAOmrp8OU/cM+ST
 hNw6QpQkce+SX/493x9tVRCR9EgvDGMmB8lFK2XKlNBhM5jg6SL/OBk7Q g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="334957839"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="334957839"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:17 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="632527034"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="632527034"
Received: from vmehta-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.6.254])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/21] ASoC: SOF: Intel: hda-codec: add
 hda_codec_check_rirb_status() helper
Date: Thu, 27 Oct 2022 15:35:31 -0400
Message-Id: <20221027193540.259520-13-pierre-louis.bossart@linux.intel.com>
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

move existing functionality to new helper.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c  | 23 +++++++++++++++++++++++
 sound/soc/sof/intel/hda-stream.c | 19 +------------------
 sound/soc/sof/intel/hda.h        |  2 ++
 3 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index bbdd4ba0f1ba..4abce4ebec5a 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -289,6 +289,29 @@ void hda_codec_set_codec_wakeup(struct snd_sof_dev *sdev, bool status)
 }
 EXPORT_SYMBOL_NS_GPL(hda_codec_set_codec_wakeup, SND_SOC_SOF_HDA_AUDIO_CODEC);
 
+bool hda_codec_check_rirb_status(struct snd_sof_dev *sdev)
+{
+	struct hdac_bus *bus = sof_to_bus(sdev);
+	bool active = false;
+	u32 rirb_status;
+
+	rirb_status = snd_hdac_chip_readb(bus, RIRBSTS);
+	if (rirb_status & RIRB_INT_MASK) {
+		/*
+		 * Clearing the interrupt status here ensures
+		 * that no interrupt gets masked after the RIRB
+		 * wp is read in snd_hdac_bus_update_rirb.
+		 */
+		snd_hdac_chip_writeb(bus, RIRBSTS,
+				     RIRB_INT_MASK);
+		active = true;
+		if (rirb_status & RIRB_INT_RESPONSE)
+			snd_hdac_bus_update_rirb(bus);
+	}
+	return active;
+}
+EXPORT_SYMBOL_NS_GPL(hda_codec_check_rirb_status, SND_SOC_SOF_HDA_AUDIO_CODEC);
+
 void hda_codec_device_remove(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 59a3c0c9c21f..8e3f05857632 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -765,9 +765,6 @@ irqreturn_t hda_dsp_stream_threaded_handler(int irq, void *context)
 {
 	struct snd_sof_dev *sdev = context;
 	struct hdac_bus *bus = sof_to_bus(sdev);
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	u32 rirb_status;
-#endif
 	bool active;
 	u32 status;
 	int i;
@@ -785,23 +782,9 @@ irqreturn_t hda_dsp_stream_threaded_handler(int irq, void *context)
 		active = hda_dsp_stream_check(bus, status);
 
 		/* check and clear RIRB interrupt */
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 		if (status & AZX_INT_CTRL_EN) {
-			rirb_status = snd_hdac_chip_readb(bus, RIRBSTS);
-			if (rirb_status & RIRB_INT_MASK) {
-				/*
-				 * Clearing the interrupt status here ensures
-				 * that no interrupt gets masked after the RIRB
-				 * wp is read in snd_hdac_bus_update_rirb.
-				 */
-				snd_hdac_chip_writeb(bus, RIRBSTS,
-						     RIRB_INT_MASK);
-				active = true;
-				if (rirb_status & RIRB_INT_RESPONSE)
-					snd_hdac_bus_update_rirb(bus);
-			}
+			active |= hda_codec_check_rirb_status(sdev);
 		}
-#endif
 		spin_unlock_irq(&bus->reg_lock);
 	}
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 8fefff6fcce6..3b3e05e71663 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -722,6 +722,7 @@ void hda_codec_init_cmd_io(struct snd_sof_dev *sdev);
 void hda_codec_stop_cmd_io(struct snd_sof_dev *sdev);
 void hda_codec_detect_mask(struct snd_sof_dev *sdev);
 void hda_codec_rirb_status_clear(struct snd_sof_dev *sdev);
+bool hda_codec_check_rirb_status(struct snd_sof_dev *sdev);
 void hda_codec_set_codec_wakeup(struct snd_sof_dev *sdev, bool status);
 void hda_codec_device_remove(struct snd_sof_dev *sdev);
 
@@ -735,6 +736,7 @@ static inline void hda_codec_init_cmd_io(struct snd_sof_dev *sdev) { }
 static inline void hda_codec_stop_cmd_io(struct snd_sof_dev *sdev) { }
 static inline void hda_codec_detect_mask(struct snd_sof_dev *sdev) { }
 static inline void hda_codec_rirb_status_clear(struct snd_sof_dev *sdev) { }
+static inline bool hda_codec_check_rirb_status(struct snd_sof_dev *sdev) { return false; }
 static inline void hda_codec_set_codec_wakeup(struct snd_sof_dev *sdev, bool status) { }
 static inline void hda_codec_device_remove(struct snd_sof_dev *sdev) { }
 
-- 
2.34.1

