Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A60A246D1BF
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 12:12:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BBD22282;
	Wed,  8 Dec 2021 12:12:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BBD22282
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638961978;
	bh=9w1AW34cOg+w6x4nYGqszDBxRQpBYAp3Thwgm47qcE8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uwlMD54w1MQYMBWQ+PLNYN6vq5jLTTyIBuntOkHgPsbgWrUUnd1Z1VQXcfv+kqwIJ
	 enZe4pXYRAP5qJLMeyDZadjNBe7NIg2uTKGBrJmL3Dbz3V9o7yZEGCONZykC6yBsQX
	 zzz+geHcfqXfCOsptcT4X0mGgkfkVKQXEY4xG0ps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C0A7F804FF;
	Wed,  8 Dec 2021 12:11:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C43FCF804FE; Wed,  8 Dec 2021 12:11:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 551E8F804E5
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 12:10:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 551E8F804E5
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="301192805"
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="301192805"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 03:10:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,297,1631602800"; d="scan'208";a="600600063"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2021 03:10:52 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 02/37] ALSA: hda: Update and expose snd_hda_codec_device_init()
Date: Wed,  8 Dec 2021 12:12:26 +0100
Message-Id: <20211208111301.1817725-3-cezary.rojewski@intel.com>
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

With few changes, snd_hda_codec_device_init() can be re-used by ASoC
drivers. While at it, provide kernel doc for the exposed function.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hda_codec.h |  3 +++
 sound/pci/hda/hda_codec.c | 44 ++++++++++++++++++++++++++-------------
 2 files changed, 32 insertions(+), 15 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 0e45963bb767..fa8d653297d3 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -304,6 +304,9 @@ struct hda_codec {
 /*
  * constructors
  */
+__printf(3, 4) struct hda_codec *
+snd_hda_codec_device_init(struct hda_bus *bus, unsigned int codec_addr,
+			  const char *fmt, ...);
 int snd_hda_codec_new(struct hda_bus *bus, struct snd_card *card,
 		      unsigned int codec_addr, struct hda_codec **codecp);
 int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 0c4a337c9fc0..88f3f58d9a4e 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -869,36 +869,48 @@ static void snd_hda_codec_dev_release(struct device *dev)
 
 #define DEV_NAME_LEN 31
 
-static int snd_hda_codec_device_init(struct hda_bus *bus, struct snd_card *card,
-			unsigned int codec_addr, struct hda_codec **codecp)
+/**
+ * snd_hda_codec_device_init - allocate HDA codec device
+ * @bus: codec's parent bus
+ * @codec_addr: the codec address on the parent bus
+ * @fmt: format string for the device's name
+ *
+ * Returns newly allocated codec device or ERR_PTR() on failure.
+ */
+struct hda_codec *
+snd_hda_codec_device_init(struct hda_bus *bus, unsigned int codec_addr,
+			  const char *fmt, ...)
 {
+	va_list vargs;
 	char name[DEV_NAME_LEN];
 	struct hda_codec *codec;
 	int err;
 
-	dev_dbg(card->dev, "%s: entry\n", __func__);
-
 	if (snd_BUG_ON(!bus))
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 	if (snd_BUG_ON(codec_addr > HDA_MAX_CODEC_ADDRESS))
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
 
 	codec = kzalloc(sizeof(*codec), GFP_KERNEL);
 	if (!codec)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
+
+	va_start(vargs, fmt);
+	vsprintf(name, fmt, vargs);
+	va_end(vargs);
 
-	sprintf(name, "hdaudioC%dD%d", card->number, codec_addr);
 	err = snd_hdac_device_init(&codec->core, &bus->core, name, codec_addr);
 	if (err < 0) {
 		kfree(codec);
-		return err;
+		return ERR_PTR(err);
 	}
 
+	codec->bus = bus;
 	codec->core.type = HDA_DEV_LEGACY;
-	*codecp = codec;
 
-	return err;
+	return codec;
 }
+EXPORT_SYMBOL_GPL(snd_hda_codec_device_init);
 
 /**
  * snd_hda_codec_new - create a HDA codec
@@ -912,11 +924,13 @@ static int snd_hda_codec_device_init(struct hda_bus *bus, struct snd_card *card,
 int snd_hda_codec_new(struct hda_bus *bus, struct snd_card *card,
 		      unsigned int codec_addr, struct hda_codec **codecp)
 {
-	int ret;
+	struct hda_codec *codec;
 
-	ret = snd_hda_codec_device_init(bus, card, codec_addr, codecp);
-	if (ret < 0)
-		return ret;
+	codec = snd_hda_codec_device_init(bus, codec_addr, "hdaudioC%dD%d",
+					  card->number, codec_addr);
+	if (IS_ERR(codec))
+		return PTR_ERR(codec);
+	*codecp = codec;
 
 	return snd_hda_codec_device_new(bus, card, codec_addr, *codecp);
 }
-- 
2.25.1

