Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B065010AD4
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 18:14:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ECE81718;
	Wed,  1 May 2019 18:13:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ECE81718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556727247;
	bh=sGm9PXlcWva9VsiLcIIgLt606uiGDQ0LZikc2XSf/6E=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bTw2XGl5Hmi2ULYNUIatk6+9H9aDi0Cja57O3xE1z78mvh5rbjS3BKoKvG3gixtXT
	 kRYReRsd1yysQlaJUDSFjg2iiETWe5es7dP0Px4SRS7v+p+xvv5okf8152xvWuEbw3
	 arYskZVn8UULLIRGSdB+k3LgSd37fHTf9j5yHZhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBBF3F8978D;
	Wed,  1 May 2019 17:59:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7DC3F89736; Wed,  1 May 2019 17:58:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B662CF89736
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 17:58:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B662CF89736
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 May 2019 08:58:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,418,1549958400"; d="scan'208";a="296115721"
Received: from modiarvi-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.134.211])
 by orsmga004.jf.intel.com with ESMTP; 01 May 2019 08:58:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  1 May 2019 10:57:35 -0500
Message-Id: <20190501155745.21806-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
References: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH v4 12/22] soundwire: stream: fix alignment
	issues
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Use Linux style

Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/stream.c | 161 +++++++++++++++++++------------------
 1 file changed, 84 insertions(+), 77 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 63b162feecfc..ab64c2c4c33f 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -53,9 +53,9 @@ static int sdw_find_row_index(int row)
 	return 0;
 }
 static int _sdw_program_slave_port_params(struct sdw_bus *bus,
-				struct sdw_slave *slave,
-				struct sdw_transport_params *t_params,
-				enum sdw_dpn_type type)
+					  struct sdw_slave *slave,
+					  struct sdw_transport_params *t_params,
+					  enum sdw_dpn_type type)
 {
 	u32 addr1, addr2, addr3, addr4;
 	int ret;
@@ -119,8 +119,8 @@ static int _sdw_program_slave_port_params(struct sdw_bus *bus,
 }
 
 static int sdw_program_slave_port_params(struct sdw_bus *bus,
-			struct sdw_slave_runtime *s_rt,
-			struct sdw_port_runtime *p_rt)
+					 struct sdw_slave_runtime *s_rt,
+					 struct sdw_port_runtime *p_rt)
 {
 	struct sdw_transport_params *t_params = &p_rt->transport_params;
 	struct sdw_port_params *p_params = &p_rt->port_params;
@@ -131,8 +131,8 @@ static int sdw_program_slave_port_params(struct sdw_bus *bus,
 	u8 wbuf;
 
 	dpn_prop = sdw_get_slave_dpn_prop(s_rt->slave,
-					s_rt->direction,
-					t_params->port_num);
+					  s_rt->direction,
+					  t_params->port_num);
 	if (!dpn_prop)
 		return -EINVAL;
 
@@ -216,7 +216,7 @@ static int sdw_program_slave_port_params(struct sdw_bus *bus,
 
 	if (dpn_prop->type != SDW_DPN_SIMPLE) {
 		ret = _sdw_program_slave_port_params(bus, s_rt->slave,
-						t_params, dpn_prop->type);
+						     t_params, dpn_prop->type);
 		if (ret < 0)
 			dev_err(&s_rt->slave->dev,
 				"Transport reg write failed for port: %d",
@@ -227,7 +227,7 @@ static int sdw_program_slave_port_params(struct sdw_bus *bus,
 }
 
 static int sdw_program_master_port_params(struct sdw_bus *bus,
-		struct sdw_port_runtime *p_rt)
+					  struct sdw_port_runtime *p_rt)
 {
 	int ret;
 
@@ -244,8 +244,8 @@ static int sdw_program_master_port_params(struct sdw_bus *bus,
 		return ret;
 
 	return bus->port_ops->dpn_set_port_params(bus,
-				&p_rt->port_params,
-				bus->params.next_bank);
+						  &p_rt->port_params,
+						  bus->params.next_bank);
 }
 
 /**
@@ -292,8 +292,9 @@ static int sdw_program_port_params(struct sdw_master_runtime *m_rt)
  * actual enable/disable is done with a bank switch
  */
 static int sdw_enable_disable_slave_ports(struct sdw_bus *bus,
-				struct sdw_slave_runtime *s_rt,
-				struct sdw_port_runtime *p_rt, bool en)
+					  struct sdw_slave_runtime *s_rt,
+					  struct sdw_port_runtime *p_rt,
+					  bool en)
 {
 	struct sdw_transport_params *t_params = &p_rt->transport_params;
 	u32 addr;
@@ -322,7 +323,8 @@ static int sdw_enable_disable_slave_ports(struct sdw_bus *bus,
 }
 
 static int sdw_enable_disable_master_ports(struct sdw_master_runtime *m_rt,
-			struct sdw_port_runtime *p_rt, bool en)
+					   struct sdw_port_runtime *p_rt,
+					   bool en)
 {
 	struct sdw_transport_params *t_params = &p_rt->transport_params;
 	struct sdw_bus *bus = m_rt->bus;
@@ -336,7 +338,8 @@ static int sdw_enable_disable_master_ports(struct sdw_master_runtime *m_rt,
 	/* Perform Master port channel(s) enable/disable */
 	if (bus->port_ops->dpn_port_enable_ch) {
 		ret = bus->port_ops->dpn_port_enable_ch(bus,
-				&enable_ch, bus->params.next_bank);
+							&enable_ch,
+							bus->params.next_bank);
 		if (ret < 0) {
 			dev_err(bus->dev,
 				"Master chn_en write failed:%d port:%d",
@@ -370,7 +373,7 @@ static int sdw_enable_disable_ports(struct sdw_master_runtime *m_rt, bool en)
 	list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
 		list_for_each_entry(s_port, &s_rt->port_list, port_node) {
 			ret = sdw_enable_disable_slave_ports(m_rt->bus, s_rt,
-							s_port, en);
+							     s_port, en);
 			if (ret < 0)
 				return ret;
 		}
@@ -387,7 +390,8 @@ static int sdw_enable_disable_ports(struct sdw_master_runtime *m_rt, bool en)
 }
 
 static int sdw_do_port_prep(struct sdw_slave_runtime *s_rt,
-		struct sdw_prepare_ch prep_ch, enum sdw_port_prep_ops cmd)
+			    struct sdw_prepare_ch prep_ch,
+			    enum sdw_port_prep_ops cmd)
 {
 	const struct sdw_slave_ops *ops = s_rt->slave->ops;
 	int ret;
@@ -405,8 +409,9 @@ static int sdw_do_port_prep(struct sdw_slave_runtime *s_rt,
 }
 
 static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
-			struct sdw_slave_runtime *s_rt,
-			struct sdw_port_runtime *p_rt, bool prep)
+				       struct sdw_slave_runtime *s_rt,
+				       struct sdw_port_runtime *p_rt,
+				       bool prep)
 {
 	struct completion *port_ready = NULL;
 	struct sdw_dpn_prop *dpn_prop;
@@ -420,8 +425,8 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 	prep_ch.ch_mask = p_rt->ch_mask;
 
 	dpn_prop = sdw_get_slave_dpn_prop(s_rt->slave,
-					s_rt->direction,
-					prep_ch.num);
+					  s_rt->direction,
+					  prep_ch.num);
 	if (!dpn_prop) {
 		dev_err(bus->dev,
 			"Slave Port:%d properties not found", prep_ch.num);
@@ -442,7 +447,7 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 	 */
 	if (prep && intr) {
 		ret = sdw_configure_dpn_intr(s_rt->slave, p_rt->num, prep,
-						dpn_prop->device_interrupts);
+					     dpn_prop->device_interrupts);
 		if (ret < 0)
 			return ret;
 	}
@@ -456,7 +461,7 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 
 		if (prep)
 			ret = sdw_update(s_rt->slave, addr,
-					0xFF, p_rt->ch_mask);
+					 0xFF, p_rt->ch_mask);
 		else
 			ret = sdw_update(s_rt->slave, addr, 0xFF, 0x0);
 
