Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB641AD92A
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 10:54:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FCC51662;
	Fri, 17 Apr 2020 10:53:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FCC51662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587113688;
	bh=rKywJbWDNU/cDfUfjoCcWfKhJ1bJjVISOW8Va4nzlSc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ap9fhqia19BSIfV/6UhD3bEIbNduEYX3vcSAcFNpFqDKBazOSEWC1B+NFF5zaKkK5
	 CHIF1Zjqkn33Fl+e9ITed5Ewlh/DSi42tf22StNJ786gMLIrKIhYATnnamUXXWJimw
	 wNhQz+aaZHba0/XviRnOnU0SjVLD1iMZGP6xe7Vs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEFC5F802A0;
	Fri, 17 Apr 2020 10:50:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66C79F800DE; Fri, 17 Apr 2020 10:50:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10384F800DE
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 10:50:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10384F800DE
IronPort-SDR: clALR95PbCxepjh38Riw98hf5FdbCBFY+d0zRQE+2e3aAMDLumZQqP/3lJWXGLXUVpKYycfnQe
 4TN5hOV1hg9w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 01:50:43 -0700
IronPort-SDR: eHkGFsODeVk6ccqqIrfKNikSmVZWurLcpVNwoIntVeG1AKObP+8382x1fclOfzQkFrK7z910ql
 WKWy9Cmrwqlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; d="scan'208";a="454661488"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga005.fm.intel.com with ESMTP; 17 Apr 2020 01:50:39 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [RFC 4/5] soundwire: qcom: add sdw_master_device support
Date: Fri, 17 Apr 2020 04:55:23 +0800
Message-Id: <20200416205524.2043-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416205524.2043-1-yung-chuan.liao@linux.intel.com>
References: <20200416205524.2043-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com
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

Add new device as a child of the platform device, following the
following hierarchy:

platform_device
    sdw_master_device
        sdw_slave0
	...
	sdw_slaveN

For the Qualcomm implementation no sdw_link_ops are provided. All the
dais have to be registered using the platform_device and all power
management is handled at the platform device level.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/qcom.c | 39 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index e08a17c13f92..96306044aa84 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -89,6 +89,7 @@ struct qcom_swrm_port_config {
 struct qcom_swrm_ctrl {
 	struct sdw_bus bus;
 	struct device *dev;
+	struct sdw_master_device *md;
 	struct regmap *regmap;
 	struct completion *comp;
 	struct work_struct slave_work;
@@ -746,7 +747,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	struct sdw_master_prop *prop;
 	struct sdw_bus_params *params;
 	struct qcom_swrm_ctrl *ctrl;
-	int ret;
+	int ret, err;
 	u32 val;
 
 	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
@@ -784,14 +785,34 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	mutex_init(&ctrl->port_lock);
 	INIT_WORK(&ctrl->slave_work, qcom_swrm_slave_wq);
 
-	ctrl->bus.dev = dev;
+	/*
+	 * add sdw_master_device.
+	 * For the Qualcomm implementation there is no driver.
+	 */
+	ctrl->md = sdw_master_device_add(dev,	/* platform device is parent */
+					 dev->fwnode,
+					 NULL,	/* no link ops */
+					 0,	/* only one link supported */
+					 NULL);	/* no context */
+	if (IS_ERR(ctrl->md)) {
+		dev_err(dev, "Could not create sdw_master_device\n");
+		ret = PTR_ERR(ctrl->md);
+		goto err_clk;
+	}
+
+	/* add bus handle */
+	ctrl->md->bus = &ctrl->bus;
+
+	/* the bus uses the sdw_master_device, not the platform device */
+	ctrl->bus.dev = &ctrl->md->dev;
+
 	ctrl->bus.ops = &qcom_swrm_ops;
 	ctrl->bus.port_ops = &qcom_swrm_port_ops;
 	ctrl->bus.compute_params = &qcom_swrm_compute_params;
 
 	ret = qcom_swrm_get_port_config(ctrl);
 	if (ret)
-		goto err_clk;
+		goto err_md;
 
 	params = &ctrl->bus.params;
 	params->max_dr_freq = DEFAULT_CLK_FREQ;
@@ -818,14 +839,14 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 					"soundwire", ctrl);
 	if (ret) {
 		dev_err(dev, "Failed to request soundwire irq\n");
-		goto err_clk;
+		goto err_md;
 	}
 
 	ret = sdw_add_bus_master(&ctrl->bus);
 	if (ret) {
 		dev_err(dev, "Failed to register Soundwire controller (%d)\n",
 			ret);
-		goto err_clk;
+		goto err_md;
 	}
 
 	qcom_swrm_init(ctrl);
@@ -841,6 +862,10 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 
 err_master_add:
 	sdw_delete_bus_master(&ctrl->bus);
+err_md:
+	err = sdw_master_device_del(ctrl->md);
+	if (err < 0) /* log but return initial status */
+		dev_err(dev, "master device del failed %d\n", err);
 err_clk:
 	clk_disable_unprepare(ctrl->hclk);
 err_init:
@@ -850,8 +875,12 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 static int qcom_swrm_remove(struct platform_device *pdev)
 {
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(&pdev->dev);
+	int err;
 
 	sdw_delete_bus_master(&ctrl->bus);
+	err = sdw_master_device_del(ctrl->md);
+	if (err < 0)
+		dev_err(&pdev->dev, "master device del failed %d\n", err);
 	clk_disable_unprepare(ctrl->hclk);
 
 	return 0;
-- 
2.17.1

