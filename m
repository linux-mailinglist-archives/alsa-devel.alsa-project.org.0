Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9ED49C0A1
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 02:20:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D19EB1F88;
	Wed, 26 Jan 2022 02:19:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D19EB1F88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643160019;
	bh=Y5QFgrRE6gbcfE8Im68LjhUmIaas2atxywqLCLJsx/Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=npNEpR+WAPlvlywxZPgjhoCC7LoolNPS6XSdgd/h7aK67vneZ3xqoUXDCVV22QQI/
	 pKKai3bTO7wvqysHvbDtOS/2r2YacKONCLT7eXwlm6ABimE+X3OYRGdQuEVQx+fcg8
	 ZTElh+G5L8kkuVswWF4FM6EfnHWoBiDcKOwRFUdM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8871F80527;
	Wed, 26 Jan 2022 02:17:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 030AFF8051B; Wed, 26 Jan 2022 02:17:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54CB6F80169
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 02:17:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54CB6F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="EY/0vfpn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643159863; x=1674695863;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=Y5QFgrRE6gbcfE8Im68LjhUmIaas2atxywqLCLJsx/Q=;
 b=EY/0vfpn/iYYrf6W9nPFlY9WBnGm0Rcws3ja8KbGSOlB+47LOdeEcGB3
 eZoGOYGQNOlByzrK9yH0n2CkmR/CUUJhDGvEfIw3XbNLmFxQ5CN6Idcm6
 EVLkmqLMttIq5/vrR1KSGdU3c+9DU9Vht23sUKrozSl31S46rQS4h7FKY
 2CLxAi2WyFxvmeZPsOtFrROA9nImUZj9ykg67Edze1JFXLvi64MS3lD41
 rQNnBCXeuArE6j6ssLP/ZCEFEh8ZxO8YoDniX4G5vponx7rH1zq/JLP3a
 Z9U5EVRX4cn+U7L+4rFqLWHYSszCS+yIQKfAz64Vj6R/8Zcsl7a9XEcwt A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246236135"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="246236135"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:40 -0800
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="520617403"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:37 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 04/19] soundwire: stream: add alloc/config/free helpers for
 ports
Date: Wed, 26 Jan 2022 09:17:00 +0800
Message-Id: <20220126011715.28204-5-yung-chuan.liao@linux.intel.com>
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

The existing code only has a config helper that allocates memory,
start adding alloc/config/free for ports, as a first step in the
simplification of the stream API.

This change removes a kfree() on a configuration error, this should
have not impact on existing platforms and error handling will be
revisited in follow-up patches to make sure invalid configurations
have not impact on memory allocation.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 83 +++++++++++++++++++++-----------------
 1 file changed, 45 insertions(+), 38 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 3ac2e5a66700..49d3a8d2fa31 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -865,6 +865,39 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
 	return ret;
 }
 
+static struct sdw_port_runtime *sdw_port_alloc(struct list_head *port_list)
+{
+	struct sdw_port_runtime *p_rt;
+
+	p_rt = kzalloc(sizeof(*p_rt), GFP_KERNEL);
+	if (!p_rt)
+		return NULL;
+
+	list_add_tail(&p_rt->port_node, port_list);
+
+	return p_rt;
+}
+
+static int sdw_port_config(struct sdw_port_runtime *p_rt,
+			   struct sdw_port_config *port_config,
+			   int port_index)
+{
+	p_rt->ch_mask = port_config[port_index].ch_mask;
+	p_rt->num = port_config[port_index].num;
+
+	/*
+	 * TODO: Check port capabilities for requested configuration
+	 */
+
+	return 0;
+}
+
+static void sdw_port_free(struct sdw_port_runtime *p_rt)
+{
+	list_del(&p_rt->port_node);
+	kfree(p_rt);
+}
+
 /**
  * sdw_release_stream() - Free the assigned stream runtime
  *
@@ -995,8 +1028,7 @@ static void sdw_master_port_release(struct sdw_bus *bus,
 	struct sdw_port_runtime *p_rt, *_p_rt;
 
 	list_for_each_entry_safe(p_rt, _p_rt, &m_rt->port_list, port_node) {
-		list_del(&p_rt->port_node);
-		kfree(p_rt);
+		sdw_port_free(p_rt);
 	}
 }
 
@@ -1015,8 +1047,7 @@ static void sdw_slave_port_release(struct sdw_bus *bus,
 
 			list_for_each_entry_safe(p_rt, _p_rt,
 						 &s_rt->port_list, port_node) {
-				list_del(&p_rt->port_node);
-				kfree(p_rt);
+				sdw_port_free(p_rt);
 			}
 		}
 	}
@@ -1187,43 +1218,24 @@ static int sdw_is_valid_port_range(struct device *dev, int num)
 	return 0;
 }
 
-static struct sdw_port_runtime
-*sdw_port_alloc(struct device *dev,
-		struct sdw_port_config *port_config,
-		int port_index)
-{
-	struct sdw_port_runtime *p_rt;
-
-	p_rt = kzalloc(sizeof(*p_rt), GFP_KERNEL);
-	if (!p_rt)
-		return NULL;
-
-	p_rt->ch_mask = port_config[port_index].ch_mask;
-	p_rt->num = port_config[port_index].num;
-
-	return p_rt;
-}
-
 static int sdw_master_port_config(struct sdw_bus *bus,
 				  struct sdw_master_runtime *m_rt,
 				  struct sdw_port_config *port_config,
 				  unsigned int num_ports)
 {
 	struct sdw_port_runtime *p_rt;
+	int ret;
 	int i;
 
 	/* Iterate for number of ports to perform initialization */
 	for (i = 0; i < num_ports; i++) {
-		p_rt = sdw_port_alloc(bus->dev, port_config, i);
+		p_rt = sdw_port_alloc(&m_rt->port_list);
 		if (!p_rt)
 			return -ENOMEM;
 
-		/*
-		 * TODO: Check port capabilities for requested
-		 * configuration (audio mode support)
-		 */
-
-		list_add_tail(&p_rt->port_node, &m_rt->port_list);
+		ret = sdw_port_config(p_rt, port_config, i);
+		if (ret < 0)
+			return ret;
 	}
 
 	return 0;
@@ -1239,7 +1251,7 @@ static int sdw_slave_port_config(struct sdw_slave *slave,
 
 	/* Iterate for number of ports to perform initialization */
 	for (i = 0; i < num_config; i++) {
-		p_rt = sdw_port_alloc(&slave->dev, port_config, i);
+		p_rt = sdw_port_alloc(&s_rt->port_list);
 		if (!p_rt)
 			return -ENOMEM;
 
@@ -1248,17 +1260,12 @@ static int sdw_slave_port_config(struct sdw_slave *slave,
 		 * slave
 		 */
 		ret = sdw_is_valid_port_range(&slave->dev, port_config[i].num);
-		if (ret < 0) {
-			kfree(p_rt);
+		if (ret < 0)
 			return ret;
-		}
 
-		/*
-		 * TODO: Check port capabilities for requested
-		 * configuration (audio mode support)
-		 */
-
-		list_add_tail(&p_rt->port_node, &s_rt->port_list);
+		ret = sdw_port_config(p_rt, port_config, i);
+		if (ret < 0)
+			return ret;
 	}
 
 	return 0;
-- 
2.17.1

