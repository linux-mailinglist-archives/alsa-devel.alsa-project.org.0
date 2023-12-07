Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23349809578
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 23:36:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 741C3827;
	Thu,  7 Dec 2023 23:35:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 741C3827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701988561;
	bh=yvPVSo4dUlunZ95mMAgcNg9dcTw5NxrsgcFRIuu5alA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UgHjIKydSgfPe+apn7E0jevueI569D0UHZ0rntgBVsE8tvbRX9IFD5qXkNAafaVco
	 yU2tqFZ5GaoEy6lqCkp4+wbRvYG2saMJURP3KhND1MPqHztg+j6boLUyrs/gUexsnF
	 soqUKNFtIX6aFxSZYfkXeoDSt1MmgNiGEy/3B6ns=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C932F805B3; Thu,  7 Dec 2023 23:35:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 35737F805D9;
	Thu,  7 Dec 2023 23:35:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5908DF80579; Thu,  7 Dec 2023 23:35:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AD35F8025A
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 23:30:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AD35F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TGq0FGVX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701988217; x=1733524217;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yvPVSo4dUlunZ95mMAgcNg9dcTw5NxrsgcFRIuu5alA=;
  b=TGq0FGVXi1+04k25TuBkND9hbGA1rtWC9UfsV24RtwcGsROZDOcAxsJl
   IYHZBWiHIL/yt0bFeogjQuiifEVg1EDxNIspmHyZJIjN6Pr05nYPTOq+J
   Pp0I5ZKZeqc/3UVwKvzY/uFQ0G7eLX5qqwxw2cVVDySxhD/82vsrLLdJc
   mM6jVCjcJbOLiM3quu430a4+uLeLQmrquJr9ovNEBJQfAMYkqiPwuDxHA
   s+5AIK+vi7h2UqrY0Mu69KtVaNOFP4A8P9MPFVWK5XUpg4FZUhr2GwcM3
   5F8Ls6eEUX4Yso4yOmkGQyXMlRUFT7f2a3PSTJKa796uXyw+X6ms84hj1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480516620"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="480516620"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895307476"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="895307476"
Received: from hrcolco-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.159])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:11 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH 05/16] soundwire: stream: special-case the bus
 compute_params() routine
Date: Thu,  7 Dec 2023 16:29:33 -0600
Message-Id: <20231207222944.663893-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KAYZPA4DIOYP4ZH5MEX6TCDNM6ZS3D7N
X-Message-ID-Hash: KAYZPA4DIOYP4ZH5MEX6TCDNM6ZS3D7N
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KAYZPA4DIOYP4ZH5MEX6TCDNM6ZS3D7N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For BPT support, we want to allocate the entire audio payload and
bypass the allocation based on PCM/PDM parameters.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/amd_manager.c               |  2 +-
 .../soundwire/generic_bandwidth_allocation.c  | 84 ++++++++++++++++++-
 drivers/soundwire/qcom.c                      |  2 +-
 drivers/soundwire/stream.c                    |  6 +-
 include/linux/soundwire/sdw.h                 |  4 +-
 5 files changed, 91 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index a3b1f4e6f0f9..96480f6ddd3f 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -389,7 +389,7 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
 	return slave_stat;
 }
 
-static int amd_sdw_compute_params(struct sdw_bus *bus)
+static int amd_sdw_compute_params(struct sdw_bus *bus, bool bpt_stream)
 {
 	struct sdw_transport_data t_data = {0};
 	struct sdw_master_runtime *m_rt;
diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index c70a63d009ae..04083122acde 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -81,6 +81,82 @@ void sdw_compute_slave_ports(struct sdw_master_runtime *m_rt,
 }
 EXPORT_SYMBOL(sdw_compute_slave_ports);
 
+static void sdw_compute_slave_dp0_ports(struct sdw_master_runtime *m_rt,
+					struct sdw_transport_data *t_data)
+{
+	struct sdw_slave_runtime *s_rt = NULL;
+	struct sdw_port_runtime *p_rt;
+	int port_bo;
+	int sample_int;
+	unsigned int bps;
+
+	port_bo = t_data->block_offset;
+	bps = m_rt->bus->params.col - 1;
+	sample_int = m_rt->bus->params.col;
+
+	list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
+		list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
+			sdw_fill_xport_params(&p_rt->transport_params,
+					      p_rt->num, false,
+					      SDW_BLK_GRP_CNT_1,
+					      sample_int, port_bo, port_bo >> 8,
+					      t_data->hstart,
+					      t_data->hstop,
+					      SDW_BLK_PKG_PER_PORT, 0x0);
+
+			sdw_fill_port_params(&p_rt->port_params,
+					     p_rt->num, bps,
+					     SDW_PORT_FLOW_MODE_ISOCH,
+					     SDW_PORT_DATA_MODE_NORMAL);
+		}
+	}
+}
+
+static void sdw_compute_dp0_master_ports(struct sdw_master_runtime *m_rt)
+{
+	struct sdw_transport_data t_data = {0};
+	struct sdw_port_runtime *p_rt;
+	struct sdw_bus *bus = m_rt->bus;
+	unsigned int bps;
+	int sample_int;
+	int port_bo;
+	int hstart;
+	int hstop;
+
+	bps = bus->params.col - 1;
+	sample_int = bus->params.col;
+	hstart = 1;
+	hstop = bus->params.col - 1;
+	port_bo = 0;
+
+	t_data.hstart = hstart;
+	t_data.hstop = hstop;
+	t_data.block_offset = port_bo;
+	t_data.sub_block_offset = 0;
+
+	list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
+		sdw_fill_xport_params(&p_rt->transport_params, p_rt->num,
+				      false, SDW_BLK_GRP_CNT_1, sample_int,
+				      port_bo, port_bo >> 8, hstart, hstop,
+				      SDW_BLK_PKG_PER_PORT, 0x0);
+
+		sdw_fill_port_params(&p_rt->port_params,
+				     p_rt->num, bps,
+				     SDW_PORT_FLOW_MODE_ISOCH,
+				     SDW_PORT_DATA_MODE_NORMAL);
+	}
+
+	sdw_compute_slave_dp0_ports(m_rt, &t_data);
+}
+
+static void sdw_compute_dp0_port_params(struct sdw_bus *bus)
+{
+	struct sdw_master_runtime *m_rt;
+
+	list_for_each_entry(m_rt, &bus->m_rt_list, bus_node)
+		sdw_compute_dp0_master_ports(m_rt);
+}
+
 static void sdw_compute_master_ports(struct sdw_master_runtime *m_rt,
 				     struct sdw_group_params *params,
 				     int port_bo, int hstop)
