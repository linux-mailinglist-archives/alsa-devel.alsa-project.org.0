Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A78E117E5
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 13:04:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF73317A6;
	Thu,  2 May 2019 13:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF73317A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556795081;
	bh=1ZtIpCw7WUQNjaM97g4e6S9ow70HkFWE4pnsbwPEO/A=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O6rugnnCr6ViYckVpTEHZEoPA2rgokGr5lwu0sxIzUZbUX1g65mgacC4oHa89wEx5
	 iXVpwxaEYVaeG2oaXB4+jGAj2X8TwfiSDH4ZvKEMcSsw2/6JxEsAz4tvb8+FmZB9ah
	 v4WxskzpeOeBMnxFMZ8bwn+67QPKKjQSm//zmm8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E8AEF8972F;
	Thu,  2 May 2019 13:00:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F5B0F89729; Thu,  2 May 2019 13:00:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA77BF89721
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 13:00:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA77BF89721
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MRQn2AQ1"
Received: from localhost.localdomain (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 802502089E;
 Thu,  2 May 2019 11:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556794822;
 bh=VXI0Bu+4xZw2lgwtPnmOchgyaVay97+dnnJeeDSEPjc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MRQn2AQ1pwpZkBzImG3xPPnVXHrPGb6AIHZ60j0sS04TJFtI10cNviKBgl8jztKQb
 YUrtiNuxIAxUxSqs0rvbHMEVr/RF9YZ6f/Ih8IOi9mQ4SLy8C2Z6juxnqcECYPFOeS
 c49Wl3WNl1ScRQqafZCpuEuuM/Vb/Wgz0Uw9vq8A=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Date: Thu,  2 May 2019 16:29:20 +0530
Message-Id: <20190502105930.9889-5-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502105930.9889-1-vkoul@kernel.org>
References: <20190502105930.9889-1-vkoul@kernel.org>
MIME-Version: 1.0
Cc: Greg KH <gregkh@linuxfoundation.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Shreyas NC <shreyas.nc@intel.com>
Subject: [alsa-devel] [PATCH 04/14] soundwire: remove empty line
	before/after braces
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Linux code style doesn't expect empty lines before or after braces and
gives warning:

CHECK: Blank lines aren't necessary after an open brace '{'
CHECK: Blank lines aren't necessary before a close brace '}'

Fix these instances in soundwire core

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/bus.c        | 8 --------
 drivers/soundwire/mipi_disco.c | 6 ------
 drivers/soundwire/stream.c     | 8 --------
 3 files changed, 22 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index fa86957cb615..e2ee305905a6 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -391,7 +391,6 @@ EXPORT_SYMBOL(sdw_read);
 int sdw_write(struct sdw_slave *slave, u32 addr, u8 value)
 {
 	return sdw_nwrite(slave, addr, 1, &value);
-
 }
 EXPORT_SYMBOL(sdw_write);
 
@@ -414,7 +413,6 @@ static struct sdw_slave *sdw_get_slave(struct sdw_bus *bus, int i)
 
 static int sdw_compare_devid(struct sdw_slave *slave, struct sdw_slave_id id)
 {
-
 	if (slave->id.unique_id != id.unique_id ||
 	    slave->id.mfg_id != id.mfg_id ||
 	    slave->id.part_id != id.part_id ||
@@ -467,7 +465,6 @@ static int sdw_assign_device_num(struct sdw_slave *slave)
 		/* Clear the slave->dev_num to transfer message on device 0 */
 		dev_num = slave->dev_num;
 		slave->dev_num = 0;
-
 	}
 
 	ret = sdw_write(slave, SDW_SCP_DEVNUMBER, dev_num);
@@ -508,7 +505,6 @@ void sdw_extract_slave_id(struct sdw_bus *bus,
 		"SDW Slave class_id %x, part_id %x, mfg_id %x, unique_id %x, version %x\n",
 				id->class_id, id->part_id, id->mfg_id,
 				id->unique_id, id->sdw_version);
-
 }
 
 static int sdw_program_device_num(struct sdw_bus *bus)
@@ -677,7 +673,6 @@ static int sdw_handle_dp0_interrupt(struct sdw_slave *slave, u8 *slave_status)
 	}
 
 	do {
-
 		if (status & SDW_DP0_INT_TEST_FAIL) {
 			dev_err(&slave->dev, "Test fail for port 0\n");
 			clear |= SDW_DP0_INT_TEST_FAIL;
@@ -754,7 +749,6 @@ static int sdw_handle_port_interrupt(struct sdw_slave *slave,
 	}
 
 	do {
-
 		if (status & SDW_DPN_INT_TEST_FAIL) {
 			dev_err(&slave->dev, "Test fail for port:%d\n", port);
 			clear |= SDW_DPN_INT_TEST_FAIL;
@@ -867,7 +861,6 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		for_each_set_bit(bit, &port, 8) {
 			sdw_handle_port_interrupt(slave, bit,
 						  &port_status[bit]);
-
 		}
 
 		/* Check if cascade 2 interrupt is present */
@@ -1035,7 +1028,6 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 		if (ret)
 			dev_err(slave->bus->dev,
 				"Update Slave status failed:%d\n", ret);
-
 	}
 
 	return ret;
diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disco.c
index 2bf4046e68b6..c1f51d6a23d2 100644
--- a/drivers/soundwire/mipi_disco.c
+++ b/drivers/soundwire/mipi_disco.c
@@ -63,7 +63,6 @@ int sdw_master_read_prop(struct sdw_bus *bus)
 	nval = fwnode_property_read_u32_array(link,
 			"mipi-sdw-clock-frequencies-supported", NULL, 0);
 	if (nval > 0) {
-
 		prop->num_freq = nval;
 		prop->freq = devm_kcalloc(bus->dev, prop->num_freq,
 					  sizeof(*prop->freq), GFP_KERNEL);
@@ -90,7 +89,6 @@ int sdw_master_read_prop(struct sdw_bus *bus)
 	nval = fwnode_property_read_u32_array(link,
 			"mipi-sdw-supported-clock-gears", NULL, 0);
 	if (nval > 0) {
-
 		prop->num_clk_gears = nval;
 		prop->clk_gears = devm_kcalloc(bus->dev, prop->num_clk_gears,
 					       sizeof(*prop->clk_gears),
@@ -197,7 +195,6 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 		nval = fwnode_property_read_u32_array(node,
 				"mipi-sdw-port-wordlength-configs", NULL, 0);
 		if (nval > 0) {
-
 			dpn[i].num_words = nval;
 			dpn[i].words = devm_kcalloc(&slave->dev,
 						    dpn[i].num_words,
@@ -238,7 +235,6 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 		nval = fwnode_property_read_u32_array(node,
 				"mipi-sdw-channel-number-list", NULL, 0);
 		if (nval > 0) {
-
 			dpn[i].num_ch = nval;
 			dpn[i].ch = devm_kcalloc(&slave->dev, dpn[i].num_ch,
 						 sizeof(*dpn[i].ch),
@@ -254,7 +250,6 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 		nval = fwnode_property_read_u32_array(node,
 				"mipi-sdw-channel-combination-list", NULL, 0);
 		if (nval > 0) {
-
 			dpn[i].num_ch_combinations = nval;
 			dpn[i].ch_combinations = devm_kcalloc(&slave->dev,
 					dpn[i].num_ch_combinations,
@@ -354,7 +349,6 @@ int sdw_slave_read_prop(struct sdw_slave *slave)
 	if (!port) {
 		dev_dbg(dev, "DP0 node not found!!\n");
 	} else {
-
 		prop->dp0_prop = devm_kzalloc(&slave->dev,
 					      sizeof(*prop->dp0_prop),
 					      GFP_KERNEL);
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 166b0c16003f..032a326a96d7 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -771,7 +771,6 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
 		if (ret < 0) {
 			dev_err(bus->dev, "Bank switch failed: %d\n", ret);
 			goto error;
-
 		}
 	}
 
@@ -818,7 +817,6 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
 
 error:
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
-
 		bus = m_rt->bus;
 
 		kfree(bus->defer_msg.msg->buf);
@@ -985,13 +983,11 @@ static void sdw_slave_port_release(struct sdw_bus *bus,
 
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
 		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
-
 			if (s_rt->slave != slave)
 				continue;
 
 			list_for_each_entry_safe(p_rt, _p_rt,
 						 &s_rt->port_list, port_node) {
-
 				list_del(&p_rt->port_node);
 				kfree(p_rt);
 			}
@@ -1017,7 +1013,6 @@ static void sdw_release_slave_stream(struct sdw_slave *slave,
 		/* Retrieve Slave runtime handle */
 		list_for_each_entry_safe(s_rt, _s_rt,
 					 &m_rt->slave_rt_list, m_rt_node) {
-
 			if (s_rt->slave == slave) {
 				list_del(&s_rt->m_rt_node);
 				kfree(s_rt);
@@ -1070,7 +1065,6 @@ int sdw_stream_remove_master(struct sdw_bus *bus,
 
 	list_for_each_entry_safe(m_rt, _m_rt,
 				 &stream->master_list, stream_node) {
-
 		if (m_rt->bus != bus)
 			continue;
 
@@ -1492,7 +1486,6 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream)
 			dev_err(bus->dev, "Program params failed: %d\n", ret);
 			goto restore_params;
 		}
-
 	}
 
 	ret = do_bank_switch(stream);
@@ -1693,7 +1686,6 @@ static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 			dev_err(bus->dev, "Program params failed: %d\n", ret);
 			return ret;
 		}
-
 	}
 
 	stream->state = SDW_STREAM_DEPREPARED;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
