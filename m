Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2214288C8C4
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:15:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E3452C33;
	Tue, 26 Mar 2024 17:14:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E3452C33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469700;
	bh=aLofAmgiA4bnXj15hLD9xEl99RidpdrTrPZVO++o2Fk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J48EJc2YE3lKx270zBKYv/uoBkZSN0bftaBgsmdld3VH7XeCKWEIMQrfcCX+PgYvk
	 HoscCw3P0f70usB5A2XnqJn9JZdcsCOczcP426dbb6sPRf2wNV3ocCNDlpRK0ifaSk
	 Z/ZwaBSKTh7m2TAiDKK4VyVp2boPpB/IF1RSJGN0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0632EF89814; Tue, 26 Mar 2024 17:07:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FF88F8981C;
	Tue, 26 Mar 2024 17:07:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B07E6F80C8D; Tue, 26 Mar 2024 17:06:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2499F805A9
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2499F805A9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gN6teF6K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469161; x=1743005161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aLofAmgiA4bnXj15hLD9xEl99RidpdrTrPZVO++o2Fk=;
  b=gN6teF6KC59R4hVoX02eg7g/wrPdio+daJ0wBy2ES53gYc7xzG1UtnIy
   Q7ZkabAPBL0iDtKBPpEqsCNu54cwDDRwGlNO6Sj3nagSJVbrjwYOMYKjo
   Mz3taOXXyy/2JQ9lGWqBO7VSU+CuJbRX6ZqY7GKsEBsjVB6sWLzZO0MZt
   un8XxX5+8UUvKH9QBMyxUpQAdhpEP+UZQ1Ye/u87845hxxb48vjyU5gMN
   pQaHw7b1FQlZLkrDWJGHP7ep07Q8kubzTBhzbtZcrD3sroA3IvZwZ15sp
   sH330R68up2zkQ1RntcwDujRTZkk0ukfSalvB656q1le1DbxDlbGuS1xQ
   g==;
X-CSE-ConnectionGUID: ZFGtpY+5Rkq5tjCAAPZYvQ==
X-CSE-MsgGUID: 29z7+rcrS5iEnb1aDA75kA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260559"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260559"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:05:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482485"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:05:05 -0700
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
Subject: [PATCH 31/34] ASoC: Intel: sof_sdw: Don't pass acpi_link_adr to init
 functions
Date: Tue, 26 Mar 2024 11:04:26 -0500
Message-Id: <20240326160429.13560-32-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U7LZY74TNGDMTBTCNL5VD37GPUFHSVEZ
X-Message-ID-Hash: U7LZY74TNGDMTBTCNL5VD37GPUFHSVEZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U7LZY74TNGDMTBTCNL5VD37GPUFHSVEZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

There is no need to pass the snd_soc_acpi_link_adr structure to the init
functions, it conveys no specific information about the codec. Remove
this parameter from the callbacks

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c                     | 7 ++-----
 sound/soc/intel/boards/sof_sdw_common.h              | 6 ------
 sound/soc/intel/boards/sof_sdw_cs_amp.c              | 1 -
 sound/soc/intel/boards/sof_sdw_maxim.c               | 1 -
 sound/soc/intel/boards/sof_sdw_rt711.c               | 1 -
 sound/soc/intel/boards/sof_sdw_rt_amp.c              | 1 -
 sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c | 1 -
 7 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 1816ec5dd580..f3167e3498e0 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1273,7 +1273,6 @@ struct sof_sdw_endpoint {
 	u32 link_mask;
 	const char *codec_name;
 
-	const struct snd_soc_acpi_link_adr *adr_link;
 	struct sof_sdw_codec_info *codec_info;
 	const struct sof_sdw_dai_info *dai_info;
 };
@@ -1425,7 +1424,6 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 
 				sof_end->link_mask = adr_link->mask;
 				sof_end->codec_name = codec_name;
-				sof_end->adr_link = adr_link;
 				sof_end->codec_info = codec_info;
 				sof_end->dai_info = dai_info;
 				sof_end++;
