Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B402E1B76D8
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 15:21:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C6C716CF;
	Fri, 24 Apr 2020 15:20:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C6C716CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587734497;
	bh=3uWCp4pvnKEFQ5Z+KCt5wxmT6+r75AFKed7pnzkBHJI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n87JdO+R6j0Z4kC7MmxF8UpLVFOFoIT/ogwkt5LD6q944srse5K1kvsoJcz0B74at
	 S44VEPHZCtE2nz9hxnjvKrOjqT8fkLn7eBXKeVKF9IuEHjGxO9Kfi2k2zkJKbWPdOD
	 sZ6hZEiXO6/e5g5OmwUZwuXuDg0sCnIJPwS+5Zns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63759F80290;
	Fri, 24 Apr 2020 15:19:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49DBBF80279; Fri, 24 Apr 2020 15:19:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65660F80279
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 15:18:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65660F80279
IronPort-SDR: khYbC2ExXIdv5WKQADMbAXXh8Ur1bVWHW9y2JXFteVhFXfshcyRYQYwbioQwuqzCEBR4W/xYCB
 VeHCNDcgt5tw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2020 06:18:56 -0700
IronPort-SDR: eax+6QCE7d9AzEqohr1OSSea8oNQF3yjeFXdUZ7A33SWUDLyPPQ09v4JTcRaIqJzIS/0mwjmmb
 T4cJBR+cnJPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,311,1583222400"; d="scan'208";a="246589171"
Received: from mgorski-all-series.igk.intel.com ([10.237.149.201])
 by fmsmga007.fm.intel.com with ESMTP; 24 Apr 2020 06:18:54 -0700
From: Mateusz Gorski <mateusz.gorski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 2/3] ASoC: Intel: Multiple I/O PCM format support for pipe
Date: Fri, 24 Apr 2020 15:20:01 +0200
Message-Id: <20200424132002.3850-3-mateusz.gorski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200424132002.3850-1-mateusz.gorski@linux.intel.com>
References: <20200424132002.3850-1-mateusz.gorski@linux.intel.com>
Cc: cezary.rojewski@intel.com, Pavan K <pavan.k.s@intel.com>, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, broonie@kernel.org,
 Mateusz Gorski <mateusz.gorski@linux.intel.com>, S@alsa-project.org
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

For pipes supporting multiple input/output formats, kcontrol is
created and selection of pipe input and output configuration
is done based on control set.

If more than one configuration is supported, then this patch
allows user to select configuration of choice
using amixer settings.

Signed-off-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
Signed-off-by: S, Pavan K <pavan.k.s@intel.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---

Changes in v2:
--none--

Changes in v3:
- reordered declarations in skl_tplg_is_multi_fmt

Changes in v4:
- added helper function to set and get pipe config

 include/uapi/sound/skl-tplg-interface.h |  1 +
 sound/soc/intel/skylake/skl-topology.c  | 94 +++++++++++++++++++++++++
 sound/soc/intel/skylake/skl-topology.h  |  1 +
 3 files changed, 96 insertions(+)

diff --git a/include/uapi/sound/skl-tplg-interface.h b/include/uapi/sound/skl-tplg-interface.h
index 9eee32f5e407..f2711186c81f 100644
--- a/include/uapi/sound/skl-tplg-interface.h
+++ b/include/uapi/sound/skl-tplg-interface.h
@@ -18,6 +18,7 @@
  */
 #define SKL_CONTROL_TYPE_BYTE_TLV	0x100
 #define SKL_CONTROL_TYPE_MIC_SELECT	0x102
+#define SKL_CONTROL_TYPE_MULTI_IO_SELECT	0x103
 
 #define HDA_SST_CFG_MAX	900 /* size of copier cfg*/
 #define MAX_IN_QUEUE 8
diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index 34ddbdc2b32a..f51eaf77aad3 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -579,6 +579,38 @@ static int skl_tplg_unload_pipe_modules(struct skl_dev *skl,
 	return ret;
 }
 
