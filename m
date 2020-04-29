Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC8C1BF088
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 08:47:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08B7F168C;
	Thu, 30 Apr 2020 08:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08B7F168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588229261;
	bh=K8AT0yB40/HEjFbMjNUcFwyvDpHzlKSVnzSVpcrU3cs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vfFbgx6FplJUXTs9CtILmtbvJftUY9oi7mjAVJ1CEWfbAhQEn7p/1j/sM+rMfc+9z
	 /AEfQQDurtsrVjf0lxDJVqYSyVFq+Y81oCQeLB7Gpv+4rGcL0qdCRV2I8b2W8i7MvG
	 xdLaX8uI1dH9epQ8BpjRN1gdy9UAZ5AgL2mwfTkE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F655F80123;
	Thu, 30 Apr 2020 08:46:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63F54F801DB; Thu, 30 Apr 2020 08:45:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3564DF80123
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 08:45:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3564DF80123
IronPort-SDR: Rcs4+psfb1bzxmmzm5oVaa2gyISeSxVBKLOBulpxwsDa0kxpGRL9A4tTzrnOEHinW1O+Wh6Yny
 3Xn7bWvHDvzQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 23:45:46 -0700
IronPort-SDR: 5JDk6IlEH4J//G4hxGQbGfk9EcsA4GLTNYnOGk+Najmtr/DTUSKoGbTimstED8jiExCOByLXVE
 4m48v6OIp3rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,334,1583222400"; d="scan'208";a="459460044"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga005.fm.intel.com with ESMTP; 29 Apr 2020 23:45:42 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: qcom: fix error handling in probe
Date: Thu, 30 Apr 2020 02:50:57 +0800
Message-Id: <20200429185057.12810-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, tiwai@suse.de,
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

Make sure all error cases are properly handled and all resources freed.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/qcom.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index d6c9ad231873..e08a17c13f92 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -765,12 +765,16 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	}
 
 	ctrl->irq = of_irq_get(dev->of_node, 0);
-	if (ctrl->irq < 0)
-		return ctrl->irq;
+	if (ctrl->irq < 0) {
+		ret = ctrl->irq;
+		goto err_init;
+	}
 
 	ctrl->hclk = devm_clk_get(dev, "iface");
-	if (IS_ERR(ctrl->hclk))
-		return PTR_ERR(ctrl->hclk);
+	if (IS_ERR(ctrl->hclk)) {
+		ret = PTR_ERR(ctrl->hclk);
+		goto err_init;
+	}
 
 	clk_prepare_enable(ctrl->hclk);
 
@@ -787,7 +791,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 
 	ret = qcom_swrm_get_port_config(ctrl);
 	if (ret)
-		return ret;
+		goto err_clk;
 
 	params = &ctrl->bus.params;
 	params->max_dr_freq = DEFAULT_CLK_FREQ;
@@ -814,28 +818,32 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 					"soundwire", ctrl);
 	if (ret) {
 		dev_err(dev, "Failed to request soundwire irq\n");
-		goto err;
+		goto err_clk;
 	}
 
 	ret = sdw_add_bus_master(&ctrl->bus);
 	if (ret) {
 		dev_err(dev, "Failed to register Soundwire controller (%d)\n",
 			ret);
-		goto err;
+		goto err_clk;
 	}
 
 	qcom_swrm_init(ctrl);
 	ret = qcom_swrm_register_dais(ctrl);
 	if (ret)
-		goto err;
+		goto err_master_add;
 
 	dev_info(dev, "Qualcomm Soundwire controller v%x.%x.%x Registered\n",
 		 (ctrl->version >> 24) & 0xff, (ctrl->version >> 16) & 0xff,
 		 ctrl->version & 0xffff);
 
 	return 0;
-err:
+
+err_master_add:
+	sdw_delete_bus_master(&ctrl->bus);
+err_clk:
 	clk_disable_unprepare(ctrl->hclk);
+err_init:
 	return ret;
 }
 
-- 
2.17.1

