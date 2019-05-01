Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F37410AC5
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 18:10:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EC751707;
	Wed,  1 May 2019 18:10:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EC751707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556727050;
	bh=AF3lQCbSf2xd4WibVSpkzbRBaR6hUmRTDPdRKb8R8BQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OFVxNMQwgGANjf8MEvWfEEPiiVzrnU8z6R9Vkl9NDSF1E1wxr6M3DiFmu6R++9WEr
	 yD0SbptOk69GC6IP0ICG3HVhuTTCCcYEEAHA9SoCnRXbrDI+SVtIkYY7YC6LDdjata
	 megFCPl+pnpBCZr+Yi1J+etM7rPLAza2RyEZ+jVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67A2DF89777;
	Wed,  1 May 2019 17:59:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50139F8974F; Wed,  1 May 2019 17:58:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB5B5F89727
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 17:58:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB5B5F89727
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 May 2019 08:58:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,418,1549958400"; d="scan'208";a="296115733"
Received: from modiarvi-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.134.211])
 by orsmga004.jf.intel.com with ESMTP; 01 May 2019 08:58:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  1 May 2019 10:57:38 -0500
Message-Id: <20190501155745.21806-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
References: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH v4 15/22] soundwire: intel: fix alignment issues
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Use Linux style

Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.c | 59 +++++++++++++++++++--------------------
 1 file changed, 29 insertions(+), 30 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 70ca27ccad85..56d6c1dda0ff 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -236,7 +236,7 @@ static int intel_shim_init(struct sdw_intel *sdw)
 	/* Set SyncCPU bit */
 	sync_reg |= SDW_SHIM_SYNC_SYNCCPU;
 	ret = intel_clear_bit(shim, SDW_SHIM_SYNC, sync_reg,
-				SDW_SHIM_SYNC_SYNCCPU);
+			      SDW_SHIM_SYNC_SYNCCPU);
 	if (ret < 0)
 		dev_err(sdw->cdns.dev, "Failed to set sync period: %d", ret);
 
@@ -247,7 +247,7 @@ static int intel_shim_init(struct sdw_intel *sdw)
  * PDI routines
  */
 static void intel_pdi_init(struct sdw_intel *sdw,
-			struct sdw_cdns_stream_config *config)
+			   struct sdw_cdns_stream_config *config)
 {
 	void __iomem *shim = sdw->res->shim;
 	unsigned int link_id = sdw->instance;
@@ -296,9 +296,9 @@ intel_pdi_get_ch_cap(struct sdw_intel *sdw, unsigned int pdi_num, bool pcm)
 }
 
 static int intel_pdi_get_ch_update(struct sdw_intel *sdw,
-				struct sdw_cdns_pdi *pdi,
-				unsigned int num_pdi,
-				unsigned int *num_ch, bool pcm)
+				   struct sdw_cdns_pdi *pdi,
+				   unsigned int num_pdi,
+				   unsigned int *num_ch, bool pcm)
 {
 	int i, ch_count = 0;
 
@@ -313,16 +313,16 @@ static int intel_pdi_get_ch_update(struct sdw_intel *sdw,
 }
 
 static int intel_pdi_stream_ch_update(struct sdw_intel *sdw,
-				struct sdw_cdns_streams *stream, bool pcm)
+				      struct sdw_cdns_streams *stream, bool pcm)
 {
 	intel_pdi_get_ch_update(sdw, stream->bd, stream->num_bd,
-			&stream->num_ch_bd, pcm);
+				&stream->num_ch_bd, pcm);
 
 	intel_pdi_get_ch_update(sdw, stream->in, stream->num_in,
-			&stream->num_ch_in, pcm);
+				&stream->num_ch_in, pcm);
 
 	intel_pdi_get_ch_update(sdw, stream->out, stream->num_out,
-			&stream->num_ch_out, pcm);
+				&stream->num_ch_out, pcm);
 
 	return 0;
 }
