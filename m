Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B66DB88C8A3
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:10:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E30452BCB;
	Tue, 26 Mar 2024 17:10:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E30452BCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469416;
	bh=fQwkz9pcHM4JWHddRqJbn3Gbw0hCIVSlITvF7FgBPpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KAWdNiNmtJtlDYJMdOb9yWeygZI/p181Cy4h07w4tweCMbDbbfwM4050vyE4C/v2k
	 8tPMUz2xJxRF25WPap4gRTEDHK1CJZGlJD/5+8oaj11NC+6R1EZPKUJYXW+enrpfdY
	 ExZBiEM0tOmobJx5qeWtfBgAr5R4Yg95oUrMEqlM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 018ABF8087B; Tue, 26 Mar 2024 17:06:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4635CF80858;
	Tue, 26 Mar 2024 17:06:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38F15F80638; Tue, 26 Mar 2024 17:06:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81BB5F8057C
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81BB5F8057C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AuAWTTyE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469143; x=1743005143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fQwkz9pcHM4JWHddRqJbn3Gbw0hCIVSlITvF7FgBPpY=;
  b=AuAWTTyEvl2ks8XkV8AAwJ1FkSFAuSl7tNhHTwbx0U+m6DZUYqxQkAxr
   8ZzKohh6Dz89JGe2Fu+jeuS0kbaQAHE48Qp00mWheEUefyCmhG3cr1SOY
   dJgTWtk/yA09VGw43w10IuWBM6E0mBg3SGn7YyeYU1CeDkZgycrTg/4HR
   89p3iU8zppi5dbuHDVsQ7YfSIlGE+NfJNB4UiXxGLOIXf2GS4+hgGlKVo
   UMyp29NXH3gpfNy2884RcUGoZzwV218Ey3lKVDpiTA1zbj7YZOvOSJO8C
   qOIe4w7txufkGDE0rwaDmqNLya1qCPRisOMA+u+ZmHDcQtZa2QAViK5qZ
   A==;
X-CSE-ConnectionGUID: ITvYOTvpS3GIB/zJBIZ+bQ==
X-CSE-MsgGUID: Uo1L+I39SiqRrhgQO8n2Bg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260440"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260440"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482275"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:53 -0700
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
Subject: [PATCH 16/34] ASoC: Intel: sof_sdw: Remove no longer supported quirk
Date: Tue, 26 Mar 2024 11:04:11 -0500
Message-Id: <20240326160429.13560-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PEXU3M3X3OC2ACIHKQJMAVZFOQOCQGEM
X-Message-ID-Hash: PEXU3M3X3OC2ACIHKQJMAVZFOQOCQGEM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PEXU3M3X3OC2ACIHKQJMAVZFOQOCQGEM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

The SOF_SDW_NO_AGGREGATION quirk is mostly for debug and no longer works
correctly with the current state of the machine driver. Remove it from
the code and add an error message if someone uses it.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 12 ++++--------
 sound/soc/intel/boards/sof_sdw_common.h |  1 +
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 1253a2dc33d2..fdedc32291f0 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -36,7 +36,7 @@ static void log_quirks(struct device *dev)
 		dev_dbg(dev, "SSP port %ld\n",
 			SOF_SSP_GET_PORT(sof_sdw_quirk));
 	if (sof_sdw_quirk & SOF_SDW_NO_AGGREGATION)
-		dev_dbg(dev, "quirk SOF_SDW_NO_AGGREGATION enabled\n");
+		dev_err(dev, "quirk SOF_SDW_NO_AGGREGATION enabled but no longer supported\n");
 }
 
 static int sof_sdw_quirk_cb(const struct dmi_system_id *id)
@@ -1136,11 +1136,9 @@ static int get_dailink_info(struct device *dev,
 			    int *sdw_be_num, int *codecs_num)
 {
 	bool group_visited[SDW_MAX_GROUPS];
-	bool no_aggregation;
 	int i;
 	int j;
 
-	no_aggregation = sof_sdw_quirk & SOF_SDW_NO_AGGREGATION;
 	*sdw_be_num  = 0;
 
 	if (!adr_link)
@@ -1187,7 +1185,7 @@ static int get_dailink_info(struct device *dev,
 						continue;
 
 					/* count BE for each non-aggregated slave or group */
-					if (!endpoint->aggregated || no_aggregation ||
+					if (!endpoint->aggregated ||
 					    !group_visited[endpoint->group_id])
 						(*sdw_be_num)++;
 				}
@@ -1393,10 +1391,9 @@ static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 			  int *codec_num, unsigned int *group_id,
 			  int adr_index)
 {
-	bool no_aggregation = sof_sdw_quirk & SOF_SDW_NO_AGGREGATION;
 	int i;
 
-	if (!adr_link->adr_d[adr_index].endpoints->aggregated || no_aggregation) {
+	if (!adr_link->adr_d[adr_index].endpoints->aggregated) {
 		cpu_dai_id[0] = ffs(adr_link->mask) - 1;
 		*cpu_dai_num = 1;
 		*codec_num = 1;
@@ -1758,7 +1755,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
 	const struct snd_soc_acpi_link_adr *adr_link = mach_params->links;
-	bool aggregation = !(sof_sdw_quirk & SOF_SDW_NO_AGGREGATION);
 	struct snd_soc_codec_conf *codec_conf;
 	struct sof_sdw_codec_info *codec_info;
 	struct sof_sdw_codec_info *ssp_info;
@@ -1896,7 +1892,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 					be_id = current_be_id;
 			}
 
-			if (aggregation && endpoint->aggregated)
+			if (endpoint->aggregated)
 				group_generated[endpoint->group_id] = true;
 		}
 	}
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 1daf98a5849f..e21ef79126b2 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -50,6 +50,7 @@ enum {
 #define SOF_SDW_PCH_DMIC		BIT(6)
 #define SOF_SSP_PORT(x)		(((x) & GENMASK(5, 0)) << 7)
 #define SOF_SSP_GET_PORT(quirk)	(((quirk) >> 7) & GENMASK(5, 0))
+/* Deprecated and no longer supported by the code */
 #define SOF_SDW_NO_AGGREGATION		BIT(14)
 
 /* BT audio offload: reserve 3 bits for future */
-- 
2.40.1

