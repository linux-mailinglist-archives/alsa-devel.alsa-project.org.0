Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E0549C0AB
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 02:22:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EEC3844;
	Wed, 26 Jan 2022 02:21:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EEC3844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643160126;
	bh=j9FedpyuD/S2NgO/mc5ZrDZt8ygTqEiARrruER7q7HU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IYsvE9KHUAKO2hcihs0/+43gze79FeccOvmQMYMA2adTe57XO01XBX/DxcVGkRlqc
	 fMiuqGuKZUd6NF8Jjor/knN6vgt1TatPSbhsBhfxEAgCbUHHblYQADeTfirk9cwxB6
	 fYGyYxig6iGw/iyOt/m35ZqOO/34s291fp3lYO50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C9FAF80559;
	Wed, 26 Jan 2022 02:18:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DA26F80557; Wed, 26 Jan 2022 02:18:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9945F80552
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 02:18:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9945F80552
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bA6Sb4xl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643159883; x=1674695883;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=j9FedpyuD/S2NgO/mc5ZrDZt8ygTqEiARrruER7q7HU=;
 b=bA6Sb4xlv4V4yIhjU1Ua0ow3u5nFfhYjubqTrNxa9z45ODbXMgvK9GYz
 x1znCpPCTrZhZP4yv8c8e7rLSODzjvdqfRSNq1/lv0jI601mpTJv1vgCx
 2dsdaek/NWAbLK7XCBeXGo13LTw2eYp9jshoSE7xobYqEGiSCnG77ubRu
 iPVVtES/BBM+7zSt/R2rqMpQ8LpuZbusvYGQz8C5ijF6im7J9lY0upqzB
 o/GEuDMplRaAJF4YV+SpD+WOYg22YPA6ycCKCJBDA7cwKnY9glSSnwJO1
 vONpjp+dXRJqS3NaT1J7H0zgscqAF6PYoc/eAtG0NScf/PdMpRiApGBIM Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246236200"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="246236200"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:59 -0800
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="520617541"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:56 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 11/19] soundwire: stream: move sdw_alloc_slave_rt() before
 'master' helpers
Date: Wed, 26 Jan 2022 09:17:07 +0800
Message-Id: <20220126011715.28204-12-yung-chuan.liao@linux.intel.com>
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

Code move before splitting the function in two.
No functionality change.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 52 +++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index e38c9208c77b..eef2e5fd245e 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1054,6 +1054,32 @@ struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name)
 }
 EXPORT_SYMBOL(sdw_alloc_stream);
 
+/**
+ * sdw_alloc_slave_rt() - Allocate and initialize Slave runtime handle.
+ *
+ * @slave: Slave handle
+ * @stream_config: Stream configuration
+ *
+ * This function is to be called with bus_lock held.
+ */
+static struct sdw_slave_runtime
+*sdw_alloc_slave_rt(struct sdw_slave *slave,
+		    struct sdw_stream_config *stream_config)
+{
+	struct sdw_slave_runtime *s_rt;
+
+	s_rt = kzalloc(sizeof(*s_rt), GFP_KERNEL);
+	if (!s_rt)
+		return NULL;
+
+	INIT_LIST_HEAD(&s_rt->port_list);
+	s_rt->ch_count = stream_config->ch_count;
+	s_rt->direction = stream_config->direction;
+	s_rt->slave = slave;
+
+	return s_rt;
+}
+
 static struct sdw_master_runtime
 *sdw_master_rt_find(struct sdw_bus *bus,
 		    struct sdw_stream_runtime *stream)
@@ -1118,32 +1144,6 @@ static int sdw_master_rt_config(struct sdw_master_runtime *m_rt,
 	return 0;
 }
 
-/**
- * sdw_alloc_slave_rt() - Allocate and initialize Slave runtime handle.
- *
- * @slave: Slave handle
- * @stream_config: Stream configuration
- *
- * This function is to be called with bus_lock held.
- */
-static struct sdw_slave_runtime
-*sdw_alloc_slave_rt(struct sdw_slave *slave,
-		    struct sdw_stream_config *stream_config)
-{
-	struct sdw_slave_runtime *s_rt;
-
-	s_rt = kzalloc(sizeof(*s_rt), GFP_KERNEL);
-	if (!s_rt)
-		return NULL;
-
-	INIT_LIST_HEAD(&s_rt->port_list);
-	s_rt->ch_count = stream_config->ch_count;
-	s_rt->direction = stream_config->direction;
-	s_rt->slave = slave;
-
-	return s_rt;
-}
-
 /**
  * sdw_release_slave_stream() - Free Slave(s) runtime handle
  *
-- 
2.17.1

