Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BBA624F96
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 02:31:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5D561679;
	Fri, 11 Nov 2022 02:30:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5D561679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668130278;
	bh=y7Jo51AjZuYZn7HB9q/LeKKCw5Dcg+G+BQMTISHpqM0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DyDpP75MYl4bSyw5VtDqnjeU2PMSzjUnFd+N2TCB12L4yKvhrAN/NUruTLOgIYKm6
	 Z1ndONmU+fA2oAqMRU2kEQyZJU6JxFeYi+zyW4o5CyrB1lMsIi47ivbw9Tjurg+Tum
	 0ozbrl/CC6uUd4LHgT0MOWJDq4iYpS9rckFY5rmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 999DAF80548;
	Fri, 11 Nov 2022 02:30:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26454F8021D; Fri, 11 Nov 2022 02:30:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71B91F8021D
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 02:29:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71B91F8021D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZVb7GPRo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668130194; x=1699666194;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y7Jo51AjZuYZn7HB9q/LeKKCw5Dcg+G+BQMTISHpqM0=;
 b=ZVb7GPRogJS0APYy3C53xfOIfA3fhXH3zl3FasUhWkdXDesKobsj/T7Y
 1CEgHMh+6mYM2d73GqawGQa5KR9O1Yv3dycSmzr15A1k6Zpi0z4EiBwl1
 xOQorFdImaPsUAr7oWK3GLbEzQxp84jnI6pICuCUKb2ZWulroZyQSF8eu
 2pQoTiG4LApwG67DkHX9WWRcFXOi6F6NBLP1VEs2GFYoyQ+zUBVVEyUvB
 wPmMZ8YZXJvyfOFqC+tjzIEmdZtN1qVI3D8XoKbk3MnNuGrmk+MDiTOw9
 oBDGgMWVbqwfwSHFTa17forbsaHkTKFnwiRCHoJya6Qe9p6uWYysKEGxZ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="397789718"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="397789718"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 17:29:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="780003228"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="780003228"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 17:29:49 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 2/7] soundwire: intel: add debugfs callbacks in hw_ops
Date: Fri, 11 Nov 2022 09:31:29 +0800
Message-Id: <20221111013135.38289-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111013135.38289-1-yung-chuan.liao@linux.intel.com>
References: <20221111013135.38289-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 bard.liao@intel.com, linux-kernel@vger.kernel.org
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

No functionality change, only add indirection for debugfs helpers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c           |  7 +++++--
 drivers/soundwire/intel.h           | 16 ++++++++++++++++
 include/linux/soundwire/sdw_intel.h |  5 +++++
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index f88319f8ded4..914f2fb43721 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1423,6 +1423,9 @@ static int intel_stop_bus(struct sdw_intel *sdw, bool clock_stop)
 }
 
 const struct sdw_intel_hw_ops sdw_intel_cnl_hw_ops = {
+	.debugfs_init = intel_debugfs_init,
+	.debugfs_exit = intel_debugfs_exit,
+
 	.pre_bank_switch = intel_pre_bank_switch,
 	.post_bank_switch = intel_post_bank_switch,
 };
@@ -1614,7 +1617,7 @@ int intel_link_startup(struct auxiliary_device *auxdev)
 		goto err_power_up;
 	}
 
-	intel_debugfs_init(sdw);
+	sdw_intel_debugfs_init(sdw);
 
 	/* start bus */
 	ret = intel_start_bus(sdw);
@@ -1685,7 +1688,7 @@ static void intel_link_remove(struct auxiliary_device *auxdev)
 	 * SDW_INTEL_CLK_STOP_NOT_ALLOWED
 	 */
 	if (!bus->prop.hw_disabled) {
-		intel_debugfs_exit(sdw);
+		sdw_intel_debugfs_exit(sdw);
 		sdw_cdns_enable_interrupt(cdns, false);
 	}
 	sdw_bus_master_delete(bus);
diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 3170df76b411..5548b8451d01 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -61,4 +61,20 @@ struct sdw_intel_link_dev {
 #define auxiliary_dev_to_sdw_intel_link_dev(auxiliary_dev) \
 	container_of(auxiliary_dev, struct sdw_intel_link_dev, auxdev)
 
+#define SDW_INTEL_CHECK_OPS(sdw, cb)	((sdw) && (sdw)->link_res && (sdw)->link_res->hw_ops && \
+					 (sdw)->link_res->hw_ops->cb)
+#define SDW_INTEL_OPS(sdw, cb)		((sdw)->link_res->hw_ops->cb)
+
+static inline void sdw_intel_debugfs_init(struct sdw_intel *sdw)
+{
+	if (SDW_INTEL_CHECK_OPS(sdw, debugfs_init))
+		SDW_INTEL_OPS(sdw, debugfs_init)(sdw);
+}
+
+static inline void sdw_intel_debugfs_exit(struct sdw_intel *sdw)
+{
+	if (SDW_INTEL_CHECK_OPS(sdw, debugfs_exit))
+		SDW_INTEL_OPS(sdw, debugfs_exit)(sdw);
+}
+
 #endif /* __SDW_INTEL_LOCAL_H */
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 2dbe34b41ef1..211924e4ebf2 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -297,10 +297,15 @@ irqreturn_t sdw_intel_thread(int irq, void *dev_id);
 struct sdw_intel;
 
 /* struct intel_sdw_hw_ops - SoundWire ops for Intel platforms.
+ * @debugfs_init: initialize all debugfs capabilities
+ * @debugfs_exit: close and cleanup debugfs capabilities
  * @pre_bank_switch: helper for bus management
  * @post_bank_switch: helper for bus management
  */
 struct sdw_intel_hw_ops {
+	void (*debugfs_init)(struct sdw_intel *sdw);
+	void (*debugfs_exit)(struct sdw_intel *sdw);
+
 	int (*pre_bank_switch)(struct sdw_intel *sdw);
 	int (*post_bank_switch)(struct sdw_intel *sdw);
 };
-- 
2.25.1

