Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F237A17C8
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 09:51:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57D3DDEC;
	Fri, 15 Sep 2023 09:50:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57D3DDEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694764265;
	bh=uV1GM+V7j7ZFNoKi6K2H9pk3ITdQ9VRdpUb8f1F/X8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S5IKhiNyVVHqnNCO6mP5G7x0JoCTcXmX1xwME8ep2KQjJ1nhZDc4mn7LShsJPFd4s
	 ttBiOj+GHL7u7qf2IRA/PvcxpKxFXPPeVlMlZ1yOJICu+YRfTLnUtMIfmBuW1dUZM8
	 EZZJtxR67LErxEoCjGDSviU/64xRvxffbmWf1AUw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6723AF80425; Fri, 15 Sep 2023 09:49:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE3AEF80571;
	Fri, 15 Sep 2023 09:49:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9F83F80579; Fri, 15 Sep 2023 09:49:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31AEDF80425
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 09:49:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31AEDF80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iOxhxgbc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694764145; x=1726300145;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uV1GM+V7j7ZFNoKi6K2H9pk3ITdQ9VRdpUb8f1F/X8A=;
  b=iOxhxgbcCiB5luTkdFux+NxBz+YdfBw4380Jb+lZa/S64aCKdMECYBKo
   mDuOz4ml/zZfm3IZ7pfW55sKKEc3sGuZEQpjAdA7v7i8d8vYAyr7IpBn9
   H8dVwChhAtNHJDIKuPD8hThZd1wrT85FA2dLu0eDtl0o1vo7SjbyvulDR
   OiCldH6iDKwtjlD+Rv+T2hDmZDOLg9Hog0zLPDwCriAB9TMAJHdOiynnd
   /9BFi27HyXlTtWe59hwE826EcjGf9cGj/pT5zN0nOZjPQgIg5PzE0ocRw
   Dp2tbiVCHNdwjeAt5M6KXOY6ZQUm80i/+VqMDS/UcHaz6aSWu1ISV05Gr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="376527539"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000";
   d="scan'208";a="376527539"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="779998419"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000";
   d="scan'208";a="779998419"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:47:38 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	ckeepax@opensource.cirrus.com
Subject: [PATCH 2/4] ASoC: intel: sof_sdw: Add simple DAI link creation helper
Date: Fri, 15 Sep 2023 15:56:09 +0800
Message-Id: <20230915075611.1619548-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915075611.1619548-1-yung-chuan.liao@linux.intel.com>
References: <20230915075611.1619548-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HZXX4PBLBVZZBFI4Z4ZSWKED63QDEQKM
X-Message-ID-Hash: HZXX4PBLBVZZBFI4Z4ZSWKED63QDEQKM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HZXX4PBLBVZZBFI4Z4ZSWKED63QDEQKM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

The code contains a fair amount of state tracking and one part of that
is keeping track of which entry in the large global cpus
snd_soc_dai_link_component array is currently in use. Add a helper
function to allocate a simple DAI link, this simplifies the
code slightly and moves us in the direction of eliminating the need for
the large global cpus array. This does slightly increase the number of
allocations done, but this is probe time and the code already does a
large number of allocations so this increase is small over all.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 161 ++++++++++++++-----------------
 1 file changed, 72 insertions(+), 89 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index eaecdb75686c..f64bf8b2377c 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -488,13 +488,6 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 	{}
 };
 
