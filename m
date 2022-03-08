Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C4B4D1DB4
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 17:47:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3666C1849;
	Tue,  8 Mar 2022 17:46:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3666C1849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646758057;
	bh=gC4hrOalaSWk2r0Ak+fB4dqt0ep0xnxf0zpjcz0cRlQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AomOp2DQ1oR1E5fS7dmzQ8ZiOIcWGQC60FQSsj2v8bVi9JaL8KR7+PyBNvepgZCkY
	 niaSLqkx5wPVTuYfIbcBClNv0Fw21wNbFSAf7h5CIWuJFRxV5WPokG98VHPUzYKHg/
	 mZzEPGwwceAM4sOsyXyXymlB4ApNhvuSR4jnMyfY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BF9FF80529;
	Tue,  8 Mar 2022 17:44:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27988F8052E; Tue,  8 Mar 2022 17:44:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84DE4F80279
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 17:44:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84DE4F80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TdL1wRcm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646757850; x=1678293850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gC4hrOalaSWk2r0Ak+fB4dqt0ep0xnxf0zpjcz0cRlQ=;
 b=TdL1wRcm30Nh4y8+cxqgBVWeUuC+ISKN+HZDKGnASpx4Ej5mLK4XOGP7
 Id1eW30bLCfjywtGcZTZ8JU1ryBbyjYpPCqZwv/suax8COiHeJmhDzba5
 DvH0A41OQSxeL4oxiOgxbSmL+aZuLyz/7TueOARL0mRgNWbPpCxNYj0OO
 8xSQkDAaSLxVkbQNG75UZaBEtiadWjQzRnNfAQho1fi/8z8K2zYsrgDpX
 omFs6oKnnScelgCG0yj5kk8REoEbBN/JSZ01vpephjMaDnZk0c6guhEpZ
 2YMvmPptSwu4A4111VKLMwK25fDN4Q2rhohEznIHs75HvOa2kuhTdgXf1 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="252307209"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="252307209"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:43:53 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="537633219"
Received: from bustam3x-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.251.130.225])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 08:43:52 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 03/18] ASoC: SOF: set swidget's core for scheduler widget
Date: Tue,  8 Mar 2022 08:43:29 -0800
Message-Id: <20220308164344.577647-4-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
References: <20220308164344.577647-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Set the swidget's core for scheduler type widgets to match that of the
pipeline core. This simplifies the flow for core get/put during widget
setup/free.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 23 +++++------------------
 sound/soc/sof/topology.c  |  1 +
 2 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index ac1edb4a082d..4816473cfd7d 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -103,7 +103,7 @@ int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 		.id = swidget->comp_id,
 	};
 	struct sof_ipc_reply reply;
-	int ret, ret1, core;
+	int ret, ret1;
 
 	if (!swidget->private)
 		return 0;
@@ -112,14 +112,9 @@ int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	if (--swidget->use_count)
 		return 0;
 
-	core = swidget->core;
-
 	switch (swidget->id) {
 	case snd_soc_dapm_scheduler:
 	{
-		const struct sof_ipc_pipe_new *pipeline = swidget->private;
-
-		core = pipeline->core;
 		ipc_free.hdr.cmd |= SOF_IPC_TPLG_PIPE_FREE;
 		break;
 	}
@@ -149,10 +144,10 @@ int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	 * disable widget core. continue to route setup status and complete flag
 	 * even if this fails and return the appropriate error
 	 */
-	ret1 = snd_sof_dsp_core_put(sdev, core);
+	ret1 = snd_sof_dsp_core_put(sdev, swidget->core);
 	if (ret1 < 0) {
 		dev_err(sdev->dev, "error: failed to disable target core: %d for widget %s\n",
-			core, swidget->widget->name);
+			swidget->core, swidget->widget->name);
 		if (!ret)
 			ret = ret1;
 	}
@@ -177,7 +172,6 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	struct snd_sof_dai *dai;
 	size_t ipc_size;
 	int ret;
-	int core;
 
 	/* skip if there is no private data */
 	if (!swidget->private)
@@ -187,15 +181,8 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	if (++swidget->use_count > 1)
 		return 0;
 
-	/* set core ID */
-	core = swidget->core;
-	if (swidget->id == snd_soc_dapm_scheduler) {
-		pipeline = swidget->private;
-		core = pipeline->core;
-	}
-
 	/* enable widget core */
-	ret = snd_sof_dsp_core_get(sdev, core);
+	ret = snd_sof_dsp_core_get(sdev, swidget->core);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: failed to enable target core for widget %s\n",
 			swidget->widget->name);
@@ -275,7 +262,7 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	return 0;
 
 core_put:
-	snd_sof_dsp_core_put(sdev, core);
+	snd_sof_dsp_core_put(sdev, swidget->core);
 use_count_dec:
 	swidget->use_count--;
 	return ret;
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 1d119d1dd69d..add0b3009588 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1707,6 +1707,7 @@ static int sof_widget_load_pipeline(struct snd_soc_component *scomp, int index,
 		pipeline->period_mips, pipeline->core, pipeline->frames_per_sched,
 		swidget->dynamic_pipeline_widget);
 
+	swidget->core = pipeline->core;
 	swidget->private = pipeline;
 
 	return 0;
-- 
2.25.1

