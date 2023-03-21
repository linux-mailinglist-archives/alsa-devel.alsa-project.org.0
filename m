Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D81046C2DE0
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 10:30:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 649941FA;
	Tue, 21 Mar 2023 10:29:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 649941FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679391028;
	bh=z8vuORf3Dxv2YVvg23SzBEb1uvF2n/ajmxOZQDutCck=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PJRER+JtI2L5O3gFE+6ziVSNHRew0wiIIgB+YReV0V3pMx1eLfHJd3bE7CWMSszrm
	 hC+8gMaV0ffL9Oikrhk/1PxXIBV86ANDyF64LmPNEkXQIKGLuXD3JKCpNUA5LxFe1o
	 PqKgtP+YqpnHxz2s4rSpNxRteuLThg19TlJwJW9U=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21BD3F80254;
	Tue, 21 Mar 2023 10:29:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC4D4F804B1; Tue, 21 Mar 2023 10:29:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F056EF800C9
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 10:26:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F056EF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DFW2zdGf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679390795; x=1710926795;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z8vuORf3Dxv2YVvg23SzBEb1uvF2n/ajmxOZQDutCck=;
  b=DFW2zdGf8oMD2QujhBYsDK85oeIM4EW8vMhMp+ZYeZX8nrIjyYPPW50B
   NPDApR4lLS2N0qgGa5Hukw00h3v06P7YwxueZ/dizpJ8/eNdGS0u0/ova
   nqGSt3DkPPGeWDbER+0fLFdESfOTTaxbu2R5Us8Le8cEzdXZJFwVVJnZa
   7CSoUnytWkt7dSGftdduImdvNOzCmAuC/B3CVjY8bYf2DsO58lFxIVARz
   7ECRgXYmPEoPh51qype5+jfh+UT+gFANNE214OzMfsnkjSrH0RFY35D/Z
   rfr8RRUUssV8UvORBinz1Ehlskw12tgqFFSkRV9x6+NZO4qhQv78G6Z5o
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="401462894"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400";
   d="scan'208";a="401462894"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 02:26:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="770559800"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400";
   d="scan'208";a="770559800"
Received: from markusbu-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.60.215])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 02:26:27 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 1/3] ASoC: SOF: topology: Set pipeline widget before updating
 IPC structures
Date: Tue, 21 Mar 2023 11:26:52 +0200
Message-Id: <20230321092654.7292-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321092654.7292-1-peter.ujfalusi@linux.intel.com>
References: <20230321092654.7292-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LQI5INIKU24RXTUCF7AZZYL5JIJWEV4Y
X-Message-ID-Hash: LQI5INIKU24RXTUCF7AZZYL5JIJWEV4Y
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 jyri.sarha@intel.com, rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LQI5INIKU24RXTUCF7AZZYL5JIJWEV4Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Set up the IPC structure for scheduler widgets and set the pipeline widget
before updating the IPC structures for all widgets. This will be needed to
look up pipeline information during IPC structure set up.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Jyri Sarha <jyri.sarha@intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/topology.c | 48 ++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index b642835e14df..bc8ca1e05b83 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2126,7 +2126,6 @@ static int sof_complete(struct snd_soc_component *scomp)
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
-	struct snd_sof_widget *swidget, *comp_swidget;
 	const struct sof_ipc_tplg_widget_ops *widget_ops;
 	struct snd_sof_control *scontrol;
 	struct snd_sof_pipeline *spipe;
@@ -2145,37 +2144,38 @@ static int sof_complete(struct snd_soc_component *scomp)
 			}
 		}
 
-	/*
-	 * then update all widget IPC structures. If any of the ipc_setup callbacks fail, the
-	 * topology will be removed and all widgets will be unloaded resulting in freeing all
-	 * associated memories.
-	 */
-	list_for_each_entry(swidget, &sdev->widget_list, list) {
-		if (widget_ops && widget_ops[swidget->id].ipc_setup) {
-			ret = widget_ops[swidget->id].ipc_setup(swidget);
+	/* set up the IPC structures for the pipeline widgets */
+	list_for_each_entry(spipe, &sdev->pipeline_list, list) {
+		struct snd_sof_widget *pipe_widget = spipe->pipe_widget;
+		struct snd_sof_widget *swidget;
+
+		/* Update the scheduler widget's IPC structure */
+		if (widget_ops && widget_ops[pipe_widget->id].ipc_setup) {
+			ret = widget_ops[pipe_widget->id].ipc_setup(pipe_widget);
 			if (ret < 0) {
 				dev_err(sdev->dev, "failed updating IPC struct for %s\n",
-					swidget->widget->name);
+					pipe_widget->widget->name);
 				return ret;
 			}
 		}
-	}
 
-	/* set the pipe_widget and apply the dynamic_pipeline_widget_flag */
-	list_for_each_entry(spipe, &sdev->pipeline_list, list) {
-		struct snd_sof_widget *pipe_widget = spipe->pipe_widget;
-
-		/*
-		 * Apply the dynamic_pipeline_widget flag and set the pipe_widget field
-		 * for all widgets that have the same pipeline ID as the scheduler widget.
-		 * Skip the scheduler widgets as they have their pipeline set during widget_ready
-		 */
-		list_for_each_entry(comp_swidget, &sdev->widget_list, list)
-			if (comp_swidget->widget->id != snd_soc_dapm_scheduler &&
-			    comp_swidget->pipeline_id == pipe_widget->pipeline_id) {
-				ret = sof_set_widget_pipeline(sdev, spipe, comp_swidget);
+		/* set the pipeline and update the IPC structure for the non scheduler widgets */
+		list_for_each_entry(swidget, &sdev->widget_list, list)
+			if (swidget->widget->id != snd_soc_dapm_scheduler &&
+			    swidget->pipeline_id == pipe_widget->pipeline_id) {
+				ret = sof_set_widget_pipeline(sdev, spipe, swidget);
 				if (ret < 0)
 					return ret;
+
+				if (widget_ops && widget_ops[swidget->id].ipc_setup) {
+					ret = widget_ops[swidget->id].ipc_setup(swidget);
+					if (ret < 0) {
+						dev_err(sdev->dev,
+							"failed updating IPC struct for %s\n",
+							swidget->widget->name);
+						return ret;
+					}
+				}
 			}
 	}
 
-- 
2.40.0

