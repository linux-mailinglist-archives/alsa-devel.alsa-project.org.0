Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C204D404B
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 05:29:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9443A171C;
	Thu, 10 Mar 2022 05:28:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9443A171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646886570;
	bh=QuUK9doqQlifKJaxhMiRiajklEKEGpEGdfsE0aB3svE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sd4ZU6/M5129+1SiRiqvirWljzNoSxg34+s/byRfp72LTndJniHlnAb/K75AKSEmw
	 9fqRISa+QYlBQOGp7MYWEBglwr+dkEK4jVxmblHe5lvdB4wSsaMDcT32I7iely8Dff
	 YqgilXZCb44UjPcbBytVUCljtDQ7vulQbA1zFbNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 365BEF80425;
	Thu, 10 Mar 2022 05:27:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B93BFF8012C; Thu, 10 Mar 2022 05:27:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12888F8012C
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 05:27:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12888F8012C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SHXJ20xM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646886465; x=1678422465;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QuUK9doqQlifKJaxhMiRiajklEKEGpEGdfsE0aB3svE=;
 b=SHXJ20xMqkEjCwqUpe8bA79Z0jluNGlOzmSQlswaY9ZtKGuEEjRDVgGd
 ddQekwuhLxQYWC5vdIniJsI9MrRdZ2BMuwEShqv25bDcHS8ZbIYChc4Iq
 Zcv7ZD3kDr+uMbgD4CJ1qite/tdxwEJl5WtpkbHt05pflNT2HHJVdGyKC
 5OHWVurZacAD51GPKWPP6+xjJz760jziML5qGEPxduLsfKGtjzZF1+lv2
 GJCtNgGiW1nQ8C4e7rUSas4U2ZtqMb75WH23st+CLLL0EkMmNB8jnb/La
 mOHu4lfSbKBLjXlXkdl6PxIHWNeDNu/aqrxxf5Htg0BuIJZ34B2SAQ1IP g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="318380883"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="318380883"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 20:27:31 -0800
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="547884670"
Received: from ttahmed-mobl2.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.50.225])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 20:27:31 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/10] ASoC: SOF: Make pcm_hw_params snd_sof_dsp_ops callback
 IPC neutral
Date: Wed,  9 Mar 2022 20:27:12 -0800
Message-Id: <20220310042720.976809-3-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310042720.976809-1-ranjani.sridharan@linux.intel.com>
References: <20220310042720.976809-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Do not send IPC structure directly via pcm_hw_params to make it IPC
agnostic.

A new struct is created to retrieve the needed platform parameters and if
there is a need it can be extended with new options.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/amd/acp-pcm.c   |  8 +++++---
 sound/soc/sof/amd/acp.h       |  3 ++-
 sound/soc/sof/intel/hda-pcm.c | 18 ++++--------------
 sound/soc/sof/intel/hda.h     |  2 +-
 sound/soc/sof/ops.h           |  6 +++---
 sound/soc/sof/pcm.c           | 21 ++++++++++++++++++++-
 sound/soc/sof/sof-priv.h      | 17 ++++++++++++++++-
 7 files changed, 51 insertions(+), 24 deletions(-)

diff --git a/sound/soc/sof/amd/acp-pcm.c b/sound/soc/sof/amd/acp-pcm.c
index b49cc55980ae..0ba8ae46bd76 100644
--- a/sound/soc/sof/amd/acp-pcm.c
+++ b/sound/soc/sof/amd/acp-pcm.c
@@ -17,7 +17,8 @@
 #include "acp-dsp-offset.h"
 
 int acp_pcm_hw_params(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
-		      struct snd_pcm_hw_params *params, struct sof_ipc_stream_params *ipc_params)
+		      struct snd_pcm_hw_params *params,
+		      struct snd_sof_platform_stream_params *platform_params)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct acp_dsp_stream *stream = runtime->private_data;
@@ -35,8 +36,9 @@ int acp_pcm_hw_params(struct snd_sof_dev *sdev, struct snd_pcm_substream *substr
 		return ret;
 	}
 
-	ipc_params->buffer.phy_addr = stream->reg_offset;
-	ipc_params->stream_tag = stream->stream_tag;
+	platform_params->use_phy_address = true;
+	platform_params->phy_addr = stream->reg_offset;
+	platform_params->stream_tag = stream->stream_tag;
 
 	/* write buffer size of stream in scratch memory */
 
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index f550a5010a91..35e46fe6676a 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -201,7 +201,8 @@ int acp_dsp_stream_put(struct snd_sof_dev *sdev, struct acp_dsp_stream *acp_stre
 int acp_pcm_open(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream);
 int acp_pcm_close(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream);
 int acp_pcm_hw_params(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream,
-		      struct snd_pcm_hw_params *params, struct sof_ipc_stream_params *ipc_params);
+		      struct snd_pcm_hw_params *params,
+		      struct snd_sof_platform_stream_params *platform_params);
 
 extern const struct snd_sof_dsp_ops sof_renoir_ops;
 
diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index eec83ca557a1..7991407d5508 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -93,13 +93,12 @@ u32 hda_dsp_get_bits(struct snd_sof_dev *sdev, int sample_bits)
 int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
