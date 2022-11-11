Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 031C8624F9D
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 02:32:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 873511664;
	Fri, 11 Nov 2022 02:31:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 873511664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668130348;
	bh=R36o+T2mIWGk1g7hDAP87b/H+omxQnT6D5n2NJUDimE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LiJUDDIC6Lv/X/LlCnW94ErOvB8PL3qdam99dueeDhtnN9C66zbGymXxj/4qLJ0iI
	 mF9+kjTlYggaQv+KIZ3/eWEY/tQ8VJB/ZWD4SF1VHjuhD3L6C23iVpRSELyT7uS0NF
	 WRDe9I6BSUag3YYwLiDLpgZUL6Hq7/vTDn2Yjhpc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5370F8057A;
	Fri, 11 Nov 2022 02:30:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B16D8F8056F; Fri, 11 Nov 2022 02:30:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2C8BF80162
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 02:29:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2C8BF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="J6vUwCrP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668130196; x=1699666196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=R36o+T2mIWGk1g7hDAP87b/H+omxQnT6D5n2NJUDimE=;
 b=J6vUwCrPjaPJdILB9gQ0VrYVWoSOYRMTTITQS/tlDBzBTE5lFqrKj4F1
 neuA/noNdm+hPn6FpQ+JgU0ICBHNtrBa/qolnFWegReALkZa9AJuwQqDj
 P33zx1llUL3RpBcG2GdD4gv1AH3/uHBw9Hpn/pvPINUJuAkOG8KcMLZxM
 77j5wK22mqv+JDwCIqYKC0tGiuMYfrsn/e5TjrW3qtMJg9b9WEnNuX55U
 7UQZTpchktC1XPUEO62oIVwptjwb4bZGshkailOkLUgKfouJ7XMF3LIZ+
 Utg+2Qg1dmVFNQtRDGXOR804R5QkIr2I+V9RnRWtUi2jjRqtMKaJsOOs3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="397789724"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="397789724"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 17:29:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="780003235"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="780003235"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 17:29:50 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 3/7] soundwire: intel: add register_dai callback in hw_ops
Date: Fri, 11 Nov 2022 09:31:30 +0800
Message-Id: <20221111013135.38289-4-yung-chuan.liao@linux.intel.com>
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

No functionality change, only add indirection for DAI registration
helper.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c           | 4 +++-
 drivers/soundwire/intel.h           | 7 +++++++
 include/linux/soundwire/sdw_intel.h | 3 +++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 914f2fb43721..0496eb0d6084 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1426,6 +1426,8 @@ const struct sdw_intel_hw_ops sdw_intel_cnl_hw_ops = {
 	.debugfs_init = intel_debugfs_init,
 	.debugfs_exit = intel_debugfs_exit,
 
+	.register_dai = intel_register_dai,
+
 	.pre_bank_switch = intel_pre_bank_switch,
 	.post_bank_switch = intel_post_bank_switch,
 };
@@ -1611,7 +1613,7 @@ int intel_link_startup(struct auxiliary_device *auxdev)
 		goto err_init;
 
 	/* Register DAIs */
-	ret = intel_register_dai(sdw);
+	ret = sdw_intel_register_dai(sdw);
 	if (ret) {
 		dev_err(dev, "DAI registration failed: %d\n", ret);
 		goto err_power_up;
diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 5548b8451d01..0521cab311a3 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -77,4 +77,11 @@ static inline void sdw_intel_debugfs_exit(struct sdw_intel *sdw)
 		SDW_INTEL_OPS(sdw, debugfs_exit)(sdw);
 }
 
+static inline int sdw_intel_register_dai(struct sdw_intel *sdw)
+{
+	if (SDW_INTEL_CHECK_OPS(sdw, register_dai))
+		return SDW_INTEL_OPS(sdw, register_dai)(sdw);
+	return -ENOTSUPP;
+}
+
 #endif /* __SDW_INTEL_LOCAL_H */
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 211924e4ebf2..5be63d4fe62e 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -299,6 +299,7 @@ struct sdw_intel;
 /* struct intel_sdw_hw_ops - SoundWire ops for Intel platforms.
  * @debugfs_init: initialize all debugfs capabilities
  * @debugfs_exit: close and cleanup debugfs capabilities
+ * @register_dai: read all PDI information and register DAIs
  * @pre_bank_switch: helper for bus management
  * @post_bank_switch: helper for bus management
  */
@@ -306,6 +307,8 @@ struct sdw_intel_hw_ops {
 	void (*debugfs_init)(struct sdw_intel *sdw);
 	void (*debugfs_exit)(struct sdw_intel *sdw);
 
+	int (*register_dai)(struct sdw_intel *sdw);
+
 	int (*pre_bank_switch)(struct sdw_intel *sdw);
 	int (*post_bank_switch)(struct sdw_intel *sdw);
 };
-- 
2.25.1

