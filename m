Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC91549C0A4
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 02:20:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FA9C1F9D;
	Wed, 26 Jan 2022 02:19:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FA9C1F9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643160041;
	bh=jHgJPNa8SPiX6zp1DNPAMTWl+vgD5iiQX0Bg4hGORN0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hLtDW2Rgl8HkZecJJJwtayneMdYYe3ViK+PYgXIWyidSYrHUZFG1MT9BDeLz+gJVT
	 15iZbu7wIwlD45x2wcNMs2WgQfdHe8TSxgExBZDnsqZcPZMWiztKfViAeR7ZkFpqnO
	 mzR8eMmzU9WYNxgsIajnfd/F7H68T/AWEZ87BcSA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47F7DF80118;
	Wed, 26 Jan 2022 02:17:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDD52F80169; Wed, 26 Jan 2022 02:17:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54B4BF80515
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 02:17:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54B4BF80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jptc1egA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643159868; x=1674695868;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=jHgJPNa8SPiX6zp1DNPAMTWl+vgD5iiQX0Bg4hGORN0=;
 b=jptc1egAne4vxkGmzk9oPf9yoeq5Tbz+q+K3iTy7X2eQ3qcLzgIInapG
 TipPMfCVhMGID2OXq7QTe4lnnS3b4tKg1lQb/igAkToCgQrDlb70pJplR
 5Z0g8qWGAXnSp16FhBPGmJjRl8FN1H/0twoDvvtFrj9f+uTJgi4il78bj
 Iy0T0dN8wYvTfYlh76p9wnpNRNEbDB1Q1sMP/wO+DMK/KKe5H4cMP6P1h
 2yU/NEiO3kaFxWeCEtiCAkOS1AE+3H1W0iZ5oata/6weayUSBpEwtMi1u
 8GoO3YQ10iyb2B0Uol/8MQ4lFWZPj9+ZQLR0QfbskGJnL1mV+vAGS4wMy w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246236155"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="246236155"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="520617449"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:42 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 06/19] soundwire: stream: split alloc and config in two
 functions
Date: Wed, 26 Jan 2022 09:17:02 +0800
Message-Id: <20220126011715.28204-7-yung-chuan.liao@linux.intel.com>
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

Continue the split with two functions for master and slave, and remove
unused arguments.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 49 ++++++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index b97c59e71bdb..e3cb55de0d12 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1218,13 +1218,10 @@ static int sdw_is_valid_port_range(struct device *dev, int num)
 	return 0;
 }
 
-static int sdw_master_port_config(struct sdw_bus *bus,
-				  struct sdw_master_runtime *m_rt,
-				  struct sdw_port_config *port_config,
-				  unsigned int num_ports)
+static int sdw_master_port_alloc(struct sdw_master_runtime *m_rt,
+				 unsigned int num_ports)
 {
 	struct sdw_port_runtime *p_rt;
-	int ret;
 	int i;
 
 	/* Iterate for number of ports to perform initialization */
@@ -1234,6 +1231,16 @@ static int sdw_master_port_config(struct sdw_bus *bus,
 			return -ENOMEM;
 	}
 
+	return 0;
+}
+
+static int sdw_master_port_config(struct sdw_master_runtime *m_rt,
+				  struct sdw_port_config *port_config)
+{
+	struct sdw_port_runtime *p_rt;
+	int ret;
+	int i;
+
 	i = 0;
 	list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
 		ret = sdw_port_config(p_rt, port_config, i);
@@ -1245,13 +1252,12 @@ static int sdw_master_port_config(struct sdw_bus *bus,
 	return 0;
 }
 
-static int sdw_slave_port_config(struct sdw_slave *slave,
-				 struct sdw_slave_runtime *s_rt,
-				 struct sdw_port_config *port_config,
-				 unsigned int num_config)
+static int sdw_slave_port_alloc(struct sdw_slave *slave,
+				struct sdw_slave_runtime *s_rt,
+				unsigned int num_config)
 {
 	struct sdw_port_runtime *p_rt;
-	int i, ret;
+	int i;
 
 	/* Iterate for number of ports to perform initialization */
 	for (i = 0; i < num_config; i++) {
@@ -1260,6 +1266,17 @@ static int sdw_slave_port_config(struct sdw_slave *slave,
 			return -ENOMEM;
 	}
 
+	return 0;
+}
+
+static int sdw_slave_port_config(struct sdw_slave *slave,
+				 struct sdw_slave_runtime *s_rt,
+				 struct sdw_port_config *port_config)
+{
+	struct sdw_port_runtime *p_rt;
+	int ret;
+	int i;
+
 	i = 0;
 	list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
 		/*
@@ -1324,7 +1341,11 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 	if (ret)
 		goto stream_error;
 
-	ret = sdw_master_port_config(bus, m_rt, port_config, num_ports);
+	ret = sdw_master_port_alloc(m_rt, num_ports);
+	if (ret)
+		goto stream_error;
+
+	ret = sdw_master_port_config(m_rt, port_config);
 	if (ret)
 		goto stream_error;
 
@@ -1392,7 +1413,11 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 	if (ret)
 		goto stream_error;
 
-	ret = sdw_slave_port_config(slave, s_rt, port_config, num_ports);
+	ret = sdw_slave_port_alloc(slave, s_rt, num_ports);
+	if (ret)
+		goto stream_error;
+
+	ret = sdw_slave_port_config(slave, s_rt, port_config);
 	if (ret)
 		goto stream_error;
 
-- 
2.17.1

