Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9947A5C6C
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 10:24:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5C08A4E;
	Tue, 19 Sep 2023 10:23:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5C08A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695111855;
	bh=ej1n5BUPDlwWBgNoyAlza2eBgXURIBVxAyElZx047Wc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jrSDSE8scqRZ2hcKJxjR+JL1qgdkuRRkvj+NG3m9+KA3CAe2du1zQk1ZKGmqpKVh4
	 /k2BVC2OSe+b8hylfXwhVbMTTGfsWEFaV2NedvurWy21hCJKkWgbF0/zSKiATKyAgg
	 wiFyxzsvdjmIusCtR2CUQyBgFxwKNA6BfK9o7pL4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70F0EF80552; Tue, 19 Sep 2023 10:23:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A6EAF801F5;
	Tue, 19 Sep 2023 10:23:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9F68F8025A; Tue, 19 Sep 2023 10:23:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1AA85F80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 10:22:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AA85F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gG//VisY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695111779; x=1726647779;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ej1n5BUPDlwWBgNoyAlza2eBgXURIBVxAyElZx047Wc=;
  b=gG//VisYMzRSF2VZHCF970mrC4XWql+rSHGX+GRKuxNbf02j+Q8xPzR/
   l1HeL0gn6d33BJ4Moe9u+2YZIEP9UflQFINLwdHE1id6WV8lBBtayy59w
   y31Kc//XSOyDHFFm1W3dL6Xnta4KorwulzHLzmi/JVswdbdVln1lSUUQD
   J5Ssfelc40cg0Peu6qL36POBv4SyA0pETVY66VBWPBUPrQxD5cDMWWM9O
   MVgFhX0V2syqUGL40aqWue+BR0vQPIVrtC+8J7sizZrT3Z9FPyjqhtvSM
   ulCia1h+nkYkwQes/qiULPRn7I7nwYcwWhVIKxl++RopQcwpJQLfKlSlV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="370199612"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="370199612"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 01:22:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="739594478"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="739594478"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 01:22:53 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	kai.vehmanen@linux.intel.com
Subject: [PATCH] ASoC: hdac_hda: add HDA patch loader support
Date: Tue, 19 Sep 2023 16:32:09 +0800
Message-Id: <20230919083209.1919921-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TIYTLJIILPNPOQM4ZM3ST24U4R3NRZQE
X-Message-ID-Hash: TIYTLJIILPNPOQM4ZM3ST24U4R3NRZQE
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TIYTLJIILPNPOQM4ZM3ST24U4R3NRZQE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

HDA patch loader is supported by legacy HDA driver. Implement it on
ASoC HDA driver, too.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/codecs/hdac_hda.c     | 28 ++++++++++++++++++++++++++++
 sound/soc/codecs/hdac_hda.h     |  4 ++++
 sound/soc/intel/skylake/skl.c   |  1 +
 sound/soc/sof/intel/hda-codec.c |  1 +
 4 files changed, 34 insertions(+)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index be66853afbe2..8f5d97949d3d 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -7,6 +7,7 @@
  * codec drivers using hdac_ext_bus_ops ops.
  */
 
+#include <linux/firmware.h>
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/module.h>
@@ -35,6 +36,13 @@
 				 SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_176400 |\
 				 SNDRV_PCM_RATE_192000)
 
+#ifdef CONFIG_SND_HDA_PATCH_LOADER
+static char *loadable_patch[SNDRV_CARDS];
+
+module_param_array_named(patch, loadable_patch, charp, NULL, 0444);
+MODULE_PARM_DESC(patch, "Patch file for Intel HD audio interface.");
+#endif
+
 static int hdac_hda_dai_open(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai);
 static void hdac_hda_dai_close(struct snd_pcm_substream *substream,
@@ -423,6 +431,26 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 		dev_err(&hdev->dev, "failed to create hda codec %d\n", ret);
 		goto error_no_pm;
 	}
+
+#ifdef CONFIG_SND_HDA_PATCH_LOADER
+	if (loadable_patch[hda_pvt->dev_index] && *loadable_patch[hda_pvt->dev_index]) {
+		dev_info(&hdev->dev, "Applying patch firmware '%s'\n",
+			 loadable_patch[hda_pvt->dev_index]);
+		ret = request_firmware(&hda_pvt->fw, loadable_patch[hda_pvt->dev_index],
+				       &hdev->dev);
+		if (ret < 0)
+			goto error_no_pm;
+		if (hda_pvt->fw) {
+			ret = snd_hda_load_patch(hcodec->bus, hda_pvt->fw->size, hda_pvt->fw->data);
+			if (ret < 0) {
+				dev_err(&hdev->dev, "failed to load hda patch %d\n", ret);
+				goto error_no_pm;
+			}
+			release_firmware(hda_pvt->fw);
+			hda_pvt->fw = NULL;
+		}
+	}
+#endif
 	/*
 	 * Overwrite type to HDA_DEV_ASOC since it is a ASoC driver
 	 * hda_codec.c will check this flag to determine if unregister
diff --git a/sound/soc/codecs/hdac_hda.h b/sound/soc/codecs/hdac_hda.h
index b65560981abb..b7a12aea8d32 100644
--- a/sound/soc/codecs/hdac_hda.h
+++ b/sound/soc/codecs/hdac_hda.h
@@ -26,6 +26,10 @@ struct hdac_hda_priv {
 	struct hda_codec *codec;
 	struct hdac_hda_pcm pcm[HDAC_DAI_ID_NUM];
 	bool need_display_power;
+	int dev_index;
+#ifdef CONFIG_SND_HDA_PATCH_LOADER
+	const struct firmware *fw;
+#endif
 };
 
 struct hdac_ext_bus_ops *snd_soc_hdac_hda_get_ops(void);
diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 77408a981b97..d753d393a428 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -736,6 +736,7 @@ static int probe_codec(struct hdac_bus *bus, int addr)
 		return PTR_ERR(codec);
 
 	hda_codec->codec = codec;
+	hda_codec->dev_index = addr;
 	dev_set_drvdata(&codec->core.dev, hda_codec);
 
 	/* use legacy bus only for HDA codecs, idisp uses ext bus */
diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 8a5e99a898ec..28ecbebb4b84 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -169,6 +169,7 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
 		return ret;
 
 	hda_priv->codec = codec;
+	hda_priv->dev_index = address;
 	dev_set_drvdata(&codec->core.dev, hda_priv);
 
 	if ((resp & 0xFFFF0000) == IDISP_VID_INTEL) {
-- 
2.25.1

