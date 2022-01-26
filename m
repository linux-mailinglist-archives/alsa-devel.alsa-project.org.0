Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2130949C09B
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 02:19:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9B561F7C;
	Wed, 26 Jan 2022 02:18:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9B561F7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643159966;
	bh=3xf4jfiB2XJp4alN6rFXrArNNBQgEJCYpcp1fFvmcbw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AMb34pywEPYFAp0Bf5uXDHXMuU2eGkkONjOLOJ593TgrSnQsbSVqZJfFdux0lFbFg
	 n0G0xpjIuaGF1D4zQWIJSZTbL3pxs7Zqd3sGBTekYui3ks48nu1Nl28+IQXr7NBVXQ
	 bP8AB+/GBndoM5ikqjvrtjZD/5bGpNmc6TdfNor8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63ACAF8051A;
	Wed, 26 Jan 2022 02:17:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56506F80506; Wed, 26 Jan 2022 02:17:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94BE6F804C3
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 02:17:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94BE6F804C3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nZSOghh7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643159858; x=1674695858;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=3xf4jfiB2XJp4alN6rFXrArNNBQgEJCYpcp1fFvmcbw=;
 b=nZSOghh7xuCx/Nz41y/1+ZnsfdoQqApsCfucU3uKPS87R3LLddyzqHVe
 CkEB6PMXgwnRY7gejHA4R2XIzH3221DQlcXTm8On1UA83UH4vI7IpFt6i
 gJL0ThaCvKfh1AuoD5GVrtZK8F6MaER8MWapOcyT1lTdFYYjV6ABYYrAx
 Bcxnbj7a64E6JhmUkgcxWpQB7ARa004sQ81YLASC69tTLPO/0JIv9OamG
 eVTjUj486xf9H8f9bBnTvHIhAl54cBqxwnGGwCG+blk81UKlGq+XJMhlS
 NwLRg/GG6aMt36dP8k3kk+u0ZnJvTKBWIJcagYYgmv36Ap8g9JDJ/LZYd A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246236116"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="246236116"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:35 -0800
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="520617352"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:32 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 02/19] soundwire: stream: add slave runtime to list earlier
Date: Wed, 26 Jan 2022 09:16:58 +0800
Message-Id: <20220126011715.28204-3-yung-chuan.liao@linux.intel.com>
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

sdw_config_stream() only verifies the compatibility between
information provided by the Slave driver and the stream configuration.

There is no problem if we add the slave runtime to the list earlier.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index a30d0fb4871b..a75d3576bfcf 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1373,21 +1373,12 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 		ret = -ENOMEM;
 		goto stream_error;
 	}
-
-	ret = sdw_config_stream(&slave->dev, stream, stream_config, true);
-	if (ret) {
-		/*
-		 * sdw_release_master_stream will release s_rt in slave_rt_list in
-		 * stream_error case, but s_rt is only added to slave_rt_list
-		 * when sdw_config_stream is successful, so free s_rt explicitly
-		 * when sdw_config_stream is failed.
-		 */
-		kfree(s_rt);
-		goto stream_error;
-	}
-
 	list_add_tail(&s_rt->m_rt_node, &m_rt->slave_rt_list);
 
+	ret = sdw_config_stream(&slave->dev, stream, stream_config, true);
+	if (ret)
+		goto stream_error;
+
 	ret = sdw_slave_port_config(slave, s_rt, port_config, num_ports);
 	if (ret)
 		goto stream_error;
-- 
2.17.1

