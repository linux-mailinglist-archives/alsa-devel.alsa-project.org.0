Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C8091499D
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 14:16:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF59F82A;
	Mon, 24 Jun 2024 14:16:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF59F82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719231386;
	bh=nIHcHhTNgN+Q0m/O2aXaYPI4f07yUZ770Dxn2vDeXCg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NoPZ/JHbLABr6I4EMm61sw1ixpxz6ZZzqMRpJRJgN8ZO1FRqGYmUMb38UoUtppBnq
	 P5snmgpVL1mjwsV+TX4UJIe/X+4I7zVeXYHGcMAFNWe5DpfrTmsz9zZVBsDCbpe+GM
	 +L3U0hMFOMymtclDbmgVYH3uBJCb2RTKWpXpn3V8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3ABB3F805D8; Mon, 24 Jun 2024 14:15:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5769DF805E0;
	Mon, 24 Jun 2024 14:15:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFABDF80495; Mon, 24 Jun 2024 14:15:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCF44F80154
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 14:15:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCF44F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XBoxwFxO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719231339; x=1750767339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nIHcHhTNgN+Q0m/O2aXaYPI4f07yUZ770Dxn2vDeXCg=;
  b=XBoxwFxO5hqIOG3OCSP6T6uEGwW3Lxc63/YyXiVU10WFMJZZ6G4KzRXt
   GJmJZyFGjnjdCs3QxNpA2SHl9o1uxkMPo5CN7zFjodhUMkL3Mrj4ZDaRe
   ykijByaq3fY4kCbkm1v1ITpD+5PQ9zKkAWIBBCfgBAWgVECFYnhv/YsTU
   Mf1ZwSw88UjwJVMn6tBIqFkZ6dSMm3j6pK3Hf1PXWBo24a29wbUlnB4qA
   OAmzczflnaZXp+1HFbPGzMzSB+qG5vrMa2Qec5sMKRlBl9OPWr5QRnqqZ
   RUQE4MiM6q8sj+stub8t3en/rCbUSXXCBz87xVA2kOITsTRDDtG43/WdI
   g==;
X-CSE-ConnectionGUID: shCZ6Vh2ROukADQ51Qv/tQ==
X-CSE-MsgGUID: DRf/SlD5TPamo/qq1fcmyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="15888050"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000";
   d="scan'208";a="15888050"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 05:15:37 -0700
X-CSE-ConnectionGUID: Ypu9WzvIRVKTEbPuwN1UCQ==
X-CSE-MsgGUID: SYcJB7xFT+aYaMm/ZrEtLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000";
   d="scan'208";a="43358820"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.230])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 05:15:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 1/3] ASoC: SOF: ipc4-topology: Use single token list for the
 copiers
Date: Mon, 24 Jun 2024 14:15:17 +0200
Message-ID: <20240624121519.91703-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240624121519.91703-1-pierre-louis.bossart@linux.intel.com>
References: <20240624121519.91703-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LUPVFK6XY56DOHWEHDLMNCQ4MPL5X2J2
X-Message-ID-Hash: LUPVFK6XY56DOHWEHDLMNCQ4MPL5X2J2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LUPVFK6XY56DOHWEHDLMNCQ4MPL5X2J2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

There is no need to keep separate token list for dai and 'common' copier
token list when the 'common' list is actually the aif list, the
SOF_COPIER_DEEP_BUFFER_TOKENS are not applicable for buffers.

We could have separate lists for all types but it is probably simpler to
just use a single list for all types of copiers. Function specific tokens
will be only parsed by function specific code anyways.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index d123edfa3bae..ce2910f70e65 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -3305,14 +3305,17 @@ static int sof_ipc4_link_setup(struct snd_sof_dev *sdev, struct snd_soc_dai_link
 	return 0;
 }
 
