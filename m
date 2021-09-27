Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB0C4193D4
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 14:08:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DE6116AB;
	Mon, 27 Sep 2021 14:07:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DE6116AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632744484;
	bh=qsb8GF/KQguxNXgREHh/MpfvMz3gXNFHEQK9Quql2Zg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IGXYtUyWWKDDqkV9mr+MKLKnDD9mJDcwlnTN1I5EkWv7UFw/FOCTewtS1ngefu07J
	 esWKfIWWaUrohX7c55ZCww1gjnJH2U/hfKrfPYbezT8j8rU3dl8apKfvLIDe9OR6Vs
	 DBhlnuWtsqkOQmU1ZnoJeM4cJIQcVxzyk/fBumwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 335C3F804F1;
	Mon, 27 Sep 2021 14:05:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BE11F804E7; Mon, 27 Sep 2021 14:05:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E84F8F801F7
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 14:05:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E84F8F801F7
X-IronPort-AV: E=McAfee;i="6200,9189,10119"; a="221260486"
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="221260486"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 05:05:34 -0700
X-IronPort-AV: E=Sophos;i="5.85,326,1624345200"; d="scan'208";a="553164425"
Received: from unknown (HELO pujfalus-desk.ger.corp.intel.com)
 ([10.251.220.221])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 05:05:31 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com
Subject: [PATCH v3 06/12] ASoC: SOF: Add new fields to snd_sof_route
Date: Mon, 27 Sep 2021 15:05:11 +0300
Message-Id: <20210927120517.20505-7-peter.ujfalusi@linux.intel.com>
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

Add two new fields to save the source widget and sink widget
pointers in struct snd_sof_route to make it easier to look up
routes by source/sink widget. Also, add a flag to indicate
if the route has been set up in the DSP. These will be used
when the dynamic pipeline feature is implemented and routes
will have to be set up at run time.

Also, add a new sof_tear_down_pipelines() callback, that will
used to reset the set up status for all routes during suspend.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/pm.c        |  2 ++
 sound/soc/sof/sof-audio.c | 15 +++++++++++++++
 sound/soc/sof/sof-audio.h |  4 ++++
 sound/soc/sof/topology.c  |  3 +++
 4 files changed, 24 insertions(+)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index c83fb6255961..ce922227c4c6 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -208,6 +208,8 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 	if (target_state == SOF_DSP_PM_D0)
 		goto suspend;
 
+	sof_tear_down_pipelines(dev);
+
 	/* release trace */
 	snd_sof_release_trace(sdev);
 
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index a4b9bb99bced..b52a453ae9d7 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -276,6 +276,7 @@ int sof_restore_pipelines(struct device *dev)
 
 			return ret;
 		}
+		sroute->setup = true;
 	}
 
 	/* restore dai links */
@@ -317,6 +318,20 @@ int sof_restore_pipelines(struct device *dev)
 	return ret;
 }
 
+/* This function doesn't free widgets. It only resets the set up status for all routes */
+void sof_tear_down_pipelines(struct device *dev)
+{
+	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	struct snd_sof_route *sroute;
+
+	/*
+	 * No need to protect sroute->setup as this function is called only during the suspend
+	 * callback and all streams should be suspended by then
+	 */
+	list_for_each_entry(sroute, &sdev->route_list, list)
+		sroute->setup = false;
+}
+
 /*
  * Generic object lookup APIs.
  */
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 4a1c38c5618d..fe997a80a847 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -118,6 +118,9 @@ struct snd_sof_route {
 
 	struct snd_soc_dapm_route *route;
 	struct list_head list;	/* list in sdev route list */
+	struct snd_sof_widget *src_widget;
+	struct snd_sof_widget *sink_widget;
+	bool setup;
 
 	void *private;
 };
@@ -240,6 +243,7 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 
 /* PM */
 int sof_restore_pipelines(struct device *dev);
+void sof_tear_down_pipelines(struct device *dev);
 int sof_set_hw_params_upon_resume(struct device *dev);
 bool snd_sof_stream_suspend_ignored(struct snd_sof_dev *sdev);
 bool snd_sof_dsp_only_d0i3_compatible_stream_active(struct snd_sof_dev *sdev);
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 60d1db6a9193..58f966ab2e81 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -3501,6 +3501,9 @@ static int sof_route_load(struct snd_soc_component *scomp, int index,
 		sroute->route = route;
 		dobj->private = sroute;
 		sroute->private = connect;
+		sroute->src_widget = source_swidget;
+		sroute->sink_widget = sink_swidget;
+		sroute->setup = true;
 
 		/* add route to route list */
 		list_add(&sroute->list, &sdev->route_list);
-- 
2.33.0

