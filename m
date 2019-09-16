Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FDCB4123
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2019 21:29:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59C95166B;
	Mon, 16 Sep 2019 21:28:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59C95166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568662147;
	bh=pk8VOPIsa82FvuKOdhT2blNypKuAUjwoekBwLBEA03o=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N8jaEl7axlIGd8556dUOx4k+xv8fqKSq8P9KD+SjDu+6l5bAQ1wPJe0ccaB/D7rQH
	 Lmk0ui9XH1NHwebDpDez+5Qg2p94VzFmt5iZFS08nZPO5SnLcfSFMUJQxBEeIkq+ID
	 hiKgP2YqKhkzFdIExLDIDI2ANdkmugKuYFWVim/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45DA9F80633;
	Mon, 16 Sep 2019 21:24:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0386BF805FC; Mon, 16 Sep 2019 21:24:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5270F80506
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 21:23:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5270F80506
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Sep 2019 12:23:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,513,1559545200"; d="scan'208";a="270291190"
Received: from jvhicko1-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.104.227])
 by orsmga001.jf.intel.com with ESMTP; 16 Sep 2019 12:23:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 16 Sep 2019 14:23:46 -0500
Message-Id: <20190916192348.467-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916192348.467-1-pierre-louis.bossart@linux.intel.com>
References: <20190916192348.467-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH 4/6] soundwire: cadence/intel: simplify
	PDI/port mapping
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

The existing Linux code uses a 1:1 mapping between ports and PDIs, but
still has an independent allocation of ports and PDIs.

Let's simplify the code and remove the port layer by only using PDIs.

This patch does not change any functionality, just removes unnecessary
code.

This will also allow for further simplifications where the PDIs are
not dynamically allocated but instead described in a topology file.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 110 ++++--------------------
 drivers/soundwire/cadence_master.h |  32 ++-----
 drivers/soundwire/intel.c          | 133 ++++++-----------------------
 3 files changed, 51 insertions(+), 224 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 06d83ad88d76..46ebd601a454 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -895,7 +895,8 @@ int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
 		      struct sdw_cdns_stream_config config)
 {
 	struct sdw_cdns_streams *stream;
-	int offset, i, ret;
+	int offset;
+	int ret;
 
 	cdns->pcm.num_bd = config.pcm_bd;
 	cdns->pcm.num_in = config.pcm_in;
@@ -962,18 +963,6 @@ int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
 	stream->num_pdi = stream->num_bd + stream->num_in + stream->num_out;
 	cdns->num_ports += stream->num_pdi;
 
-	cdns->ports = devm_kcalloc(cdns->dev, cdns->num_ports,
-				   sizeof(*cdns->ports), GFP_KERNEL);
-	if (!cdns->ports) {
-		ret = -ENOMEM;
-		return ret;
-	}
-
-	for (i = 0; i < cdns->num_ports; i++) {
-		cdns->ports[i].assigned = false;
-		cdns->ports[i].num = i + 1; /* Port 0 reserved for bulk */
-	}
-
 	return 0;
 }
 EXPORT_SYMBOL(sdw_cdns_pdi_init);
