Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEC449C0A6
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 02:20:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72A111F73;
	Wed, 26 Jan 2022 02:20:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72A111F73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643160056;
	bh=xZmGpFkcCtXPjWmVmWhZ85WsZ2zk0Q4pSLwBoWfgeT8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EDMyiTx3Xu0hrStLQJkqsEa8J1zfTsRn8rOUf+XuvtZU00GFc5nnTzaok3IHSCUCN
	 Y0A5wGftkj4GAplkOmzZLFYtas6kVQqmU/jhH4YZjRjlcoEBHDrAsonumXazcE2XiO
	 UntkEOzSQqY8s0S/eDlAB0Bvctql1rm7LVIlI0xA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D650F80535;
	Wed, 26 Jan 2022 02:17:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D29EF8052F; Wed, 26 Jan 2022 02:17:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E79CF80118
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 02:17:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E79CF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="g6L+LInm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643159870; x=1674695870;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=xZmGpFkcCtXPjWmVmWhZ85WsZ2zk0Q4pSLwBoWfgeT8=;
 b=g6L+LInmRVfod9q1Y6hka5wRI4DPINt5R7tfkM5Q+nc5Wuu9vmAyXFMC
 pttg2tjXHApXaCX5vGdUV97hM5h1V0/+XAhTkRPowMVX8t3UZXHYOAQx0
 bHBSzAYUqnM5T3np8hYgbI6hQ5dd9XP5AUYmF5VQZndG4bvahTLPj/MZz
 wj/HP0ETkNqcRIiVKQLUh5Nnr95YJoApd3S6Ox1P3ap1rFvoM9wJ0Xh8P
 m2GM+0Ub87V1JkNXUL1Wn8LAjXgQsL7tJlB59mRxhXxGD9fMUDmZmNfT0
 XmHyM7BB6ynEvw+lZbQw99rtiXfR2RHIYJIsbVf8AXG83njFXIBe4NT0t Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246236165"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="246236165"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:47 -0800
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="520617471"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:45 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 07/19] soundwire: stream: add 'slave' prefix for port range
 checks
Date: Wed, 26 Jan 2022 09:17:03 +0800
Message-Id: <20220126011715.28204-8-yung-chuan.liao@linux.intel.com>
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

We can only check for Slave port ranges, the ports are not defined at
the Master level. Also move the function to the 'slave port' block.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index e3cb55de0d12..c326298a0fe2 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1208,16 +1208,6 @@ static int sdw_config_stream(struct device *dev,
 	return 0;
 }
 
-static int sdw_is_valid_port_range(struct device *dev, int num)
-{
-	if (!SDW_VALID_PORT_RANGE(num)) {
-		dev_err(dev, "SoundWire: Invalid port number :%d\n", num);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static int sdw_master_port_alloc(struct sdw_master_runtime *m_rt,
 				 unsigned int num_ports)
 {
@@ -1269,6 +1259,16 @@ static int sdw_slave_port_alloc(struct sdw_slave *slave,
 	return 0;
 }
 
+static int sdw_slave_port_is_valid_range(struct device *dev, int num)
+{
+	if (!SDW_VALID_PORT_RANGE(num)) {
+		dev_err(dev, "SoundWire: Invalid port number :%d\n", num);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int sdw_slave_port_config(struct sdw_slave *slave,
 				 struct sdw_slave_runtime *s_rt,
 				 struct sdw_port_config *port_config)
@@ -1283,7 +1283,7 @@ static int sdw_slave_port_config(struct sdw_slave *slave,
 		 * TODO: Check valid port range as defined by DisCo/
 		 * slave
 		 */
-		ret = sdw_is_valid_port_range(&slave->dev, port_config[i].num);
+		ret = sdw_slave_port_is_valid_range(&slave->dev, port_config[i].num);
 		if (ret < 0)
 			return ret;
 
-- 
2.17.1

