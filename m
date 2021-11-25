Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 279DD45D83F
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 11:27:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB07D1853;
	Thu, 25 Nov 2021 11:26:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB07D1853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637836054;
	bh=bFJQDFEv03bTC2IDif9X7YygM53ytxMHWYDfIwwqPhk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I7jD5hduHaNBYl8ccnv2wA17ygocibm/Z4sDHZNdOYJPnoMdUvVnxw7LBluQzjWmB
	 FTftzQayRz40iepIWmZERW2R4At6CDFKz4J5Fl37pegLLThtjeSP4aN20++Nf/+iiz
	 Cyru/AGFmJneDtnvyRXXoy9JhFwbAQFpMMEZQOIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A3B4F80526;
	Thu, 25 Nov 2021 11:24:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7648BF80519; Thu, 25 Nov 2021 11:23:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85BBAF80511
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 11:23:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85BBAF80511
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="215515337"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="215515337"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2021 02:23:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; d="scan'208";a="741672119"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga006.fm.intel.com with ESMTP; 25 Nov 2021 02:23:46 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 09/10] ASoC: SOF: IPC: dai: Expand DAI_CONFIG IPC flags
Date: Thu, 25 Nov 2021 12:15:19 +0200
Message-Id: <20211125101520.291581-10-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211125101520.291581-1-kai.vehmanen@linux.intel.com>
References: <20211125101520.291581-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Some DAI components, such as HDaudio, need to be stopped in two steps
a) stop the DAI component
b) stop the DAI DMA

This patch enables this two-step stop by expanding the DAI_CONFIG
IPC flags and split them into 2 parts.

The 4 LSB bits indicate when the DAI_CONFIG IPC is sent, ex: hw_params,
hw_free or pause. The 4 MSB bits are used as the quirk flags to be used
along with the command flags. The quirk flag called
SOF_DAI_CONFIG_FLAGS_2_STEP_STOP shall be set along with the HW_PARAMS
command flag, i.e. before the pipeline is started so that the stop/pause
trigger op in the FW can take the appropriate action to either
perform/skip the DMA stop. If set, the DMA stop will be executed when
the DAI_CONFIG IPC is sent during hw_free. In the case of pause, DMA
pause will be handled when the DAI_CONFIG IPC is sent with the PAUSE
command flag.

Along with this, modify the signature for the hda_ctrl_dai_widget_setup/
hda_ctrl_dai_widget_free() functions to take additional flags as an
argument and modify all users to pass the appropriate quirk flags. Only
the HDA DAI's need to pass the SOF_DAI_CONFIG_FLAGS_2_STEP_STOP quirk
flag during hw_params to indicate that it supports two-step stop and
pause.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/sof/dai.h       | 25 +++++++++++++++++++------
 sound/soc/sof/intel/hda-dai.c |  8 ++++----
 sound/soc/sof/intel/hda.c     | 26 ++++++++++++++++++--------
 sound/soc/sof/intel/hda.h     |  4 ++--
 sound/soc/sof/sof-audio.c     |  2 +-
 5 files changed, 44 insertions(+), 21 deletions(-)

diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
index 5132bc60f54b..59ee50ac7705 100644
--- a/include/sound/sof/dai.h
+++ b/include/sound/sof/dai.h
@@ -52,12 +52,25 @@
 #define SOF_DAI_FMT_INV_MASK		0x0f00
 #define SOF_DAI_FMT_CLOCK_PROVIDER_MASK	0xf000
 
