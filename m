Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE45BF1E80
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 20:18:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59739167E;
	Wed,  6 Nov 2019 20:17:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59739167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573067914;
	bh=1uBqwPpPdJHkLknq4DOyDC/R5FXPB3pdwGMXo0se/aI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N3QLdS3nMB8CK9RIe480zSOuFm0KsfAn36C3Fc5/XIYVuULODyeYYbwcqHYj1oWEq
	 tFhY1KM2EYYWTVGg6xa+8Ug7UJGbgSVUsSUZkt2QtPrtEsnQZXvDrHYjvVLLwuf3mi
	 PZKHdquaT+V7OMqQIuoNkY0JoZUp0OTHV6iEoyik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB693F80642;
	Wed,  6 Nov 2019 20:14:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5B65F80634; Wed,  6 Nov 2019 20:14:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA8FDF804FD
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 20:14:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA8FDF804FD
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 11:14:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; d="scan'208";a="402465790"
Received: from vidhipat-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.33.70])
 by fmsmga005.fm.intel.com with ESMTP; 06 Nov 2019 11:14:10 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  6 Nov 2019 13:13:49 -0600
Message-Id: <20191106191358.5712-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191106191358.5712-1-pierre-louis.bossart@linux.intel.com>
References: <20191106191358.5712-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 05/14] soundwire: intel: rename res field as
	link_res
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

There are too many fields called 'res' so add prefix to make it easier
to track what the structures are.

