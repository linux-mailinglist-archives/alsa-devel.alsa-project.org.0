Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4614720B9
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 06:48:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9344718BB;
	Mon, 13 Dec 2021 06:47:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9344718BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639374517;
	bh=3wSkJo17bP0kVqc0aNtXBF4R/SEEB2MCtesMDTbXr1Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dgk+tdtGMPh4mEWCnjzul/hauSyckhrtZKJgHmdEwNBwdatpmcnjMu4/jFODhp7Vf
	 5AGiyFlxxb+8lEcXgwNynWNqszJ8rpiOs7c3hhz50gA/8J4nhdfYFpr1RvoyLCttPD
	 j0kR6ZA3YHCYl+YYJHhSkzE2pA/KfHk/vq+NEnPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51D46F80516;
	Mon, 13 Dec 2021 06:47:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E865F80511; Mon, 13 Dec 2021 06:47:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F3A8F8025D
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 06:46:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F3A8F8025D
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="237402024"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600"; d="scan'208";a="237402024"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 21:46:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600"; d="scan'208";a="517608148"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 21:46:50 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 2/7] ASoC/soundwire: intel: simplify callbacks for
 params/hw_free
Date: Mon, 13 Dec 2021 13:46:29 +0800
Message-Id: <20211213054634.30088-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211213054634.30088-1-yung-chuan.liao@linux.intel.com>
References: <20211213054634.30088-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com,
 bard.liao@intel.com
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

We don't really need to pass a substream to the callback, we only need
the direction. No functionality change, only simplification to enable
improve suspend with paused streams.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c           | 14 +++++++-------
 include/linux/soundwire/sdw_intel.h |  4 ++--
 sound/soc/sof/intel/hda.c           |  6 ++----
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 78037ffdb09b..25c5f5b9f058 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -711,7 +711,7 @@ intel_pdi_alh_configure(struct sdw_intel *sdw, struct sdw_cdns_pdi *pdi)
 }
 
 static int intel_params_stream(struct sdw_intel *sdw,
-			       struct snd_pcm_substream *substream,
+			       int stream,
 			       struct snd_soc_dai *dai,
 			       struct snd_pcm_hw_params *hw_params,
 			       int link_id, int alh_stream_id)
@@ -719,7 +719,7 @@ static int intel_params_stream(struct sdw_intel *sdw,
 	struct sdw_intel_link_res *res = sdw->link_res;
 	struct sdw_intel_stream_params_data params_data;
 
-	params_data.substream = substream;
+	params_data.stream = stream; /* direction */
 	params_data.dai = dai;
 	params_data.hw_params = hw_params;
 	params_data.link_id = link_id;
@@ -732,14 +732,14 @@ static int intel_params_stream(struct sdw_intel *sdw,
 }
 
 static int intel_free_stream(struct sdw_intel *sdw,
-			     struct snd_pcm_substream *substream,
+			     int stream,
 			     struct snd_soc_dai *dai,
 			     int link_id)
 {
 	struct sdw_intel_link_res *res = sdw->link_res;
 	struct sdw_intel_stream_free_data free_data;
 
-	free_data.substream = substream;
+	free_data.stream = stream; /* direction */
 	free_data.dai = dai;
 	free_data.link_id = link_id;
 
@@ -876,7 +876,7 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 	dma->hw_params = params;
 
 	/* Inform DSP about PDI stream number */
-	ret = intel_params_stream(sdw, substream, dai, params,
+	ret = intel_params_stream(sdw, substream->stream, dai, params,
 				  sdw->instance,
 				  pdi->intel_alh_id);
 	if (ret)
@@ -953,7 +953,7 @@ static int intel_prepare(struct snd_pcm_substream *substream,
 		sdw_cdns_config_stream(cdns, ch, dir, dma->pdi);
 
 		/* Inform DSP about PDI stream number */
-		ret = intel_params_stream(sdw, substream, dai,
+		ret = intel_params_stream(sdw, substream->stream, dai,
 					  dma->hw_params,
 					  sdw->instance,
 					  dma->pdi->intel_alh_id);
@@ -987,7 +987,7 @@ intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 		return ret;
 	}
 
-	ret = intel_free_stream(sdw, substream, dai, sdw->instance);
+	ret = intel_free_stream(sdw, substream->stream, dai, sdw->instance);
 	if (ret < 0) {
 		dev_err(dai->dev, "intel_free_stream: failed %d\n", ret);
 		return ret;
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 8a463b8fc12a..67e0d3e750b5 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -92,7 +92,7 @@
  * firmware.
  */
 struct sdw_intel_stream_params_data {
-	struct snd_pcm_substream *substream;
+	int stream;
 	struct snd_soc_dai *dai;
 	struct snd_pcm_hw_params *hw_params;
 	int link_id;
@@ -105,7 +105,7 @@ struct sdw_intel_stream_params_data {
  * firmware.
  */
 struct sdw_intel_stream_free_data {
-	struct snd_pcm_substream *substream;
+	int stream;
 	struct snd_soc_dai *dai;
 	int link_id;
 };
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 77b9cb551f4b..5f703ca884f9 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -185,12 +185,11 @@ static int sdw_dai_config_ipc(struct snd_sof_dev *sdev,
 static int sdw_params_stream(struct device *dev,
 			     struct sdw_intel_stream_params_data *params_data)
 {
-	struct snd_pcm_substream *substream = params_data->substream;
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct snd_soc_dai *d = params_data->dai;
 	struct snd_soc_dapm_widget *w;
 
-	w = snd_soc_dai_get_widget(d, substream->stream);
+	w = snd_soc_dai_get_widget(d, params_data->stream);
 
 	return sdw_dai_config_ipc(sdev, w, params_data->link_id, params_data->alh_stream_id,
 				  d->id, true);
@@ -199,12 +198,11 @@ static int sdw_params_stream(struct device *dev,
 static int sdw_free_stream(struct device *dev,
 			   struct sdw_intel_stream_free_data *free_data)
 {
-	struct snd_pcm_substream *substream = free_data->substream;
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct snd_soc_dai *d = free_data->dai;
 	struct snd_soc_dapm_widget *w;
 
-	w = snd_soc_dai_get_widget(d, substream->stream);
+	w = snd_soc_dai_get_widget(d, free_data->stream);
 
 	/* send invalid stream_id */
 	return sdw_dai_config_ipc(sdev, w, free_data->link_id, 0xFFFF, d->id, false);
-- 
2.17.1

