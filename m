Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F101421949
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 23:29:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDCF21674;
	Mon,  4 Oct 2021 23:28:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDCF21674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633382973;
	bh=jd17QAS4IaE4knp2zJld2Q40f7So2XIdlrSD/4vxEA4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OPnyXdQvdEAQDfpDG6/0v/ATr2yuYEMNvGnO+CeXehtEBzl3n7S+T+bsPBvWI0PY+
	 26UyWjRWxSiiusdSHFtZhvEBzLNfm2FcwUWD33eG3Vc6MylC8MNOM7FKyl0LZ/QLwu
	 5cxWIKZlQ6e/Gej6B4BIueOx5TjrsWuJerbzQxMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ADF0F80229;
	Mon,  4 Oct 2021 23:27:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 904E8F8025C; Mon,  4 Oct 2021 23:27:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72DAEF800BA
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 23:27:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72DAEF800BA
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="206410598"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="206410598"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 14:27:39 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="521586236"
Received: from ksgonzal-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.181.38])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 14:27:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: SOF: topology: allow for dynamic pipelines override
 for debug
Date: Mon,  4 Oct 2021 16:27:28 -0500
Message-Id: <20211004212729.199550-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004212729.199550-1-pierre-louis.bossart@linux.intel.com>
References: <20211004212729.199550-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Bard Liao <bard.liao@intel.com>
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

For debug and community support, it's useful to expose a kernel
parameter to prevent the use of dynamic pipelines exposed in a
topology file, or conversely to force an existing topology to use
dynamic pipelines.

Add an override bit and an enable bit which is valid only when the
override is set.

For products, the intent is that the topology file defines the
behavior, these two bits are only intended for diagnosis and
performance checks.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/sof-priv.h | 6 ++++++
 sound/soc/sof/topology.c | 9 +++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 5c8fd21d2c6c..6a9b76b40f79 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -24,6 +24,12 @@
 #define SOF_DBG_ENABLE_TRACE	BIT(0)
 #define SOF_DBG_RETAIN_CTX	BIT(1)	/* prevent DSP D3 on FW exception */
 #define SOF_DBG_VERIFY_TPLG	BIT(2) /* verify topology during load */
+#define SOF_DBG_DYNAMIC_PIPELINES_OVERRIDE	BIT(3) /* 0: use topology token
+							* 1: override topology
+							*/
+#define SOF_DBG_DYNAMIC_PIPELINES_ENABLE	BIT(4) /* 0: use static pipelines
+							* 1: use dynamic pipelines
+							*/
 
 #define SOF_DBG_DUMP_REGS		BIT(0)
 #define SOF_DBG_DUMP_MBOX		BIT(1)
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index bd0d82b91465..cc6a96b552d3 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1759,9 +1759,14 @@ static int sof_widget_load_pipeline(struct snd_soc_component *scomp, int index,
 		goto err;
 	}
 
-	dev_dbg(scomp->dev, "pipeline %s: period %d pri %d mips %d core %d frames %d\n",
+	if (sof_core_debug & SOF_DBG_DYNAMIC_PIPELINES_OVERRIDE)
+		swidget->dynamic_pipeline_widget = sof_core_debug &
+			SOF_DBG_DYNAMIC_PIPELINES_ENABLE;
+
+	dev_dbg(scomp->dev, "pipeline %s: period %d pri %d mips %d core %d frames %d dynamic %d\n",
 		swidget->widget->name, pipeline->period, pipeline->priority,
-		pipeline->period_mips, pipeline->core, pipeline->frames_per_sched);
+		pipeline->period_mips, pipeline->core, pipeline->frames_per_sched,
+		swidget->dynamic_pipeline_widget);
 
 	swidget->private = pipeline;
 
-- 
2.25.1

