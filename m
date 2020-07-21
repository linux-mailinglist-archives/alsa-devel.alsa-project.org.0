Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D29432293AC
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 10:37:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E6C51672;
	Wed, 22 Jul 2020 10:36:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E6C51672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595407031;
	bh=j/d8LrTqTg9NRnIENLkNengO0ejjX0xy2lnuSgVoZyg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yt8RcweqdZT9Sqb9yk9D+aqZB6Uru4m/QMagrZKT51eGnClZ9zn1IUqbAJBBuqMyM
	 BtXfzbSvPztuUFebplsNFjKa50v1PgKauWLGYmcMotUfGaSJGpzK9V36M38ZsJLXvl
	 SPeGNhKQT7C7EuHkj057ORMf7B3lN6nFoRbriW30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96EEEF802F9;
	Wed, 22 Jul 2020 10:32:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A1A3F802E2; Wed, 22 Jul 2020 10:32:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E57EF8028D
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 10:32:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E57EF8028D
IronPort-SDR: KnDfOUp+rQCSRg3oaIVTlqeE1t4a1qDuSfOhjV25FisVVXHoDg/xzpTcdbwHUK1OQmp4wQgFTF
 jYLWj21jpCcg==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="149457281"
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; d="scan'208";a="149457281"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 01:32:09 -0700
IronPort-SDR: ePqHA0shHAO63upLbTshDFBD3FPluTST9nqE2FXVO4jrMCKBEGEIQgV7cqZGrzzPPOejSzuZtp
 i+qNDwHRDKXA==
X-IronPort-AV: E=Sophos;i="5.75,381,1589266800"; d="scan'208";a="432303297"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 01:32:05 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 06/13] soundwire: intel: reinitialize IP+DSP in .prepare(),
 but only when resuming
Date: Wed, 22 Jul 2020 04:37:16 +0800
Message-Id: <20200721203723.18305-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721203723.18305-1-yung-chuan.liao@linux.intel.com>
References: <20200721203723.18305-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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
 drivers/soundwire/intel.c          | 71 +++++++++++++++++++++++++++++-
 2 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index 7638858397df..fdec62b912d3 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -84,6 +84,8 @@ struct sdw_cdns_stream_config {
  * @bus: Bus handle
  * @stream_type: Stream type
  * @link_id: Master link id
+ * @hw_params: hw_params to be applied in .prepare step
+ * @suspended: status set when suspended, to be used in .prepare
  */
 struct sdw_cdns_dma_data {
 	char *name;
@@ -92,6 +94,8 @@ struct sdw_cdns_dma_data {
 	struct sdw_bus *bus;
 	enum sdw_stream_type stream_type;
 	int link_id;
+	struct snd_pcm_hw_params *hw_params;
+	bool suspended;
 };
 
 /**
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 758387e345da..52a411669ec0 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -879,6 +879,10 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 	intel_pdi_alh_configure(sdw, pdi);
 	sdw_cdns_config_stream(cdns, ch, dir, pdi);
 
+	/* store pdi and hw_params, may be needed in prepare step */
+	dma->suspended = false;
+	dma->pdi = pdi;
+	dma->hw_params = params;
 
 	/* Inform DSP about PDI stream number */
 	ret = intel_params_stream(sdw, substream, dai, params,
@@ -922,7 +926,11 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
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
@@ -931,7 +939,41 @@ static int intel_prepare(struct snd_pcm_substream *substream,
 		return -EIO;
 	}
 
-	return sdw_prepare_stream(dma->stream);
+	if (dma->suspended) {
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
@@ -1002,6 +1044,9 @@ intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 		return ret;
 	}
 
+	dma->hw_params = NULL;
+	dma->pdi = NULL;
+
 	return 0;
 }
 
@@ -1014,6 +1059,29 @@ static void intel_shutdown(struct snd_pcm_substream *substream,
 	pm_runtime_put_autosuspend(cdns->dev);
 }
 
+static int intel_component_dais_suspend(struct snd_soc_component *component)
+{
+	struct sdw_cdns_dma_data *dma;
+	struct snd_soc_dai *dai;
+
+	for_each_component_dais(component, dai) {
+		/*
+		 * we don't have a .suspend dai_ops, and we don't have access
+		 * to the substream, so let's mark both capture and playback
+		 * DMA contexts as suspended
+		 */
+		dma = dai->playback_dma_data;
+		if (dma)
+			dma->suspended = true;
+
+		dma = dai->capture_dma_data;
+		if (dma)
+			dma->suspended = true;
+	}
+
+	return 0;
+}
+
 static int intel_pcm_set_sdw_stream(struct snd_soc_dai *dai,
 				    void *stream, int direction)
 {
@@ -1066,6 +1134,7 @@ static const struct snd_soc_dai_ops intel_pdm_dai_ops = {
 
 static const struct snd_soc_component_driver dai_component = {
 	.name           = "soundwire",
+	.suspend	= intel_component_dais_suspend
 };
 
 static int intel_create_dai(struct sdw_cdns *cdns,
-- 
2.17.1

