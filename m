Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3329A4193D7
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 14:09:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B001516C6;
	Mon, 27 Sep 2021 14:08:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B001516C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632744548;
	bh=0qEzkWrsDNW++5R14Yg79yrs9vbv0AzyWX9pcnIvTXM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tSRiLWTLNdiIO0/946eG4W0R3GCIg+zwMAbKWl1JB5WdlRidabs9nej5FOovFdrJk
	 q0JdYeVHsy19sddcr249oMJSajuK1YFIpLEbFX1dLbJrdC1SqiLPDVqeRoRVjQAjwu
	 ZQlEBzCsLrOL/dZpum61jfko4lcfusl1bPx+ZzP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED277F80519;
	Mon, 27 Sep 2021 14:05:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75E9DF80511; Mon, 27 Sep 2021 14:05:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7982F804E4
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 14:05:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7982F804E4
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="221260508"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="221260508"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 05:05:42 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="553164444"
Received: from unknown (HELO pujfalus-desk.ger.corp.intel.com)
 ([10.251.220.221])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 05:05:39 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com
Subject: [PATCH v3 09/12] ASoC: SOF: Introduce widget use_count
Date: Mon, 27 Sep 2021 15:05:14 +0300
Message-Id: <20210927120517.20505-10-peter.ujfalusi@linux.intel.com>
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

Add a new field, use_count to struct snd_sof_widget to keep track
of the usage count for each widget. Since widgets can belong to
multiple pipelines, this field will ensure that the widget
is setup only when the first pipeline that needs it is started
and freed when the last pipeline that needs it is stopped. There is
no need to protect the widget use_count access as the core already
handles mutual exclusion at the PCM level.
Add a new helper sof_widget_free() to handle freeing the SOF
widgets and export the sof_widget_setup/free() functions.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc.c       | 22 +++++++++++
 sound/soc/sof/sof-audio.c | 77 ++++++++++++++++++++++++++++++++++++---
 sound/soc/sof/sof-audio.h |  4 ++
 3 files changed, 97 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 5d41924f37a6..ecb424161e80 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -719,9 +719,31 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
 	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
 	struct sof_ipc_fw_version *v = &ready->version;
 	struct sof_ipc_ctrl_data_params sparams;
+	struct snd_sof_widget *swidget;
+	bool widget_found = false;
 	size_t send_bytes;
 	int err;
 
+	list_for_each_entry(swidget, &sdev->widget_list, list) {
+		if (swidget->comp_id == scontrol->comp_id) {
+			widget_found = true;
+			break;
+		}
+	}
+
+	if (!widget_found) {
+		dev_err(sdev->dev, "error: can't find widget with id %d\n", scontrol->comp_id);
+		return -EINVAL;
+	}
+
+	/*
+	 * Volatile controls should always be part of static pipelines and the widget use_count
+	 * would always be > 0 in this case. For the others, just return the cached value if the
+	 * widget is not set up.
+	 */
+	if (!swidget->use_count)
+		return 0;
+
 	/* read or write firmware volume */
 	if (scontrol->readback_offset != 0) {
 		/* write/read value header via mmaped region */
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 4bed50847f1d..7a4aaabf091e 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -83,7 +83,53 @@ static int sof_widget_kcontrol_setup(struct snd_sof_dev *sdev, struct snd_sof_wi
 	return 0;
 }
 
-static int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
+int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
+{
+	struct sof_ipc_free ipc_free = {
+		.hdr = {
+			.size = sizeof(ipc_free),
+			.cmd = SOF_IPC_GLB_TPLG_MSG,
+		},
+		.id = swidget->comp_id,
+	};
+	struct sof_ipc_reply reply;
+	int ret;
+
+	if (!swidget->private)
+		return 0;
+
+	/* only free when use_count is 0 */
+	if (--swidget->use_count)
+		return 0;
+
+	switch (swidget->id) {
+	case snd_soc_dapm_scheduler:
+		ipc_free.hdr.cmd |= SOF_IPC_TPLG_PIPE_FREE;
+		break;
+	case snd_soc_dapm_buffer:
+		ipc_free.hdr.cmd |= SOF_IPC_TPLG_BUFFER_FREE;
+		break;
+	default:
+		ipc_free.hdr.cmd |= SOF_IPC_TPLG_COMP_FREE;
+		break;
+	}
+
+	ret = sof_ipc_tx_message(sdev->ipc, ipc_free.hdr.cmd, &ipc_free, sizeof(ipc_free),
+				 &reply, sizeof(reply));
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to free widget %s\n", swidget->widget->name);
+		swidget->use_count++;
+		return ret;
+	}
+
+	swidget->complete = 0;
+	dev_dbg(sdev->dev, "widget %s freed\n", swidget->widget->name);
+
+	return 0;
+}
+EXPORT_SYMBOL(sof_widget_free);
+
+int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
 	struct sof_ipc_pipe_new *pipeline;
 	struct sof_ipc_comp_reply r;
