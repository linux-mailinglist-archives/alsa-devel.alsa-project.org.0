Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A204A604D4E
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 18:25:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41E22AE77;
	Wed, 19 Oct 2022 18:24:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41E22AE77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666196747;
	bh=JhyQx8OSCVLp9oqhMwryGrGNJKOHB+jy4TXOJDZt208=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EFjnAhBrFjBR2q55YVURQad7xYQ//TpHRKRnH7O/EeqpcZ906yUN6zUC1ZOMGoazM
	 VAAyAStoeCscpEu+mcz8Gr2GlQiRGbqeCa5QIhgIBOaVyRYRk0ZmzySi8yj+sH5g0B
	 70P+Tm4uGNDnPQBcjOxSscbocm9FsBojBIkhtCEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9762F8055C;
	Wed, 19 Oct 2022 18:23:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D9BBF8055A; Wed, 19 Oct 2022 18:23:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CC3CF80535
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 18:23:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CC3CF80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Zh/6AGUz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666196631; x=1697732631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JhyQx8OSCVLp9oqhMwryGrGNJKOHB+jy4TXOJDZt208=;
 b=Zh/6AGUzWb5PAlTthI9XMww869GlU87COH87Bhk+m/4/o91DGyeHCPz2
 rGejpAv0si5ZugxTzoZIzaNCYMNc/d5v9pPnh0frNU+SR2vjPujlZeel9
 ETk3yneeAXd3dTibbyWe12VOSn2KQORMnaCEWtejOkDFze4zy2nkuSmY5
 DUufWznORG/6ZdnnGy5youp+cpKqK7hQNFjk8IsFrn03tHm3pWgXeHYKn
 AXlcVDmLJXjmGbYc/Z9jtGshD3n62tX1wUdfrfv9Sin8gjywl/YxVhJHu
 4U+I4Tl6qA8zpRMT1bOlnBLY2VyZy8JeacD5z/fgEke8c8ZW+Qn8bzMBF g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="286856226"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="286856226"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 09:21:27 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="698153831"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="698153831"
Received: from afsinurr-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.16.185])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 09:21:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/10] ALSA/ASoC: hda: clarify bus_get_link() and
 bus_link_get() helpers
Date: Wed, 19 Oct 2022 11:21:09 -0500
Message-Id: <20221019162115.185917-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019162115.185917-1-pierre-louis.bossart@linux.intel.com>
References: <20221019162115.185917-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

We have two helpers with confusing names and different purposes.

Rename bus_get_link() and bus_get_link_at() as bus_get_hlink_by_name()
and bus_get_hlink_by_addr() respectively.

No functionality change

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/hdaudio_ext.h         |  6 +++---
 sound/hda/ext/hdac_ext_controller.c | 24 ++++++++++++------------
 sound/soc/codecs/hda.c              |  4 ++--
 sound/soc/codecs/hdac_hda.c         |  6 +++---
 sound/soc/codecs/hdac_hdmi.c        |  8 ++++----
 sound/soc/intel/avs/pcm.c           |  4 ++--
 sound/soc/intel/skylake/skl-pcm.c   |  4 ++--
 sound/soc/sof/intel/hda-dai.c       |  4 ++--
 8 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index 8e48a4decfa08..397ab4fc98283 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -27,9 +27,9 @@ void snd_hdac_ext_stream_spbcap_enable(struct hdac_bus *chip,
 				 bool enable, int index);
 
 int snd_hdac_ext_bus_get_ml_capabilities(struct hdac_bus *bus);
