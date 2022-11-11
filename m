Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91859624F9E
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 02:32:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A99A1670;
	Fri, 11 Nov 2022 02:31:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A99A1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668130359;
	bh=9PyiT4xs21Bv2WDv7eYaoCUfVE+lPLCmDaq/TH3rDRo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RjXoA7mVy4yDKAklixvWY00CnXHLaGPtiERL940bM0c+1pOlQpJ4Ar2hNJr8l9MRF
	 BPoJntZktPsEDjIi1FffK9AFyJZ2PPuMqmq+NwZbgMWxxFkEPYOvOK8GQ8uQDeDcNL
	 Aj2cqoyb95PqRf0kYWato6jVBJKar28zARSCHsMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DBE7F8057E;
	Fri, 11 Nov 2022 02:30:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F103F80570; Fri, 11 Nov 2022 02:30:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59924F80163
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 02:29:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59924F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VogXdEFR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668130200; x=1699666200;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9PyiT4xs21Bv2WDv7eYaoCUfVE+lPLCmDaq/TH3rDRo=;
 b=VogXdEFRMVmDXoxxTvEUcp4YlTD0Ly541JphCGp0DFqhnXLhfzyjXY9Q
 3E5qDejkKRet/5E2J/a5NnfRsXkPA+3qmgnxPKgFsy0cB8bE5wONuEHDW
 5p3cTYmo4vmn/yB/aoF5s8PurU2wOonP7AFtNYqKkhN/ylQn35o4GDxWa
 PDBg5DFEjOIiIHGzQlxQzCXp+HYBDJW48V2PaziarxB/hBvtiGEw/GLvr
 qdgZoGHRd0rJjGR5fG9Mwisix2cgXeL4U+zfB3R1j3CUXxJLPPOHyhyXG
 iBZ40WPKQZ4lP7UXg4jT64OKRvK991JkvsHRGbglPObqVcRu9ZtgQv7dL g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="397789745"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="397789745"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 17:29:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="780003268"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="780003268"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 17:29:56 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 6/7] soundwire: intel: add in-band wake callbacks in hw_ops
Date: Fri, 11 Nov 2022 09:31:33 +0800
Message-Id: <20221111013135.38289-7-yung-chuan.liao@linux.intel.com>
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

No functionality change, only add indirection for in-band wake
management helpers.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c           | 11 +++++++----
 drivers/soundwire/intel.h           | 13 +++++++++++++
 include/linux/soundwire/sdw_intel.h |  5 +++++
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 2320f1b8a2d1..ea6479b4010d 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1437,6 +1437,9 @@ const struct sdw_intel_hw_ops sdw_intel_cnl_hw_ops = {
 	.link_power_up = intel_link_power_up,
 	.link_power_down = intel_link_power_down,
 
+	.shim_check_wake = intel_shim_check_wake,
+	.shim_wake = intel_shim_wake,
+
 	.pre_bank_switch = intel_pre_bank_switch,
 	.post_bank_switch = intel_post_bank_switch,
 };
@@ -1720,11 +1723,11 @@ int intel_link_process_wakeen_event(struct auxiliary_device *auxdev)
 		return 0;
 	}
 
-	if (!intel_shim_check_wake(sdw))
+	if (!sdw_intel_shim_check_wake(sdw))
 		return 0;
 
 	/* disable WAKEEN interrupt ASAP to prevent interrupt flood */
-	intel_shim_wake(sdw, false);
+	sdw_intel_shim_wake(sdw, false);
 
 	/*
 	 * resume the Master, which will generate a bus reset and result in
@@ -1852,7 +1855,7 @@ static int __maybe_unused intel_suspend(struct device *dev)
 				 */
 				dev_err(dev, "%s: invalid config: parent is suspended\n", __func__);
 			} else {
-				intel_shim_wake(sdw, false);
+				sdw_intel_shim_wake(sdw, false);
 			}
 		}
 
@@ -1987,7 +1990,7 @@ static int __maybe_unused intel_resume_runtime(struct device *dev)
 	}
 
 	/* unconditionally disable WAKEEN interrupt */
-	intel_shim_wake(sdw, false);
+	sdw_intel_shim_wake(sdw, false);
 
 	clock_stop_quirks = sdw->link_res->clock_stop_quirks;
 
diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 0f63e7584132..9ac3397757a0 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -132,4 +132,17 @@ static inline int sdw_intel_link_power_down(struct sdw_intel *sdw)
 	return -ENOTSUPP;
 }
 
+static inline int sdw_intel_shim_check_wake(struct sdw_intel *sdw)
+{
+	if (SDW_INTEL_CHECK_OPS(sdw, shim_check_wake))
+		return SDW_INTEL_OPS(sdw, shim_check_wake)(sdw);
+	return -ENOTSUPP;
+}
+
+static inline void sdw_intel_shim_wake(struct sdw_intel *sdw, bool wake_enable)
+{
+	if (SDW_INTEL_CHECK_OPS(sdw, shim_wake))
+		SDW_INTEL_OPS(sdw, shim_wake)(sdw, wake_enable);
+}
+
 #endif /* __SDW_INTEL_LOCAL_H */
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 81430201b8b9..0942cd464095 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -307,6 +307,8 @@ struct sdw_intel;
  * @stop_bus: stop all bus
  * @link_power_up: power-up using chip-specific helpers
  * @link_power_down: power-down with chip-specific helpers
+ * @shim_check_wake: check if a wake was received
+ * @shim_wake: enable/disable in-band wake management
  * @pre_bank_switch: helper for bus management
  * @post_bank_switch: helper for bus management
  */
@@ -325,6 +327,9 @@ struct sdw_intel_hw_ops {
 	int (*link_power_up)(struct sdw_intel *sdw);
 	int (*link_power_down)(struct sdw_intel *sdw);
 
+	int  (*shim_check_wake)(struct sdw_intel *sdw);
+	void (*shim_wake)(struct sdw_intel *sdw, bool wake_enable);
+
 	int (*pre_bank_switch)(struct sdw_intel *sdw);
 	int (*post_bank_switch)(struct sdw_intel *sdw);
 };
-- 
2.25.1

