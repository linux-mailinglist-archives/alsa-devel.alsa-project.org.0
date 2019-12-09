Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFF0117C0F
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 01:04:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD28E1663;
	Tue, 10 Dec 2019 01:03:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD28E1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575936282;
	bh=6lC8vbe7lSXs2+42IOOwaUVzp4X1TpaKtBb85ZAcsjQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JwPvuJj9xri5MNsmtGtMrdYJBhsVlT6wzWuA486Z3B7LPK0WfxL+AnUen+cI3d80w
	 lGbpFABKlj6VlVI+Mlf5HgsEnByu3dpMisUJBg5Xy5yIy+lJhnB6BKfcrW8waxLh3Y
	 fsZZO5tWcnCQOeiK9NvesvnvO97nFQqy5/nKMmiU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9D73F802E9;
	Tue, 10 Dec 2019 00:56:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBCC7F8028B; Tue, 10 Dec 2019 00:55:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE2FBF80279
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 00:55:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE2FBF80279
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 15:55:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,297,1571727600"; d="scan'208";a="210273701"
Received: from bbower-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.65.172])
 by fmsmga008.fm.intel.com with ESMTP; 09 Dec 2019 15:55:46 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 17:55:19 -0600
Message-Id: <20191209235520.18727-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191209235520.18727-1-pierre-louis.bossart@linux.intel.com>
References: <20191209235520.18727-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH v4 11/11] soundwire: intel: add clock stop
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
index 4336bc8e3d83..9976db392faf 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -57,6 +57,40 @@ struct sdw_intel_acpi_info {
 
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
@@ -95,6 +129,8 @@ struct sdw_intel_ctx {
  * @link_mask: bit-wise mask listing links selected by the DSP driver
  * This mask may be a subset of the one reported by the controller since
  * machine-specific quirks are handled in the DSP driver.
+ * @clock_stop_quirks: mask array of possible behaviors requested by the
+ * DSP driver. The quirks are common for all links for now.
  */
 struct sdw_intel_res {
 	int count;
@@ -105,6 +141,7 @@ struct sdw_intel_res {
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
