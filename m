Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 764BF84E5E3
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Feb 2024 18:02:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFA25A4B;
	Thu,  8 Feb 2024 18:02:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFA25A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707411730;
	bh=yOZ9EZGP28EpFbe80EFkcrfotn/qgf+OhCYxIyOXtR4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IKBNfp8/gw4iKO/Uk9edeiE/NyNKlrC1gxfTZ9bfEKDmBc7pzAqt0ZesqtlMBLumF
	 hi5eklg3Ql2NT05tTLoEFP+yJugHP1rh+RlXQ9zxRu7L5JjVVh5d6dJevXQskFOpyi
	 1xWypHO6qlhUUprWvG4DKYuOcOd9zyBaI+pZYY2M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67A1AF89627; Thu,  8 Feb 2024 17:57:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8762CF89623;
	Thu,  8 Feb 2024 17:57:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDB69F806BC; Thu,  8 Feb 2024 17:56:39 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id ADF5BF805EB
	for <alsa-devel@alsa-project.org>; Thu,  8 Feb 2024 17:56:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADF5BF805EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XT3xrPZ0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707411374; x=1738947374;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yOZ9EZGP28EpFbe80EFkcrfotn/qgf+OhCYxIyOXtR4=;
  b=XT3xrPZ0w+FWGLqx16qG91v3gaPToB2s9AApxKKSw4N3NKpI2E9tQdsL
   B7E6P/SGWsdjBNFdadZB6DpK0NxVRgU2FnTuRJwxKgfI+mZ1TaNmsHNjB
   b6rHr73bs5AjtxacG/XpJyt05pKM5pX0JkR5sgXvpUoqpwqcaG9IbKqNZ
   GcTZTyJbYxhWnlyU0bYr5oHxVEN69do9MAWhivzK/DjEa8CgSNDRD2JfW
   hN/Edx8wq3fxNmzMLjhC9AF0gzJhNyAPCwryHTart4BRkDKgS3h53/O5w
   XC1a8xj3aZzwJmDvxLXM2LD8khaL/gYMamWn7yiEmL+HDvm/jdZy657go
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395675416"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="395675416"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:56:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400";
   d="scan'208";a="1690268"
Received: from stang1-mobl1.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.212.92.130])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 08:56:04 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 18/24] ASoC: Intel: sof_sdw: remove .init callbacks
Date: Thu,  8 Feb 2024 10:55:39 -0600
Message-Id: <20240208165545.93811-19-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
References: <20240208165545.93811-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BL5SFVYJ557WDOI2ER3QWWPTY7T26HNG
X-Message-ID-Hash: BL5SFVYJ557WDOI2ER3QWWPTY7T26HNG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BL5SFVYJ557WDOI2ER3QWWPTY7T26HNG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Some codec .init callbacks are empty after removing dai_links->init =
xxx_rtd_init;. Remove those callbacks.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c            | 12 ------------
 sound/soc/intel/boards/sof_sdw_cs42l42.c    | 16 ----------------
 sound/soc/intel/boards/sof_sdw_cs42l43.c    | 18 ------------------
 sound/soc/intel/boards/sof_sdw_rt5682.c     | 16 ----------------
 sound/soc/intel/boards/sof_sdw_rt700.c      | 16 ----------------
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c | 18 ------------------
 sound/soc/intel/boards/sof_sdw_rt715.c      |  8 --------
 sound/soc/intel/boards/sof_sdw_rt715_sdca.c |  8 --------
 8 files changed, 112 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 782b45adb21e..801cfe9c4dd3 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -650,7 +650,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt700-aif1",
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
-				.init = sof_sdw_rt700_init,
 				.rtd_init = rt700_rtd_init,
 			},
 		},
@@ -706,7 +705,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt712-sdca-aif2",
 				.dai_type = SOF_SDW_DAI_TYPE_AMP,
 				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
-				.init = sof_sdw_rt712_spk_init,
 				.rtd_init = rt712_spk_rtd_init,
 			},
 		},
