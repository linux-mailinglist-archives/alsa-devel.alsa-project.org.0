Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA66FCD98
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 19:32:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E511E167B;
	Thu, 14 Nov 2019 19:31:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E511E167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573756334;
	bh=bCccdcaTWqnC282D4jYSqhIpVEcGPfeq7nUhIbeR4+w=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PIi/eEuEM0Hf4TfFcHskLDtK/mXvypVO08rEssr9NE0HrKfcqDO1ZQsLN+YoIG3bz
	 tHXeMUboHREkVfOIDFqQoixQgcfR6dCTZqJVJn/Vnx1dHs6lJ0WZvr9MCjNk/hp+3b
	 iIg2mFFja2/YCcdI42AvJA6MIULMlPGZVj1pqMSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F117F80269;
	Thu, 14 Nov 2019 19:18:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23047F8015D; Thu, 14 Nov 2019 19:18:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4E91F80139
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 19:18:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4E91F80139
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 10:18:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; d="scan'208";a="195123610"
Received: from chiahuil-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.228.77])
 by orsmga007.jf.intel.com with ESMTP; 14 Nov 2019 10:18:05 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 14 Nov 2019 12:17:01 -0600
Message-Id: <20191114181702.22254-22-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191114181702.22254-1-pierre-louis.bossart@linux.intel.com>
References: <20191114181702.22254-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v3 21/22] soundwire: intel: reinitialize IP+DSP
	in .prepare(), but only when resuming
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

The .prepare() callback is invoked for normal streaming, underflows or
during the system resume transition. In the latter case, the context
for the ALH PDIs is lost, and the DSP is not initialized properly
either, but the bus parameters don't need to be recomputed.

Conversely, when doing a regular .prepare() during an underflow, the
ALH/SHIM registers shall not be changed as the hardware cannot be
reprogrammed after the DMA started (hardware spec requirement).

This patch adds storage of PDI and hw_params in the DAI dma context,
and the difference between the types of .prepare() usages is handled
via a simple boolean, updated when suspending, and tested for in the
.prepare() case.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.h |  4 ++
 drivers/soundwire/intel.c          | 69 +++++++++++++++++++++++++++++-
 2 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index 0f108fd31fd9..cd4feef0b900 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -81,6 +81,8 @@ struct sdw_cdns_stream_config {
  * @bus: Bus handle
  * @stream_type: Stream type
  * @link_id: Master link id
+ * @hw_params: hw_params to be applied in .prepare step
+ * @suspended: status set when suspended, to be used in .prepare
  */
 struct sdw_cdns_dma_data {
 	char *name;
@@ -89,6 +91,8 @@ struct sdw_cdns_dma_data {
 	struct sdw_bus *bus;
 	enum sdw_stream_type stream_type;
 	int link_id;
+	struct snd_pcm_hw_params *hw_params;
+	bool suspended;
 };
 
 /**
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 460e2d8cf80d..b114e9a72fdc 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -813,6 +813,10 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 	intel_pdi_alh_configure(sdw, pdi);
 	sdw_cdns_config_stream(cdns, ch, dir, pdi);
 
+	/* store pdi and hw_params, may be needed in prepare step */
+	dma->suspended = false;
+	dma->pdi = pdi;
+	dma->hw_params = params;
 
 	/* Inform DSP about PDI stream number */
 	ret = intel_params_stream(sdw, substream, dai, params,
@@ -856,7 +860,11 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 static int intel_prepare(struct snd_pcm_substream *substream,
 			 struct snd_soc_dai *dai)
 {
+	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
+	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	struct sdw_cdns_dma_data *dma;
+	int ch, dir;
+	int ret;
 
 	dma = snd_soc_dai_get_dma_data(dai, substream);
 	if (!dma) {
@@ -865,7 +873,42 @@ static int intel_prepare(struct snd_pcm_substream *substream,
 		return -EIO;
 	}
 
-	return sdw_prepare_stream(dma->stream);
+	if (dma->suspended) {
+
+		dma->suspended = false;
+
+		/*
+		 * .prepare() is called after system resume, where we
+		 * need to reinitialize the SHIM/ALH/Cadence IP.
+		 * .prepare() is also called to deal with underflows,
+		 * but in those cases we cannot touch ALH/SHIM
+		 * registers
+		 */
+
+		/* configure stream */
+		ch = params_channels(dma->hw_params);
+		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+			dir = SDW_DATA_DIR_RX;
+		else
+			dir = SDW_DATA_DIR_TX;
+
+		intel_pdi_shim_configure(sdw, dma->pdi);
+		intel_pdi_alh_configure(sdw, dma->pdi);
+		sdw_cdns_config_stream(cdns, ch, dir, dma->pdi);
+
+		/* Inform DSP about PDI stream number */
+		ret = intel_params_stream(sdw, substream, dai,
+					  dma->hw_params,
+					  sdw->instance,
+					  dma->pdi->intel_alh_id);
+		if (ret)
+			goto err;
+	}
+
+	ret = sdw_prepare_stream(dma->stream);
+
+err:
+	return ret;
 }
 
 static int intel_trigger(struct snd_pcm_substream *substream, int cmd,
@@ -936,6 +979,8 @@ intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 		return ret;
 	}
 
+	dma->hw_params = NULL;
+	dma->pdi = NULL;
 	sdw_release_stream(dma->stream);
 
 	return 0;
@@ -958,6 +1003,26 @@ static void intel_shutdown(struct snd_pcm_substream *substream,
 	pm_runtime_put_autosuspend(cdns->dev);
 }
 
+static int intel_dai_suspend(struct snd_soc_dai *dai)
+{
+	struct sdw_cdns_dma_data *dma;
+
+	/*
+	 * we don't have a .suspend dai_ops, and we don't have access
+	 * to the substream, so let's mark both capture and playback
+	 * DMA contexts as suspended
+	 */
+	dma = dai->playback_dma_data;
+	if (dma)
+		dma->suspended = true;
+
+	dma = dai->capture_dma_data;
+	if (dma)
+		dma->suspended = true;
+
+	return 0;
+}
+
 static int intel_pcm_set_sdw_stream(struct snd_soc_dai *dai,
 				    void *stream, int direction)
 {
@@ -1029,6 +1094,8 @@ static int intel_create_dai(struct sdw_cdns *cdns,
 			dais[i].ops = &intel_pcm_dai_ops;
 		else
 			dais[i].ops = &intel_pdm_dai_ops;
+
+		dais[i].suspend = intel_dai_suspend;
 	}
 
 	return 0;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
