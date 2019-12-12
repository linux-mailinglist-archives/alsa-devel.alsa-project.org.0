Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AD411C2C8
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 02:54:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 734C41691;
	Thu, 12 Dec 2019 02:53:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 734C41691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576115667;
	bh=Vd+6GHCqcaQPdzPmK268q5yNAsGHt1Y5rv0XPhOnNjc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FhAbmvWAYsNd7+yEx4Oy6x3ugqnfwJzmo2KNPa+bJCbNrD8mRdRxprQkjhJ8FIRH9
	 iLKiyN6nWO84wMYwRPD7JTkfT98zGzUcHWaefVGuNLw3K7sUIbWn9//TdJ6PaZ+Fek
	 CNaqFa+hQLcwhNZcwmWcsBfExMUTdpuMa/Ai5Yho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E606F802E0;
	Thu, 12 Dec 2019 02:45:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5080DF80271; Thu, 12 Dec 2019 02:45:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3203F80260
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 02:45:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3203F80260
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2019 17:45:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,303,1571727600"; d="scan'208";a="296446135"
Received: from gjang-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.207.37])
 by orsmga001.jf.intel.com with ESMTP; 11 Dec 2019 17:45:30 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 11 Dec 2019 19:45:07 -0600
Message-Id: <20191212014507.28050-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191212014507.28050-1-pierre-louis.bossart@linux.intel.com>
References: <20191212014507.28050-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v5 11/11] soundwire: intel: add clock stop
	quirks
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

Due to power rail dependencies, the SoundWire Master driver cannot
make decisions on its own when entering pm runtime suspend.

Add quirk mask for each link, so that the SOF parent driver can inform
the SoundWire master driver of the desired behavior:
a) leave clock on
b) power-off instead of clock stop
c) power-off if all devices cannot generate wakes
d) force bus reset on clock restart

Note that for now the interface with the SOF driver relies on a single
mask for all links. If needed, the interface might be modified at a
later point to provide more freedom. The code at the lower level does
not assume any commonality between links.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/linux/soundwire/sdw_intel.h | 37 +++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 45fa6d93197f..93b83bdf8035 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -59,6 +59,40 @@ struct sdw_intel_acpi_info {
 
 struct sdw_intel_link_res;
 
+/* Intel clock-stop/pm_runtime quirk definitions */
+
+/*
+ * Force the clock to remain on during pm_runtime suspend. This might
+ * be needed if Slave devices do not have an alternate clock source or
+ * if the latency requirements are very strict.
+ */
+#define SDW_INTEL_CLK_STOP_NOT_ALLOWED		BIT(0)
+
+/*
+ * Stop the bus during pm_runtime suspend. If set, a complete bus
+ * reset and re-enumeration will be performed when the bus
+ * restarts. This mode shall not be used if Slave devices can generate
+ * in-band wakes.
+ */
+#define SDW_INTEL_CLK_STOP_TEARDOWN		BIT(1)
+
+/*
+ * Stop the bus during pm_suspend if Slaves are not wake capable
+ * (e.g. speaker amplifiers). The clock-stop mode is typically
+ * slightly higher power than when the IP is completely powered-off.
+ */
+#define SDW_INTEL_CLK_STOP_WAKE_CAPABLE_ONLY	BIT(2)
+
+/*
+ * Require a bus reset (and complete re-enumeration) when exiting
+ * clock stop modes. This may be needed if the controller power was
+ * turned off and all context lost. This quirk shall not be used if a
+ * Slave device needs to remain enumerated and keep its context,
+ * e.g. to provide the reasons for the wake, report acoustic events or
+ * pass a history buffer.
+ */
+#define SDW_INTEL_CLK_STOP_BUS_RESET		BIT(3)
+
 /**
  * struct sdw_intel_ctx - context allocated by the controller
  * driver probe
@@ -97,6 +131,8 @@ struct sdw_intel_ctx {
  * @link_mask: bit-wise mask listing links selected by the DSP driver
  * This mask may be a subset of the one reported by the controller since
  * machine-specific quirks are handled in the DSP driver.
+ * @clock_stop_quirks: mask array of possible behaviors requested by the
+ * DSP driver. The quirks are common for all links for now.
  */
 struct sdw_intel_res {
 	int count;
@@ -107,6 +143,7 @@ struct sdw_intel_res {
 	const struct sdw_intel_ops *ops;
 	struct device *dev;
 	u32 link_mask;
+	u32 clock_stop_quirks;
 };
 
 /*
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
