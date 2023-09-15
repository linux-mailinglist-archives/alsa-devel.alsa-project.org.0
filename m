Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6787A17CA
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 09:51:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3269ADF5;
	Fri, 15 Sep 2023 09:50:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3269ADF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694764286;
	bh=YV7wiUPxH40qX3QFyXronw880qBrpYFVzzX3+75uL5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NWjlJeoETsARG//z+N1F1TIKyvwP1E6Lf7oMGlSwPRmqxsyBGhfblLV5LznQ8AojW
	 sgLSeC/4DIrfVsQiRvg5Ze7VspvFlZlDaFK9t9tSYr5+PXUqiPYilvly7FCBHn0kR0
	 xqzntluF6gPq98Dw28+DIGix6VfkZLFzzgbqK7OQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02BD7F805A0; Fri, 15 Sep 2023 09:49:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71F4EF80588;
	Fri, 15 Sep 2023 09:49:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A0BDF8059F; Fri, 15 Sep 2023 09:49:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B4C4F8047D
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 09:49:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B4C4F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Y1+5JXAS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694764147; x=1726300147;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YV7wiUPxH40qX3QFyXronw880qBrpYFVzzX3+75uL5k=;
  b=Y1+5JXAS1IexVSr2/DxXpfjO9GayEOj3mBTID4wFw726D1SogQCxbBWR
   zMCpNbyssVZn6W0ALC1r9ECIomPplK25Ld7OLn9ZzEBzKoJUSB/XMgm3r
   mPHjk3L5I4VGwOZjUHnjpucNU8yOB6Ot4IKCPd8kR0UtgCnE4EQ4xqS/d
   EeiSGhICJ8Z4WL7l8pbRFp6GkiXAoj3XRBjwkMVL2S+B71hFx2flHWpe6
   iqSOeFGH3SRgx2edLHNp0034efFxowf8TRp1pwftqXPBJUQy5qSxr4T8S
   llMo2Ptt0LpOJ/3Vmpj8kII+vpspXiaIATzJy+AfHnIF2t6hjzLm0qzKH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="376527562"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000";
   d="scan'208";a="376527562"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:48:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="779998602"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000";
   d="scan'208";a="779998602"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:47:44 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	ckeepax@opensource.cirrus.com
Subject: [PATCH 4/4] ASoC: intel: sof_sdw: Increment be_id in init_dai_link
Date: Fri, 15 Sep 2023 15:56:11 +0800
Message-Id: <20230915075611.1619548-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230915075611.1619548-1-yung-chuan.liao@linux.intel.com>
References: <20230915075611.1619548-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UKCV7DAB7L37SMXXGNM5W4REHWSCQPW3
X-Message-ID-Hash: UKCV7DAB7L37SMXXGNM5W4REHWSCQPW3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UKCV7DAB7L37SMXXGNM5W4REHWSCQPW3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Rather than incrementing the ID for the dai_links in many places
throughout the code, just increment it each time we initialise a new DAI
link.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 335048dfae53..752bfce1ea01 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -20,8 +20,6 @@ static int quirk_override = -1;
 module_param_named(quirk, quirk_override, int, 0444);
 MODULE_PARM_DESC(quirk, "Board-specific quirk override");
 
-#define INC_ID(BE, LINK)	do { (BE)++; (LINK)++; } while (0)
-
 static void log_quirks(struct device *dev)
 {
 	if (SOF_JACK_JDSRC(sof_sdw_quirk))
@@ -1089,14 +1087,14 @@ static int get_dailink_info(struct device *dev,
 }
 
 static void init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links,
-			  int be_id, char *name, int playback, int capture,
+			  int *be_id, char *name, int playback, int capture,
 			  struct snd_soc_dai_link_component *cpus, int cpus_num,
 			  struct snd_soc_dai_link_component *codecs, int codecs_num,
 			  int (*init)(struct snd_soc_pcm_runtime *rtd),
 			  const struct snd_soc_ops *ops)
 {
-	dev_dbg(dev, "create dai link %s, id %d\n", name, be_id);
-	dai_links->id = be_id;
+	dev_dbg(dev, "create dai link %s, id %d\n", name, *be_id);
+	dai_links->id = (*be_id)++;
 	dai_links->name = name;
 	dai_links->platforms = platform_component;
 	dai_links->num_platforms = ARRAY_SIZE(platform_component);
@@ -1112,7 +1110,7 @@ static void init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links
 }
 
 static int init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links,
