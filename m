Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA3D84E5D9
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 18:01:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8128C86F;
	Thu,  8 Feb 2024 18:01:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8128C86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707411700;
	bh=lEHyeoUjOvDABSfQ8AI9NYBoAOp6zb3qSZVX8RMi9nw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DZNsDRt0hFAVRB0h+X0IaeOf9bghYDqIINntlRlqbQUtSXKT8JlZq5pnrvspc1oEA
	 QNAZreu3wWI8gfItV3qJz48Sv0XdLxi102WZdMuAn29oO0qZX/u9AUqi0NaNaMy9om
	 f3/OIsQd1x5I7Q3PKPpVkUrqIvFOM4TKuwNNBB64=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75CC6F80C81; Thu,  8 Feb 2024 17:57:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1736DF80C8F;
	Thu,  8 Feb 2024 17:57:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 001ACF80699; Thu,  8 Feb 2024 17:56:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CEBEF805F0
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 17:56:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CEBEF805F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HAXrGs67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411376; x=1738947376;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lEHyeoUjOvDABSfQ8AI9NYBoAOp6zb3qSZVX8RMi9nw=;
  b=HAXrGs67NpPFeqlfzU3qL/rpsx580Hc57nsFG72FshMBy6y96ZGeuVvM
   kkIcHHbjaAKkeMe+lRKBFxGDVLZx4J8B8EKXF13K/MLZJnTeLWLRGiuHH
   jPmMHumvOrPS8B23hzd7674/OYOYkGwFnxB2JyWR54gz5U0H2v6xWPKUz
   enWTONRvdjK8bGBxQZG6gjOStidXiSSOXhDzD7QBrmi0x/WfK2Nsx7Utj
   NlhKfS5NIQmtUirRwYTXEtpgvYHce4xHRc6FWJYa6nPmNwyrtVgYx9G5f
   LFX2FYxKAOdrY7XLyFetorseahE+XEv5jqODs/BqishPOI1sP/AEYlQda
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675434"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="395675434"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:56:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="1690278"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:56:06 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 21/24] ASoC: Intel: sof_sdw: Remove unused function prototypes
Date: Thu,  8 Feb 2024 10:55:42 -0600
Message-Id: <20240208165545.93811-22-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DMLBUANEDQVR2YPJHYYTPBCAI4H7UAYK
X-Message-ID-Hash: DMLBUANEDQVR2YPJHYYTPBCAI4H7UAYK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DMLBUANEDQVR2YPJHYYTPBCAI4H7UAYK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

Recent commits remove a lot of init functions remove their function
prototypes as well.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_common.h | 62 -------------------------
 1 file changed, 62 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index ab444dae46ab..b1d57034361c 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -139,25 +139,6 @@ int sof_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
 			      bool playback);
 int sof_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
-/* RT712-SDCA support */
-int sof_sdw_rt712_spk_init(struct snd_soc_card *card,
-			   const struct snd_soc_acpi_link_adr *link,
-			   struct snd_soc_dai_link *dai_links,
-			   struct sof_sdw_codec_info *info,
-			   bool playback);
-int sof_sdw_rt712_sdca_dmic_init(struct snd_soc_card *card,
-				 const struct snd_soc_acpi_link_adr *link,
-				 struct snd_soc_dai_link *dai_links,
-				 struct sof_sdw_codec_info *info,
-				 bool playback);
-
-/* RT700 support */
-int sof_sdw_rt700_init(struct snd_soc_card *card,
-		       const struct snd_soc_acpi_link_adr *link,
-		       struct snd_soc_dai_link *dai_links,
-		       struct sof_sdw_codec_info *info,
-		       bool playback);
-
 /* RT1308 I2S support */
 extern struct snd_soc_ops sof_sdw_rt1308_i2s_ops;
 
@@ -169,22 +150,6 @@ int sof_sdw_rt_amp_init(struct snd_soc_card *card,
 			bool playback);
 int sof_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
-/* RT1316 support */
-
-/* RT715 support */
-int sof_sdw_rt715_init(struct snd_soc_card *card,
-		       const struct snd_soc_acpi_link_adr *link,
-		       struct snd_soc_dai_link *dai_links,
-		       struct sof_sdw_codec_info *info,
-		       bool playback);
-
-/* RT715-SDCA support */
-int sof_sdw_rt715_sdca_init(struct snd_soc_card *card,
-			    const struct snd_soc_acpi_link_adr *link,
-			    struct snd_soc_dai_link *dai_links,
-			    struct sof_sdw_codec_info *info,
-			    bool playback);
-
 /* RT722-SDCA support */
 int sof_sdw_rt722_spk_init(struct snd_soc_card *card,
 			   const struct snd_soc_acpi_link_adr *link,
@@ -204,33 +169,6 @@ int sof_sdw_maxim_init(struct snd_soc_card *card,
 		       struct sof_sdw_codec_info *info,
 		       bool playback);
 
-/* RT5682 support */
-int sof_sdw_rt5682_init(struct snd_soc_card *card,
-			const struct snd_soc_acpi_link_adr *link,
-			struct snd_soc_dai_link *dai_links,
-			struct sof_sdw_codec_info *info,
-			bool playback);
-
-/* CS42L42 support */
-int sof_sdw_cs42l42_init(struct snd_soc_card *card,
-			 const struct snd_soc_acpi_link_adr *link,
-			 struct snd_soc_dai_link *dai_links,
-			 struct sof_sdw_codec_info *info,
-			 bool playback);
-
-/* CS42L43 support */
-int sof_sdw_cs42l43_hs_init(struct snd_soc_card *card,
-			    const struct snd_soc_acpi_link_adr *link,
-			    struct snd_soc_dai_link *dai_links,
-			    struct sof_sdw_codec_info *info,
-			    bool playback);
-
-int sof_sdw_cs42l43_dmic_init(struct snd_soc_card *card,
-			      const struct snd_soc_acpi_link_adr *link,
-			      struct snd_soc_dai_link *dai_links,
-			      struct sof_sdw_codec_info *info,
-			      bool playback);
-
 /* CS AMP support */
 int sof_sdw_cs_amp_init(struct snd_soc_card *card,
 			const struct snd_soc_acpi_link_adr *link,
-- 
2.40.1