@@ -392,8 +468,9 @@ static int sdw_compute_bus_params(struct sdw_bus *bus)
  * sdw_compute_params: Compute bus, transport and port parameters
  *
  * @bus: SDW Bus instance
+ * @bpt_stream: boolean to conditionally use dedicated bit allocation
  */
-int sdw_compute_params(struct sdw_bus *bus)
+int sdw_compute_params(struct sdw_bus *bus, bool bpt_stream)
 {
 	int ret;
 
@@ -402,6 +479,11 @@ int sdw_compute_params(struct sdw_bus *bus)
 	if (ret < 0)
 		return ret;
 
+	if (bpt_stream) {
+		sdw_compute_dp0_port_params(bus);
+		return 0;
+	}
+
 	/* Compute transport and port params */
 	ret = sdw_compute_port_params(bus);
 	if (ret < 0) {
diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 3c4d6debab1f..8dd3319e8e40 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -1060,7 +1060,7 @@ static const struct sdw_master_ops qcom_swrm_ops = {
 	.pre_bank_switch = qcom_swrm_pre_bank_switch,
 };
 
-static int qcom_swrm_compute_params(struct sdw_bus *bus)
+static int qcom_swrm_compute_params(struct sdw_bus *bus, bool bpt_stream)
 {
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
 	struct sdw_master_runtime *m_rt;
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index c1e3bb897fb9..16ee58d4b7a2 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1356,6 +1356,7 @@ static void sdw_release_bus_lock(struct sdw_stream_runtime *stream)
 static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
 			       bool update_params)
 {
+	bool bpt_stream = (stream->type == SDW_STREAM_BPT) ? true : false;
 	struct sdw_master_runtime *m_rt;
 	struct sdw_bus *bus;
 	struct sdw_master_prop *prop;
@@ -1382,7 +1383,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
 
 			/* Compute params */
 			if (bus->compute_params) {
-				ret = bus->compute_params(bus);
+				ret = bus->compute_params(bus, bpt_stream);
 				if (ret < 0) {
 					dev_err(bus->dev, "Compute params failed: %d\n",
 						ret);
@@ -1640,6 +1641,7 @@ EXPORT_SYMBOL(sdw_disable_stream);
 
 static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 {
+	bool bpt_stream = (stream->type == SDW_STREAM_BPT) ? true : false;
 	struct sdw_master_runtime *m_rt;
 	struct sdw_bus *bus;
 	int ret = 0;
@@ -1660,7 +1662,7 @@ static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 
 		/* Compute params */
 		if (bus->compute_params) {
-			ret = bus->compute_params(bus);
+			ret = bus->compute_params(bus, bpt_stream);
 			if (ret < 0) {
 				dev_err(bus->dev, "Compute params failed: %d\n",
 					ret);
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 9f04f3ad044f..1dda65d91bad 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -918,7 +918,7 @@ struct sdw_bus {
 	struct lock_class_key bus_lock_key;
 	struct mutex msg_lock;
 	struct lock_class_key msg_lock_key;
-	int (*compute_params)(struct sdw_bus *bus);
+	int (*compute_params)(struct sdw_bus *bus, bool bpt_stream);
 	const struct sdw_master_ops *ops;
 	const struct sdw_master_port_ops *port_ops;
 	struct sdw_bus_params params;
@@ -1030,7 +1030,7 @@ struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name,
 					    enum sdw_stream_type type);
 void sdw_release_stream(struct sdw_stream_runtime *stream);
 
-int sdw_compute_params(struct sdw_bus *bus);
+int sdw_compute_params(struct sdw_bus *bus, bool bpt_stream);
 
 int sdw_stream_add_master(struct sdw_bus *bus,
 		struct sdw_stream_config *stream_config,
-- 
2.39.2

