Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB42F70B9B8
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 12:14:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13965847;
	Mon, 22 May 2023 12:13:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13965847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684750458;
	bh=ewcncT2m0VO0+SKUdS9pzJ+unQtswt+sqIIwdK+SF8s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NN3oH9Oi93fhd6mSEFknJZ7jE6Slv5CqexVJtYBl3gkbWcE13kIqRdSjqziywwvQz
	 ZwON95tJ1blSjZCBlQYMJdc6G4+c057CKy4ZjiBVD4PW6ceJRu0wNsZoLcfQLN8+kc
	 O0BO/SsEOPQD2C5CyIX8igs2Wsuw/N4Q4dPwupqY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AADB5F80570; Mon, 22 May 2023 12:12:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9423F80564;
	Mon, 22 May 2023 12:12:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0462FF80425; Mon, 22 May 2023 12:12:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B9C5F8026A
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 12:12:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B9C5F8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Bi85g47Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684750345; x=1716286345;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ewcncT2m0VO0+SKUdS9pzJ+unQtswt+sqIIwdK+SF8s=;
  b=Bi85g47QmJp61AO4sMsxBqYWMX+siPsIMJQTlddTX2gFvQWvOjFBM1LZ
   4qX3CkqQCQJdVWOdwczFz0P9oonQ8Uk7064Gpw7KsFBIvTYXVjcar0VGN
   RqmXJYJ+ViXFr+lvKBSXAHClDu7dives1hwMIwq7eI+eYZjV5C+L1L16j
   9hzLw1XrhZI/FtMGYuFbtYl1A4A5fKDRmljCuceUdeDCRzTJA3I+UTzJM
   4RanHS3LlkQUhJ2F5G8Ch5h7SyWB9qkmzeHSbZ+UO+AuqeaNrNgVPR7Hz
   bGLTXlpeBjJk3INGwLLwFY4QiXogUH3TbjcGxmvAeM9hUJz2p444ijEsg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="350390670"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="350390670"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 03:12:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="736365231"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="736365231"
Received: from bbattach-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.220.157])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 03:12:21 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com
Subject: [PATCH 3/5] ASoC: SOF: ipc4-topology: Rename
 sof_ipc4_update_pipeline_mem_usage() to be generic
Date: Mon, 22 May 2023 13:13:11 +0300
Message-Id: <20230522101313.12519-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522101313.12519-1-peter.ujfalusi@linux.intel.com>
References: <20230522101313.12519-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ABXI7CMB6IHW4ATDACDQSG4OHLLDCJV2
X-Message-ID-Hash: ABXI7CMB6IHW4ATDACDQSG4OHLLDCJV2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ABXI7CMB6IHW4ATDACDQSG4OHLLDCJV2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rename sof_ipc4_update_pipeline_mem_usage() to
sof_ipc4_update_resource_usage() in order to be re-usable for generic
resource storage, calculation of a module, like CPC adjustment.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index dce2f8f7f518..547b3a935931 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -936,8 +936,8 @@ static void sof_ipc4_widget_free_comp_process(struct snd_sof_widget *swidget)
 }
 
 static void
-sof_ipc4_update_pipeline_mem_usage(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget,
-				   struct sof_ipc4_base_module_cfg *base_config)
+sof_ipc4_update_resource_usage(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget,
+			       struct sof_ipc4_base_module_cfg *base_config)
 {
 	struct sof_ipc4_fw_module *fw_module = swidget->module_info;
 	struct snd_sof_widget *pipe_widget;
@@ -1711,7 +1711,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 		       *data, copier_data->gtw_cfg.config_length * 4);
 
 	/* update pipeline memory usage */
-	sof_ipc4_update_pipeline_mem_usage(sdev, swidget, &copier_data->base_config);
+	sof_ipc4_update_resource_usage(sdev, swidget, &copier_data->base_config);
 
 	return 0;
 }
@@ -1748,7 +1748,7 @@ static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
 	}
 
 	/* update pipeline memory usage */
-	sof_ipc4_update_pipeline_mem_usage(sdev, swidget, &gain->base_config);
+	sof_ipc4_update_resource_usage(sdev, swidget, &gain->base_config);
 
 	return 0;
 }
@@ -1785,7 +1785,7 @@ static int sof_ipc4_prepare_mixer_module(struct snd_sof_widget *swidget,
 	}
 
 	/* update pipeline memory usage */
-	sof_ipc4_update_pipeline_mem_usage(sdev, swidget, &mixer->base_config);
+	sof_ipc4_update_resource_usage(sdev, swidget, &mixer->base_config);
 
 	return 0;
 }
@@ -1822,7 +1822,7 @@ static int sof_ipc4_prepare_src_module(struct snd_sof_widget *swidget,
 	}
 
 	/* update pipeline memory usage */
-	sof_ipc4_update_pipeline_mem_usage(sdev, swidget, &src->base_config);
+	sof_ipc4_update_resource_usage(sdev, swidget, &src->base_config);
 
 	/* update pipeline_params for sink widgets */
 	rate = hw_param_interval(pipeline_params, SNDRV_PCM_HW_PARAM_RATE);
@@ -1959,7 +1959,7 @@ static int sof_ipc4_prepare_process_module(struct snd_sof_widget *swidget,
 	}
 
 	/* update pipeline memory usage */
-	sof_ipc4_update_pipeline_mem_usage(sdev, swidget, &process->base_config);
+	sof_ipc4_update_resource_usage(sdev, swidget, &process->base_config);
 
 	/* ipc_config_data is composed of the base_config followed by an optional extension */
 	memcpy(cfg, &process->base_config, sizeof(struct sof_ipc4_base_module_cfg));
-- 
2.40.1

