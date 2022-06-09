Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B3F5441FA
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 05:33:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C64062073;
	Thu,  9 Jun 2022 05:32:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C64062073
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654745601;
	bh=gsoe9oWPPPhNGefCplf7SJU8wWDAfGz1hI1En/pfhhg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bS2f5ee5MQUbYLbYbWYVIz61rASGg1FI80L+Q9CQf9/YTzDlH3ToH3NEohb4OGmph
	 5qlcyQhE2+f15Ep49wF8GZgpFPcNVLbhMTfUnUIa9am3vkGcOIikmYPNi4biJ0KXZ3
	 /DeoOIAfoPw4tC7vkCF9MoQDZpTWr8aXTVfCX6xM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A425F805D5;
	Thu,  9 Jun 2022 05:27:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43217F805BF; Thu,  9 Jun 2022 05:27:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7300CF80558
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 05:27:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7300CF80558
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aCdg6lbL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654745244; x=1686281244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gsoe9oWPPPhNGefCplf7SJU8wWDAfGz1hI1En/pfhhg=;
 b=aCdg6lbLEK4+JERwiD1z/252GZL4D9spd8Os6f6ENWbogkmwILVBz3kg
 ZDhduk3bBl0E8GXL5IMvYBWmlg/aHAS6Bq95V+pvXk1lX1XRJI/9R8/m8
 1EcEWM00a9En/WFL0LbOur1z5wzXhNY9fcpuExMj7O0t+XJeHoeHGwPk+
 qiqNRiRMiUfEu0m/SbH1r0n/lhMObV0Wu603KCGO84BO6ELrAOIHEFxUt
 o3CA0IeoTblR5odBIotvHuUt2AwZIVAoJd3SkZY3ZvVUQXHtLkyE3/AwV
 T5rAcFCLuNQHqZf5zee2BiixctyTRvq20kwNpfxxZ0DYwH/4Ycdszmi+P Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341219573"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="341219573"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:27:01 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585260256"
Received: from mandalag-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.38.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:27:01 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 20/23] ASoC: SOF: Add a new IPC op for parsing topology
 manifest
Date: Wed,  8 Jun 2022 20:26:40 -0700
Message-Id: <20220609032643.916882-21-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
References: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Jaska Uimonen <jaska.uimonen@linux.intel.com>
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

Add a new topology IPC op, parse_manifest. Define and set the op for
IPC4 and IPC4.

Co-developed-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 48 ++++++++++++++++++++++++++
 sound/soc/sof/ipc4-topology.c | 63 +++++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-audio.h     |  3 ++
 sound/soc/sof/topology.c      | 45 +++----------------------
 4 files changed, 118 insertions(+), 41 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 043554d7cb4a..a91d7df3f07e 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -17,6 +17,9 @@
 /* Full volume for default values */
 #define VOL_ZERO_DB	BIT(VOLUME_FWL)
 
