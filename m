Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A87FCD55
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 19:23:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6416D1679;
	Thu, 14 Nov 2019 19:22:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6416D1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573755812;
	bh=5rGzrdaQPMw01pFZNzivkc5N3G5NDnuAcgJLrH60LF4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S6wQna8uNY3gLCHko16Ugo1x2lPE3bLqPdfUxpr5vsidfhH6G7V6ziYhnTlc8HgVn
	 T59luMSFCs3b9rRCyxUlRG8lh3KbcOBa2iF2es7/ekhwHj/Jsdc/W6lO2nADtHbois
	 zzCtPPRSXQlIV2gOZAz/xpPFKUieSO0iJefyNMPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A9B4F80141;
	Thu, 14 Nov 2019 19:18:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57B62F8010D; Thu, 14 Nov 2019 19:17:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 288E2F80101
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 19:17:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 288E2F80101
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Nov 2019 10:17:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,304,1569308400"; d="scan'208";a="195123434"
Received: from chiahuil-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.228.77])
 by orsmga007.jf.intel.com with ESMTP; 14 Nov 2019 10:17:40 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 14 Nov 2019 12:16:47 -0600
Message-Id: <20191114181702.22254-8-pierre-louis.bossart@linux.intel.com>
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
Subject: [alsa-devel] [PATCH v3 07/22] soundwire: intel: add pm_runtime
	support
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

Add basic hooks in DAI .startup and .shutdown callbacks.

The SoundWire IP should be powered between those two calls. The power
dependencies between SoundWire and DSP are handled with the
parent/child relationship, before the SoundWire master device becomes
active the parent device will become active and power-up the shared
rails.

For now the strategy is to rely on complete enumeration when the
device becomes active, so the code is a copy/paste of the sequence for
system suspend/resume. In future patches, the strategy will optionally
be to rely on clock stop if the enumeration time is prohibitive or
when the devices connected to a link can signal a wake.

A module parameter is added to make integration of new Slave devices
easier, to e.g. keep the device active or prevent clock-stop.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.c | 108 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 104 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index c15596c011de..1ce2a3c5900c 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/pm_runtime.h>
 #include <linux/platform_device.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -21,6 +22,20 @@
 #include "bus.h"
 #include "intel.h"
 
+/*
+ * debug/config flags for the Intel SoundWire Master.
+ *
+ * Since we may have multiple masters active, we can have up to 8
+ * flags reused in each byte, with master0 using the ls-byte, etc.
+ */
+
+#define SDW_INTEL_MASTER_DISABLE_PM_RUNTIME BIT(0)
+#define SDW_INTEL_MASTER_DISABLE_CLOCK_STOP BIT(1)
+
+static int md_flags;
+module_param_named(sdw_md_flags, md_flags, int, 0444);
+MODULE_PARM_DESC(sdw_md_flags, "SoundWire Intel Master device flags (0x0 all off)");
+
 /* Intel SHIM Registers Definition */
 #define SDW_SHIM_LCAP			0x0
 #define SDW_SHIM_LCTL			0x4