-				int be_id, char *name, int playback, int capture,
+				int *be_id, char *name, int playback, int capture,
 				const char *cpu_dai_name,
 				const char *codec_name, const char *codec_dai_name,
 				int (*init)(struct snd_soc_pcm_runtime *rtd),
@@ -1484,7 +1482,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		playback = (stream == SNDRV_PCM_STREAM_PLAYBACK);
 		capture = (stream == SNDRV_PCM_STREAM_CAPTURE);
 
-		init_dai_link(dev, dai_links + *link_index, (*be_id)++, name,
+		init_dai_link(dev, dai_links + *link_index, be_id, name,
 			      playback, capture, cpus, cpu_dai_num, codecs, codec_num,
 			      NULL, &sdw_ops);
 
@@ -1674,7 +1672,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		playback = info->dais[0].direction[SNDRV_PCM_STREAM_PLAYBACK];
 		capture = info->dais[0].direction[SNDRV_PCM_STREAM_CAPTURE];
 
-		ret = init_simple_dai_link(dev, dai_links + link_index, be_id, name,
+		ret = init_simple_dai_link(dev, dai_links + link_index, &be_id, name,
 					   playback, capture, cpu_dai_name,
 					   codec_name, info->dais[0].dai_name,
 					   NULL, info->ops);
@@ -1685,7 +1683,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		if (ret < 0)
 			return ret;
 
-		INC_ID(be_id, link_index);
+		link_index++;
 	}
 
 DMIC:
@@ -1696,16 +1694,16 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 			goto HDMI;
 		}
 
-		ret = init_simple_dai_link(dev, dai_links + link_index, be_id, "dmic01",
+		ret = init_simple_dai_link(dev, dai_links + link_index, &be_id, "dmic01",
 					   0, 1, // DMIC only supports capture
 					   "DMIC01 Pin", "dmic-codec", "dmic-hifi",
 					   sof_sdw_dmic_init, NULL);
 		if (ret)
 			return ret;
 
-		INC_ID(be_id, link_index);
+		link_index++;
 
-		ret = init_simple_dai_link(dev, dai_links + link_index, be_id, "dmic16k",
+		ret = init_simple_dai_link(dev, dai_links + link_index, &be_id, "dmic16k",
 					   0, 1, // DMIC only supports capture
 					   "DMIC16k Pin", "dmic-codec", "dmic-hifi",
 					   /* don't call sof_sdw_dmic_init() twice */
@@ -1713,7 +1711,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		if (ret)
 			return ret;
 
-		INC_ID(be_id, link_index);
+		link_index++;
 	}
 
 HDMI:
@@ -1731,14 +1729,14 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 			codec_dai_name = "snd-soc-dummy-dai";
 		}
 
-		ret = init_simple_dai_link(dev, dai_links + link_index, be_id, name,
+		ret = init_simple_dai_link(dev, dai_links + link_index, &be_id, name,
 					   1, 0, // HDMI only supports playback
 					   cpu_dai_name, codec_name, codec_dai_name,
 					   sof_sdw_hdmi_init, NULL);
 		if (ret)
 			return ret;
 
-		INC_ID(be_id, link_index);
+		link_index++;
 	}
 
 	if (sof_sdw_quirk & SOF_SSP_BT_OFFLOAD_PRESENT) {
@@ -1748,7 +1746,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-BT", port);
 		cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", port);
 
-		ret = init_simple_dai_link(dev, dai_links + link_index, be_id, name,
+		ret = init_simple_dai_link(dev, dai_links + link_index, &be_id, name,
 					   1, 1, cpu_dai_name, asoc_dummy_dlc.name,
 					   asoc_dummy_dlc.dai_name, NULL, NULL);
 		if (ret)
-- 
2.25.1

