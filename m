Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 700F04ABF9C
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Feb 2022 14:28:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CD361798;
	Mon,  7 Feb 2022 14:27:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CD361798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644240498;
	bh=XeHA2kWZxiBo4UllOJBLmMg4Q7IMfJnFyQUJQ5FozXQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I3eGA+F81AbqsJeH+20MpARpOqysNb5VmiaGQvtgwJSq1eKs2j5nXQUKqZvdLbKCw
	 lA+1oy26Ly1FQvfSXMrk10hUt+3Gqf6Q8KRgFfvaJdB9rgv5u6qQgu5gh6PKhvroZA
	 bKNd75jOId2om8WTQ+lwlRJPvZqX9z6PQALaesoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B86BF8056F;
	Mon,  7 Feb 2022 14:24:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D11AF80568; Mon,  7 Feb 2022 14:24:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFEA1F8054A
 for <alsa-devel@alsa-project.org>; Mon,  7 Feb 2022 14:24:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFEA1F8054A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DL1pm/kP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644240262; x=1675776262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XeHA2kWZxiBo4UllOJBLmMg4Q7IMfJnFyQUJQ5FozXQ=;
 b=DL1pm/kP/kba2UbTt7oFSQJ91k5admZADR4eTFLmMOuQGGdUGzo/rysO
 iPIiPstemfIsuWQDNTCGc1BsZ4kCijT2sjzvOlC1KyrtP9AVcQBiv26o/
 AggxnhlyGhJnr+pKhWJW3dgichOBydja97bMpBM9SGC4L+2bKCIkqJOqF
 NcXUcC4SrBSrNDxssrHpwOYSYDcZNZScg7cXKAeB7ITsVnigSA1G/PJf9
 oTN9lqQiyrlHQbrnJpdScu6sQPqXgMdwaTezjCAYesTBTQqIR+dotGWx8
 7C4V+Jb0lpmdAYi0XWmwngiqSZFl/kXZTVUocpPSXrYW1h91wl6ft3svU w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="312011592"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="312011592"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 05:24:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="677751348"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2022 05:24:17 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC 10/13] ASoC: Intel: avs: Path state management
Date: Mon,  7 Feb 2022 14:25:28 +0100
Message-Id: <20220207132532.3782412-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207132532.3782412-1-cezary.rojewski@intel.com>
References: <20220207132532.3782412-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, rad@semihalf.com,
 upstream@semihalf.com, harshapriya.n@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

Add functions to ease with state changing of all objects found in the
path. Each represents either a BIND/UNBIND or SET_PIPEPILE_STATE IPC.

DSP pipelines follow simple state machine scheme:
CREATE -> RESET -> PAUSE -> RUNNING -> PAUSE -> RESET -> DELETE

There is no STOP, PAUSE serves that purpose instead.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/path.c | 130 +++++++++++++++++++++++++++++++++++++
 sound/soc/intel/avs/path.h |   5 ++
 2 files changed, 135 insertions(+)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index 272d868bedc9..c6db3f091e66 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -285,3 +285,133 @@ struct avs_path *avs_path_create(struct avs_dev *adev, u32 dma_id,
 
 	return path;
 }
