Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE2149C0B9
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 02:23:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B81B1FF8;
	Wed, 26 Jan 2022 02:22:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B81B1FF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643160217;
	bh=3uhG1F2z4hDlx2mEu52GZg62Yh8eL4mwJdp5JqpLoI8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tsVbzmUpuXj2riOrgO3inJuV4tbTNuNe4D5eymHFQlwkRrfBHc5FvTGheP/0ODI1n
	 d2RYE4d5j181zllhJXcKr759Oe6xw31MW+rufn7Tt2Kl06q91j5GXrVT6xqAjzdUBA
	 bttdfiD+ju7WQILwKpT7khiUqSBEa1gmuoMOGDBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 894F1F805AE;
	Wed, 26 Jan 2022 02:18:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC55DF805A9; Wed, 26 Jan 2022 02:18:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C92C8F80579
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 02:18:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C92C8F80579
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="C/X0ihHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643159897; x=1674695897;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=3uhG1F2z4hDlx2mEu52GZg62Yh8eL4mwJdp5JqpLoI8=;
 b=C/X0ihHEKXGkvYqivvB4F3Zo1SiceSe70XewrsMhUHlGVWmzs0zI5Ynh
 x0aJubBaxItJx3/+9foadkLLuY1fLNACmTumQVIJQnHi1kF9+uGwlU9/x
 fPlZJDw5afo4U4MwrYKHqckk59Z4g173gl0DocQ6rmvvKP2LVMGIFKhke
 PMPBxH2LCKZgiu68Pr7keTLSqQasf4YV7dtBTmzRB3yQ0sYIq+EQUw6ME
 o62S9nU7LSAC2zwH1+8MzoXTb6ureOzPXhJmWkDrE8RqCae3iNoDjtJWV
 1mfajxIPpzbHUMt4KGxQUiNjQ7CELEVL8yXeBLqT8djvQWaTi7JjeY+2A g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246236234"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="246236234"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:18:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="520617648"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:18:09 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 16/19] soundwire: stream: separate alloc and config within
 sdw_stream_add_xxx()
Date: Wed, 26 Jan 2022 09:17:12 +0800
Message-Id: <20220126011715.28204-17-yung-chuan.liao@linux.intel.com>
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

Separate alloc and config parts so that follow-up patches can allow
for multiple calls to sdw_stream_add_slave/master. This is a feature
from the ALSA/ASoC frameworks which is not supported today.

This is an invasive patch which modifies the error handling flow, with
cleanups only done when an allocation fails. Configuration failures
only return an error code.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 81 ++++++++++++++++++++++----------------
 1 file changed, 48 insertions(+), 33 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 8a76d6605f93..03cfac0129af 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1811,6 +1811,7 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 			  struct sdw_stream_runtime *stream)
 {
 	struct sdw_master_runtime *m_rt;
+	bool alloc_master_rt = true;
 	int ret;
 
 	mutex_lock(&bus->bus_lock);
@@ -1832,8 +1833,10 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 	 * it first), if so skip allocation and go to configuration
 	 */
 	m_rt = sdw_master_rt_find(bus, stream);
-	if (m_rt)
+	if (m_rt) {
+		alloc_master_rt = false;
 		goto skip_alloc_master_rt;
+	}
 
 	m_rt = sdw_master_rt_alloc(bus, stream);
 	if (!m_rt) {
@@ -1841,30 +1844,32 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 		ret = -ENOMEM;
 		goto unlock;
 	}
+skip_alloc_master_rt:
+
+	ret = sdw_master_port_alloc(m_rt, num_ports);
+	if (ret)
+		goto alloc_error;
+
+	stream->m_rt_count++;
 
 	ret = sdw_master_rt_config(m_rt, stream_config);
 	if (ret < 0)
 		goto unlock;
 
-skip_alloc_master_rt:
 	ret = sdw_config_stream(bus->dev, stream, stream_config, false);
 	if (ret)
-		goto stream_error;
-
-	ret = sdw_master_port_alloc(m_rt, num_ports);
-	if (ret)
-		goto stream_error;
+		goto unlock;
 
 	ret = sdw_master_port_config(m_rt, port_config);
