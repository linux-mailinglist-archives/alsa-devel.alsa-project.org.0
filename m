Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC4F47EA8A
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Dec 2021 03:13:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF92918C3;
	Fri, 24 Dec 2021 03:13:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF92918C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640312036;
	bh=Qr1k8QvmAcJoQssUFcyReuW9Oo56PdzWotwvQZn1//g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zzj1PJ0KBTjoLMRrnZkFSYIvFwfQLWHSAxj/ARi6be0Lgjs18zT/tZODdufW5GeGQ
	 bvooif7uVMIN6WwEnwJwMxLVdNz6bDNNUfTlNDgNVODTXGRgzdvG+tlBiPjHUGJc2J
	 JTONSWfFdhWMrfdW4YgEuMJDt0KeKwIvtFDE9pOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E33FAF8051C;
	Fri, 24 Dec 2021 03:11:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BFADF804E4; Fri, 24 Dec 2021 03:11:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B17F5F80104
 for <alsa-devel@alsa-project.org>; Fri, 24 Dec 2021 03:11:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B17F5F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YRzrFV5s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640311884; x=1671847884;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=Qr1k8QvmAcJoQssUFcyReuW9Oo56PdzWotwvQZn1//g=;
 b=YRzrFV5slhOlBsDB0FzGztl5Tr33FVdgBy9NnbKlM5TBGy4GaIq9mWni
 hPVmRk7Q8Ogzkcikcqml0c551aT9gRDrjSDTCr7QeZbCOHC9gwqsUkOHS
 00rN6gVozhRJyso7vsCuPQHzbCwMs6k/dXF4e3yGtrJ3Gx19MgS2h2mmi
 fPcA+bFN7bmyPY/pORPo2UFn9qgDP0KdyBOwE5FEFWK7Q4oXpjHJyrtsv
 mqQuxh3akn7bDIf/BYdXjLYgHO1exbzywJFiT4+0ijC49JXZRm2pv2TKV
 pDw06BMouT/IciTSRx1xXRuBEWLkeQXY+52ClVB2Y9xufjkmlE4yiXOR0 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10207"; a="265127374"
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; d="scan'208";a="265127374"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 18:11:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,231,1635231600"; d="scan'208";a="467156211"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 18:10:58 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 2/7] ASoC/soundwire: intel: simplify callbacks for
 params/hw_free
Date: Fri, 24 Dec 2021 10:10:29 +0800
Message-Id: <20211224021034.26635-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211224021034.26635-1-yung-chuan.liao@linux.intel.com>
References: <20211224021034.26635-1-yung-chuan.liao@linux.intel.com>
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
Acked-By: Vinod Koul <vkoul@kernel.org>
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
index 99255028d3fe..c8fb082209ce 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -184,12 +184,11 @@ static int sdw_dai_config_ipc(struct snd_sof_dev *sdev,
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
@@ -198,12 +197,11 @@ static int sdw_params_stream(struct device *dev,
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

