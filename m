Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D28F614345
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Nov 2022 03:32:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CE96167E;
	Tue,  1 Nov 2022 03:31:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CE96167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667269929;
	bh=Nha+cAjfFYdN1e072igYPcVQvV7I74uH4Vu/8Q6fFzs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RPml3V5sYc44Jrq7x0M3P87wWR1alxt/eaSklEfnfX7wohVCuHeUdwo7u5JiBRlhL
	 mUFly7wGHxslfxEEESIv8ieT/aUPTmVXYqa36Z2KW2QUwRoLeXa0jeKhVb42OOya1H
	 bpvGGRjDajHQ8DXmp6XkadauO8KvdLfVUgx10iEQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97CC0F80249;
	Tue,  1 Nov 2022 03:30:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F106F804AB; Tue,  1 Nov 2022 03:30:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 443C3F80155
 for <alsa-devel@alsa-project.org>; Tue,  1 Nov 2022 03:30:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 443C3F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cnzguz48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667269842; x=1698805842;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nha+cAjfFYdN1e072igYPcVQvV7I74uH4Vu/8Q6fFzs=;
 b=cnzguz488Obq2MsKAYJD3UbSqHep9QSuMokpvnK2Hzj1PB+bOqwUnjOL
 2JG72xgGjO8zmLONFq1Q33kSCXKUzsiPRacMLvi6OF1uXKGVaJ4QeYXz/
 0chA5LIKzDMxYODlffiiUdz88H2/lUFT/DUfmgH7spRmLA95Ie7+j6SUg
 0X1jHsEXHvhZgKVGBOxewl/NaWA/y+9BszjYq+PR95Z26f+YuajcLBFyk
 858z3OeYg140KIJUF5cWApcXvAN5zQ30d1fDgFQy02KqXUHBcIBz4Feyj
 1fGmD0T+PUpNgxSW0YvMfQHvowHMOElRpae0bgxA8a34maJl/mLSTBvtl g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="371129618"
X-IronPort-AV: E=Sophos;i="5.95,229,1661842800"; d="scan'208";a="371129618"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 19:30:36 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="611709369"
X-IronPort-AV: E=Sophos;i="5.95,229,1661842800"; d="scan'208";a="611709369"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 19:30:34 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 1/2] soundwire: cadence: rename sdw_cdns_dai_dma_data as
 sdw_cdns_dai_runtime
Date: Tue,  1 Nov 2022 10:35:20 +0800
Message-Id: <20221101023521.2384586-2-yung-chuan.liao@linux.intel.com>
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

The existing 'struct sdw_cdns_dma_data' has really nothing to do with
DMAs. The information is stored in the dai->dma_data, but this is
really private data that should be stored in a different context.

Beyond the academic elegance discussion, using dma_data is a problem
for new Intel hardware where the dma_data structure is already used
for true DMA handling performed by other parts of the code.

