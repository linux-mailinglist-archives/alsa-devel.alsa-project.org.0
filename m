Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C094B48FA
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 11:14:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0516174D;
	Mon, 14 Feb 2022 11:14:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0516174D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644833697;
	bh=vDZ9783BaDBJVTuarcANUW4jGNuvFTLDX9wmmtgRof4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jA5lnn4DbTxwWnUk2NDx9PBQxGSMPh14aZLcK/4NQr0MctosrfHNB7DJy4921prxn
	 /8rQlJ31dzc8Cjby1Ipky1uCLd/uVa+v6uv2DfXPZpZ2iYceNBAK0T10rs3e6xuApv
	 hP1li1qJsn79GOnE0XbnrR8gk/8XLd8iYlP8cDnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 413A4F80518;
	Mon, 14 Feb 2022 11:12:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5897FF80518; Mon, 14 Feb 2022 11:12:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 934E2F804E4
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 11:12:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 934E2F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="d4+QA+k3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644833569; x=1676369569;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vDZ9783BaDBJVTuarcANUW4jGNuvFTLDX9wmmtgRof4=;
 b=d4+QA+k3lJllevjovmNxq5YtYmyu48psjdAL70uMF261c6CaNB9K5Ez8
 6bBqrdp6nudkTgyU8RYhJht9E56PMzFpLjDs/Y5+ag6WpLd2IqpEgrieE
 RjpDSfjEeZkPxWFCJdxmyPYdGAbgpyaLizPghye/8BXtCh25YJZt2szH/
 0kyNXZbPPceXg4bfcUYBTOSHKL8l4ByNnIYUukJM7mWCR+5T+xoquzCXu
 cbRgeyg83qFwv+G3BuetUNd2xRr701SkUPUrlBfyZCi/qSmNSnh6NQYwm
 1l8/CMQ3D5BEHvt7ivJn9N3ql69W9oszhD+xLVcxlrkXpqW82JdCI6+bY w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="313338764"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="313338764"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 02:12:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="495382230"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 14 Feb 2022 02:12:38 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/4] ALSA: hda: Update and expose
 snd_hda_codec_device_init()
Date: Mon, 14 Feb 2022 11:14:02 +0100
Message-Id: <20220214101404.4074026-3-cezary.rojewski@intel.com>
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

With few changes, snd_hda_codec_device_init() can be re-used by ASoC
drivers. While at it, provide kernel doc for the exposed function.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/hda_codec.h |  3 +++
 sound/pci/hda/hda_codec.c | 45 +++++++++++++++++++++++++--------------
 2 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 82d9daa17851..5e3cbcca42f0 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -306,6 +306,9 @@ struct hda_codec {
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
index 7016b48227bf..3787060ad77f 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -877,36 +877,48 @@ static void snd_hda_codec_dev_release(struct device *dev)
 
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
@@ -920,11 +932,13 @@ static int snd_hda_codec_device_init(struct hda_bus *bus, struct snd_card *card,
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
@@ -951,7 +965,6 @@ int snd_hda_codec_device_new(struct hda_bus *bus, struct snd_card *card,
 	codec->core.dev.release = snd_hda_codec_dev_release;
 	codec->core.exec_verb = codec_exec_verb;
 
-	codec->bus = bus;
 	codec->card = card;
 	codec->addr = codec_addr;
 	mutex_init(&codec->spdif_mutex);
-- 
2.25.1

