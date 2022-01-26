Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA1249C0B5
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 02:22:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 169331FD0;
	Wed, 26 Jan 2022 02:22:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 169331FD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643160178;
	bh=b59jTAE/DjKDRknOz4w/Dz0RG6Sqxw3hnLnDkfdbU/4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rW+ksqfaDZ5jDqh9Sqz15Gmyasuy1QDcH1HBrVXxd5Ux0GnQ/xuZEsU9YlNCBgjPq
	 FdRETD3J7wRQlorFLoMVAIV5/frYmaIkLv2G5D2YDRKf63RpiHgZB8nj0ivgMcctaK
	 0QhrM0n5xku0rWeizQ/dQ7N7L3kGeu5rW536ocFs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B94F3F8057B;
	Wed, 26 Jan 2022 02:18:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8C49F80567; Wed, 26 Jan 2022 02:18:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEE2EF80570
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 02:18:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEE2EF80570
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="JZ5F4tCd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643159893; x=1674695893;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=b59jTAE/DjKDRknOz4w/Dz0RG6Sqxw3hnLnDkfdbU/4=;
 b=JZ5F4tCdEnyXiptx8f6h20vjIrrzSjKDri/DFzT/6StOxj8jRpedlSjK
 PWuPmIQg5lWhbpP1yk3/mdJaZu38RSOp+Aa3xKAW3rcH/ZBnucA4lKUrj
 vAzBabMNEWsiMjPj5p8yeA8cNUhKmTpPkxGCEag5pDH5kMtyHOGkJeDPy
 MVnzYPBFz1LQ7oeR7L1nBmB9G+enuLqq0muUqy2rTVHJc4viE1bb65qaV
 6LziKAZ5MrRBS7OPjL3IOtfcaTuJcd3vmzycsmdet4fAG7aWmMzr+KQuf
 pcYqGTuM/Ofeq2Dt3ZZHlwEzOsHBOM+MPy5+rQQHXaR5jgQluyZe8UC91 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246236220"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; 
 d="scan'208,217";a="246236220"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:18:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; 
 d="scan'208,217";a="520617617"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:18:04 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 14/19] soundwire: stream: rename and move master/slave_rt_free
 routines
Date: Wed, 26 Jan 2022 09:17:10 +0800
Message-Id: <20220126011715.28204-15-yung-chuan.liao@linux.intel.com>
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

The naming is rather inconsistent, use the sdw_<object>_<action>
convention, and move the free routine after alloc/config.

No functionality change beyond rename/move.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 72 +++++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index b0f21f2ca599..e57920ee4c55 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1054,6 +1054,33 @@ static int sdw_slave_rt_config(struct sdw_slave_runtime *s_rt,
 	return 0;
 }
 
+/**
+ * sdw_slave_rt_free() - Free Slave(s) runtime handle
+ *
+ * @slave: Slave handle.
+ * @stream: Stream runtime handle.
+ *
+ * This function is to be called with bus_lock held.
+ */
+static void sdw_slave_rt_free(struct sdw_slave *slave,
+			      struct sdw_stream_runtime *stream)
+{
+	struct sdw_slave_runtime *s_rt, *_s_rt;
+	struct sdw_master_runtime *m_rt;
+
+	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
+		/* Retrieve Slave runtime handle */
+		list_for_each_entry_safe(s_rt, _s_rt,
+					 &m_rt->slave_rt_list, m_rt_node) {
+			if (s_rt->slave == slave) {
+				list_del(&s_rt->m_rt_node);
+				kfree(s_rt);
+				return;
+			}
+		}
+	}
+}
+
 static struct sdw_master_runtime
 *sdw_master_rt_find(struct sdw_bus *bus,
 		    struct sdw_stream_runtime *stream)
@@ -1119,51 +1146,24 @@ static int sdw_master_rt_config(struct sdw_master_runtime *m_rt,
 }
 
 /**
- * sdw_release_slave_stream() - Free Slave(s) runtime handle
- *
- * @slave: Slave handle.
- * @stream: Stream runtime handle.
- *
- * This function is to be called with bus_lock held.
- */
-static void sdw_release_slave_stream(struct sdw_slave *slave,
-				     struct sdw_stream_runtime *stream)
-{
-	struct sdw_slave_runtime *s_rt, *_s_rt;
-	struct sdw_master_runtime *m_rt;
-
-	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
-		/* Retrieve Slave runtime handle */
-		list_for_each_entry_safe(s_rt, _s_rt,
-					 &m_rt->slave_rt_list, m_rt_node) {
-			if (s_rt->slave == slave) {
-				list_del(&s_rt->m_rt_node);
-				kfree(s_rt);
-				return;
-			}
-		}
-	}
-}
-
-/**
- * sdw_release_master_stream() - Free Master runtime handle
+ * sdw_master_rt_free() - Free Master runtime handle
  *
  * @m_rt: Master runtime node
  * @stream: Stream runtime handle.
  *
  * This function is to be called with bus_lock held
  * It frees the Master runtime handle and associated Slave(s) runtime
- * handle. If this is called first then sdw_release_slave_stream() will have
+ * handle. If this is called first then sdw_slave_rt_free() will have
  * no effect as Slave(s) runtime handle would already be freed up.
  */
-static void sdw_release_master_stream(struct sdw_master_runtime *m_rt,
-				      struct sdw_stream_runtime *stream)
+static void sdw_master_rt_free(struct sdw_master_runtime *m_rt,
+			       struct sdw_stream_runtime *stream)
 {
 	struct sdw_slave_runtime *s_rt, *_s_rt;
 
 	list_for_each_entry_safe(s_rt, _s_rt, &m_rt->slave_rt_list, m_rt_node) {
 		sdw_slave_port_free(s_rt->slave, stream);
-		sdw_release_slave_stream(s_rt->slave, stream);
+		sdw_slave_rt_free(s_rt->slave, stream);
 	}
 
 	list_del(&m_rt->stream_node);
@@ -1860,7 +1860,7 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 	goto unlock;
 
 stream_error:
-	sdw_release_master_stream(m_rt, stream);
+	sdw_master_rt_free(m_rt, stream);
 unlock:
 	mutex_unlock(&bus->bus_lock);
 	return ret;
@@ -1888,7 +1888,7 @@ int sdw_stream_remove_master(struct sdw_bus *bus,
 			continue;
 
 		sdw_master_port_free(m_rt);
-		sdw_release_master_stream(m_rt, stream);
+		sdw_master_rt_free(m_rt, stream);
 		stream->m_rt_count--;
 	}
 
@@ -1987,7 +1987,7 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 	 * we hit error so cleanup the stream, release all Slave(s) and
 	 * Master runtime
 	 */
-	sdw_release_master_stream(m_rt, stream);
+	sdw_master_rt_free(m_rt, stream);
 error:
 	mutex_unlock(&slave->bus->bus_lock);
 	return ret;
@@ -2008,7 +2008,7 @@ int sdw_stream_remove_slave(struct sdw_slave *slave,
 	mutex_lock(&slave->bus->bus_lock);
 
 	sdw_slave_port_free(slave, stream);
-	sdw_release_slave_stream(slave, stream);
+	sdw_slave_rt_free(slave, stream);
 
 	mutex_unlock(&slave->bus->bus_lock);
 
-- 
2.17.1

