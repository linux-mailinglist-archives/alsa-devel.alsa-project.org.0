Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2688966DD57
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 13:18:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D15965AA;
	Tue, 17 Jan 2023 13:17:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D15965AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673957879;
	bh=GDhYxnt8fQxO9Nc2xcOUlxz8t8IQCPNDuqGwdo8iZko=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=csLVdff+7gkJKcLZE830iXWO5jJqAwMkLT7efdzy5v3sU9FISQSwvPSLXwQS8IWG8
	 GVSXVLYAOiIrUtDoArMce8KtHUQ9JZZDPekcJnfMHdPLEMmqJk8dqQW4KxqoFTw28Q
	 a8pgL8DbnF4hYCrzeshyVOe9Heu0mx/LqiITsUpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37237F804F2;
	Tue, 17 Jan 2023 13:16:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC4BDF8023A; Tue, 17 Jan 2023 13:16:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82CBDF8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 13:16:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82CBDF8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JNTDOiGF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673957800; x=1705493800;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GDhYxnt8fQxO9Nc2xcOUlxz8t8IQCPNDuqGwdo8iZko=;
 b=JNTDOiGF0pr1+NN3GpBuL+xd9GdUCmJK3/R9nKSpwx1gAW22hVruEztf
 FzfgZfnPEfyQB922LOCW0VxoLtaIAnlVZjaOH8iNtpmAhwpwE8ZfvomJL
 rbXvPjU3wWLj6604AnryAoceVy6u9ba93nZJ7riq0yef6rlhI86ODGfvx
 FaCn9wdaVKnkhmyAMUrflIqCjE9QAPhvB5CawGyNyXSoCYTDljIPiBsOT
 ClqGr2xytI6K0a+nLD76g59r6r33B5GrEciHDRqw7TVUue2ZktZDwpSKP
 d7bNelun9pH5WEtn1v8fdkmr7Utn6+0IV9ZJl31+K5SxTgKnBWPE27Ocx A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="389180053"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="389180053"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 04:16:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="988104390"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="988104390"
Received: from izakharo-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.14.16])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 04:16:11 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: ipc4-topology: No need to unbind routes within a
 pipeline
Date: Tue, 17 Jan 2023 14:16:15 +0200
Message-Id: <20230117121615.25690-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

The FW currently ignores unbinding routes if the source and sink widgets
belong to the same pipeline. So no need to send the IPC at all in the
first place.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 59f4d42f9011..89f2dc4f564d 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1744,12 +1744,19 @@ static int sof_ipc4_route_free(struct snd_sof_dev *sdev, struct snd_sof_route *s
 	struct sof_ipc4_fw_module *sink_fw_module = sink_widget->module_info;
 	struct sof_ipc4_msg msg = {{ 0 }};
 	u32 header, extension;
-	int ret;
+	int ret = 0;
 
 	dev_dbg(sdev->dev, "unbind modules %s:%d -> %s:%d\n",
 		src_widget->widget->name, sroute->src_queue_id,
 		sink_widget->widget->name, sroute->dst_queue_id);
 
+	/*
+	 * routes belonging to the same pipeline will be disconnected by the FW when the pipeline
+	 * is freed. So avoid sending this IPC which will be ignored by the FW anyway.
+	 */
+	if (src_widget->pipe_widget == sink_widget->pipe_widget)
+		goto out;
+
 	header = src_fw_module->man4_module_entry.id;
 	header |= SOF_IPC4_MOD_INSTANCE(src_widget->instance_id);
 	header |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_MOD_UNBIND);
@@ -1768,7 +1775,7 @@ static int sof_ipc4_route_free(struct snd_sof_dev *sdev, struct snd_sof_route *s
 	if (ret < 0)
 		dev_err(sdev->dev, "failed to unbind modules %s -> %s\n",
 			src_widget->widget->name, sink_widget->widget->name);
-
+out:
 	sof_ipc4_put_queue_id(sink_widget, sroute->dst_queue_id, SOF_PIN_TYPE_SINK);
 	sof_ipc4_put_queue_id(src_widget, sroute->src_queue_id, SOF_PIN_TYPE_SOURCE);
 
-- 
2.39.0

