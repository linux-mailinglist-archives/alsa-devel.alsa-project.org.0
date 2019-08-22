Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0049A004
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:28:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B4031697;
	Thu, 22 Aug 2019 21:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B4031697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566502108;
	bh=pEOLldhfJTzMMXfL1eNedvXAjPHd2QaCPa9GGcXlaTs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rxzNOoDCBbUXjNgAOVAMlZgayAOWtAIbo7axG/0hTjnF+5cx50IN5Q++8s0mEyjfQ
	 k5uxRoWobYpZizUMTScuKF29PjVdeAbgyp76mybrqpf4IzI2KkjHFrSmViB5xsD4jI
	 j7DEidbnRfcWpK2uKc6xr46ZNuPpfBbRpnrW2DGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A594FF80CBD;
	Thu, 22 Aug 2019 21:07:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22D76F80750; Thu, 22 Aug 2019 21:06:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA22DF80677
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:05:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA22DF80677
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:05:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524623"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:05:32 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:04:22 +0200
Message-Id: <20190822190425.23001-33-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 32/35] ASoC: Intel: Skylake: Remove skl_dsp_ops
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

All declaration simplication and addition of FIRMWARE_CONFIG and
HARDWARE_CONFIG led to ultimate goal of removal of struct skl_dsp_ops.
Strike it down, struct sst_pdata is more than enough is providing
description for SST platforms.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-messages.c | 53 --------------------------
 sound/soc/intel/skylake/skl.h          |  8 ----
 2 files changed, 61 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-messages.c b/sound/soc/intel/skylake/skl-messages.c
index e401edd8d44b..5f63c3052db9 100644
--- a/sound/soc/intel/skylake/skl-messages.c
+++ b/sound/soc/intel/skylake/skl-messages.c
@@ -140,72 +140,19 @@ int skl_dsp_cleanup(struct device *dev,
 	return 0;
 }
 
-static const struct skl_dsp_ops dsp_ops[] = {
-	{
-		.id = 0x9d70,
-		.init = skl_sst_dsp_init,
-	},
-	{
-		.id = 0x9d71,
-		.init = skl_sst_dsp_init,
-	},
-	{
-		.id = 0x5a98,
-		.init = bxt_sst_dsp_init,
-	},
-	{
-		.id = 0x3198,
-		.init = bxt_sst_dsp_init,
-	},
-	{
-		.id = 0x9dc8,
-		.init = cnl_sst_dsp_init,
-	},
-	{
-		.id = 0xa348,
-		.init = cnl_sst_dsp_init,
-	},
-	{
-		.id = 0x02c8,
-		.init = cnl_sst_dsp_init,
-	},
-	{
-		.id = 0x06c8,
-		.init = cnl_sst_dsp_init,
-	},
-};
-
-const struct skl_dsp_ops *skl_get_dsp_ops(int pci_id)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(dsp_ops); i++) {
-		if (dsp_ops[i].id == pci_id)
-			return &dsp_ops[i];
-	}
-
-	return NULL;
-}
-
 int skl_init_dsp(struct skl_dev *skl, struct sst_pdata *pdata)
 {
 	struct hdac_bus *bus = skl_to_bus(skl);
-	const struct skl_dsp_ops *ops;
 	int ret;
 
 	/* enable ppcap interrupt */
 	snd_hdac_ext_bus_ppcap_enable(bus, true);
 	snd_hdac_ext_bus_ppcap_int_enable(bus, true);
 
-	ops = skl_get_dsp_ops(skl->pci->device);
-	if (!ops)
-		return -EIO;
-
 	ret = skl_sst_ctx_init(skl, pdata);
 	if (ret < 0)
 		return ret;
 
-	skl->dsp_ops = ops;
 	dev_dbg(bus->dev, "dsp registration status=%d\n", ret);
 
 	return 0;
diff --git a/sound/soc/intel/skylake/skl.h b/sound/soc/intel/skylake/skl.h
index f4cd5ccc1ff9..218e8bda6cae 100644
--- a/sound/soc/intel/skylake/skl.h
+++ b/sound/soc/intel/skylake/skl.h
@@ -135,8 +135,6 @@ struct skl_dev {
 
 	struct skl_d0i3_data d0i3;
 
-	const struct skl_dsp_ops *dsp_ops;
-
 	/* Callback to update dynamic clock and power gating registers */
 	void (*clock_power_gating)(struct device *dev, bool enable);
 };
@@ -157,11 +155,6 @@ struct skl_machine_pdata {
 	bool use_tplg_pcm; /* use dais and dai links from topology */
 };
 
-struct skl_dsp_ops {
-	int id;
-	int (*init)(struct sst_dsp *dsp, struct sst_pdata *pdata);
-};
-
 int skl_platform_unregister(struct device *dev);
 int skl_platform_register(struct device *dev);
 
@@ -178,7 +171,6 @@ int skl_suspend_late_dsp(struct skl_dev *skl);
 int skl_suspend_dsp(struct skl_dev *skl);
 int skl_resume_dsp(struct skl_dev *skl);
 void skl_cleanup_resources(struct skl_dev *skl);
-const struct skl_dsp_ops *skl_get_dsp_ops(int pci_id);
 void skl_update_d0i3c(struct device *dev, bool enable);
 int skl_nhlt_create_sysfs(struct skl_dev *skl);
 void skl_nhlt_remove_sysfs(struct skl_dev *skl);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
