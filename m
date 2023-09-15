Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F17237A1F05
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 14:45:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CB1BE74;
	Fri, 15 Sep 2023 14:44:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CB1BE74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694781901;
	bh=3PGrPEVFkjyjnStgupe6/kqw87gbIX3yc0ZoAhK/yME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k5eLcDU0+u+v0fhPvbj6Ih41V5R+bebwaebaolXgHgddmM3f3Jow2It5cxAziPm8c
	 /EN3VJTpYAAdoejCAe7YXNIpy7jSXXcxMs/p+mcWe9R7ZxdAWMflEHVmQvpNF2fGXi
	 pjaWSw+MJ+ggLb0+M/7i8D1PWqmVgAW4oPkSyqWs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00035F805E6; Fri, 15 Sep 2023 14:41:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E3BBF805E6;
	Fri, 15 Sep 2023 14:41:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0772EF805C7; Fri, 15 Sep 2023 14:40:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0A09F805B2
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 14:40:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0A09F805B2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=O5EsIE2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694781641; x=1726317641;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3PGrPEVFkjyjnStgupe6/kqw87gbIX3yc0ZoAhK/yME=;
  b=O5EsIE2EBHbjpycsXO3IUy74gWddAd1Dg2p9ALvmlRGQXyfqaOeWEuww
   f6JL+fAEfj6yHMgPdyJ4Lacx3vmacnxZJSKg1r+UcNvy6NgS6SPMjceUZ
   lMMzdELbj4VuATYjC8NMsKo7jHozrKCnAHw/ug8rUfuyOHNcwQZ2m0Qew
   6c/5sy8Rz7HcQRhACWYPmJLXfAoh8ht9ESpyWKwvQ+MXCupbdfUHVuXMD
   FyQtdptHeaePeBqPcjAwzRKjxFErC7ABgkDVwzv7vKYsOQ/f8tilX0rT6
   yvwqU/+7Tla28uxNaGFnv8xJyUe67W1Qevhk7Pt6pzHiM5EUCiFfKyG5J
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="358653209"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="358653209"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="774304606"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000";
   d="scan'208";a="774304606"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 05:40:36 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	brent.lu@intel.com,
	uday.m.bhat@intel.com,
	balamurugan.c@intel.com
Subject: [PATCH 12/19] ASoC: Intel: sof_ssp_amp: do not create amp link for
 nocodec board
Date: Fri, 15 Sep 2023 20:48:45 +0800
Message-Id: <20230915124852.1696857-13-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
References: <20230915124852.1696857-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BIQGHWII6X5YUJRB6GAJ37HZF2OPWV56
X-Message-ID-Hash: BIQGHWII6X5YUJRB6GAJ37HZF2OPWV56
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BIQGHWII6X5YUJRB6GAJ37HZF2OPWV56/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

A BE DAI link for speaker amplifier is always created even a board
quirk specifies there is no amplifier. Modify the driver to check
amplifier type before creating corresponding DAI link.

The topology (sof-tgl-rt1308-hdmi-ssp.m4) which supports HDMI-IN is
using fixed BE ID for each DAI link. Therefore we also uses fixed ID
in machine driver side.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Balamurugan C <balamurugan.c@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_amp.c | 79 +++++++++++++++++-----------
 1 file changed, 47 insertions(+), 32 deletions(-)

diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index e2b3553dbc65..483ddb1c04cd 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -186,6 +186,12 @@ static int sof_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 
 #define IDISP_CODEC_MASK	0x4
 
+/* BE ID defined in sof-tgl-rt1308-hdmi-ssp.m4 */
+#define HDMI_IN_BE_ID		0
+#define SPK_BE_ID		2
+#define DMIC01_BE_ID		3
+#define INTEL_HDMI_BE_ID	5
+
 static struct snd_soc_dai_link *
 sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			  int ssp_codec, int dmic_be_num, int hdmi_num,
@@ -195,6 +201,7 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 	struct snd_soc_dai_link_component *cpus;
 	struct snd_soc_dai_link *links;
 	int i, id = 0;
+	bool fixed_be = false;
 
 	links = devm_kcalloc(dev, sof_ssp_amp_card.num_links,
 					sizeof(struct snd_soc_dai_link), GFP_KERNEL);
@@ -208,6 +215,9 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 		int num_of_hdmi_ssp = (sof_ssp_amp_quirk & SOF_NO_OF_HDMI_CAPTURE_SSP_MASK) >>
 				SOF_NO_OF_HDMI_CAPTURE_SSP_SHIFT;
 