@@ -1548,8 +1546,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 
 		list_for_each_entry(sof_end, &sof_dai->endpoints, list) {
 			if (sof_end->dai_info->init)
-				sof_end->dai_info->init(card, sof_end->adr_link,
-							*dai_links,
+				sof_end->dai_info->init(card, *dai_links,
 							sof_end->codec_info,
 							playback);
 		}
@@ -1612,7 +1609,7 @@ static int create_ssp_dailinks(struct snd_soc_card *card,
 		if (ret)
 			return ret;
 
-		ret = ssp_info->dais[0].init(card, NULL, *dai_links, ssp_info, 0);
+		ret = ssp_info->dais[0].init(card, *dai_links, ssp_info, 0);
 		if (ret < 0)
 			return ret;
 
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 2132d3fc42f8..8d8c2ca68a7f 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -74,7 +74,6 @@ struct sof_sdw_dai_info {
 	const int dai_type;
 	const int dailink[2]; /* dailink id for each direction */
 	int  (*init)(struct snd_soc_card *card,
-		     const struct snd_soc_acpi_link_adr *link,
 		     struct snd_soc_dai_link *dai_links,
 		     struct sof_sdw_codec_info *info,
 		     bool playback);
@@ -132,7 +131,6 @@ int sof_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd);
 
 /* RT711 support */
 int sof_sdw_rt711_init(struct snd_soc_card *card,
-		       const struct snd_soc_acpi_link_adr *link,
 		       struct snd_soc_dai_link *dai_links,
 		       struct sof_sdw_codec_info *info,
 		       bool playback);
@@ -140,7 +138,6 @@ int sof_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_l
 
 /* RT711-SDCA support */
 int sof_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
-			      const struct snd_soc_acpi_link_adr *link,
 			      struct snd_soc_dai_link *dai_links,
 			      struct sof_sdw_codec_info *info,
 			      bool playback);
@@ -151,7 +148,6 @@ extern struct snd_soc_ops sof_sdw_rt1308_i2s_ops;
 
 /* generic amp support */
 int sof_sdw_rt_amp_init(struct snd_soc_card *card,
-			const struct snd_soc_acpi_link_adr *link,
 			struct snd_soc_dai_link *dai_links,
 			struct sof_sdw_codec_info *info,
 			bool playback);
@@ -159,14 +155,12 @@ int sof_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_
 
 /* MAXIM codec support */
 int sof_sdw_maxim_init(struct snd_soc_card *card,
-		       const struct snd_soc_acpi_link_adr *link,
 		       struct snd_soc_dai_link *dai_links,
 		       struct sof_sdw_codec_info *info,
 		       bool playback);
 
 /* CS AMP support */
 int sof_sdw_cs_amp_init(struct snd_soc_card *card,
-			const struct snd_soc_acpi_link_adr *link,
 			struct snd_soc_dai_link *dai_links,
 			struct sof_sdw_codec_info *info,
 			bool playback);
diff --git a/sound/soc/intel/boards/sof_sdw_cs_amp.c b/sound/soc/intel/boards/sof_sdw_cs_amp.c
index 56cf75bc6cc4..e29a586ce7c0 100644
--- a/sound/soc/intel/boards/sof_sdw_cs_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_cs_amp.c
@@ -57,7 +57,6 @@ int cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 }
 
 int sof_sdw_cs_amp_init(struct snd_soc_card *card,
-			const struct snd_soc_acpi_link_adr *link,
 			struct snd_soc_dai_link *dai_links,
 			struct sof_sdw_codec_info *info,
 			bool playback)
diff --git a/sound/soc/intel/boards/sof_sdw_maxim.c b/sound/soc/intel/boards/sof_sdw_maxim.c
index 034730432671..432e5112415a 100644
--- a/sound/soc/intel/boards/sof_sdw_maxim.c
+++ b/sound/soc/intel/boards/sof_sdw_maxim.c
@@ -139,7 +139,6 @@ static int mx8373_sdw_late_probe(struct snd_soc_card *card)
 }
 
 int sof_sdw_maxim_init(struct snd_soc_card *card,
-		       const struct snd_soc_acpi_link_adr *link,
 		       struct snd_soc_dai_link *dai_links,
 		       struct sof_sdw_codec_info *info,
 		       bool playback)
diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index 9762c48ba7a9..7e54fc5cbe09 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -158,7 +158,6 @@ int sof_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_l
 }
 
 int sof_sdw_rt711_init(struct snd_soc_card *card,
-		       const struct snd_soc_acpi_link_adr *link,
 		       struct snd_soc_dai_link *dai_links,
 		       struct sof_sdw_codec_info *info,
 		       bool playback)
diff --git a/sound/soc/intel/boards/sof_sdw_rt_amp.c b/sound/soc/intel/boards/sof_sdw_rt_amp.c
index 202edab95000..1b415708500e 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_amp.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_amp.c
@@ -281,7 +281,6 @@ int sof_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_
 }
 
 int sof_sdw_rt_amp_init(struct snd_soc_card *card,
-			const struct snd_soc_acpi_link_adr *link,
 			struct snd_soc_dai_link *dai_links,
 			struct sof_sdw_codec_info *info,
 			bool playback)
diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index 006771485486..85c09513bc35 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -191,7 +191,6 @@ int sof_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link
 }
 
 int sof_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
-			      const struct snd_soc_acpi_link_adr *link,
 			      struct snd_soc_dai_link *dai_links,
 			      struct sof_sdw_codec_info *info,
 			      bool playback)
-- 
2.40.1

