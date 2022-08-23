Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 385EC59D087
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 07:37:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB284E11;
	Tue, 23 Aug 2022 07:36:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB284E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661233033;
	bh=P8jAYEVSz/my0EGpyxKbx0zqQQ5m40c9ePrDOY+8xfA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LbEbDQQ5KW5tnOQS2J9j7FfqkithXGvZrOZwi6eGsKAiNzTT1MBSiyMXSn9YZKLON
	 eOkebvWdOLXabpAVV6WgadGNQN3V6bHJM1WeqvxVuag2BYHLGUD2KgjHEfXwMLbT1i
	 8jf4/7vSf0TV+ySAoZekxB/bJ65GPCQLqB5jjxZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB35BF8053A;
	Tue, 23 Aug 2022 07:35:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8661AF80537; Tue, 23 Aug 2022 07:35:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA2A1F804E6
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 07:35:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA2A1F804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="d5puW7Jk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661232928; x=1692768928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P8jAYEVSz/my0EGpyxKbx0zqQQ5m40c9ePrDOY+8xfA=;
 b=d5puW7JkgYpZ05aeBkv/GWvICYwREJK60QxnP1dWfzFCy7PLE6zKiFOc
 jkSRDAfMW6CkBkD855lBJVg9vwl6iQ0i8e65omuh+KOmYhgn/cqzN3gmC
 6cEEWCRXprFSEmoUtubFxvmkpexV231AsHkmvxpT9HbKEOLYevS4667JE
 /ThHFMDCSF/KENvEDwX/4xJsl6+DmwtdlfWKjsMAqL7FGoSuVzZ9eCJP+
 z4YeNO6q6nc5NKUF/mSAJvuB+ImotDxr7lMFwkiStcKteem3dmSjitKLN
 6p79xovIrl4GZ/1OeXwIRfsPrt3GsCGOt0vGX6F/iGLJSjId0rYYNg4fW w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="273349230"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="273349230"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 22:34:55 -0700
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="698558255"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 22:34:53 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 02/11] soundwire: intel: regroup definitions for LCTL
Date: Tue, 23 Aug 2022 13:38:37 +0800
Message-Id: <20220823053846.2684635-3-yung-chuan.liao@linux.intel.com>
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

No functionality change, just regroup offset and bitfield definitions.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/linux/soundwire/sdw_intel.h | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 49a3c265529b..d9f51f43e42c 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -19,7 +19,14 @@
 #define SDW_SHIM_LCAP			0x0
 #define SDW_SHIM_LCAP_LCOUNT_MASK	GENMASK(2, 0)
 
+/* LCTL */
 #define SDW_SHIM_LCTL			0x4
+
+#define SDW_SHIM_LCTL_SPA		BIT(0)
+#define SDW_SHIM_LCTL_SPA_MASK		GENMASK(3, 0)
+#define SDW_SHIM_LCTL_CPA		BIT(8)
+#define SDW_SHIM_LCTL_CPA_MASK		GENMASK(11, 8)
+
 #define SDW_SHIM_IPPTR			0x8
 #define SDW_SHIM_SYNC			0xC
 
@@ -39,11 +46,6 @@
 #define SDW_SHIM_WAKEEN			0x190
 #define SDW_SHIM_WAKESTS		0x192
 
-#define SDW_SHIM_LCTL_SPA		BIT(0)
-#define SDW_SHIM_LCTL_SPA_MASK		GENMASK(3, 0)
-#define SDW_SHIM_LCTL_CPA		BIT(8)
-#define SDW_SHIM_LCTL_CPA_MASK		GENMASK(11, 8)
-
 #define SDW_SHIM_SYNC_SYNCPRD_VAL_24	(24000 / SDW_CADENCE_GSYNC_KHZ - 1)
 #define SDW_SHIM_SYNC_SYNCPRD_VAL_38_4	(38400 / SDW_CADENCE_GSYNC_KHZ - 1)
 #define SDW_SHIM_SYNC_SYNCPRD		GENMASK(14, 0)
-- 
2.25.1