+
+int avs_path_bind(struct avs_path *path)
+{
+	struct avs_path_pipeline *ppl;
+	struct avs_dev *adev = path->owner;
+	int ret;
+
+	list_for_each_entry(ppl, &path->ppl_list, node) {
+		struct avs_path_binding *binding;
+
+		list_for_each_entry(binding, &ppl->binding_list, node) {
+			struct avs_path_module *source, *sink;
+
+			source = binding->source;
+			sink = binding->sink;
+
+			ret = avs_ipc_bind(adev, source->module_id,
+					   source->instance_id, sink->module_id,
+					   sink->instance_id, binding->sink_pin,
+					   binding->source_pin);
+			if (ret) {
+				dev_err(adev->dev, "bind path failed: %d\n", ret);
+				return AVS_IPC_RET(ret);
+			}
+		}
+	}
+
+	return 0;
+}
+
+int avs_path_unbind(struct avs_path *path)
+{
+	struct avs_path_pipeline *ppl;
+	struct avs_dev *adev = path->owner;
+	int ret;
+
+	list_for_each_entry(ppl, &path->ppl_list, node) {
+		struct avs_path_binding *binding;
+
+		list_for_each_entry(binding, &ppl->binding_list, node) {
+			struct avs_path_module *source, *sink;
+
+			source = binding->source;
+			sink = binding->sink;
+
+			ret = avs_ipc_unbind(adev, source->module_id,
+					     source->instance_id, sink->module_id,
+					     sink->instance_id, binding->sink_pin,
+					     binding->source_pin);
+			if (ret) {
+				dev_err(adev->dev, "unbind path failed: %d\n", ret);
+				return AVS_IPC_RET(ret);
+			}
+		}
+	}
+
+	return 0;
+}
+
+int avs_path_reset(struct avs_path *path)
+{
+	struct avs_path_pipeline *ppl;
+	struct avs_dev *adev = path->owner;
+	int ret;
+
+	if (path->state == AVS_PPL_STATE_RESET)
+		return 0;
+
+	list_for_each_entry(ppl, &path->ppl_list, node) {
+		ret = avs_ipc_set_pipeline_state(adev, ppl->instance_id,
+						 AVS_PPL_STATE_RESET);
+		if (ret) {
+			dev_err(adev->dev, "reset path failed: %d\n", ret);
+			path->state = AVS_PPL_STATE_INVALID;
+			return AVS_IPC_RET(ret);
+		}
+	}
+
+	path->state = AVS_PPL_STATE_RESET;
+	return 0;
+}
+
+int avs_path_pause(struct avs_path *path)
+{
+	struct avs_path_pipeline *ppl;
+	struct avs_dev *adev = path->owner;
+	int ret;
+
+	if (path->state == AVS_PPL_STATE_PAUSED)
+		return 0;
+
+	list_for_each_entry_reverse(ppl, &path->ppl_list, node) {
+		ret = avs_ipc_set_pipeline_state(adev, ppl->instance_id,
+						 AVS_PPL_STATE_PAUSED);
+		if (ret) {
+			dev_err(adev->dev, "pause path failed: %d\n", ret);
+			path->state = AVS_PPL_STATE_INVALID;
+			return AVS_IPC_RET(ret);
+		}
+	}
+
+	path->state = AVS_PPL_STATE_PAUSED;
+	return 0;
+}
+
+int avs_path_run(struct avs_path *path, int trigger)
+{
+	struct avs_path_pipeline *ppl;
+	struct avs_dev *adev = path->owner;
+	int ret;
+
+	if (path->state == AVS_PPL_STATE_RUNNING && trigger == AVS_TPLG_TRIGGER_AUTO)
+		return 0;
+
+	list_for_each_entry(ppl, &path->ppl_list, node) {
+		if (ppl->template->cfg->trigger != trigger)
+			continue;
+
+		ret = avs_ipc_set_pipeline_state(adev, ppl->instance_id,
+						 AVS_PPL_STATE_RUNNING);
+		if (ret) {
+			dev_err(adev->dev, "run path failed: %d\n", ret);
+			path->state = AVS_PPL_STATE_INVALID;
+			return AVS_IPC_RET(ret);
+		}
+	}
+
+	path->state = AVS_PPL_STATE_RUNNING;
+	return 0;
+}
diff --git a/sound/soc/intel/avs/path.h b/sound/soc/intel/avs/path.h
index 3843e5a062a1..04a06473f04b 100644
--- a/sound/soc/intel/avs/path.h
+++ b/sound/soc/intel/avs/path.h
@@ -62,5 +62,10 @@ struct avs_path *avs_path_create(struct avs_dev *adev, u32 dma_id,
 				 struct avs_tplg_path_template *template,
 				 struct snd_pcm_hw_params *fe_params,
 				 struct snd_pcm_hw_params *be_params);
+int avs_path_bind(struct avs_path *path);
+int avs_path_unbind(struct avs_path *path);
+int avs_path_reset(struct avs_path *path);
+int avs_path_pause(struct avs_path *path);
+int avs_path_run(struct avs_path *path, int trigger);
 
 #endif
-- 
2.25.1