-static enum sof_tokens common_copier_token_list[] = {
+/* Tokens needed for different copier variants (aif, dai and buffer) */
+static enum sof_tokens copier_token_list[] = {
 	SOF_COMP_TOKENS,
+	SOF_COPIER_TOKENS,
 	SOF_AUDIO_FMT_NUM_TOKENS,
 	SOF_IN_AUDIO_FORMAT_TOKENS,
 	SOF_OUT_AUDIO_FORMAT_TOKENS,
-	SOF_COPIER_DEEP_BUFFER_TOKENS,
-	SOF_COPIER_TOKENS,
 	SOF_COMP_EXT_TOKENS,
+
+	SOF_COPIER_DEEP_BUFFER_TOKENS,	/* for AIF copier */
+	SOF_DAI_TOKENS,			/* for DAI copier */
 };
 
 static enum sof_tokens pipeline_token_list[] = {
@@ -3320,16 +3323,6 @@ static enum sof_tokens pipeline_token_list[] = {
 	SOF_PIPELINE_TOKENS,
 };
 
-static enum sof_tokens dai_token_list[] = {
-	SOF_COMP_TOKENS,
-	SOF_AUDIO_FMT_NUM_TOKENS,
-	SOF_IN_AUDIO_FORMAT_TOKENS,
-	SOF_OUT_AUDIO_FORMAT_TOKENS,
-	SOF_COPIER_TOKENS,
-	SOF_DAI_TOKENS,
-	SOF_COMP_EXT_TOKENS,
-};
-
 static enum sof_tokens pga_token_list[] = {
 	SOF_COMP_TOKENS,
 	SOF_GAIN_TOKENS,
@@ -3366,23 +3359,23 @@ static enum sof_tokens process_token_list[] = {
 
 static const struct sof_ipc_tplg_widget_ops tplg_ipc4_widget_ops[SND_SOC_DAPM_TYPE_COUNT] = {
 	[snd_soc_dapm_aif_in] =  {sof_ipc4_widget_setup_pcm, sof_ipc4_widget_free_comp_pcm,
-				  common_copier_token_list, ARRAY_SIZE(common_copier_token_list),
+				  copier_token_list, ARRAY_SIZE(copier_token_list),
 				  NULL, sof_ipc4_prepare_copier_module,
 				  sof_ipc4_unprepare_copier_module},
 	[snd_soc_dapm_aif_out] = {sof_ipc4_widget_setup_pcm, sof_ipc4_widget_free_comp_pcm,
-				  common_copier_token_list, ARRAY_SIZE(common_copier_token_list),
+				  copier_token_list, ARRAY_SIZE(copier_token_list),
 				  NULL, sof_ipc4_prepare_copier_module,
 				  sof_ipc4_unprepare_copier_module},
 	[snd_soc_dapm_dai_in] = {sof_ipc4_widget_setup_comp_dai, sof_ipc4_widget_free_comp_dai,
-				 dai_token_list, ARRAY_SIZE(dai_token_list), NULL,
+				 copier_token_list, ARRAY_SIZE(copier_token_list), NULL,
 				 sof_ipc4_prepare_copier_module,
 				 sof_ipc4_unprepare_copier_module},
 	[snd_soc_dapm_dai_out] = {sof_ipc4_widget_setup_comp_dai, sof_ipc4_widget_free_comp_dai,
-				  dai_token_list, ARRAY_SIZE(dai_token_list), NULL,
+				  copier_token_list, ARRAY_SIZE(copier_token_list), NULL,
 				  sof_ipc4_prepare_copier_module,
 				  sof_ipc4_unprepare_copier_module},
 	[snd_soc_dapm_buffer] = {sof_ipc4_widget_setup_pcm, sof_ipc4_widget_free_comp_pcm,
-				 common_copier_token_list, ARRAY_SIZE(common_copier_token_list),
+				 copier_token_list, ARRAY_SIZE(copier_token_list),
 				 NULL, sof_ipc4_prepare_copier_module,
 				 sof_ipc4_unprepare_copier_module},
 	[snd_soc_dapm_scheduler] = {sof_ipc4_widget_setup_comp_pipeline,
-- 
2.43.0

