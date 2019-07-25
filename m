Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B2F75BCB
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 02:01:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 947F81F8F;
	Fri, 26 Jul 2019 02:00:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 947F81F8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564099262;
	bh=tCriLIfXMCFdffVFShwI9Uqb1oln7DsveghZtACtKHw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DBRrMfa2izd/QSglr3kopUr8+5c/gFNokC12RBSTESscD+pSxh9t7utBch+dSccJp
	 KDZ4D+4busZFuUg2vhesJLGT9Xqx2l9CBOgIfpBJt+S/44l1GD2+gXUe1QW1mRPqgP
	 5fzO23AKgNzJxBtuJZovrX6IbfcwVXkmoXPPyps8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DCE3F80392;
	Fri, 26 Jul 2019 01:41:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27C74F80746; Fri, 26 Jul 2019 01:41:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39A1DF80717
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 01:41:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39A1DF80717
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jul 2019 16:41:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,308,1559545200"; d="scan'208";a="369874798"
Received: from amrutaku-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.230.75])
 by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2019 16:41:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 25 Jul 2019 18:40:19 -0500
Message-Id: <20190725234032.21152-28-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [RFC PATCH 27/40] soundwire: Add Intel resource
	management algorithm
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

This algorithm computes bus parameters like clock frequency, frame
shape and port transport parameters based on active stream(s) running
on the bus.

This implementation is optimal for Intel platforms. Developers can
also implement their own .compute_params() callback for specific
resource management algorithm.

Credits: this patch is based on an earlier internal contribution by
Vinod Koul, Sanyog Kale, Shreyas Nc and Hardik Shah. All hard-coded
values were removed from the initial contribution to use BIOS
information instead.