-static struct snd_soc_dai_link_component dmic_component[] = {
-	{
-		.name = "dmic-codec",
-		.dai_name = "dmic-hifi",
-	}
-};
-
 static struct snd_soc_dai_link_component platform_component[] = {
 	{
 		/* name might be overridden during probe */
@@ -1121,6 +1114,31 @@ static void init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links
 	dai_links->ops = ops;
 }
 
+static int init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links,
+				int be_id, char *name, int playback, int capture,
+				const char *cpu_dai_name,
+				const char *codec_name, const char *codec_dai_name,
+				int (*init)(struct snd_soc_pcm_runtime *rtd),
+				const struct snd_soc_ops *ops)
+{
+	struct snd_soc_dai_link_component *dlc;
+
+	/* Allocate two DLCs one for the CPU, one for the CODEC */
+	dlc = devm_kcalloc(dev, 2, sizeof(*dlc), GFP_KERNEL);
+	if (!dlc || !name || !cpu_dai_name || !codec_name || !codec_dai_name)
+		return -ENOMEM;
+
+	dlc[0].dai_name = cpu_dai_name;
+
+	dlc[1].name = codec_name;
+	dlc[1].dai_name = codec_dai_name;
+
+	init_dai_link(dev, dai_links, be_id, name, playback, capture,
+		      &dlc[0], 1, &dlc[1], 1, init, ops);
+
+	return 0;
+}
+
 static bool is_unique_device(const struct snd_soc_acpi_link_adr *adr_link,
 			     unsigned int sdw_version,
 			     unsigned int mfg_id,
@@ -1512,8 +1530,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	struct snd_soc_acpi_mach *mach = dev_get_platdata(card->dev);
 	int sdw_be_num = 0, ssp_num = 0, dmic_num = 0, hdmi_num = 0, bt_num = 0;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
-	struct snd_soc_dai_link_component *idisp_components;
-	struct snd_soc_dai_link_component *ssp_components;
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
 	const struct snd_soc_acpi_link_adr *adr_link = mach_params->links;
 	bool aggregation = !(sof_sdw_quirk & SOF_SDW_NO_AGGREGATION);
@@ -1527,7 +1543,8 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	int ssp_codec_index, ssp_mask;
 	struct snd_soc_dai_link *dai_links;
 	int num_links, link_index = 0;
-	char *name, *cpu_name;
+	char *name, *cpu_dai_name;
+	char *codec_name, *codec_dai_name;
 	int total_cpu_dai_num;
 	int sdw_cpu_dai_num;
 	int i, j, be_id = 0;
@@ -1670,43 +1687,26 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	for (i = 0, j = 0; ssp_mask; i++, ssp_mask >>= 1) {
 		struct sof_sdw_codec_info *info;
 		int playback, capture;
-		char *codec_name;
 
 		if (!(ssp_mask & 0x1))
 			continue;
 
-		name = devm_kasprintf(dev, GFP_KERNEL,
-				      "SSP%d-Codec", i);
-		if (!name)
-			return -ENOMEM;
-
-		cpu_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", i);
-		if (!cpu_name)
-			return -ENOMEM;
-
-		ssp_components = devm_kzalloc(dev, sizeof(*ssp_components),
-					      GFP_KERNEL);
-		if (!ssp_components)
-			return -ENOMEM;
-
 		info = &codec_info_list[ssp_codec_index];
+
+		name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", i);
+		cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", i);
 		codec_name = devm_kasprintf(dev, GFP_KERNEL, "i2c-%s:0%d",
 					    info->acpi_id, j++);
-		if (!codec_name)
-			return -ENOMEM;
-
-		ssp_components->name = codec_name;
-		/* TODO: support multi codec dai on SSP when it is needed */
-		ssp_components->dai_name = info->dais[0].dai_name;
-		cpus[cpu_id].dai_name = cpu_name;
 
 		playback = info->dais[0].direction[SNDRV_PCM_STREAM_PLAYBACK];
 		capture = info->dais[0].direction[SNDRV_PCM_STREAM_CAPTURE];
-		init_dai_link(dev, dai_links + link_index, be_id, name,
-			      playback, capture,
-			      cpus + cpu_id, 1,
-			      ssp_components, 1,
-			      NULL, info->ops);
+
+		ret = init_simple_dai_link(dev, dai_links + link_index, be_id, name,
+					   playback, capture, cpu_dai_name,
+					   codec_name, info->dais[0].dai_name,
+					   NULL, info->ops);
+		if (ret)
+			return ret;
 
 		ret = info->dais[0].init(card, NULL, dai_links + link_index, info, 0);
 		if (ret < 0)
@@ -1722,63 +1722,49 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 			dev_warn(dev, "Ignoring PCH DMIC\n");
 			goto HDMI;
 		}
-		cpus[cpu_id].dai_name = "DMIC01 Pin";
-		init_dai_link(dev, dai_links + link_index, be_id, "dmic01",
-			      0, 1, // DMIC only supports capture
-			      cpus + cpu_id, 1,
-			      dmic_component, 1,
-			      sof_sdw_dmic_init, NULL);
+
+		ret = init_simple_dai_link(dev, dai_links + link_index, be_id, "dmic01",
+					   0, 1, // DMIC only supports capture
+					   "DMIC01 Pin", "dmic-codec", "dmic-hifi",
+					   sof_sdw_dmic_init, NULL);
+		if (ret)
+			return ret;
+
 		INC_ID(be_id, cpu_id, link_index);
 
-		cpus[cpu_id].dai_name = "DMIC16k Pin";
-		init_dai_link(dev, dai_links + link_index, be_id, "dmic16k",
-			      0, 1, // DMIC only supports capture
-			      cpus + cpu_id, 1,
-			      dmic_component, 1,
-			      /* don't call sof_sdw_dmic_init() twice */
-			      NULL, NULL);
+		ret = init_simple_dai_link(dev, dai_links + link_index, be_id, "dmic16k",
+					   0, 1, // DMIC only supports capture
+					   "DMIC16k Pin", "dmic-codec", "dmic-hifi",
+					   /* don't call sof_sdw_dmic_init() twice */
+					   NULL, NULL);
+		if (ret)
+			return ret;
+
 		INC_ID(be_id, cpu_id, link_index);
 	}
 
 HDMI:
 	/* HDMI */
