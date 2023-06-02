Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFCA720A39
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:25:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A782E207;
	Fri,  2 Jun 2023 22:24:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A782E207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737548;
	bh=7SpuRL88Ge5Wmw5fQKOQcK4WDEuoB2ng3nJoxOzyRoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MexJB/ynrz9mITvdWsxjPBWWj5Lc+XDGehWQ5nPD2CqRjByLgWjAGiSBvao2Xwpgo
	 RrV5kOQNkIQoo24v2MeAQVBH3nT8mdhgUia14k+QUQK4HQWpHNkmz7xKtJja0dyU58
	 hIe7RHpvAl3UdIog+kxgPyHeQe5Qid8iO1hypISs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DC22F805C6; Fri,  2 Jun 2023 22:23:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F5E8F805C2;
	Fri,  2 Jun 2023 22:23:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85A55F805BA; Fri,  2 Jun 2023 22:23:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0599DF8047D
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0599DF8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KGPO0bNq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737388; x=1717273388;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7SpuRL88Ge5Wmw5fQKOQcK4WDEuoB2ng3nJoxOzyRoI=;
  b=KGPO0bNqjOPy9eJDa1HpO4x36CQAEt4K/T/pcXRc1MSWPJotVI76Hsq/
   ae3sTrV+Kwc/oViiESxq1kciLOvwgxEyy6Ng1lfhRz3p3STcDyqGNTxoS
   K0w7mMJMoy6AJ92xmzZiq+75gi+H+XYGJUuyS2oZeBS8DcCSSLD5qBoG9
   /ETq1TvuuqktdYawGDF7jy3o2oy5RNc4m1iym9ar5D0DT9PjwkdOu/Ex9
   XFeYcZdi+K2LBRxCuUMrTFZiDzCPmH5cpoo3Cm4/dqamdsbe0hB6bKNV5
   /99Euj34EULvyWyiozY2DHgzrKE+9ZiJZgTaBPVw/OQ0E5KfKZTEsZD9+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811209"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811209"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020009"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020009"
Received: from clatorre-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:45 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 04/28] ASoC: Intel: sof_sdw: add codec_info pointer
Date: Fri,  2 Jun 2023 15:22:01 -0500
Message-Id: <20230602202225.249209-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OXJAGAZXWUWSF4R7AK44R3V6OTHNYASI
X-Message-ID-Hash: OXJAGAZXWUWSF4R7AK44R3V6OTHNYASI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OXJAGAZXWUWSF4R7AK44R3V6OTHNYASI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

codec_info_list[codec_index] is used multiple times in the
create_sdw_dailink() function. Adding a codec_info pointer to shorten
the code. This is a preparation for the following up patches.
No function changed.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 1df489c7e2bd..b197c2920e80 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -872,6 +872,7 @@ static int get_sdw_dailink_info(struct device *dev, const struct snd_soc_acpi_li
 
 	for (link = links; link->num_adr; link++) {
 		const struct snd_soc_acpi_endpoint *endpoint;
+		struct sof_sdw_codec_info *codec_info;
 		int codec_index;
 		int stream;
 		u64 adr;
@@ -881,12 +882,13 @@ static int get_sdw_dailink_info(struct device *dev, const struct snd_soc_acpi_li
 			codec_index = find_codec_info_part(adr);
 			if (codec_index < 0)
 				return codec_index;
+			codec_info = &codec_info_list[codec_index];
 
 			endpoint = link->adr_d[i].endpoints;
 
 			/* count DAI number for playback and capture */
 			for_each_pcm_streams(stream) {
-				if (!codec_info_list[codec_index].dais[0].direction[stream])
+				if (!codec_info->dais[0].direction[stream])
 					continue;
 
 				(*sdw_cpu_dai_num)++;
@@ -1184,6 +1186,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 {
 	const struct snd_soc_acpi_link_adr *link_next;
 	struct snd_soc_dai_link_component *codecs;
+	struct sof_sdw_codec_info *codec_info;
 	int cpu_dai_id[SDW_MAX_CPU_DAIS];
 	int cpu_dai_num, cpu_dai_index;
 	unsigned int group_id;
@@ -1232,8 +1235,9 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 	codec_index = find_codec_info_part(link->adr_d[adr_index].adr);
 	if (codec_index < 0)
 		return codec_index;
+	codec_info = &codec_info_list[codec_index];
 
-	if (codec_info_list[codec_index].ignore_pch_dmic)
+	if (codec_info->ignore_pch_dmic)
 		*ignore_pch_dmic = true;
 
 	cpu_dai_index = *cpu_id;
@@ -1247,10 +1251,10 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			"SDW%d-Capture-%s",
 		};
 
-		if (!codec_info_list[codec_index].dais[0].direction[stream])
+		if (!codec_info->dais[0].direction[stream])
 			continue;
 
-		*link_id = codec_info_list[codec_index].dais[0].dailink[stream];
+		*link_id = codec_info->dais[0].dailink[stream];
 		if (*link_id < 0) {
 			dev_err(dev, "Invalid dailink id %d\n", *link_id);
 			return -EINVAL;
@@ -1260,7 +1264,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		if (append_codec_type) {
 			name = devm_kasprintf(dev, GFP_KERNEL,
 					      sdw_stream_name[stream + 2], cpu_dai_id[0],
-					      type_strings[codec_info_list[codec_index].codec_type]);
+					      type_strings[codec_info->codec_type]);
 		} else {
 			name = devm_kasprintf(dev, GFP_KERNEL,
 					      sdw_stream_name[stream], cpu_dai_id[0]);
-- 
2.37.2

