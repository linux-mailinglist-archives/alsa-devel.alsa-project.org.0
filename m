Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 692E375BE7
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 02:09:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0BE01FAE;
	Fri, 26 Jul 2019 02:08:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0BE01FAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564099746;
	bh=xf0TORD/sBSEOmDpMBJCnNfqpWoJypo2Cw2sIlwU/Kk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lKqB4tnEwPNby4CwdgpHIXkrFHUex4Bfor10lUSYhbjRa8wKtuVHNIQdBcaTK/AkO
	 03t3QW6hXIsze3d5zLLdSi7Ssh1aKlW4QesKR4cGE6fsMkzOKSMgM5mk0IhefSmt0N
	 PvB4rm8gk6Asz9oXid6y+7L9lcrn5vvu2wqv36Mo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A82CF80CC0;
	Fri, 26 Jul 2019 01:42:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F277F8087D; Fri, 26 Jul 2019 01:42:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0239F800F5
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 01:42:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0239F800F5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jul 2019 16:42:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,308,1559545200"; d="scan'208";a="369874872"
Received: from amrutaku-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.230.75])
 by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2019 16:42:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 25 Jul 2019 18:40:31 -0500
Message-Id: <20190725234032.21152-40-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [RFC PATCH 39/40] soundwire: intel: add pm_runtime
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

Add basic hooks in DAI .startup and .shutdown callbacks. The SoundWire
IP should be powered between those two calls.

By default the platform_device is in SUSPENDED mode, it is required to
call pm_runtime_set_active() before _enable()

FIXME: do we need to use mark_last_busy()?

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index db7bf2912767..1394a2322553 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -707,6 +707,23 @@ static void intel_port_cleanup(struct sdw_cdns_dma_data *dma)
 	}
 }
 
+static int intel_startup(struct snd_pcm_substream *substream,
+			 struct snd_soc_dai *dai)
+{
+	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
+	int ret;
+
+	ret = pm_runtime_get_sync(cdns->dev);
+	if (ret < 0) {
+		dev_err_ratelimited(cdns->dev,
+				    "pm_runtime_get_sync failed in %s, ret %d\n",
+				    __func__, ret);
+		pm_runtime_put_noidle(cdns->dev);
+	}
+
+	return ret;
+}
+
 static int intel_hw_params(struct snd_pcm_substream *substream,
 			   struct snd_pcm_hw_params *params,
 			   struct snd_soc_dai *dai)
@@ -829,6 +846,8 @@ void intel_shutdown(struct snd_pcm_substream *substream,
 		    struct snd_soc_dai *dai)
 {
 	struct sdw_cdns_dma_data *dma;
+	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
+	int ret;
 
 	dma = snd_soc_dai_get_dma_data(dai, substream);
 	if (!dma)
@@ -836,6 +855,13 @@ void intel_shutdown(struct snd_pcm_substream *substream,
 
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
 	kfree(dma);
+
+	pm_runtime_mark_last_busy(cdns->dev);
+	ret = pm_runtime_put_autosuspend(cdns->dev);
+	if (ret < 0)
+		dev_err_ratelimited(cdns->dev,
+				    "pM_runtime_put_autosuspend failed in %s:, ret %d\n",
+				    __func__, ret);
 }
 
 static int intel_pcm_set_sdw_stream(struct snd_soc_dai *dai,
@@ -851,6 +877,7 @@ static int intel_pdm_set_sdw_stream(struct snd_soc_dai *dai,
 }
 
 static const struct snd_soc_dai_ops intel_pcm_dai_ops = {
+	.startup = intel_startup,
 	.hw_params = intel_hw_params,
 	.hw_free = intel_hw_free,
 	.shutdown = intel_shutdown,
@@ -1124,6 +1151,15 @@ static int intel_probe(struct platform_device *pdev)
 
 	intel_debugfs_init(sdw);
 
+	/* Enable PM */
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 3000);
+	pm_runtime_use_autosuspend(&pdev->dev);
+
+	pm_runtime_mark_last_busy(&pdev->dev); /* FIXME: needed? */
+
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
 	return 0;
 
 err_dai:
@@ -1141,6 +1177,7 @@ static int intel_remove(struct platform_device *pdev)
 	sdw = platform_get_drvdata(pdev);
 
 	if (!sdw->cdns.bus.prop.hw_disabled) {
+		pm_runtime_disable(&pdev->dev);
 		intel_debugfs_exit(sdw);
 		free_irq(sdw->res->irq, sdw);
 		snd_soc_unregister_component(sdw->cdns.dev);
@@ -1212,6 +1249,7 @@ static int intel_resume(struct device *dev)
 
 static const struct dev_pm_ops intel_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(intel_suspend, intel_resume)
+	SET_RUNTIME_PM_OPS(intel_suspend, intel_resume, NULL)
 };
 
 static struct platform_driver sdw_intel_drv = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
