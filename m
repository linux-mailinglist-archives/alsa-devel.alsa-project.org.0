Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 817B94B48F9
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 11:14:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D00AF1746;
	Mon, 14 Feb 2022 11:13:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D00AF1746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644833669;
	bh=RRVOvnn9eOuEu5aKt8xoW/IUoFJSKk6G1N0H7QrYPgs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UvA7MlXsqGM060zn/ZNlXWnxUuIBClcKPDBGUxFLHUmNhoieZ1rcHK+rTxgnyV7HY
	 vJ1jWBwpuIv8BnzQJVb2naEfLKcnryC2IpeZ7nr+I43L60ZNve9Kru41LbTwMhlpxV
	 nh/mhA7ykWHcOdqE8aRfvj0nmYNuFW8J11asbSyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B581EF80515;
	Mon, 14 Feb 2022 11:12:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43EABF80508; Mon, 14 Feb 2022 11:12:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A559F8012F
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 11:12:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A559F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GuNnInxi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644833566; x=1676369566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RRVOvnn9eOuEu5aKt8xoW/IUoFJSKk6G1N0H7QrYPgs=;
 b=GuNnInxiHJVsPjWJAVeVPbiiqsf1ihuAPWZodSP49PeTSrTA1ZAxoNGa
 W2miR4KvCIixHQVC/Oia5b5Td6ZOcMm5iZcNuDw5RbTMRTSUUsG0+AM6c
 8+2DQtG/PG4zAK2ncu+nuEkc6EoDi44RP7eixMfX1Ewv+4plSkXNVjLyd
 0vbiOip+pJ1n8dS3fpRQ58taqL4GJkl/qcJQhIEbj1lkXiAdM93/z6+Tm
 Xx+ikMvoYk/6PjzHZYsKQ+hNlc3LDkKrK2X+qaA2KUgoHh8GIqwAoKNo7
 hJV0s/X8AVshRU+KPlMATBZj9AYqYsYACshKhjDd+OpVToPXWDIcwgqCt g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="313338768"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="313338768"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 02:12:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="495382249"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 14 Feb 2022 02:12:42 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 3/4] ALSA: hda: Update and expose codec register procedures
Date: Mon, 14 Feb 2022 11:14:03 +0100
Message-Id: <20220214101404.4074026-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214101404.4074026-1-cezary.rojewski@intel.com>
References: <20220214101404.4074026-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, rad@semihalf.com,
 upstream@semihalf.com, harshapriya.n@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

Changes v1 -> v2:
- snd_hda_codec_new() now calls snd_hda_codec_device_new() with
  'snddev_managed' param set to 'true', reported by Kai


 include/sound/hda_codec.h   |  5 ++++-
 sound/pci/hda/hda_codec.c   | 35 ++++++++++++++++++++++++++---------
 sound/pci/hda/hda_local.h   |  1 -
 sound/soc/codecs/hdac_hda.c |  2 +-
 4 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 5e3cbcca42f0..f74abc13414f 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -312,9 +312,12 @@ snd_hda_codec_device_init(struct hda_bus *bus, unsigned int codec_addr,
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
index 3787060ad77f..4afdc3b68bd6 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -813,7 +813,12 @@ void snd_hda_codec_display_power(struct hda_codec *codec, bool enable)
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
@@ -826,6 +831,7 @@ void snd_hda_codec_register(struct hda_codec *codec)
 		codec->registered = 1;
 	}
 }
+EXPORT_SYMBOL_GPL(snd_hda_codec_register);
 
 static int snd_hda_codec_dev_register(struct snd_device *device)
 {
@@ -833,10 +839,12 @@ static int snd_hda_codec_dev_register(struct snd_device *device)
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
@@ -853,7 +861,12 @@ static int snd_hda_codec_dev_free(struct snd_device *device)
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
 
@@ -940,12 +953,13 @@ int snd_hda_codec_new(struct hda_bus *bus, struct snd_card *card,
 		return PTR_ERR(codec);
 	*codecp = codec;
 
-	return snd_hda_codec_device_new(bus, card, codec_addr, *codecp);
+	return snd_hda_codec_device_new(bus, card, codec_addr, *codecp, true);
 }
 EXPORT_SYMBOL_GPL(snd_hda_codec_new);
 
 int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
-			unsigned int codec_addr, struct hda_codec *codec)
+			unsigned int codec_addr, struct hda_codec *codec,
+			bool snddev_managed)
 {
 	char component[31];
 	hda_nid_t fg;
@@ -1020,9 +1034,12 @@ int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
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
index 8621f576446b..4c52dfb615bc 100644
--- a/sound/pci/hda/hda_local.h
+++ b/sound/pci/hda/hda_local.h
@@ -135,7 +135,6 @@ int __snd_hda_add_vmaster(struct hda_codec *codec, char *name,
 #define snd_hda_add_vmaster(codec, name, tlv, followers, suffix, access) \
 	__snd_hda_add_vmaster(codec, name, tlv, followers, suffix, true, access, NULL)
 int snd_hda_codec_reset(struct hda_codec *codec);
-void snd_hda_codec_register(struct hda_codec *codec);
 void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec);
 void snd_hda_codec_disconnect_pcms(struct hda_codec *codec);
 
diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index de5955db0a5f..667f3df239c7 100644
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

