Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AE25763E0
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 16:54:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B4F91906;
	Fri, 15 Jul 2022 16:53:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B4F91906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657896866;
	bh=gWtVptkaALOxSAlnOR2YDyUzmsGfWKaOXU5/P6w4bWA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S+FGYttrBC/hVZ4lcYDPrAp8i3P5dUiYM5kqjOY9i9LEjrjQ7/X+OBG2TnCGGNPFM
	 bUgBMdjP0K3wL7lk5qd3QIIIprF9mT0D8cXHfy1sCxUqgw8D43LwER/QkhF7x9Tfuu
	 5nWwvNl0ZgcrXPj13vRn8F/Yhk0Nlz9bUWy9L0Ug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AE43F80548;
	Fri, 15 Jul 2022 16:53:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F415F80544; Fri, 15 Jul 2022 16:52:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94AD5F8014E
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 16:52:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94AD5F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nBgwQWca"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657896772; x=1689432772;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gWtVptkaALOxSAlnOR2YDyUzmsGfWKaOXU5/P6w4bWA=;
 b=nBgwQWcaEs+5hvZkHsO179prsroPXPJN4wfYuxvntGoJCjV8246jerx+
 yLv3klxhgedVB4qRD1ts9iqTNO1vpVQvTIwdMZAuoijZUel15aeEh2oqK
 URbqkr5gO9L4iWNOdRuavVpnNzn4XRe84wb4l8miR8W/AvW8+TsWG3mnf
 pdBjCsQhs0NAqF3Wxuk0OPZk8RqZ6TxqW8Zz9AHXww7w9AwtBhmbUYl7k
 dDUD1W8WouK7vqrxg3hFKklVoZCoLNC1FO26Se3VVvb7mIiaVw0l+dawB
 0UszZzqLIKRn0PABw+XfPjv5Z0h7U2cZT6eZnUjGaH90Esa29li6wH+V5 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="311476903"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="311476903"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:52:31 -0700
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="923533105"
Received: from jmurope-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.14.184])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:52:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/11] ASoC: SOF: ipc4-topology: move ida allocate/free to
 widget_setup/free
Date: Fri, 15 Jul 2022 09:52:07 -0500
Message-Id: <20220715145216.277003-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220715145216.277003-1-pierre-louis.bossart@linux.intel.com>
References: <20220715145216.277003-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The existing code allocate/release instance_id in widget ipc_prepare/
ipc_unprepare callbacks and creating widget with the instance_id in
tplg widget_setup callback. In the case of multiple widgets connecting
to one widget, the ipc_unprepare will be invoked for all the widgets
in the path including the widget which is still in use.
As a result, the instance_id is released in the ipc_unprepare callback,
but the widget is still in use and the instance_id will be reused by
a new widget when we start the PCM again.
Moving the ida work from ipc_prepare/ipc_unprepare to widget_setup/free
can avoid such problem.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 36 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 22ea628d78d0..f77091918118 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -891,7 +891,6 @@ static int sof_ipc4_init_audio_fmt(struct snd_sof_dev *sdev,
 
 static void sof_ipc4_unprepare_copier_module(struct snd_sof_widget *swidget)
 {
-	struct sof_ipc4_fw_module *fw_module = swidget->module_info;
 	struct sof_ipc4_copier *ipc4_copier = NULL;
 	struct snd_sof_widget *pipe_widget;
 	struct sof_ipc4_pipeline *pipeline;
@@ -925,8 +924,6 @@ static void sof_ipc4_unprepare_copier_module(struct snd_sof_widget *swidget)
 		ipc4_copier->ipc_config_data = NULL;
 		ipc4_copier->ipc_config_size = 0;
 	}
-
-	ida_free(&fw_module->m_ida, swidget->instance_id);
 }
 
 #if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_INTEL_NHLT)
@@ -1254,15 +1251,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	/* update pipeline memory usage */
 	sof_ipc4_update_pipeline_mem_usage(sdev, swidget, &copier_data->base_config);
 
-	/* assign instance ID */
-	return sof_ipc4_widget_assign_instance_id(sdev, swidget);
-}
-
-static void sof_ipc4_unprepare_generic_module(struct snd_sof_widget *swidget)
-{
-	struct sof_ipc4_fw_module *fw_module = swidget->module_info;
-
-	ida_free(&fw_module->m_ida, swidget->instance_id);
+	return 0;
 }
 
 static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
