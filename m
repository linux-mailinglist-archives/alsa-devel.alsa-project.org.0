Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8593676A347
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 23:48:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBBCEDF6;
	Mon, 31 Jul 2023 23:47:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBBCEDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690840102;
	bh=RI33WpAAA+EOpdqoqvrmLpLVwloHUcbzIZbRm1IPer4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lbZglNl4gZb4DK/2vNdjfmk3JnR2Mu2GCpkOn9tlIUMXkCAxI41sworKIhSoZYgjl
	 ClTRPMrQ3BzqHK7z8+a52cT1TLHrIvGCLJxPTys+d0Y6VcuZCJbcbfaQRxs7B155Bu
	 zXwEgmAnbdcP7KW5XnJb7Q5Abp/F9h5LqX36cJd0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B50CF80618; Mon, 31 Jul 2023 23:44:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D337F80615;
	Mon, 31 Jul 2023 23:44:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81B3EF805B5; Mon, 31 Jul 2023 23:43:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,RDNS_NONE,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A57B6F805A1
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 23:43:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A57B6F805A1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Wd+xg/h3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690839803; x=1722375803;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RI33WpAAA+EOpdqoqvrmLpLVwloHUcbzIZbRm1IPer4=;
  b=Wd+xg/h3Y6YY9FXks2e8p/CwxyiV4hj0tsmgXq6Lach8O8smBQ+igDwY
   JqGK0yX/x5waiVG4LLDOT+OGhaoZk8NCsw9dUUSMLocfhqNSusQG0/nGL
   rFPu9rY0kw9JmTWOz3fye62lxOK2TWKTg+W2GSfXSoJctg25Km1O3ebAj
   G85bbi/xA9qtuSUwCd4sojjhqeIey6yO0dp5ExZo7EfljyPgFPzmTcETw
   8GSJLb0X9sKl5Zs0U1Ojctv9m+tjU2r/guKkBqtdd1MoYHd/aiq9hcLsH
   eQ1HQLX+Rvn4RB0rynXsWUpVU7OqsxipUnbF/itn+o7MDY7jw+2R6k0NU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="435449798"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="435449798"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2023 14:43:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763523564"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200";
   d="scan'208";a="763523564"
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
Subject: [PATCH 17/23] ASoC: intel: sof_sdw: Move amp_num initialisation to
 mc_probe
Date: Mon, 31 Jul 2023 16:42:51 -0500
Message-Id: <20230731214257.444605-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
References: <20230731214257.444605-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Z2ICJK46T4GA46YYCFPHVPSB4TFTLK2H
X-Message-ID-Hash: Z2ICJK46T4GA46YYCFPHVPSB4TFTLK2H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z2ICJK46T4GA46YYCFPHVPSB4TFTLK2H/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

The amp_num member of the info struct is zeroed at the start of
sof_card_dai_links_create, but then summed in mc_probe after
sof_card_dai_links_create is called. It is a little clearer to hoist the
initialisation out of sof_card_dai_links_create so it is on the same
level as the summation.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index dc5337ea75da..1a60965439dd 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1599,10 +1599,6 @@ static int sof_card_dai_links_create(struct snd_soc_card *card)
 	if (ret < 0)
 		return ret;
 
-	/* reset amp_num to ensure amp_num++ starts from 0 in each probe */
-	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
-		codec_info_list[i].amp_num = 0;
-
 	if (mach_params->codec_mask & IDISP_CODEC_MASK) {
 		ctx->idisp_codec = true;
 
@@ -1991,6 +1987,10 @@ static int mc_probe(struct platform_device *pdev)
 
 	log_quirks(card->dev);
 
+	/* reset amp_num to ensure amp_num++ starts from 0 in each probe */
+	for (i = 0; i < ARRAY_SIZE(codec_info_list); i++)
+		codec_info_list[i].amp_num = 0;
+
 	ret = sof_card_dai_links_create(card);
 	if (ret < 0)
 		return ret;
-- 
2.39.2