@@ -97,11 +143,15 @@ static int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swi
 	if (!swidget->private)
 		return 0;
 
+	/* widget already set up */
+	if (++swidget->use_count > 1)
+		return 0;
+
 	ret = sof_pipeline_core_enable(sdev, swidget);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: failed to enable target core: %d for widget %s\n",
 			ret, swidget->widget->name);
-		return ret;
+		goto use_count_dec;
 	}
 
 	switch (swidget->id) {
@@ -134,7 +184,7 @@ static int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swi
 	}
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: failed to load widget %s\n", swidget->widget->name);
-		return ret;
+		goto use_count_dec;
 	}
 
 	/* restore kcontrols for widget */
@@ -147,8 +197,13 @@ static int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swi
 
 	dev_dbg(sdev->dev, "widget %s setup complete\n", swidget->widget->name);
 
+	return 0;
+
+use_count_dec:
+	swidget->use_count--;
 	return ret;
 }
+EXPORT_SYMBOL(sof_widget_setup);
 
 /*
  * helper to determine if there are only D0i3 compatible
@@ -258,6 +313,9 @@ int sof_set_up_pipelines(struct device *dev)
 
 	/* restore pipeline components */
 	list_for_each_entry_reverse(swidget, &sdev->widget_list, list) {
+		/* reset widget use_count after resuming */
+		swidget->use_count = 0;
+
 		ret = sof_widget_setup(sdev, swidget);
 		if (ret < 0)
 			return ret;
@@ -325,16 +383,23 @@ int sof_set_up_pipelines(struct device *dev)
 	return 0;
 }
 
-/* This function doesn't free widgets. It only resets the set up status for all routes */
+/*
+ * This function doesn't free widgets. It only resets the set up status for all routes and
+ * use_count for all widgets.
+ */
 void sof_tear_down_pipelines(struct device *dev)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	struct snd_sof_widget *swidget;
 	struct snd_sof_route *sroute;
 
 	/*
-	 * No need to protect sroute->setup as this function is called only during the suspend
-	 * callback and all streams should be suspended by then
+	 * No need to protect swidget->use_count and sroute->setup as this function is called only
+	 * during the suspend callback and all streams should be suspended by then
 	 */
+	list_for_each_entry(swidget, &sdev->widget_list, list)
+		swidget->use_count = 0;
+
 	list_for_each_entry(sroute, &sdev->route_list, list)
 		sroute->setup = false;
 }
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index f1f630028c21..6ac623137026 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -89,6 +89,7 @@ struct snd_sof_widget {
 	int comp_id;
 	int pipeline_id;
 	int complete;
+	int use_count; /* use_count will be protected by the PCM mutex held by the core */
 	int core;
 	int id;
 
@@ -252,4 +253,7 @@ bool snd_sof_dsp_only_d0i3_compatible_stream_active(struct snd_sof_dev *sdev);
 int sof_machine_register(struct snd_sof_dev *sdev, void *pdata);
 void sof_machine_unregister(struct snd_sof_dev *sdev, void *pdata);
 
+int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget);
+int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget);
+
 #endif
-- 
2.33.0

