Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8800A6E823A
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 21:58:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0807AEEC;
	Wed, 19 Apr 2023 21:57:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0807AEEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681934318;
	bh=/xTThc/vUluIgdI5z4zcpDFgrnb2lg3xpHlYJR436y8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PaEZZyso/ERIleUMBP7Yye8xrValpHVGvFr/ZhfnuxAfXM3bPn9hsTX6ZDfvdhUx2
	 DeNyGcK/GObS5ywbT7dq/oAGaKenzC2y799krph0Mi3lcICl9mgGmAH1UVAuVG4Jau
	 8oMw3rEwckM5gqsjBrRovMQpZwGQ6BS6XgNi1ADo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90874F80551;
	Wed, 19 Apr 2023 21:56:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DDEBF8053B; Wed, 19 Apr 2023 21:56:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C808AF80149
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 21:56:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C808AF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=I7N3EUBY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681934169; x=1713470169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/xTThc/vUluIgdI5z4zcpDFgrnb2lg3xpHlYJR436y8=;
  b=I7N3EUBYAo5n0/twnschnVP8OuadFY1qxqTHbu6uB4YW+TGDVjAdajh3
   hdIFGRcwEFOLDs8mHaSnKLoYnoTXyD47YVx3S83DJTXgMu5Ptx6S+iWFP
   9vDn7uuL90LZFh+2gmRjFbDcLfzALC/bunllU7Ge85tDlReonBVt5J+MT
   gCytovGti+LXan7KIcGtTozUqG/J7/rQp9djlIWXKRhiA3Y5MZjUJlMcn
   B8e38VgMg6tfWDACbh3o2Zyts5cHtfJGFSXedPBkGMrj8VEZwyMTehFYh
   8RnVi1CQNVHXWvXo7wVd7/aBf22/+exnfA8U7rk41TBD7xmFtvk1cm74R
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="373434406"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200";
   d="scan'208";a="373434406"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:56:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="815728114"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200";
   d="scan'208";a="815728114"
Received: from gargicha-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.74.38])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:56:03 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 7/7] ASoC: Intel: sof_sdw: append codec type to dai link name
Date: Wed, 19 Apr 2023 14:55:24 -0500
Message-Id: <20230419195524.46995-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230419195524.46995-1-pierre-louis.bossart@linux.intel.com>
References: <20230419195524.46995-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KQNHMVY6ZLIDPGTP34MEUN4PDODTIZIX
X-Message-ID-Hash: KQNHMVY6ZLIDPGTP34MEUN4PDODTIZIX
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KQNHMVY6ZLIDPGTP34MEUN4PDODTIZIX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The existing sdw_sof machine driver constructs two SoundWire interfaces
by direction and sdw link id. It means that we will have exactly the
same dai link name if two dai links are on the same sdw link with the
same direction.
The new Realtek codec has two SoundWire interfaces for jack and DMIC
functions and they are treated as different codecs. To create two dai
links for jack and DMIC, we need to have different dai link names.
This patch suggests to append codec type if there are two or more
different types of devices on the same sdw bus.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 41 ++++++++++++++++++++++++++++----
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 6a6c81df72bd..6faf4a43eaf5 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1022,6 +1022,8 @@ static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 	return 0;
 }
 
+static const char * const type_strings[] = {"SimpleJack", "SmartAmp", "SmartMic"};
+
 static int create_sdw_dailink(struct snd_soc_card *card,
 			      struct device *dev, int *link_index,
 			      struct snd_soc_dai_link *dai_links,
@@ -1033,6 +1035,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 			      int codec_count, int *link_id,
 			      int *codec_conf_index,
 			      bool *ignore_pch_dmic,
+			      bool append_codec_type,
 			      int adr_index)
 {
 	const struct snd_soc_acpi_link_adr *link_next;
@@ -1109,14 +1112,22 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		static const char * const sdw_stream_name[] = {
 			"SDW%d-Playback",
 			"SDW%d-Capture",
+			"SDW%d-Playback-%s",
+			"SDW%d-Capture-%s",
 		};
 
 		if (!codec_info_list[codec_index].direction[stream])
 			continue;
 
 		/* create stream name according to first link id */
-		name = devm_kasprintf(dev, GFP_KERNEL,
-				      sdw_stream_name[stream], cpu_dai_id[0]);
+		if (append_codec_type) {
+			name = devm_kasprintf(dev, GFP_KERNEL,
+					      sdw_stream_name[stream + 2], cpu_dai_id[0],
+					      type_strings[codec_info_list[codec_index].codec_type]);
+		} else {
+			name = devm_kasprintf(dev, GFP_KERNEL,
+					      sdw_stream_name[stream], cpu_dai_id[0]);
+		}
 		if (!name)
 			return -ENOMEM;
 
@@ -1232,6 +1243,7 @@ static int sof_card_dai_links_create(struct device *dev,
 	const struct snd_soc_acpi_link_adr *adr_link;
 	struct snd_soc_dai_link_component *cpus;
 	struct snd_soc_codec_conf *codec_conf;
+	bool append_codec_type = false;
 	bool ignore_pch_dmic = false;
 	int codec_conf_count;
 	int codec_conf_index = 0;
@@ -1323,8 +1335,29 @@ static int sof_card_dai_links_create(struct device *dev,
 	for (i = 0; i < SDW_MAX_GROUPS; i++)
 		group_generated[i] = false;
 
-	/* generate DAI links by each sdw link */
 	for (; adr_link->num_adr; adr_link++) {
+		/*
+		 * If there are two or more different devices on the same sdw link, we have to
+		 * append the codec type to the dai link name to prevent duplicated dai link name.
+		 * The same type devices on the same sdw link will be in the same
+		 * snd_soc_acpi_adr_device array. They won't be described in different adr_links.
+		 */
+		for (i = 0; i < adr_link->num_adr; i++) {
+			for (j = 0; j < i; j++) {
+				if ((SDW_PART_ID(adr_link->adr_d[i].adr) !=
+				    SDW_PART_ID(adr_link->adr_d[j].adr)) ||
+				    (SDW_MFG_ID(adr_link->adr_d[i].adr) !=
+				    SDW_MFG_ID(adr_link->adr_d[i].adr))) {
+					append_codec_type = true;
+					goto out;
+				}
+			}
+		}
+	}
+out:
+
+	/* generate DAI links by each sdw link */
+	for (adr_link = mach_params->links ; adr_link->num_adr; adr_link++) {
 		for (i = 0; i < adr_link->num_adr; i++) {
 			const struct snd_soc_acpi_endpoint *endpoint;
 
@@ -1345,7 +1378,7 @@ static int sof_card_dai_links_create(struct device *dev,
 						 &cpu_id, group_generated,
 						 codec_conf, codec_conf_count,
 						 &be_id, &codec_conf_index,
-						 &ignore_pch_dmic, i);
+						 &ignore_pch_dmic, append_codec_type, i);
 			if (ret < 0) {
 				dev_err(dev, "failed to create dai link %d", link_index);
 				return ret;
-- 
2.37.2

