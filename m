Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF2076A35C
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:50:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09194E91;
	Mon, 31 Jul 2023 23:49:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09194E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690840248;
	bh=/TagfDVU0TLm3gr7iCGJbeN27AeppC0ae/wkfPgtC2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VB1G1zgUHJmRvZSAChEIlBXebARmALOCeRXwrgCrlAKzXspvz6czfRgTialdJJmKu
	 eITGeweY0IPh/+O2+mIbhhIaaeLNbfla9e1W/osoZYYMMHBntnkyvrTsYvK7xSevwX
	 X2XE7cCQAZ7sHgJ04k47wJ76ptDDzHDOIsJl4+nA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD87BF80696; Mon, 31 Jul 2023 23:44:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD722F80570;
	Mon, 31 Jul 2023 23:44:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A8B9F805A0; Mon, 31 Jul 2023 23:43:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8158DF8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:43:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8158DF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Tknx6SXI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839807; x=1722375807;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/TagfDVU0TLm3gr7iCGJbeN27AeppC0ae/wkfPgtC2E=;
  b=Tknx6SXIDQsAZbKxctx0mOD6HsVU1azPJ3Kd56bLyejqjIj06W1+10DH
   1pcil70h65sBEa0eG+kOMGjqXlYcPFbEmxEFpHuY/ANYjAsDJE17TSe1M
   Yl3WNxqSqlZSYgpyO5tirzO6xI0sdxqfO6XFJDWTf76LcEB2ktT6TaoTL
   iBwtiEP+L9Ao1MqWJx8QRBaRKbTJVAlB7tTgCL5QpioNUgr8mlRZ44Tu8
   G768pvtF5LvQRgkD7Z8gUaYUu79NpnNmav/zlion8v4XD7uCB+yUrchnv
   seXjaeJerWfaPOq6sUilOTxKra112/mpAGbO6etHAkZ4dgGkL0Qm7Usoa
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435449823"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="435449823"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763523572"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="763523572"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:22 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 23/23] ASoC: intel: sof_sdw: Move group_generated logic
Date: Mon, 31 Jul 2023 16:42:57 -0500
Message-Id: <20230731214257.444605-24-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
References: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4XYEO2ZVA3HR6N4FFOYEN4SQCMHO5DFS
X-Message-ID-Hash: 4XYEO2ZVA3HR6N4FFOYEN4SQCMHO5DFS
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4XYEO2ZVA3HR6N4FFOYEN4SQCMHO5DFS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Hoist the handling logic for group_generated up to the
sof_card_dai_links_create level. This avoids the need to pass the array
through multiple levels of functions.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 25644eff5251..fd27e211211b 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1291,7 +1291,7 @@ static int set_codec_init_func(struct snd_soc_card *card,
 static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 			  struct device *dev, int *cpu_dai_id, int *cpu_dai_num,
 			  int *codec_num, unsigned int *group_id,
-			  bool *group_generated, int adr_index)
+			  int adr_index)
 {
 	const struct snd_soc_acpi_adr_device *adr_d;
 	const struct snd_soc_acpi_link_adr *adr_next;
@@ -1351,11 +1351,6 @@ static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 		}
 	}
 
-	/*
-	 * indicate CPU DAIs for this group have been generated
-	 * to avoid generating CPU DAIs for this group again.
-	 */
-	group_generated[*group_id] = true;
 	*cpu_dai_num = index;
 
 	return 0;
@@ -1379,8 +1374,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 			      int sdw_be_num, int sdw_cpu_dai_num,
 			      struct snd_soc_dai_link_component *cpus,
 			      const struct snd_soc_acpi_link_adr *adr_link,
-			      int *cpu_id, bool *group_generated,
-			      struct snd_soc_codec_conf *codec_conf,
+			      int *cpu_id, struct snd_soc_codec_conf *codec_conf,
 			      int codec_count, int *be_id,
 			      int *codec_conf_index,
 			      bool *ignore_pch_dmic,
@@ -1404,7 +1398,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 	int k;
 
 	ret = get_slave_info(adr_link, dev, cpu_dai_id, &cpu_dai_num, &codec_num,
-			     &group_id, group_generated, adr_index);
+			     &group_id, adr_index);
 	if (ret)
 		return ret;
 
@@ -1559,13 +1553,14 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	struct snd_soc_dai_link_component *ssp_components;
 	struct snd_soc_acpi_mach_params *mach_params = &mach->mach_params;
 	const struct snd_soc_acpi_link_adr *adr_link = mach_params->links;
+	bool aggregation = !(sof_sdw_quirk & SOF_SDW_NO_AGGREGATION);
 	struct snd_soc_dai_link_component *cpus;
 	struct snd_soc_codec_conf *codec_conf;
 	bool append_dai_type = false;
 	bool ignore_pch_dmic = false;
 	int codec_conf_num = 0;
 	int codec_conf_index = 0;
-	bool group_generated[SDW_MAX_GROUPS];
+	bool group_generated[SDW_MAX_GROUPS] = { };
 	int ssp_codec_index, ssp_mask;
 	struct snd_soc_dai_link *dai_links;
 	int num_links, link_index = 0;
@@ -1641,14 +1636,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	if (!adr_link)
 		return -EINVAL;
 
-	/*
-	 * SoundWire Slaves aggregated in the same group may be
-	 * located on different hardware links. Clear array to indicate
-	 * CPU DAIs for this group have not been generated.
-	 */
-	for (i = 0; i < SDW_MAX_GROUPS; i++)
-		group_generated[i] = false;
-
 	for (i = 0; i < SDW_MAX_LINKS; i++)
 		sdw_pin_index[i] = SDW_INTEL_BIDIR_PDI_BASE;
 
@@ -1706,7 +1693,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 			for (j = 0; j < codec_info_list[codec_index].dai_num ; j++) {
 				ret = create_sdw_dailink(card, &link_index, dai_links,
 							 sdw_be_num, sdw_cpu_dai_num, cpus,
-							 adr_link, &cpu_id, group_generated,
+							 adr_link, &cpu_id,
 							 codec_conf, codec_conf_num,
 							 &be_id, &codec_conf_index,
 							 &ignore_pch_dmic, append_dai_type, i, j);
@@ -1715,6 +1702,9 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 					return ret;
 				}
 			}
+
+			if (aggregation && endpoint->aggregated)
+				group_generated[endpoint->group_id] = true;
 		}
 	}
 
-- 
2.39.2