@@ -721,7 +719,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt712-sdca-dmic-aif1",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.init = sof_sdw_rt712_sdca_dmic_init,
 				.rtd_init = rt712_sdca_dmic_rtd_init,
 			},
 		},
@@ -752,7 +749,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt712-sdca-dmic-aif1",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.init = sof_sdw_rt712_sdca_dmic_init,
 				.rtd_init = rt712_sdca_dmic_rtd_init,
 			},
 		},
@@ -815,7 +811,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt715-aif2",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.init = sof_sdw_rt715_sdca_init,
 				.rtd_init = rt715_sdca_rtd_init,
 			},
 		},
@@ -831,7 +826,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt715-aif2",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.init = sof_sdw_rt715_sdca_init,
 				.rtd_init = rt715_sdca_rtd_init,
 			},
 		},
@@ -847,7 +841,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt715-aif2",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.init = sof_sdw_rt715_init,
 				.rtd_init = rt715_rtd_init,
 			},
 		},
@@ -863,7 +856,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt715-aif2",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.init = sof_sdw_rt715_init,
 				.rtd_init = rt715_rtd_init,
 			},
 		},
@@ -935,7 +927,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "rt5682-sdw",
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
-				.init = sof_sdw_rt5682_init,
 				.rtd_init = rt5682_rtd_init,
 			},
 		},
@@ -963,7 +954,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "cs42l42-sdw",
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
-				.init = sof_sdw_cs42l42_init,
 				.rtd_init = cs42l42_rtd_init,
 			},
 		},
@@ -978,7 +968,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "cs42l43-dp5",
 				.dai_type = SOF_SDW_DAI_TYPE_JACK,
 				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
-				.init = sof_sdw_cs42l43_hs_init,
 				.rtd_init = cs42l43_hs_rtd_init,
 			},
 			{
@@ -986,7 +975,6 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 				.dai_name = "cs42l43-dp1",
 				.dai_type = SOF_SDW_DAI_TYPE_MIC,
 				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
-				.init = sof_sdw_cs42l43_dmic_init,
 				.rtd_init = cs42l43_dmic_rtd_init,
 			},
 			{
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l42.c b/sound/soc/intel/boards/sof_sdw_cs42l42.c
index 5d0915b72c7f..0dc297f7de01 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l42.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l42.c
@@ -121,20 +121,4 @@ int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd)
 
 	return ret;
 }
-
-int sof_sdw_cs42l42_init(struct snd_soc_card *card,
-			 const struct snd_soc_acpi_link_adr *link,
-			 struct snd_soc_dai_link *dai_links,
-			 struct sof_sdw_codec_info *info,
-			 bool playback)
-{
-	/*
-	 * headset should be initialized once.
-	 * Do it with dai link for playback.
-	 */
-	if (!playback)
-		return 0;
-
-	return 0;
-}
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l43.c b/sound/soc/intel/boards/sof_sdw_cs42l43.c
index 7909ea9c9c14..a9b6edac2ecd 100644
--- a/sound/soc/intel/boards/sof_sdw_cs42l43.c
+++ b/sound/soc/intel/boards/sof_sdw_cs42l43.c
@@ -108,18 +108,6 @@ int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
-int sof_sdw_cs42l43_hs_init(struct snd_soc_card *card, const struct snd_soc_acpi_link_adr *link,
-			    struct snd_soc_dai_link *dai_links, struct sof_sdw_codec_info *info,
-			    bool playback)
-{
-	/*
-	 * No need to test if (!playback) like other codecs as cs42l43 uses separated dai for
-	 * playback and capture, and sof_sdw_cs42l43_init is only linked to the playback dai.
-	 */
-
-	return 0;
-}
-
 int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
@@ -145,9 +133,3 @@ int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
-int sof_sdw_cs42l43_dmic_init(struct snd_soc_card *card, const struct snd_soc_acpi_link_adr *link,
-			      struct snd_soc_dai_link *dai_links, struct sof_sdw_codec_info *info,
-			      bool playback)
-{
-	return 0;
-}
diff --git a/sound/soc/intel/boards/sof_sdw_rt5682.c b/sound/soc/intel/boards/sof_sdw_rt5682.c
index 4e3fcc861074..6b008a5a343b 100644
--- a/sound/soc/intel/boards/sof_sdw_rt5682.c
+++ b/sound/soc/intel/boards/sof_sdw_rt5682.c
@@ -120,20 +120,4 @@ int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd)
 
 	return ret;
 }
