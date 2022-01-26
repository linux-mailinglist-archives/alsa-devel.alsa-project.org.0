Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F8B49C0A7
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 02:21:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FA691FB6;
	Wed, 26 Jan 2022 02:20:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FA691FB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643160076;
	bh=JOSj0p7UUWlQeCOb35AUBPW7MKDklglz0v2cDMR9q8s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hyxk5OYUjAShu5Qo2/+Kzu5Yw9caw1TPdL5Qf4TX/nkFzFExRc56QPJGcCDhJcoBD
	 15ebCUkr5PrfAZg7NiKA5Z54hslurVGxQpyXGWiL6v0+w8TxC0irowom00Ngdr9HLX
	 aVp+JLqGaZurmCfMxLev9CBJ2l7XMS79tNIv3J5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65FB2F8053D;
	Wed, 26 Jan 2022 02:17:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41BB0F80538; Wed, 26 Jan 2022 02:17:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0C06F80526
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 02:17:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0C06F80526
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="U0o4ie+R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643159875; x=1674695875;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=JOSj0p7UUWlQeCOb35AUBPW7MKDklglz0v2cDMR9q8s=;
 b=U0o4ie+RZ4K00KM8bc0ZIcNfgAfwu3ca+VNnaTciQI8Yn1ndR46oNtmm
 aNDN9XrTydOcoW8Ut73j8eIPTXTXYyMGfozZIJdEDv46KSmwo7LLgPLxl
 FGVK8Xf0DMcCLmOPwAsn1ng3O4+tcEL4zXZDJTqaDD9sekCnWJbYfSiG7
 K/L8YTRWwShA7/4F0K3nhVckQuqXYT+yl202AiAcBMilsoGeug2zbDRMI
 GOI69xlFLRtgjwlIpw0TzWvGCJUQdvMUONYz5Ykt1s8C6knhCYsmydufX
 zUTxMLFxQgYrdDCKhaWnXvmnENdKEG6i9waYjcqKT+fptGFREJaCjjnNy Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246236176"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="246236176"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:51 -0800
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="520617494"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:47 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 08/19] soundwire: stream: group sdw_port and
 sdw_master/slave_port functions
Date: Wed, 26 Jan 2022 09:17:04 +0800
Message-Id: <20220126011715.28204-9-yung-chuan.liao@linux.intel.com>
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

re-group all the helpers in one location with a code move. For
consistency the 'slave' helpers are placed before the 'master'
helpers.

Also remove unused arguments and rename the 'release' function to
'free' for consistency.

No functional change in this patch.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 242 ++++++++++++++++++-------------------
 1 file changed, 120 insertions(+), 122 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index c326298a0fe2..5e2d29448aaf 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -898,6 +898,123 @@ static void sdw_port_free(struct sdw_port_runtime *p_rt)
 	kfree(p_rt);
 }
 
