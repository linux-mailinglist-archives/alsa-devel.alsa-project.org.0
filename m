Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB012614346
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Nov 2022 03:32:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A7161684;
	Tue,  1 Nov 2022 03:31:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A7161684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667269951;
	bh=za/Z9PfLJMMXCFFtbbmJABNMg+7cNftbJHk93bK/Hts=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pSzDrO3DjD6PyPIUb84SLEOnrDjPcN4/64ACHyMf5soqv/oELsQZ3j/zloOswYW71
	 DaWuX/ZsuMW4Aer07YtbDDRh6OJLjZKQq3UlRjLOy7tBqBikrPF+CGmifUiCx8vFzs
	 PyHpNu3WUWNyJ49R3YhmgP/Iw/nIYX3VAaViytdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B735F80557;
	Tue,  1 Nov 2022 03:30:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 839B3F80155; Tue,  1 Nov 2022 03:30:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCF85F8028D
 for <alsa-devel@alsa-project.org>; Tue,  1 Nov 2022 03:30:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCF85F8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ew10kWim"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667269843; x=1698805843;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=za/Z9PfLJMMXCFFtbbmJABNMg+7cNftbJHk93bK/Hts=;
 b=ew10kWimh6EBhYTapUMQyBlAX85hPcus7rg6fhsDt/HdU5MRz0e6NBRW
 phHA6jxDwI5a3WcpAqfJxjM6HnY/VfIS6VUc1RpmYPutBKMqXUyFP5X2J
 rOEczapoFqKE4DMRIWeL+u0Qowsm89Wvw4a3h2ryNTzegWC2EOkTMNx/F
 itMHPthdXRWwjiTDfJOvxlJ50Cf4MPENY7at6tE6gxc7/IhOS4voHjFA4
 Vgr1g/qWBnN1DNjLTfNbkhNaf0twqlOCNb1+O7osRYjMLQUwHEq4v2lAM
 JA+01/xAeJa6iCb81o/zDjUwyvZhaQ53dkDFOV1rO6J7+tNGTJNhvQeeQ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="371129623"
X-IronPort-AV: E=Sophos;i="5.95,229,1661842800"; d="scan'208";a="371129623"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 19:30:38 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="611709385"
X-IronPort-AV: E=Sophos;i="5.95,229,1661842800"; d="scan'208";a="611709385"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 19:30:36 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 2/2] soundwire: cadence: use dai_runtime_array instead of
 dma_data
Date: Tue,  1 Nov 2022 10:35:21 +0800
Message-Id: <20221101023521.2384586-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221101023521.2384586-1-yung-chuan.liao@linux.intel.com>
References: <20221101023521.2384586-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 bard.liao@intel.com, linux-kernel@vger.kernel.org
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

