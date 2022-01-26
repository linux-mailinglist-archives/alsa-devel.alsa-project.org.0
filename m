Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5351349C0A8
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 02:21:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E29D91F85;
	Wed, 26 Jan 2022 02:20:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E29D91F85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643160092;
	bh=dL1KHyWmbzK6Rny1+Jx1gBeDHgqwGVS/OLQiDKKLSaU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sW96zEy9zKdBqp6UwJYyKkrBn2cJWlbQe4xegSI/ZJUDrVmnnG5WHGrQOvNU811XX
	 d9WyLB0JHhw/rn85U1uuC5XU+XoNLXLvEbjelvxvD2fOuaC2vfgeOpEjPaUrMo/b88
	 TKyrB0rKTdCtlX74HPTGjPDrTqh8L4O+bMt/xrSA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53C39F80544;
	Wed, 26 Jan 2022 02:18:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06B99F80542; Wed, 26 Jan 2022 02:17:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BC28F80536
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 02:17:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BC28F80536
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="D3aOVep6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643159877; x=1674695877;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=dL1KHyWmbzK6Rny1+Jx1gBeDHgqwGVS/OLQiDKKLSaU=;
 b=D3aOVep6QICpQaEldo5DTyXjMajxzVYwOZoUN0yh2rlptyRDp3sWskt/
 Jcl/PziWqbHeJX8cts2abL3vmL+482Cu30IfryvjTEKaTyt4wxy1xvCwH
 Isv8V1uoC6mdk31hdZkrOCYLzr7TcKodcfvAPC/DNNSbP1CRV0SQ24Z7I
 o+GbKiRUFSxblHGUGM+wiCuYVcl83dEe4qkXPTJ2lL/bbygwbeGmMfXby
 FayJl2c1JZ4zj+9Go1hs9WqQJ3Mb+i6TFLfO9gevPp4GswxBaCfo9PKeG
 ljtnmbIDz+6FoA6SCtVH+E/rlcHX/yUsz9TDE7GZsOvp6nuES+nxj1EZQ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246236185"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="246236185"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:54 -0800
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="520617508"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:51 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 09/19] soundwire: stream: simplify sdw_alloc_master_rt()
Date: Wed, 26 Jan 2022 09:17:05 +0800
Message-Id: <20220126011715.28204-10-yung-chuan.liao@linux.intel.com>
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

Only do the allocation in that function, and move check for allocation
in the caller. This will it easier to split allocation and
configuration.

No functionality change in this patch.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 5e2d29448aaf..263b76230f8f 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1085,14 +1085,6 @@ static struct sdw_master_runtime
 {
 	struct sdw_master_runtime *m_rt;
 
-	/*
-	 * check if Master is already allocated (as a result of Slave adding
-	 * it first), if so skip allocation and go to configure
-	 */
-	m_rt = sdw_find_master_rt(bus, stream);
-	if (m_rt)
-		goto stream_config;
-
 	m_rt = kzalloc(sizeof(*m_rt), GFP_KERNEL);
 	if (!m_rt)
 		return NULL;
@@ -1104,7 +1096,6 @@ static struct sdw_master_runtime
 
 	list_add_tail(&m_rt->bus_node, &bus->m_rt_list);
 
-stream_config:
 	m_rt->ch_count = stream_config->ch_count;
 	m_rt->bus = bus;
 	m_rt->stream = stream;
@@ -1326,6 +1317,14 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 		goto unlock;
 	}
 
+	/*
+	 * check if Master is already allocated (e.g. as a result of Slave adding
+	 * it first), if so skip allocation and go to configuration
+	 */
+	m_rt = sdw_find_master_rt(bus, stream);
+	if (m_rt)
+		goto skip_alloc_master_rt;
+
 	m_rt = sdw_alloc_master_rt(bus, stream_config, stream);
 	if (!m_rt) {
 		dev_err(bus->dev,
@@ -1335,6 +1334,7 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 		goto unlock;
 	}
 
+skip_alloc_master_rt:
 	ret = sdw_config_stream(bus->dev, stream, stream_config, false);
 	if (ret)
 		goto stream_error;
@@ -1384,6 +1384,14 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 
 	mutex_lock(&slave->bus->bus_lock);
 
+	/*
+	 * check if Master is already allocated, if so skip allocation
+	 * and go to configuration
+	 */
+	m_rt = sdw_find_master_rt(slave->bus, stream);
+	if (m_rt)
+		goto skip_alloc_master_rt;
+
 	/*
 	 * If this API is invoked by Slave first then m_rt is not valid.
 	 * So, allocate m_rt and add Slave to it.
@@ -1397,6 +1405,7 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 		goto error;
 	}
 
+skip_alloc_master_rt:
 	s_rt = sdw_alloc_slave_rt(slave, stream_config);
 	if (!s_rt) {
 		dev_err(&slave->dev,
-- 
2.17.1

