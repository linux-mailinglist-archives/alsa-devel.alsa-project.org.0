Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0068992728A
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2024 11:01:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6042915FE;
	Thu,  4 Jul 2024 11:01:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6042915FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720083717;
	bh=bNJKplLYROG7iY2UVl/qkk8WvYjXREaWfAYjH+1ihvo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qCrcfudK6C8l0j+wBk8+smxffid1LSKuurVZaF1XpWpWmYh3V8EN/x9iUVgPUD2My
	 +2TqA+EEl+rIDsK+wfoeLT4h0uaMuhXi8Z81IlcrjRuH6LyWGO7HKP1VoVda1elyrw
	 /X20x1CYMYYwxb7i5kRBG78DkhMJelSbpqbIcDyQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3B43F805C9; Thu,  4 Jul 2024 11:00:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6336CF805C4;
	Thu,  4 Jul 2024 11:00:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37C36F8058C; Thu,  4 Jul 2024 11:00:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D11D1F80301
	for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2024 11:00:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D11D1F80301
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=e3JI+Yza
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720083622; x=1751619622;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bNJKplLYROG7iY2UVl/qkk8WvYjXREaWfAYjH+1ihvo=;
  b=e3JI+YzaA7rKIL8jPtiOdHyKcd7zqkEjqU2f4OwBz33h52+4zrSZepTH
   RoDVANwKunEDCdyh6DGn3l2YqAf5TjuXHJQs6cFnC5Tr2rDVnwy6Rcr2p
   v6YtsAqNz9Atz7xCfwoMwZ/YfMaLWWaJx5AtqmThya34b/vxXktmycMtg
   Al1V5iSRcvPWKzf+gXPPpgmPOtUTIjyKRx37DLqjr6F5MtNZQXcQcPAim
   DMwTWkqS4rerWSxHqdNU9MH5Rwl12C1voscvzqxCMdm3fbwRRhxqIxptY
   pl/+BK/VWolzsbGboWrs7KE+6s/RVPOze66S6gh9mdPig++s28xZziJ5I
   w==;
X-CSE-ConnectionGUID: +VBQh3TqRxGMi/dCYfII6Q==
X-CSE-MsgGUID: zKmxO88eRuipwHq+jv4S4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="34799210"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800";
   d="scan'208";a="34799210"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 02:00:12 -0700
X-CSE-ConnectionGUID: 6xglVsNnRnKN3X+kStJlvw==
X-CSE-MsgGUID: 4uYD7ImZT/2czNmTzN99zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800";
   d="scan'208";a="50979500"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.90])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 02:00:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH] ASoC: SOF: ipc4-topology: Use single token list for the
 copiers
Date: Thu,  4 Jul 2024 10:59:44 +0200
Message-ID: <20240704085944.371450-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OIE3PX55G6O4PSSLAQOQ4NWNV2C7IPVN
X-Message-ID-Hash: OIE3PX55G6O4PSSLAQOQ4NWNV2C7IPVN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OIE3PX55G6O4PSSLAQOQ4NWNV2C7IPVN/>
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
index 7755c01735f5..90f6856ee80c 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -3307,14 +3307,17 @@ static int sof_ipc4_link_setup(struct snd_sof_dev *sdev, struct snd_soc_dai_link
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
@@ -3322,16 +3325,6 @@ static enum sof_tokens pipeline_token_list[] = {
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
@@ -3368,23 +3361,23 @@ static enum sof_tokens process_token_list[] = {
 
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