@@ -387,9 +387,9 @@ intel_pdi_alh_configure(struct sdw_intel *sdw, struct sdw_cdns_pdi *pdi)
 }
 
 static int intel_config_stream(struct sdw_intel *sdw,
-			struct snd_pcm_substream *substream,
-			struct snd_soc_dai *dai,
-			struct snd_pcm_hw_params *hw_params, int link_id)
+			       struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *dai,
+			       struct snd_pcm_hw_params *hw_params, int link_id)
 {
 	if (sdw->res->ops && sdw->res->ops->config_stream)
 		return sdw->res->ops->config_stream(sdw->res->arg,
@@ -454,7 +454,7 @@ static int intel_post_bank_switch(struct sdw_bus *bus)
 	sync_reg |= SDW_SHIM_SYNC_SYNCGO;
 
 	ret = intel_clear_bit(shim, SDW_SHIM_SYNC, sync_reg,
-					SDW_SHIM_SYNC_SYNCGO);
+			      SDW_SHIM_SYNC_SYNCGO);
 	if (ret < 0)
 		dev_err(sdw->cdns.dev, "Post bank switch failed: %d", ret);
 
@@ -466,7 +466,7 @@ static int intel_post_bank_switch(struct sdw_bus *bus)
  */
 
 static struct sdw_cdns_port *intel_alloc_port(struct sdw_intel *sdw,
-				u32 ch, u32 dir, bool pcm)
+					      u32 ch, u32 dir, bool pcm)
 {
 	struct sdw_cdns *cdns = &sdw->cdns;
 	struct sdw_cdns_port *port = NULL;
@@ -526,8 +526,8 @@ static void intel_port_cleanup(struct sdw_cdns_dma_data *dma)
 }
 
 static int intel_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *params,
-				struct snd_soc_dai *dai)
+			   struct snd_pcm_hw_params *params,
+			   struct snd_soc_dai *dai)
 {
 	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
@@ -575,7 +575,7 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 	/* Inform DSP about PDI stream number */
 	for (i = 0; i < dma->nr_ports; i++) {
 		ret = intel_config_stream(sdw, substream, dai, params,
-				dma->port[i]->pdi->intel_alh_id);
+					  dma->port[i]->pdi->intel_alh_id);
 		if (ret)
 			goto port_error;
 	}
@@ -605,7 +605,7 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	ret = sdw_stream_add_master(&cdns->bus, &sconfig,
-				pconfig, dma->nr_ports, dma->stream);
+				    pconfig, dma->nr_ports, dma->stream);
 	if (ret) {
 		dev_err(cdns->dev, "add master to stream failed:%d", ret);
 		goto stream_error;
@@ -636,7 +636,7 @@ intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 	ret = sdw_stream_remove_master(&cdns->bus, dma->stream);
 	if (ret < 0)
 		dev_err(dai->dev, "remove master from stream %s failed: %d",
-							dma->stream->name, ret);
+			dma->stream->name, ret);
 
 	intel_port_cleanup(dma);
 	kfree(dma->port);
@@ -644,13 +644,13 @@ intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 }
 
 static int intel_pcm_set_sdw_stream(struct snd_soc_dai *dai,
-					void *stream, int direction)
+				    void *stream, int direction)
 {
 	return cdns_set_sdw_stream(dai, stream, true, direction);
 }
 
 static int intel_pdm_set_sdw_stream(struct snd_soc_dai *dai,
-					void *stream, int direction)
+				    void *stream, int direction)
 {
 	return cdns_set_sdw_stream(dai, stream, false, direction);
 }
@@ -674,9 +674,9 @@ static const struct snd_soc_component_driver dai_component = {
 };
 
 static int intel_create_dai(struct sdw_cdns *cdns,
-			struct snd_soc_dai_driver *dais,
-			enum intel_pdi_type type,
-			u32 num, u32 off, u32 max_ch, bool pcm)
+			    struct snd_soc_dai_driver *dais,
+			    enum intel_pdi_type type,
+			    u32 num, u32 off, u32 max_ch, bool pcm)
 {
 	int i;
 
@@ -686,7 +686,7 @@ static int intel_create_dai(struct sdw_cdns *cdns,
 	 /* TODO: Read supported rates/formats from hardware */
 	for (i = off; i < (off + num); i++) {
 		dais[i].name = kasprintf(GFP_KERNEL, "SDW%d Pin%d",
-					cdns->instance, i);
+					 cdns->instance, i);
 		if (!dais[i].name)
 			return -ENOMEM;
 
@@ -787,7 +787,7 @@ static int intel_register_dai(struct sdw_intel *sdw)
 		return ret;
 
 	return snd_soc_register_component(cdns->dev, &dai_component,
-				dais, num_dai);
+					  dais, num_dai);
 }
 
 static int intel_prop_read(struct sdw_bus *bus)
@@ -873,12 +873,11 @@ static int intel_probe(struct platform_device *pdev)
 	intel_pdi_ch_update(sdw);
 
 	/* Acquire IRQ */
-	ret = request_threaded_irq(sdw->res->irq, sdw_cdns_irq,
-			sdw_cdns_thread, IRQF_SHARED, KBUILD_MODNAME,
-			&sdw->cdns);
+	ret = request_threaded_irq(sdw->res->irq, sdw_cdns_irq, sdw_cdns_thread,
+				   IRQF_SHARED, KBUILD_MODNAME, &sdw->cdns);
 	if (ret < 0) {
 		dev_err(sdw->cdns.dev, "unable to grab IRQ %d, disabling device\n",
-				sdw->res->irq);
+			sdw->res->irq);
 		goto err_init;
 	}
 
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