-	if (hdmi_num > 0) {
-		idisp_components = devm_kcalloc(dev, hdmi_num,
-						sizeof(*idisp_components),
-						GFP_KERNEL);
-		if (!idisp_components)
-			return -ENOMEM;
-	}
-
 	for (i = 0; i < hdmi_num; i++) {
-		name = devm_kasprintf(dev, GFP_KERNEL,
-				      "iDisp%d", i + 1);
-		if (!name)
-			return -ENOMEM;
+		name = devm_kasprintf(dev, GFP_KERNEL, "iDisp%d", i + 1);
+		cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "iDisp%d Pin", i + 1);
 
 		if (ctx->idisp_codec) {
-			idisp_components[i].name = "ehdaudio0D2";
-			idisp_components[i].dai_name = devm_kasprintf(dev,
-								      GFP_KERNEL,
-								      "intel-hdmi-hifi%d",
-								      i + 1);
-			if (!idisp_components[i].dai_name)
-				return -ENOMEM;
+			codec_name = "ehdaudio0D2";
+			codec_dai_name = devm_kasprintf(dev, GFP_KERNEL,
+							"intel-hdmi-hifi%d", i + 1);
 		} else {
-			idisp_components[i] = asoc_dummy_dlc;
+			codec_name = "snd-soc-dummy";
+			codec_dai_name = "snd-soc-dummy-dai";
 		}
 
-		cpu_name = devm_kasprintf(dev, GFP_KERNEL,
-					  "iDisp%d Pin", i + 1);
-		if (!cpu_name)
-			return -ENOMEM;
+		ret = init_simple_dai_link(dev, dai_links + link_index, be_id, name,
+					   1, 0, // HDMI only supports playback
+					   cpu_dai_name, codec_name, codec_dai_name,
+					   sof_sdw_hdmi_init, NULL);
+		if (ret)
+			return ret;
 
-		cpus[cpu_id].dai_name = cpu_name;
-		init_dai_link(dev, dai_links + link_index, be_id, name,
-			      1, 0, // HDMI only supports playback
-			      cpus + cpu_id, 1,
-			      idisp_components + i, 1,
-			      sof_sdw_hdmi_init, NULL);
 		INC_ID(be_id, cpu_id, link_index);
 	}
 
@@ -1787,16 +1773,13 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 				SOF_BT_OFFLOAD_SSP_SHIFT;
 
 		name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
-		if (!name)
-			return -ENOMEM;
+		cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", port);
 
-		cpu_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", port);
-		if (!cpu_name)
-			return -ENOMEM;
-
-		cpus[cpu_id].dai_name = cpu_name;
-		init_dai_link(dev, dai_links + link_index, be_id, name, 1, 1,
-			      cpus + cpu_id, 1, &asoc_dummy_dlc, 1, NULL, NULL);
+		ret = init_simple_dai_link(dev, dai_links + link_index, be_id, name,
+					   1, 1, cpu_dai_name, asoc_dummy_dlc.name,
+					   asoc_dummy_dlc.dai_name, NULL, NULL);
+		if (ret)
+			return ret;
 	}
 
 	card->dai_link = dai_links;
-- 
2.25.1

