Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A4376A34D
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:49:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0ECE6E8A;
	Mon, 31 Jul 2023 23:49:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0ECE6E8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690840190;
	bh=VOg2y9kMbxP64SqeJhnseY+asSF8IgRfVRngUHkThY0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mBJxeL8HXdLYoNcFeVbBhFq25ZZ3Z7iurFwKXD09IoDLMdFStzeCT2tjBmGZ3oz3w
	 1G7CoUJVGghRqt8vtICPFm8cMZ3VO20IAPM7oSZBXBtqN+JWZfqZj3H3daO2TBtDPc
	 WAbVxFD83IvOzZesANW3+68bQ2cXONxL46qo0QS0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1308EF80675; Mon, 31 Jul 2023 23:44:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57C9CF80673;
	Mon, 31 Jul 2023 23:44:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 917AFF805AA; Mon, 31 Jul 2023 23:43:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3F0CF8057C
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:43:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3F0CF8057C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Xonbpgp/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839803; x=1722375803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VOg2y9kMbxP64SqeJhnseY+asSF8IgRfVRngUHkThY0=;
  b=Xonbpgp/IIV8kRuTTGcS03MdEm4ePZyYOVF6mqYJLPG1ohwAhsGP23CJ
   JlPEUckt9Y2dQvP1KN5b+yI21zTgKXDi+ncX0zSe0mbvyBrltowiN6PBw
   E+/NgkkeHMbDQ+kIc6PmyglxQ2HUe/xLw1MtG8z1omsv1CHnPLtfMcGMu
   IDEkwdF2alXE4z6LD/oJ1FmXsl3LrxI8sGmYfd/PCYJ5nzKZ85DD3MyIY
   kJibv6glwGuPK+nw3LWsmf04jlEL0yH7pvOyKxY0/GUI92um5exlzs8cp
   01qgSU2d9Jj7BTLoLRfpvJvIvnKKTqqFEPRgXFL4P0U+BiPN9alju/Eqj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435449792"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="435449792"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763523561"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="763523561"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 16/23] ASoC: intel: sof_sdw: Remove redundant parameters in
 dai creation
Date: Mon, 31 Jul 2023 16:42:50 -0500
Message-Id: <20230731214257.444605-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
References: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SLQUKND7T3EKUFTXCKLBA4GPOAS5Q7TV
X-Message-ID-Hash: SLQUKND7T3EKUFTXCKLBA4GPOAS5Q7TV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SLQUKND7T3EKUFTXCKLBA4GPOAS5Q7TV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Pull the device and mach struct out of the card rather than explicitly
passing to sof_card_dai_links_create.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index d4f2711b6f26..dc5337ea75da 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1348,8 +1348,7 @@ static void set_dailink_map(struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_m
 
 static const char * const type_strings[] = {"SimpleJack", "SmartAmp", "SmartMic"};
 
-static int create_sdw_dailink(struct snd_soc_card *card,
-			      struct device *dev, int *link_index,
+static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 			      struct snd_soc_dai_link *dai_links,
 			      int sdw_be_num, int sdw_cpu_dai_num,
 			      struct snd_soc_dai_link_component *cpus,
@@ -1363,6 +1362,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			      int adr_index,
 			      int dai_index)
 {
+	struct device *dev = card->dev;
 	const struct snd_soc_acpi_link_adr *adr_link_next;
 	struct snd_soc_dai_link_component *codecs;
 	struct sof_sdw_codec_info *codec_info;
@@ -1563,10 +1563,10 @@ static int sof_card_codec_conf_alloc(struct device *dev,
 	return 0;
 }
 
-static int sof_card_dai_links_create(struct device *dev,
-				     struct snd_soc_acpi_mach *mach,
-				     struct snd_soc_card *card)
+static int sof_card_dai_links_create(struct snd_soc_card *card)
 {
+	struct device *dev = card->dev;
+	struct snd_soc_acpi_mach *mach = dev_get_platdata(card->dev);
 	int ssp_num, sdw_be_num = 0, hdmi_num = 0, dmic_num;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai_link_component *idisp_components;
@@ -1723,7 +1723,7 @@ static int sof_card_dai_links_create(struct device *dev,
 				return codec_index;
 
 			for (j = 0; j < codec_info_list[codec_index].dai_num ; j++) {
-				ret = create_sdw_dailink(card, dev, &link_index, dai_links,
+				ret = create_sdw_dailink(card, &link_index, dai_links,
 							 sdw_be_num, sdw_cpu_dai_num, cpus,
 							 adr_link, &cpu_id, group_generated,
 							 codec_conf, codec_conf_count,
@@ -1991,7 +1991,7 @@ static int mc_probe(struct platform_device *pdev)
 
 	log_quirks(card->dev);
 
-	ret = sof_card_dai_links_create(card->dev, mach, card);
+	ret = sof_card_dai_links_create(card);
 	if (ret < 0)
 		return ret;
 
-- 
2.39.2

