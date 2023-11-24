Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D147F7750
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Nov 2023 16:09:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27FE2E8B;
	Fri, 24 Nov 2023 16:09:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27FE2E8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700838566;
	bh=sAbL/9fT4i9PcgRw+oqz5zY9NBNgphu0jOWdBEs6aj0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XYGOt3pc8Ofomz1AsBrYg0RUTMMiU0XLiXYbIunOH6giRp7YN8N+8Rd5u5YkIF3oS
	 9M0ppe98wO7MqpcaDfw9yaBRfCE5YBnhQpeg16UJzLffConerLql44iAa3kSLO+vLE
	 3VySs81v00CR0J0aNSPq73sNmskRrNQYgv3ynaCc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B296F805BB; Fri, 24 Nov 2023 16:08:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 373FCF805BA;
	Fri, 24 Nov 2023 16:08:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E620BF80549; Fri, 24 Nov 2023 16:08:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2659AF80166
	for <alsa-devel@alsa-project.org>; Fri, 24 Nov 2023 16:08:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2659AF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=HEsW1Adl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700838513; x=1732374513;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sAbL/9fT4i9PcgRw+oqz5zY9NBNgphu0jOWdBEs6aj0=;
  b=HEsW1Adlr2q+bqRLz+3eTzYI6RZG9f4pFaIYJOfUmKWXlmWiGO/36//j
   X+7BZGzcHiGgAUqbWLaJhQkNImwWSZy6mxM2Xqc4EzM/zcrlRjETkHm89
   zLHsckMmA3Z60QOee6gKRPxhFPYeXyZFb5fcI/5U+MJNBdJ+IrRAc4u/y
   zMEj7c0ma5upQVfCSSSQC+14epgRVwEuukb9ab/Tnj7PKNSnAQZdTBN4V
   m78vYU4+4WCwO2bC1qqME1al4zg/oRQAhpYcKpFRok1//EFgoFe4zXgFU
   fSwMGo7JOCbq+LXSebnUte4JhBy3yWJnfLnKz0NvKDV3pntEwkL+EWdqO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="377477036"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600";
   d="scan'208";a="377477036"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:08:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="743915676"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600";
   d="scan'208";a="743915676"
Received: from barumuga-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.182])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2023 07:08:23 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	seppo.ingalsuo@linux.intel.com
Subject: [PATCH 1/4] ASoC: SOF: ipc4-topology: Helper to find an swidget by
 module/instance id
Date: Fri, 24 Nov 2023 17:08:50 +0200
Message-ID: <20231124150853.18648-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231124150853.18648-1-peter.ujfalusi@linux.intel.com>
References: <20231124150853.18648-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EJKK52O6WNENOTWQCJN5WLOD37J6QFI2
X-Message-ID-Hash: EJKK52O6WNENOTWQCJN5WLOD37J6QFI2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EJKK52O6WNENOTWQCJN5WLOD37J6QFI2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The sof_ipc4_find_swidget_by_ids() can be used to find the swidget of a
module instance.
The lookup parameters are the module_id and the instance_id.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-priv.h     |  3 +++
 sound/soc/sof/ipc4-topology.c | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index 9e69b7c29117..fea93b693f4d 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -115,6 +115,9 @@ int sof_ipc4_reload_fw_libraries(struct snd_sof_dev *sdev);
 struct sof_ipc4_fw_module *sof_ipc4_find_module_by_uuid(struct snd_sof_dev *sdev,
 							const guid_t *uuid);
 
+struct snd_sof_widget *sof_ipc4_find_swidget_by_ids(struct snd_sof_dev *sdev,
+						    u32 module_id, int instance_id);
+
 struct sof_ipc4_base_module_cfg;
 void sof_ipc4_update_cpc_from_manifest(struct snd_sof_dev *sdev,
 				       struct sof_ipc4_fw_module *fw_module,
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index b24a64377f68..8ab9c42069ee 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -167,6 +167,26 @@ static const struct sof_token_info ipc4_token_list[SOF_TOKEN_COUNT] = {
 	[SOF_SRC_TOKENS] = {"SRC tokens", src_tokens, ARRAY_SIZE(src_tokens)},
 };
 
+struct snd_sof_widget *sof_ipc4_find_swidget_by_ids(struct snd_sof_dev *sdev,
+						    u32 module_id, int instance_id)
+{
+	struct snd_sof_widget *swidget;
+
+	list_for_each_entry(swidget, &sdev->widget_list, list) {
+		struct sof_ipc4_fw_module *fw_module = swidget->module_info;
+
+		/* Only active module instances have valid instance_id */
+		if (!swidget->use_count)
+			continue;
+
+		if (fw_module && fw_module->man4_module_entry.id == module_id &&
+		    swidget->instance_id == instance_id)
+			return swidget;
+	}
+
+	return NULL;
+}
+
 static void sof_ipc4_dbg_audio_format(struct device *dev, struct sof_ipc4_pin_format *pin_fmt,
 				      int num_formats)
 {
-- 
2.42.1