-struct hdac_ext_link *snd_hdac_ext_bus_link_at(struct hdac_bus *bus, int addr);
-struct hdac_ext_link *snd_hdac_ext_bus_get_link(struct hdac_bus *bus,
-						const char *codec_name);
+struct hdac_ext_link *snd_hdac_ext_bus_get_hlink_by_addr(struct hdac_bus *bus, int addr);
+struct hdac_ext_link *snd_hdac_ext_bus_get_hlink_by_name(struct hdac_bus *bus,
+							 const char *codec_name);
 
 enum hdac_ext_stream_type {
 	HDAC_EXT_STREAM_TYPE_COUPLED = 0,
diff --git a/sound/hda/ext/hdac_ext_controller.c b/sound/hda/ext/hdac_ext_controller.c
index d3e9c4ae19ee3..3730c30470f12 100644
--- a/sound/hda/ext/hdac_ext_controller.c
+++ b/sound/hda/ext/hdac_ext_controller.c
@@ -126,13 +126,13 @@ void snd_hdac_link_free_all(struct hdac_bus *bus)
 EXPORT_SYMBOL_GPL(snd_hdac_link_free_all);
 
 /**
- * snd_hdac_ext_bus_link_at - get link at specified address
- * @bus: link's parent bus device
+ * snd_hdac_ext_bus_get_hlink_by_addr - get hlink at specified address
+ * @bus: hlink's parent bus device
  * @addr: codec device address
  *
- * Returns link object or NULL if matching link is not found.
+ * Returns hlink object or NULL if matching hlink is not found.
  */
-struct hdac_ext_link *snd_hdac_ext_bus_link_at(struct hdac_bus *bus, int addr)
+struct hdac_ext_link *snd_hdac_ext_bus_get_hlink_by_addr(struct hdac_bus *bus, int addr)
 {
 	struct hdac_ext_link *hlink;
 	int i;
@@ -143,15 +143,15 @@ struct hdac_ext_link *snd_hdac_ext_bus_link_at(struct hdac_bus *bus, int addr)
 				return hlink;
 	return NULL;
 }
-EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_link_at);
+EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_get_hlink_by_addr);
 
 /**
- * snd_hdac_ext_bus_get_link - get link based on codec name
+ * snd_hdac_ext_bus_get_hlink_by_name - get hlink based on codec name
  * @bus: the pointer to HDAC bus object
  * @codec_name: codec name
  */