-			  struct sof_ipc_stream_params *ipc_params)
+			  struct snd_sof_platform_stream_params *platform_params)
 {
 	struct hdac_stream *hstream = substream->runtime->private_data;
 	struct hdac_ext_stream *hext_stream = stream_to_hdac_ext_stream(hstream);
 	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
 	struct snd_dma_buffer *dmab;
-	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
 	int ret;
 	u32 size, rate, bits;
 
@@ -130,19 +129,10 @@ int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
 	else
 		hda_dsp_stream_spib_config(sdev, hext_stream, HDA_DSP_SPIB_DISABLE, 0);
 
-	/* update no_stream_position flag for ipc params */
-	if (hda && hda->no_ipc_position) {
-		/* For older ABIs set host_period_bytes to zero to inform
-		 * FW we don't want position updates. Newer versions use
-		 * no_stream_position for this purpose.
-		 */
-		if (v->abi_version < SOF_ABI_VER(3, 10, 0))
-			ipc_params->host_period_bytes = 0;
-		else
-			ipc_params->no_stream_position = 1;
-	}
+	if (hda)
+		platform_params->no_ipc_position = hda->no_ipc_position;
 
-	ipc_params->stream_tag = hstream->stream_tag;
+	platform_params->stream_tag = hstream->stream_tag;
 
 	return 0;
 }
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 21e34580a403..46641d31e9c5 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -524,7 +524,7 @@ int hda_dsp_pcm_close(struct snd_sof_dev *sdev,
 int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
 			  struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params,
-			  struct sof_ipc_stream_params *ipc_params);
+			  struct snd_sof_platform_stream_params *platform_params);
 int hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
 			   struct snd_pcm_substream *substream);
 int hda_dsp_pcm_trigger(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 999a36208b11..98fa91f5927d 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -420,11 +420,11 @@ static inline int
 snd_sof_pcm_platform_hw_params(struct snd_sof_dev *sdev,
 			       struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params,
-			       struct sof_ipc_stream_params *ipc_params)
+			       struct snd_sof_platform_stream_params *platform_params)
 {
 	if (sof_ops(sdev) && sof_ops(sdev)->pcm_hw_params)
-		return sof_ops(sdev)->pcm_hw_params(sdev, substream,
-						    params, ipc_params);
+		return sof_ops(sdev)->pcm_hw_params(sdev, substream, params,
+						    platform_params);
 
 	return 0;
 }
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 1d04f75e6d32..d952ea8ccd12 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -162,6 +162,8 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct snd_sof_platform_stream_params platform_params = { 0 };
+	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
 	struct snd_sof_pcm *spcm;
 	struct sof_ipc_pcm_params pcm;
 	struct sof_ipc_pcm_params_reply ipc_params_reply;
@@ -242,12 +244,29 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 	ret = snd_sof_pcm_platform_hw_params(sdev,
 					     substream,
 					     params,
-					     &pcm.params);
+					     &platform_params);
 	if (ret < 0) {
 		dev_err(component->dev, "error: platform hw params failed\n");
 		return ret;
 	}
 
+	/* Update the IPC message with information from the platform */
+	pcm.params.stream_tag = platform_params.stream_tag;
+
+	if (platform_params.use_phy_address)
+		pcm.params.buffer.phy_addr = platform_params.phy_addr;
+
+	if (platform_params.no_ipc_position) {
+		/* For older ABIs set host_period_bytes to zero to inform
+		 * FW we don't want position updates. Newer versions use
+		 * no_stream_position for this purpose.
+		 */
+		if (v->abi_version < SOF_ABI_VER(3, 10, 0))
+			pcm.params.host_period_bytes = 0;
+		else
+			pcm.params.no_stream_position = 1;
+	}
+
 	dev_dbg(component->dev, "stream_tag %d", pcm.params.stream_tag);
 
 	/* if this is a repeated hw_params without hw_free, skip setting up widgets */
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 2cff62e75f1e..3c50defcfb25 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -105,6 +105,21 @@ struct snd_soc_tplg_ops;
 struct snd_soc_component;
 struct snd_sof_pdata;
 
+/**
+ * struct snd_sof_platform_stream_params - platform dependent stream parameters
+ * @stream_tag:		Stream tag to use
+ * @use_phy_addr:	Use the provided @phy_addr for configuration
+ * @phy_addr:		Platform dependent address to be used, if  @use_phy_addr
+ *			is true
+ * @no_ipc_position:	Disable position update IPC from firmware
+ */
+struct snd_sof_platform_stream_params {
+	u16 stream_tag;
+	bool use_phy_address;
+	u32 phy_addr;
+	bool no_ipc_position;
+};
+
 /*
  * SOF DSP HW abstraction operations.
  * Used to abstract DSP HW architecture and any IO busses between host CPU
@@ -183,7 +198,7 @@ struct snd_sof_dsp_ops {
 	int (*pcm_hw_params)(struct snd_sof_dev *sdev,
 			     struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params,
-			     struct sof_ipc_stream_params *ipc_params); /* optional */
+			     struct snd_sof_platform_stream_params *platform_params); /* optional */
 
 	/* host stream hw_free */
 	int (*pcm_hw_free)(struct snd_sof_dev *sdev,
-- 
2.25.1

