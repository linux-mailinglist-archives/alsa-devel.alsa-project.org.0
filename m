Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9A767E49F
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jan 2023 13:06:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64701E97;
	Fri, 27 Jan 2023 13:05:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64701E97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674821175;
	bh=5Va798cQXhbO862MbOkfolstSdalrkBTuJu5kXBJ9co=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nf0hQaX46U8BHxAW0j24wqHXJF1++Q+GjWojSqj9UNhje8dmIdABfTlfV0uN1Q6T1
	 AY90TJfmUnKubrInI6wLMFtT4YjE22kc4UueMLYGVvw0wR0X1e5lBc5TC9jQaMtdP5
	 mQlfRFvRsJHbDakHcCnmk5DptOPO+m3UoKd0rXfQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDED7F805C5;
	Fri, 27 Jan 2023 13:01:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE026F805B4; Fri, 27 Jan 2023 13:01:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBE5FF805A0
 for <alsa-devel@alsa-project.org>; Fri, 27 Jan 2023 13:01:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBE5FF805A0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=k0Ba5aeN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674820867; x=1706356867;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5Va798cQXhbO862MbOkfolstSdalrkBTuJu5kXBJ9co=;
 b=k0Ba5aeNuWJoJvz6zt1AT75AIZa+d/JDkCKRJrjqJV9WtBHueTzoAPIH
 45yiZrtwKSC+ula6P5s8X+z0/VvMXYR2sMx3vm49k8u/C0F86FwNILf/8
 kdBskQEwQjKLA3J61MY4/0oj3E3jGcp850xM5oyO4nqxfg17xbANEvUOL
 wUy6Ivc9iFnyj7XuZ5U5oZmqBmAJJaSJ8TPtxH9k6//YtxdPvZEqHEOwX
 yiva4IEa2f2uReuY/HYSqmxOyOPDfE9Cav2G0EcMOCAx7uFXaEVc34WDK
 GWlnzRXzaxlBE/rGMbukRTJY2VCDtZL/g4abcOqVIg4s4g3iwF0y4U+ZP w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="327091959"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="327091959"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:01:03 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805782320"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; d="scan'208";a="805782320"
Received: from aaralsto-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.30.130])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 04:01:01 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 15/18] ASoC: SOF: ipc4-topology: Protect pipeline free with
 mutex
Date: Fri, 27 Jan 2023 14:00:28 +0200
Message-Id: <20230127120031.10709-16-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
References: <20230127120031.10709-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When starting/stopping multiple streams in parallel, pipeline triggers
and pipeline frees can get interleaved. So use the same mutex used for
pipeline trigger to protect the pipeline frees as well. Rename the
trigger_mutex to pipeline_state_mutex for more clarity.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-pcm.c      | 4 ++--
 sound/soc/sof/ipc4-priv.h     | 4 ++--
 sound/soc/sof/ipc4-topology.c | 5 +++++
 sound/soc/sof/ipc4.c          | 2 +-
 4 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index ababa29d6eac..2d89d3708ed0 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -222,7 +222,7 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	if (!trigger_list)
 		return -ENOMEM;
 
-	mutex_lock(&ipc4_data->trigger_mutex);
+	mutex_lock(&ipc4_data->pipeline_state_mutex);
 
 	/*
 	 * IPC4 requires pipelines to be triggered in order starting at the sink and
@@ -289,7 +289,7 @@ static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
 	}
 
 free:
-	mutex_unlock(&ipc4_data->trigger_mutex);
+	mutex_unlock(&ipc4_data->pipeline_state_mutex);
 	kfree(trigger_list);
 	return ret;
 }
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index 0c0d48376045..38bb3d7df42e 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -70,7 +70,7 @@ struct sof_ipc4_fw_library {
  *		    base firmware
  *
  * @load_library: Callback function for platform dependent library loading
- * @trigger_mutex: Mutex to protect pipeline triggers, ref counts and states
+ * @pipeline_state_mutex: Mutex to protect pipeline triggers, ref counts, states and deletion
  */
 struct sof_ipc4_fw_data {
 	u32 manifest_fw_hdr_offset;
@@ -83,7 +83,7 @@ struct sof_ipc4_fw_data {
 
 	int (*load_library)(struct snd_sof_dev *sdev,
 			    struct sof_ipc4_fw_library *fw_lib, bool reload);
-	struct mutex trigger_mutex; /* protect pipeline triggers, ref counts and states */
+	struct mutex pipeline_state_mutex; /* protect pipeline triggers, ref counts and states */
 };
 
 extern const struct sof_ipc_fw_loader_ops ipc4_loader_ops;
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 2f82b5e02a27..43340c8917b7 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1625,8 +1625,11 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 static int sof_ipc4_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
 	struct sof_ipc4_fw_module *fw_module = swidget->module_info;
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 	int ret = 0;
 
+	mutex_lock(&ipc4_data->pipeline_state_mutex);
+
 	/* freeing a pipeline frees all the widgets associated with it */
 	if (swidget->id == snd_soc_dapm_scheduler) {
 		struct sof_ipc4_pipeline *pipeline = swidget->private;
@@ -1652,6 +1655,8 @@ static int sof_ipc4_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget
 		ida_free(&fw_module->m_ida, swidget->instance_id);
 	}
 
+	mutex_unlock(&ipc4_data->pipeline_state_mutex);
+
 	return ret;
 }
 
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index fb4760ae593f..35c9f3913d9a 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -662,7 +662,7 @@ static int sof_ipc4_init(struct snd_sof_dev *sdev)
 {
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 
-	mutex_init(&ipc4_data->trigger_mutex);
+	mutex_init(&ipc4_data->pipeline_state_mutex);
 
 	xa_init_flags(&ipc4_data->fw_lib_xa, XA_FLAGS_ALLOC);
 
-- 
2.39.1

