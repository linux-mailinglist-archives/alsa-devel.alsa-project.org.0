Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2CA24E1CB
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 22:04:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFEE81665;
	Fri, 21 Aug 2020 22:03:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFEE81665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598040264;
	bh=jl04W2FFEsPOnSU41LCUNzuFcqWoiWo3uQWs4j4jFqA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mUvzCYiHoS8HT5QbRQMoD48QAiP3SuHT2Z2GoZHZ7IYWTV+Nd6KoMMEJRG/tRGyb1
	 QEp/fttae5N7xeXVKPhwvymXUz4uzPbL/sqnewG0lrh8vcreAvaWK5VifDFscmh7nT
	 kU3zWrq0ma9uvLqNTpmpM+9li4YBJkJGYIJSZ9lY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFECCF80338;
	Fri, 21 Aug 2020 21:56:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6BD2F802E9; Fri, 21 Aug 2020 21:56:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41EDAF802A9
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 21:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41EDAF802A9
IronPort-SDR: 6l233SA9xeup3Anz717kZA0m4eqExQRpbhFIW/0vV5rfupK0L3H3fTWJa8XGGRE+Q7igCtnbSj
 WjPQYpJTNgBA==
X-IronPort-AV: E=McAfee;i="6000,8403,9720"; a="217158557"
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="217158557"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:20 -0700
IronPort-SDR: XMEyhJlIA9tMknhu2WP028WPyFGy0p6FpE4zC+zDSwL6ZOJ8ztMRXrSFmnP5+3Zg/rfbyMhGjm
 EKm39ZnofuXg==
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="279002414"
Received: from pahnn-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.176.176])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/14] ASoC: Intel: sof_sdw: check SoundWire version when
 matching codec
Date: Fri, 21 Aug 2020 14:55:55 -0500
Message-Id: <20200821195603.215535-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
References: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vinod.koul@intel.com, broonie@kernel.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Some codecs with the same part id but different SoundWire versions
have different configurations. So we have to separate them in
codec_info_list[].

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 35 ++++++++++++++-----------
 sound/soc/intel/boards/sof_sdw_common.h |  1 +
 2 files changed, 20 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 100c0a83a6ad..dca981f7c7d3 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -253,18 +253,25 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 	},
 };
 
-static inline int find_codec_info_part(unsigned int part_id)
+static inline int find_codec_info_part(u64 adr)
 {
+	unsigned int part_id, sdw_version;
 	int i;
 
+	part_id = SDW_PART_ID(adr);
+	sdw_version = SDW_VERSION(adr);
 	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
-		if (part_id == codec_info_list[i].id)
-			break;
+		/*
+		 * A codec info is for all sdw version with the part id if
+		 * version_id is not specified in the codec info.
+		 */
+		if (part_id == codec_info_list[i].id &&
+		    (!codec_info_list[i].version_id ||
+		     sdw_version == codec_info_list[i].version_id))
+			return i;
 
-	if (i == ARRAY_SIZE(codec_info_list))
-		return -EINVAL;
+	return -EINVAL;
 
-	return i;
 }
 
 static inline int find_codec_info_acpi(const u8 *acpi_id)
@@ -310,13 +317,12 @@ static int get_sdw_dailink_info(const struct snd_soc_acpi_link_adr *links,
 
 	for (link = links; link->num_adr; link++) {
 		const struct snd_soc_acpi_endpoint *endpoint;
-		int part_id, codec_index;
+		int codec_index;
 		int stream;
 		u64 adr;
 
 		adr = link->adr_d->adr;
-		part_id = SDW_PART_ID(adr);
-		codec_index = find_codec_info_part(part_id);
+		codec_index = find_codec_info_part(adr);
 		if (codec_index < 0)
 			return codec_index;
 
@@ -444,7 +450,7 @@ static int create_codec_dai_name(struct device *dev,
 		if (!codec[comp_index].name)
 			return -ENOMEM;
 
-		codec_index = find_codec_info_part(part_id);
+		codec_index = find_codec_info_part(adr);
 		if (codec_index < 0)
 			return codec_index;
 
@@ -468,11 +474,9 @@ static int set_codec_init_func(const struct snd_soc_acpi_link_adr *link,
 		 * same group.
 		 */
 		for (i = 0; i < link->num_adr; i++) {
-			unsigned int part_id;
 			int codec_index;
 
-			part_id = SDW_PART_ID(link->adr_d[i].adr);
-			codec_index = find_codec_info_part(part_id);
+			codec_index = find_codec_info_part(link->adr_d[i].adr);
 
 			if (codec_index < 0)
 				return codec_index;
@@ -576,7 +580,7 @@ static int create_sdw_dailink(struct device *dev, int *be_index,
 	struct snd_soc_dai_link_component *codecs;
 	int cpu_dai_id[SDW_MAX_CPU_DAIS];
 	int cpu_dai_num, cpu_dai_index;
-	unsigned int part_id, group_id;
+	unsigned int group_id;
 	int codec_idx = 0;
 	int i = 0, j = 0;
 	int codec_index;
@@ -618,8 +622,7 @@ static int create_sdw_dailink(struct device *dev, int *be_index,
 	}
 
 	/* find codec info to create BE DAI */
-	part_id = SDW_PART_ID(link->adr_d[0].adr);
-	codec_index = find_codec_info_part(part_id);
+	codec_index = find_codec_info_part(link->adr_d[0].adr);
 	if (codec_index < 0)
 		return codec_index;
 
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 76d6c0c3839d..cb1320348d0b 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -52,6 +52,7 @@ enum {
 
 struct sof_sdw_codec_info {
 	const int id;
+	const int version_id;
 	int amp_num;
 	const u8 acpi_id[ACPI_ID_LEN];
 	const bool direction[2]; // playback & capture support
-- 
2.25.1