+static void sdw_slave_port_free(struct sdw_slave *slave,
+				struct sdw_stream_runtime *stream)
+{
+	struct sdw_port_runtime *p_rt, *_p_rt;
+	struct sdw_master_runtime *m_rt;
+	struct sdw_slave_runtime *s_rt;
+
+	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
+		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
+			if (s_rt->slave != slave)
+				continue;
+
+			list_for_each_entry_safe(p_rt, _p_rt,
+						 &s_rt->port_list, port_node) {
+				sdw_port_free(p_rt);
+			}
+		}
+	}
+}
+
+static int sdw_slave_port_alloc(struct sdw_slave *slave,
+				struct sdw_slave_runtime *s_rt,
+				unsigned int num_config)
+{
+	struct sdw_port_runtime *p_rt;
+	int i;
+
+	/* Iterate for number of ports to perform initialization */
+	for (i = 0; i < num_config; i++) {
+		p_rt = sdw_port_alloc(&s_rt->port_list);
+		if (!p_rt)
+			return -ENOMEM;
+	}
+
+	return 0;
+}
+
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
+static int sdw_slave_port_config(struct sdw_slave *slave,
+				 struct sdw_slave_runtime *s_rt,
+				 struct sdw_port_config *port_config)
+{
+	struct sdw_port_runtime *p_rt;
+	int ret;
+	int i;
+
+	i = 0;
+	list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
+		/*
+		 * TODO: Check valid port range as defined by DisCo/
+		 * slave
+		 */
+		ret = sdw_slave_port_is_valid_range(&slave->dev, port_config[i].num);
+		if (ret < 0)
+			return ret;
+
+		ret = sdw_port_config(p_rt, port_config, i);
+		if (ret < 0)
+			return ret;
+		i++;
+	}
+
+	return 0;
+}
+
+static void sdw_master_port_free(struct sdw_master_runtime *m_rt)
+{
+	struct sdw_port_runtime *p_rt, *_p_rt;
+
+	list_for_each_entry_safe(p_rt, _p_rt, &m_rt->port_list, port_node) {
+		sdw_port_free(p_rt);
+	}
+}
+
+static int sdw_master_port_alloc(struct sdw_master_runtime *m_rt,
+				 unsigned int num_ports)
+{
+	struct sdw_port_runtime *p_rt;
+	int i;
+
+	/* Iterate for number of ports to perform initialization */
+	for (i = 0; i < num_ports; i++) {
+		p_rt = sdw_port_alloc(&m_rt->port_list);
+		if (!p_rt)
+			return -ENOMEM;
+	}
+
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
+	i = 0;
+	list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
+		ret = sdw_port_config(p_rt, port_config, i);
+		if (ret < 0)
+			return ret;
+		i++;
+	}
+
+	return 0;
+}
+
 /**
  * sdw_release_stream() - Free the assigned stream runtime
  *
@@ -1022,37 +1139,6 @@ static struct sdw_slave_runtime
 	return s_rt;
 }
 
-static void sdw_master_port_release(struct sdw_bus *bus,
-				    struct sdw_master_runtime *m_rt)
-{
-	struct sdw_port_runtime *p_rt, *_p_rt;
-
-	list_for_each_entry_safe(p_rt, _p_rt, &m_rt->port_list, port_node) {
-		sdw_port_free(p_rt);
-	}
-}
-
-static void sdw_slave_port_release(struct sdw_bus *bus,
-				   struct sdw_slave *slave,
-				   struct sdw_stream_runtime *stream)
-{
-	struct sdw_port_runtime *p_rt, *_p_rt;
-	struct sdw_master_runtime *m_rt;
-	struct sdw_slave_runtime *s_rt;
-
-	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
-		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
-			if (s_rt->slave != slave)
-				continue;
-
-			list_for_each_entry_safe(p_rt, _p_rt,
-						 &s_rt->port_list, port_node) {
-				sdw_port_free(p_rt);
-			}
-		}
-	}
-}
-
 /**
  * sdw_release_slave_stream() - Free Slave(s) runtime handle
  *
@@ -1097,7 +1183,7 @@ static void sdw_release_master_stream(struct sdw_master_runtime *m_rt,
 	struct sdw_slave_runtime *s_rt, *_s_rt;
 
 	list_for_each_entry_safe(s_rt, _s_rt, &m_rt->slave_rt_list, m_rt_node) {
-		sdw_slave_port_release(s_rt->slave->bus, s_rt->slave, stream);
+		sdw_slave_port_free(s_rt->slave, stream);
 		sdw_release_slave_stream(s_rt->slave, stream);
 	}
 
@@ -1126,7 +1212,7 @@ int sdw_stream_remove_master(struct sdw_bus *bus,
 		if (m_rt->bus != bus)
 			continue;
 
-		sdw_master_port_release(bus, m_rt);
+		sdw_master_port_free(m_rt);
 		sdw_release_master_stream(m_rt, stream);
 		stream->m_rt_count--;
 	}
@@ -1153,7 +1239,7 @@ int sdw_stream_remove_slave(struct sdw_slave *slave,
 {
 	mutex_lock(&slave->bus->bus_lock);
 
-	sdw_slave_port_release(slave->bus, slave, stream);
+	sdw_slave_port_free(slave, stream);
 	sdw_release_slave_stream(slave, stream);
 
 	mutex_unlock(&slave->bus->bus_lock);
@@ -1208,94 +1294,6 @@ static int sdw_config_stream(struct device *dev,
 	return 0;
 }
 
-static int sdw_master_port_alloc(struct sdw_master_runtime *m_rt,
-				 unsigned int num_ports)
-{
-	struct sdw_port_runtime *p_rt;
-	int i;
-
-	/* Iterate for number of ports to perform initialization */
-	for (i = 0; i < num_ports; i++) {
-		p_rt = sdw_port_alloc(&m_rt->port_list);
-		if (!p_rt)
-			return -ENOMEM;
-	}
-
-	return 0;
-}
-
-static int sdw_master_port_config(struct sdw_master_runtime *m_rt,
-				  struct sdw_port_config *port_config)
-{
-	struct sdw_port_runtime *p_rt;
-	int ret;
-	int i;
-
-	i = 0;
-	list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
-		ret = sdw_port_config(p_rt, port_config, i);
-		if (ret < 0)
-			return ret;
-		i++;
-	}
-
-	return 0;
-}
-
-static int sdw_slave_port_alloc(struct sdw_slave *slave,
-				struct sdw_slave_runtime *s_rt,
-				unsigned int num_config)
-{
-	struct sdw_port_runtime *p_rt;
-	int i;
-
-	/* Iterate for number of ports to perform initialization */
-	for (i = 0; i < num_config; i++) {
-		p_rt = sdw_port_alloc(&s_rt->port_list);
-		if (!p_rt)
-			return -ENOMEM;
-	}
-
-	return 0;
-}
-
-static int sdw_slave_port_is_valid_range(struct device *dev, int num)
-{
-	if (!SDW_VALID_PORT_RANGE(num)) {
-		dev_err(dev, "SoundWire: Invalid port number :%d\n", num);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int sdw_slave_port_config(struct sdw_slave *slave,
-				 struct sdw_slave_runtime *s_rt,
-				 struct sdw_port_config *port_config)
-{
-	struct sdw_port_runtime *p_rt;
-	int ret;
-	int i;
-
-	i = 0;
-	list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
-		/*
-		 * TODO: Check valid port range as defined by DisCo/
-		 * slave
-		 */
-		ret = sdw_slave_port_is_valid_range(&slave->dev, port_config[i].num);
-		if (ret < 0)
-			return ret;
-
-		ret = sdw_port_config(p_rt, port_config, i);
-		if (ret < 0)
-			return ret;
-		i++;
-	}
-
-	return 0;
-}
-
 /**
  * sdw_stream_add_master() - Allocate and add master runtime to a stream
  *
-- 
2.17.1