+		/* the topology supports HDMI-IN uses fixed BE ID for DAI links */
+		fixed_be = true;
+
 		for (i = 1; i <= num_of_hdmi_ssp; i++) {
 			int port = (i == 1 ? (sof_ssp_amp_quirk & SOF_HDMI_CAPTURE_1_SSP_MASK) >>
 						SOF_HDMI_CAPTURE_1_SSP_SHIFT :
@@ -222,7 +232,7 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-HDMI", port);
 			if (!links[id].name)
 				return NULL;
-			links[id].id = id;
+			links[id].id = fixed_be ? (HDMI_IN_BE_ID + i - 1) : id;
 			links[id].codecs = &asoc_dummy_dlc;
 			links[id].num_codecs = 1;
 			links[id].platforms = platform_component;
@@ -235,38 +245,40 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 	}
 
 	/* codec SSP */
-	links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", ssp_codec);
-	if (!links[id].name)
-		return NULL;
+	if (amp_type != CODEC_NONE) {
+		links[id].name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", ssp_codec);
+		if (!links[id].name)
+			return NULL;
 
-	links[id].id = id;
+		links[id].id = fixed_be ? SPK_BE_ID : id;
 
-	switch (amp_type) {
-	case CODEC_CS35L41:
-		cs35l41_set_dai_link(&links[id]);
-		break;
-	case CODEC_RT1308:
-		sof_rt1308_dai_link(&links[id]);
-		break;
-	default:
-		dev_err(dev, "invalid amp type %d\n", amp_type);
-		return NULL;
+		switch (amp_type) {
+		case CODEC_CS35L41:
+			cs35l41_set_dai_link(&links[id]);
+			break;
+		case CODEC_RT1308:
+			sof_rt1308_dai_link(&links[id]);
+			break;
+		default:
+			dev_err(dev, "invalid amp type %d\n", amp_type);
+			return NULL;
+		}
+
+		links[id].platforms = platform_component;
+		links[id].num_platforms = ARRAY_SIZE(platform_component);
+		links[id].dpcm_playback = 1;
+		/* feedback from amplifier or firmware-generated echo reference */
+		links[id].dpcm_capture = 1;
+		links[id].no_pcm = 1;
+		links[id].cpus = &cpus[id];
+		links[id].num_cpus = 1;
+		links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_codec);
+		if (!links[id].cpus->dai_name)
+			return NULL;
+
+		id++;
 	}
 
-	links[id].platforms = platform_component;
-	links[id].num_platforms = ARRAY_SIZE(platform_component);
-	links[id].dpcm_playback = 1;
-	/* feedback from amplifier or firmware-generated echo reference */
-	links[id].dpcm_capture = 1;
-	links[id].no_pcm = 1;
-	links[id].cpus = &cpus[id];
-	links[id].num_cpus = 1;
-	links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_codec);
-	if (!links[id].cpus->dai_name)
-		return NULL;
-
-	id++;
-
 	/* dmic */
 	if (dmic_be_num > 0) {
 		/* at least we have dmic01 */
@@ -283,7 +295,7 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 	}
 
 	for (i = 0; i < dmic_be_num; i++) {
-		links[id].id = id;
+		links[id].id = fixed_be ? (DMIC01_BE_ID + i) : id;
 		links[id].num_cpus = 1;
 		links[id].codecs = dmic_component;
 		links[id].num_codecs = ARRAY_SIZE(dmic_component);
@@ -312,7 +324,7 @@ sof_card_dai_links_create(struct device *dev, enum sof_ssp_codec amp_type,
 			if (!links[id].name)
 				goto devm_err;
 
-			links[id].id = id;
+			links[id].id = fixed_be ? (INTEL_HDMI_BE_ID + i - 1) : id;
 			links[id].cpus = &cpus[id];
 			links[id].num_cpus = 1;
 			links[id].cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL,
@@ -398,7 +410,10 @@ static int sof_ssp_amp_probe(struct platform_device *pdev)
 	ssp_codec = sof_ssp_amp_quirk & SOF_AMPLIFIER_SSP_MASK;
 
 	/* set number of dai links */
-	sof_ssp_amp_card.num_links = 1 + dmic_be_num;
+	sof_ssp_amp_card.num_links = dmic_be_num;
+
+	if (ctx->amp_type != CODEC_NONE)
+		sof_ssp_amp_card.num_links++;
 
 	if (sof_ssp_amp_quirk & SOF_SSP_HDMI_CAPTURE_PRESENT)
 		sof_ssp_amp_card.num_links += (sof_ssp_amp_quirk & SOF_NO_OF_HDMI_CAPTURE_SSP_MASK) >>
-- 
2.25.1