-struct hdac_ext_link *snd_hdac_ext_bus_get_link(struct hdac_bus *bus,
-						 const char *codec_name)
+struct hdac_ext_link *snd_hdac_ext_bus_get_hlink_by_name(struct hdac_bus *bus,
+							 const char *codec_name)
 {
 	int bus_idx, addr;
 
@@ -162,9 +162,9 @@ struct hdac_ext_link *snd_hdac_ext_bus_get_link(struct hdac_bus *bus,
 	if (addr < 0 || addr > 31)
 		return NULL;
 
-	return snd_hdac_ext_bus_link_at(bus, addr);
+	return snd_hdac_ext_bus_get_hlink_by_addr(bus, addr);
 }
-EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_get_link);
+EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_get_hlink_by_name);
 
 static int check_hdac_link_power_active(struct hdac_ext_link *hlink, bool enable)
 {
@@ -337,7 +337,7 @@ static void hdac_ext_codec_link_up(struct hdac_device *codec)
 {
 	const char *devname = dev_name(&codec->dev);
 	struct hdac_ext_link *hlink =
-		snd_hdac_ext_bus_get_link(codec->bus, devname);
+		snd_hdac_ext_bus_get_hlink_by_name(codec->bus, devname);
 
 	if (hlink)
 		snd_hdac_ext_bus_link_get(codec->bus, hlink);
@@ -347,7 +347,7 @@ static void hdac_ext_codec_link_down(struct hdac_device *codec)
 {
 	const char *devname = dev_name(&codec->dev);
 	struct hdac_ext_link *hlink =
-		snd_hdac_ext_bus_get_link(codec->bus, devname);
+		snd_hdac_ext_bus_get_hlink_by_name(codec->bus, devname);
 
 	if (hlink)
 		snd_hdac_ext_bus_link_put(codec->bus, hlink);
diff --git a/sound/soc/codecs/hda.c b/sound/soc/codecs/hda.c
index 61e8e9be6b8d7..0b8ccc5be4806 100644
--- a/sound/soc/codecs/hda.c
+++ b/sound/soc/codecs/hda.c
@@ -181,7 +181,7 @@ static int hda_codec_probe(struct snd_soc_component *component)
 		!pm_runtime_status_suspended(&hdev->dev));
 #endif
 
-	hlink = snd_hdac_ext_bus_link_at(bus, hdev->addr);
+	hlink = snd_hdac_ext_bus_get_hlink_by_addr(bus, hdev->addr);
 	if (!hlink) {
 		dev_err(&hdev->dev, "hdac link not found\n");
 		return -EIO;
@@ -289,7 +289,7 @@ static void hda_codec_remove(struct snd_soc_component *component)
 	if (hda_codec_is_display(codec))
 		snd_hdac_display_power(bus, hdev->addr, false);
 
-	hlink = snd_hdac_ext_bus_link_at(bus, hdev->addr);
+	hlink = snd_hdac_ext_bus_get_hlink_by_addr(bus, hdev->addr);
 	if (hlink)
 		snd_hdac_ext_bus_link_put(bus, hlink);
 	/*
diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 8af434e14bfba..be66853afbe2b 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -400,7 +400,7 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 	hda_codec_patch_t patch;
 	int ret;
 
-	hlink = snd_hdac_ext_bus_get_link(hdev->bus, dev_name(&hdev->dev));
+	hlink = snd_hdac_ext_bus_get_hlink_by_name(hdev->bus, dev_name(&hdev->dev));
 	if (!hlink) {
 		dev_err(&hdev->dev, "hdac link not found\n");
 		return -EIO;
@@ -516,7 +516,7 @@ static void hdac_hda_codec_remove(struct snd_soc_component *component)
 	struct hda_codec *codec = hda_pvt->codec;
 	struct hdac_ext_link *hlink = NULL;
 
-	hlink = snd_hdac_ext_bus_get_link(hdev->bus, dev_name(&hdev->dev));
+	hlink = snd_hdac_ext_bus_get_hlink_by_name(hdev->bus, dev_name(&hdev->dev));
 	if (!hlink) {
 		dev_err(&hdev->dev, "hdac link not found\n");
 		return;
@@ -584,7 +584,7 @@ static int hdac_hda_dev_probe(struct hdac_device *hdev)
 	int ret;
 
 	/* hold the ref while we probe */
-	hlink = snd_hdac_ext_bus_get_link(hdev->bus, dev_name(&hdev->dev));
+	hlink = snd_hdac_ext_bus_get_hlink_by_name(hdev->bus, dev_name(&hdev->dev));
 	if (!hlink) {
 		dev_err(&hdev->dev, "hdac link not found\n");
 		return -EIO;
diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index cb23650ad5223..ed4f7cdda04ff 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -1967,7 +1967,7 @@ static int hdmi_codec_probe(struct snd_soc_component *component)
 	 * hold the ref while we probe, also no need to drop the ref on
 	 * exit, we call pm_runtime_suspend() so that will do for us
 	 */
-	hlink = snd_hdac_ext_bus_get_link(hdev->bus, dev_name(&hdev->dev));
+	hlink = snd_hdac_ext_bus_get_hlink_by_name(hdev->bus, dev_name(&hdev->dev));
 	if (!hlink) {
 		dev_err(&hdev->dev, "hdac link not found\n");
 		return -EIO;
@@ -2144,7 +2144,7 @@ static int hdac_hdmi_dev_probe(struct hdac_device *hdev)
 	const struct hda_device_id *hdac_id = hdac_get_device_id(hdev, hdrv);
 
 	/* hold the ref while we probe */
-	hlink = snd_hdac_ext_bus_get_link(hdev->bus, dev_name(&hdev->dev));
+	hlink = snd_hdac_ext_bus_get_hlink_by_name(hdev->bus, dev_name(&hdev->dev));
 	if (!hlink) {
 		dev_err(&hdev->dev, "hdac link not found\n");
 		return -EIO;
@@ -2244,7 +2244,7 @@ static int hdac_hdmi_runtime_suspend(struct device *dev)
 	snd_hdac_codec_read(hdev, hdev->afg, 0,	AC_VERB_SET_POWER_STATE,
 							AC_PWRST_D3);
 
-	hlink = snd_hdac_ext_bus_get_link(bus, dev_name(dev));
+	hlink = snd_hdac_ext_bus_get_hlink_by_name(bus, dev_name(dev));
 	if (!hlink) {
 		dev_err(dev, "hdac link not found\n");
 		return -EIO;
@@ -2270,7 +2270,7 @@ static int hdac_hdmi_runtime_resume(struct device *dev)
 	if (!bus)
 		return 0;
 
-	hlink = snd_hdac_ext_bus_get_link(bus, dev_name(dev));
+	hlink = snd_hdac_ext_bus_get_hlink_by_name(bus, dev_name(dev));
 	if (!hlink) {
 		dev_err(dev, "hdac link not found\n");
 		return -EIO;
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 8fe5917b1e263..4e5849535a8c6 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -292,7 +292,7 @@ static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream, struct sn
 
 	/* clear link <-> stream mapping */
 	codec = dev_to_hda_codec(asoc_rtd_to_codec(rtd, 0)->dev);
-	link = snd_hdac_ext_bus_link_at(&codec->bus->core, codec->core.addr);
+	link = snd_hdac_ext_bus_get_hlink_by_addr(&codec->bus->core, codec->core.addr);
 	if (!link)
 		return -EINVAL;
 
@@ -325,7 +325,7 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 	snd_hdac_ext_link_stream_reset(link_stream);
 	snd_hdac_ext_link_stream_setup(link_stream, format_val);
 
-	link = snd_hdac_ext_bus_link_at(bus, codec->core.addr);
+	link = snd_hdac_ext_bus_get_hlink_by_addr(bus, codec->core.addr);
 	if (!link)
 		return -EINVAL;
 
diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index 1015716f93361..b07c5b58e0a62 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -558,7 +558,7 @@ static int skl_link_hw_params(struct snd_pcm_substream *substream,
 
 	snd_soc_dai_set_dma_data(dai, substream, (void *)link_dev);
 
-	link = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
+	link = snd_hdac_ext_bus_get_hlink_by_name(bus, codec_dai->component->name);
 	if (!link)
 		return -EINVAL;
 
@@ -643,7 +643,7 @@ static int skl_link_hw_free(struct snd_pcm_substream *substream,
 
 	link_dev->link_prepared = 0;
 
-	link = snd_hdac_ext_bus_get_link(bus, asoc_rtd_to_codec(rtd, 0)->component->name);
+	link = snd_hdac_ext_bus_get_hlink_by_name(bus, asoc_rtd_to_codec(rtd, 0)->component->name);
 	if (!link)
 		return -EINVAL;
 
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 0fadf99f2efad..b71bb29e764b3 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -149,7 +149,7 @@ static int hda_link_dma_cleanup(struct snd_pcm_substream *substream,
 	struct hdac_ext_link *hlink;
 	int stream_tag;
 
-	hlink = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
+	hlink = snd_hdac_ext_bus_get_hlink_by_name(bus, codec_dai->component->name);
 	if (!hlink)
 		return -EINVAL;
 
@@ -225,7 +225,7 @@ static int hda_link_dma_hw_params(struct snd_pcm_substream *substream,
 		snd_soc_dai_set_dma_data(cpu_dai, substream, (void *)hext_stream);
 	}
 
-	hlink = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
+	hlink = snd_hdac_ext_bus_get_hlink_by_name(bus, codec_dai->component->name);
 	if (!hlink)
 		return -EINVAL;
 
-- 
2.34.1

