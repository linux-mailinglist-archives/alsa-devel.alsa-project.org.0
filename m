Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A73B549C0AE
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 02:22:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 551281FD7;
	Wed, 26 Jan 2022 02:21:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 551281FD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643160144;
	bh=ktNU35jvB6Wlvb2Vej7NMspOL8Sc09iGaTQH2Ct64/4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qy5E0Oao57LYwUOomckMPS65N5wBAA63WKoKx63L77/ErW7qsGw/1PDu8LqN0Zylu
	 ekWyKLDS8FQrW8jUs/B05jgace0JStcNHSpuDVTob9xMGWHthRdmFLfe9L28wNkBmW
	 51PE4YXGXFomlwpWg/ArgVbAWoi+OYtqoLPxV9fY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94005F80568;
	Wed, 26 Jan 2022 02:18:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E3ACF8055B; Wed, 26 Jan 2022 02:18:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80B0DF80553
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 02:18:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80B0DF80553
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HwV8qFc4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643159884; x=1674695884;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=ktNU35jvB6Wlvb2Vej7NMspOL8Sc09iGaTQH2Ct64/4=;
 b=HwV8qFc46s8OISaiAOHQJpKP4O0HIDI5bZ7gWNLrNuA+xICuEwCTHSE+
 xuusG2Z1gkA3nCq1Rgz/6Wd/Z3nyKbK15+RjHXRVsCespv2vwH+Ofdoke
 WILddRROVIV8JVZej8DJXYfIwLjCY/5y6z4tZFKUlXgVRTVpMrnrWKcty
 exkjfFfRhTcisYGN6eJyOrph/3OcXTGlfo0r8+ln6KSypo+3pvx6GWbF/
 HpoHY14YNMhVBt4We7sYe4mlf19UMsjIpaLstnEPTpVP+X33IdQv9Ik9W
 vgKusc5JFIQgwUFZWgNPFRde7VSC7A12nMWOD6HkCKffvBisQuhMz+g7z w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246236208"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; 
 d="scan'208,217";a="246236208"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:18:01 -0800
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; 
 d="scan'208,217";a="520617564"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:59 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 12/19] soundwire: stream: split sdw_alloc_slave_rt() in alloc
 and config
Date: Wed, 26 Jan 2022 09:17:08 +0800
Message-Id: <20220126011715.28204-13-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220126011715.28204-1-yung-chuan.liao@linux.intel.com>
References: <20220126011715.28204-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

Split the two parts so that we can do multiple configurations during
ALSA/ASoC hw_params stage. Also follow existing convention
sdw_<object>_<action> used at lower level.

No functionality change here.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index eef2e5fd245e..b7ccfa5a9cfc 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1055,16 +1055,14 @@ struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name)
 EXPORT_SYMBOL(sdw_alloc_stream);
 
 /**
- * sdw_alloc_slave_rt() - Allocate and initialize Slave runtime handle.
+ * sdw_slave_rt_alloc() - Allocate a Slave runtime handle.
  *
  * @slave: Slave handle
- * @stream_config: Stream configuration
  *
  * This function is to be called with bus_lock held.
  */
 static struct sdw_slave_runtime
-*sdw_alloc_slave_rt(struct sdw_slave *slave,
-		    struct sdw_stream_config *stream_config)
+*sdw_slave_rt_alloc(struct sdw_slave *slave)
 {
 	struct sdw_slave_runtime *s_rt;
 
@@ -1073,13 +1071,28 @@ static struct sdw_slave_runtime
 		return NULL;
 
 	INIT_LIST_HEAD(&s_rt->port_list);
-	s_rt->ch_count = stream_config->ch_count;
-	s_rt->direction = stream_config->direction;
 	s_rt->slave = slave;
 
 	return s_rt;
 }
 
+/**
+ * sdw_slave_rt_config() - Configure a Slave runtime handle.
+ *
+ * @s_rt: Slave runtime handle
+ * @stream_config: Stream configuration
+ *
+ * This function is to be called with bus_lock held.
+ */
+static int sdw_slave_rt_config(struct sdw_slave_runtime *s_rt,
+			       struct sdw_stream_config *stream_config)
+{
+	s_rt->ch_count = stream_config->ch_count;
+	s_rt->direction = stream_config->direction;
+
+	return 0;
+}
+
 static struct sdw_master_runtime
 *sdw_master_rt_find(struct sdw_bus *bus,
 		    struct sdw_stream_runtime *stream)
@@ -1423,16 +1436,18 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 		goto stream_error;
 
 skip_alloc_master_rt:
-	s_rt = sdw_alloc_slave_rt(slave, stream_config);
+	s_rt = sdw_slave_rt_alloc(slave);
 	if (!s_rt) {
-		dev_err(&slave->dev,
-			"Slave runtime config failed for stream:%s\n",
-			stream->name);
+		dev_err(&slave->dev, "Slave runtime alloc failed for stream:%s\n", stream->name);
 		ret = -ENOMEM;
 		goto stream_error;
 	}
 	list_add_tail(&s_rt->m_rt_node, &m_rt->slave_rt_list);
 
+	ret = sdw_slave_rt_config(s_rt, stream_config);
+	if (ret)
+		goto stream_error;
+
 	ret = sdw_config_stream(&slave->dev, stream, stream_config, true);
 	if (ret)
 		goto stream_error;
-- 
2.17.1

