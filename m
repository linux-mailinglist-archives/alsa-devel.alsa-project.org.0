Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 862F170B9BD
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 12:15:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B353B82C;
	Mon, 22 May 2023 12:14:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B353B82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684750506;
	bh=9I6SZPHFE+zVVNdKvdki/PrqCrotyLrz4LNIreMNQko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XoIv/9MhoyNozU0JNPOcX42fneddU1tMfrOltz1BrQ/FHLcAAzpFBWKuHBEtk9FK5
	 rKb/+JVQkc9XPpUxLPS5XBQ5QfFcxj4R44lCYdkdEuHg9FqNXxpfVXG7+B7mwB84gI
	 0ax/WYxjbAjk3eQGD4m3RR/hDdMQx1YmygPC0uI0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74314F8024E; Mon, 22 May 2023 12:14:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E243F80249;
	Mon, 22 May 2023 12:14:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E283FF8026A; Mon, 22 May 2023 12:14:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9240F80086
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 12:12:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9240F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DimqJc2n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684750350; x=1716286350;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9I6SZPHFE+zVVNdKvdki/PrqCrotyLrz4LNIreMNQko=;
  b=DimqJc2nrR2yxA4GELICSXXX5Dd85Lz+47L1K+HjaqeA7tOM8QaSdpiM
   CAM3U+nsYe60cesfFDfEK90ZfvOtGSeRXbyVgh2NSJC8aKCzZHiS5SMXR
   o7886PemLQMcqjKQRvdgKJsB/8k8GhiKRPtNQae0ZU9/bORb2oxQqPwbT
   lhhLPKDQdjwZrJjDr0HZ8jRG9F6V1Dz8XAO7KvE+HtR06FefbLzhK+5LH
   F+Tsg+rIg2VxxNi8aYFibzPZtK7bF/SvuvE1QufxZjk1pZP8lxW0MFWlU
   TVY2LS3f3Sijwqf76NJrxVXUrzmHSHDec78rpmx5LpgHoEx1uboIeiwuA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="350390679"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="350390679"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 03:12:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="736365243"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="736365243"
Received: from bbattach-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.220.157])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 03:12:24 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com
Subject: [PATCH 4/5] ASoC: SOF: ipc4-topology: Do not use the CPC value from
 topology
Date: Mon, 22 May 2023 13:13:12 +0300
Message-Id: <20230522101313.12519-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522101313.12519-1-peter.ujfalusi@linux.intel.com>
References: <20230522101313.12519-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: W4XILLMT7GCQC6Z4MW6UYWRCT6URJTII
X-Message-ID-Hash: W4XILLMT7GCQC6Z4MW6UYWRCT6URJTII
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W4XILLMT7GCQC6Z4MW6UYWRCT6URJTII/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Stop parsing the CPC value from topology to module_base_cfg.
The CPC value is only set for few modules in topology which makes the CPC
handling inconsistent.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 547b3a935931..bdfc76591f76 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -39,8 +39,6 @@ static const struct sof_topology_token pipeline_tokens[] = {
 };
 
 static const struct sof_topology_token ipc4_comp_tokens[] = {
-	{SOF_TKN_COMP_CPC, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc4_base_module_cfg, cpc)},
 	{SOF_TKN_COMP_IS_PAGES, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
 		offsetof(struct sof_ipc4_base_module_cfg, is_pages)},
 };
@@ -235,7 +233,7 @@ static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 		"Number of input audio formats: %d. Number of output audio formats: %d\n",
 		available_fmt->num_input_formats, available_fmt->num_output_formats);
 
-	/* set cpc and is_pages in the module's base_config */
+	/* set is_pages in the module's base_config */
 	ret = sof_update_ipc_object(scomp, module_base_cfg, SOF_COMP_TOKENS, swidget->tuples,
 				    swidget->num_tuples, sizeof(*module_base_cfg), 1);
 	if (ret) {
@@ -244,8 +242,8 @@ static int sof_ipc4_get_audio_fmt(struct snd_soc_component *scomp,
 		return ret;
 	}
 
-	dev_dbg(scomp->dev, "widget %s cpc: %d is_pages: %d\n",
-		swidget->widget->name, module_base_cfg->cpc, module_base_cfg->is_pages);
+	dev_dbg(scomp->dev, "widget %s: is_pages: %d\n", swidget->widget->name,
+		module_base_cfg->is_pages);
 
 	if (available_fmt->num_input_formats) {
 		in_format = kcalloc(available_fmt->num_input_formats,
@@ -723,9 +721,9 @@ static int sof_ipc4_widget_setup_comp_pga(struct snd_sof_widget *swidget)
 	}
 
 	dev_dbg(scomp->dev,
-		"pga widget %s: ramp type: %d, ramp duration %d, initial gain value: %#x, cpc %d\n",
+		"pga widget %s: ramp type: %d, ramp duration %d, initial gain value: %#x\n",
 		swidget->widget->name, gain->data.curve_type, gain->data.curve_duration_l,
-		gain->data.init_val, gain->base_config.cpc);
+		gain->data.init_val);
 
 	ret = sof_ipc4_widget_setup_msg(swidget, &gain->msg);
 	if (ret)
-- 
2.40.1

