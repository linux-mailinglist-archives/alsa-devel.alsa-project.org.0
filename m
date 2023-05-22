Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D475870B9BE
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 12:15:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D678857;
	Mon, 22 May 2023 12:14:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D678857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684750510;
	bh=UO5Ko/fbRvodL31HvS/dJ+b+O8eeZVFRasy10EgGbuY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LwG94Xn4AvVVHge+rskhKTy+BHQG4e+tZXD8drKZSbCkVQIVImI5V9NXtoNBvq1ix
	 GonG5A55StlNtuzuYrwO4Xrj/742jbaCz8s5IsqfvmojXnu/rVtNeEHILqLf4n3iEU
	 UuDTwmySEkcyfvRNjP/P1b9o28AeSTos9eXY4/Ag=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C12E6F80553; Mon, 22 May 2023 12:14:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87E10F80548;
	Mon, 22 May 2023 12:14:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05A52F8026A; Mon, 22 May 2023 12:14:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AA20F8024E
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 12:12:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AA20F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Sd723m4+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684750351; x=1716286351;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UO5Ko/fbRvodL31HvS/dJ+b+O8eeZVFRasy10EgGbuY=;
  b=Sd723m4+y0qloKX9chGqJ8I6HCIb1lf8Ep8G7SzxKALEyB5F2kjIBgcY
   EWsPhGbK5Nv5jr8glTi8IyUnnNMq9rSMURFZVfpgr6TdESLSa8dP3DIL4
   wQWyc1g/+3PWJxCrg0JKkemmujL1+03ByWhWjGuJPRpK3S0p9w+j7gznv
   nAwtXaix6uYPDkKE66ljKPaIOgHc6HQVtwnx/0NM6JZnv7MbXio3+IyMP
   uK4/PPjO119Zm6BlGcmbxhxhR0XAtbKimhfMtjqrdE2yvHcMpyFoWwxjB
   TQGyD5Jq/FckJI1KrtMQGUlwQF7Ez2TRTIulZvVYSH3RkSnN8TTdaMqC9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="350390688"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="350390688"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 03:12:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="736365250"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="736365250"
Received: from bbattach-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.220.157])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 03:12:26 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com
Subject: [PATCH 5/5] ASoC: SOF: ipc4-loader/topology: Query the CPC value from
 manifest
Date: Mon, 22 May 2023 13:13:13 +0300
Message-Id: <20230522101313.12519-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230522101313.12519-1-peter.ujfalusi@linux.intel.com>
References: <20230522101313.12519-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: STNSVLCVJCU5PF6R3UQR5GF7YSGXANFU
X-Message-ID-Hash: STNSVLCVJCU5PF6R3UQR5GF7YSGXANFU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/STNSVLCVJCU5PF6R3UQR5GF7YSGXANFU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The manifest's firmware module configuration section contains the measured
CPC values along with a matching IBS/OBS values.

The CPC can be looked up by looking for a matching IBS/OBS entry.
In case of multiple matches we will use the highest CPC value.

If there is no mod_cfg or no CPC value (all 0) or no match was found then
print warning message and use 0 as CPC value.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-loader.c   | 65 +++++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-priv.h     |  6 ++++
 sound/soc/sof/ipc4-topology.c |  7 ++++
 3 files changed, 78 insertions(+)

diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index 3860d3455960..eaa04762eb11 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -423,6 +423,71 @@ int sof_ipc4_reload_fw_libraries(struct snd_sof_dev *sdev)
 	return ret;
 }
 
