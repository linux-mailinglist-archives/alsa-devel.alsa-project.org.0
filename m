Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A46DF700DFC
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 19:37:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DD17E89;
	Fri, 12 May 2023 19:36:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DD17E89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683913020;
	bh=D9LzXxOEAUEZXPhVCxA0Ytz38Vpa/ppYD+LIQatKgKo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sr860gGlBDuJL+wZ1ZW+/wTRJNC6OZFHBhWuGkEdHg9SlTRLXu/CaHm+wH3+x6SoV
	 X3wui/zZWjjuT+7dQ5BuhKZaMSCxhWxbB415kBOpVjMDBism/z6OJKxj+rB/+juXw8
	 KgeDjU7rpVKERGXf9i88kKwTt321QW9EU0alHoWo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F371F805D4; Fri, 12 May 2023 19:34:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F1E6F805C9;
	Fri, 12 May 2023 19:34:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DACD6F805C2; Fri, 12 May 2023 19:34:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2060FF80534
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 19:33:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2060FF80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BMxhlUpu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683912827; x=1715448827;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D9LzXxOEAUEZXPhVCxA0Ytz38Vpa/ppYD+LIQatKgKo=;
  b=BMxhlUpuaEmPyeVw60MmLGcYKiIvIaEzoF91leb/NIFrZr8/TFg80OZG
   IwOlcZKTSJhIrtmRG2LlJPSGlRlN9GBgF/x6v7ajBRq9/wqDM31GLq6qG
   Mzbh3Z8wct+d+POB7xwWzFpV+5+N7GZdEZVXWNTI2v48POtDkEAW/bc+g
   iPOxkxDQVCenwkrnAJI+fCHH9nWsKnDllrQx39k0aMiSdrH985FTjizp1
   +9J0a0EOygeRlmXe74aRtBxETC7icUIGZkuyY6ORYkUttRtTinWWJ2+Ai
   kNE5WF3sxECtVe6/wvD3p/bkVEv6IkJ3iE1Q648p4YGM8v4uIE5OvWT43
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="340164727"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="340164727"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 10:33:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="1030160311"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200";
   d="scan'208";a="1030160311"
Received: from winkelru-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.144.249])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2023 10:33:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 5/8] ASoC: Intel: sof_sdw: start set codec init function with
 an adr index
Date: Fri, 12 May 2023 12:33:02 -0500
Message-Id: <20230512173305.65399-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512173305.65399-1-pierre-louis.bossart@linux.intel.com>
References: <20230512173305.65399-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6WRYI2UBCSYM2O3QWIE5P2UDFJYPRBGW
X-Message-ID-Hash: 6WRYI2UBCSYM2O3QWIE5P2UDFJYPRBGW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6WRYI2UBCSYM2O3QWIE5P2UDFJYPRBGW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Currently, set_codec_init_func always start with link->adr_d[0] because
we assumed all adr_d on the same link are the same devices. The
assumption is no longer valid when different devices on the same sdw link
are supported.

Fixes: c8db7b50128b ("ASoC: Intel: sof_sdw: support different devices on the same sdw link")
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 0841e28d1256..e97cc769a11c 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -910,17 +910,20 @@ static int create_codec_dai_name(struct device *dev,
 static int set_codec_init_func(struct snd_soc_card *card,
 			       const struct snd_soc_acpi_link_adr *link,
 			       struct snd_soc_dai_link *dai_links,
-			       bool playback, int group_id)
+			       bool playback, int group_id, int adr_index)
 {
-	int i;
+	int i = adr_index;
 
 	do {
 		/*
 		 * Initialize the codec. If codec is part of an aggregated
 		 * group (group_id>0), initialize all codecs belonging to
 		 * same group.
+		 * The first link should start with link->adr_d[adr_index]
+		 * because that is the device that we want to initialize and
+		 * we should end immediately if it is not aggregated (group_id=0)
 		 */
-		for (i = 0; i < link->num_adr; i++) {
+		for ( ; i < link->num_adr; i++) {
 			int codec_index;
 
 			codec_index = find_codec_info_part(link->adr_d[i].adr);
@@ -936,9 +939,12 @@ static int set_codec_init_func(struct snd_soc_card *card,
 						dai_links,
 						&codec_info_list[codec_index],
 						playback);
+			if (!group_id)
+				return 0;
 		}
+		i = 0;
 		link++;
-	} while (link->mask && group_id);
+	} while (link->mask);
 
 	return 0;
 }
@@ -1188,7 +1194,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		dai_links[*link_index].nonatomic = true;
 
 		ret = set_codec_init_func(card, link, dai_links + (*link_index)++,
-					  playback, group_id);
+					  playback, group_id, adr_index);
 		if (ret < 0) {
 			dev_err(dev, "failed to init codec %d", codec_index);
 			return ret;
-- 
2.37.2