@@ -1266,13 +1255,11 @@ static struct sdw_cdns_pdi *cdns_find_pdi(struct sdw_cdns *cdns,
  * sdw_cdns_config_stream: Configure a stream
  *
  * @cdns: Cadence instance
- * @port: Cadence data port
  * @ch: Channel count
  * @dir: Data direction
  * @pdi: PDI to be used
  */
 void sdw_cdns_config_stream(struct sdw_cdns *cdns,
-			    struct sdw_cdns_port *port,
 			    u32 ch, u32 dir, struct sdw_cdns_pdi *pdi)
 {
 	u32 offset, val = 0;
@@ -1280,89 +1267,26 @@ void sdw_cdns_config_stream(struct sdw_cdns *cdns,
 	if (dir == SDW_DATA_DIR_RX)
 		val = CDNS_PORTCTRL_DIRN;
 
-	offset = CDNS_PORTCTRL + port->num * CDNS_PORT_OFFSET;
+	offset = CDNS_PORTCTRL + pdi->num * CDNS_PORT_OFFSET;
 	cdns_updatel(cdns, offset, CDNS_PORTCTRL_DIRN, val);
 
-	val = port->num;
+	val = pdi->num;
 	val |= ((1 << ch) - 1) << SDW_REG_SHIFT(CDNS_PDI_CONFIG_CHANNEL);
 	cdns_writel(cdns, CDNS_PDI_CONFIG(pdi->num), val);
 }
 EXPORT_SYMBOL(sdw_cdns_config_stream);
 
 /**
- * cdns_get_num_pdi() - Get number of PDIs required
- *
- * @cdns: Cadence instance
- * @pdi: PDI to be used
- * @num: Number of PDIs
- * @ch_count: Channel count
- */
-static int cdns_get_num_pdi(struct sdw_cdns *cdns,
-			    struct sdw_cdns_pdi *pdi,
-			    unsigned int num, u32 ch_count)
-{
-	int i, pdis = 0;
-
-	for (i = 0; i < num; i++) {
-		if (pdi[i].assigned)
-			continue;
-
-		if (pdi[i].ch_count < ch_count)
-			ch_count -= pdi[i].ch_count;
-		else
-			ch_count = 0;
-
-		pdis++;
-
-		if (!ch_count)
-			break;
-	}
-
-	if (ch_count)
-		return 0;
-
-	return pdis;
-}
-
-/**
- * sdw_cdns_get_stream() - Get stream information
- *
- * @cdns: Cadence instance
- * @stream: Stream to be allocated
- * @ch: Channel count
- * @dir: Data direction
- */
-int sdw_cdns_get_stream(struct sdw_cdns *cdns,
-			struct sdw_cdns_streams *stream,
-			u32 ch, u32 dir)
-{
-	int pdis = 0;
-
-	if (dir == SDW_DATA_DIR_RX)
-		pdis = cdns_get_num_pdi(cdns, stream->in, stream->num_in, ch);
-	else
-		pdis = cdns_get_num_pdi(cdns, stream->out, stream->num_out, ch);
-
-	/* check if we found PDI, else find in bi-directional */
-	if (!pdis)
-		pdis = cdns_get_num_pdi(cdns, stream->bd, stream->num_bd, ch);
-
-	return pdis;
-}
-EXPORT_SYMBOL(sdw_cdns_get_stream);
-
-/**
- * sdw_cdns_alloc_stream() - Allocate a stream
+ * sdw_cdns_alloc_pdi() - Allocate a PDI
  *
  * @cdns: Cadence instance
  * @stream: Stream to be allocated
- * @port: Cadence data port
  * @ch: Channel count
  * @dir: Data direction
  */
-int sdw_cdns_alloc_stream(struct sdw_cdns *cdns,
-			  struct sdw_cdns_streams *stream,
-			  struct sdw_cdns_port *port, u32 ch, u32 dir)
+struct sdw_cdns_pdi *sdw_cdns_alloc_pdi(struct sdw_cdns *cdns,
+					struct sdw_cdns_streams *stream,
+					u32 ch, u32 dir)
 {
 	struct sdw_cdns_pdi *pdi = NULL;
 
@@ -1375,18 +1299,16 @@ int sdw_cdns_alloc_stream(struct sdw_cdns *cdns,
 	if (!pdi)
 		pdi = cdns_find_pdi(cdns, stream->num_bd, stream->bd);
 
-	if (!pdi)
-		return -EIO;
-
-	port->pdi = pdi;
-	pdi->l_ch_num = 0;
-	pdi->h_ch_num = ch - 1;
-	pdi->dir = dir;
-	pdi->ch_count = ch;
+	if (pdi) {
+		pdi->l_ch_num = 0;
+		pdi->h_ch_num = ch - 1;
+		pdi->dir = dir;
+		pdi->ch_count = ch;
+	}
 
-	return 0;
+	return pdi;
 }
-EXPORT_SYMBOL(sdw_cdns_alloc_stream);
+EXPORT_SYMBOL(sdw_cdns_alloc_pdi);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("Cadence Soundwire Library");
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index 9d7a48ac6fc4..43493fc3d2ee 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -28,23 +28,6 @@ struct sdw_cdns_pdi {
 	enum sdw_stream_type type;
 };
 
-/**
- * struct sdw_cdns_port: Cadence port structure
- *
- * @num: port number
- * @assigned: port assigned
- * @ch: channel count
- * @direction: data port direction
- * @pdi: pdi for this port
- */
-struct sdw_cdns_port {
-	unsigned int num;
-	bool assigned;
-	unsigned int ch;
-	enum sdw_data_direction direction;
-	struct sdw_cdns_pdi *pdi;
-};
-
 /**
  * struct sdw_cdns_streams: Cadence stream data structure
  *
@@ -95,8 +78,8 @@ struct sdw_cdns_stream_config {
  * struct sdw_cdns_dma_data: Cadence DMA data
  *
  * @name: SoundWire stream name
- * @nr_ports: Number of ports
- * @port: Ports
+ * @stream: stream runtime
+ * @pdi: PDI used for this dai
  * @bus: Bus handle
  * @stream_type: Stream type
  * @link_id: Master link id
@@ -104,8 +87,7 @@ struct sdw_cdns_stream_config {
 struct sdw_cdns_dma_data {
 	char *name;
 	struct sdw_stream_runtime *stream;
-	int nr_ports;
-	struct sdw_cdns_port **port;
+	struct sdw_cdns_pdi *pdi;
 	struct sdw_bus *bus;
 	enum sdw_stream_type stream_type;
 	int link_id;
@@ -171,10 +153,10 @@ void sdw_cdns_debugfs_init(struct sdw_cdns *cdns, struct dentry *root);
 int sdw_cdns_get_stream(struct sdw_cdns *cdns,
 			struct sdw_cdns_streams *stream,
 			u32 ch, u32 dir);
-int sdw_cdns_alloc_stream(struct sdw_cdns *cdns,
-			  struct sdw_cdns_streams *stream,
-			  struct sdw_cdns_port *port, u32 ch, u32 dir);
-void sdw_cdns_config_stream(struct sdw_cdns *cdns, struct sdw_cdns_port *port,
+struct sdw_cdns_pdi *sdw_cdns_alloc_pdi(struct sdw_cdns *cdns,
+					struct sdw_cdns_streams *stream,
+					u32 ch, u32 dir);
+void sdw_cdns_config_stream(struct sdw_cdns *cdns,
 			    u32 ch, u32 dir, struct sdw_cdns_pdi *pdi);
 
 int sdw_cdns_pcm_set_stream(struct snd_soc_dai *dai,
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 8aa513042a4e..8a4b690948c1 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -604,66 +604,6 @@ static int intel_post_bank_switch(struct sdw_bus *bus)
  * DAI routines
  */
 
-static struct sdw_cdns_port *intel_alloc_port(struct sdw_intel *sdw,
-					      u32 ch, u32 dir, bool pcm)
-{
-	struct sdw_cdns *cdns = &sdw->cdns;
-	struct sdw_cdns_port *port = NULL;
-	int i, ret = 0;
-
-	for (i = 0; i < cdns->num_ports; i++) {
-		if (cdns->ports[i].assigned)
-			continue;
-
-		port = &cdns->ports[i];
-		port->assigned = true;
-		port->direction = dir;
-		port->ch = ch;
-		break;
-	}
-
-	if (!port) {
-		dev_err(cdns->dev, "Unable to find a free port\n");
-		return NULL;
-	}
-
-	if (pcm) {
-		ret = sdw_cdns_alloc_stream(cdns, &cdns->pcm, port, ch, dir);
-		if (ret)
-			goto out;
-
-		intel_pdi_shim_configure(sdw, port->pdi);
-		sdw_cdns_config_stream(cdns, port, ch, dir, port->pdi);
-
-		intel_pdi_alh_configure(sdw, port->pdi);
-
-	} else {
-		ret = sdw_cdns_alloc_stream(cdns, &cdns->pdm, port, ch, dir);
-	}
-
-out:
-	if (ret) {
-		port->assigned = false;
-		port = NULL;
-	}
-
-	return port;
-}
-
-static void intel_port_cleanup(struct sdw_cdns_dma_data *dma)
-{
-	int i;
-
-	for (i = 0; i < dma->nr_ports; i++) {
-		if (dma->port[i]) {
-			dma->port[i]->pdi->assigned = false;
-			dma->port[i]->pdi = NULL;
-			dma->port[i]->assigned = false;
-			dma->port[i] = NULL;
-		}
-	}
-}
-
 static int intel_hw_params(struct snd_pcm_substream *substream,
 			   struct snd_pcm_hw_params *params,
 			   struct snd_soc_dai *dai)
@@ -671,9 +611,11 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	struct sdw_cdns_dma_data *dma;
+	struct sdw_cdns_pdi *pdi;
 	struct sdw_stream_config sconfig;
 	struct sdw_port_config *pconfig;
-	int ret, i, ch, dir;
+	int ch, dir;
+	int ret;
 	bool pcm = true;
 
 	dma = snd_soc_dai_get_dma_data(dai, substream);
@@ -686,38 +628,31 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 	else
 		dir = SDW_DATA_DIR_TX;
 
-	if (dma->stream_type == SDW_STREAM_PDM) {
-		/* TODO: Check whether PDM decimator is already in use */
-		dma->nr_ports = sdw_cdns_get_stream(cdns, &cdns->pdm, ch, dir);
+	if (dma->stream_type == SDW_STREAM_PDM)
 		pcm = false;
-	} else {
-		dma->nr_ports = sdw_cdns_get_stream(cdns, &cdns->pcm, ch, dir);
-	}
 
-	if (!dma->nr_ports) {
-		dev_err(dai->dev, "ports/resources not available\n");
-		return -EINVAL;
+	/* FIXME: We would need to get PDI info from topology */
+	if (pcm)
+		pdi = sdw_cdns_alloc_pdi(cdns, &cdns->pcm, ch, dir);
+	else
+		pdi = sdw_cdns_alloc_pdi(cdns, &cdns->pdm, ch, dir);
+
+	if (!pdi) {
+		ret = -EINVAL;
+		goto error;
 	}
 
-	dma->port = kcalloc(dma->nr_ports, sizeof(*dma->port), GFP_KERNEL);
-	if (!dma->port)
-		return -ENOMEM;
+	/* do run-time configurations for SHIM, ALH and PDI/PORT */
+	intel_pdi_shim_configure(sdw, pdi);
+	intel_pdi_alh_configure(sdw, pdi);
+	sdw_cdns_config_stream(cdns, ch, dir, pdi);
 
-	for (i = 0; i < dma->nr_ports; i++) {
-		dma->port[i] = intel_alloc_port(sdw, ch, dir, pcm);
-		if (!dma->port[i]) {
-			ret = -EINVAL;
-			goto port_error;
-		}
-	}
 
 	/* Inform DSP about PDI stream number */
-	for (i = 0; i < dma->nr_ports; i++) {
-		ret = intel_config_stream(sdw, substream, dai, params,
-					  dma->port[i]->pdi->intel_alh_id);
-		if (ret)
-			goto port_error;
-	}
+	ret = intel_config_stream(sdw, substream, dai, params,
+				  pdi->intel_alh_id);
+	if (ret)
+		goto error;
 
 	sconfig.direction = dir;
 	sconfig.ch_count = ch;
@@ -732,32 +667,22 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	/* Port configuration */
-	pconfig = kcalloc(dma->nr_ports, sizeof(*pconfig), GFP_KERNEL);
+	pconfig = kcalloc(1, sizeof(*pconfig), GFP_KERNEL);
 	if (!pconfig) {
 		ret =  -ENOMEM;
-		goto port_error;
+		goto error;
 	}
 
-	for (i = 0; i < dma->nr_ports; i++) {
-		pconfig[i].num = dma->port[i]->num;
-		pconfig[i].ch_mask = (1 << ch) - 1;
-	}
+	pconfig->num = pdi->num;
+	pconfig->ch_mask = (1 << ch) - 1;
 
 	ret = sdw_stream_add_master(&cdns->bus, &sconfig,
-				    pconfig, dma->nr_ports, dma->stream);
-	if (ret) {
+				    pconfig, 1, dma->stream);
+	if (ret)
 		dev_err(cdns->dev, "add master to stream failed:%d\n", ret);
-		goto stream_error;
-	}
-
-	kfree(pconfig);
-	return ret;
 
-stream_error:
 	kfree(pconfig);
-port_error:
-	intel_port_cleanup(dma);
-	kfree(dma->port);
+error:
 	return ret;
 }
 
@@ -777,8 +702,6 @@ intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 		dev_err(dai->dev, "remove master from stream %s failed: %d\n",
 			dma->stream->name, ret);
 
-	intel_port_cleanup(dma);
-	kfree(dma->port);
 	return ret;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