-
-int sof_sdw_rt5682_init(struct snd_soc_card *card,
-			const struct snd_soc_acpi_link_adr *link,
-			struct snd_soc_dai_link *dai_links,
-			struct sof_sdw_codec_info *info,
-			bool playback)
-{
-	/*
-	 * headset should be initialized once.
-	 * Do it with dai link for playback.
-	 */
-	if (!playback)
-		return 0;
-
-	return 0;
-}
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
diff --git a/sound/soc/intel/boards/sof_sdw_rt700.c b/sound/soc/intel/boards/sof_sdw_rt700.c
index 781d41e35191..88e785a54b16 100644
--- a/sound/soc/intel/boards/sof_sdw_rt700.c
+++ b/sound/soc/intel/boards/sof_sdw_rt700.c
@@ -119,20 +119,4 @@ int rt700_rtd_init(struct snd_soc_pcm_runtime *rtd)
 
 	return ret;
 }
-
-int sof_sdw_rt700_init(struct snd_soc_card *card,
-		       const struct snd_soc_acpi_link_adr *link,
-		       struct snd_soc_dai_link *dai_links,
-		       struct sof_sdw_codec_info *info,
-		       bool playback)
-{
-	/*
-	 * headset should be initialized once.
-	 * Do it with dai link for playback.
-	 */
-	if (!playback)
-		return 0;
-
-	return 0;
-}
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
diff --git a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
index dddb27e4c943..ebb4b58c198b 100644
--- a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
@@ -67,15 +67,6 @@ int rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
-int sof_sdw_rt712_spk_init(struct snd_soc_card *card,
-			   const struct snd_soc_acpi_link_adr *link,
-			   struct snd_soc_dai_link *dai_links,
-			   struct sof_sdw_codec_info *info,
-			   bool playback)
-{
-	return 0;
-}
-
 static const char * const dmics[] = {
 	"rt712-sdca-dmic"
 };
@@ -99,13 +90,4 @@ int rt712_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
 
 	return 0;
 }
-
-int sof_sdw_rt712_sdca_dmic_init(struct snd_soc_card *card,
-				 const struct snd_soc_acpi_link_adr *link,
-				 struct snd_soc_dai_link *dai_links,
-				 struct sof_sdw_codec_info *info,
-				 bool playback)
-{
-	return 0;
-}
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
diff --git a/sound/soc/intel/boards/sof_sdw_rt715.c b/sound/soc/intel/boards/sof_sdw_rt715.c
index 19194fe92b8e..b5a886cd595d 100644
--- a/sound/soc/intel/boards/sof_sdw_rt715.c
+++ b/sound/soc/intel/boards/sof_sdw_rt715.c
@@ -24,11 +24,3 @@ int rt715_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
-int sof_sdw_rt715_init(struct snd_soc_card *card,
-		       const struct snd_soc_acpi_link_adr *link,
-		       struct snd_soc_dai_link *dai_links,
-		       struct sof_sdw_codec_info *info,
-		       bool playback)
-{
-	return 0;
-}
diff --git a/sound/soc/intel/boards/sof_sdw_rt715_sdca.c b/sound/soc/intel/boards/sof_sdw_rt715_sdca.c
index 3089fa8450fa..4b37a8a6dd2e 100644
--- a/sound/soc/intel/boards/sof_sdw_rt715_sdca.c
+++ b/sound/soc/intel/boards/sof_sdw_rt715_sdca.c
@@ -24,11 +24,3 @@ int rt715_sdca_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
-int sof_sdw_rt715_sdca_init(struct snd_soc_card *card,
-			    const struct snd_soc_acpi_link_adr *link,
-			    struct snd_soc_dai_link *dai_links,
-			    struct sof_sdw_codec_info *info,
-			    bool playback)
-{
-	return 0;
-}
-- 
2.40.1

