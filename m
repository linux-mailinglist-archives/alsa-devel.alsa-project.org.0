Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A38A454AA16
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 09:10:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D84A418AC;
	Tue, 14 Jun 2022 09:09:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D84A418AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655190628;
	bh=GC/A2SjBlztsHvLlZ8tf63JxqBUMLWhTshFRZpzc/hM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VL/4siejTcSCyAQaarysp4686rQa0jZVoIP08GbxCfvkhevdsBvvEEma7+eqCT1Ai
	 VGmsNT3WuHMkrknKFi743Ka0HZ6z/+VHsl+xkEiguGnn/AdKQS5RPNBCTYefQ8QweT
	 sr/Co+89mnJGMY+tA+HZ4JC+q4Zk9XX8NNqAUPKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42C4EF80533;
	Tue, 14 Jun 2022 09:09:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB67BF8052F; Tue, 14 Jun 2022 09:09:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1A05F80137
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 09:08:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1A05F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BOuSegyv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655190525; x=1686726525;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=GC/A2SjBlztsHvLlZ8tf63JxqBUMLWhTshFRZpzc/hM=;
 b=BOuSegyvaXA4Nw4VAnNcW3HhgSFCIhkKlmYG3+8moor4kp7IH4xVyA3J
 /IUfk/XoJP5uSyQ4WVmJffa9ucwRvJ3XlQ1/QSCGsOEPpC2DWopGv1Kuy
 DROTaJdKWEl0WggK8+xoruvUj+GankvZ7NgvdsgzIWFrM8JOXtndgsZpQ
 kiIIy+Fr39/wYyvfhKf18ZB+QQKkJcpJ9+u815xk1RN1HhnZzpQ0Agnoh
 eCbl1cWTcRS5ESOEI7YDMpYsC56M613l8zxqsPpb9sXN8WrapXZXtjUqu
 MULYmj088WMiXQKQqzZAueaLRUqOeLvXoOVpiuAPTlFc55++4mIJzIgyi g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="279250045"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="279250045"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 00:08:32 -0700
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="640185936"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 00:08:29 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 1/2] soundwire: Intel: add trigger callback
Date: Tue, 14 Jun 2022 15:08:16 +0800
Message-Id: <20220614070817.2508-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220614070817.2508-1-yung-chuan.liao@linux.intel.com>
References: <20220614070817.2508-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com,
 bard.liao@intel.com
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

When a pipeline is split into FE and BE parts, the BE pipeline may need to
be triggered separately in the BE trigger op. So add the trigger callback
in the link_res ops that will be invoked during BE DAI trigger.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 drivers/soundwire/intel.c           | 8 ++++++++
 include/linux/soundwire/sdw_intel.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 505c5ef061e3..2e7c27d303b4 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1004,9 +1004,17 @@ static int intel_trigger(struct snd_pcm_substream *substream, int cmd, struct sn
 {
 	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
+	struct sdw_intel_link_res *res = sdw->link_res;
 	struct sdw_cdns_dma_data *dma;
 	int ret = 0;
 
+	/* The .trigger callback is used to send required IPC to audio
+	 * firmware. The .free_stream callback will still be called
+	 * by intel_free_stream() in the TRIGGER_SUSPEND case.
+	 */
+	if (res->ops && res->ops->trigger)
+		res->ops->trigger(dai, cmd, substream->stream);
+
 	dma = snd_soc_dai_get_dma_data(dai, substream);
 	if (!dma) {
 		dev_err(dai->dev, "failed to get dma data in %s\n",
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 67e0d3e750b5..f638707fd712 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -119,6 +119,7 @@ struct sdw_intel_ops {
 			     struct sdw_intel_stream_params_data *params_data);
 	int (*free_stream)(struct device *dev,
 			   struct sdw_intel_stream_free_data *free_data);
+	int (*trigger)(struct snd_soc_dai *dai, int cmd, int stream);
 };
 
 /**
-- 
2.17.1

