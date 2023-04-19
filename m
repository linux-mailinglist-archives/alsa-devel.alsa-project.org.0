Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C086E8240
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 21:59:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2591EF01;
	Wed, 19 Apr 2023 21:58:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2591EF01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681934344;
	bh=ouBKoHKhciDcxwM8EneMHAp6XS64B5Xi2KdV9i7o8mk=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uc+01hC//dr5Zwd5QSC5OCe9goiDH099p2TgBNmnv693DHt4QpWW+bjUwnos0nh7J
	 77yvCXD921t3+2vKFpixdJHGg3Qkgoi7diriurH8kpp5HoTl/wv7xMF+utzo9WWLIP
	 IAlWypYNRTrOLZIl8PvDlcDUgK3j8MGCJOrX3OJY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFA32F804FC;
	Wed, 19 Apr 2023 21:57:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E68CF80212; Wed, 19 Apr 2023 21:57:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2B58F80053
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 21:56:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2B58F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=cRnwDYeg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681934167; x=1713470167;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ouBKoHKhciDcxwM8EneMHAp6XS64B5Xi2KdV9i7o8mk=;
  b=cRnwDYegN8o+azm8jmm1w42MzmkcbAC/gm/Ixd8ImPwNi2K2WCtohKkR
   SefJ8sjxSWc5xfYPKxuReSK2+Yw3CuIPS7Fp7p55e/L5lhRdZj50IYelQ
   L9+gTqSTB7n5W7nuN8heFd/HVFtSy3P4zQXPr4DoaeO/mPUA5qSmGyYPS
   Juk1iWQPiQ2Hq8emlWoVpElQc6N0a5Ebci3IHONnK7jNEr/v7epa/osBf
   0m1Nnlfz2dCXT8IrgzjklMI1lSO5gqecxhhtnWobbe044nZgrLDxk06R5
   vbi9DCQMxn08MkBVOSSnftqMRkFI8l0gTaRwlGW+49tcpdhr/xRm60x8h
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="373434393"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200";
   d="scan'208";a="373434393"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:56:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="815728105"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200";
   d="scan'208";a="815728105"
Received: from gargicha-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.74.38])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:56:01 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/7] ASoC: Intel: sof_sdw_max98373: change
 sof_sdw_mx8373_late_probe to static call
Date: Wed, 19 Apr 2023 14:55:21 -0500
Message-Id: <20230419195524.46995-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230419195524.46995-1-pierre-louis.bossart@linux.intel.com>
References: <20230419195524.46995-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 75H7LAZSYJJ3Q6FABIS7ZXHUUXASBSWM
X-Message-ID-Hash: 75H7LAZSYJJ3Q6FABIS7ZXHUUXASBSWM
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.de, broonie@kernel.org, Yong Zhi <yong.zhi@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/75H7LAZSYJJ3Q6FABIS7ZXHUUXASBSWM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Yong Zhi <yong.zhi@intel.com>

sof_sdw_mx8373_late_probe is only used in sof_sdw_max98373,
so it should be static and rename it to 'mx8373_sdw_late_probe'.

Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_common.h   |  2 --
 sound/soc/intel/boards/sof_sdw_max98373.c | 22 +++++++++++-----------
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 4962dc11a088..081ab7eac5b6 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -158,8 +158,6 @@ int sof_sdw_mx8373_init(struct snd_soc_card *card,
 			struct sof_sdw_codec_info *info,
 			bool playback);
 
-int sof_sdw_mx8373_late_probe(struct snd_soc_card *card);
-
 /* RT5682 support */
 int sof_sdw_rt5682_init(struct snd_soc_card *card,
 			const struct snd_soc_acpi_link_adr *link,
diff --git a/sound/soc/intel/boards/sof_sdw_max98373.c b/sound/soc/intel/boards/sof_sdw_max98373.c
index 22bd1e356e22..3d7df58c0f1d 100644
--- a/sound/soc/intel/boards/sof_sdw_max98373.c
+++ b/sound/soc/intel/boards/sof_sdw_max98373.c
@@ -120,6 +120,16 @@ static const struct snd_soc_ops max_98373_sdw_ops = {
 	.shutdown = sdw_shutdown,
 };
 
+static int mx8373_sdw_late_probe(struct snd_soc_card *card)
+{
+	struct snd_soc_dapm_context *dapm = &card->dapm;
+
+	/* Disable Left and Right Spk pin after boot */
+	snd_soc_dapm_disable_pin(dapm, "Left Spk");
+	snd_soc_dapm_disable_pin(dapm, "Right Spk");
+	return snd_soc_dapm_sync(dapm);
+}
+
 int sof_sdw_mx8373_init(struct snd_soc_card *card,
 			const struct snd_soc_acpi_link_adr *link,
 			struct snd_soc_dai_link *dai_links,
@@ -130,19 +140,9 @@ int sof_sdw_mx8373_init(struct snd_soc_card *card,
 	if (info->amp_num == 2)
 		dai_links->init = spk_init;
 
-	info->codec_card_late_probe = sof_sdw_mx8373_late_probe;
+	info->codec_card_late_probe = mx8373_sdw_late_probe;
 
 	dai_links->ops = &max_98373_sdw_ops;
 
 	return 0;
 }
-
-int sof_sdw_mx8373_late_probe(struct snd_soc_card *card)
-{
-	struct snd_soc_dapm_context *dapm = &card->dapm;
-
-	/* Disable Left and Right Spk pin after boot */
-	snd_soc_dapm_disable_pin(dapm, "Left Spk");
-	snd_soc_dapm_disable_pin(dapm, "Right Spk");
-	return snd_soc_dapm_sync(dapm);
-}
-- 
2.37.2

