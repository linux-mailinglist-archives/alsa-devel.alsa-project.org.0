Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB50946D1C4
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 12:13:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A46D2244;
	Wed,  8 Dec 2021 12:12:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A46D2244
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638962002;
	bh=seaGwOWPTBvP1tFycV+TeR5TdAhxGJA09yxbIe3YMDM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tGtK30glv95woCiKZwqK0ao5jrUh/jITJA+Cw16+/a34L/aREE+1ChUq1XiJn4WkK
	 MDKM72Ed2LZECfwLKJaFRLBndpLgw7pGk+La+fihXTc+sIzn5dj1WfYSff8ZBjg4Bi
	 aRrA7qwxV+ZZyP30MP1aNe1ACOFmdnXXZoXjZ0q0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57B51F804FE;
	Wed,  8 Dec 2021 12:11:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08B4DF80103; Wed,  8 Dec 2021 12:11:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF0A9F80103
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:11:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF0A9F80103
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="301192811"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="301192811"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:10:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="600600073"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2021 03:10:56 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 03/37] ALSA: hda: Update and expose codec register procedures
Date: Wed,  8 Dec 2021 12:12:27 +0100
Message-Id: <20211208111301.1817725-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211208111301.1817725-1-cezary.rojewski@intel.com>
References: <20211208111301.1817725-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, yung-chuan.liao@linux.intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, ranjani.sridharan@linux.intel.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 peter.ujfalusi@linux.intel.com, lma@semihalf.com
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

With few changes, snd_hda_codec_register() and its
unregister-counterpart can be re-used by ASoC drivers. While at it,
provide kernel doc for the exposed functions.

Due to ALSA-device vs ASoC-component organization differences, new
'snddev_managed' argument is specified allowing for better control over
codec registration process.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hda_codec.h   |  5 ++++-
 sound/pci/hda/hda_codec.c   | 35 ++++++++++++++++++++++++++---------
 sound/pci/hda/hda_local.h   |  1 -
 sound/soc/codecs/hdac_hda.c |  2 +-
 4 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index fa8d653297d3..e1a65d529e00 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -310,9 +310,12 @@ snd_hda_codec_device_init(struct hda_bus *bus, unsigned int codec_addr,
 int snd_hda_codec_new(struct hda_bus *bus, struct snd_card *card,
 		      unsigned int codec_addr, struct hda_codec **codecp);
 int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
-		      unsigned int codec_addr, struct hda_codec *codec);
+		      unsigned int codec_addr, struct hda_codec *codec,
+		      bool snddev_managed);
 int snd_hda_codec_configure(struct hda_codec *codec);
 int snd_hda_codec_update_widgets(struct hda_codec *codec);
+void snd_hda_codec_register(struct hda_codec *codec);
+void snd_hda_codec_unregister(struct hda_codec *codec);
 
 /*
  * low level functions
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 88f3f58d9a4e..f89ac0aece97 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -805,7 +805,12 @@ void snd_hda_codec_display_power(struct hda_codec *codec, bool enable)
 		snd_hdac_display_power(&codec->bus->core, codec->addr, enable);
 }
 
-/* also called from hda_bind.c */
+/**
+ * snd_hda_codec_register - Finalize codec initialization
+ * @codec: codec device to register
+ *
+ * Also called from hda_bind.c
+ */
 void snd_hda_codec_register(struct hda_codec *codec)
 {
 	if (codec->registered)
@@ -818,6 +823,7 @@ void snd_hda_codec_register(struct hda_codec *codec)
 		codec->registered = 1;
 	}
 }
+EXPORT_SYMBOL_GPL(snd_hda_codec_register);
 
 static int snd_hda_codec_dev_register(struct snd_device *device)
 {
@@ -825,10 +831,12 @@ static int snd_hda_codec_dev_register(struct snd_device *device)
 	return 0;
 }
 
-static int snd_hda_codec_dev_free(struct snd_device *device)
+/**
+ * snd_hda_codec_unregister - Unregister specified codec device
+ * @codec: codec device to unregister
+ */
+void snd_hda_codec_unregister(struct hda_codec *codec)
 {
-	struct hda_codec *codec = device->device_data;
-
 	codec->in_freeing = 1;
 	/*
 	 * snd_hda_codec_device_new() is used by legacy HDA and ASoC driver.
@@ -845,7 +853,12 @@ static int snd_hda_codec_dev_free(struct snd_device *device)
 	 */
 	if (codec->core.type == HDA_DEV_LEGACY)
 		put_device(hda_codec_dev(codec));
+}
+EXPORT_SYMBOL_GPL(snd_hda_codec_unregister);
 
+static int snd_hda_codec_dev_free(struct snd_device *device)
+{
+	snd_hda_codec_unregister(device->device_data);
 	return 0;
 }
 
@@ -932,12 +945,13 @@ int snd_hda_codec_new(struct hda_bus *bus, struct snd_card *card,
 		return PTR_ERR(codec);
 	*codecp = codec;
 
-	return snd_hda_codec_device_new(bus, card, codec_addr, *codecp);
+	return snd_hda_codec_device_new(bus, card, codec_addr, *codecp, false);
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_new);
 
 int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
-			unsigned int codec_addr, struct hda_codec *codec)
+			unsigned int codec_addr, struct hda_codec *codec,
+			bool snddev_managed)
 {
 	char component[31];
 	hda_nid_t fg;
@@ -1011,9 +1025,12 @@ int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
 		codec->core.subsystem_id, codec->core.revision_id);
 	snd_component_add(card, component);
 
-	err = snd_device_new(card, SNDRV_DEV_CODEC, codec, &dev_ops);
-	if (err < 0)
-		goto error;
+	if (snddev_managed) {
+		/* ASoC features component management instead */
+		err = snd_device_new(card, SNDRV_DEV_CODEC, codec, &dev_ops);
+		if (err < 0)
+			goto error;
+	}
 
 	/* PM runtime needs to be enabled later after binding codec */
 	pm_runtime_forbid(&codec->core.dev);
diff --git a/sound/pci/hda/hda_local.h b/sound/pci/hda/hda_local.h
index ea8ab8b43337..8d47d3679c10 100644
--- a/sound/pci/hda/hda_local.h
+++ b/sound/pci/hda/hda_local.h
@@ -135,7 +135,6 @@ int __snd_hda_add_vmaster(struct hda_codec *codec, char *name,
 #define snd_hda_add_vmaster(codec, name, tlv, followers, suffix, access) \
 	__snd_hda_add_vmaster(codec, name, tlv, followers, suffix, true, access, NULL)
 int snd_hda_codec_reset(struct hda_codec *codec);
-void snd_hda_codec_register(struct hda_codec *codec);
 void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec);
 
 #define snd_hda_regmap_sync(codec)	snd_hdac_regmap_sync(&(codec)->core)
diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 390dd6c7f6a5..38184909f055 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -413,7 +413,7 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 				       HDA_CODEC_IDX_CONTROLLER, true);
 
 	ret = snd_hda_codec_device_new(hcodec->bus, component->card->snd_card,
-				       hdev->addr, hcodec);
+				       hdev->addr, hcodec, true);
 	if (ret < 0) {
 		dev_err(&hdev->dev, "failed to create hda codec %d\n", ret);
 		goto error_no_pm;
-- 
2.25.1

