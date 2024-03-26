Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6F888C890
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:07:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96C312BDF;
	Tue, 26 Mar 2024 17:07:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96C312BDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469265;
	bh=mfp9MUGKgMyzz9N1Rro0RHkR500BoW+UsQ7SEPZ7h0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E9zmxmHUxn0nzcqtaaXwI8g5IFWc44ydG/wHrCJnViNNFsYwXa72IAIb+UkeUVycR
	 ckWA78WM+onryArYyG40thLC5wknsc1wYVp0nEoXLxzmvpeXbC+4fJyARFb9W2pJzm
	 ByVI1g6T0RK1/Zjnur1GjBzXnUN6aIJ3ySxEeSds=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8341DF805AD; Tue, 26 Mar 2024 17:06:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C8D0F80683;
	Tue, 26 Mar 2024 17:06:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D7A2F80588; Tue, 26 Mar 2024 17:05:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F546F801D5
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F546F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YZwdcALM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469131; x=1743005131;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mfp9MUGKgMyzz9N1Rro0RHkR500BoW+UsQ7SEPZ7h0s=;
  b=YZwdcALMgl93h7+DTGTp7U7NmFWncYW3EZYBd0T0NWX9Zc1TA82UtB+H
   ugI2cYHczYjOgi+Ip5nhV8AfnRuH4FNgxLYemxkX95jMO/S2Z3QldiVgn
   RWJreyW2TqPCcGHlKZzwWLbbe6hhTyn950+2gEHCUUkd9OMuatLhTydIy
   SJ1W4HVu1XGrS6zpc5z6z8BQndd8VtjYlKQ1x3sOvjpdnvD7j6PrkJI/I
   pwsX8/L6XpArQtv7RDh6sTtAhs+u6e+dvvWgAo/P6VqR2oIj0pQsjMLbA
   C1tmuKDYpakWIxt+UdGYsB3w1GN/CbyHIBylyGIlMf0qF2hjNfrA20Raq
   w==;
X-CSE-ConnectionGUID: nt5cHpvDT2+l72lExVFaHg==
X-CSE-MsgGUID: 3Yqslki6R0uASnn2fm2pPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260338"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260338"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482115"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:43 -0700
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
Subject: [PATCH 02/34] ASoC: intel: sof_sdw: Make find_codec_info_acpi()
 return a pointer
Date: Tue, 26 Mar 2024 11:03:57 -0500
Message-Id: <20240326160429.13560-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NAZ7APSCLBSAAWWUY56VQK7IQAXGCVGD
X-Message-ID-Hash: NAZ7APSCLBSAAWWUY56VQK7IQAXGCVGD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NAZ7APSCLBSAAWWUY56VQK7IQAXGCVGD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Rather than returning an index simply return a pointer to the
located codec info, this simplifies all the callers which only
want to access the codec info structure. Also remove the inline
specifier the function is fairly large for an inline function,
let the compiler decide.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 08b19a32cf9c..517ff44de1f0 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1076,18 +1076,18 @@ static struct sof_sdw_codec_info *find_codec_info_part(const u64 adr)
 
 }
 
-static inline int find_codec_info_acpi(const u8 *acpi_id)
+static struct sof_sdw_codec_info *find_codec_info_acpi(const u8 *acpi_id)
 {
 	int i;
 
 	if (!acpi_id[0])
-		return -EINVAL;
+		return NULL;
 
 	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
 		if (!memcmp(codec_info_list[i].acpi_id, acpi_id, ACPI_ID_LEN))
-			return i;
+			return &codec_info_list[i];
 
-	return -EINVAL;
+	return NULL;
 }
 
 /*
@@ -1643,18 +1643,19 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	bool aggregation = !(sof_sdw_quirk & SOF_SDW_NO_AGGREGATION);
 	struct snd_soc_codec_conf *codec_conf;
 	struct sof_sdw_codec_info *codec_info;
+	struct sof_sdw_codec_info *ssp_info;
 	bool append_dai_type = false;
 	bool ignore_pch_dmic = false;
 	int codec_conf_num = 0;
 	int codec_conf_index = 0;
 	bool group_generated[SDW_MAX_GROUPS] = { };
-	int ssp_codec_index, ssp_mask;
 	struct snd_soc_dai_link *dai_links;
 	int num_links, link_index = 0;
 	char *name, *cpu_dai_name;
 	char *codec_name, *codec_dai_name;
 	int i, j, be_id = 0;
 	int hdmi_num;
+	int ssp_mask;
 	int ret;
 
 	ret = get_dailink_info(dev, adr_link, &sdw_be_num, &codec_conf_num);
@@ -1669,8 +1670,8 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	 * system only when I2S mode is supported, not sdw mode.
 	 * Here check ACPI ID to confirm I2S is supported.
 	 */
-	ssp_codec_index = find_codec_info_acpi(mach->id);
-	if (ssp_codec_index >= 0) {
+	ssp_info = find_codec_info_acpi(mach->id);
+	if (ssp_info) {
 		ssp_mask = SOF_SSP_GET_PORT(sof_sdw_quirk);
 		ssp_num = hweight_long(ssp_mask);
 	}
@@ -1788,30 +1789,28 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		goto DMIC;
 
 	for (i = 0, j = 0; ssp_mask; i++, ssp_mask >>= 1) {
-		struct sof_sdw_codec_info *info;
 		int playback, capture;
 
 		if (!(ssp_mask & 0x1))
 			continue;
 
-		info = &codec_info_list[ssp_codec_index];
-
 		name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d-Codec", i);
 		cpu_dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", i);
 		codec_name = devm_kasprintf(dev, GFP_KERNEL, "i2c-%s:0%d",
-					    info->acpi_id, j++);
+					    ssp_info->acpi_id, j++);
 
-		playback = info->dais[0].direction[SNDRV_PCM_STREAM_PLAYBACK];
-		capture = info->dais[0].direction[SNDRV_PCM_STREAM_CAPTURE];
+		playback = ssp_info->dais[0].direction[SNDRV_PCM_STREAM_PLAYBACK];
+		capture = ssp_info->dais[0].direction[SNDRV_PCM_STREAM_CAPTURE];
 
 		ret = init_simple_dai_link(dev, dai_links + link_index, &be_id, name,
 					   playback, capture, cpu_dai_name,
-					   codec_name, info->dais[0].dai_name,
-					   NULL, info->ops);
+					   codec_name, ssp_info->dais[0].dai_name,
+					   NULL, ssp_info->ops);
 		if (ret)
 			return ret;
 
-		ret = info->dais[0].init(card, NULL, dai_links + link_index, info, 0);
+		ret = ssp_info->dais[0].init(card, NULL, dai_links + link_index,
+					     ssp_info, 0);
 		if (ret < 0)
 			return ret;
 
-- 
2.40.1

