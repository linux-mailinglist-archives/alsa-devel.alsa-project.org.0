Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17630720A5F
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:32:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E5911FE;
	Fri,  2 Jun 2023 22:31:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E5911FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737928;
	bh=iWOScQHVbw++h23CVe+bZjPuzcn6pDdFUYlo5RBew+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kldh5Ip8UUiwyMug97XcbC7T6md5Wd6tghUopQTZ06HiDL8RoxwDokRatckdbpMyt
	 TrwcidbwgXzJxsFASlBwLKo1FzPjIQBoHDwz+LfLUcFAJd+q690H9/k3q66/badujQ
	 uivUcSTUhFInQZjzM51LmxV3Xk5PWrrtvwXDaf6w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55979F805D5; Fri,  2 Jun 2023 22:25:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4502F805C1;
	Fri,  2 Jun 2023 22:25:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A6D7F8057F; Fri,  2 Jun 2023 22:25:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE1F4F80132
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE1F4F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=n825YS+N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737388; x=1717273388;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iWOScQHVbw++h23CVe+bZjPuzcn6pDdFUYlo5RBew+c=;
  b=n825YS+N6oPCRz70PQWArr9DpvFTl/IvWLpzgzxsE4zoHQBjacErkKnM
   9gL0Iuf0UrtGa4NBJ4MI1VQn6ZVc9csx5+wrpMNVwkGG5L/VyQbQdWJ7D
   7YyXoCfOMuzRm/92l9/nrI8JL/Za8c58cP+HqBIenJ2Q6RUj7AF5oWdct
   KZclEaBlhGfYyDNiU6P2dSh6cow1Vz6yHIevIf7DnIxvQTbyTl6nkKNqK
   lQyAWS8NBSM5CdRJ57IqNc/UkZUyGCcxDqZ+vDB4kePPSALxKarL6DxKS
   GN1tH+NqBloms7WMeGFnmUrH5DwFMJT5vysN3vyEDGvZG6oMIEfTG/bir
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811213"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811213"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020011"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020011"
Received: from clatorre-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 05/28] ASoC: Intel: sdw_sof: append dai_type and remove
 codec_type
Date: Fri,  2 Jun 2023 15:22:02 -0500
Message-Id: <20230602202225.249209-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LIDFZLKORQMW5T3Y7GVTTIWKPV34CCAD
X-Message-ID-Hash: LIDFZLKORQMW5T3Y7GVTTIWKPV34CCAD
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

We append codec type to dailink name to distinguish different dailink
on the same sdw link and direction. But we could create multi dailinks
for a codec and the dailink name will be duplicated if we append codec
type to the dailink name.
Appending dai type instead of codec type can solve the issue.
For example, if a codec supports JACK on dai 0 and AMP on dai 1, the
existing code will create dailinks
SDW0-Playback-SimpleJack or SDW0-Playback-SmartAmp for both dailinks,
and it will be SDW0-Playback-SimpleJack for dailink 0 and
SDW0-Playback-SmartAmp for dailink 1 after this change.
Then codec type is not used any more and can be removed.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 28 ++++++-------------------
 sound/soc/intel/boards/sof_sdw_common.h |  5 -----
 2 files changed, 6 insertions(+), 27 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index b197c2920e80..6c4c05addb50 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -573,7 +573,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 			},
 		},
 		.dai_num = 1,
-		.codec_type = SOF_SDW_CODEC_TYPE_JACK,
 	},
 	{
 		.part_id = 0x711,
@@ -589,7 +588,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 			},
 		},
 		.dai_num = 1,
-		.codec_type = SOF_SDW_CODEC_TYPE_JACK,
 	},
 	{
 		.part_id = 0x711,
@@ -605,7 +603,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 			},
 		},
 		.dai_num = 1,
-		.codec_type = SOF_SDW_CODEC_TYPE_JACK,
 	},
 	{
 		.part_id = 0x1308,
@@ -622,7 +619,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		},
 		.dai_num = 1,
 		.ops = &sof_sdw_rt1308_i2s_ops,
-		.codec_type = SOF_SDW_CODEC_TYPE_AMP,
 	},
 	{
 		.part_id = 0x1316,
@@ -637,7 +633,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 			},
 		},
 		.dai_num = 1,
-		.codec_type = SOF_SDW_CODEC_TYPE_AMP,
 	},
 	{
 		.part_id = 0x1318,
@@ -652,7 +647,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 			},
 		},
 		.dai_num = 1,
-		.codec_type = SOF_SDW_CODEC_TYPE_AMP,
 	},
 	{
 		.part_id = 0x714,
@@ -668,7 +662,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 			},
 		},
 		.dai_num = 1,
-		.codec_type = SOF_SDW_CODEC_TYPE_MIC,
 	},
 	{
 		.part_id = 0x715,
@@ -684,7 +677,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 			},
 		},
 		.dai_num = 1,
-		.codec_type = SOF_SDW_CODEC_TYPE_MIC,
 	},
 	{
 		.part_id = 0x714,
@@ -700,7 +692,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 			},
 		},
 		.dai_num = 1,
