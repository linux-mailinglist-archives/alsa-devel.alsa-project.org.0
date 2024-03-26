Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D5888C888
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 17:06:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 101A02BCB;
	Tue, 26 Mar 2024 17:06:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 101A02BCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711469198;
	bh=IGaUX8YJZXWAmr7zoW4xLN1MTZeKcfPI99f/516aWdw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NC2YLalfMuFH9BaAFJwYvtCm+3k7UPN0Dl3YKCgkCUs/kvIKugbMBP/+q8FGmS9xM
	 1u/OWNHeHPfeXszoDeoD4mSBWyvAYq0H+CnoBL8bQB1HFNyA5+OzaQTeYkpxkMQRdB
	 MRyyNu7bX7N+GA4bUMumoVqCsjAH+hidRRzgkUgY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8ED9F805DA; Tue, 26 Mar 2024 17:06:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E17DF805E8;
	Tue, 26 Mar 2024 17:05:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D64B2F8057C; Tue, 26 Mar 2024 17:05:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78D70F8025F
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 17:05:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78D70F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OgR1r+J9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711469129; x=1743005129;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IGaUX8YJZXWAmr7zoW4xLN1MTZeKcfPI99f/516aWdw=;
  b=OgR1r+J9QE9PNw5bvj0HQOYcvXFwunOugl0ZdF3FxrHlKmye7rqsPILa
   XqLZwAIZFkiap6xIrX0rWU0M34oojV0x4blQMk3ciJIOGpJKt0MicIKRL
   izggO9mkjwPYgJoMdOse0LfBI1O3ll3deY1D7lZXqKCyAWU5F1S2DNnQ1
   iEwARhCVPshuvYMvb39fpzRAHVBl0ZRe3JbBB7rIpsY1k2amE65zwEq4K
   BWaizMR86XOXCiHfgBLRyx1C90qrvt+BsjyR/yZt72Q4wj79ETjgWInj8
   gwbsuiaApX+biUvQh45S8+YMR6mGPaE6u4gs559rpS2AQc7PHJ9hEY06i
   g==;
X-CSE-ConnectionGUID: VCPJp1s+TN2WN/tTjNCeHg==
X-CSE-MsgGUID: YX79vZK6ROOOr35OYvuVzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17260350"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="17260350"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000";
   d="scan'208";a="20482146"
Received: from bhubbert-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.65.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 09:04:44 -0700
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
Subject: [PATCH 04/34] ASoC: intel: sof_sdw: Only pass codec_conf pointer
 around
Date: Tue, 26 Mar 2024 11:03:59 -0500
Message-Id: <20240326160429.13560-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
References: <20240326160429.13560-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RPEKNFEQ24RNFX43JRYNNLDWTYSCKZMK
X-Message-ID-Hash: RPEKNFEQ24RNFX43JRYNNLDWTYSCKZMK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RPEKNFEQ24RNFX43JRYNNLDWTYSCKZMK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Rather than passing around a pointer to the codec_conf array, an index
into it and a size, simply pass around a pointer to the current codec_conf.
This reduces the amount of state moving around.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 4bd9f62c48fc..7b61d45df5da 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1457,10 +1457,8 @@ static const char * const type_strings[] = {"SimpleJack", "SmartAmp", "SmartMic"
 static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 			      struct snd_soc_dai_link *dai_links, int sdw_be_num,
 			      const struct snd_soc_acpi_link_adr *adr_link,
-			      struct snd_soc_codec_conf *codec_conf,
-			      int codec_count, int *be_id,
-			      int *codec_conf_index,
-			      bool *ignore_pch_dmic,
+			      struct snd_soc_codec_conf **codec_conf,
+			      int *be_id, bool *ignore_pch_dmic,
 			      bool append_dai_type,
 			      int adr_index,
 			      int dai_index)
@@ -1509,7 +1507,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 				continue;
 
 			/* sanity check */
-			if (*codec_conf_index >= codec_count) {
+			if (*codec_conf >= card->codec_conf + card->num_configs) {
 				dev_err(dev, "codec_conf array overflowed\n");
 				return -EINVAL;
 			}
@@ -1520,12 +1518,11 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 			if (ret)
 				return ret;
 
-			codec_conf[*codec_conf_index].dlc = codecs[codec_dlc_index];
-			codec_conf[*codec_conf_index].name_prefix =
-					adr_link_next->adr_d[j].name_prefix;
+			(*codec_conf)->dlc = codecs[codec_dlc_index];
+			(*codec_conf)->name_prefix = adr_link_next->adr_d[j].name_prefix;
 
 			codec_dlc_index++;
-			(*codec_conf_index)++;
+			(*codec_conf)++;
 		}
 		j = 0;
 
@@ -1646,7 +1643,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	bool append_dai_type = false;
 	bool ignore_pch_dmic = false;
 	int codec_conf_num = 0;
-	int codec_conf_index = 0;
 	bool group_generated[SDW_MAX_GROUPS] = { };
 	struct snd_soc_dai_link *dai_links;
 	int num_links, link_index = 0;
@@ -1706,6 +1702,9 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	if (!codec_conf)
 		return -ENOMEM;
 
+	card->codec_conf = codec_conf;
+	card->num_configs = codec_conf_num;
+
 	/* SDW */
 	if (!sdw_be_num)
 		goto SSP;
@@ -1764,9 +1763,9 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 
 				ret = create_sdw_dailink(card, &link_index, dai_links,
 							 sdw_be_num, adr_link,
-							 codec_conf, codec_conf_num,
-							 &current_be_id, &codec_conf_index,
-							 &ignore_pch_dmic, append_dai_type, i, j);
+							 &codec_conf, &current_be_id,
+							 &ignore_pch_dmic,
+							 append_dai_type, i, j);
 				if (ret < 0) {
 					dev_err(dev, "failed to create dai link %d\n", link_index);
 					return ret;
@@ -1886,9 +1885,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	card->dai_link = dai_links;
 	card->num_links = num_links;
 
-	card->codec_conf = codec_conf;
-	card->num_configs = codec_conf_num;
-
 	return 0;
 }
 
-- 
2.40.1

