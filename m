Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DE357B6EA
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jul 2022 14:59:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 861B817A7;
	Wed, 20 Jul 2022 14:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 861B817A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658321939;
	bh=r3xCJdioLdt8DG//ma3mmYrPKIoeMSMzKzPa/8c9SoM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rwkj35GU4hhhaQcXRH9Wwpn32S4ljFmsfdCzHPOnanMdpaum2tw+x2cVfOQu1Uq6y
	 qTNm2PMuzC2BJ3PdUMqJry7QUGvSST5FdB1a1mMuDyuRe6YLdqrbLU78NskGqf7cjQ
	 61N1BwaPCeKPhwtmGP2UVn8RhuRSH+RcvrgaV+rs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A57CF80518;
	Wed, 20 Jul 2022 14:57:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38CDDF8051A; Wed, 20 Jul 2022 14:57:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12B25F800BA
 for <alsa-devel@alsa-project.org>; Wed, 20 Jul 2022 14:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12B25F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FWsmzSsC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658321827; x=1689857827;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r3xCJdioLdt8DG//ma3mmYrPKIoeMSMzKzPa/8c9SoM=;
 b=FWsmzSsCJ0w9Wtz1yOj9ZdlXU2C4fFFnqGmazhPHYRUzGs2gDWbWrOTJ
 Fm1kYl7JV6WZLGiKZKcO4R0iCPgsTxwvp0kF0VI8ObDDpaHiUpV38YJsL
 U1uibrEqde2o6iuYOVukCyjltAfMqWVqK0Gw2tEI4i9FDG/uSo3fjcrom
 ku8ByiYYm6D1JCXG94wZeOAEavo/tCvfMcWfG5MdI2n1sbAGpOxMBuACO
 WTS5NzajTUb6CGlKHKbvP/PY9SjwdDFyYPieykYm7kqeVZ1FxasCTXNms
 033WkkKiAlfxViyGGcadQ2HCAdk52UbWlmau0f8JXtrfKOQww63hx8jBy A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="269797827"
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="269797827"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 05:57:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="656259026"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 20 Jul 2022 05:57:02 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	tiwai@suse.com
Subject: [PATCH 2/4] ALSA: hda: Make snd_hda_codec_device_init() the only
 codec constructor
Date: Wed, 20 Jul 2022 15:06:20 +0200
Message-Id: <20220720130622.146973-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720130622.146973-1-cezary.rojewski@intel.com>
References: <20220720130622.146973-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 peter.ujfalusi@linux.intel.com
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

Refactor snd_hdac_ext_bus_device_init() so that it makes use of
snd_hda_codec_device_init() to create and initialize new codec device.
Causes the latter to become the sole codec device constructor.

Users of the refactored function are updated accordingly and now also
take responsibility for assigning driver's private data as that task is
no longer performed by hdac_hda_dev_probe().

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hdaudio_ext.h     |  4 ++--
 sound/hda/ext/hdac_ext_bus.c    | 34 +++++++++++++++------------------
 sound/soc/intel/skylake/skl.c   | 24 ++++++++++-------------
 sound/soc/sof/intel/hda-codec.c | 29 ++++++++++++----------------
 4 files changed, 39 insertions(+), 52 deletions(-)

diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index d26234f9ee46..25c7b13db278 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -11,8 +11,8 @@ int snd_hdac_ext_bus_init(struct hdac_bus *bus, struct device *dev,
 		      const struct hdac_ext_bus_ops *ext_ops);
 
 void snd_hdac_ext_bus_exit(struct hdac_bus *bus);
-int snd_hdac_ext_bus_device_init(struct hdac_bus *bus, int addr,
-				struct hdac_device *hdev, int type);
+struct hda_codec *
+snd_hdac_ext_bus_device_init(struct hdac_bus *bus, int addr, int type);
 void snd_hdac_ext_bus_device_exit(struct hdac_device *hdev);
 void snd_hdac_ext_bus_device_remove(struct hdac_bus *bus);
 
diff --git a/sound/hda/ext/hdac_ext_bus.c b/sound/hda/ext/hdac_ext_bus.c
index 765c40a6ccba..bd3c7124aca1 100644
--- a/sound/hda/ext/hdac_ext_bus.c
+++ b/sound/hda/ext/hdac_ext_bus.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/io.h>
+#include <sound/hda_codec.h>
 #include <sound/hdaudio_ext.h>
 
 MODULE_DESCRIPTION("HDA extended core");
@@ -67,39 +68,34 @@ static void default_release(struct device *dev)
 
 /**
  * snd_hdac_ext_bus_device_init - initialize the HDA extended codec base device
- * @bus: hdac bus to attach to
+ * @bus: hda bus to attach to
  * @addr: codec address
- * @hdev: hdac device to init
  * @type: codec type (HDAC_DEV_*) to use for this device
  *
- * Returns zero for success or a negative error code.
+ * Returns pointer to newly created codec or ERR_PTR.
  */
