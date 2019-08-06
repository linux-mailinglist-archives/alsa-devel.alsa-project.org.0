Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B210828FB
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 03:03:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F2DE16C3;
	Tue,  6 Aug 2019 03:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F2DE16C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565053401;
	bh=DXSqOx7Jq/dhA60FhE/CJPooYtP4+bEBR2rkbQif47U=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wrl7RikmlNYoT204cK6G4Y/kJR7wEcdDv+9LmZqwWq42IPnl1Ms7IdQs5ePXkT/Pq
	 Wj56ajE+Adx2pZo6KeVDAu8d9GGrdrS1zuxiaEAv3P3q95UZ/GRPcXN1ZzjOC9flj1
	 6pploH5eMucTIp+K6PBB3ZCMkMFKsZdx6a0oLjXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2E65F80671;
	Tue,  6 Aug 2019 02:55:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A286F80638; Tue,  6 Aug 2019 02:55:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D194BF80600
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 02:55:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D194BF80600
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 17:55:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="198153181"
Received: from sahluwal-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.202.215])
 by fmsmga004.fm.intel.com with ESMTP; 05 Aug 2019 17:55:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  5 Aug 2019 19:55:14 -0500
Message-Id: <20190806005522.22642-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
References: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, Blauciak@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 Slawomir <slawomir.blauciak@intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH 09/17] soundwire: stream: remove unnecessary
	variable initializations
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

A number of variables don't need to be initialized.

