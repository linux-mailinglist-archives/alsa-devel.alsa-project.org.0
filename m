Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E427B4193D5
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 14:08:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 762C116AE;
	Mon, 27 Sep 2021 14:07:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 762C116AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632744507;
	bh=9aF7RI4Kh+mDDmRNAcSfgnYtiDWznWcquqV8UOm5oec=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UjQqYwnJYsUhsv4Dhh/FY7zI8HjPxBjzQaqVH/domqTbmCWQCn/mTsgI5LwHFwu+V
	 uk5EwCRNnf4ZZMlr7j+NERgutACFyjrQ84LaQOIc4ovoVoPD7TvAiQmoOx+AtcdSh0
	 PP5WbQjPlLgiKqec8v7qX1+sK4KnHBr89wk4toQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9695F80507;
	Mon, 27 Sep 2021 14:05:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED0B3F804F1; Mon, 27 Sep 2021 14:05:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39C9AF80147
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 14:05:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39C9AF80147
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="221260493"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="221260493"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 05:05:36 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="553164432"
Received: from unknown (HELO pujfalus-desk.ger.corp.intel.com)
 ([10.251.220.221])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 05:05:34 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com
Subject: [PATCH v3 07/12] ASoC: SOF: restore kcontrols for widget during set up
Date: Mon, 27 Sep 2021 15:05:12 +0300
Message-Id: <20210927120517.20505-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210927120517.20505-1-peter.ujfalusi@linux.intel.com>
References: <20210927120517.20505-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 seppo.ingalsuo@intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Restore kcontrols for each widget after it has been set up
successfully.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Seppo Ingalsuo <seppo.ingalsuo@intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 59 ++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 26 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index b52a453ae9d7..b27760208a4b 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -64,6 +64,25 @@ static int sof_dai_config_setup(struct snd_sof_dev *sdev, struct snd_sof_dai *da
 	return ret;
 }
 
+static int sof_widget_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
+{
+	struct snd_sof_control *scontrol;
+	int ret;
+
+	/* set up all controls for the widget */
+	list_for_each_entry(scontrol, &sdev->kcontrol_list, list)
+		if (scontrol->comp_id == swidget->comp_id) {
+			ret = sof_kcontrol_setup(sdev, scontrol);
+			if (ret < 0) {
+				dev_err(sdev->dev, "error: fail to set up kcontrols for widget %s\n",
+					swidget->widget->name);
+				return ret;
+			}
+		}
+
+	return 0;
+}
+
 static int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
 	struct sof_ipc_pipe_new *pipeline;
@@ -113,10 +132,20 @@ static int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swi
 					 &r, sizeof(r));
 		break;
 	}
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(sdev->dev, "error: failed to load widget %s\n", swidget->widget->name);
-	else
-		dev_dbg(sdev->dev, "widget %s setup complete\n", swidget->widget->name);
+		return ret;
+	}
+
+	/* restore kcontrols for widget */
+	ret = sof_widget_kcontrol_setup(sdev, swidget);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to restore kcontrols for widget %s\n",
+			swidget->widget->name);
+		return ret;
+	}
+
+	dev_dbg(sdev->dev, "widget %s setup complete\n", swidget->widget->name);
 
 	return ret;
 }
@@ -203,22 +232,6 @@ int sof_set_hw_params_upon_resume(struct device *dev)
 	return snd_sof_dsp_hw_params_upon_resume(sdev);
 }
 
-static int sof_restore_kcontrols(struct device *dev)
-{
-	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
-	struct snd_sof_control *scontrol;
-	int ret = 0;
-
-	/* restore kcontrol values */
-	list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
-		ret = sof_kcontrol_setup(sdev, scontrol);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
 const struct sof_ipc_pipe_new *snd_sof_pipeline_find(struct snd_sof_dev *sdev,
 						     int pipeline_id)
 {
@@ -309,13 +322,7 @@ int sof_restore_pipelines(struct device *dev)
 		}
 	}
 
-	/* restore pipeline kcontrols */
-	ret = sof_restore_kcontrols(dev);
-	if (ret < 0)
-		dev_err(dev,
-			"error: restoring kcontrols after resume\n");
-
-	return ret;
+	return 0;
 }
 
 /* This function doesn't free widgets. It only resets the set up status for all routes */
-- 
2.33.0

