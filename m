Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA235262465
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 03:10:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ED4216F0;
	Wed,  9 Sep 2020 03:10:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ED4216F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599613859;
	bh=S64deDkGbSHEDKCnPGEVAqXn822DayTf4ULjmrAm8xA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tmVxJqVBILCPxesBsk86IEgbujqCo8FWyBkQ+MIeID+uzbJ0Xu8JP60Kvf41Fr3PG
	 GKTWb45mVpyTXbYMnz+DqwCoYoqZlQubFbt2+CRY6qfB+q8OSVijThMoLadC7XONFC
	 k+fZs9OG7v5LV1lSSoUpY2H+LqxteIw/9LuKmzhw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53165F8026F;
	Wed,  9 Sep 2020 03:09:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DD9DF80264; Wed,  9 Sep 2020 03:09:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 442B8F8015F
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 03:09:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 442B8F8015F
IronPort-SDR: JRVaRZaJZC7QjcOfyAKAkIqJxSAstI2iE8AWmh61ZisIhNeiDx8KZjdFyfVSDO9PuZakof6H9J
 DOB6iPEqpBIQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="137768204"
X-IronPort-AV: E=Sophos;i="5.76,407,1592895600"; d="scan'208";a="137768204"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 18:09:03 -0700
IronPort-SDR: ipT0LPg7lMmubGMcmbJ8WaHahRZaOd7luyYZhCquZMm1UDyMtI9fp0oZmvzr8hR8cPiaUhh2gv
 gZ1P9SDwi41w==
X-IronPort-AV: E=Sophos;i="5.76,407,1592895600"; d="scan'208";a="341380867"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 18:09:00 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: Add generic bandwidth allocation algorithm
Date: Tue,  8 Sep 2020 21:15:20 +0800
Message-Id: <20200908131520.5712-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

This algorithm computes bus parameters like clock frequency, frame
shape and port transport parameters based on active stream(s) running
on the bus.

Developers can also implement their own .compute_params() callback for
specific resource management algorithm, and set if before calling
sdw_add_bus_master()

Credits: this patch is based on an earlier internal contribution by
Vinod Koul, Sanyog Kale, Shreyas Nc and Hardik Shah. All hard-coded
values were removed from the initial contribution to use BIOS
information instead.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/Kconfig                     |   5 +
 drivers/soundwire/Makefile                    |   3 +
 drivers/soundwire/bus.c                       |   6 +
 drivers/soundwire/bus.h                       |  46 +-
 .../soundwire/generic_bandwidth_allocation.c  | 427 ++++++++++++++++++
 drivers/soundwire/intel.c                     |   3 +
 drivers/soundwire/stream.c                    |  12 +
 include/linux/soundwire/sdw.h                 |   3 +
 8 files changed, 503 insertions(+), 2 deletions(-)
 create mode 100644 drivers/soundwire/generic_bandwidth_allocation.c

diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
index f83d02c9c60a..016e74230bb7 100644
--- a/drivers/soundwire/Kconfig
+++ b/drivers/soundwire/Kconfig
@@ -24,6 +24,7 @@ config SOUNDWIRE_CADENCE
 config SOUNDWIRE_INTEL
 	tristate "Intel SoundWire Master driver"
 	select SOUNDWIRE_CADENCE
+	select SOUNDWIRE_GENERIC_ALLOCATION
 	depends on ACPI && SND_SOC
 	help
 	  SoundWire Intel Master driver.
@@ -40,4 +41,8 @@ config SOUNDWIRE_QCOM
 	  If you have an Qualcomm platform which has a SoundWire Master then
 	  enable this config option to get the SoundWire support for that
 	  device
+
+config SOUNDWIRE_GENERIC_ALLOCATION
+	tristate
+
 endif
diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index 7c53ffae9f50..bf1e250d50dd 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -8,6 +8,9 @@ soundwire-bus-y := bus_type.o bus.o master.o slave.o mipi_disco.o stream.o  \
 			sysfs_slave.o sysfs_slave_dpn.o
 obj-$(CONFIG_SOUNDWIRE) += soundwire-bus.o
 
+soundwire-generic-allocation-objs := generic_bandwidth_allocation.o
+obj-$(CONFIG_SOUNDWIRE_GENERIC_ALLOCATION) += soundwire-generic-allocation.o
+
 ifdef CONFIG_DEBUG_FS
 soundwire-bus-y += debugfs.o
 endif
diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index d808f0256ba0..11c5a402afcd 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -61,6 +61,12 @@ int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
 		return -EINVAL;
 	}
 
+	if (!bus->compute_params) {
+		dev_err(bus->dev,
+			"Bandwidth allocation not configured, compute_params no set\n");
+		return -EINVAL;
+	}
+
 	mutex_init(&bus->msg_lock);
 	mutex_init(&bus->bus_lock);
 	INIT_LIST_HEAD(&bus->slaves);
diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 82484f741168..d2fda8c69f0d 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -69,6 +69,7 @@ struct sdw_msg {
 };
 
 #define SDW_DOUBLE_RATE_FACTOR		2
+#define SDW_STRM_RATE_GROUPING		1
 
 extern int sdw_rows[SDW_FRAME_ROWS];
 extern int sdw_cols[SDW_FRAME_COLS];
@@ -154,9 +155,50 @@ int sdw_transfer_defer(struct sdw_bus *bus, struct sdw_msg *msg,
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
 
diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
new file mode 100644
index 000000000000..6088775b67a5
--- /dev/null
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -0,0 +1,427 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+// Copyright(c) 2015-2020 Intel Corporation.
+
+/*
+ * Bandwidth management algorithm based on 2^n gears
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/module.h>
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
+	unsigned int slave_total_ch;
+
+	port_bo = t_data->block_offset;
+
+	list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
+		rate = m_rt->stream->params.rate;
+		bps = m_rt->stream->params.bps;
+		sample_int = (m_rt->bus->params.curr_dr_freq / rate);
+		slave_total_ch = 0;
+
+		list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
+			ch = sdw_ch_mask_to_ch(p_rt->ch_mask);
+
+			sdw_fill_xport_params(&p_rt->transport_params,
+					      p_rt->num, false,
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
+			slave_total_ch += ch;
+		}
+
+		if (m_rt->direction == SDW_DATA_DIR_TX &&
+		    m_rt->ch_count == slave_total_ch) {
+			/*
+			 * Slave devices were configured to access all channels
+			 * of the stream, which indicates that they operate in
+			 * 'mirror mode'. Make sure we reset the port offset for
+			 * the next device in the list
+			 */
+			port_bo = t_data->block_offset;
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
+				      false, SDW_BLK_GRP_CNT_1, sample_int,
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
+			unsigned int *rates;
+
+			group->max_size += 1;
+			rates = krealloc(group->rates,
+					 (sizeof(int) * group->max_size),
+					 GFP_KERNEL);
+			if (!rates)
+				return -ENOMEM;
+			group->rates = rates;
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
+			if (ret < 0) {
+				kfree(group->rates);
+				return ret;
+			}
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
+		return ret;
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
+		goto free_params;
+
+	_sdw_compute_port_params(bus, params, group.count);
+
+free_params:
+	kfree(params);
+out:
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
+
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("SoundWire Generic Bandwidth Allocation");
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index e047910d73f5..1211d114ff59 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1318,6 +1318,9 @@ static int intel_master_probe(struct platform_device *pdev)
 	/* set driver data, accessed by snd_soc_dai_get_drvdata() */
 	dev_set_drvdata(dev, cdns);
 
+	/* use generic bandwidth allocation algorithm */
+	sdw->cdns.bus.compute_params = sdw_compute_params;
+
 	ret = sdw_bus_master_add(bus, dev, dev->fwnode);
 	if (ret) {
 		dev_err(dev, "sdw_bus_master_add fail: %d\n", ret);
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index b8b1973e3ee2..f3219d1fa63b 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -25,8 +25,10 @@
 int sdw_rows[SDW_FRAME_ROWS] = {48, 50, 60, 64, 75, 80, 125, 147,
 			96, 100, 120, 128, 150, 160, 250, 0,
 			192, 200, 240, 256, 72, 144, 90, 180};
+EXPORT_SYMBOL(sdw_rows);
 
 int sdw_cols[SDW_FRAME_COLS] = {2, 4, 6, 8, 10, 12, 14, 16};
+EXPORT_SYMBOL(sdw_cols);
 
 int sdw_find_col_index(int col)
 {
@@ -1782,6 +1784,16 @@ static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 		bus->params.bandwidth -= m_rt->stream->params.rate *
 			m_rt->ch_count * m_rt->stream->params.bps;
 
+		/* Compute params */
+		if (bus->compute_params) {
+			ret = bus->compute_params(bus);
+			if (ret < 0) {
+				dev_err(bus->dev, "Compute params failed: %d",
+					ret);
+				return ret;
+			}
+		}
+
 		/* Program params */
 		ret = sdw_program_params(bus, false);
 		if (ret < 0) {
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 1e9010c139f0..3fa1b18f7f97 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -955,6 +955,9 @@ struct sdw_stream_runtime {
 
 struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name);
 void sdw_release_stream(struct sdw_stream_runtime *stream);
+
+int sdw_compute_params(struct sdw_bus *bus);
+
 int sdw_stream_add_master(struct sdw_bus *bus,
 		struct sdw_stream_config *stream_config,
 		struct sdw_port_config *port_config,
-- 
2.17.1