In a couple of cases where we loop on a list of runtimes, the code
handling of the 'bus' variable leads to warnings that it may not be
initialized. Add a specific error case to trap such cases.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/stream.c | 64 ++++++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 26 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 75b9ad1fb1a6..8d6c13528b68 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -369,7 +369,7 @@ static int sdw_enable_disable_master_ports(struct sdw_master_runtime *m_rt,
 static int sdw_enable_disable_ports(struct sdw_master_runtime *m_rt, bool en)
 {
 	struct sdw_port_runtime *s_port, *m_port;
-	struct sdw_slave_runtime *s_rt = NULL;
+	struct sdw_slave_runtime *s_rt;
 	int ret = 0;
 
 	/* Enable/Disable Slave port(s) */
@@ -417,7 +417,7 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 				       struct sdw_port_runtime *p_rt,
 				       bool prep)
 {
-	struct completion *port_ready = NULL;
+	struct completion *port_ready;
 	struct sdw_dpn_prop *dpn_prop;
 	struct sdw_prepare_ch prep_ch;
 	unsigned int time_left;
@@ -537,7 +537,7 @@ static int sdw_prep_deprep_master_ports(struct sdw_master_runtime *m_rt,
  */
 static int sdw_prep_deprep_ports(struct sdw_master_runtime *m_rt, bool prep)
 {
-	struct sdw_slave_runtime *s_rt = NULL;
+	struct sdw_slave_runtime *s_rt;
 	struct sdw_port_runtime *p_rt;
 	int ret = 0;
 
@@ -605,7 +605,7 @@ static int sdw_notify_config(struct sdw_master_runtime *m_rt)
  */
 static int sdw_program_params(struct sdw_bus *bus)
 {
-	struct sdw_master_runtime *m_rt = NULL;
+	struct sdw_master_runtime *m_rt;
 	int ret = 0;
 
 	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
@@ -642,8 +642,8 @@ static int sdw_bank_switch(struct sdw_bus *bus, int m_rt_count)
 	int col_index, row_index;
 	bool multi_link;
 	struct sdw_msg *wr_msg;
-	u8 *wbuf = NULL;
-	int ret = 0;
+	u8 *wbuf;
+	int ret;
 	u16 addr;
 
 	wr_msg = kzalloc(sizeof(*wr_msg), GFP_KERNEL);
@@ -741,9 +741,9 @@ static int sdw_ml_sync_bank_switch(struct sdw_bus *bus)
 
 static int do_bank_switch(struct sdw_stream_runtime *stream)
 {
-	struct sdw_master_runtime *m_rt = NULL;
+	struct sdw_master_runtime *m_rt;
 	const struct sdw_master_ops *ops;
-	struct sdw_bus *bus = NULL;
+	struct sdw_bus *bus;
 	bool multi_link = false;
 	int ret = 0;
 
@@ -886,7 +886,7 @@ static struct sdw_master_runtime
 *sdw_find_master_rt(struct sdw_bus *bus,
 		    struct sdw_stream_runtime *stream)
 {
-	struct sdw_master_runtime *m_rt = NULL;
+	struct sdw_master_runtime *m_rt;
 
 	/* Retrieve Bus handle if already available */
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
@@ -955,7 +955,7 @@ static struct sdw_slave_runtime
 		    struct sdw_stream_config *stream_config,
 		    struct sdw_stream_runtime *stream)
 {
-	struct sdw_slave_runtime *s_rt = NULL;
+	struct sdw_slave_runtime *s_rt;
 
 	s_rt = kzalloc(sizeof(*s_rt), GFP_KERNEL);
 	if (!s_rt)
@@ -1261,7 +1261,7 @@ int sdw_stream_add_master(struct sdw_bus *bus,
 			  unsigned int num_ports,
 			  struct sdw_stream_runtime *stream)
 {
-	struct sdw_master_runtime *m_rt = NULL;
+	struct sdw_master_runtime *m_rt;
 	int ret;
 
 	mutex_lock(&bus->bus_lock);
@@ -1428,7 +1428,7 @@ struct sdw_dpn_prop *sdw_get_slave_dpn_prop(struct sdw_slave *slave,
  */
 static void sdw_acquire_bus_lock(struct sdw_stream_runtime *stream)
 {
-	struct sdw_master_runtime *m_rt = NULL;
+	struct sdw_master_runtime *m_rt;
 	struct sdw_bus *bus = NULL;
 
 	/* Iterate for all Master(s) in Master list */
@@ -1462,9 +1462,9 @@ static void sdw_release_bus_lock(struct sdw_stream_runtime *stream)
 
 static int _sdw_prepare_stream(struct sdw_stream_runtime *stream)
 {
-	struct sdw_master_runtime *m_rt = NULL;
+	struct sdw_master_runtime *m_rt;
 	struct sdw_bus *bus = NULL;
-	struct sdw_master_prop *prop = NULL;
+	struct sdw_master_prop *prop;
 	struct sdw_bus_params params;
 	int ret;
 
@@ -1493,6 +1493,11 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream)
 		}
 	}
 
+	if (!bus) {
+		pr_err("Configuration error in %s\n", __func__);
+		return -EINVAL;
+	}
+
 	ret = do_bank_switch(stream);
 	if (ret < 0) {
 		dev_err(bus->dev, "Bank switch failed: %d\n", ret);
@@ -1549,7 +1554,7 @@ EXPORT_SYMBOL(sdw_prepare_stream);
 
 static int _sdw_enable_stream(struct sdw_stream_runtime *stream)
 {
-	struct sdw_master_runtime *m_rt = NULL;
+	struct sdw_master_runtime *m_rt;
 	struct sdw_bus *bus = NULL;
 	int ret;
 
@@ -1573,6 +1578,11 @@ static int _sdw_enable_stream(struct sdw_stream_runtime *stream)
 		}
 	}
 
+	if (!bus) {
+		pr_err("Configuration error in %s\n", __func__);
+		return -EINVAL;
+	}
+
 	ret = do_bank_switch(stream);
 	if (ret < 0) {
 		dev_err(bus->dev, "Bank switch failed: %d\n", ret);
@@ -1592,7 +1602,7 @@ static int _sdw_enable_stream(struct sdw_stream_runtime *stream)
  */
 int sdw_enable_stream(struct sdw_stream_runtime *stream)
 {
-	int ret = 0;
+	int ret;
 
 	if (!stream) {
 		pr_err("SoundWire: Handle not found for stream\n");
@@ -1612,12 +1622,12 @@ EXPORT_SYMBOL(sdw_enable_stream);
 
 static int _sdw_disable_stream(struct sdw_stream_runtime *stream)
 {
-	struct sdw_master_runtime *m_rt = NULL;
-	struct sdw_bus *bus = NULL;
+	struct sdw_master_runtime *m_rt;
 	int ret;
 
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
-		bus = m_rt->bus;
+		struct sdw_bus *bus = m_rt->bus;
+
 		/* Disable port(s) */
 		ret = sdw_enable_disable_ports(m_rt, false);
 		if (ret < 0) {
@@ -1628,7 +1638,8 @@ static int _sdw_disable_stream(struct sdw_stream_runtime *stream)
 	stream->state = SDW_STREAM_DISABLED;
 
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
-		bus = m_rt->bus;
+		struct sdw_bus *bus = m_rt->bus;
+
 		/* Program params */
 		ret = sdw_program_params(bus);
 		if (ret < 0) {
@@ -1639,13 +1650,14 @@ static int _sdw_disable_stream(struct sdw_stream_runtime *stream)
 
 	ret = do_bank_switch(stream);
 	if (ret < 0) {
-		dev_err(bus->dev, "Bank switch failed: %d\n", ret);
+		pr_err("Bank switch failed: %d\n", ret);
 		return ret;
 	}
 
 	/* make sure alternate bank (previous current) is also disabled */
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
-		bus = m_rt->bus;
+		struct sdw_bus *bus = m_rt->bus;
+
 		/* Disable port(s) */
 		ret = sdw_enable_disable_ports(m_rt, false);
 		if (ret < 0) {
@@ -1666,7 +1678,7 @@ static int _sdw_disable_stream(struct sdw_stream_runtime *stream)
  */
 int sdw_disable_stream(struct sdw_stream_runtime *stream)
 {
-	int ret = 0;
+	int ret;
 
 	if (!stream) {
 		pr_err("SoundWire: Handle not found for stream\n");
@@ -1686,8 +1698,8 @@ EXPORT_SYMBOL(sdw_disable_stream);
 
 static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 {
-	struct sdw_master_runtime *m_rt = NULL;
-	struct sdw_bus *bus = NULL;
+	struct sdw_master_runtime *m_rt;
+	struct sdw_bus *bus;
 	int ret = 0;
 
 	list_for_each_entry(m_rt, &stream->master_list, stream_node) {
@@ -1725,7 +1737,7 @@ static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
  */
 int sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 {
-	int ret = 0;
+	int ret;
 
 	if (!stream) {
 		pr_err("SoundWire: Handle not found for stream\n");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