-	if (ret)
-		goto stream_error;
-
-	stream->m_rt_count++;
 
 	goto unlock;
 
-stream_error:
-	sdw_master_rt_free(m_rt, stream);
+alloc_error:
+	/*
+	 * we only cleanup what was allocated in this routine
+	 */
+	if (alloc_master_rt)
+		sdw_master_rt_free(m_rt, stream);
 unlock:
 	mutex_unlock(&bus->bus_lock);
 	return ret;
@@ -1926,6 +1931,9 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 {
 	struct sdw_slave_runtime *s_rt;
 	struct sdw_master_runtime *m_rt;
+	bool alloc_master_rt = true;
+	bool alloc_slave_rt = true;
+
 	int ret;
 
 	mutex_lock(&slave->bus->bus_lock);
@@ -1935,8 +1943,10 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 	 * and go to configuration
 	 */
 	m_rt = sdw_master_rt_find(slave->bus, stream);
-	if (m_rt)
+	if (m_rt) {
+		alloc_master_rt = false;
 		goto skip_alloc_master_rt;
+	}
 
 	/*
 	 * If this API is invoked by Slave first then m_rt is not valid.
@@ -1946,35 +1956,37 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 	if (!m_rt) {
 		dev_err(&slave->dev, "Master runtime alloc failed for stream:%s\n", stream->name);
 		ret = -ENOMEM;
-		goto error;
+		goto unlock;
 	}
-	ret =  sdw_master_rt_config(m_rt, stream_config);
-	if (ret < 0)
-		goto stream_error;
 
 skip_alloc_master_rt:
 	s_rt = sdw_slave_rt_alloc(slave, m_rt);
 	if (!s_rt) {
 		dev_err(&slave->dev, "Slave runtime alloc failed for stream:%s\n", stream->name);
+		alloc_slave_rt = false;
 		ret = -ENOMEM;
-		goto stream_error;
+		goto alloc_error;
 	}
 
+	ret = sdw_slave_port_alloc(slave, s_rt, num_ports);
+	if (ret)
+		goto alloc_error;
+
+	ret =  sdw_master_rt_config(m_rt, stream_config);
+	if (ret)
+		goto unlock;
+
 	ret = sdw_slave_rt_config(s_rt, stream_config);
 	if (ret)
-		goto stream_error;
+		goto unlock;
 
 	ret = sdw_config_stream(&slave->dev, stream, stream_config, true);
 	if (ret)
-		goto stream_error;
-
-	ret = sdw_slave_port_alloc(slave, s_rt, num_ports);
-	if (ret)
-		goto stream_error;
+		goto unlock;
 
 	ret = sdw_slave_port_config(slave, s_rt, port_config);
 	if (ret)
-		goto stream_error;
+		goto unlock;
 
 	/*
 	 * Change stream state to CONFIGURED on first Slave add.
@@ -1983,15 +1995,19 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 	 * change stream state to CONFIGURED.
 	 */
 	stream->state = SDW_STREAM_CONFIGURED;
-	goto error;
+	goto unlock;
 
-stream_error:
+alloc_error:
 	/*
-	 * we hit error so cleanup the stream, release all Slave(s) and
-	 * Master runtime
+	 * we only cleanup what was allocated in this routine. The 'else if'
+	 * is intentional, the 'master_rt_free' will call sdw_slave_rt_free()
+	 * internally.
 	 */
-	sdw_master_rt_free(m_rt, stream);
-error:
+	if (alloc_master_rt)
+		sdw_master_rt_free(m_rt, stream);
+	else if (alloc_slave_rt)
+		sdw_slave_rt_free(slave, stream);
+unlock:
 	mutex_unlock(&slave->bus->bus_lock);
 	return ret;
 }
@@ -2018,4 +2034,3 @@ int sdw_stream_remove_slave(struct sdw_slave *slave,
 	return 0;
 }
 EXPORT_SYMBOL(sdw_stream_remove_slave);
-
-- 
2.17.1

