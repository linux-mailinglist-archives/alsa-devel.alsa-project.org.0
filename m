Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B48FC49C0A9
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 02:21:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5317B1F7B;
	Wed, 26 Jan 2022 02:20:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5317B1F7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643160109;
	bh=Rck6GQHkEM2Tw3dk9P1Wljy6YtVFUEjagAG7ehSug/0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DUNzPzahRlbUjYhWuc0Y+NADenfOQJQHhlFiNnHRLajxyAyXHwgZZxKlNbM0PxhVy
	 Xtl/hTV4us/SVF8NdlVfc2J5md3FohznLTtq30XwP/UQu+ZKG7Ff6mZziKrqrLzvLM
	 PAkEQtKWOXxX+LFU7B2icAIF+vWH8vUpfSNkKa14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D374DF80551;
	Wed, 26 Jan 2022 02:18:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3F6BF80543; Wed, 26 Jan 2022 02:18:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C2BFF80539
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 02:17:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C2BFF80539
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZhvU7UQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643159878; x=1674695878;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=Rck6GQHkEM2Tw3dk9P1Wljy6YtVFUEjagAG7ehSug/0=;
 b=ZhvU7UQ73D1pSG3xSO8Ob/ZuBVvYIM7IOj4T7hiDEDRVvcPloc3Y3iQk
 jl+C/wQ/5KpYTKqtX4TJ0WYHokxkljAnCw47i6E0hUfbIL3Fqc1c+kVvc
 SFwbeZ1xY70eeVU0fugCACJ//tnuXr/4o0qtNgutrYOtW3ewGhRXFPguf
 wvlhqbkYw30qUZTwoeYDlzdCL6lLsSMeqEEUwtVZF2Y3YaelontioQ4J7
 ncRsijZx/6vSLxbujlMMjxRjxaw666IFh5sCg7MAXyfesw0jIi2wBcJWI
 iUgq95EbsCJcU+U193DOt262P0K4lYOgPqaVcyR/IrM3NwBQmAffvQHip w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246236192"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; 
 d="scan'208,217";a="246236192"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; 
 d="scan'208,217";a="520617525"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:54 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 10/19] soundwire: stream: split sdw_alloc_master_rt() in alloc
 and config
Date: Wed, 26 Jan 2022 09:17:06 +0800
Message-Id: <20220126011715.28204-11-yung-chuan.liao@linux.intel.com>
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
 drivers/soundwire/stream.c | 51 +++++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 17 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 263b76230f8f..e38c9208c77b 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1055,7 +1055,7 @@ struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name)
 EXPORT_SYMBOL(sdw_alloc_stream);
 
 static struct sdw_master_runtime
-*sdw_find_master_rt(struct sdw_bus *bus,
+*sdw_master_rt_find(struct sdw_bus *bus,
 		    struct sdw_stream_runtime *stream)
 {
 	struct sdw_master_runtime *m_rt;
@@ -1070,17 +1070,15 @@ static struct sdw_master_runtime
 }
 
 /**
- * sdw_alloc_master_rt() - Allocates and initialize Master runtime handle
+ * sdw_master_rt_alloc() - Allocates a Master runtime handle
  *
  * @bus: SDW bus instance
- * @stream_config: Stream configuration
  * @stream: Stream runtime handle.
  *
  * This function is to be called with bus_lock held.
  */
 static struct sdw_master_runtime
-*sdw_alloc_master_rt(struct sdw_bus *bus,
-		     struct sdw_stream_config *stream_config,
+*sdw_master_rt_alloc(struct sdw_bus *bus,
 		     struct sdw_stream_runtime *stream)
 {
 	struct sdw_master_runtime *m_rt;
@@ -1096,14 +1094,30 @@ static struct sdw_master_runtime
 
 	list_add_tail(&m_rt->bus_node, &bus->m_rt_list);
 
-	m_rt->ch_count = stream_config->ch_count;
 	m_rt->bus = bus;
 	m_rt->stream = stream;
-	m_rt->direction = stream_config->direction;
 
 	return m_rt;
 }
 
+/**
+ * sdw_master_rt_config() - Configure Master runtime handle
+ *
+ * @m_rt: Master runtime handle
+ * @stream_config: Stream configuration
+ *
+ * This function is to be called with bus_lock held.
+ */
+
+static int sdw_master_rt_config(struct sdw_master_runtime *m_rt,
+				struct sdw_stream_config *stream_config)
+{
+	m_rt->ch_count = stream_config->ch_count;
+	m_rt->direction = stream_config->direction;
+
+	return 0;
+}
+
 /**
  * sdw_alloc_slave_rt() - Allocate and initialize Slave runtime handle.
  *
@@ -1321,19 +1335,21 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 	 * check if Master is already allocated (e.g. as a result of Slave adding
 	 * it first), if so skip allocation and go to configuration
 	 */
-	m_rt = sdw_find_master_rt(bus, stream);
+	m_rt = sdw_master_rt_find(bus, stream);
 	if (m_rt)
 		goto skip_alloc_master_rt;
 
-	m_rt = sdw_alloc_master_rt(bus, stream_config, stream);
+	m_rt = sdw_master_rt_alloc(bus, stream);
 	if (!m_rt) {
-		dev_err(bus->dev,
-			"Master runtime config failed for stream:%s\n",
-			stream->name);
+		dev_err(bus->dev, "Master runtime alloc failed for stream:%s\n", stream->name);
 		ret = -ENOMEM;
 		goto unlock;
 	}
 
+	ret = sdw_master_rt_config(m_rt, stream_config);
+	if (ret < 0)
+		goto unlock;
+
 skip_alloc_master_rt:
 	ret = sdw_config_stream(bus->dev, stream, stream_config, false);
 	if (ret)
@@ -1388,7 +1404,7 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 	 * check if Master is already allocated, if so skip allocation
 	 * and go to configuration
 	 */
-	m_rt = sdw_find_master_rt(slave->bus, stream);
+	m_rt = sdw_master_rt_find(slave->bus, stream);
 	if (m_rt)
 		goto skip_alloc_master_rt;
 
@@ -1396,14 +1412,15 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 	 * If this API is invoked by Slave first then m_rt is not valid.
 	 * So, allocate m_rt and add Slave to it.
 	 */
-	m_rt = sdw_alloc_master_rt(slave->bus, stream_config, stream);
+	m_rt = sdw_master_rt_alloc(slave->bus, stream);
 	if (!m_rt) {
-		dev_err(&slave->dev,
-			"alloc master runtime failed for stream:%s\n",
-			stream->name);
+		dev_err(&slave->dev, "Master runtime alloc failed for stream:%s\n", stream->name);
 		ret = -ENOMEM;
 		goto error;
 	}
+	ret =  sdw_master_rt_config(m_rt, stream_config);
+	if (ret < 0)
+		goto stream_error;
 
 skip_alloc_master_rt:
 	s_rt = sdw_alloc_slave_rt(slave, stream_config);
-- 
2.17.1

