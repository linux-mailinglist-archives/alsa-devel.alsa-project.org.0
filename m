Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F414F510742
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 20:39:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94CBE16B4;
	Tue, 26 Apr 2022 20:38:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94CBE16B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650998366;
	bh=vNtMQP8kYjnk1oJGNH8j5IK3rjQC/GwvmDzItwmMhzU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sq3nLRPfioMrIYrVTcUfeWmvDemfvvY+fdXcA5VFqNxJekxLhpjT/jNU1e6nadt2R
	 D5NoZ/QqFgdshetObZF5SPHC6m94gFLiuPj/vHIZ5b8wkDViNSo8ZRTux6Mkmdyj1c
	 v25rWJW631wCtMb6YB3wZmwJiaNkaSWeeih+2O7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20DEEF800FA;
	Tue, 26 Apr 2022 20:38:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2185EF80152; Tue, 26 Apr 2022 20:38:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31950F800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 20:38:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31950F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="H3x1S2HR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650998304; x=1682534304;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vNtMQP8kYjnk1oJGNH8j5IK3rjQC/GwvmDzItwmMhzU=;
 b=H3x1S2HRycMExsmvpqbaZixwGkmTMOM5pL0eeCO08/ZUa2JNB/ZFlWzP
 9VCo4+MeGmZXNG2W6jumaTKdjXad20JKQ2GxwppjibujBTshaVk0ZZABO
 MG6Ldk6RLMHpYNnYP/TrjDYiZZ9YV/EplIrH9LwAKhcgIUPqu2d+TWDge
 TJdBK6DaCRpMR5NviUqYyy3Ap2qovfuMkXzcBoPXKh/4HbIBh9Bo7XViU
 C2tvP79lAJxXlc7glgMfaSy9J1cVBWldeFvYROKB21E8AcKcQlxymwDS9
 9cg95UBfD/1fyJchOzj1NdcQCx+eCOwkJ287EzFziztukJJwuKMTpG5/q w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="245608107"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="245608107"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 11:38:18 -0700
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="628657584"
Received: from jzhang96-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.202])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 11:38:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: atom: use pm_runtime_resume_and_get()
Date: Tue, 26 Apr 2022 13:38:07 -0500
Message-Id: <20220426183807.102442-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Use pm_runtime_resume_and_get() to replace the pm_runtime_get_sync() and
pm_runtime_put_sync() pattern.

No functional changes.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/atom/sst/sst_drv_interface.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst_drv_interface.c b/sound/soc/intel/atom/sst/sst_drv_interface.c
index 0af618dd80730..dc31c2c8f54c8 100644
--- a/sound/soc/intel/atom/sst/sst_drv_interface.c
+++ b/sound/soc/intel/atom/sst/sst_drv_interface.c
@@ -136,11 +136,10 @@ static int sst_power_control(struct device *dev, bool state)
 	int usage_count = 0;
 
 	if (state) {
-		ret = pm_runtime_get_sync(dev);
+		ret = pm_runtime_resume_and_get(dev);
 		usage_count = GET_USAGE_COUNT(dev);
 		dev_dbg(ctx->dev, "Enable: pm usage count: %d\n", usage_count);
 		if (ret < 0) {
-			pm_runtime_put_sync(dev);
 			dev_err(ctx->dev, "Runtime get failed with err: %d\n", ret);
 			return ret;
 		}
@@ -193,11 +192,9 @@ static int sst_cdev_open(struct device *dev,
 	struct stream_info *stream;
 	struct intel_sst_drv *ctx = dev_get_drvdata(dev);
 
-	retval = pm_runtime_get_sync(ctx->dev);
-	if (retval < 0) {
-		pm_runtime_put_sync(ctx->dev);
+	retval = pm_runtime_resume_and_get(ctx->dev);
+	if (retval < 0)
 		return retval;
-	}
 
 	str_id = sst_get_stream(ctx, str_params);
 	if (str_id > 0) {
@@ -645,11 +642,9 @@ static int sst_send_byte_stream(struct device *dev,
 
 	if (NULL == bytes)
 		return -EINVAL;
-	ret_val = pm_runtime_get_sync(ctx->dev);
-	if (ret_val < 0) {
-		pm_runtime_put_sync(ctx->dev);
+	ret_val = pm_runtime_resume_and_get(ctx->dev);
+	if (ret_val < 0)
 		return ret_val;
-	}
 
 	ret_val = sst_send_byte_stream_mrfld(ctx, bytes);
 	sst_pm_runtime_put(ctx);
-- 
2.30.2