@@ -486,13 +491,14 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 	/* Disable interrupt after Port de-prepare */
 	if (!prep && intr)
 		ret = sdw_configure_dpn_intr(s_rt->slave, p_rt->num, prep,
-						dpn_prop->device_interrupts);
+					     dpn_prop->device_interrupts);
 
 	return ret;
 }
 
 static int sdw_prep_deprep_master_ports(struct sdw_master_runtime *m_rt,
-				struct sdw_port_runtime *p_rt, bool prep)
+					struct sdw_port_runtime *p_rt,
+					bool prep)
 {
 	struct sdw_transport_params *t_params = &p_rt->transport_params;
 	struct sdw_bus *bus = m_rt->bus;
@@ -510,7 +516,7 @@ static int sdw_prep_deprep_master_ports(struct sdw_master_runtime *m_rt,
 		ret = ops->dpn_port_prep(bus, &prep_ch);
 		if (ret < 0) {
 			dev_err(bus->dev, "Port prepare failed for port:%d",
-					t_params->port_num);
+				t_params->port_num);
 			return ret;
 		}
 	}
@@ -535,7 +541,7 @@ static int sdw_prep_deprep_ports(struct sdw_master_runtime *m_rt, bool prep)
 	list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
 		list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
 			ret = sdw_prep_deprep_slave_ports(m_rt->bus, s_rt,
-							p_rt, prep);
+							  p_rt, prep);
 			if (ret < 0)
 				return ret;
 		}