@@ -1287,8 +1276,7 @@ static int sof_ipc4_prepare_gain_module(struct snd_sof_widget *swidget,
 	/* update pipeline memory usage */
 	sof_ipc4_update_pipeline_mem_usage(sdev, swidget, &gain->base_config);
 
-	/* assign instance ID */
-	return sof_ipc4_widget_assign_instance_id(sdev, swidget);
+	return 0;
 }
 
 static int sof_ipc4_prepare_mixer_module(struct snd_sof_widget *swidget,
@@ -1314,8 +1302,7 @@ static int sof_ipc4_prepare_mixer_module(struct snd_sof_widget *swidget,
 	/* update pipeline memory usage */
 	sof_ipc4_update_pipeline_mem_usage(sdev, swidget, &mixer->base_config);
 
-	/* assign instance ID */
-	return sof_ipc4_widget_assign_instance_id(sdev, swidget);
+	return 0;
 }
 
 static int sof_ipc4_control_load_volume(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol)
@@ -1373,8 +1360,6 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 	u32 ipc_size = 0;
 	int ret;
 
-	dev_dbg(sdev->dev, "Create widget %s instance %d - pipe %d - core %d\n",
-		swidget->widget->name, swidget->instance_id, swidget->pipeline_id, swidget->core);
 
 	switch (swidget->id) {
 	case snd_soc_dapm_scheduler:
@@ -1436,6 +1421,12 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 	}
 
 	if (swidget->id != snd_soc_dapm_scheduler) {
+		ret = sof_ipc4_widget_assign_instance_id(sdev, swidget);
+		if (ret < 0) {
+			dev_err(sdev->dev, "failed to assign instance id for %s\n",
+				swidget->widget->name);
+			return ret;
+		}
 		pipeline = pipe_widget->private;
 		msg->primary &= ~SOF_IPC4_MOD_INSTANCE_MASK;
 		msg->primary |= SOF_IPC4_MOD_INSTANCE(swidget->instance_id);
@@ -1445,6 +1436,8 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 		msg->extension &= ~SOF_IPC4_MOD_EXT_DOMAIN_MASK;
 		msg->extension |= SOF_IPC4_MOD_EXT_DOMAIN(pipeline->lp_mode);
 	}
+	dev_dbg(sdev->dev, "Create widget %s instance %d - pipe %d - core %d\n",
+		swidget->widget->name, swidget->instance_id, swidget->pipeline_id, swidget->core);
 
 	msg->data_size = ipc_size;
 	msg->data_ptr = ipc_data;
@@ -1458,6 +1451,7 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 
 static int sof_ipc4_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
+	struct sof_ipc4_fw_module *fw_module = swidget->module_info;
 	int ret = 0;
 
 	/* freeing a pipeline frees all the widgets associated with it */
@@ -1480,6 +1474,8 @@ static int sof_ipc4_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget
 
 		pipeline->mem_usage = 0;
 		pipeline->state = SOF_IPC4_PIPE_UNINITIALIZED;
+	} else {
+		ida_free(&fw_module->m_ida, swidget->instance_id);
 	}
 
 	return ret;
@@ -1789,11 +1785,11 @@ static const struct sof_ipc_tplg_widget_ops tplg_ipc4_widget_ops[SND_SOC_DAPM_TY
 	[snd_soc_dapm_pga] = {sof_ipc4_widget_setup_comp_pga, sof_ipc4_widget_free_comp_pga,
 			      pga_token_list, ARRAY_SIZE(pga_token_list), NULL,
 			      sof_ipc4_prepare_gain_module,
-			      sof_ipc4_unprepare_generic_module},
+			      NULL},
 	[snd_soc_dapm_mixer] = {sof_ipc4_widget_setup_comp_mixer, sof_ipc4_widget_free_comp_mixer,
 				mixer_token_list, ARRAY_SIZE(mixer_token_list),
 				NULL, sof_ipc4_prepare_mixer_module,
-				sof_ipc4_unprepare_generic_module},
+				NULL},
 };
 
 const struct sof_ipc_tplg_ops ipc4_tplg_ops = {
-- 
2.34.1