FIXME: remove checkpatch report
WARNING: Reusing the krealloc arg is almost always a bug
+			group->rates = krealloc(group->rates,

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/Makefile                  |   2 +-
 drivers/soundwire/algo_dynamic_allocation.c | 403 ++++++++++++++++++++
 drivers/soundwire/bus.c                     |   3 +
 drivers/soundwire/bus.h                     |  46 ++-
 drivers/soundwire/stream.c                  |  20 +
 include/linux/soundwire/sdw.h               |   5 +
 6 files changed, 476 insertions(+), 3 deletions(-)
 create mode 100644 drivers/soundwire/algo_dynamic_allocation.c

diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index 88990cac48a7..f59a9d4a28fd 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -5,7 +5,7 @@
 
 #Bus Objs
 soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o \
-			debugfs.o
+			debugfs.o algo_dynamic_allocation.o
 
 obj-$(CONFIG_SOUNDWIRE_BUS) += soundwire-bus.o
 
diff --git a/drivers/soundwire/algo_dynamic_allocation.c b/drivers/soundwire/algo_dynamic_allocation.c
new file mode 100644
index 000000000000..89edb39162b8
--- /dev/null
+++ b/drivers/soundwire/algo_dynamic_allocation.c
@@ -0,0 +1,403 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// Copyright(c) 2015-18 Intel Corporation.
+
+/*
+ * Bandwidth management algorithm based on 2^n gears
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/slab.h>
+#include <linux/soundwire/sdw.h>
+#include "bus.h"
+
+#define SDW_STRM_RATE_GROUPING		1
+
+struct sdw_group_params {
+	unsigned int rate;
+	int full_bw;
+	int payload_bw;
+	int hwidth;
+};
+
+struct sdw_group {
+	unsigned int count;
+	unsigned int max_size;
+	unsigned int *rates;
+};
+
+struct sdw_transport_data {
+	int hstart;
+	int hstop;
+	int block_offset;
+	int sub_block_offset;
+};
+
+static void sdw_compute_slave_ports(struct sdw_master_runtime *m_rt,
+				    struct sdw_transport_data *t_data)
+{
+	struct sdw_slave_runtime *s_rt = NULL;
+	struct sdw_port_runtime *p_rt;
+	int port_bo, sample_int;
+	unsigned int rate, bps, ch = 0;
+
+	port_bo = t_data->block_offset;
+
+	list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
+		rate = m_rt->stream->params.rate;
+		bps = m_rt->stream->params.bps;
+		sample_int = (m_rt->bus->params.curr_dr_freq / rate);
+
+		list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
+			ch = sdw_ch_mask_to_ch(p_rt->ch_mask);
+
+			sdw_fill_xport_params(&p_rt->transport_params,
+					      p_rt->num, true,
+					      SDW_BLK_GRP_CNT_1,
+					      sample_int, port_bo, port_bo >> 8,
+					      t_data->hstart,
+					      t_data->hstop,
+					      (SDW_BLK_GRP_CNT_1 * ch), 0x0);
+
+			sdw_fill_port_params(&p_rt->port_params,
+					     p_rt->num, bps,
+					     SDW_PORT_FLOW_MODE_ISOCH,
+					     SDW_PORT_DATA_MODE_NORMAL);
+
+			port_bo += bps * ch;
+		}
+	}
+}
+
+static void sdw_compute_master_ports(struct sdw_master_runtime *m_rt,
+				     struct sdw_group_params *params,
+				     int port_bo, int hstop)
+{
+	struct sdw_transport_data t_data = {0};
+	struct sdw_port_runtime *p_rt;
+	struct sdw_bus *bus = m_rt->bus;
+	int sample_int, hstart = 0;
+	unsigned int rate, bps, ch, no_ch;
+
+	rate = m_rt->stream->params.rate;
+	bps = m_rt->stream->params.bps;
+	ch = m_rt->ch_count;
+	sample_int = (bus->params.curr_dr_freq / rate);
+
+	if (rate != params->rate)
+		return;
+
+	t_data.hstop = hstop;
+	hstart = hstop - params->hwidth + 1;
+	t_data.hstart = hstart;
+
+	list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
+		no_ch = sdw_ch_mask_to_ch(p_rt->ch_mask);
+
+		sdw_fill_xport_params(&p_rt->transport_params, p_rt->num,
+				      true, SDW_BLK_GRP_CNT_1, sample_int,
+				      port_bo, port_bo >> 8, hstart, hstop,
+				      (SDW_BLK_GRP_CNT_1 * no_ch), 0x0);
+
+		sdw_fill_port_params(&p_rt->port_params,
+				     p_rt->num, bps,
+				     SDW_PORT_FLOW_MODE_ISOCH,
+				     SDW_PORT_DATA_MODE_NORMAL);
+
+		/* Check for first entry */
+		if (!(p_rt == list_first_entry(&m_rt->port_list,
+					       struct sdw_port_runtime,
+					       port_node))) {
+			port_bo += bps * ch;
+			continue;
+		}
+
+		t_data.hstart = hstart;
+		t_data.hstop = hstop;
+		t_data.block_offset = port_bo;
+		t_data.sub_block_offset = 0;
+		port_bo += bps * ch;
+	}
+
+	sdw_compute_slave_ports(m_rt, &t_data);
+}
+
+static void _sdw_compute_port_params(struct sdw_bus *bus,
+				     struct sdw_group_params *params, int count)
+{
+	struct sdw_master_runtime *m_rt = NULL;
+	int hstop = bus->params.col - 1;
+	int block_offset, port_bo, i;
+
+	/* Run loop for all groups to compute transport parameters */
+	for (i = 0; i < count; i++) {
+		port_bo = 1;
+		block_offset = 1;
+
+		list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
+			sdw_compute_master_ports(m_rt, &params[i],
+						 port_bo, hstop);
+
+			block_offset += m_rt->ch_count *
+					m_rt->stream->params.bps;
+			port_bo = block_offset;
+		}
+
+		hstop = hstop - params[i].hwidth;
+	}
+}
+
+static int sdw_compute_group_params(struct sdw_bus *bus,
+				    struct sdw_group_params *params,
+				    int *rates, int count)
+{
+	struct sdw_master_runtime *m_rt = NULL;
+	int sel_col = bus->params.col;
+	unsigned int rate, bps, ch;
+	int i, column_needed = 0;
+
+	/* Calculate bandwidth per group */
+	for (i = 0; i < count; i++) {
+		params[i].rate = rates[i];
+		params[i].full_bw = bus->params.curr_dr_freq / params[i].rate;
+	}
+
+	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
+		rate = m_rt->stream->params.rate;
+		bps = m_rt->stream->params.bps;
+		ch = m_rt->ch_count;
+
+		for (i = 0; i < count; i++) {
+			if (rate == params[i].rate)
+				params[i].payload_bw += bps * ch;
+		}
+	}
+
+	for (i = 0; i < count; i++) {
+		params[i].hwidth = (sel_col *
+			params[i].payload_bw + params[i].full_bw - 1) /
+			params[i].full_bw;
+
+		column_needed += params[i].hwidth;
+	}
+
+	if (column_needed > sel_col - 1)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int sdw_add_element_group_count(struct sdw_group *group,
+				       unsigned int rate)
+{
+	int num = group->count;
+	int i;
+
+	for (i = 0; i <= num; i++) {
+		if (rate == group->rates[i])
+			break;
+
+		if (i != num)
+			continue;
+
+		if (group->count >= group->max_size) {
+			group->max_size += 1;
+			group->rates = krealloc(group->rates,
+						(sizeof(int) * group->max_size),
+						GFP_KERNEL);
+			if (!group->rates)
+				return -ENOMEM;
+		}
+
+		group->rates[group->count++] = rate;
+	}
+
+	return 0;
+}
+
+static int sdw_get_group_count(struct sdw_bus *bus,
+			       struct sdw_group *group)
+{
+	struct sdw_master_runtime *m_rt;
+	unsigned int rate;
+	int ret = 0;
+
+	group->count = 0;
+	group->max_size = SDW_STRM_RATE_GROUPING;
+	group->rates = kcalloc(group->max_size, sizeof(int), GFP_KERNEL);
+	if (!group->rates)
+		return -ENOMEM;
+
+	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
+		rate = m_rt->stream->params.rate;
+		if (m_rt == list_first_entry(&bus->m_rt_list,
+					     struct sdw_master_runtime,
+					     bus_node)) {
+			group->rates[group->count++] = rate;
+
+		} else {
+			ret = sdw_add_element_group_count(group, rate);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	return ret;
+}
+
+/**
+ * sdw_compute_port_params: Compute transport and port parameters
+ *
+ * @bus: SDW Bus instance
+ */
+static int sdw_compute_port_params(struct sdw_bus *bus)
+{
+	struct sdw_group_params *params = NULL;
+	struct sdw_group group;
+	int ret;
+
+	ret = sdw_get_group_count(bus, &group);
+	if (ret < 0)
+		goto out;
+
+	if (group.count == 0)
+		goto out;
+
+	params = kcalloc(group.count, sizeof(*params), GFP_KERNEL);
+	if (!params) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	/* Compute transport parameters for grouped streams */
+	ret = sdw_compute_group_params(bus, params,
+				       &group.rates[0], group.count);
+	if (ret < 0)
+		goto out;
+
+	_sdw_compute_port_params(bus, params, group.count);
+
+out:
+	kfree(params);
+	kfree(group.rates);
+
+	return ret;
+}
+
+static int sdw_select_row_col(struct sdw_bus *bus, int clk_freq)
+{
+	struct sdw_master_prop *prop = &bus->prop;
+	int frame_int, frame_freq;
+	int r, c;
+
+	for (c = 0; c < SDW_FRAME_COLS; c++) {
+		for (r = 0; r < SDW_FRAME_ROWS; r++) {
+			if (sdw_rows[r] != prop->default_row ||
+			    sdw_cols[c] != prop->default_col)
+				continue;
+
+			frame_int = sdw_rows[r] * sdw_cols[c];
+			frame_freq = clk_freq / frame_int;
+
+			if ((clk_freq - (frame_freq * SDW_FRAME_CTRL_BITS)) <
+			    bus->params.bandwidth)
+				continue;
+
+			bus->params.row = sdw_rows[r];
+			bus->params.col = sdw_cols[c];
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
+/**
+ * sdw_compute_bus_params: Compute bus parameters
+ *
+ * @bus: SDW Bus instance
+ */
+static int sdw_compute_bus_params(struct sdw_bus *bus)
+{
+	unsigned int max_dr_freq, curr_dr_freq = 0;
+	struct sdw_master_prop *mstr_prop = NULL;
+	int i, clk_values, ret;
+	bool is_gear = false;
+	u32 *clk_buf;
+
+	mstr_prop = &bus->prop;
+	if (!mstr_prop)
+		return -EINVAL;
+
+	if (mstr_prop->num_clk_gears) {
+		clk_values = mstr_prop->num_clk_gears;
+		clk_buf = mstr_prop->clk_gears;
+		is_gear = true;
+	} else if (mstr_prop->num_clk_freq) {
+		clk_values = mstr_prop->num_clk_freq;
+		clk_buf = mstr_prop->clk_freq;
+	} else {
+		clk_values = 1;
+		clk_buf = NULL;
+	}
+
+	max_dr_freq = mstr_prop->max_clk_freq * SDW_DOUBLE_RATE_FACTOR;
+
+	for (i = 0; i < clk_values; i++) {
+		if (!clk_buf)
+			curr_dr_freq = max_dr_freq;
+		else
+			curr_dr_freq = (is_gear) ?
+				(max_dr_freq >>  clk_buf[i]) :
+				clk_buf[i] * SDW_DOUBLE_RATE_FACTOR;
+
+		if (curr_dr_freq <= bus->params.bandwidth)
+			continue;
+
+		break;
+
+		/*
+		 * TODO: Check all the Slave(s) port(s) audio modes and find
+		 * whether given clock rate is supported with glitchless
+		 * transition.
+		 */
+	}
+
+	if (i == clk_values)
+		return -EINVAL;
+
+	ret = sdw_select_row_col(bus, curr_dr_freq);
+	if (ret < 0)
+		return -EINVAL;
+
+	bus->params.curr_dr_freq = curr_dr_freq;
+	return 0;
+}
+
+/**
+ * sdw_compute_params: Compute bus, transport and port parameters
+ *
+ * @bus: SDW Bus instance
+ */
+int sdw_compute_params(struct sdw_bus *bus)
+{
+	int ret;
+
+	/* Computes clock frequency, frame shape and frame frequency */
+	ret = sdw_compute_bus_params(bus);
+	if (ret < 0) {
+		dev_err(bus->dev, "Compute bus params failed: %d", ret);
+		return ret;
+	}
+
+	/* Compute transport and port params */
+	ret = sdw_compute_port_params(bus);
+	if (ret < 0) {
+		dev_err(bus->dev, "Compute transport params failed: %d", ret);
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(sdw_compute_params);
diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 2354675ef104..76a180578712 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -51,6 +51,9 @@ int sdw_add_bus_master(struct sdw_bus *bus)
 
 	bus->debugfs = sdw_bus_debugfs_init(bus);
 
+	if (!bus->compute_params)
+		bus->compute_params = &sdw_compute_params;
+
 	/*
 	 * Device numbers in SoundWire are 0 through 15. Enumeration device
 	 * number (0), Broadcast device number (15), Group numbers (12 and
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index c57c9c23f6ca..fdb7ce034fdf 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -72,6 +72,7 @@ struct sdw_msg {
 };
 
 #define SDW_DOUBLE_RATE_FACTOR		2
+#define SDW_STRM_RATE_GROUPING		1
 
 extern int sdw_rows[SDW_FRAME_ROWS];
 extern int sdw_cols[SDW_FRAME_COLS];
@@ -157,9 +158,50 @@ int sdw_transfer_defer(struct sdw_bus *bus, struct sdw_msg *msg,
 int sdw_fill_msg(struct sdw_msg *msg, struct sdw_slave *slave,
 		 u32 addr, size_t count, u16 dev_num, u8 flags, u8 *buf);
 
+/* Retrieve and return channel count from channel mask */
+static inline int sdw_ch_mask_to_ch(int ch_mask)
+{
+	int c = 0;
+
+	for (c = 0; ch_mask; ch_mask >>= 1)
+		c += ch_mask & 1;
+
+	return c;
+}
+
+/* Fill transport parameter data structure */
+static inline void sdw_fill_xport_params(struct sdw_transport_params *params,
+					 int port_num, bool grp_ctrl_valid,
+					 int grp_ctrl, int sample_int,
+					 int off1, int off2,
+					 int hstart, int hstop,
+					 int pack_mode, int lane_ctrl)
+{
+	params->port_num = port_num;
+	params->blk_grp_ctrl_valid = grp_ctrl_valid;
+	params->blk_grp_ctrl = grp_ctrl;
+	params->sample_interval = sample_int;
+	params->offset1 = off1;
+	params->offset2 = off2;
+	params->hstart = hstart;
+	params->hstop = hstop;
+	params->blk_pkg_mode = pack_mode;
+	params->lane_ctrl = lane_ctrl;
+}
+
+/* Fill port parameter data structure */
+static inline void sdw_fill_port_params(struct sdw_port_params *params,
+					int port_num, int bps,
+					int flow_mode, int data_mode)
+{
+	params->num = port_num;
+	params->bps = bps;
+	params->flow_mode = flow_mode;
+	params->data_mode = data_mode;
+}
+
 /* Read-Modify-Write Slave register */
-static inline int
-sdw_update(struct sdw_slave *slave, u32 addr, u8 mask, u8 val)
+static inline int sdw_update(struct sdw_slave *slave, u32 addr, u8 mask, u8 val)
 {
 	int tmp;
 
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 75b9ad1fb1a6..add7c121d084 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1485,6 +1485,16 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream)
 		bus->params.bandwidth += m_rt->stream->params.rate *
 			m_rt->ch_count * m_rt->stream->params.bps;
 
+		/* Compute params */
+		if (bus->compute_params) {
+			ret = bus->compute_params(bus);
+			if (ret < 0) {
+				dev_err(bus->dev,
+					"Compute params failed: %d", ret);
+				return ret;
+			}
+		}
+
 		/* Program params */
 		ret = sdw_program_params(bus);
 		if (ret < 0) {
@@ -1704,6 +1714,16 @@ static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 		bus->params.bandwidth -= m_rt->stream->params.rate *
 			m_rt->ch_count * m_rt->stream->params.bps;
 
+		/* Compute params */
+		if (bus->compute_params) {
+			ret = bus->compute_params(bus);
+			if (ret < 0) {
+				dev_err(bus->dev,
+					"Compute params failed: %d", ret);
+				return ret;
+			}
+		}
+
 		/* Program params */
 		ret = sdw_program_params(bus);
 		if (ret < 0) {
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index b6acc436ac80..c7dfc824be80 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -730,6 +730,7 @@ struct sdw_master_ops {
  * Bit set implies used number, bit clear implies unused number.
  * @bus_lock: bus lock
  * @msg_lock: message lock
+ * @compute_params: points to Bus resource management implementation
  * @ops: Master callback ops
  * @port_ops: Master port callback ops
  * @params: Current bus parameters
@@ -752,6 +753,7 @@ struct sdw_bus {
 	DECLARE_BITMAP(assigned, SDW_MAX_DEVICES);
 	struct mutex bus_lock;
 	struct mutex msg_lock;
+	int (*compute_params)(struct sdw_bus *bus);
 	const struct sdw_master_ops *ops;
 	const struct sdw_master_port_ops *port_ops;
 	struct sdw_bus_params params;
@@ -852,6 +854,9 @@ struct sdw_stream_runtime {
 
 struct sdw_stream_runtime *sdw_alloc_stream(char *stream_name);
 void sdw_release_stream(struct sdw_stream_runtime *stream);
+
+int sdw_compute_params(struct sdw_bus *bus);
+
 int sdw_stream_add_master(struct sdw_bus *bus,
 		struct sdw_stream_config *stream_config,
 		struct sdw_port_config *port_config,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