+static bool skl_tplg_is_multi_fmt(struct skl_dev *skl, struct skl_pipe *pipe)
+{
+	struct skl_pipe_fmt *cur_fmt;
+	struct skl_pipe_fmt *next_fmt;
+	int i;
+
+	if (pipe->nr_cfgs <= 1)
+		return false;
+
+	if (pipe->conn_type != SKL_PIPE_CONN_TYPE_FE)
+		return true;
+
+	for (i = 0; i < pipe->nr_cfgs - 1; i++) {
+		if (pipe->direction == SNDRV_PCM_STREAM_PLAYBACK) {
+			cur_fmt = &pipe->configs[i].out_fmt;
+			next_fmt = &pipe->configs[i+1].out_fmt;
+		} else {
+			cur_fmt = &pipe->configs[i].in_fmt;
+			next_fmt = &pipe->configs[i+1].in_fmt;
+		}
+
+		if (!CHECK_HW_PARAMS(cur_fmt->channels, cur_fmt->freq,
+				     cur_fmt->bps,
+				     next_fmt->channels,
+				     next_fmt->freq,
+				     next_fmt->bps))
+			return true;
+	}
+
+	return false;
+}
+
 /*
  * Here, we select pipe format based on the pipe type and pipe
  * direction to determine the current config index for the pipeline.
@@ -601,6 +633,14 @@ skl_tplg_get_pipe_config(struct skl_dev *skl, struct skl_module_cfg *mconfig)
 		return 0;
 	}
 
+	if (skl_tplg_is_multi_fmt(skl, pipe)) {
+		pipe->cur_config_idx = pipe->pipe_config_idx;
+		pipe->memory_pages = pconfig->mem_pages;
+		dev_dbg(skl->dev, "found pipe config idx:%d\n",
+				pipe->cur_config_idx);
+		return 0;
+	}
+
 	if (pipe->conn_type == SKL_PIPE_CONN_TYPE_NONE) {
 		dev_dbg(skl->dev, "No conn_type detected, take 0th config\n");
 		pipe->cur_config_idx = 0;
@@ -1315,6 +1355,55 @@ static int skl_tplg_pga_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int skl_tplg_multi_config_set_get(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol, bool is_set)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct hdac_bus *bus = snd_soc_component_get_drvdata(component);
+	struct skl_dev *skl = bus_to_skl(bus);
+	struct skl_pipeline *ppl;
+	struct skl_pipe *pipe = NULL;
+	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
+	u32 *pipe_id;
+
+	if (!ec)
+		return -EINVAL;
+
+	if (is_set && (ucontrol->value.enumerated.item[0] > ec->items))
+		return -EINVAL;
+
+	pipe_id = ec->dobj.private;
+
+	list_for_each_entry(ppl, &skl->ppl_list, node) {
+		if (ppl->pipe->ppl_id == *pipe_id) {
+			pipe = ppl->pipe;
+			break;
+			}
+		}
+	if (!pipe)
+		return -EIO;
+
+	if (is_set)
+		pipe->pipe_config_idx = ucontrol->value.enumerated.item[0];
+	else
+		ucontrol->value.enumerated.item[0]  =  pipe->pipe_config_idx;
+
+	return 0;
+}
+
+static int skl_tplg_multi_config_get(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	return skl_tplg_multi_config_set_get(kcontrol, ucontrol, false);
+}
+
+static int skl_tplg_multi_config_set(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	return skl_tplg_multi_config_set_get(kcontrol, ucontrol, true);
+}
+
 static int skl_tplg_tlv_control_get(struct snd_kcontrol *kcontrol,
 			unsigned int __user *data, unsigned int size)
 {
@@ -1854,6 +1943,11 @@ static const struct snd_soc_tplg_kcontrol_ops skl_tplg_kcontrol_ops[] = {
 		.get = skl_tplg_mic_control_get,
 		.put = skl_tplg_mic_control_set,
 	},
+	{
+		.id = SKL_CONTROL_TYPE_MULTI_IO_SELECT,
+		.get = skl_tplg_multi_config_get,
+		.put = skl_tplg_multi_config_set,
+	},
 };
 
 static int skl_tplg_fill_pipe_cfg(struct device *dev,
diff --git a/sound/soc/intel/skylake/skl-topology.h b/sound/soc/intel/skylake/skl-topology.h
index e967800dbb62..06576147cc29 100644
--- a/sound/soc/intel/skylake/skl-topology.h
+++ b/sound/soc/intel/skylake/skl-topology.h
@@ -306,6 +306,7 @@ struct skl_pipe {
 	struct skl_path_config configs[SKL_MAX_PATH_CONFIGS];
 	struct list_head w_list;
 	bool passthru;
+	u32 pipe_config_idx;
 };
 
 enum skl_module_state {
-- 
2.17.1

