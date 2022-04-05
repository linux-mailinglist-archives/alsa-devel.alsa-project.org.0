Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C0D4F3CDD
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 19:32:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8D5218A0;
	Tue,  5 Apr 2022 19:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8D5218A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649179964;
	bh=w6ihTMmO0+739+L/8YD+AvPhmgKxeqg3IDpgN28PkCE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BCuk9Zkbm82CkLDwuuNfD+MH5Km4F3ZnauuYkBOGbkf7u87MzS1xUVoKpcmTP1eID
	 Nipv88foaUVaVKt+FfwlZjlpLLwODcM3kgzkXV6c5vXiUiBS8XpXZJH9A8/iDggqMI
	 wyCa8DGARA81BZZLlM4sOfkcKtPn6/RxyviSrUwA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EF23F80589;
	Tue,  5 Apr 2022 19:27:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAAF2F8055A; Tue,  5 Apr 2022 19:27:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C17ACF80527
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 19:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C17ACF80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="X2x6k3r6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649179663; x=1680715663;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w6ihTMmO0+739+L/8YD+AvPhmgKxeqg3IDpgN28PkCE=;
 b=X2x6k3r6AJvY8eDg1dzGvDZ2zvl7RXErqUgb3SU1r9dzMTKcjvoXqIMW
 zWJVIriEXSMvMZC4Hi0A5NRXkP67hTpv+BfhvKuBWxKFg1MJJlIwdik2j
 CnqarY5oso5ctRyxcbMpJHt0uaXRkfZr+WdZUn1jCq+zKbBrxmTbhtfsb
 w2G7DpHZzIhGYAcbuKnVvh8XselBkkTigbdF0olvz9Z4hCba8RxBlwAMS
 jQAgeWsMMN5GqLXf5vH3pod0yeZjzHajcfjYJP/KVbgpuQb800RND9c4/
 mnfGjYE/PSYCeVJ0RUFH8PY3Q7UqZpr8fzGH7XOXyih2XbhwuiAsw8kEi Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="323986789"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="323986789"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:27 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="722141018"
Received: from reginari-mobl7.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.131])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:26 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 14/15] ASoC: SOF: sof-audio: Use the widget_kcontrol_setup ops
 for kcontrol set up
Date: Tue,  5 Apr 2022 10:27:07 -0700
Message-Id: <20220405172708.122168-15-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405172708.122168-1-ranjani.sridharan@linux.intel.com>
References: <20220405172708.122168-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Remove the local implementation and switch to the IPC neutral ops to
set up the kcontrols associated with the swidget.

The set up call uses snd_sof_ipc_set_get_comp_data() which is largely an
IPC3 parsing function.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 54 +++------------------------------------
 1 file changed, 4 insertions(+), 50 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 49fdfe06a9a3..c0a442272ad6 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -12,51 +12,6 @@
 #include "sof-audio.h"
 #include "ops.h"
 
-static int sof_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol)
-{
-	int ret;
-
-	ret = snd_sof_ipc_set_get_comp_data(scontrol, true);
-	if (ret < 0)
-		dev_err(sdev->dev, "error: failed kcontrol value set for widget: %d\n",
-			scontrol->comp_id);
-
-	return ret;
-}
-
-static int sof_widget_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
-{
-	struct snd_sof_control *scontrol;
-	int ret;
-
-	/* set up all controls for the widget */
-	list_for_each_entry(scontrol, &sdev->kcontrol_list, list)
-		if (scontrol->comp_id == swidget->comp_id) {
-			/* set kcontrol data in DSP */
-			ret = sof_kcontrol_setup(sdev, scontrol);
-			if (ret < 0) {
-				dev_err(sdev->dev, "error: fail to set up kcontrols for widget %s\n",
-					swidget->widget->name);
-				return ret;
-			}
-
-			/*
-			 * Read back the data from the DSP for static widgets. This is particularly
-			 * useful for binary kcontrols associated with static pipeline widgets to
-			 * initialize the data size to match that in the DSP.
-			 */
-			if (swidget->dynamic_pipeline_widget)
-				continue;
-
-			ret = snd_sof_ipc_set_get_comp_data(scontrol, false);
-			if (ret < 0)
-				dev_warn(sdev->dev, "Failed kcontrol get for control in widget %s\n",
-					 swidget->widget->name);
-		}
-
-	return 0;
-}
-
 static void sof_reset_route_setup_status(struct snd_sof_dev *sdev, struct snd_sof_widget *widget)
 {
 	struct snd_sof_route *sroute;
@@ -176,11 +131,10 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	}
 
 	/* restore kcontrols for widget */
-	ret = sof_widget_kcontrol_setup(sdev, swidget);
-	if (ret < 0) {
-		dev_err(sdev->dev, "error: failed to restore kcontrols for widget %s\n",
-			swidget->widget->name);
-		goto widget_free;
+	if (tplg_ops->control->widget_kcontrol_setup) {
+		ret = tplg_ops->control->widget_kcontrol_setup(sdev, swidget);
+		if (ret < 0)
+			goto widget_free;
 	}
 
 	dev_dbg(sdev->dev, "widget %s setup complete\n", swidget->widget->name);
-- 
2.25.1

