Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 172B17A91CD
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 08:36:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E7F3A4D;
	Thu, 21 Sep 2023 08:35:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E7F3A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695278171;
	bh=Uu1FgcDEvBVHUCLithFMPg/f0NwSrFDEgPpam3COMR4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iv3m7ZaGYE4/9KjH8PxgTS4tE0jmoALyI9rTGeP7tapkGNTuXsb9Pqh+XlXY2WBpX
	 os+Iz/H2Xs5jWgVugp9i9xWsBcSjoBa3p82hBORQk78tREFfH3gp3VtVCBDpTxTG8l
	 5Lt+1mKErelI5E8MilvREecpNcNK/eL5++6lbFEc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4012CF80558; Thu, 21 Sep 2023 08:34:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A80AFF801F5;
	Thu, 21 Sep 2023 08:34:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E94DAF8025A; Thu, 21 Sep 2023 08:34:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B128F800AA
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 08:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B128F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iKTFFonf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695278081; x=1726814081;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Uu1FgcDEvBVHUCLithFMPg/f0NwSrFDEgPpam3COMR4=;
  b=iKTFFonfi46R/CuhQPpTD13rhgWHDkv4/2kuVV3vHmdhrUYB6zti0LS3
   oCDAvZ4vTqmNDce2dLx5BSnUYTTihTNSoVP1mxD2pJZbCh/2nF6SitGgF
   WoESFOOLI1lXb8dGy3Sxho0YHFORsMmhWRDkAooCZPCcJU3Z9cIxsBVRN
   B4CVwk22CiulPp4emSd3hFbS1aYSfzQAAOWlqqKne3KEa9Sx2Bxa8cs2+
   pDAeVlvtp9jiI6Bo6U9PkP8ltms9yztQplFptr/BY5a9kfLf8W57LlspJ
   Aad6Y2OMLWEjVw3YzrfsAeEKuokabMwfYdVQkyiHXj1O7f25x6KzlxdHN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="360684864"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200";
   d="scan'208";a="360684864"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 23:33:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="837200822"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200";
   d="scan'208";a="837200822"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 23:33:54 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH] ASoC: hdac_hda: fix HDA patch loader support
Date: Thu, 21 Sep 2023 14:43:17 +0800
Message-Id: <20230921064317.2120452-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: W4WGCV2EQFAPMKYFNNDI3RVPG67W3FOS
X-Message-ID-Hash: W4WGCV2EQFAPMKYFNNDI3RVPG67W3FOS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W4WGCV2EQFAPMKYFNNDI3RVPG67W3FOS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The array size is irrelevant with SNDRV_CARDS. dev_index is from
codec address and the available codec number is HDA_MAX_CODECS.
Also, hda_pvt->fw is for a temporary use, no need to add a new extra
field in hdac_hda_priv{}.

Fixes: 842a62a75e70 ("ASoC: hdac_hda: add HDA patch loader support")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/codecs/hdac_hda.c | 15 ++++++++-------
 sound/soc/codecs/hdac_hda.h |  3 ---
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 8f5d97949d3d..355f30779a34 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -37,10 +37,10 @@
 				 SNDRV_PCM_RATE_192000)
 
 #ifdef CONFIG_SND_HDA_PATCH_LOADER
-static char *loadable_patch[SNDRV_CARDS];
+static char *loadable_patch[HDA_MAX_CODECS];
 
 module_param_array_named(patch, loadable_patch, charp, NULL, 0444);
-MODULE_PARM_DESC(patch, "Patch file for Intel HD audio interface.");
+MODULE_PARM_DESC(patch, "Patch file array for Intel HD audio interface. The array index is the codec address.");
 #endif
 
 static int hdac_hda_dai_open(struct snd_pcm_substream *substream,
@@ -434,20 +434,21 @@ static int hdac_hda_codec_probe(struct snd_soc_component *component)
 
 #ifdef CONFIG_SND_HDA_PATCH_LOADER
 	if (loadable_patch[hda_pvt->dev_index] && *loadable_patch[hda_pvt->dev_index]) {
+		const struct firmware *fw;
+
 		dev_info(&hdev->dev, "Applying patch firmware '%s'\n",
 			 loadable_patch[hda_pvt->dev_index]);
-		ret = request_firmware(&hda_pvt->fw, loadable_patch[hda_pvt->dev_index],
+		ret = request_firmware(&fw, loadable_patch[hda_pvt->dev_index],
 				       &hdev->dev);
 		if (ret < 0)
 			goto error_no_pm;
-		if (hda_pvt->fw) {
-			ret = snd_hda_load_patch(hcodec->bus, hda_pvt->fw->size, hda_pvt->fw->data);
+		if (fw) {
+			ret = snd_hda_load_patch(hcodec->bus, fw->size, fw->data);
 			if (ret < 0) {
 				dev_err(&hdev->dev, "failed to load hda patch %d\n", ret);
 				goto error_no_pm;
 			}
-			release_firmware(hda_pvt->fw);
-			hda_pvt->fw = NULL;
+			release_firmware(fw);
 		}
 	}
 #endif
diff --git a/sound/soc/codecs/hdac_hda.h b/sound/soc/codecs/hdac_hda.h
index b7a12aea8d32..d03a5d4e7288 100644
--- a/sound/soc/codecs/hdac_hda.h
+++ b/sound/soc/codecs/hdac_hda.h
@@ -27,9 +27,6 @@ struct hdac_hda_priv {
 	struct hdac_hda_pcm pcm[HDAC_DAI_ID_NUM];
 	bool need_display_power;
 	int dev_index;
-#ifdef CONFIG_SND_HDA_PATCH_LOADER
-	const struct firmware *fw;
-#endif
 };
 
 struct hdac_ext_bus_ops *snd_soc_hdac_hda_get_ops(void);
-- 
2.25.1

