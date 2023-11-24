Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4227F73F0
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Nov 2023 13:40:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BB6C846;
	Fri, 24 Nov 2023 13:40:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BB6C846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700829633;
	bh=7oyvAhqwIw36JhLEwCTsP3TdOY5MW9YSR4T3MJ6kSos=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=icWywnGOrew4v33dD4vsA66eWns23ALOXWWLdwt+2/lvLOLiWHSJYTnRyAl7Lv65F
	 0Sf4uWre3zqfaCD+lX7LupTYtSJOJhXMXMqFI/vjKiuTkEBAG8QMp4ipyotIgo1EIr
	 ARxSyZ8wqCervcf+apfb7ORUu8uN/jEX2gGRapGM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83010F8059F; Fri, 24 Nov 2023 13:40:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03824F8057B;
	Fri, 24 Nov 2023 13:40:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A763F802E8; Fri, 24 Nov 2023 13:40:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DA83F80166
	for <alsa-devel@alsa-project.org>; Fri, 24 Nov 2023 13:39:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DA83F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=V1RGIUhg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700829594; x=1732365594;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7oyvAhqwIw36JhLEwCTsP3TdOY5MW9YSR4T3MJ6kSos=;
  b=V1RGIUhglLRflOK7s2FQG3ZC/7AZHYfaHn7tNuKDD9g49fCiOetB1vHd
   0QReGF1ntBTz8jXNQRVOMGFfcic0k2iB2G4BHyViV5xpPjDMcxpZunbZ9
   azdADkEAMDqnHY6xK6z8/ueGooledI2+g2G167qZb6zMrMV/W5Qo29hdz
   VWp/UEZRQDmT0AL3vyOLFiSZMylffOPjMiUdkN2tIalXSiqUdKGIig3T6
   I8IBt9Af/6qACYwUKiWYAycsEukNUQMi5u3zWKdgNnp+PhXk/2sXs4UOG
   f0MsQtRm/amZQe70FVkwi7hzhVwS5FftgX8A3ZWNx3KSQ/IcEoj1PncEA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="478626437"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600";
   d="scan'208";a="478626437"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:39:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="833686192"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600";
   d="scan'208";a="833686192"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.182])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 04:39:41 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	cezary.rojewski@intel.com,
	ranjani.sridharan@linux.intel.com
Subject: [PATCH] ASoC: Intel: skl_hda_dsp_generic: Drop HDMI routes when HDMI
 is not available
Date: Fri, 24 Nov 2023 14:40:15 +0200
Message-ID: <20231124124015.15878-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: M57WQOVHNN5ZDDCQGUKWLXRLQXCSFKCU
X-Message-ID-Hash: M57WQOVHNN5ZDDCQGUKWLXRLQXCSFKCU
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M57WQOVHNN5ZDDCQGUKWLXRLQXCSFKCU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When the HDMI is not present due to disabled display support
we will use dummy codec and the HDMI routes will refer to non existent
DAPM widgets.

Trim the route list from the HDMI routes to be able to probe the card even
if the HDMI dais are not registered.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/skl_hda_dsp_generic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 6c6ef63cd5d9..6e172719c979 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -154,6 +154,8 @@ static int skl_hda_fill_card_info(struct snd_soc_acpi_mach_params *mach_params)
 		card->dapm_widgets = skl_hda_widgets;
 		card->num_dapm_widgets = ARRAY_SIZE(skl_hda_widgets);
 		if (!ctx->idisp_codec) {
+			card->dapm_routes = &skl_hda_map[IDISP_ROUTE_COUNT];
+			num_route -= IDISP_ROUTE_COUNT;
 			for (i = 0; i < IDISP_DAI_COUNT; i++) {
 				skl_hda_be_dai_links[i].codecs = &snd_soc_dummy_dlc;
 				skl_hda_be_dai_links[i].num_codecs = 1;
-- 
2.42.1