@@ -742,10 +757,16 @@ static int sdw_stream_setup(struct snd_pcm_substream *substream,
 static int intel_startup(struct snd_pcm_substream *substream,
 			 struct snd_soc_dai *dai)
 {
-	/*
-	 * TODO: add pm_runtime support here, the startup callback
-	 * will make sure the IP is 'active'
-	 */
+	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
+	int ret;
+
+	ret = pm_runtime_get_sync(cdns->dev);
+	if (ret < 0 && ret != -EACCES) {
+		dev_err_ratelimited(cdns->dev,
+				    "pm_runtime_get_sync failed in %s, ret %d\n",
+				    __func__, ret);
+		pm_runtime_put_noidle(cdns->dev);
+	}
 
 	return sdw_stream_setup(substream, dai);
 }
@@ -924,6 +945,7 @@ static void intel_shutdown(struct snd_pcm_substream *substream,
 			   struct snd_soc_dai *dai)
 {
 	struct sdw_cdns_dma_data *dma;
+	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
 
 	dma = snd_soc_dai_get_dma_data(dai, substream);
 	if (!dma)
@@ -931,6 +953,9 @@ static void intel_shutdown(struct snd_pcm_substream *substream,
 
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
 	kfree(dma);
+
+	pm_runtime_mark_last_busy(cdns->dev);
+	pm_runtime_put_autosuspend(cdns->dev);
 }
 
 static int intel_pcm_set_sdw_stream(struct snd_soc_dai *dai,
@@ -1179,6 +1204,7 @@ static int intel_master_startup(struct sdw_master_device *md)
 {
 	struct sdw_cdns_stream_config config;
 	struct sdw_intel *sdw;
+	int link_flags;
 	int ret;
 
 	sdw = md->pdata;
@@ -1225,6 +1251,17 @@ static int intel_master_startup(struct sdw_master_device *md)
 
 	intel_debugfs_init(sdw);
 
+	/* Enable runtime PM */
+	link_flags = md_flags >> (sdw->cdns.bus.link_id * 8);
+	if (!(link_flags & SDW_INTEL_MASTER_DISABLE_PM_RUNTIME)) {
+		pm_runtime_set_autosuspend_delay(&md->dev, 3000);
+		pm_runtime_use_autosuspend(&md->dev);
+		pm_runtime_mark_last_busy(&md->dev);
+
+		pm_runtime_set_active(&md->dev);
+		pm_runtime_enable(&md->dev);
+	}
+
 	return 0;
 
 err_interrupt:
@@ -1288,6 +1325,35 @@ static int intel_suspend(struct device *dev)
 	return 0;
 }
 
+static int intel_suspend_runtime(struct device *dev)
+{
+	struct sdw_cdns *cdns = dev_get_drvdata(dev);
+	struct sdw_intel *sdw = cdns_to_intel(cdns);
+	int ret;
+
+	if (cdns->bus.prop.hw_disabled) {
+		dev_dbg(dev, "SoundWire master %d is disabled, ignoring\n",
+			cdns->bus.link_id);
+		return 0;
+	}
+
+	ret = sdw_cdns_enable_interrupt(cdns, false);
+	if (ret < 0) {
+		dev_err(dev, "cannot disable interrupts on suspend\n");
+		return ret;
+	}
+
+	ret = intel_link_power_down(sdw);
+	if (ret) {
+		dev_err(dev, "Link power down failed: %d", ret);
+		return ret;
+	}
+
+	intel_shim_wake(sdw, false);
+
+	return 0;
+}
+
 static int intel_resume(struct device *dev)
 {
 	struct sdw_cdns *cdns = dev_get_drvdata(dev);
@@ -1321,10 +1387,44 @@ static int intel_resume(struct device *dev)
 	return ret;
 }
 
+static int intel_resume_runtime(struct device *dev)
+{
+	struct sdw_cdns *cdns = dev_get_drvdata(dev);
+	struct sdw_intel *sdw = cdns_to_intel(cdns);
+	int ret;
+
+	if (cdns->bus.prop.hw_disabled) {
+		dev_dbg(dev, "SoundWire master %d is disabled, ignoring\n",
+			cdns->bus.link_id);
+		return 0;
+	}
+
+	ret = intel_init(sdw);
+	if (ret) {
+		dev_err(dev, "%s failed: %d", __func__, ret);
+		return ret;
+	}
+
+	ret = sdw_cdns_enable_interrupt(cdns, true);
+	if (ret < 0) {
+		dev_err(dev, "cannot enable interrupts during resume\n");
+		return ret;
+	}
+
+	ret = sdw_cdns_exit_reset(cdns);
+	if (ret < 0) {
+		dev_err(dev, "unable to exit bus reset sequence during resume\n");
+		return ret;
+	}
+
+	return ret;
+}
+
 #endif
 
 static const struct dev_pm_ops intel_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(intel_suspend, intel_resume)
+	SET_RUNTIME_PM_OPS(intel_suspend_runtime, intel_resume_runtime, NULL)
 };
 
 struct sdw_md_driver intel_sdw_driver = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