-		.codec_type = SOF_SDW_CODEC_TYPE_MIC,
 	},
 	{
 		.part_id = 0x715,
@@ -716,7 +707,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 			},
 		},
 		.dai_num = 1,
-		.codec_type = SOF_SDW_CODEC_TYPE_MIC,
 	},
 	{
 		.part_id = 0x8373,
@@ -730,7 +720,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 			},
 		},
 		.dai_num = 1,
-		.codec_type = SOF_SDW_CODEC_TYPE_AMP,
 	},
 	{
 		.part_id = 0x5682,
@@ -744,7 +733,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 			},
 		},
 		.dai_num = 1,
-		.codec_type = SOF_SDW_CODEC_TYPE_JACK,
 	},
 	{
 		.part_id = 0xaaaa, /* generic codec mockup */
@@ -759,7 +747,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 			},
 		},
 		.dai_num = 1,
-		.codec_type = SOF_SDW_CODEC_TYPE_JACK,
 	},
 	{
 		.part_id = 0xaa55, /* headset codec mockup */
@@ -774,7 +761,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 			},
 		},
 		.dai_num = 1,
-		.codec_type = SOF_SDW_CODEC_TYPE_JACK,
 	},
 	{
 		.part_id = 0x55aa, /* amplifier mockup */
@@ -789,7 +775,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 			},
 		},
 		.dai_num = 1,
-		.codec_type = SOF_SDW_CODEC_TYPE_AMP,
 	},
 	{
 		.part_id = 0x5555,
@@ -804,7 +789,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 			},
 		},
 		.dai_num = 1,
-		.codec_type = SOF_SDW_CODEC_TYPE_MIC,
 	},
 };
 
@@ -1181,7 +1165,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			      int codec_count, int *link_id,
 			      int *codec_conf_index,
 			      bool *ignore_pch_dmic,
-			      bool append_codec_type,
+			      bool append_dai_type,
 			      int adr_index)
 {
 	const struct snd_soc_acpi_link_adr *link_next;
@@ -1261,10 +1245,10 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		}
 
 		/* create stream name according to first link id */
-		if (append_codec_type) {
+		if (append_dai_type) {
 			name = devm_kasprintf(dev, GFP_KERNEL,
 					      sdw_stream_name[stream + 2], cpu_dai_id[0],
-					      type_strings[codec_info->codec_type]);
+					      type_strings[codec_info->dais[0].dai_type]);
 		} else {
 			name = devm_kasprintf(dev, GFP_KERNEL,
 					      sdw_stream_name[stream], cpu_dai_id[0]);
@@ -1384,7 +1368,7 @@ static int sof_card_dai_links_create(struct device *dev,
 	const struct snd_soc_acpi_link_adr *adr_link;
 	struct snd_soc_dai_link_component *cpus;
 	struct snd_soc_codec_conf *codec_conf;
-	bool append_codec_type = false;
+	bool append_dai_type = false;
 	bool ignore_pch_dmic = false;
 	int codec_conf_count;
 	int codec_conf_index = 0;
@@ -1489,7 +1473,7 @@ static int sof_card_dai_links_create(struct device *dev,
 				    SDW_PART_ID(adr_link->adr_d[j].adr)) ||
 				    (SDW_MFG_ID(adr_link->adr_d[i].adr) !=
 				    SDW_MFG_ID(adr_link->adr_d[i].adr))) {
-					append_codec_type = true;
+					append_dai_type = true;
 					goto out;
 				}
 			}
@@ -1519,7 +1503,7 @@ static int sof_card_dai_links_create(struct device *dev,
 						 &cpu_id, group_generated,
 						 codec_conf, codec_conf_count,
 						 &be_id, &codec_conf_index,
-						 &ignore_pch_dmic, append_codec_type, i);
+						 &ignore_pch_dmic, append_dai_type, i);
 			if (ret < 0) {
 				dev_err(dev, "failed to create dai link %d", link_index);
 				return ret;
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index def2d47323bf..65b3f6eee924 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -56,10 +56,6 @@ enum {
 	(((quirk) << SOF_BT_OFFLOAD_SSP_SHIFT) & SOF_BT_OFFLOAD_SSP_MASK)
 #define SOF_SSP_BT_OFFLOAD_PRESENT	BIT(18)
 
-#define SOF_SDW_CODEC_TYPE_JACK		0
-#define SOF_SDW_CODEC_TYPE_AMP		1
-#define SOF_SDW_CODEC_TYPE_MIC		2
-
 #define SOF_SDW_DAI_TYPE_JACK		0
 #define SOF_SDW_DAI_TYPE_AMP		1
 #define SOF_SDW_DAI_TYPE_MIC		2
@@ -84,7 +80,6 @@ struct sof_sdw_dai_info {
 struct sof_sdw_codec_info {
 	const int part_id;
 	const int version_id;
-	const int codec_type;
 	int amp_num;
 	const u8 acpi_id[ACPI_ID_LEN];
 	const bool ignore_pch_dmic;
-- 
2.37.2

