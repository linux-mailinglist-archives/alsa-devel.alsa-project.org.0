Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C501E9DF4
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jun 2020 08:19:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74B1816FD;
	Mon,  1 Jun 2020 08:18:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74B1816FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590992343;
	bh=YIGJoo1moEuRH6AifjC8D3R8r3wSeIB7taEFNFgZHUM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fSL6Y+NDj1ckD/bkdSrXsneerfQaS3O7/0aRHh6WAHPIBGYgCxRfhdyHaIj8jIYUl
	 LrPFYK5EKDhc7OhiY20poQad0nHBtzFR2SP9y+dqosUBzOiqkwDGdG9NIHYwIoMioV
	 IsFUwWgQt80gyVBeeouUMa92812FKye6Q2SEbD+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB7DFF802A8;
	Mon,  1 Jun 2020 08:16:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C948F802A7; Mon,  1 Jun 2020 08:16:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CAD9F80227
 for <alsa-devel@alsa-project.org>; Mon,  1 Jun 2020 08:15:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CAD9F80227
IronPort-SDR: XiK97Z+u9gjUxRMcOuFwXjUo7kNVlYeyLosG+PQr3RNFsRwDAfijWznPQZr+/Vb1TcXTvm/7WY
 bB+B6k28d9JA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2020 23:15:50 -0700
IronPort-SDR: kY4MRX8sMRIu5aP+evIIJ94CSZpmrlDv+NscNT89L+z99aRxJ/ymUHbQZaIgZUUBdFB0bgmrg+
 98Bp+0wfa0gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,459,1583222400"; d="scan'208";a="470208655"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga005.fm.intel.com with ESMTP; 31 May 2020 23:15:45 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 2/6] soundwire: intel: clarify drvdata and remove more
 indirections
Date: Mon,  1 Jun 2020 02:20:58 +0800
Message-Id: <20200531182102.27840-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200531182102.27840-1-yung-chuan.liao@linux.intel.com>
References: <20200531182102.27840-1-yung-chuan.liao@linux.intel.com>
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The use of drvdata mixes two structures. There was no harm the first
structure is embedded as the first element of the second, but that's
not good. Make sure all drvdata is based on the 'sdw_cdns' structure.

While we are at it, remove indirections for 'dev' and 'cdns' to make
the code more readable.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 10e55c708694..ef1196ea93a4 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1077,6 +1077,7 @@ static int intel_master_probe(struct platform_device *pdev)
 	struct sdw_cdns_stream_config config;
 	struct device *dev = &pdev->dev;
 	struct sdw_intel *sdw;
+	struct sdw_cdns *cdns;
 	struct sdw_bus *bus;
 	int ret;
 
@@ -1084,24 +1085,26 @@ static int intel_master_probe(struct platform_device *pdev)
 	if (!sdw)
 		return -ENOMEM;
 
-	bus = &sdw->cdns.bus;
+	cdns = &sdw->cdns;
+	bus = &cdns->bus;
 
 	sdw->instance = pdev->id;
 	sdw->link_res = dev_get_platdata(dev);
-	sdw->cdns.dev = dev;
-	sdw->cdns.registers = sdw->link_res->registers;
-	sdw->cdns.instance = sdw->instance;
-	sdw->cdns.msg_count = 0;
+	cdns->dev = dev;
+	cdns->registers = sdw->link_res->registers;
+	cdns->instance = sdw->instance;
+	cdns->msg_count = 0;
+
 	bus->link_id = pdev->id;
 
-	sdw_cdns_probe(&sdw->cdns);
+	sdw_cdns_probe(cdns);
 
 	/* Set property read ops */
 	sdw_intel_ops.read_prop = intel_prop_read;
 	bus->ops = &sdw_intel_ops;
 
 	/* set driver data, accessed by snd_soc_dai_get_drvdata() */
-	platform_set_drvdata(pdev, sdw);
+	dev_set_drvdata(dev, cdns);
 
 	ret = sdw_bus_master_add(bus, dev, dev->fwnode);
 	if (ret) {
@@ -1123,7 +1126,7 @@ static int intel_master_probe(struct platform_device *pdev)
 
 	/* Read the PDI config and initialize cadence PDI */
 	intel_pdi_init(sdw, &config);
-	ret = sdw_cdns_pdi_init(&sdw->cdns, config);
+	ret = sdw_cdns_pdi_init(cdns, config);
 	if (ret)
 		goto err_init;
 
@@ -1132,20 +1135,20 @@ static int intel_master_probe(struct platform_device *pdev)
 	/* Acquire IRQ */
 	ret = request_threaded_irq(sdw->link_res->irq,
 				   sdw_cdns_irq, sdw_cdns_thread,
-				   IRQF_SHARED, KBUILD_MODNAME, &sdw->cdns);
+				   IRQF_SHARED, KBUILD_MODNAME, cdns);
 	if (ret < 0) {
 		dev_err(dev, "unable to grab IRQ %d, disabling device\n",
 			sdw->link_res->irq);
 		goto err_init;
 	}
 
-	ret = sdw_cdns_enable_interrupt(&sdw->cdns, true);
+	ret = sdw_cdns_enable_interrupt(cdns, true);
 	if (ret < 0) {
 		dev_err(dev, "cannot enable interrupts\n");
 		goto err_init;
 	}
 
-	ret = sdw_cdns_exit_reset(&sdw->cdns);
+	ret = sdw_cdns_exit_reset(cdns);
 	if (ret < 0) {
 		dev_err(dev, "unable to exit bus reset sequence\n");
 		goto err_interrupt;
@@ -1164,7 +1167,7 @@ static int intel_master_probe(struct platform_device *pdev)
 	return 0;
 
 err_interrupt:
-	sdw_cdns_enable_interrupt(&sdw->cdns, false);
+	sdw_cdns_enable_interrupt(cdns, false);
 	free_irq(sdw->link_res->irq, sdw);
 err_init:
 	sdw_bus_master_delete(bus);
@@ -1174,16 +1177,13 @@ static int intel_master_probe(struct platform_device *pdev)
 static int intel_master_remove(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct sdw_intel *sdw;
-	struct sdw_bus *bus;
-
-	sdw = platform_get_drvdata(pdev);
-
-	bus = &sdw->cdns.bus;
+	struct sdw_cdns *cdns = dev_get_drvdata(dev);
+	struct sdw_intel *sdw = cdns_to_intel(cdns);
+	struct sdw_bus *bus = &cdns->bus;
 
 	if (!bus->prop.hw_disabled) {
 		intel_debugfs_exit(sdw);
-		sdw_cdns_enable_interrupt(&sdw->cdns, false);
+		sdw_cdns_enable_interrupt(cdns, false);
 		free_irq(sdw->link_res->irq, sdw);
 		snd_soc_unregister_component(dev);
 	}
-- 
2.17.1

