Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC2949C0BC
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 02:24:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EF96200B;
	Wed, 26 Jan 2022 02:23:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EF96200B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643160249;
	bh=tEU3JXFvTcLnvhlyRCwxkBFoGoHR5/y8RfltTRrDs3Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dEeVCQvSXuJ0SWErLWaCCOAwluaNKZntCWDsgfdi5BNieuu8722SkIH367gB5Vnkj
	 h//I69Cns8q7w/RBP2zZ641UnxzsR2Jb/yD7+trT4kVpKMV+RYqKMxb0BeRsPgLmuQ
	 h1hqiD69ArXM6mnMyK68YLMlbXW3G/YIdqJwgwhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0C88F80519;
	Wed, 26 Jan 2022 02:18:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B175F804FE; Wed, 26 Jan 2022 02:18:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1234F8050F
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 02:18:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1234F8050F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Hhfb2st9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643159915; x=1674695915;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=tEU3JXFvTcLnvhlyRCwxkBFoGoHR5/y8RfltTRrDs3Q=;
 b=Hhfb2st9o68B2qKXf7rrhNQFHiCM+68/i0flA9LifYGFa/zHNvLF+VYE
 QrheDTxiAfkhGgx3prSLvVqndzLhi/gG4fQMcY8UYD05NQogS2xsRUKnX
 LIaSElyxFLb0zdHshdNT2J+LGjqoAMp39BNGrUmfK5KWpmoonZPg1IRrd
 32viiF6TZtyAYB+GctAsRfnnCPwTNP+InlwzUQWTt+jQPcHcvv47mmiBv
 jW5RQfmL4ZGKJDl3gJAVHuFYFnjEJA7YdJLIClpM8f9FZw1dzFIdQvBiz
 PTKG5tiOf4xI3BFHNAARpIro9y1lsUilg+9zr0l693mxVOgajAXIzoWn2 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246236251"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="246236251"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:18:16 -0800
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="520617661"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:18:14 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 18/19] soundwire: stream: sdw_stream_add_ functions can be
 called multiple times
Date: Wed, 26 Jan 2022 09:17:14 +0800
Message-Id: <20220126011715.28204-19-yung-chuan.liao@linux.intel.com>
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

The sdw_stream_add_slave/master() functions are called from the
.hw_params stage. We need to make sure the functions can be called
multiple times.

In this version, we assume that only 'audio' parameters provide in the
hw_params() can change. If the number of ports could change
dynamically depending on the stream configuration (number of channels,
etc), we would need to free-up all the stream resources and reallocate
them.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index a52a9ab0eea1..ccf3c99dd579 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -898,6 +898,11 @@ static void sdw_port_free(struct sdw_port_runtime *p_rt)
 	kfree(p_rt);
 }
 
+static bool sdw_slave_port_allocated(struct sdw_slave_runtime *s_rt)
+{
+	return !list_empty(&s_rt->port_list);
+}
+
 static void sdw_slave_port_free(struct sdw_slave *slave,
 				struct sdw_stream_runtime *stream)
 {
@@ -972,6 +977,11 @@ static int sdw_slave_port_config(struct sdw_slave *slave,
 	return 0;
 }
 
+static bool sdw_master_port_allocated(struct sdw_master_runtime *m_rt)
+{
+	return !list_empty(&m_rt->port_list);
+}
+
 static void sdw_master_port_free(struct sdw_master_runtime *m_rt)
 {
 	struct sdw_port_runtime *p_rt, *_p_rt;
@@ -1856,12 +1866,17 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 	}
 skip_alloc_master_rt:
 
+	if (sdw_master_port_allocated(m_rt))
+		goto skip_alloc_master_port;
+
 	ret = sdw_master_port_alloc(m_rt, num_ports);
 	if (ret)
 		goto alloc_error;
 
 	stream->m_rt_count++;
 
+skip_alloc_master_port:
+
 	ret = sdw_master_rt_config(m_rt, stream_config);
 	if (ret < 0)
 		goto unlock;
@@ -1970,6 +1985,10 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 	}
 
 skip_alloc_master_rt:
+	s_rt = sdw_slave_rt_find(slave, stream);
+	if (s_rt)
+		goto skip_alloc_slave_rt;
+
 	s_rt = sdw_slave_rt_alloc(slave, m_rt);
 	if (!s_rt) {
 		dev_err(&slave->dev, "Slave runtime alloc failed for stream:%s\n", stream->name);
@@ -1978,10 +1997,15 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 		goto alloc_error;
 	}
 
+skip_alloc_slave_rt:
+	if (sdw_slave_port_allocated(s_rt))
+		goto skip_port_alloc;
+
 	ret = sdw_slave_port_alloc(slave, s_rt, num_ports);
 	if (ret)
 		goto alloc_error;
 
+skip_port_alloc:
 	ret =  sdw_master_rt_config(m_rt, stream_config);
 	if (ret)
 		goto unlock;
-- 
2.17.1

