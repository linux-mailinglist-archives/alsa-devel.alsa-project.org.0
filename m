Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 810E060E235
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 15:35:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1F6A3B8C;
	Wed, 26 Oct 2022 15:34:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1F6A3B8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666791332;
	bh=NsJmPVt+8agbdyo4czw40hmJ1dfNofdKr65WNqFQ75k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J/12tBpPg8tYN0PRhvpofdXnU6rzQCEhgJi6FHrxdoAEAl9/k6JG2H6Bqq+nj7iqN
	 RPKKXprs3LKMowBGoQWvOoNdXfutZNUo1HyNomf23WHfD7YTww8dr3Q4307AwdhftH
	 DYXTuVup6LWAAw5nu0/nTUSGVhNPx4TTgZvBoKgY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5793CF80271;
	Wed, 26 Oct 2022 15:33:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 313C3F80564; Wed, 26 Oct 2022 15:33:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0276BF804B4
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 15:33:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0276BF804B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bsdrZ93F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666791218; x=1698327218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NsJmPVt+8agbdyo4czw40hmJ1dfNofdKr65WNqFQ75k=;
 b=bsdrZ93F0CG7KJDp62CBipyHYwa3Ov9pcyEaUiPnZd3HcTS564tLaOJF
 ThuyNbtuYWo71lSjQNKJ4RjeOzhQGhHYxZnQ2suuAOGJeSo/cDDpjr0Ka
 iocc/eErNuxnaxvlydbmxFlN4O0u7rtJzLagx+DpKTgBAjxHDWw3FoK7S
 K2t2E1f/pPohj1vwfEmYW3rV4VkJ8dZ3HZS6kMeY3b0lD0fl/J6qx3xCI
 B2HLfxRN/OitaphCEQv7MF7rtvBX85+oZhJjMQHwT/ksbHIlyt56us2bw
 eWqPWx5rlECtNyNt1q56aGWUty6f+cyx7OSIqgbAM1AX8cCS6hnWf4+P7 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="372155615"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; d="scan'208";a="372155615"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 06:33:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="609952685"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; d="scan'208";a="609952685"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 26 Oct 2022 06:33:32 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 4/9] ASoC: Intel: avs: Handle SUSPEND and RESUME triggers
Date: Wed, 26 Oct 2022 15:50:09 +0200
Message-Id: <20221026135014.1403705-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221026135014.1403705-1-cezary.rojewski@intel.com>
References: <20221026135014.1403705-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