-int snd_hdac_ext_bus_device_init(struct hdac_bus *bus, int addr,
-				 struct hdac_device *hdev, int type)
+struct hda_codec *
+snd_hdac_ext_bus_device_init(struct hdac_bus *bus, int addr, int type)
 {
-	char name[15];
+	struct hda_codec *codec;
 	int ret;
 
-	hdev->bus = bus;
-
-	snprintf(name, sizeof(name), "ehdaudio%dD%d", bus->idx, addr);
-
-	ret  = snd_hdac_device_init(hdev, bus, name, addr);
-	if (ret < 0) {
+	codec = snd_hda_codec_device_init(to_hda_bus(bus), addr, "ehdaudio%dD%d", bus->idx, addr);
+	if (IS_ERR(codec)) {
 		dev_err(bus->dev, "device init failed for hdac device\n");
-		return ret;
+		return codec;
 	}
-	hdev->type = type;
-	hdev->dev.release = default_release;
+	codec->core.type = type;
+	codec->core.dev.release = default_release;
 
-	ret = snd_hdac_device_register(hdev);
+	ret = snd_hdac_device_register(&codec->core);
 	if (ret) {
 		dev_err(bus->dev, "failed to register hdac device\n");
-		snd_hdac_ext_bus_device_exit(hdev);
-		return ret;
+		snd_hdac_ext_bus_device_exit(&codec->core);
+		return ERR_PTR(ret);
 	}
 
-	return 0;
+	return codec;
 }
 EXPORT_SYMBOL_GPL(snd_hdac_ext_bus_device_init);
 
diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 7e573a887118..5637292c2aa9 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -700,9 +700,8 @@ static int probe_codec(struct hdac_bus *bus, int addr)
 	struct skl_dev *skl = bus_to_skl(bus);
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC)
 	struct hdac_hda_priv *hda_codec;
-	int err;
 #endif
-	struct hdac_device *hdev;
+	struct hda_codec *codec;
 
 	mutex_lock(&bus->cmd_mutex);
 	snd_hdac_bus_send_cmd(bus, cmd);
@@ -718,25 +717,22 @@ static int probe_codec(struct hdac_bus *bus, int addr)
 	if (!hda_codec)
 		return -ENOMEM;
 
-	hda_codec->codec->bus = skl_to_hbus(skl);
-	hdev = &hda_codec->codec->core;
+	codec = snd_hdac_ext_bus_device_init(bus, addr, HDA_DEV_ASOC);
+	if (IS_ERR(codec))
+		return PTR_ERR(codec);
 
-	err = snd_hdac_ext_bus_device_init(bus, addr, hdev, HDA_DEV_ASOC);
-	if (err < 0)
-		return err;
+	hda_codec->codec = codec;
+	dev_set_drvdata(&codec->core.dev, hda_codec);
 
 	/* use legacy bus only for HDA codecs, idisp uses ext bus */
 	if ((res & 0xFFFF0000) != IDISP_INTEL_VENDOR_ID) {
-		hdev->type = HDA_DEV_LEGACY;
-		load_codec_module(hda_codec->codec);
+		codec->core.type = HDA_DEV_LEGACY;
+		load_codec_module(codec);
 	}
 	return 0;
 #else
-	hdev = devm_kzalloc(&skl->pci->dev, sizeof(*hdev), GFP_KERNEL);
-	if (!hdev)
-		return -ENOMEM;
-
-	return snd_hdac_ext_bus_device_init(bus, addr, hdev, HDA_DEV_ASOC);
+	codec = snd_hdac_ext_bus_device_init(bus, addr, HDA_DEV_ASOC);
+	return PTR_ERR_OR_ZERO(codec);
 #endif /* CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC */
 }
 
diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index de7c53224ac3..7c3ea4a12d63 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -115,11 +115,10 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 	struct hdac_hda_priv *hda_priv;
-	struct hda_codec *codec;
 	int type = HDA_DEV_LEGACY;
 #endif
 	struct hda_bus *hbus = sof_to_hbus(sdev);
-	struct hdac_device *hdev;
+	struct hda_codec *codec;
 	u32 hda_cmd = (address << 28) | (AC_NODE_ROOT << 20) |
 		(AC_VERB_PARAMETERS << 8) | AC_PAR_VENDOR_ID;
 	u32 resp = -1;
@@ -142,20 +141,19 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 	if (!hda_priv)
 		return -ENOMEM;
 
-	hda_priv->codec->bus = hbus;
-	hdev = &hda_priv->codec->core;
-	codec = hda_priv->codec;
-
 	/* only probe ASoC codec drivers for HDAC-HDMI */
 	if (!hda_codec_use_common_hdmi && (resp & 0xFFFF0000) == IDISP_VID_INTEL)
 		type = HDA_DEV_ASOC;
 
-	ret = snd_hdac_ext_bus_device_init(&hbus->core, address, hdev, type);
-	if (ret < 0)
-		return ret;
+	codec = snd_hdac_ext_bus_device_init(&hbus->core, address, type);
+	if (IS_ERR(codec))
+		return PTR_ERR(codec);
+
+	hda_priv->codec = codec;
+	dev_set_drvdata(&codec->core.dev, hda_priv);
 
 	if ((resp & 0xFFFF0000) == IDISP_VID_INTEL) {
-		if (!hdev->bus->audio_component) {
+		if (!hbus->core.audio_component) {
 			dev_dbg(sdev->dev,
 				"iDisp hw present but no driver\n");
 			ret = -ENOENT;
@@ -181,15 +179,12 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 
 out:
 	if (ret < 0) {
-		snd_hdac_device_unregister(hdev);
-		put_device(&hdev->dev);
+		snd_hdac_device_unregister(&codec->core);
+		put_device(&codec->core.dev);
 	}
 #else
-	hdev = devm_kzalloc(sdev->dev, sizeof(*hdev), GFP_KERNEL);
-	if (!hdev)
-		return -ENOMEM;
-
-	ret = snd_hdac_ext_bus_device_init(&hbus->core, address, hdev, HDA_DEV_ASOC);
+	codec = snd_hdac_ext_bus_device_init(&hbus->core, address, HDA_DEV_ASOC);
+	ret = PTR_ERR_OR_ZERO(codec);
 #endif
 
 	return ret;
-- 
2.25.1

