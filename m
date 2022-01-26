Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E43B849C0BA
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 02:23:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 888D71FD3;
	Wed, 26 Jan 2022 02:22:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 888D71FD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643160228;
	bh=HqwmM8cFsKV+ilXjUfiKlQwCHphq3jNKilfDG+AYRhU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k4tRt+QKygSRdbvfgGWeDVU9cewUMGFAcmwzXXq3kIoFoiLeR+m1oUf9+45HZ25sf
	 kohZF3c16Xb8WE3LLTVtDdu9pzIFCKyCV+Eg5RhHVIV7B9krZ6EJxqxwlVTfLH6vNO
	 QAE9HYaE/Wzvq2pqsNkErz5EsjR4+m46kk24HNFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42D11F804FE;
	Wed, 26 Jan 2022 02:18:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 183E8F805A9; Wed, 26 Jan 2022 02:18:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FFA6F804D1
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 02:18:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FFA6F804D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YcHMo/A5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643159914; x=1674695914;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=HqwmM8cFsKV+ilXjUfiKlQwCHphq3jNKilfDG+AYRhU=;
 b=YcHMo/A5p8X+vPMA4LJABgmCzJ6T9z/zkwYrnlndfqXLFNPSxLCz8Ec9
 JTDjGiUFCLY2Tm733kaUu+8BH90u8Py44jfUmnIi1+LAUQO9vWBgQwD4E
 qUCRyx7sL+aUGrP+EC4MTUMHYGZNKOCa3LFGJ2lZOxnYkJrLismTtOGeK
 naD02T2Up1+ToH6oKviFvxtD1TUr+i9BJ9LuCLQTjT+mMEltyE8eO4F+0
 xSr6SUWj4j4IW1Waixsz/xWP4mFAczhK/88F7JhfmFBAhEU4rQ4pA9kHS
 WEiGUg3kB/SjTRcQqCMCEu0BopU4DGo3gw/ubpt89/Am5hGJrIcoQi+4N Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246236245"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="246236245"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:18:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="520617654"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:18:11 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 17/19] soundwire: stream: introduce sdw_slave_rt_find() helper
Date: Wed, 26 Jan 2022 09:17:13 +0800
Message-Id: <20220126011715.28204-18-yung-chuan.liao@linux.intel.com>
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

Before we split the alloc and config steps, we need a helper to find
the Slave runtime for a stream. The helper is based on the search loop
in sdw_slave_rt_free(), which can now be simplified.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 03cfac0129af..a52a9ab0eea1 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1058,6 +1058,23 @@ static int sdw_slave_rt_config(struct sdw_slave_runtime *s_rt,
 	return 0;
 }
 
+static struct sdw_slave_runtime *sdw_slave_rt_find(struct sdw_slave *slave,
+						   struct sdw_stream_runtime *stream)
+{
+	struct sdw_slave_runtime *s_rt, *_s_rt;
+	struct sdw_master_runtime *m_rt;
+
+	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
+		/* Retrieve Slave runtime handle */
+		list_for_each_entry_safe(s_rt, _s_rt,
+					 &m_rt->slave_rt_list, m_rt_node) {
+			if (s_rt->slave == slave)
+				return s_rt;
+		}
+	}
+	return NULL;
+}
+
 /**
  * sdw_slave_rt_free() - Free Slave(s) runtime handle
  *
@@ -1069,19 +1086,12 @@ static int sdw_slave_rt_config(struct sdw_slave_runtime *s_rt,
 static void sdw_slave_rt_free(struct sdw_slave *slave,
 			      struct sdw_stream_runtime *stream)
 {
-	struct sdw_slave_runtime *s_rt, *_s_rt;
-	struct sdw_master_runtime *m_rt;
+	struct sdw_slave_runtime *s_rt;
 
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
+	s_rt = sdw_slave_rt_find(slave, stream);
+	if (s_rt) {
+		list_del(&s_rt->m_rt_node);
+		kfree(s_rt);
 	}
 }
 
-- 
2.17.1

