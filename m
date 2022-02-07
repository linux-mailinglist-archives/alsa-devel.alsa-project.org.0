Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 716934ABCA0
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 12:49:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E60021630;
	Mon,  7 Feb 2022 12:48:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E60021630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644234577;
	bh=jOJjrmfq6gfXpvWibkuFrdwVJ3A3FTEUSAzz9BRibQ8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l+FSec8SeCscycf11FIxySKQTC2hQm+tiiDjXkpcz9xfhGf6lGxMVmBPr35NJ7PPG
	 PXICYvHDKX+l1RSkCzzycElKX8YwjCn3JZiACqSSmBoxP03KImOkbXKtDFzeh3KacR
	 6FQA1c3vrhU48QMjl5lx3jvMr/LuT90Rj7GTt3LE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64EBEF8051C;
	Mon,  7 Feb 2022 12:47:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 938B6F804FF; Mon,  7 Feb 2022 12:47:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41964F80240
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 12:47:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41964F80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SOBewgn4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644234431; x=1675770431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jOJjrmfq6gfXpvWibkuFrdwVJ3A3FTEUSAzz9BRibQ8=;
 b=SOBewgn4/uRaSvLY/niAdeng87G0gZn+9iNspq1FO7NvbfWz3KjdydKs
 3bHqSi0pHVw/M+TcBNGkt1JtKtWH5ixkXBB3MyHOTnPOL8JJovv85okW4
 d1R24jpd4IH+gLoALc92i6N4BT0KSNv8a1I1f/2REZpU/eUHeEE/4rjZk
 Qgz7OtJRrypruutcmUy+e2+Bl6/bFasl3/+6WRMGN1UF+e4vhNRrw770h
 hYFrKjS8AsWr5mHMx2GTjWdiJR9pWxIRuVybNifl4KCRRIBqLdArNvkCC
 NZZlEdO9BPHm2xsYvu2Vgp71F0klVpRO2Uf90dJoQk4juBfcgzz8URKnh g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="273217759"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="273217759"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 03:47:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="484394939"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 07 Feb 2022 03:47:05 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ALSA: hda: Update and expose codec register procedures
Date: Mon,  7 Feb 2022 12:49:05 +0100
Message-Id: <20220207114906.3759800-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207114906.3759800-1-cezary.rojewski@intel.com>
References: <20220207114906.3759800-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, rad@semihalf.com, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, cujomalainey@chromium.org, lma@semihalf.com
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
index 3787060ad77f..4406b7983c07 100644
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