-/* DAI_CONFIG flags */
-#define SOF_DAI_CONFIG_FLAGS_MASK	0x3
-#define SOF_DAI_CONFIG_FLAGS_NONE	(0 << 0) /**< DAI_CONFIG sent without stage information */
-#define SOF_DAI_CONFIG_FLAGS_HW_PARAMS	(1 << 0) /**< DAI_CONFIG sent during hw_params stage */
-#define SOF_DAI_CONFIG_FLAGS_HW_FREE	(2 << 0) /**< DAI_CONFIG sent during hw_free stage */
-#define SOF_DAI_CONFIG_FLAGS_RFU	(3 << 0) /**< not used, reserved for future use */
+/*
+ * DAI_CONFIG flags. The 4 LSB bits are used for the commands, HW_PARAMS, HW_FREE and PAUSE
+ * representing when the IPC is sent. The 4 MSB bits are used to add quirks along with the above
+ * commands.
+ */
+#define SOF_DAI_CONFIG_FLAGS_CMD_MASK	0xF
+#define SOF_DAI_CONFIG_FLAGS_NONE	0 /**< DAI_CONFIG sent without stage information */
+#define SOF_DAI_CONFIG_FLAGS_HW_PARAMS	BIT(0) /**< DAI_CONFIG sent during hw_params stage */
+#define SOF_DAI_CONFIG_FLAGS_HW_FREE	BIT(1) /**< DAI_CONFIG sent during hw_free stage */
+/**< DAI_CONFIG sent during pause trigger. Only available ABI 3.20 onwards */
+#define SOF_DAI_CONFIG_FLAGS_PAUSE	BIT(2)
+#define SOF_DAI_CONFIG_FLAGS_QUIRK_SHIFT 4
+#define SOF_DAI_CONFIG_FLAGS_QUIRK_MASK  (0xF << SOF_DAI_CONFIG_FLAGS_QUIRK_SHIFT)
+/*
+ * This should be used along with the SOF_DAI_CONFIG_FLAGS_HW_PARAMS to indicate that pipeline
+ * stop/pause and DAI DMA stop/pause should happen in two steps. This change is only available
+ * ABI 3.20 onwards.
+ */
+#define SOF_DAI_CONFIG_FLAGS_2_STEP_STOP BIT(0)
 
 /** \brief Types of DAI */
 enum sof_ipc_dai_type {
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 748e8ed61475..bce5366cf913 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -197,9 +197,9 @@ static int hda_link_dai_widget_update(struct sof_intel_hda_stream *hda_stream,
 
 	/* set up/free DAI widget and send DAI_CONFIG IPC */
 	if (widget_setup)
-		return hda_ctrl_dai_widget_setup(w);
+		return hda_ctrl_dai_widget_setup(w, SOF_DAI_CONFIG_FLAGS_2_STEP_STOP);
 
-	return hda_ctrl_dai_widget_free(w);
+	return hda_ctrl_dai_widget_free(w, SOF_DAI_CONFIG_FLAGS_NONE);
 }
 
 static int hda_link_hw_params(struct snd_pcm_substream *substream,
@@ -452,9 +452,9 @@ static int ssp_dai_setup_or_free(struct snd_pcm_substream *substream, struct snd
 		return 0;
 
 	if (setup)
-		return hda_ctrl_dai_widget_setup(w);
+		return hda_ctrl_dai_widget_setup(w, SOF_DAI_CONFIG_FLAGS_NONE);
 
-	return hda_ctrl_dai_widget_free(w);
+	return hda_ctrl_dai_widget_free(w, SOF_DAI_CONFIG_FLAGS_NONE);
 }
 
 static int ssp_dai_startup(struct snd_pcm_substream *substream,
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 1e1e9659ea86..cfe026dbf124 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -41,7 +41,7 @@
 #define EXCEPT_MAX_HDR_SIZE	0x400
 #define HDA_EXT_ROM_STATUS_SIZE 8
 
-int hda_ctrl_dai_widget_setup(struct snd_soc_dapm_widget *w)
+int hda_ctrl_dai_widget_setup(struct snd_soc_dapm_widget *w, unsigned int quirk_flags)
 {
 	struct snd_sof_widget *swidget = w->dobj.private;
 	struct snd_soc_component *component = swidget->scomp;
@@ -58,6 +58,13 @@ int hda_ctrl_dai_widget_setup(struct snd_soc_dapm_widget *w)
 		return -EINVAL;
 	}
 
+	/* DAI already configured, reset it before reconfiguring it */
+	if (sof_dai->configured) {
+		ret = hda_ctrl_dai_widget_free(w, SOF_DAI_CONFIG_FLAGS_NONE);
+		if (ret < 0)
+			return ret;
+	}
+
 	config = &sof_dai->dai_config[sof_dai->current_config];
 
 	/*
@@ -71,8 +78,10 @@ int hda_ctrl_dai_widget_setup(struct snd_soc_dapm_widget *w)
 		return ret;
 	}
 
-	/* set HW_PARAMS flag */
-	config->flags = FIELD_PREP(SOF_DAI_CONFIG_FLAGS_MASK, SOF_DAI_CONFIG_FLAGS_HW_PARAMS);
+	/* set HW_PARAMS flag along with quirks */
+	config->flags = SOF_DAI_CONFIG_FLAGS_HW_PARAMS |
+		       quirk_flags << SOF_DAI_CONFIG_FLAGS_QUIRK_SHIFT;
+
 
 	/* send DAI_CONFIG IPC */
 	ret = sof_ipc_tx_message(sdev->ipc, config->hdr.cmd, config, config->hdr.size,
@@ -87,7 +96,7 @@ int hda_ctrl_dai_widget_setup(struct snd_soc_dapm_widget *w)
 	return 0;
 }
 
-int hda_ctrl_dai_widget_free(struct snd_soc_dapm_widget *w)
+int hda_ctrl_dai_widget_free(struct snd_soc_dapm_widget *w, unsigned int quirk_flags)
 {
 	struct snd_sof_widget *swidget = w->dobj.private;
 	struct snd_soc_component *component = swidget->scomp;
@@ -110,8 +119,9 @@ int hda_ctrl_dai_widget_free(struct snd_soc_dapm_widget *w)
 
 	config = &sof_dai->dai_config[sof_dai->current_config];
 
-	/* set HW_FREE flag */
-	config->flags = FIELD_PREP(SOF_DAI_CONFIG_FLAGS_MASK, SOF_DAI_CONFIG_FLAGS_HW_FREE);
+	/* set HW_FREE flag along with any quirks */
+	config->flags = SOF_DAI_CONFIG_FLAGS_HW_FREE |
+		       quirk_flags << SOF_DAI_CONFIG_FLAGS_QUIRK_SHIFT;
 
 	ret = sof_ipc_tx_message(sdev->ipc, config->hdr.cmd, config, config->hdr.size,
 				 &reply, sizeof(reply));
@@ -166,9 +176,9 @@ static int sdw_dai_config_ipc(struct snd_sof_dev *sdev,
 	config->alh.stream_id = alh_stream_id;
 
 	if (setup)
-		return hda_ctrl_dai_widget_setup(w);
+		return hda_ctrl_dai_widget_setup(w, SOF_DAI_CONFIG_FLAGS_NONE);
 
-	return hda_ctrl_dai_widget_free(w);
+	return hda_ctrl_dai_widget_free(w, SOF_DAI_CONFIG_FLAGS_NONE);
 }
 
 static int sdw_params_stream(struct device *dev,
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 60139ea9b8de..72e78c449aa8 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -739,7 +739,7 @@ int hda_pci_intel_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 
 struct snd_sof_dai;
 struct sof_ipc_dai_config;
-int hda_ctrl_dai_widget_setup(struct snd_soc_dapm_widget *w);
-int hda_ctrl_dai_widget_free(struct snd_soc_dapm_widget *w);
+int hda_ctrl_dai_widget_setup(struct snd_soc_dapm_widget *w, unsigned int quirk_flags);
+int hda_ctrl_dai_widget_free(struct snd_soc_dapm_widget *w, unsigned int quirk_flags);
 
 #endif
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index a275f7b7c812..58a62bfb16ab 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -57,7 +57,7 @@ static int sof_dai_config_setup(struct snd_sof_dev *sdev, struct snd_sof_dai *da
 	}
 
 	/* set NONE flag to clear all previous settings */
-	config->flags = FIELD_PREP(SOF_DAI_CONFIG_FLAGS_MASK, SOF_DAI_CONFIG_FLAGS_NONE);
+	config->flags = SOF_DAI_CONFIG_FLAGS_NONE;
 
 	ret = sof_ipc_tx_message(sdev->ipc, config->hdr.cmd, config, config->hdr.size,
 				 &reply, sizeof(reply));
-- 
2.33.0