With power management operations added, service SUSPEND and RESUME
trigger commands for running streams.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 75 +++++++++++++++++++++++++++++++--------
 1 file changed, 60 insertions(+), 15 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 94edb4a919f5..88a85a7786b7 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -208,30 +208,43 @@ static int avs_dai_nonhda_be_prepare(struct snd_pcm_substream *substream, struct
 static int avs_dai_nonhda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 				     struct snd_soc_dai *dai)
 {
+	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
 	struct avs_dma_data *data;
 	int ret = 0;
 
 	data = snd_soc_dai_get_dma_data(dai, substream);
 
 	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_RESUME:
+		if (rtd->dai_link->ignore_suspend)
+			break;
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		ret = avs_path_pause(data->path);
+		if (ret < 0) {
+			dev_err(dai->dev, "pause BE path failed: %d\n", ret);
+			break;
+		}
+
 		ret = avs_path_run(data->path, AVS_TPLG_TRIGGER_AUTO);
 		if (ret < 0)
 			dev_err(dai->dev, "run BE path failed: %d\n", ret);
 		break;
 
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		if (rtd->dai_link->ignore_suspend)
+			break;
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_STOP:
 		ret = avs_path_pause(data->path);
 		if (ret < 0)
 			dev_err(dai->dev, "pause BE path failed: %d\n", ret);
 
-		if (cmd == SNDRV_PCM_TRIGGER_STOP) {
-			ret = avs_path_reset(data->path);
-			if (ret < 0)
-				dev_err(dai->dev, "reset BE path failed: %d\n", ret);
-		}
+		ret = avs_path_reset(data->path);
+		if (ret < 0)
+			dev_err(dai->dev, "reset BE path failed: %d\n", ret);
 		break;
 
 	default:
@@ -351,6 +364,7 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 				  struct snd_soc_dai *dai)
 {
+	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
 	struct hdac_ext_stream *link_stream;
 	struct avs_dma_data *data;
 	int ret = 0;
@@ -361,15 +375,29 @@ static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 	link_stream = substream->runtime->private_data;
 
 	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_RESUME:
+		if (rtd->dai_link->ignore_suspend)
+			break;
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		snd_hdac_ext_stream_start(link_stream);
 
+		ret = avs_path_pause(data->path);
+		if (ret < 0) {
+			dev_err(dai->dev, "pause BE path failed: %d\n", ret);
+			break;
+		}
+
 		ret = avs_path_run(data->path, AVS_TPLG_TRIGGER_AUTO);
 		if (ret < 0)
 			dev_err(dai->dev, "run BE path failed: %d\n", ret);
 		break;
 
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		if (rtd->dai_link->ignore_suspend)
+			break;
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_STOP:
 		ret = avs_path_pause(data->path);
@@ -378,11 +406,9 @@ static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 
 		snd_hdac_ext_stream_clear(link_stream);
 
-		if (cmd == SNDRV_PCM_TRIGGER_STOP) {
-			ret = avs_path_reset(data->path);
-			if (ret < 0)
-				dev_err(dai->dev, "reset BE path failed: %d\n", ret);
-		}
+		ret = avs_path_reset(data->path);
+		if (ret < 0)
+			dev_err(dai->dev, "reset BE path failed: %d\n", ret);
 		break;
 
 	default:
@@ -587,6 +613,7 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 
 static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, struct snd_soc_dai *dai)
 {
+	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
 	struct avs_dma_data *data;
 	struct hdac_ext_stream *host_stream;
 	struct hdac_bus *bus;
@@ -598,17 +625,36 @@ static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, stru
 	bus = hdac_stream(host_stream)->bus;
 
 	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_RESUME:
+		if (rtd->dai_link->ignore_suspend)
+			break;
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		spin_lock_irqsave(&bus->reg_lock, flags);
 		snd_hdac_stream_start(hdac_stream(host_stream), true);
 		spin_unlock_irqrestore(&bus->reg_lock, flags);
 
+		/* Timeout on DRSM poll shall not stop the resume so ignore the result. */
+		if (cmd == SNDRV_PCM_TRIGGER_RESUME)
+			snd_hdac_stream_wait_drsm(hdac_stream(host_stream));
+
+		ret = avs_path_pause(data->path);
+		if (ret < 0) {
+			dev_err(dai->dev, "pause FE path failed: %d\n", ret);
+			break;
+		}
+
 		ret = avs_path_run(data->path, AVS_TPLG_TRIGGER_AUTO);
 		if (ret < 0)
 			dev_err(dai->dev, "run FE path failed: %d\n", ret);
+
 		break;
 
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		if (rtd->dai_link->ignore_suspend)
+			break;
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_STOP:
 		ret = avs_path_pause(data->path);
@@ -619,11 +665,9 @@ static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, stru
 		snd_hdac_stream_stop(hdac_stream(host_stream));
 		spin_unlock_irqrestore(&bus->reg_lock, flags);
 
-		if (cmd == SNDRV_PCM_TRIGGER_STOP) {
-			ret = avs_path_reset(data->path);
-			if (ret < 0)
-				dev_err(dai->dev, "reset FE path failed: %d\n", ret);
-		}
+		ret = avs_path_reset(data->path);
+		if (ret < 0)
+			dev_err(dai->dev, "reset FE path failed: %d\n", ret);
 		break;
 
 	default:
@@ -979,6 +1023,7 @@ static int avs_component_open(struct snd_soc_component *component,
 			SNDRV_PCM_INFO_MMAP_VALID |
 			SNDRV_PCM_INFO_INTERLEAVED |
 			SNDRV_PCM_INFO_PAUSE |
+			SNDRV_PCM_INFO_RESUME |
 			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP;
 
 	hwparams.formats = SNDRV_PCM_FMTBIT_S16_LE |
-- 
2.25.1

