Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EA688C889
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:06:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 461232BAA;
	Tue, 26 Mar 2024 17:06:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 461232BAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469201;
	bh=6SlSTg+Vo1TIgstqNm9sEWuuniZN2L+wo5SBrGWgI60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c8H0yNNSrOoudigNk7b0Q2cnpGWGegNDgZO6LTtIw6ThdA81Rn9AkQXVvTKtw3g8n
	 9cbhPoxZ24oX626myhoEl9GVj230NTLC4ghOFpHdM98JAW0UylRr/THxrAcqtfasoC
	 hKmstvrKTGcDvlPqb4eeEUhQxgtoI8w2ttl+mSr4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4519EF80604; Tue, 26 Mar 2024 17:06:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35CEAF80605;
	Tue, 26 Mar 2024 17:06:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DBA72F8059F; Tue, 26 Mar 2024 17:05:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D71CF80236
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D71CF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=anMXluM/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469128; x=1743005128;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6SlSTg+Vo1TIgstqNm9sEWuuniZN2L+wo5SBrGWgI60=;
  b=anMXluM/r5v8/oUpbpewYqtNCh8DGXtDcB1W/bWbda65qH0gyJBRVLn9
   Ls6qS0jU7V9oPUeUI4ADt5IO571GV5GmYeqeczAJikMDfqEMDiqDkd7lJ
   w5Oq6b6+cCPTgol7viyxlxPkFTx/URLNVlFr4X5KBIm2XfGuCdaPrDqLx
   dtGCfeiznMqb/U+lee1R8DChiblZn8AUQcJuhJGmrqBnPirLaJoOPxnfC
   WaTEAlYKu8YPUEzCPKdzmdHiDNMGAWvh2WMhD3GmAWKf3fj2LWUgYBSAc
   jDRfCOiy0hkyZ86lMzfjvVkIudGzQ4/JbzWZAaDzLxoTkvO9KmPHtoqmr
   w==;
X-CSE-ConnectionGUID: xWEoiWlZTE2+PYMDq0dhPg==
X-CSE-MsgGUID: QJSmGbDTRPOw1BTJFp9oQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260344"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260344"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482125"
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
Subject: [PATCH 03/34] ASoC: intel: sof_sdw: Make find_codec_info_dai() return
 a pointer
Date: Tue, 26 Mar 2024 11:03:58 -0500
Message-Id: <20240326160429.13560-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FKQCEQC24OO6N5MJ7JT2INJRXUIGDWAD
X-Message-ID-Hash: FKQCEQC24OO6N5MJ7JT2INJRXUIGDWAD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FKQCEQC24OO6N5MJ7JT2INJRXUIGDWAD/>
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
let the compiler decide. And move the function such that it is
located with the other find_codec_info_*() functions.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 39 ++++++++++++++++----------------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 517ff44de1f0..4bd9f62c48fc 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1090,6 +1090,23 @@ static struct sof_sdw_codec_info *find_codec_info_acpi(const u8 *acpi_id)
 	return NULL;
 }
 
+static struct sof_sdw_codec_info *find_codec_info_dai(const char *dai_name,
+						      int *dai_index)
+{
+	int i, j;
+
+	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++) {
+		for (j = 0; j < codec_info_list[i].dai_num; j++) {
+			if (!strcmp(codec_info_list[i].dais[j].dai_name, dai_name)) {
+				*dai_index = j;
+				return &codec_info_list[i];
+			}
+		}
+	}
+
+	return NULL;
+}
+
 /*
  * get BE dailink number and CPU DAI number based on sdw link adr.
  * Since some sdw slaves may be aggregated, the CPU DAI number
@@ -1403,37 +1420,19 @@ static void set_dailink_map(struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps,
 	}
 }
 
-static inline int find_codec_info_dai(const char *dai_name, int *dai_index)
-{
-	int i, j;
-
-	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++) {
-		for (j = 0; j < codec_info_list[i].dai_num; j++) {
-			if (!strcmp(codec_info_list[i].dais[j].dai_name, dai_name)) {
-				*dai_index = j;
-				return i;
-			}
-		}
-	}
-
-	return -EINVAL;
-}
-
 static int sof_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sof_sdw_codec_info *codec_info;
 	struct snd_soc_dai *dai;
-	int codec_index;
 	int dai_index;
 	int ret;
 	int i;
 
 	for_each_rtd_codec_dais(rtd, i, dai) {
-		codec_index = find_codec_info_dai(dai->name, &dai_index);
-		if (codec_index < 0)
+		codec_info = find_codec_info_dai(dai->name, &dai_index);
+		if (!codec_info)
 			return -EINVAL;
 
-		codec_info = &codec_info_list[codec_index];
 		/*
 		 * A codec dai can be connected to different dai links for capture and playback,
 		 * but we only need to call the rtd_init function once.
-- 
2.40.1