Pure rename, no functionality change

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.c | 37 +++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 0371d3d5501a..64f97bb1a135 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -103,7 +103,7 @@ enum intel_pdi_type {
 struct sdw_intel {
 	struct sdw_cdns cdns;
 	int instance;
-	struct sdw_intel_link_res *res;
+	struct sdw_intel_link_res *link_res;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs;
 #endif
@@ -193,8 +193,8 @@ static ssize_t intel_sprintf(void __iomem *mem, bool l,
 static int intel_reg_show(struct seq_file *s_file, void *data)
 {
 	struct sdw_intel *sdw = s_file->private;
-	void __iomem *s = sdw->res->shim;
-	void __iomem *a = sdw->res->alh;
+	void __iomem *s = sdw->link_res->shim;
+	void __iomem *a = sdw->link_res->alh;
 	char *buf;
 	ssize_t ret;
 	int i, j;
@@ -289,7 +289,7 @@ static void intel_debugfs_exit(struct sdw_intel *sdw) {}
 static int intel_link_power_up(struct sdw_intel *sdw)
 {
 	unsigned int link_id = sdw->instance;
-	void __iomem *shim = sdw->res->shim;
+	void __iomem *shim = sdw->link_res->shim;
 	int spa_mask, cpa_mask;
 	int link_control, ret;
 
@@ -309,7 +309,7 @@ static int intel_link_power_up(struct sdw_intel *sdw)
 
 static int intel_shim_init(struct sdw_intel *sdw)
 {
-	void __iomem *shim = sdw->res->shim;
+	void __iomem *shim = sdw->link_res->shim;
 	unsigned int link_id = sdw->instance;
 	int sync_reg, ret;
 	u16 ioctl = 0, act = 0;
@@ -370,7 +370,7 @@ static int intel_shim_init(struct sdw_intel *sdw)
 static void intel_pdi_init(struct sdw_intel *sdw,
 			   struct sdw_cdns_stream_config *config)
 {
-	void __iomem *shim = sdw->res->shim;
+	void __iomem *shim = sdw->link_res->shim;
 	unsigned int link_id = sdw->instance;
 	int pcm_cap, pdm_cap;
 
@@ -404,7 +404,7 @@ static void intel_pdi_init(struct sdw_intel *sdw,
 static int
 intel_pdi_get_ch_cap(struct sdw_intel *sdw, unsigned int pdi_num, bool pcm)
 {
-	void __iomem *shim = sdw->res->shim;
+	void __iomem *shim = sdw->link_res->shim;
 	unsigned int link_id = sdw->instance;
 	int count;
 
@@ -476,7 +476,7 @@ static int intel_pdi_ch_update(struct sdw_intel *sdw)
 static void
 intel_pdi_shim_configure(struct sdw_intel *sdw, struct sdw_cdns_pdi *pdi)
 {
-	void __iomem *shim = sdw->res->shim;
+	void __iomem *shim = sdw->link_res->shim;
 	unsigned int link_id = sdw->instance;
 	int pdi_conf = 0;
 
@@ -508,7 +508,7 @@ intel_pdi_shim_configure(struct sdw_intel *sdw, struct sdw_cdns_pdi *pdi)
 static void
 intel_pdi_alh_configure(struct sdw_intel *sdw, struct sdw_cdns_pdi *pdi)
 {
-	void __iomem *alh = sdw->res->alh;
+	void __iomem *alh = sdw->link_res->alh;
 	unsigned int link_id = sdw->instance;
 	unsigned int conf;
 
@@ -535,7 +535,7 @@ static int intel_params_stream(struct sdw_intel *sdw,
 			       struct snd_pcm_hw_params *hw_params,
 			       int link_id, int alh_stream_id)
 {
-	struct sdw_intel_link_res *res = sdw->res;
+	struct sdw_intel_link_res *res = sdw->link_res;
 	struct sdw_intel_stream_params_data params_data;
 
 	params_data.substream = substream;
@@ -558,7 +558,7 @@ static int intel_pre_bank_switch(struct sdw_bus *bus)
 {
 	struct sdw_cdns *cdns = bus_to_cdns(bus);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
-	void __iomem *shim = sdw->res->shim;
+	void __iomem *shim = sdw->link_res->shim;
 	int sync_reg;
 
 	/* Write to register only for multi-link */
@@ -577,7 +577,7 @@ static int intel_post_bank_switch(struct sdw_bus *bus)
 {
 	struct sdw_cdns *cdns = bus_to_cdns(bus);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
-	void __iomem *shim = sdw->res->shim;
+	void __iomem *shim = sdw->link_res->shim;
 	int sync_reg, ret;
 
 	/* Write to register only for multi-link */
@@ -934,9 +934,9 @@ static int intel_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	sdw->instance = pdev->id;
-	sdw->res = dev_get_platdata(&pdev->dev);
+	sdw->link_res = dev_get_platdata(&pdev->dev);
 	sdw->cdns.dev = &pdev->dev;
-	sdw->cdns.registers = sdw->res->registers;
+	sdw->cdns.registers = sdw->link_res->registers;
 	sdw->cdns.instance = sdw->instance;
 	sdw->cdns.msg_count = 0;
 	sdw->cdns.bus.dev = &pdev->dev;
@@ -976,11 +976,12 @@ static int intel_probe(struct platform_device *pdev)
 	intel_pdi_ch_update(sdw);
 
 	/* Acquire IRQ */
-	ret = request_threaded_irq(sdw->res->irq, sdw_cdns_irq, sdw_cdns_thread,
+	ret = request_threaded_irq(sdw->link_res->irq,
+				   sdw_cdns_irq, sdw_cdns_thread,
 				   IRQF_SHARED, KBUILD_MODNAME, &sdw->cdns);
 	if (ret < 0) {
 		dev_err(sdw->cdns.dev, "unable to grab IRQ %d, disabling device\n",
-			sdw->res->irq);
+			sdw->link_res->irq);
 		goto err_init;
 	}
 
@@ -1010,7 +1011,7 @@ static int intel_probe(struct platform_device *pdev)
 
 err_interrupt:
 	sdw_cdns_enable_interrupt(&sdw->cdns, false);
-	free_irq(sdw->res->irq, sdw);
+	free_irq(sdw->link_res->irq, sdw);
 err_init:
 	sdw_delete_bus_master(&sdw->cdns.bus);
 	return ret;
@@ -1025,7 +1026,7 @@ static int intel_remove(struct platform_device *pdev)
 	if (!sdw->cdns.bus.prop.hw_disabled) {
 		intel_debugfs_exit(sdw);
 		sdw_cdns_enable_interrupt(&sdw->cdns, false);
-		free_irq(sdw->res->irq, sdw);
+		free_irq(sdw->link_res->irq, sdw);
 		snd_soc_unregister_component(sdw->cdns.dev);
 	}
 	sdw_delete_bus_master(&sdw->cdns.bus);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