Simplify the code with a Cadence-specific dai_runtime_array, indexed
with dai->id, instead of abusing dma_data.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 30 +++++++++++++--------------
 drivers/soundwire/cadence_master.h |  5 +++++
 drivers/soundwire/intel.c          | 33 +++++++++++++++---------------
 3 files changed, 35 insertions(+), 33 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 235617b0542f..a1de363eba3f 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -1709,13 +1709,10 @@ int cdns_set_sdw_stream(struct snd_soc_dai *dai,
 	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
 	struct sdw_cdns_dai_runtime *dai_runtime;
 
+	dai_runtime = cdns->dai_runtime_array[dai->id];
+
 	if (stream) {
 		/* first paranoia check */
-		if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-			dai_runtime = dai->playback_dma_data;
-		else
-			dai_runtime = dai->capture_dma_data;
-
 		if (dai_runtime) {
 			dev_err(dai->dev,
 				"dai_runtime already allocated for dai %s\n",
@@ -1734,20 +1731,21 @@ int cdns_set_sdw_stream(struct snd_soc_dai *dai,
 		dai_runtime->link_id = cdns->instance;
 
 		dai_runtime->stream = stream;
+		dai_runtime->direction = direction;
 
-		if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-			dai->playback_dma_data = dai_runtime;
-		else
-			dai->capture_dma_data = dai_runtime;
+		cdns->dai_runtime_array[dai->id] = dai_runtime;
 	} else {
+		/* second paranoia check */
+		if (!dai_runtime) {
+			dev_err(dai->dev,
+				"dai_runtime not allocated for dai %s\n",
+				dai->name);
+			return -EINVAL;
+		}
+
 		/* for NULL stream we release allocated dai_runtime */
-		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
-			kfree(dai->playback_dma_data);
-			dai->playback_dma_data = NULL;
-		} else {
-			kfree(dai->capture_dma_data);
-			dai->capture_dma_data = NULL;
-		}
+		kfree(dai_runtime);
+		cdns->dai_runtime_array[dai->id] = NULL;
 	}
 	return 0;
 }
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index 93f23bd46e2c..0434d70d4b1f 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -81,6 +81,7 @@ struct sdw_cdns_stream_config {
  * @hw_params: hw_params to be applied in .prepare step
  * @suspended: status set when suspended, to be used in .prepare
  * @paused: status set in .trigger, to be used in suspend
+ * @direction: stream direction
  */
 struct sdw_cdns_dai_runtime {
 	char *name;
@@ -92,6 +93,7 @@ struct sdw_cdns_dai_runtime {
 	struct snd_pcm_hw_params *hw_params;
 	bool suspended;
 	bool paused;
+	int direction;
 };
 
 /**
@@ -108,6 +110,7 @@ struct sdw_cdns_dai_runtime {
  * @registers: Cadence registers
  * @link_up: Link status
  * @msg_count: Messages sent on bus
+ * @dai_runtime_array: runtime context for each allocated DAI.
  */
 struct sdw_cdns {
 	struct device *dev;
@@ -135,6 +138,8 @@ struct sdw_cdns {
 	struct work_struct work;
 
 	struct list_head list;
+
+	struct sdw_cdns_dai_runtime **dai_runtime_array;
 };
 
 #define bus_to_cdns(_bus) container_of(_bus, struct sdw_cdns, bus)
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 1e9c6df4b62c..e8855a2115f6 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -831,7 +831,7 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 	int ch, dir;
 	int ret;
 
-	dai_runtime = snd_soc_dai_get_dma_data(dai, substream);
+	dai_runtime = cdns->dai_runtime_array[dai->id];
 	if (!dai_runtime)
 		return -EIO;
 
@@ -902,7 +902,7 @@ static int intel_prepare(struct snd_pcm_substream *substream,
 	int ch, dir;
 	int ret = 0;
 
-	dai_runtime = snd_soc_dai_get_dma_data(dai, substream);
+	dai_runtime = cdns->dai_runtime_array[dai->id];
 	if (!dai_runtime) {
 		dev_err(dai->dev, "failed to get dai runtime in %s\n",
 			__func__);
@@ -949,7 +949,7 @@ intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 	struct sdw_cdns_dai_runtime *dai_runtime;
 	int ret;
 
-	dai_runtime = snd_soc_dai_get_dma_data(dai, substream);
+	dai_runtime = cdns->dai_runtime_array[dai->id];
 	if (!dai_runtime)
 		return -EIO;
 
@@ -996,13 +996,10 @@ static int intel_pcm_set_sdw_stream(struct snd_soc_dai *dai,
 static void *intel_get_sdw_stream(struct snd_soc_dai *dai,
 				  int direction)
 {
+	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
 	struct sdw_cdns_dai_runtime *dai_runtime;
 
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai_runtime = dai->playback_dma_data;
-	else
-		dai_runtime = dai->capture_dma_data;
-
+	dai_runtime = cdns->dai_runtime_array[dai->id];
 	if (!dai_runtime)
 		return ERR_PTR(-EINVAL);
 
@@ -1025,7 +1022,7 @@ static int intel_trigger(struct snd_pcm_substream *substream, int cmd, struct sn
 	if (res->ops && res->ops->trigger)
 		res->ops->trigger(dai, cmd, substream->stream);
 
-	dai_runtime = snd_soc_dai_get_dma_data(dai, substream);
+	dai_runtime = cdns->dai_runtime_array[dai->id];
 	if (!dai_runtime) {
 		dev_err(dai->dev, "failed to get dai runtime in %s\n",
 			__func__);
@@ -1092,15 +1089,9 @@ static int intel_component_dais_suspend(struct snd_soc_component *component)
 		struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
 		struct sdw_intel *sdw = cdns_to_intel(cdns);
 		struct sdw_cdns_dai_runtime *dai_runtime;
-		int stream;
 		int ret;
 
-		dai_runtime = dai->playback_dma_data;
-		stream = SNDRV_PCM_STREAM_PLAYBACK;
-		if (!dai_runtime) {
-			dai_runtime = dai->capture_dma_data;
-			stream = SNDRV_PCM_STREAM_CAPTURE;
-		}
+		dai_runtime = cdns->dai_runtime_array[dai->id];
 
 		if (!dai_runtime)
 			continue;
@@ -1111,7 +1102,7 @@ static int intel_component_dais_suspend(struct snd_soc_component *component)
 		if (dai_runtime->paused) {
 			dai_runtime->suspended = true;
 
-			ret = intel_free_stream(sdw, stream, dai, sdw->instance);
+			ret = intel_free_stream(sdw, dai_runtime->direction, dai, sdw->instance);
 			if (ret < 0)
 				return ret;
 		}
@@ -1178,6 +1169,7 @@ static int intel_create_dai(struct sdw_cdns *cdns,
 
 static int intel_register_dai(struct sdw_intel *sdw)
 {
+	struct sdw_cdns_dai_runtime **dai_runtime_array;
 	struct sdw_cdns_stream_config config;
 	struct sdw_cdns *cdns = &sdw->cdns;
 	struct sdw_cdns_streams *stream;
@@ -1195,6 +1187,13 @@ static int intel_register_dai(struct sdw_intel *sdw)
 	/* DAIs are created based on total number of PDIs supported */
 	num_dai = cdns->pcm.num_pdi;
 
+	dai_runtime_array = devm_kcalloc(cdns->dev, num_dai,
+					 sizeof(struct sdw_cdns_dai_runtime *),
+					 GFP_KERNEL);
+	if (!dai_runtime_array)
+		return -ENOMEM;
+	cdns->dai_runtime_array = dai_runtime_array;
+
 	dais = devm_kcalloc(cdns->dev, num_dai, sizeof(*dais), GFP_KERNEL);
 	if (!dais)
 		return -ENOMEM;
-- 
2.25.1