+/**
+ * sof_ipc4_update_cpc_from_manifest - Update the cpc in base config from manifest
+ * @sdev: SOF device
+ * @fw_module: pointer struct sof_ipc4_fw_module to parse
+ * @basecfg: Pointer to the base_config to update
+ */
+void sof_ipc4_update_cpc_from_manifest(struct snd_sof_dev *sdev,
+				       struct sof_ipc4_fw_module *fw_module,
+				       struct sof_ipc4_base_module_cfg *basecfg)
+{
+	const struct sof_man4_module_config *fw_mod_cfg;
+	u32 cpc_pick = 0;
+	u32 max_cpc = 0;
+	const char *msg;
+	int i;
+
+	if (!fw_module->fw_mod_cfg) {
+		msg = "No mod_cfg available for CPC lookup in the firmware file's manifest";
+		goto no_cpc;
+	}
+
+	/*
+	 * Find the best matching (highest) CPC value based on the module's
+	 * IBS/OBS configuration inferred from the audio format selection.
+	 *
+	 * The CPC value in each module config entry has been measured and
+	 * recorded as a IBS/OBS/CPC triplet and stored in the firmware file's
+	 * manifest
+	 */
+	fw_mod_cfg = fw_module->fw_mod_cfg;
+	for (i = 0; i < fw_module->man4_module_entry.cfg_count; i++) {
+		if (basecfg->obs == fw_mod_cfg[i].obs &&
+		    basecfg->ibs == fw_mod_cfg[i].ibs &&
+		    cpc_pick < fw_mod_cfg[i].cpc)
+			cpc_pick = fw_mod_cfg[i].cpc;
+
+		if (max_cpc < fw_mod_cfg[i].cpc)
+			max_cpc = fw_mod_cfg[i].cpc;
+	}
+
+	basecfg->cpc = cpc_pick;
+
+	/* We have a matching configuration for CPC */
+	if (basecfg->cpc)
+		return;
+
+	/*
+	 * No matching IBS/OBS found, the firmware manifest is missing
+	 * information in the module's module configuration table.
+	 */
+	if (!max_cpc)
+		msg = "No CPC value available in the firmware file's manifest";
+	else if (!cpc_pick)
+		msg = "No CPC match in the firmware file's manifest";
+
+no_cpc:
+	dev_warn(sdev->dev, "%s (UUID: %pUL): %s (ibs/obs: %u/%u)\n",
+		 fw_module->man4_module_entry.name,
+		 &fw_module->man4_module_entry.uuid, msg, basecfg->ibs,
+		 basecfg->obs);
+	dev_warn_once(sdev->dev, "Please try to update the firmware.\n");
+	dev_warn_once(sdev->dev, "If the issue persists, file a bug at\n");
+	dev_warn_once(sdev->dev, "https://github.com/thesofproject/sof/issues/\n");
+}
+
 const struct sof_ipc_fw_loader_ops ipc4_loader_ops = {
 	.validate = sof_ipc4_validate_firmware,
 	.parse_ext_manifest = sof_ipc4_fw_parse_basefw_ext_man,
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index 4b3495dc455d..a5d0b2eae464 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -114,4 +114,10 @@ int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev);
 int sof_ipc4_reload_fw_libraries(struct snd_sof_dev *sdev);
 struct sof_ipc4_fw_module *sof_ipc4_find_module_by_uuid(struct snd_sof_dev *sdev,
 							const guid_t *uuid);
+
+struct sof_ipc4_base_module_cfg;
+void sof_ipc4_update_cpc_from_manifest(struct snd_sof_dev *sdev,
+				       struct sof_ipc4_fw_module *fw_module,
+				       struct sof_ipc4_base_module_cfg *basecfg);
+
 #endif
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index bdfc76591f76..d5e6d7caaaa3 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -966,6 +966,13 @@ sof_ipc4_update_resource_usage(struct snd_sof_dev *sdev, struct snd_sof_widget *
 	pipe_widget = swidget->spipe->pipe_widget;
 	pipeline = pipe_widget->private;
 	pipeline->mem_usage += total;
+
+	/* Update base_config->cpc from the module manifest */
+	sof_ipc4_update_cpc_from_manifest(sdev, fw_module, base_config);
+
+	dev_dbg(sdev->dev, "%s: ibs / obs / cpc: %u / %u / %u\n",
+		swidget->widget->name, base_config->ibs, base_config->obs,
+		base_config->cpc);
 }
 
 static int sof_ipc4_widget_assign_instance_id(struct snd_sof_dev *sdev,
-- 
2.40.1

