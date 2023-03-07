Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFDB6ADDEE
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 12:48:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DC701448;
	Tue,  7 Mar 2023 12:48:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DC701448
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678189737;
	bh=r/sU/E7b5wsa73IBA9m15PzJf9Fl+jSWu5xbxRKqBLM=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=U2+maUd4DkeAZulfkpsqU90ksvQOYPFtRbfZUb1rpJtjb6vbe9GeZ7ORxxDBS3dIZ
	 E1sX22M6+PTmNHbOgAxNLPRrmIlFRPSdpg5cTf/K/fV0WnBtdF8ZaByyQFJrPeZnW5
	 S7nZo96nYvhtoru8MIaRwkw2denuCuefRFPpOYsI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D602AF80527;
	Tue,  7 Mar 2023 12:48:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73A3DF80529; Tue,  7 Mar 2023 12:48:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 471D2F80431
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 12:47:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 471D2F80431
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MEqIl2dC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678189678; x=1709725678;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=r/sU/E7b5wsa73IBA9m15PzJf9Fl+jSWu5xbxRKqBLM=;
  b=MEqIl2dCqdUEMOho6RBtxGsuhPUvqBQQj2ede1IoaEHNoh5yjPN/2+3O
   31pxzHhTG3ihi0WfYjNL/6BKq6P90aZiafpSC10vZrfQ8GjcVLiCQwuBG
   8F1ebbsg3agwkJq9mwk+3HeIrGsXoEQFaJC2/cRP0KWvFy51ptQRM5rOi
   eIltvvaknxS/8slzc8qzv2g+Ll4RQRFMmXmxwtMNMzTyzbhhQBlz4GyaC
   eo5JZJnveNM5f2eEriu7/FwWBb7td13Lg7pRZu/YBcfvFiUcuYe0QsHMG
   fA4FumHamwTGBcDYOhqilhq2eXfj3MhB95t1Jhdp4GjguQqLN891UYiTP
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="363455504"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="363455504"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:47:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="678908790"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="678908790"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:47:53 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: topology: Fix error handling in sof_widget_ready()
Date: Tue,  7 Mar 2023 13:48:15 +0200
Message-Id: <20230307114815.4909-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WOVLJXBJ3S2UFVOUUO2STPPDAR7P2E6F
X-Message-ID-Hash: WOVLJXBJ3S2UFVOUUO2STPPDAR7P2E6F
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WOVLJXBJ3S2UFVOUUO2STPPDAR7P2E6F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Fix the error paths in sof_widget_ready() to free all allocated memory
and prevent memory leaks.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/topology.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 4a62ccc71fcb..9f3a038fe21a 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1388,14 +1388,15 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	if (ret < 0) {
 		dev_err(scomp->dev, "failed to parse component pin tokens for %s\n",
 			w->name);
-		return ret;
+		goto widget_free;
 	}
 
 	if (swidget->num_sink_pins > SOF_WIDGET_MAX_NUM_PINS ||
 	    swidget->num_source_pins > SOF_WIDGET_MAX_NUM_PINS) {
 		dev_err(scomp->dev, "invalid pins for %s: [sink: %d, src: %d]\n",
 			swidget->widget->name, swidget->num_sink_pins, swidget->num_source_pins);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto widget_free;
 	}
 
 	if (swidget->num_sink_pins > 1) {
@@ -1404,7 +1405,7 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		if (ret < 0) {
 			dev_err(scomp->dev, "failed to parse sink pin binding for %s\n",
 				w->name);
-			return ret;
+			goto widget_free;
 		}
 	}
 
@@ -1414,7 +1415,7 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		if (ret < 0) {
 			dev_err(scomp->dev, "failed to parse source pin binding for %s\n",
 				w->name);
-			return ret;
+			goto widget_free;
 		}
 	}
 
@@ -1436,9 +1437,8 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	case snd_soc_dapm_dai_out:
 		dai = kzalloc(sizeof(*dai), GFP_KERNEL);
 		if (!dai) {
-			kfree(swidget);
-			return -ENOMEM;
-
+			ret = -ENOMEM;
+			goto widget_free;
 		}
 
 		ret = sof_widget_parse_tokens(scomp, swidget, tw, token_list, token_list_size);
@@ -1496,8 +1496,7 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 			tw->shift, swidget->id, tw->name,
 			strnlen(tw->sname, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) > 0
 				? tw->sname : "none");
-		kfree(swidget);
-		return ret;
+		goto widget_free;
 	}
 
 	if (sof_debug_check_flag(SOF_DBG_DISABLE_MULTICORE)) {
@@ -1518,10 +1517,7 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 			if (ret) {
 				dev_err(scomp->dev, "widget event binding failed for %s\n",
 					swidget->widget->name);
-				kfree(swidget->private);
-				kfree(swidget->tuples);
-				kfree(swidget);
-				return ret;
+				goto free;
 			}
 		}
 	}
@@ -1532,10 +1528,8 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 
 		spipe = kzalloc(sizeof(*spipe), GFP_KERNEL);
 		if (!spipe) {
-			kfree(swidget->private);
-			kfree(swidget->tuples);
-			kfree(swidget);
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto free;
 		}
 
 		spipe->pipe_widget = swidget;
@@ -1546,6 +1540,12 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 	w->dobj.private = swidget;
 	list_add(&swidget->list, &sdev->widget_list);
 	return ret;
+free:
+	kfree(swidget->private);
+	kfree(swidget->tuples);
+widget_free:
+	kfree(swidget);
+	return ret;
 }
 
 static int sof_route_unload(struct snd_soc_component *scomp,
-- 
2.39.2