This patch prepares a transition away from the use of dma_data, for
now with a rename-only change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 30 +++++-----
 drivers/soundwire/cadence_master.h |  4 +-
 drivers/soundwire/intel.c          | 96 +++++++++++++++---------------
 3 files changed, 65 insertions(+), 65 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 93929f19d083..235617b0542f 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -1707,40 +1707,40 @@ int cdns_set_sdw_stream(struct snd_soc_dai *dai,
 			void *stream, int direction)
 {
 	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
-	struct sdw_cdns_dma_data *dma;
+	struct sdw_cdns_dai_runtime *dai_runtime;
 
 	if (stream) {
 		/* first paranoia check */
 		if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-			dma = dai->playback_dma_data;
+			dai_runtime = dai->playback_dma_data;
 		else
-			dma = dai->capture_dma_data;
+			dai_runtime = dai->capture_dma_data;
 
-		if (dma) {
+		if (dai_runtime) {
 			dev_err(dai->dev,
-				"dma_data already allocated for dai %s\n",
+				"dai_runtime already allocated for dai %s\n",
 				dai->name);
 			return -EINVAL;
 		}
 
-		/* allocate and set dma info */
-		dma = kzalloc(sizeof(*dma), GFP_KERNEL);
-		if (!dma)
+		/* allocate and set dai_runtime info */
+		dai_runtime = kzalloc(sizeof(*dai_runtime), GFP_KERNEL);
+		if (!dai_runtime)
 			return -ENOMEM;
 
-		dma->stream_type = SDW_STREAM_PCM;
+		dai_runtime->stream_type = SDW_STREAM_PCM;
 
-		dma->bus = &cdns->bus;
-		dma->link_id = cdns->instance;
+		dai_runtime->bus = &cdns->bus;
+		dai_runtime->link_id = cdns->instance;
 
-		dma->stream = stream;
+		dai_runtime->stream = stream;
 
 		if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-			dai->playback_dma_data = dma;
+			dai->playback_dma_data = dai_runtime;
 		else
-			dai->capture_dma_data = dma;
+			dai->capture_dma_data = dai_runtime;
 	} else {
-		/* for NULL stream we release allocated dma_data */
+		/* for NULL stream we release allocated dai_runtime */
 		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
 			kfree(dai->playback_dma_data);
 			dai->playback_dma_data = NULL;
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index ca9e805bab88..93f23bd46e2c 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -70,7 +70,7 @@ struct sdw_cdns_stream_config {
 };
 
 /**
- * struct sdw_cdns_dma_data: Cadence DMA data
+ * struct sdw_cdns_dai_runtime: Cadence DAI runtime data
  *
  * @name: SoundWire stream name
  * @stream: stream runtime
@@ -82,7 +82,7 @@ struct sdw_cdns_stream_config {
  * @suspended: status set when suspended, to be used in .prepare
  * @paused: status set in .trigger, to be used in suspend
  */
-struct sdw_cdns_dma_data {
+struct sdw_cdns_dai_runtime {
 	char *name;
 	struct sdw_stream_runtime *stream;
 	struct sdw_cdns_pdi *pdi;
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 244209358784..1e9c6df4b62c 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -824,15 +824,15 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 {
 	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
-	struct sdw_cdns_dma_data *dma;
+	struct sdw_cdns_dai_runtime *dai_runtime;
 	struct sdw_cdns_pdi *pdi;
 	struct sdw_stream_config sconfig;
 	struct sdw_port_config *pconfig;
 	int ch, dir;
 	int ret;
 
-	dma = snd_soc_dai_get_dma_data(dai, substream);
-	if (!dma)
+	dai_runtime = snd_soc_dai_get_dma_data(dai, substream);
+	if (!dai_runtime)
 		return -EIO;
 
 	ch = params_channels(params);
@@ -854,10 +854,10 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 	sdw_cdns_config_stream(cdns, ch, dir, pdi);
 
 	/* store pdi and hw_params, may be needed in prepare step */
-	dma->paused = false;
-	dma->suspended = false;
-	dma->pdi = pdi;
-	dma->hw_params = params;
+	dai_runtime->paused = false;
+	dai_runtime->suspended = false;
+	dai_runtime->pdi = pdi;
+	dai_runtime->hw_params = params;
 
 	/* Inform DSP about PDI stream number */
 	ret = intel_params_stream(sdw, substream->stream, dai, params,
@@ -869,7 +869,7 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 	sconfig.direction = dir;
 	sconfig.ch_count = ch;
 	sconfig.frame_rate = params_rate(params);
-	sconfig.type = dma->stream_type;
+	sconfig.type = dai_runtime->stream_type;
 
 	sconfig.bps = snd_pcm_format_width(params_format(params));
 
@@ -884,7 +884,7 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 	pconfig->ch_mask = (1 << ch) - 1;
 
 	ret = sdw_stream_add_master(&cdns->bus, &sconfig,
-				    pconfig, 1, dma->stream);
+				    pconfig, 1, dai_runtime->stream);
 	if (ret)
 		dev_err(cdns->dev, "add master to stream failed:%d\n", ret);
 
@@ -898,19 +898,19 @@ static int intel_prepare(struct snd_pcm_substream *substream,
 {
 	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
-	struct sdw_cdns_dma_data *dma;
+	struct sdw_cdns_dai_runtime *dai_runtime;
 	int ch, dir;
 	int ret = 0;
 
-	dma = snd_soc_dai_get_dma_data(dai, substream);
-	if (!dma) {
-		dev_err(dai->dev, "failed to get dma data in %s\n",
+	dai_runtime = snd_soc_dai_get_dma_data(dai, substream);
+	if (!dai_runtime) {
+		dev_err(dai->dev, "failed to get dai runtime in %s\n",
 			__func__);
 		return -EIO;
 	}
 
-	if (dma->suspended) {
-		dma->suspended = false;
+	if (dai_runtime->suspended) {
+		dai_runtime->suspended = false;
 
 		/*
 		 * .prepare() is called after system resume, where we
@@ -921,21 +921,21 @@ static int intel_prepare(struct snd_pcm_substream *substream,
 		 */
 
 		/* configure stream */
-		ch = params_channels(dma->hw_params);
+		ch = params_channels(dai_runtime->hw_params);
 		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
 			dir = SDW_DATA_DIR_RX;
 		else
 			dir = SDW_DATA_DIR_TX;
 
-		intel_pdi_shim_configure(sdw, dma->pdi);
-		intel_pdi_alh_configure(sdw, dma->pdi);
-		sdw_cdns_config_stream(cdns, ch, dir, dma->pdi);
+		intel_pdi_shim_configure(sdw, dai_runtime->pdi);
+		intel_pdi_alh_configure(sdw, dai_runtime->pdi);
+		sdw_cdns_config_stream(cdns, ch, dir, dai_runtime->pdi);
 
 		/* Inform DSP about PDI stream number */
 		ret = intel_params_stream(sdw, substream->stream, dai,
-					  dma->hw_params,
+					  dai_runtime->hw_params,
 					  sdw->instance,
-					  dma->pdi->intel_alh_id);
+					  dai_runtime->pdi->intel_alh_id);
 	}
 
 	return ret;
@@ -946,11 +946,11 @@ intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
-	struct sdw_cdns_dma_data *dma;
+	struct sdw_cdns_dai_runtime *dai_runtime;
 	int ret;
 
-	dma = snd_soc_dai_get_dma_data(dai, substream);
-	if (!dma)
+	dai_runtime = snd_soc_dai_get_dma_data(dai, substream);
+	if (!dai_runtime)
 		return -EIO;
 
 	/*
@@ -959,10 +959,10 @@ intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 	 * DEPREPARED for the first cpu-dai and to RELEASED for the last
 	 * cpu-dai.
 	 */
-	ret = sdw_stream_remove_master(&cdns->bus, dma->stream);
+	ret = sdw_stream_remove_master(&cdns->bus, dai_runtime->stream);
 	if (ret < 0) {
 		dev_err(dai->dev, "remove master from stream %s failed: %d\n",
-			dma->stream->name, ret);
+			dai_runtime->stream->name, ret);
 		return ret;
 	}
 
@@ -972,8 +972,8 @@ intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 		return ret;
 	}
 
-	dma->hw_params = NULL;
-	dma->pdi = NULL;
+	dai_runtime->hw_params = NULL;
+	dai_runtime->pdi = NULL;
 
 	return 0;
 }
@@ -996,17 +996,17 @@ static int intel_pcm_set_sdw_stream(struct snd_soc_dai *dai,
 static void *intel_get_sdw_stream(struct snd_soc_dai *dai,
 				  int direction)
 {
-	struct sdw_cdns_dma_data *dma;
+	struct sdw_cdns_dai_runtime *dai_runtime;
 
 	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dma = dai->playback_dma_data;
+		dai_runtime = dai->playback_dma_data;
 	else
-		dma = dai->capture_dma_data;
+		dai_runtime = dai->capture_dma_data;
 
-	if (!dma)
+	if (!dai_runtime)
 		return ERR_PTR(-EINVAL);
 
-	return dma->stream;
+	return dai_runtime->stream;
 }
 
 static int intel_trigger(struct snd_pcm_substream *substream, int cmd, struct snd_soc_dai *dai)
@@ -1014,7 +1014,7 @@ static int intel_trigger(struct snd_pcm_substream *substream, int cmd, struct sn
 	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	struct sdw_intel_link_res *res = sdw->link_res;
-	struct sdw_cdns_dma_data *dma;
+	struct sdw_cdns_dai_runtime *dai_runtime;
 	int ret = 0;
 
 	/*
@@ -1025,9 +1025,9 @@ static int intel_trigger(struct snd_pcm_substream *substream, int cmd, struct sn
 	if (res->ops && res->ops->trigger)
 		res->ops->trigger(dai, cmd, substream->stream);
 
-	dma = snd_soc_dai_get_dma_data(dai, substream);
-	if (!dma) {
-		dev_err(dai->dev, "failed to get dma data in %s\n",
+	dai_runtime = snd_soc_dai_get_dma_data(dai, substream);
+	if (!dai_runtime) {
+		dev_err(dai->dev, "failed to get dai runtime in %s\n",
 			__func__);
 		return -EIO;
 	}
@@ -1042,17 +1042,17 @@ static int intel_trigger(struct snd_pcm_substream *substream, int cmd, struct sn
 		 * the .trigger callback is used to track the suspend case only.
 		 */
 
-		dma->suspended = true;
+		dai_runtime->suspended = true;
 
 		ret = intel_free_stream(sdw, substream->stream, dai, sdw->instance);
 		break;
 
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		dma->paused = true;
+		dai_runtime->paused = true;
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		dma->paused = false;
+		dai_runtime->paused = false;
 		break;
 	default:
 		break;
@@ -1091,25 +1091,25 @@ static int intel_component_dais_suspend(struct snd_soc_component *component)
 	for_each_component_dais(component, dai) {
 		struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
 		struct sdw_intel *sdw = cdns_to_intel(cdns);
-		struct sdw_cdns_dma_data *dma;
+		struct sdw_cdns_dai_runtime *dai_runtime;
 		int stream;
 		int ret;
 
-		dma = dai->playback_dma_data;
+		dai_runtime = dai->playback_dma_data;
 		stream = SNDRV_PCM_STREAM_PLAYBACK;
-		if (!dma) {
-			dma = dai->capture_dma_data;
+		if (!dai_runtime) {
+			dai_runtime = dai->capture_dma_data;
 			stream = SNDRV_PCM_STREAM_CAPTURE;
 		}
 
-		if (!dma)
+		if (!dai_runtime)
 			continue;
 
-		if (dma->suspended)
+		if (dai_runtime->suspended)
 			continue;
 
-		if (dma->paused) {
-			dma->suspended = true;
+		if (dai_runtime->paused) {
+			dai_runtime->suspended = true;
 
 			ret = intel_free_stream(sdw, stream, dai, sdw->instance);
 			if (ret < 0)
-- 
2.25.1

