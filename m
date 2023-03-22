Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CE76C4CCD
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 15:03:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0254E97;
	Wed, 22 Mar 2023 15:02:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0254E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679493817;
	bh=z8vuORf3Dxv2YVvg23SzBEb1uvF2n/ajmxOZQDutCck=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QKWxVbvN2T6Xos87UUTF0ufcAfbd+FeJMKo9GnXDX/wY8EwdebXQ6bcUn2kZUAU91
	 9yg3HviRx3L6z9PGCNcmEWwyeCjMfQOLv7Arm7BgAunlETptApec7scVHHCfwW3nMg
	 6D348v+26on7bhK5fbbtrg3i09lpPw3HGigRrGCg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87FE5F80571;
	Wed, 22 Mar 2023 15:01:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B68ADF80482; Wed, 22 Mar 2023 15:00:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4432AF80482
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 15:00:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4432AF80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=alM2OwwB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679493654; x=1711029654;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z8vuORf3Dxv2YVvg23SzBEb1uvF2n/ajmxOZQDutCck=;
  b=alM2OwwB6dpJ3NKL+ZLO20PdRWtuVpcDZW5eCQ+m4YqUZxReHzgWURD2
   tDxTk96V8I4pmL9zLseyPW5co6i/Ihty0UMhnBmyhnDH283XkLxfW+Z1q
   a81CuU8bgOt5sZtBHSUuU8VNBhUFr939g1By6m4W3qwsBVCq8q33bgkqY
   BKD8hbss93ICZqaSeipXo5z67UC2Q9XTTVBJw/xpo5taw3qUfn8Wv4Ndb
   7LYy6tM4hGSQKV54vzPXaDO/b4bq51zi3nHzX/DtCf2HCreHpRdics+uB
   3R3cSaNWAk77noyg433Q4k9gJwLDimoOhUDYzlqgueExAkIBaHAhgVFlD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="341576115"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400";
   d="scan'208";a="341576115"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 06:59:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="659197957"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400";
   d="scan'208";a="659197957"
Received: from cmelen-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.222.142])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 06:59:00 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 1/3] ASoC: SOF: topology: Set pipeline widget before
 updating IPC structures
Date: Wed, 22 Mar 2023 15:59:25 +0200
Message-Id: <20230322135927.7668-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230322135927.7668-1-peter.ujfalusi@linux.intel.com>
References: <20230322135927.7668-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7P34KV6ZSKMHVL5XJWB3ZRANEHN3MTY5
X-Message-ID-Hash: 7P34KV6ZSKMHVL5XJWB3ZRANEHN3MTY5
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 jyri.sarha@intel.com, rander.wang@intel.com, error27@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7P34KV6ZSKMHVL5XJWB3ZRANEHN3MTY5/>
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

