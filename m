Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BF288C88D
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:06:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFFCF2BD2;
	Tue, 26 Mar 2024 17:06:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFFCF2BD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469217;
	bh=p4bcEeZvlLZOeW2O2yiVYCUk6wRlaf1Q9CsfKwwjbvA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J2VtL4SqNnV5pZmo21gFNxlWBCFMHxDCEzkaSnnhxO8akM4B7zEBBuNrQLFjtU4z8
	 9j5onkUSjsjKlNcdn05wnPJKjy/uG+FNcUJHWujsmqbozSuc7FSDHEn+veD3coLgxv
	 LWE4HSlKrwQOgcGWV1Rt+225T0UF5XRSVQmJy+rM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9607EF80609; Tue, 26 Mar 2024 17:06:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34CD1F805FF;
	Tue, 26 Mar 2024 17:06:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E929BF805AF; Tue, 26 Mar 2024 17:05:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8E7EF8055C
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8E7EF8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fsoHKQx8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469131; x=1743005131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p4bcEeZvlLZOeW2O2yiVYCUk6wRlaf1Q9CsfKwwjbvA=;
  b=fsoHKQx8vzbJq2+4sS/BO4E901w0lHcnRkbQ+U1b2nHR4qBmmXdp+A3f
   2yIbvT5EcSbMODBuTEqSJh18zh/ge+VI7d5WaqmbfrC7RfOvWczDOV96Z
   4uJEiKWjEavPxIxPer2L7dw+/0Y3du61f22yrAmBkv1FkWbHyt5mJTBpr
   GgPkTf2GJzUSLHangkdcu6RdeHdRXNncIlFGAAIRBVeZY43dnSXF5fSm9
   IaRiDIEIdvm1wTLLQCjUF5/JtPinbsi6efAnldwjaNSSvuNP1oyXt+9fV
   kMj5ZJGR/m3dhbeWBx0RPIcY/1qTQxh5PHiRKUKBqAJZA399kYQmZgJyg
   Q==;
X-CSE-ConnectionGUID: 0tnh8G8GSjGazu3zzgBbdA==
X-CSE-MsgGUID: f6BznRnGTUKJ2p8UJmNXLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260371"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260371"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482180"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 07/34] ASoC: Intel: sof_sdw: Move flags to private struct
Date: Tue, 26 Mar 2024 11:04:02 -0500
Message-Id: <20240326160429.13560-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KMB62S5P2NQY2I7KTZ4ZXH735QCVSOJT
X-Message-ID-Hash: KMB62S5P2NQY2I7KTZ4ZXH735QCVSOJT
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KMB62S5P2NQY2I7KTZ4ZXH735QCVSOJT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Move the flags ignore_pch_dmic and append_dai_type into the drivers
private structure rather than passing them around between functions.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 21 +++++++--------------
 sound/soc/intel/boards/sof_sdw_common.h |  2 ++
 2 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 45732884e310..5557db68a002 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1463,10 +1463,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 			      struct snd_soc_dai_link *dai_links, int sdw_be_num,
 			      const struct snd_soc_acpi_link_adr *adr_link,
 			      struct snd_soc_codec_conf **codec_conf,
-			      int *be_id, bool *ignore_pch_dmic,
-			      bool append_dai_type,
-			      int adr_index,
-			      int dai_index)
+			      int *be_id, int adr_index, int dai_index)
 {
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct device *dev = card->dev;
@@ -1549,8 +1546,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 	if (!codec_info)
 		return -EINVAL;
 
-	if (codec_info->ignore_pch_dmic)
-		*ignore_pch_dmic = true;
+	ctx->ignore_pch_dmic |= codec_info->ignore_pch_dmic;
 
 	for_each_pcm_streams(stream) {
 		char *name, *cpu_name;
@@ -1572,7 +1568,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		}
 
 		/* create stream name according to first link id */
-		if (append_dai_type) {
+		if (ctx->append_dai_type) {
 			name = devm_kasprintf(dev, GFP_KERNEL,
 					      sdw_stream_name[stream + 2], cpu_dai_id[0],
 					      type_strings[codec_info->dais[dai_index].dai_type]);
@@ -1647,8 +1643,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	struct snd_soc_codec_conf *codec_conf;
 	struct sof_sdw_codec_info *codec_info;
 	struct sof_sdw_codec_info *ssp_info;
-	bool append_dai_type = false;
-	bool ignore_pch_dmic = false;
 	int codec_conf_num = 0;
 	bool group_generated[SDW_MAX_GROUPS] = { };
 	struct snd_soc_dai_link *dai_links;
@@ -1732,7 +1726,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 			if (!codec_info)
 				return -EINVAL;
 			if (codec_info->dai_num > 1) {
-				append_dai_type = true;
+				ctx->append_dai_type = true;
 				goto out;
 			}
 			for (j = 0; j < i; j++) {
@@ -1740,7 +1734,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 				    SDW_PART_ID(adr_link->adr_d[j].adr)) ||
 				    (SDW_MFG_ID(adr_link->adr_d[i].adr) !=
 				    SDW_MFG_ID(adr_link->adr_d[j].adr))) {
-					append_dai_type = true;
+					ctx->append_dai_type = true;
 					goto out;
 				}
 			}
@@ -1771,8 +1765,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 				ret = create_sdw_dailink(card, &link_index, dai_links,
 							 sdw_be_num, adr_link,
 							 &codec_conf, &current_be_id,
-							 &ignore_pch_dmic,
-							 append_dai_type, i, j);
+							 i, j);
 				if (ret < 0) {
 					dev_err(dev, "failed to create dai link %d\n", link_index);
 					return ret;
@@ -1825,7 +1818,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 DMIC:
 	/* dmic */
 	if (dmic_num > 0) {
-		if (ignore_pch_dmic) {
+		if (ctx->ignore_pch_dmic) {
 			dev_warn(dev, "Ignoring PCH DMIC\n");
 			goto HDMI;
 		}
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index a04cbab9bc70..1daf98a5849f 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -103,6 +103,8 @@ struct mc_private {
 	struct device *amp_dev1, *amp_dev2;
 	/* To store SDW Pin index for each SoundWire link */
 	unsigned int sdw_pin_index[SDW_MAX_LINKS];
+	bool append_dai_type;
+	bool ignore_pch_dmic;
 };
 
 extern unsigned long sof_sdw_quirk;
-- 
2.40.1

