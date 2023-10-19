Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 405437D00BC
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 19:36:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47A97BC0;
	Thu, 19 Oct 2023 19:35:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47A97BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697737002;
	bh=Tpm6N/d1hqJVxfisZQBWkrO50s2tQycOz/u1p5ISh7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NTJMAm8eAURZdr7dbv6/h3SUH2qJjQr9L27VcHyaiLHodK4mgdSc4u+TFPES5eCkT
	 4l2EbrpSGzYEJECyYZF2l/BDOAF4ugpIA3U6MLsQtpPvLg7aRNj0QQDVxJIVE2e9iP
	 jaG0durnYM2fflP/kEn1oYY4mX+LXOg75mWAG8Hg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1710AF805A8; Thu, 19 Oct 2023 19:34:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72557F8058C;
	Thu, 19 Oct 2023 19:34:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2ECBF80571; Thu, 19 Oct 2023 19:34:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1FFDF8025F
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 19:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1FFDF8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ijO1dwxQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697736871; x=1729272871;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tpm6N/d1hqJVxfisZQBWkrO50s2tQycOz/u1p5ISh7w=;
  b=ijO1dwxQT3ugxpjRSiya6jIqQIxjnDjtxomjHhIWLc4c4zpFO59FALFz
   2+IPn2AEBRN0i5+a1qTuFs6MQPCc9mdlImQcA1Y87DUrmbPCzONAWBnL4
   NlezWR1x1M1bPfZBDYLAPmgTUPVbXRxLJ8Dl4ZY7XCCu55aTCTfeA7paT
   jBHIF7zat+hePD8/4MGPhkRGN4MEEFXuOIgz/EL/gJPpeN77gXy3n3hxz
   nQkc3/56bsx0CjuxBfc58xh1grJOFo0cMwBDW6nYxjfx80uteR1Aw+4w4
   4k7jo1WNjRWLLipsT+11zPVqrlrSyalmAwy7WWk9A08O51M1+H43/Xnua
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="7884313"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="7884313"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:34:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="792090619"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="792090619"
Received: from jihao1-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.213.163.144])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 10:34:23 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 02/10] ASoC: intel: sof_sdw_cs42l43: Some trivial formatting
 clean ups
Date: Thu, 19 Oct 2023 12:34:03 -0500
Message-Id: <20231019173411.166759-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231019173411.166759-1-pierre-louis.bossart@linux.intel.com>
References: <20231019173411.166759-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NKKHJLXY46FGFEIUXB77QFDS3HPLD6LI
X-Message-ID-Hash: NKKHJLXY46FGFEIUXB77QFDS3HPLD6LI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NKKHJLXY46FGFEIUXB77QFDS3HPLD6LI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

No functional change, just some trivial whitespace fixups.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_cs42l43.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_cs42l43.c b/sound/soc/intel/boards/sof_sdw_cs42l43.c
index dc3062cc3a43..9b072c745f10 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l43.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l43.c
@@ -47,7 +47,8 @@ static int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_card *card = rtd->card;
 	int ret;
 
-	card->components = devm_kasprintf(card->dev, GFP_KERNEL, "%s hs:cs42l43", card->components);
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL, "%s hs:cs42l43",
+					  card->components);
 	if (!card->components)
 		return -ENOMEM;
 
@@ -60,7 +61,6 @@ static int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd)
 
 	ret = snd_soc_dapm_add_routes(&card->dapm, cs42l43_hs_map,
 				      ARRAY_SIZE(cs42l43_hs_map));
-
 	if (ret) {
 		dev_err(card->dev, "cs42l43 hs map addition failed: %d\n", ret);
 		return ret;
@@ -104,7 +104,6 @@ int sof_sdw_cs42l43_hs_init(struct snd_soc_card *card, const struct snd_soc_acpi
 	 * No need to test if (!playback) like other codecs as cs42l43 uses separated dai for
 	 * playback and capture, and sof_sdw_cs42l43_init is only linked to the playback dai.
 	 */
-
 	dai_links->init = cs42l43_hs_rtd_init;
 
 	return 0;
@@ -129,7 +128,6 @@ static int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
 
 	ret = snd_soc_dapm_add_routes(&card->dapm, cs42l43_dmic_map,
 				      ARRAY_SIZE(cs42l43_dmic_map));
-
 	if (ret)
 		dev_err(card->dev, "cs42l43 dmic map addition failed: %d\n", ret);
 
@@ -141,5 +139,6 @@ int sof_sdw_cs42l43_dmic_init(struct snd_soc_card *card, const struct snd_soc_ac
 			      bool playback)
 {
 	dai_links->init = cs42l43_dmic_rtd_init;
+
 	return 0;
 }
-- 
2.39.2

