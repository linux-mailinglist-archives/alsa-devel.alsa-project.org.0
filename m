Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FCB11370A
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2019 22:25:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2125166F;
	Wed,  4 Dec 2019 22:24:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2125166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575494743;
	bh=Lu/ELJcnP1iE4lvvRYWyMP7PHqooAjzI2BWCboGvckw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bsr8jXhkvKffgC+bT3q5PYk8CyiDCbdcCqcH/4QMBfoV7k9cy+M/lDWTFd8rMLNzJ
	 WjMgY9DQYkVr6L8ejVaWdt4WFgSMyWwJxEFifefn9CMElax/T/+3TLmr8zVzRoyh6x
	 p4wXuFHj3iC9//YcaGYXx5VtIElRoPZ+VOnwfWMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B869DF802DB;
	Wed,  4 Dec 2019 22:17:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40EFCF802E1; Wed,  4 Dec 2019 22:17:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57060F801D9
 for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2019 22:16:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57060F801D9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Dec 2019 13:16:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,278,1571727600"; d="scan'208";a="223378638"
Received: from rgolani-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.153.236])
 by orsmga002.jf.intel.com with ESMTP; 04 Dec 2019 13:16:21 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  4 Dec 2019 15:15:52 -0600
Message-Id: <20191204211556.12671-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191204211556.12671-1-pierre-louis.bossart@linux.intel.com>
References: <20191204211556.12671-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 09/13] ASoC: SOF: intel: hda: Modify
	signature for hda_codec_probe_bus()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

The machine driver selection for HDA platforms will be
consolidated and moved out of the SOF DSP
probe callback. In preparation for that, modify the
signature for hda_codec_probe_bus() to pass the
hda_codec_use_common_hdmi as a variable while probing the
HDA codecs.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 16 ++++++----------
 sound/soc/sof/intel/hda.c       |  2 +-
 sound/soc/sof/intel/hda.h       |  3 ++-
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 827f84a0722e..65761e095184 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -80,12 +80,11 @@ EXPORT_SYMBOL(hda_codec_jack_wake_enable);
 EXPORT_SYMBOL(hda_codec_jack_check);
 
 /* probe individual codec */
-static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
+static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
+			   bool hda_codec_use_common_hdmi)
 {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 	struct hdac_hda_priv *hda_priv;
-	struct snd_soc_acpi_mach_params *mach_params = NULL;
-	struct snd_sof_pdata *pdata = sdev->pdata;
 #endif
 	struct hda_bus *hbus = sof_to_hbus(sdev);
 	struct hdac_device *hdev;
@@ -115,10 +114,6 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
 	if (ret < 0)
 		return ret;
 
-	if (pdata->machine)
-		mach_params = (struct snd_soc_acpi_mach_params *)
-			&pdata->machine->mach_params;
-
 	if ((resp & 0xFFFF0000) == IDISP_VID_INTEL)
 		hda_priv->need_display_power = true;
 
@@ -126,7 +121,7 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
 	 * if common HDMI codec driver is not used, codec load
 	 * is skipped here and hdac_hdmi is used instead
 	 */
-	if ((mach_params && mach_params->common_hdmi_codec_drv) ||
+	if (hda_codec_use_common_hdmi ||
 	    (resp & 0xFFFF0000) != IDISP_VID_INTEL) {
 		hdev->type = HDA_DEV_LEGACY;
 		hda_codec_load_module(&hda_priv->codec);
@@ -145,7 +140,8 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
 }
 
 /* Codec initialization */
-int hda_codec_probe_bus(struct snd_sof_dev *sdev)
+int hda_codec_probe_bus(struct snd_sof_dev *sdev,
+			bool hda_codec_use_common_hdmi)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	int i, ret;
@@ -156,7 +152,7 @@ int hda_codec_probe_bus(struct snd_sof_dev *sdev)
 		if (!(bus->codec_mask & (1 << i)))
 			continue;
 
-		ret = hda_codec_probe(sdev, i);
+		ret = hda_codec_probe(sdev, i, hda_codec_use_common_hdmi);
 		if (ret < 0) {
 			dev_err(bus->dev, "error: codec #%d probe error, ret: %d\n",
 				i, ret);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index eea01f75d23d..955b06c2e296 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -476,7 +476,7 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	}
 
 	/* create codec instances */
-	hda_codec_probe_bus(sdev);
+	hda_codec_probe_bus(sdev, hda_codec_use_common_hdmi);
 
 	hda_codec_i915_put(sdev);
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 18d7e72bf9b7..b7164a26984b 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -574,7 +574,8 @@ void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev);
 /*
  * HDA Codec operations.
  */
-int hda_codec_probe_bus(struct snd_sof_dev *sdev);
+int hda_codec_probe_bus(struct snd_sof_dev *sdev,
+			bool hda_codec_use_common_hdmi);
 void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev);
 void hda_codec_jack_check(struct snd_sof_dev *sdev);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
