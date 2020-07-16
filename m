Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B432223184
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 05:10:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5AF61672;
	Fri, 17 Jul 2020 05:09:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5AF61672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594955415;
	bh=ms7LrvAh8/1tSJ7PEwM3j+pYS5wO3G6pmjNQ/94OfuM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AboaA3XL673FFntOndSOXjFoKTSlFlpXikSCmfg4peDhgEt7RL/KC7Kpryf8fOF5a
	 zzOkrNZ2uIB9ngWBRE0dAsKAd6rDJy+9poXQnHNZAtqg8HQgKRgiEMuGzz12PHAfLN
	 ylVBvlfwI1dahMyTmI2ZF3ShTX9nBI8bM94k1ooE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25A76F80316;
	Fri, 17 Jul 2020 05:04:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3496F80304; Fri, 17 Jul 2020 05:04:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A61B3F802F7
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 05:04:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A61B3F802F7
IronPort-SDR: /s2z8Q216/nXATl7rnOSCxObz4tAXrvup7bIWP5vZOXtUJtMx3oTFVWvXhB5ng5LdYuBtsN/FD
 HWdBjub7QC7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9684"; a="147518762"
X-IronPort-AV: E=Sophos;i="5.75,361,1589266800"; d="scan'208";a="147518762"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 20:04:34 -0700
IronPort-SDR: cXQhLz1rXdGUBytHWCtRlr4dCnu6zLJYveBPg0/fD/8s3SSk1IcWvk9/KyqzVXpNFMsSn4IVq3
 A5Z4wVrINaXA==
X-IronPort-AV: E=Sophos;i="5.75,361,1589266800"; d="scan'208";a="460699767"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2020 20:04:30 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 8/9] soundwire: intel: add wake interrupt support
Date: Thu, 16 Jul 2020 23:09:46 +0800
Message-Id: <20200716150947.22119-9-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200716150947.22119-1-yung-chuan.liao@linux.intel.com>
References: <20200716150947.22119-1-yung-chuan.liao@linux.intel.com>
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

From: Rander Wang <rander.wang@intel.com>

When system is suspended in clock stop mode on intel platforms, both
master and slave are in clock stop mode and soundwire bus is taken
over by a glue hardware. The bus message for jack event is processed
by this glue hardware, which will trigger an interrupt to resume audio
pci device. Then audio pci driver will resume soundwire master and slave,
transfer bus ownership to master, finally slave will report jack event
to master and codec driver is triggered to check jack status.

if a slave has been attached to a bus, the slave->dev_num_sticky
should be non-zero, so we can check this value to skip the
ghost devices defined in ACPI table but not populated in hardware.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c      | 40 +++++++++++++++++++++++++++++++++-
 drivers/soundwire/intel.h      |  1 +
 drivers/soundwire/intel_init.c | 22 +++++++++++++++++++
 3 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 06c553d94890..23b66dcf9966 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -13,6 +13,7 @@
 #include <linux/io.h>
 #include <linux/platform_device.h>
 #include <sound/pcm_params.h>
+#include <linux/pm_runtime.h>
 #include <sound/soc.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw.h>
@@ -436,7 +437,7 @@ static int intel_shim_init(struct sdw_intel *sdw, bool clock_stop)
 	return ret;
 }
 
-static void __maybe_unused intel_shim_wake(struct sdw_intel *sdw, bool wake_enable)
+static void intel_shim_wake(struct sdw_intel *sdw, bool wake_enable)
 {
 	void __iomem *shim = sdw->link_res->shim;
 	unsigned int link_id = sdw->instance;
@@ -1337,6 +1338,43 @@ static int intel_master_remove(struct platform_device *pdev)
 	return 0;
 }
 
+int intel_master_process_wakeen_event(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sdw_intel *sdw;
+	struct sdw_bus *bus;
+	void __iomem *shim;
+	u16 wake_sts;
+
+	sdw = platform_get_drvdata(pdev);
+	bus = &sdw->cdns.bus;
+
+	if (bus->prop.hw_disabled) {
+		dev_dbg(dev, "SoundWire master %d is disabled, ignoring\n", bus->link_id);
+		return 0;
+	}
+
+	shim = sdw->link_res->shim;
+	wake_sts = intel_readw(shim, SDW_SHIM_WAKESTS);
+
+	if (!(wake_sts & BIT(sdw->instance)))
+		return 0;
+
+	/* disable WAKEEN interrupt ASAP to prevent interrupt flood */
+	intel_shim_wake(sdw, false);
+
+	/*
+	 * resume the Master, which will generate a bus reset and result in
+	 * Slaves re-attaching and be re-enumerated. The SoundWire physical
+	 * device which generated the wake will trigger an interrupt, which
+	 * will in turn cause the corresponding Linux Slave device to be
+	 * resumed and the Slave codec driver to check the status.
+	 */
+	pm_request_resume(dev);
+
+	return 0;
+}
+
 static struct platform_driver sdw_intel_drv = {
 	.probe = intel_master_probe,
 	.remove = intel_master_remove,
diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index bf127c88eb51..4ea3d262d249 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -47,5 +47,6 @@ struct sdw_intel {
 #define SDW_INTEL_QUIRK_MASK_BUS_DISABLE      BIT(1)
 
 int intel_master_startup(struct platform_device *pdev);
+int intel_master_process_wakeen_event(struct platform_device *pdev);
 
 #endif /* __SDW_INTEL_LOCAL_H */
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index a97d3577eb57..8d3992f9fcdd 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -415,5 +415,27 @@ void sdw_intel_exit(struct sdw_intel_ctx *ctx)
 }
 EXPORT_SYMBOL_NS(sdw_intel_exit, SOUNDWIRE_INTEL_INIT);
 
+void sdw_intel_process_wakeen_event(struct sdw_intel_ctx *ctx)
+{
+	struct sdw_intel_link_res *link;
+	u32 link_mask;
+	int i;
+
+	if (!ctx->links)
+		return;
+
+	link = ctx->links;
+	link_mask = ctx->link_mask;
+
+	/* Startup SDW Master devices */
+	for (i = 0; i < ctx->count; i++, link++) {
+		if (!(link_mask & BIT(i)))
+			continue;
+
+		intel_master_process_wakeen_event(link->pdev);
+	}
+}
+EXPORT_SYMBOL_NS(sdw_intel_process_wakeen_event, SOUNDWIRE_INTEL_INIT);
+
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("Intel Soundwire Init Library");
-- 
2.17.1

