Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDA1271FC3
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 12:12:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B60016ED;
	Mon, 21 Sep 2020 12:11:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B60016ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600683163;
	bh=G7ntkkqR8H4TGc5F5xK6f+BYbL2oyIYBDx3GWtLelvI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SC2zgnmW/udU/WzPwLwA84g1+vs+fELPzH0Ma3gz+rhfldeIvcmhPVIzNLXuFa3H4
	 a+zNXL1b74Ubf8NJJWUU/8TNmS7PvqqgutUF0uFLilyKCmibxHWv2AZ+m3Np/Ny7bl
	 g4MSnUZdkRgCekVvzcaQKtDCiejiAPajU0SWeVC4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 420A4F80171;
	Mon, 21 Sep 2020 12:11:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 501E3F80162; Mon, 21 Sep 2020 12:10:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83BECF800B2
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 12:10:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83BECF800B2
IronPort-SDR: IwxYikDtSL4jclGhnwqfmo2tuVzkxZ0lXWw76VZvzLBKSnDuKaqPdZANVm0FyBu5ot+eesNPQS
 34h5uACklUGg==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="159642787"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="159642787"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 03:10:42 -0700
IronPort-SDR: tCAB0eBBVF4hqd4jaE5MWPbqZclInyA4YgSHwbB5eMVh+J/gJBnE/3Dri2Q2X0zcrm3sn/yV8w
 4thYHfGwPORg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="510636348"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga005.fm.intel.com with ESMTP; 21 Sep 2020 03:10:39 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: hdac: make SOF HDA codec driver probe deterministic
Date: Mon, 21 Sep 2020 13:08:41 +0300
Message-Id: <20200921100841.2882662-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 cezary.rojewski@intel.com, kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, philipp.leskovitz@secunet.com
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

To provide backward compatibility to older systems, the SOF HDA driver
allows user to specify which HDMI codec driver to use at runtime via
kernel parameter. This mechanism has a subtle flaw in that it assumes
the codec drivers not to be loaded when the SOF PCI driver is loaded.

The problem is rooted in use of the hdev->type field.
snd_hdac_ext_bus_device_init() initializes this field to HDA_DEV_ASOC.
This signals the HDA core that ASoC drivers should be considered in
driver matching (hda_bus_match()). The SOF and SST drivers continue by
overriding this field to HDA_DEV_LEGACY and proceeding to load driver
modules with request_module(). Correct drivers will get loaded and
attached.

If however the codec drivers are already loaded when
snd_hdac_ext_bus_device_init() is called, the matching will not work as
expected as device type is still set to HDA_DEV_ASOC. Specifically if
hdac-hdmi is attached when machine driver is configured to use hdac-hda,
this leads to out-of-bounds memory access in
hda_dsp_hdmi_build_controls().

Fix the issue by adding codec type as a parameter to
snd_hdac_ext_bus_device_init() and ensuring type is set correctly from
the start.

BugLink: https://github.com/thesofproject/linux/issues/2311
Fixes: 139c7febad1a ("ASoC: SOF: Intel: add support for snd-hda-codec-hdmi")
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/hdaudio_ext.h     |  2 +-
 sound/hda/ext/hdac_ext_bus.c    |  5 +++--
 sound/soc/intel/skylake/skl.c   |  4 ++--
 sound/soc/sof/intel/hda-codec.c | 17 ++++++++---------
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/sound/hdaudio_ext.h b/include/sound/hdaudio_ext.h
index ef88b20c7b0a..7abf74c1c474 100644
--- a/include/sound/hdaudio_ext.h
+++ b/include/sound/hdaudio_ext.h
@@ -10,7 +10,7 @@ int snd_hdac_ext_bus_init(struct hdac_bus *bus, struct device *dev,
 
 void snd_hdac_ext_bus_exit(struct hdac_bus *bus);
 int snd_hdac_ext_bus_device_init(struct hdac_bus *bus, int addr,
-						struct hdac_device *hdev);
+				struct hdac_device *hdev, int type);
 void snd_hdac_ext_bus_device_exit(struct hdac_device *hdev);
 void snd_hdac_ext_bus_device_remove(struct hdac_bus *bus);
 
