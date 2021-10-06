Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 536FA423BFF
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 13:08:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61FF0166B;
	Wed,  6 Oct 2021 13:07:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61FF0166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633518517;
	bh=Xz7dmKXOK/c9tgZEk03Y43V2bOOQ+PFAqcyZpFZ1Z6o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cVaK8ZKCY+2Zl1OTyeaWtmOXdlj4gTZKjZgkmEgpAK94426sdNMMA48DfXgTXnoCf
	 bxgJGYAD6dFVxX+iD3EK224+9ewiSYY4jR/ai13Y95ufHJl1CxlMfFSirPBTBf7TlF
	 c65WvXmbN3RjPY3RJmD9RcscY0azOh0HGZdlKxKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0B28F804E5;
	Wed,  6 Oct 2021 13:06:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C20A4F800FE; Wed,  6 Oct 2021 13:06:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92CF2F800FE
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 13:06:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92CF2F800FE
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="223366418"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="223366418"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 04:06:43 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="439080924"
Received: from byurovit-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.39.239])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 04:06:40 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 01/19] ASoC: SOF: core: debug: force all processing on primary
 core
Date: Wed,  6 Oct 2021 14:06:27 +0300
Message-Id: <20211006110645.26679-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006110645.26679-1-peter.ujfalusi@linux.intel.com>
References: <20211006110645.26679-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The topology file currently provides information on which
pipeline/processing is to be scheduled on which DSP core.

To help diagnose potential issues, this patch provides an override of
the 'core' tokens to use the primary core (typically core0). Of course
this may result in a Core0 activity that exceeds hardware
capabilities, so this should only be used when the total processing
fits on DSP - possibly using firmware mockup processing and stubs.

No new dmesg log was added to avoid adding noise during topology
parsing, but the existing logs will show the primary core being used.

This is strictly for validation/debug, products should NEVER use this
override, the topology is assumed to be the description of the
firmware graph.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-priv.h | 3 +++
 sound/soc/sof/topology.c | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 4e5bab838cbf..0ca64f0f8873 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -30,6 +30,9 @@
 #define SOF_DBG_DYNAMIC_PIPELINES_ENABLE	BIT(4) /* 0: use static pipelines
 							* 1: use dynamic pipelines
 							*/
+#define SOF_DBG_DISABLE_MULTICORE		BIT(5) /* schedule all pipelines/widgets
+							* on primary core
+							*/
 
 #define SOF_DBG_DUMP_REGS		BIT(0)
 #define SOF_DBG_DUMP_MBOX		BIT(1)
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 534f004f6162..73c0ee7b88ac 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1759,6 +1759,9 @@ static int sof_widget_load_pipeline(struct snd_soc_component *scomp, int index,
 		goto err;
 	}
 
+	if (sof_core_debug & SOF_DBG_DISABLE_MULTICORE)
+		pipeline->core = SOF_DSP_PRIMARY_CORE;
+
 	if (sof_core_debug & SOF_DBG_DYNAMIC_PIPELINES_OVERRIDE)
 		swidget->dynamic_pipeline_widget = sof_core_debug &
 			SOF_DBG_DYNAMIC_PIPELINES_ENABLE;
@@ -2356,6 +2359,9 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 		return ret;
 	}
 
+	if (sof_core_debug & SOF_DBG_DISABLE_MULTICORE)
+		comp.core = SOF_DSP_PRIMARY_CORE;
+
 	swidget->core = comp.core;
 
 	ret = sof_parse_tokens(scomp, &swidget->comp_ext, comp_ext_tokens,
-- 
2.33.0

