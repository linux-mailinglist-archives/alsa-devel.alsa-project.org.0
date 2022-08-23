Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC5B59D086
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 07:36:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A63F71650;
	Tue, 23 Aug 2022 07:36:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A63F71650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661233017;
	bh=NjbgRtY4CRKo0B1Ls4RwO/1jHQ9pLx+pwvGEVEf/TqI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E7CCKzzCpZQuCdjYSlFVv0EkdzgvFZapDxEn7xMaaoYgVBkj/QBWPVpM5y66C+OcR
	 ZtoAs7nXRu4jSdeJhhNenOgakBpRs0MHFWMqLRKoa3IrNtn3HjLrPTJj7Z5jgqbOkJ
	 N/WtHxaJbQeuPFyobW133Wcdv6VpwqbWyryPZXbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46FAFF80533;
	Tue, 23 Aug 2022 07:35:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B31C8F80529; Tue, 23 Aug 2022 07:35:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 259AAF8014E
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 07:35:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 259AAF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="csW5Zi70"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661232926; x=1692768926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NjbgRtY4CRKo0B1Ls4RwO/1jHQ9pLx+pwvGEVEf/TqI=;
 b=csW5Zi70+4Sr9iyl7J/o0xNrqhpb0Cftrze75uNHRdlI+ZQdtbuO04Yu
 tV+QJB9jO/jsX7QXcWl69X/qm+9m9Tpn6b3RK0op/TSMlID+hDvTR6+JA
 u/lVnLDseoUHUmZUg/fIOmdYE0ELv4aQjW9+gqAaKLHgjJ8L0NNRiXlYs
 lkxf8i/Yv5BUD53s2Uvijcce6FQNYcjEegTvp6z2NAZha8Ko6E/ceMJ4g
 Mzmq2XJFaXWxhx1mdw2yPW8XL/PWjCi7Tt4n7quwA9UwSsq/Fv4inr1Z5
 TX2bzO0C1jaodnbdoYI9osJLt/ZktvnhHebZc1wbH19bTjVSlJzmEtr+L g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="273349227"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="273349227"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 22:34:53 -0700
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="698558238"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 22:34:52 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 01/11] soundwire: intel: cleanup definition of LCOUNT
Date: Tue, 23 Aug 2022 13:38:36 +0800
Message-Id: <20220823053846.2684635-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220823053846.2684635-1-yung-chuan.liao@linux.intel.com>
References: <20220823053846.2684635-1-yung-chuan.liao@linux.intel.com>
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

Add definition in header file rather than hidden in code.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c           | 2 +-
 drivers/soundwire/intel_init.c      | 2 +-
 include/linux/soundwire/sdw_intel.h | 3 +++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 0c6e674dbf85..c37121356e06 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -138,7 +138,7 @@ static int intel_reg_show(struct seq_file *s_file, void *data)
 	if (!buf)
 		return -ENOMEM;
 
-	links = intel_readl(s, SDW_SHIM_LCAP) & GENMASK(2, 0);
+	links = intel_readl(s, SDW_SHIM_LCAP) & SDW_SHIM_LCAP_LCOUNT_MASK;
 
 	ret = scnprintf(buf, RD_BUF, "Register  Value\n");
 	ret += scnprintf(buf + ret, RD_BUF - ret, "\nShim\n");
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index 824f4f32d4dc..d091513919df 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -306,7 +306,7 @@ sdw_intel_startup_controller(struct sdw_intel_ctx *ctx)
 
 	/* Check SNDWLCAP.LCOUNT */
 	caps = ioread32(ctx->mmio_base + ctx->shim_base + SDW_SHIM_LCAP);
-	caps &= GENMASK(2, 0);
+	caps &= SDW_SHIM_LCAP_LCOUNT_MASK;
 
 	/* Check HW supported vs property value */
 	if (caps < ctx->count) {
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index ec16ae49e6a4..49a3c265529b 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -15,7 +15,10 @@
 #define SDW_LINK_SIZE			0x10000
 
 /* Intel SHIM Registers Definition */
+/* LCAP */
 #define SDW_SHIM_LCAP			0x0
+#define SDW_SHIM_LCAP_LCOUNT_MASK	GENMASK(2, 0)
+
 #define SDW_SHIM_LCTL			0x4
 #define SDW_SHIM_IPPTR			0x8
 #define SDW_SHIM_SYNC			0xC
-- 
2.25.1

