Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E3C49C0B8
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 02:23:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C41EA1FD2;
	Wed, 26 Jan 2022 02:22:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C41EA1FD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643160194;
	bh=L3Rs5jIAORH1Ru0BztTzuyiSSChTf9LFA+0AV67sWM4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HfPy96OnazmVSdIkDF6PzbCUS9LOSHwOhYF+ZberQo1mJgyASLg62YxnldtGpSL7G
	 e7QZuQpvur0jS1XrskvVE7BMAoPJsOGpT91ElfO5Kgc7oLrvPjLWb7czQApCBnW7Ha
	 20Z5vZkX7twONhgC+qfPtkh4XKwznp06bVDt9pxQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A6CAF80589;
	Wed, 26 Jan 2022 02:18:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8B6EF8057B; Wed, 26 Jan 2022 02:18:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5CE9F80578
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 02:18:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5CE9F80578
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QQ6sNbPU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643159895; x=1674695895;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=L3Rs5jIAORH1Ru0BztTzuyiSSChTf9LFA+0AV67sWM4=;
 b=QQ6sNbPUeLwzdIBdxjny3Rh8go/lwkWJaL4OJGnqhVPZdyoq3vDMkYwX
 cmBjobvOra777LX5v1SmNzIqLf0dzsaPyHLEtjeTrJ1tLUHSqqzkFMvxT
 eAWu+Wge83eYYgMnYQxFFeenR2BIDAi6JnkX6Xy0d6kfkdkcOyj/HFIMX
 KxEMxFfrxWrTyM091f6mtYk/YwW3D6oTJ/SqE/gWlwnML2PYRLGDj6AQt
 M7XoWOoldCyXzuQH3EmsZaBzXQ0mP5ZliAwY/ez5U0nT6yIrpUQzLemjN
 BYtMhSMXE1fuVTFk5I+HdrVuJDCy4VK8F5KWRPKsjvH8yGeAfO1C54IXk g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246236226"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="246236226"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:18:09 -0800
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="520617637"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:18:06 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 15/19] soundwire: stream: move list addition to
 sdw_slave_alloc_rt()
Date: Wed, 26 Jan 2022 09:17:11 +0800
Message-Id: <20220126011715.28204-16-yung-chuan.liao@linux.intel.com>
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

Simplify sdw_stream_add_slave() by moving the linked list management
inside of the sdw_slave_alloc_rt_free() helper, this also makes the
alloc/free helpers more symmetrical.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index e57920ee4c55..8a76d6605f93 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1019,11 +1019,13 @@ static int sdw_master_port_config(struct sdw_master_runtime *m_rt,
  * sdw_slave_rt_alloc() - Allocate a Slave runtime handle.
  *
  * @slave: Slave handle
+ * @m_rt: Master runtime handle
  *
  * This function is to be called with bus_lock held.
  */
 static struct sdw_slave_runtime
-*sdw_slave_rt_alloc(struct sdw_slave *slave)
+*sdw_slave_rt_alloc(struct sdw_slave *slave,
+		    struct sdw_master_runtime *m_rt)
 {
 	struct sdw_slave_runtime *s_rt;
 
@@ -1034,6 +1036,8 @@ static struct sdw_slave_runtime
 	INIT_LIST_HEAD(&s_rt->port_list);
 	s_rt->slave = slave;
 
+	list_add_tail(&s_rt->m_rt_node, &m_rt->slave_rt_list);
+
 	return s_rt;
 }
 
@@ -1949,13 +1953,12 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 		goto stream_error;
 
 skip_alloc_master_rt:
-	s_rt = sdw_slave_rt_alloc(slave);
+	s_rt = sdw_slave_rt_alloc(slave, m_rt);
 	if (!s_rt) {
 		dev_err(&slave->dev, "Slave runtime alloc failed for stream:%s\n", stream->name);
 		ret = -ENOMEM;
 		goto stream_error;
 	}
-	list_add_tail(&s_rt->m_rt_node, &m_rt->slave_rt_list);
 
 	ret = sdw_slave_rt_config(s_rt, stream_config);
 	if (ret)
-- 
2.17.1

