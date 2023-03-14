Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A89A6B87AD
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 02:42:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7663D146D;
	Tue, 14 Mar 2023 02:42:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7663D146D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678758177;
	bh=vr8Kw7ba92HG1JhiR1fBD72PK2abpi9TsV7vewjYowA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h7FChpdKbRANgxr4MRZddwSPU4Qnv/S99/neRyiDPb1vK2QcLqiJm8igVAszrNGpc
	 sQJxaPPC/pTLLkxddojSXg2LtgMa/W18pS/4KghRZv2U+9oW3859i04quB2yh2DUup
	 Fw3iN0B2RF3BvcMJ3rWjXz77FM4kCeWJRhwO+ei0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C249F8052D;
	Tue, 14 Mar 2023 02:41:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72A8EF80482; Tue, 14 Mar 2023 02:41:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A83FF80093
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 02:41:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A83FF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KJhOEnql
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678758073; x=1710294073;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vr8Kw7ba92HG1JhiR1fBD72PK2abpi9TsV7vewjYowA=;
  b=KJhOEnql51xEzFM5bdDNQDvH87zAkHKsJC0prbvUCfm0omyqSY1H+F2R
   aiRsvWJzZMS6OPcgKJ8hDuidsI/xaDgvTTHpeveUwvc9DmRHvUUrABrSy
   n7Xpj0brjkfbly3x+n4kOQMrdTHoNIdg3ovQZxmlxJUZyLjjFR5qb9RQ4
   QUtMDUbyYhaGpm12l3kHf6DDwH8xgz+yuqKhlSU4GCy3ZPsJOfGRrXlGc
   per88VBPBW42Ez6+Uly2qvfYf1T+9AlVXcR5nChkmZMc+Atpm2BPhNYlo
   KrQzpAvFjOUv0h/VStr+rGYF8IIiiHW+Yj9OSZBabpTcCMoST4AZ1/4W3
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="316949208"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400";
   d="scan'208";a="316949208"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:41:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="711327326"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400";
   d="scan'208";a="711327326"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 18:41:06 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 01/16] soundwire: intel: move common definitions to header
 file
Date: Tue, 14 Mar 2023 09:53:55 +0800
Message-Id: <20230314015410.487311-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230314015410.487311-1-yung-chuan.liao@linux.intel.com>
References: <20230314015410.487311-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SWR3BJ545Q4I4RXYFDPITA4HWWZIWQ5X
X-Message-ID-Hash: SWR3BJ545Q4I4RXYFDPITA4HWWZIWQ5X
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SWR3BJ545Q4I4RXYFDPITA4HWWZIWQ5X/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Prepare for reused for addition of new hardware

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 32 --------------------------------
 drivers/soundwire/intel.h | 29 +++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 32 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 2651767272c7..20067f9cd128 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -19,38 +19,6 @@
 #include "bus.h"
 #include "intel.h"
 
-
-enum intel_pdi_type {
-	INTEL_PDI_IN = 0,
-	INTEL_PDI_OUT = 1,
-	INTEL_PDI_BD = 2,
-};
-
-#define cdns_to_intel(_cdns) container_of(_cdns, struct sdw_intel, cdns)
-
-/*
- * Read, write helpers for HW registers
- */
-static inline int intel_readl(void __iomem *base, int offset)
-{
-	return readl(base + offset);
-}
-
-static inline void intel_writel(void __iomem *base, int offset, int value)
-{
-	writel(value, base + offset);
-}
-
-static inline u16 intel_readw(void __iomem *base, int offset)
-{
-	return readw(base + offset);
-}
-
-static inline void intel_writew(void __iomem *base, int offset, u16 value)
-{
-	writew(value, base + offset);
-}
-
 static int intel_wait_bit(void __iomem *base, int offset, u32 mask, u32 target)
 {
 	int timeout = 10;
diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index de9883313c8f..089c41babfc1 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -50,6 +50,35 @@ struct sdw_intel {
 #endif
 };
 
+enum intel_pdi_type {
+	INTEL_PDI_IN = 0,
+	INTEL_PDI_OUT = 1,
+	INTEL_PDI_BD = 2,
+};
+
+/*
+ * Read, write helpers for HW registers
+ */
+static inline int intel_readl(void __iomem *base, int offset)
+{
+	return readl(base + offset);
+}
+
+static inline void intel_writel(void __iomem *base, int offset, int value)
+{
+	writel(value, base + offset);
+}
+
+static inline u16 intel_readw(void __iomem *base, int offset)
+{
+	return readw(base + offset);
+}
+
+static inline void intel_writew(void __iomem *base, int offset, u16 value)
+{
+	writew(value, base + offset);
+}
+
 #define cdns_to_intel(_cdns) container_of(_cdns, struct sdw_intel, cdns)
 
 #define INTEL_MASTER_RESET_ITERATIONS	10
-- 
2.25.1

