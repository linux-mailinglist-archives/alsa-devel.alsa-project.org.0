Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 820B545771E
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Nov 2021 20:38:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F3F41797;
	Fri, 19 Nov 2021 20:38:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F3F41797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637350731;
	bh=4weLAB/C6UhmGkvQGo7jZMuuV/w23eVCC4DeJBrlQq4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EB03h0wZblQwzIfzQ1imZnsEKWOrhZ5B0RHdWp+9nS6S4VACTLLRjtgBv1mcOsTwh
	 1/XLU+Q3CtOFeyA4Z29+cmeG/w0GvB9yWom7diOYhgN0ITKG7qb9i8d89WXzqoA5Ai
	 J98o8Cau8tLpiShizU2eXh1W64b8dwBOs2Y7gHkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 887DFF80535;
	Fri, 19 Nov 2021 20:34:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BEBAF80529; Fri, 19 Nov 2021 20:34:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96DC0F80518
 for <alsa-devel@alsa-project.org>; Fri, 19 Nov 2021 20:34:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96DC0F80518
X-IronPort-AV: E=McAfee;i="6200,9189,10173"; a="221697779"
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="221697779"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 11:34:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="473651257"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 19 Nov 2021 11:34:23 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 07/10] ASoC: SOF: free widgets in sof_tear_down_pipelines()
 for static pipelines
Date: Fri, 19 Nov 2021 21:26:18 +0200
Message-Id: <20211119192621.4096077-8-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211119192621.4096077-1-kai.vehmanen@linux.intel.com>
References: <20211119192621.4096077-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

Free widgets for static pipelines in sof_tear_down_pipelines().
But this feature is unavailable in older firmware with ABI < 3.19.
Just reset widget use_count's for this case. This would ensure that
the secondary cores enabled required for topology setup are powered
down properly before the primary core is powered off during
system suspend.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index a019355e0bcf..669d5c924f6b 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -665,11 +665,12 @@ int sof_set_up_pipelines(struct snd_sof_dev *sdev, bool verify)
 }
 
 /*
- * This function doesn't free widgets during suspend. It only resets the set up status for all
- * routes and use_count for all widgets.
+ * For older firmware, this function doesn't free widgets for static pipelines during suspend.
+ * It only resets use_count for all widgets.
  */
 int sof_tear_down_pipelines(struct snd_sof_dev *sdev, bool verify)
 {
+	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
 	struct snd_sof_widget *swidget;
 	struct snd_sof_route *sroute;
 	int ret;
@@ -681,8 +682,14 @@ int sof_tear_down_pipelines(struct snd_sof_dev *sdev, bool verify)
 	 * loading the sound card unavailable to open PCMs.
 	 */
 	list_for_each_entry_reverse(swidget, &sdev->widget_list, list) {
-		if (!verify) {
+		if (swidget->dynamic_pipeline_widget)
+			continue;
+
+		/* Do not free widgets for static pipelines with FW ABI older than 3.19 */
+		if (!verify && !swidget->dynamic_pipeline_widget &&
+		    v->abi_version < SOF_ABI_VER(3, 19, 0)) {
 			swidget->use_count = 0;
+			swidget->complete = 0;
 			continue;
 		}
 
-- 
2.33.0