diff --git a/sound/hda/ext/hdac_ext_bus.c b/sound/hda/ext/hdac_ext_bus.c
index d0a604c939df..765c40a6ccba 100644
--- a/sound/hda/ext/hdac_ext_bus.c
+++ b/sound/hda/ext/hdac_ext_bus.c
@@ -70,11 +70,12 @@ static void default_release(struct device *dev)
  * @bus: hdac bus to attach to
  * @addr: codec address
  * @hdev: hdac device to init
+ * @type: codec type (HDAC_DEV_*) to use for this device
  *
  * Returns zero for success or a negative error code.
  */
 int snd_hdac_ext_bus_device_init(struct hdac_bus *bus, int addr,
-					struct hdac_device *hdev)
+				 struct hdac_device *hdev, int type)
 {
 	char name[15];
 	int ret;
@@ -88,7 +89,7 @@ int snd_hdac_ext_bus_device_init(struct hdac_bus *bus, int addr,
 		dev_err(bus->dev, "device init failed for hdac device\n");
 		return ret;
 	}
-	hdev->type = HDA_DEV_ASOC;
+	hdev->type = type;
 	hdev->dev.release = default_release;
 
 	ret = snd_hdac_device_register(hdev);
diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index ea00cf61d1a8..8b993722f74e 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -721,7 +721,7 @@ static int probe_codec(struct hdac_bus *bus, int addr)
 	hda_codec->codec.bus = skl_to_hbus(skl);
 	hdev = &hda_codec->codec.core;
 
-	err = snd_hdac_ext_bus_device_init(bus, addr, hdev);
+	err = snd_hdac_ext_bus_device_init(bus, addr, hdev, HDA_DEV_ASOC);
 	if (err < 0)
 		return err;
 
@@ -736,7 +736,7 @@ static int probe_codec(struct hdac_bus *bus, int addr)
 	if (!hdev)
 		return -ENOMEM;
 
-	return snd_hdac_ext_bus_device_init(bus, addr, hdev);
+	return snd_hdac_ext_bus_device_init(bus, addr, hdev, HDA_DEV_ASOC);
 #endif /* CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC */
 }
 
diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index f6ba3b593e1f..6875fa570c2c 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -117,6 +117,7 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 	struct hdac_hda_priv *hda_priv;
 	struct hda_codec *codec;
+	int type = HDA_DEV_LEGACY;
 #endif
 	struct hda_bus *hbus = sof_to_hbus(sdev);
 	struct hdac_device *hdev;
@@ -143,7 +144,11 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 	hdev = &hda_priv->codec.core;
 	codec = &hda_priv->codec;
 
-	ret = snd_hdac_ext_bus_device_init(&hbus->core, address, hdev);
+	/* only probe ASoC codec drivers for HDAC-HDMI */
+	if (!hda_codec_use_common_hdmi && (resp & 0xFFFF0000) == IDISP_VID_INTEL)
+		type = HDA_DEV_ASOC;
+
+	ret = snd_hdac_ext_bus_device_init(&hbus->core, address, hdev, type);
 	if (ret < 0)
 		return ret;
 
@@ -161,13 +166,7 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 	else
 		codec->probe_id = 0;
 
-	/*
-	 * if common HDMI codec driver is not used, codec load
-	 * is skipped here and hdac_hdmi is used instead
-	 */
-	if (hda_codec_use_common_hdmi ||
-	    (resp & 0xFFFF0000) != IDISP_VID_INTEL) {
-		hdev->type = HDA_DEV_LEGACY;
+	if (type == HDA_DEV_LEGACY) {
 		ret = hda_codec_load_module(codec);
 		/*
 		 * handle ret==0 (no driver bound) as an error, but pass
@@ -188,7 +187,7 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 	if (!hdev)
 		return -ENOMEM;
 
-	ret = snd_hdac_ext_bus_device_init(&hbus->core, address, hdev);
+	ret = snd_hdac_ext_bus_device_init(&hbus->core, address, hdev, HDA_DEV_ASOC);
 
 	return ret;
 #endif
-- 
2.27.0

