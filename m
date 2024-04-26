Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FC18B3B4A
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 17:25:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 121D6E65;
	Fri, 26 Apr 2024 17:25:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 121D6E65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714145114;
	bh=RZNfJj9F38dpuilu8NRrmzX3jZ+dUkuFYYD7MAVqxbc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NQLuWGkYVlQqeBZGgGsHobVOSCfqI6mF6/ryWLsJD28iB7/UqY4KNTV9SA1/NRR2K
	 lF4XLLo7IR5w7PsT6k08TpeOWgHGm5MPOmPM2+VxdX2hNztk6Liyi+W8AswOPIVRAy
	 35y0xnqmO/EMY7F5n3b17Dbu2C/AYIE3DZEHG284=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D29FF80718; Fri, 26 Apr 2024 17:22:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6D95F80730;
	Fri, 26 Apr 2024 17:22:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14F1BF8060E; Fri, 26 Apr 2024 17:22:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B4C0F80571
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 17:21:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B4C0F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Vs9Nh7yq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714144912; x=1745680912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RZNfJj9F38dpuilu8NRrmzX3jZ+dUkuFYYD7MAVqxbc=;
  b=Vs9Nh7yqPs5P8AN1n6FVU9iBjSh0KDv+NFomjKyutVVX7smanHE5I6r6
   Q6ecI2H1SQ1RfXH/qDU7yxvTzMQp56yIUfpYHKrfRr0NCDT73zJZJcGF6
   558RHmQyvuefvTy6rKGyLIw21mEzcf46WkqFT1XtnIZPq/caHubWfNfi+
   NvB9AZjm3BjUrKqflgsxWidUHofwE2yzvloewNWc/OjR393wJf76mNu2A
   0rxtyVY65mZDCmk2UOoyq/NUQzhkBE03xxHceie46rYWdDMR2etYSUpek
   IcOlVy9FICUjdtoVkyZ9jhiJzmIGkcROGGhYbvCxGpCrZNXT/i5628iXl
   A==;
X-CSE-ConnectionGUID: OqwZmJBsTSq5u7Bz3q8cRw==
X-CSE-MsgGUID: UOkaT78nT3i642o+dthyzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="21290647"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="21290647"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:21:46 -0700
X-CSE-ConnectionGUID: 06E7xQTIQ5iaw7c1jIzf3A==
X-CSE-MsgGUID: ObVN4uEdSZmAcHeOR4472w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="30259037"
Received: from atarkhan-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.33.33])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 08:21:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 11/12] ASoC: Intel: sof_sdw: Add callbacks to register sidecar
 devices
Date: Fri, 26 Apr 2024 10:21:22 -0500
Message-Id: <20240426152123.36284-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
References: <20240426152123.36284-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: E5HIIUSPMWKNG2BK4Y7EZVG7CDCEAK4P
X-Message-ID-Hash: E5HIIUSPMWKNG2BK4Y7EZVG7CDCEAK4P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E5HIIUSPMWKNG2BK4Y7EZVG7CDCEAK4P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Add support for systems that have additional non-SoundWire devices
(sidecars) connected to one of the SoundWire devices in the
system. This is done through the addition of two callbacks, one used
at endpoint parsing time that will return the number of devices and
DAI links to be added, and another called later as the DAI links are
created that will populate those devices into the appropriate arrays.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 22 ++++++++++++++++++++--
 sound/soc/intel/boards/sof_sdw_common.h |  6 ++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index bf5f46a4c4aa..eaa79e29f5c2 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1280,6 +1280,7 @@ struct sof_sdw_endpoint {
 	u32 link_mask;
 	const char *codec_name;
 	const char *name_prefix;
+	bool include_sidecar;
 
 	struct sof_sdw_codec_info *codec_info;
 	const struct sof_sdw_dai_info *dai_info;
@@ -1335,7 +1336,8 @@ static struct sof_sdw_dailink *find_dailink(struct sof_sdw_dailink *dailinks,
 
 static int parse_sdw_endpoints(struct snd_soc_card *card,
 			       struct sof_sdw_dailink *sof_dais,
-			       struct sof_sdw_endpoint *sof_ends)
+			       struct sof_sdw_endpoint *sof_ends,
+			       int *num_devs)
 {
 	struct device *dev = card->dev;
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
@@ -1345,6 +1347,7 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 	struct sof_sdw_endpoint *sof_end = sof_ends;
 	int num_dais = 0;
 	int i, j;
+	int ret;
 
 	for (adr_link = mach_params->links; adr_link->num_adr; adr_link++) {
 		int num_link_dailinks = 0;
@@ -1381,6 +1384,14 @@ static int parse_sdw_endpoints(struct snd_soc_card *card,
 
 			sof_end->name_prefix = adr_dev->name_prefix;
 
+			if (codec_info->count_sidecar && codec_info->add_sidecar) {
+				ret = codec_info->count_sidecar(card, &num_dais, num_devs);
+				if (ret)
+					return ret;
+
+				sof_end->include_sidecar = true;
+			}
+
 			for (j = 0; j < adr_dev->num_endpoints; j++) {
 				const struct snd_soc_acpi_endpoint *adr_end;
 				const struct sof_sdw_dai_info *dai_info;
@@ -1453,6 +1464,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct sof_sdw_endpoint *sof_end;
 	int stream;
+	int ret;
 
 	list_for_each_entry(sof_end, &sof_dai->endpoints, list) {
 		if (sof_end->name_prefix) {
@@ -1460,6 +1472,12 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			(*codec_conf)->name_prefix = sof_end->name_prefix;
 			(*codec_conf)++;
 		}
+
+		if (sof_end->include_sidecar) {
+			ret = sof_end->codec_info->add_sidecar(card, dai_links, codec_conf);
+			if (ret)
+				return ret;
+		}
 	}
 
 	for_each_pcm_streams(stream) {
@@ -1757,7 +1775,7 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 		goto err_dai;
 	}
 
-	ret = parse_sdw_endpoints(card, sof_dais, sof_ends);
+	ret = parse_sdw_endpoints(card, sof_dais, sof_ends, &num_devs);
 	if (ret < 0)
 		goto err_end;
 
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 853278c6e525..9dd42a8da8d7 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -98,6 +98,12 @@ struct sof_sdw_codec_info {
 	const int dai_num;
 
 	int (*codec_card_late_probe)(struct snd_soc_card *card);
+
+	int  (*count_sidecar)(struct snd_soc_card *card,
+			      int *num_dais, int *num_devs);
+	int  (*add_sidecar)(struct snd_soc_card *card,
+			    struct snd_soc_dai_link **dai_links,
+			    struct snd_soc_codec_conf **codec_conf);
 };
 
 struct mc_private {
-- 
2.40.1