+/* size of tplg ABI in bytes */
+#define SOF_IPC3_TPLG_ABI_SIZE 3
+
 struct sof_widget_data {
 	int ctrl_type;
 	int ipc_cmd;
@@ -2303,6 +2306,50 @@ static int sof_ipc3_dai_get_clk(struct snd_sof_dev *sdev, struct snd_sof_dai *da
 	return -EINVAL;
 }
 
+static int sof_ipc3_parse_manifest(struct snd_soc_component *scomp, int index,
+				   struct snd_soc_tplg_manifest *man)
+{
+	u32 size = le32_to_cpu(man->priv.size);
+	u32 abi_version;
+
+	/* backward compatible with tplg without ABI info */
+	if (!size) {
+		dev_dbg(scomp->dev, "No topology ABI info\n");
+		return 0;
+	}
+
+	if (size != SOF_IPC3_TPLG_ABI_SIZE) {
+		dev_err(scomp->dev, "%s: Invalid topology ABI size: %u\n",
+			__func__, size);
+		return -EINVAL;
+	}
+
+	dev_info(scomp->dev,
+		 "Topology: ABI %d:%d:%d Kernel ABI %hhu:%hhu:%hhu\n",
+		 man->priv.data[0], man->priv.data[1], man->priv.data[2],
+		 SOF_ABI_MAJOR, SOF_ABI_MINOR, SOF_ABI_PATCH);
+
+	abi_version = SOF_ABI_VER(man->priv.data[0], man->priv.data[1], man->priv.data[2]);
+
+	if (SOF_ABI_VERSION_INCOMPATIBLE(SOF_ABI_VERSION, abi_version)) {
+		dev_err(scomp->dev, "%s: Incompatible topology ABI version\n", __func__);
+		return -EINVAL;
+	}
+
+	if (SOF_ABI_VERSION_MINOR(abi_version) > SOF_ABI_MINOR) {
+		if (!IS_ENABLED(CONFIG_SND_SOC_SOF_STRICT_ABI_CHECKS)) {
+			dev_warn(scomp->dev, "%s: Topology ABI is more recent than kernel\n",
+				 __func__);
+		} else {
+			dev_err(scomp->dev, "%s: Topology ABI is more recent than kernel\n",
+				__func__);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 /* token list for each topology object */
 static enum sof_tokens host_token_list[] = {
 	SOF_CORE_TOKENS,
@@ -2413,4 +2460,5 @@ const struct sof_ipc_tplg_ops ipc3_tplg_ops = {
 	.dai_get_clk = sof_ipc3_dai_get_clk,
 	.set_up_all_pipelines = sof_ipc3_set_up_all_pipelines,
 	.tear_down_all_pipelines = sof_ipc3_tear_down_all_pipelines,
+	.parse_manifest = sof_ipc3_parse_manifest,
 };
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 9615034f8c70..27ad48990383 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -16,6 +16,7 @@
 #include "ops.h"
 
 #define SOF_IPC4_GAIN_PARAM_ID  0
+#define SOF_IPC4_TPLG_ABI_SIZE 6
 
 static const struct sof_topology_token ipc4_sched_tokens[] = {
 	{SOF_TKN_SCHED_LP_MODE, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
@@ -1317,6 +1318,67 @@ static int sof_ipc4_dai_config(struct snd_sof_dev *sdev, struct snd_sof_widget *
 	return 0;
 }
 
+static int sof_ipc4_parse_manifest(struct snd_soc_component *scomp, int index,
+				   struct snd_soc_tplg_manifest *man)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+	struct sof_manifest_tlv *manifest_tlv;
+	struct sof_manifest *manifest;
+	u32 size = le32_to_cpu(man->priv.size);
+	u8 *man_ptr = man->priv.data;
+	u32 len_check;
+	int i;
+
+	if (!size || size < SOF_IPC4_TPLG_ABI_SIZE) {
+		dev_err(scomp->dev, "%s: Invalid topology ABI size: %u\n",
+			__func__, size);
+		return -EINVAL;
+	}
+
+	manifest = (struct sof_manifest *)man_ptr;
+
+	dev_info(scomp->dev,
+		 "Topology: ABI %d:%d:%d Kernel ABI %u:%u:%u\n",
+		  le16_to_cpu(manifest->abi_major), le16_to_cpu(manifest->abi_minor),
+		  le16_to_cpu(manifest->abi_patch),
+		  SOF_ABI_MAJOR, SOF_ABI_MINOR, SOF_ABI_PATCH);
+
+	/* TODO: Add ABI compatibility check */
+
+	/* no more data after the ABI version */
+	if (size <= SOF_IPC4_TPLG_ABI_SIZE)
+		return 0;
+
+	manifest_tlv = manifest->items;
+	len_check = sizeof(struct sof_manifest);
+	for (i = 0; i < le16_to_cpu(manifest->count); i++) {
+		len_check += sizeof(struct sof_manifest_tlv) + le32_to_cpu(manifest_tlv->size);
+		if (len_check > size)
+			return -EINVAL;
+
+		switch (le32_to_cpu(manifest_tlv->type)) {
+		case SOF_MANIFEST_DATA_TYPE_NHLT:
+			/* no NHLT in BIOS, so use the one from topology manifest */
+			if (ipc4_data->nhlt)
+				break;
+			ipc4_data->nhlt = devm_kmemdup(sdev->dev, manifest_tlv->data,
+						       le32_to_cpu(manifest_tlv->size), GFP_KERNEL);
+			if (!ipc4_data->nhlt)
+				return -ENOMEM;
+			break;
+		default:
+			dev_warn(scomp->dev, "Skipping unknown manifest data type %d\n",
+				 manifest_tlv->type);
+			break;
+		}
+		man_ptr += sizeof(struct sof_manifest_tlv) + le32_to_cpu(manifest_tlv->size);
+		manifest_tlv = (struct sof_manifest_tlv *)man_ptr;
+	}
+
+	return 0;
+}
+
 static enum sof_tokens host_token_list[] = {
 	SOF_COMP_TOKENS,
 	SOF_AUDIO_FMT_NUM_TOKENS,
@@ -1402,4 +1464,5 @@ const struct sof_ipc_tplg_ops ipc4_tplg_ops = {
 	.route_setup = sof_ipc4_route_setup,
 	.route_free = sof_ipc4_route_free,
 	.dai_config = sof_ipc4_dai_config,
+	.parse_manifest = sof_ipc4_parse_manifest,
 };
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index d896da1192c5..79486266081f 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -168,6 +168,7 @@ struct sof_ipc_tplg_widget_ops {
  * @dai_get_clk: Function pointer for getting the DAI clock setting
  * @set_up_all_pipelines: Function pointer for setting up all topology pipelines
  * @tear_down_all_pipelines: Function pointer for tearing down all topology pipelines
+ * @parse_manifest: Optional function pointer for ipc4 specific parsing of topology manifest
  */
 struct sof_ipc_tplg_ops {
 	const struct sof_ipc_tplg_widget_ops *widget;
@@ -185,6 +186,8 @@ struct sof_ipc_tplg_ops {
 	int (*dai_get_clk)(struct snd_sof_dev *sdev, struct snd_sof_dai *dai, int clk_type);
 	int (*set_up_all_pipelines)(struct snd_sof_dev *sdev, bool verify);
 	int (*tear_down_all_pipelines)(struct snd_sof_dev *sdev, bool verify);
+	int (*parse_manifest)(struct snd_soc_component *scomp, int index,
+			      struct snd_soc_tplg_manifest *man);
 };
 
 /** struct snd_sof_tuple - Tuple info
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 606dbca94246..1893c590f2f0 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -36,9 +36,6 @@
 #define TLV_STEP	1
 #define TLV_MUTE	2
 
-/* size of tplg abi in byte */
-#define SOF_TPLG_ABI_SIZE 3
-
 /**
  * sof_update_ipc_object - Parse multiple sets of tokens within the token array associated with the
  *			    token ID.
@@ -2020,45 +2017,11 @@ static int sof_complete(struct snd_soc_component *scomp)
 static int sof_manifest(struct snd_soc_component *scomp, int index,
 			struct snd_soc_tplg_manifest *man)
 {
-	u32 size;
-	u32 abi_version;
-
-	size = le32_to_cpu(man->priv.size);
-
-	/* backward compatible with tplg without ABI info */
-	if (!size) {
-		dev_dbg(scomp->dev, "No topology ABI info\n");
-		return 0;
-	}
-
-	if (size != SOF_TPLG_ABI_SIZE) {
-		dev_err(scomp->dev, "error: invalid topology ABI size\n");
-		return -EINVAL;
-	}
-
-	dev_info(scomp->dev,
-		 "Topology: ABI %d:%d:%d Kernel ABI %d:%d:%d\n",
-		 man->priv.data[0], man->priv.data[1],
-		 man->priv.data[2], SOF_ABI_MAJOR, SOF_ABI_MINOR,
-		 SOF_ABI_PATCH);
-
-	abi_version = SOF_ABI_VER(man->priv.data[0],
-				  man->priv.data[1],
-				  man->priv.data[2]);
-
-	if (SOF_ABI_VERSION_INCOMPATIBLE(SOF_ABI_VERSION, abi_version)) {
-		dev_err(scomp->dev, "error: incompatible topology ABI version\n");
-		return -EINVAL;
-	}
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
 
-	if (SOF_ABI_VERSION_MINOR(abi_version) > SOF_ABI_MINOR) {
-		if (!IS_ENABLED(CONFIG_SND_SOC_SOF_STRICT_ABI_CHECKS)) {
-			dev_warn(scomp->dev, "warn: topology ABI is more recent than kernel\n");
-		} else {
-			dev_err(scomp->dev, "error: topology ABI is more recent than kernel\n");
-			return -EINVAL;
-		}
-	}
+	if (ipc_tplg_ops->parse_manifest)
+		return ipc_tplg_ops->parse_manifest(scomp, index, man);
 
 	return 0;
 }
-- 
2.25.1

