Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 281CD24E1C9
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 22:03:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B49C915F9;
	Fri, 21 Aug 2020 22:02:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B49C915F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598040227;
	bh=QK34Xh2BDZdQwP0z1kwjMxoGmQ5VouteiDdgFKRZ4+c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HA5Xy1fZ+bP1y+rGr7pUUn5LbvyS2qRWQCFA6vJcdZcmkLMLhzwEOcNE0uG1f2uLq
	 wWl+lRbZ1EE7wjUaNIroLTiMnhGwrUCdQjrA8kByxC+GL6UH2FcwENGwvhYVmLCpvf
	 RmkkAAw0ukekoPbl0bN9SiegjNcohbwDWoZV5Jtk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57879F80328;
	Fri, 21 Aug 2020 21:56:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 135F4F80216; Fri, 21 Aug 2020 21:56:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18E07F802C3
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 21:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18E07F802C3
IronPort-SDR: Ppsqr1ZcXtiUZdDqWvrlcEyXULil3bsx8/ejzULbcQbF7lf4EQxt/HjSzKvxupSGDbDShZ36PR
 YAQ5N7nUBvKw==
X-IronPort-AV: E=McAfee;i="6000,8403,9720"; a="217158559"
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="217158559"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:21 -0700
IronPort-SDR: qWev2RO3RHmfN0zhADmypbb+pq6q6H5bnmrrWMKR2TJFYTr/iPcB7i0+Bmy0sfZNmuTq6s2NpE
 JPbAtUepgvDg==
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="279002417"
Received: from pahnn-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.176.176])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/14] ASoC: Intel: sof_sdw: rename id as part_id
Date: Fri, 21 Aug 2020 14:55:56 -0500
Message-Id: <20200821195603.215535-10-pierre-louis.bossart@linux.intel.com>
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

The "id" field in sof_sdw_codec_info struct is actually the "part
id". Rename to prevent confusions.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 14 +++++++-------
 sound/soc/intel/boards/sof_sdw_common.h |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index dca981f7c7d3..ca231459ac10 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -212,20 +212,20 @@ static const struct snd_soc_ops sdw_ops = {
 
 static struct sof_sdw_codec_info codec_info_list[] = {
 	{
-		.id = 0x700,
+		.part_id = 0x700,
 		.direction = {true, true},
 		.dai_name = "rt700-aif1",
 		.init = sof_sdw_rt700_init,
 	},
 	{
-		.id = 0x711,
+		.part_id = 0x711,
 		.direction = {true, true},
 		.dai_name = "rt711-aif1",
 		.init = sof_sdw_rt711_init,
 		.exit = sof_sdw_rt711_exit,
 	},
 	{
-		.id = 0x1308,
+		.part_id = 0x1308,
 		.acpi_id = "10EC1308",
 		.direction = {true, false},
 		.dai_name = "rt1308-aif",
@@ -233,20 +233,20 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.init = sof_sdw_rt1308_init,
 	},
 	{
-		.id = 0x715,
+		.part_id = 0x715,
 		.direction = {false, true},
 		.dai_name = "rt715-aif2",
 		.init = sof_sdw_rt715_init,
 	},
 	{
-		.id = 0x8373,
+		.part_id = 0x8373,
 		.direction = {true, true},
 		.dai_name = "max98373-aif1",
 		.init = sof_sdw_mx8373_init,
 		.codec_card_late_probe = sof_sdw_mx8373_late_probe,
 	},
 	{
-		.id = 0x5682,
+		.part_id = 0x5682,
 		.direction = {true, true},
 		.dai_name = "rt5682-sdw",
 		.init = sof_sdw_rt5682_init,
@@ -265,7 +265,7 @@ static inline int find_codec_info_part(u64 adr)
 		 * A codec info is for all sdw version with the part id if
 		 * version_id is not specified in the codec info.
 		 */
-		if (part_id == codec_info_list[i].id &&
+		if (part_id == codec_info_list[i].part_id &&
 		    (!codec_info_list[i].version_id ||
 		     sdw_version == codec_info_list[i].version_id))
 			return i;
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index cb1320348d0b..ce0680a7b180 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -51,7 +51,7 @@ enum {
 #define SOF_SDW_NO_AGGREGATION		BIT(12)
 
 struct sof_sdw_codec_info {
-	const int id;
+	const int part_id;
 	const int version_id;
 	int amp_num;
 	const u8 acpi_id[ACPI_ID_LEN];
-- 
2.25.1