@@ -579,7 +585,7 @@ static int sdw_notify_config(struct sdw_master_runtime *m_rt)
 			ret = slave->ops->bus_config(slave, &bus->params);
 			if (ret < 0)
 				dev_err(bus->dev, "Notify Slave: %d failed",
-								slave->dev_num);
+					slave->dev_num);
 			return ret;
 		}
 	}
@@ -658,7 +664,7 @@ static int sdw_bank_switch(struct sdw_bus *bus, int m_rt_count)
 		addr = SDW_SCP_FRAMECTRL_B0;
 
 	sdw_fill_msg(wr_msg, NULL, addr, 1, SDW_BROADCAST_DEV_NUM,
-					SDW_MSG_FLAG_WRITE, wbuf);
+		     SDW_MSG_FLAG_WRITE, wbuf);
 	wr_msg->ssp_sync = true;
 
 	/*
@@ -873,7 +879,7 @@ EXPORT_SYMBOL(sdw_alloc_stream);
 
 static struct sdw_master_runtime
 *sdw_find_master_rt(struct sdw_bus *bus,
-			struct sdw_stream_runtime *stream)
+		    struct sdw_stream_runtime *stream)
 {
 	struct sdw_master_runtime *m_rt = NULL;
 
@@ -897,8 +903,8 @@ static struct sdw_master_runtime
  */
 static struct sdw_master_runtime
 *sdw_alloc_master_rt(struct sdw_bus *bus,
-			struct sdw_stream_config *stream_config,
-			struct sdw_stream_runtime *stream)
+		     struct sdw_stream_config *stream_config,
+		     struct sdw_stream_runtime *stream)
 {
 	struct sdw_master_runtime *m_rt;
 
@@ -941,8 +947,8 @@ static struct sdw_master_runtime
  */
 static struct sdw_slave_runtime
 *sdw_alloc_slave_rt(struct sdw_slave *slave,
-			struct sdw_stream_config *stream_config,
-			struct sdw_stream_runtime *stream)
+		    struct sdw_stream_config *stream_config,
+		    struct sdw_stream_runtime *stream)
 {
 	struct sdw_slave_runtime *s_rt = NULL;
 
@@ -959,20 +965,19 @@ static struct sdw_slave_runtime
 }
 
 static void sdw_master_port_release(struct sdw_bus *bus,
-			struct sdw_master_runtime *m_rt)
+				    struct sdw_master_runtime *m_rt)
 {
 	struct sdw_port_runtime *p_rt, *_p_rt;
 
-	list_for_each_entry_safe(p_rt, _p_rt,
-			&m_rt->port_list, port_node) {
+	list_for_each_entry_safe(p_rt, _p_rt, &m_rt->port_list, port_node) {
 		list_del(&p_rt->port_node);
 		kfree(p_rt);
 	}
 }
 
 static void sdw_slave_port_release(struct sdw_bus *bus,
-			struct sdw_slave *slave,
-			struct sdw_stream_runtime *stream)
+				   struct sdw_slave *slave,
+				   struct sdw_stream_runtime *stream)
 {
 	struct sdw_port_runtime *p_rt, *_p_rt;
 	struct sdw_master_runtime *m_rt;
@@ -985,7 +990,7 @@ static void sdw_slave_port_release(struct sdw_bus *bus,
 				continue;
 
 			list_for_each_entry_safe(p_rt, _p_rt,
-					&s_rt->port_list, port_node) {
+						 &s_rt->port_list, port_node) {
 
 				list_del(&p_rt->port_node);
 				kfree(p_rt);
@@ -1003,7 +1008,7 @@ static void sdw_slave_port_release(struct sdw_bus *bus,
  * This function is to be called with bus_lock held.
  */
 static void sdw_release_slave_stream(struct sdw_slave *slave,
-			struct sdw_stream_runtime *stream)
+				     struct sdw_stream_runtime *stream)
 {
 	struct sdw_slave_runtime *s_rt, *_s_rt;
 	struct sdw_master_runtime *m_rt;
@@ -1011,7 +1016,7 @@ static void sdw_release_slave_stream(struct sdw_slave *slave,
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
 		/* Retrieve Slave runtime handle */
 		list_for_each_entry_safe(s_rt, _s_rt,
-					&m_rt->slave_rt_list, m_rt_node) {
+					 &m_rt->slave_rt_list, m_rt_node) {
 
 			if (s_rt->slave == slave) {
 				list_del(&s_rt->m_rt_node);
@@ -1034,7 +1039,7 @@ static void sdw_release_slave_stream(struct sdw_slave *slave,
  * no effect as Slave(s) runtime handle would already be freed up.
  */
 static void sdw_release_master_stream(struct sdw_master_runtime *m_rt,
-			struct sdw_stream_runtime *stream)
+				      struct sdw_stream_runtime *stream)
 {
 	struct sdw_slave_runtime *s_rt, *_s_rt;
 
@@ -1057,14 +1062,14 @@ static void sdw_release_master_stream(struct sdw_master_runtime *m_rt,
  * This removes and frees port_rt and master_rt from a stream
  */
 int sdw_stream_remove_master(struct sdw_bus *bus,
-		struct sdw_stream_runtime *stream)
+			     struct sdw_stream_runtime *stream)
 {
 	struct sdw_master_runtime *m_rt, *_m_rt;
 
 	mutex_lock(&bus->bus_lock);
 
 	list_for_each_entry_safe(m_rt, _m_rt,
-			&stream->master_list, stream_node) {
+				 &stream->master_list, stream_node) {
 
 		if (m_rt->bus != bus)
 			continue;
@@ -1092,7 +1097,7 @@ EXPORT_SYMBOL(sdw_stream_remove_master);
  * This removes and frees port_rt and slave_rt from a stream
  */
 int sdw_stream_remove_slave(struct sdw_slave *slave,
-		struct sdw_stream_runtime *stream)
+			    struct sdw_stream_runtime *stream)
 {
 	mutex_lock(&slave->bus->bus_lock);
 
@@ -1116,8 +1121,9 @@ EXPORT_SYMBOL(sdw_stream_remove_slave);
  * This function is to be called with bus_lock held.
  */
 static int sdw_config_stream(struct device *dev,
-		struct sdw_stream_runtime *stream,
-		struct sdw_stream_config *stream_config, bool is_slave)
+			     struct sdw_stream_runtime *stream,
+			     struct sdw_stream_config *stream_config,
+			     bool is_slave)
 {
 	/*
 	 * Update the stream rate, channel and bps based on data
@@ -1128,13 +1134,13 @@ static int sdw_config_stream(struct device *dev,
 	 * comparison and allow the value to be set and stored in stream
 	 */
 	if (stream->params.rate &&
-			stream->params.rate != stream_config->frame_rate) {
+	    stream->params.rate != stream_config->frame_rate) {
 		dev_err(dev, "rate not matching, stream:%s", stream->name);
 		return -EINVAL;
 	}
 
 	if (stream->params.bps &&
-			stream->params.bps != stream_config->bps) {
+	    stream->params.bps != stream_config->bps) {
 		dev_err(dev, "bps not matching, stream:%s", stream->name);
 		return -EINVAL;
 	}
@@ -1151,7 +1157,7 @@ static int sdw_config_stream(struct device *dev,
 }
 
 static int sdw_is_valid_port_range(struct device *dev,
-				struct sdw_port_runtime *p_rt)
+				   struct sdw_port_runtime *p_rt)
 {
 	if (!SDW_VALID_PORT_RANGE(p_rt->num)) {
 		dev_err(dev,
@@ -1162,9 +1168,10 @@ static int sdw_is_valid_port_range(struct device *dev,
 	return 0;
 }
 
-static struct sdw_port_runtime *sdw_port_alloc(struct device *dev,
-				struct sdw_port_config *port_config,
-				int port_index)
+static struct sdw_port_runtime
+*sdw_port_alloc(struct device *dev,
+		struct sdw_port_config *port_config,
+		int port_index)
 {
 	struct sdw_port_runtime *p_rt;
 
@@ -1179,9 +1186,9 @@ static struct sdw_port_runtime *sdw_port_alloc(struct device *dev,
 }
 
 static int sdw_master_port_config(struct sdw_bus *bus,
-			struct sdw_master_runtime *m_rt,
-			struct sdw_port_config *port_config,
-			unsigned int num_ports)
+				  struct sdw_master_runtime *m_rt,
+				  struct sdw_port_config *port_config,
+				  unsigned int num_ports)
 {
 	struct sdw_port_runtime *p_rt;
 	int i;
@@ -1204,9 +1211,9 @@ static int sdw_master_port_config(struct sdw_bus *bus,
 }
 
 static int sdw_slave_port_config(struct sdw_slave *slave,
-			struct sdw_slave_runtime *s_rt,
-			struct sdw_port_config *port_config,
-			unsigned int num_config)
+				 struct sdw_slave_runtime *s_rt,
+				 struct sdw_port_config *port_config,
+				 unsigned int num_config)
 {
 	struct sdw_port_runtime *p_rt;
 	int i, ret;
@@ -1248,10 +1255,10 @@ static int sdw_slave_port_config(struct sdw_slave *slave,
  * @stream: SoundWire stream
  */
 int sdw_stream_add_master(struct sdw_bus *bus,
-		struct sdw_stream_config *stream_config,
-		struct sdw_port_config *port_config,
-		unsigned int num_ports,
-		struct sdw_stream_runtime *stream)
+			  struct sdw_stream_config *stream_config,
+			  struct sdw_port_config *port_config,
+			  unsigned int num_ports,
+			  struct sdw_stream_runtime *stream)
 {
 	struct sdw_master_runtime *m_rt = NULL;
 	int ret;
@@ -1273,8 +1280,8 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 	m_rt = sdw_alloc_master_rt(bus, stream_config, stream);
 	if (!m_rt) {
 		dev_err(bus->dev,
-				"Master runtime config failed for stream:%s",
-				stream->name);
+			"Master runtime config failed for stream:%s",
+			stream->name);
 		ret = -ENOMEM;
 		goto unlock;
 	}
@@ -1313,10 +1320,10 @@ EXPORT_SYMBOL(sdw_stream_add_master);
  *
  */
 int sdw_stream_add_slave(struct sdw_slave *slave,
-		struct sdw_stream_config *stream_config,
-		struct sdw_port_config *port_config,
-		unsigned int num_ports,
-		struct sdw_stream_runtime *stream)
+			 struct sdw_stream_config *stream_config,
+			 struct sdw_port_config *port_config,
+			 unsigned int num_ports,
+			 struct sdw_stream_runtime *stream)
 {
 	struct sdw_slave_runtime *s_rt;
 	struct sdw_master_runtime *m_rt;
@@ -1331,8 +1338,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 	m_rt = sdw_alloc_master_rt(slave->bus, stream_config, stream);
 	if (!m_rt) {
 		dev_err(&slave->dev,
-				"alloc master runtime failed for stream:%s",
-				stream->name);
+			"alloc master runtime failed for stream:%s",
+			stream->name);
 		ret = -ENOMEM;
 		goto error;
 	}
@@ -1340,8 +1347,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 	s_rt = sdw_alloc_slave_rt(slave, stream_config, stream);
 	if (!s_rt) {
 		dev_err(&slave->dev,
-				"Slave runtime config failed for stream:%s",
-				stream->name);
+			"Slave runtime config failed for stream:%s",
+			stream->name);
 		ret = -ENOMEM;
 		goto stream_error;
 	}
@@ -1385,8 +1392,8 @@ EXPORT_SYMBOL(sdw_stream_add_slave);
  * @port_num: Port number
  */
 struct sdw_dpn_prop *sdw_get_slave_dpn_prop(struct sdw_slave *slave,
-				enum sdw_data_direction direction,
-				unsigned int port_num)
+					    enum sdw_data_direction direction,
+					    unsigned int port_num)
 {
 	struct sdw_dpn_prop *dpn_prop;
 	u8 num_ports;
@@ -1501,7 +1508,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream)
 		ret = sdw_prep_deprep_ports(m_rt, true);
 		if (ret < 0) {
 			dev_err(bus->dev, "Prepare port(s) failed ret = %d",
-					ret);
+				ret);
 			return ret;
 		}
 	}
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
