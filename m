Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC2276A338
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:46:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C3D2850;
	Mon, 31 Jul 2023 23:45:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C3D2850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690840008;
	bh=fWMbDhYR/IvhITeoJNg9l6cw/koUVxG6y+RPsc2UKiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bnkYpW7mj+mZvYx+phSQ9r18mA5YM2fjjowMFSvOQaDwPEA8c9AfUUN1f9qEjsk1L
	 QbEcZwGjujND8A3CT790ez7mmYMkkgu2QOfP02KUfIjusnVGnbgZB+cAldoomtlf0t
	 9vhRhN3fOyVJl54UfzJDY7WnQu1qNQP5U8zrwnlY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AA42F805E0; Mon, 31 Jul 2023 23:43:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D544AF805D6;
	Mon, 31 Jul 2023 23:43:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C310F805B1; Mon, 31 Jul 2023 23:43:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1BE04F80557
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:43:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BE04F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ae6HLj67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839799; x=1722375799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fWMbDhYR/IvhITeoJNg9l6cw/koUVxG6y+RPsc2UKiM=;
  b=ae6HLj67yoQWhB/PilNjklA+GuFb6K9/auP45v6Fv/0Lzd93ejuTHmoo
   h2y5uzPHXhYDFqGQ76OJKPfjh00mJYRv1RLstd16+yKL1AT9dhWplsKIK
   Obo8jy9RnI4ynt5QUzsTvAzZ82g83JhJ5VwyFlubuWzObC0+BaG6Zhk3T
   5VVwsWyTuaTXJY8Uwx8ajTVHK2LemT5H7MAkH7FMfubj8GEgTrWxrIvQ/
   1oIK7G6dAsUMlKRkX6fSzU/yhw1If3aFjFI86cNV/l/CoRgCgoMvL3Rjc
   X6qjTeKzCR69rHJatx0XBPz52GQk3Vzv8t+cwCkaMTStHSVfH06si7F4o
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435449766"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="435449766"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763523542"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="763523542"
Received: from youngnic-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.180.66])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 10/23] ASoC: intel: sof_sdw: Rename codec_idx to
 codec_dlc_index
Date: Mon, 31 Jul 2023 16:42:44 -0500
Message-Id: <20230731214257.444605-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
References: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3YQA7L5WVU3VEE6XWUOTHUNDSSDSCJMS
X-Message-ID-Hash: 3YQA7L5WVU3VEE6XWUOTHUNDSSDSCJMS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3YQA7L5WVU3VEE6XWUOTHUNDSSDSCJMS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Having two local variables called codec_idx and codec_index, that refer
to different things is a little confusing. Rename codec_idx to
codec_dlc_index to indicate it points into the dai_link_component array.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 6f65f45bded6..0743bf04aa88 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1378,7 +1378,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 	int cpu_dai_id[SDW_MAX_CPU_DAIS];
 	int cpu_dai_num, cpu_dai_index;
 	unsigned int group_id;
-	int codec_idx = 0;
+	int codec_dlc_index = 0;
 	int codec_index;
 	int codec_num;
 	int stream;
@@ -1409,7 +1409,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 		if (cpu_dai_id[i] != ffs(adr_link_next->mask) - 1)
 			continue;
 
-		ret = create_codec_dai_name(dev, adr_link_next, codecs, codec_idx,
+		ret = create_codec_dai_name(dev, adr_link_next, codecs, codec_dlc_index,
 					    codec_conf, codec_count, codec_conf_index,
 					    adr_index, dai_index);
 		if (ret < 0)
@@ -1417,7 +1417,7 @@ static int create_sdw_dailink(struct snd_soc_card *card,
 
 		/* check next link to create codec dai in the processed group */
 		i++;
-		codec_idx += adr_link_next->num_adr;
+		codec_dlc_index += adr_link_next->num_adr;
 	}
 
 	/* find codec info to create BE DAI */
-- 
2.39.2

