Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B34F934545E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 02:00:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBA261660;
	Tue, 23 Mar 2021 02:00:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBA261660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616461258;
	bh=VnL4Ag7z0UCgKaIUhRY21LVOSnDBChNCbRc2B+ripoU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SJFz6Rjh9FGui3equZBOv+ONwW6fo+GHuNjZbUrjwLmt9i+FZ8bCG7ROZ8xGblpD6
	 hEA7FIEPBPHPvip0ZtwbH17s6/Eq4cW9apOLQ5ItzIaINUPlxll0Oz9/q9J8J8XSqb
	 1+mJHRj46JVKgkwax3TO4KpWOG+pU1WUbxS8cJaE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3110F80107;
	Tue, 23 Mar 2021 01:59:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A57C7F801EC; Tue, 23 Mar 2021 01:59:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D71CF80155
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 01:59:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D71CF80155
IronPort-SDR: 367YcJUyr7O6qeIBb9PWI5bbWzK5X1qTNRL/nMSWDqNp6ekfMPbS8q5xcY+O/2NgU5T1o3nmhr
 +HOinThKjkhw==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="275477945"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="275477945"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 17:59:09 -0700
IronPort-SDR: teWCQMhQWj8rWy8khKlAmdGbYX74Cj+IUWpYvoKx7mIjzyMfY53uRbbk6CpN6NNvdEFKmpbJCP
 4BE0ZXKFX9dg==
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="414728323"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 17:59:06 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 1/5] soundwire: intel: add missing \n in dev_err()
Date: Tue, 23 Mar 2021 08:58:51 +0800
Message-Id: <20210323005855.20890-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210323005855.20890-1-yung-chuan.liao@linux.intel.com>
References: <20210323005855.20890-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

We fixed a lot of warnings in 2019 but the magic of copy-paste keeps
adding new ones...

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index d2254ee2fee2..e2e95115832a 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -997,7 +997,7 @@ static int intel_prepare(struct snd_pcm_substream *substream,
 
 	dma = snd_soc_dai_get_dma_data(dai, substream);
 	if (!dma) {
-		dev_err(dai->dev, "failed to get dma data in %s",
+		dev_err(dai->dev, "failed to get dma data in %s\n",
 			__func__);
 		return -EIO;
 	}
@@ -1061,7 +1061,7 @@ intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 
 	ret = intel_free_stream(sdw, substream, dai, sdw->instance);
 	if (ret < 0) {
-		dev_err(dai->dev, "intel_free_stream: failed %d", ret);
+		dev_err(dai->dev, "intel_free_stream: failed %d\n", ret);
 		return ret;
 	}
 
@@ -1634,7 +1634,7 @@ static int __maybe_unused intel_suspend(struct device *dev)
 
 	ret = intel_link_power_down(sdw);
 	if (ret) {
-		dev_err(dev, "Link power down failed: %d", ret);
+		dev_err(dev, "Link power down failed: %d\n", ret);
 		return ret;
 	}
 
@@ -1669,7 +1669,7 @@ static int __maybe_unused intel_suspend_runtime(struct device *dev)
 
 		ret = intel_link_power_down(sdw);
 		if (ret) {
-			dev_err(dev, "Link power down failed: %d", ret);
+			dev_err(dev, "Link power down failed: %d\n", ret);
 			return ret;
 		}
 
@@ -1693,7 +1693,7 @@ static int __maybe_unused intel_suspend_runtime(struct device *dev)
 
 		ret = intel_link_power_down(sdw);
 		if (ret) {
-			dev_err(dev, "Link power down failed: %d", ret);
+			dev_err(dev, "Link power down failed: %d\n", ret);
 			return ret;
 		}
 
@@ -1742,7 +1742,7 @@ static int __maybe_unused intel_resume(struct device *dev)
 
 	ret = intel_init(sdw);
 	if (ret) {
-		dev_err(dev, "%s failed: %d", __func__, ret);
+		dev_err(dev, "%s failed: %d\n", __func__, ret);
 		return ret;
 	}
 
@@ -1826,7 +1826,7 @@ static int __maybe_unused intel_resume_runtime(struct device *dev)
 	if (clock_stop_quirks & SDW_INTEL_CLK_STOP_TEARDOWN) {
 		ret = intel_init(sdw);
 		if (ret) {
-			dev_err(dev, "%s failed: %d", __func__, ret);
+			dev_err(dev, "%s failed: %d\n", __func__, ret);
 			return ret;
 		}
 
@@ -1871,7 +1871,7 @@ static int __maybe_unused intel_resume_runtime(struct device *dev)
 	} else if (clock_stop_quirks & SDW_INTEL_CLK_STOP_BUS_RESET) {
 		ret = intel_init(sdw);
 		if (ret) {
-			dev_err(dev, "%s failed: %d", __func__, ret);
+			dev_err(dev, "%s failed: %d\n", __func__, ret);
 			return ret;
 		}
 
@@ -1949,7 +1949,7 @@ static int __maybe_unused intel_resume_runtime(struct device *dev)
 
 		ret = intel_init(sdw);
 		if (ret) {
-			dev_err(dev, "%s failed: %d", __func__, ret);
+			dev_err(dev, "%s failed: %d\n", __func__, ret);
 			return ret;
 		}
 
-- 
2.17.1

