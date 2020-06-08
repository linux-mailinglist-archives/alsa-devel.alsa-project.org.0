Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 933EC1F366B
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 10:50:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38353168B;
	Tue,  9 Jun 2020 10:50:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38353168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591692658;
	bh=AXza4TfyHoz2WT8FVQFT404YIGsHcT/Bd3GEO8A+Qgo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R5L/jTm/B3vlqlnMD+duxp8ICMc/M15Is6PZEQeT6AaRaRGzfp7b+tiiqMOLcMRKr
	 2MettaGMtIO1knvAXi1rkdSy+u5OKOPv5yY9AD5nSmfK2tO+Xq2MKV9uJxeBjjvXqI
	 KsBNmAyksPqmBZjEHP6MZC35Z/ruBM4GZORnb9qI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 626E6F80124;
	Tue,  9 Jun 2020 10:49:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19263F80088; Tue,  9 Jun 2020 10:49:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.9 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,UPPERCASE_50_75,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B246F80088
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 10:49:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B246F80088
IronPort-SDR: qfIQKeZdk5X+htK8RqA9mm+KnI7SDl4q/AWdxcZlcxFdabetmESM8Z66XUQXViON5R2PCU/WyA
 G1IJltubiJnQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2020 01:48:56 -0700
IronPort-SDR: 8HJEABwRbp8PbmsJaiz9pJMCjWLzgu01R4yJQS/Q5BTBoJIHUa663NQl073yd8rQC1wgCssRmK
 3KZCOOjP/W1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,491,1583222400"; d="scan'208";a="473001837"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga005.fm.intel.com with ESMTP; 09 Jun 2020 01:48:52 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 1/4] soundwire: add definitions for 1.2 spec
Date: Tue,  9 Jun 2020 04:54:33 +0800
Message-Id: <20200608205436.2402-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608205436.2402-1-yung-chuan.liao@linux.intel.com>
References: <20200608205436.2402-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

Add definitions for register offsets and bit fields from the MIPI
SoundWire 1.2 specification (available to MIPI members at
https://members.mipi.org/wg/All-Members/document/download/78371)

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/linux/soundwire/sdw_registers.h | 107 +++++++++++++++++++++++-
 1 file changed, 106 insertions(+), 1 deletion(-)

diff --git a/include/linux/soundwire/sdw_registers.h b/include/linux/soundwire/sdw_registers.h
index a686f7988156..12f9ffc3eb3b 100644
--- a/include/linux/soundwire/sdw_registers.h
+++ b/include/linux/soundwire/sdw_registers.h
@@ -12,7 +12,7 @@
 #define SDW_REG_SHIFT(n)			(ffs(n) - 1)
 
 /*
- * SDW registers as defined by MIPI 1.1 Spec
+ * SDW registers as defined by MIPI 1.2 Spec
  */
 #define SDW_REGADDR				GENMASK(14, 0)
 #define SDW_SCP_ADDRPAGE2_MASK			GENMASK(22, 15)
@@ -43,6 +43,8 @@
 #define SDW_DP0_INT_TEST_FAIL			BIT(0)
 #define SDW_DP0_INT_PORT_READY			BIT(1)
 #define SDW_DP0_INT_BRA_FAILURE			BIT(2)
+#define SDW_DP0_SDCA_CASCADE			BIT(3)
+/* BIT(4) not allocated in SoundWire specification 1.2 */
 #define SDW_DP0_INT_IMPDEF1			BIT(5)
 #define SDW_DP0_INT_IMPDEF2			BIT(6)
 #define SDW_DP0_INT_IMPDEF3			BIT(7)
@@ -106,6 +108,10 @@
 #define SDW_SCP_ADDRPAGE2			0x49
 #define SDW_SCP_KEEPEREN			0x4A
 #define SDW_SCP_BANKDELAY			0x4B
+#define SDW_SCP_COMMIT				0x4C
+#define SDW_SCP_BUS_CLOCK_BASE			0x4D
+#define SDW_SCP_BASE_CLOCK_FREQ			GENMASK(2, 0)
+/* 0x4E is not allocated in SoundWire specification 1.2 */
 #define SDW_SCP_TESTMODE			0x4F
 #define SDW_SCP_DEVID_0				0x50
 #define SDW_SCP_DEVID_1				0x51
@@ -114,12 +120,111 @@
 #define SDW_SCP_DEVID_4				0x54
 #define SDW_SCP_DEVID_5				0x55
 
+/* Both INT and STATUS register are same */
+#define SDW_SCP_SDCA_INT1			0x58
+#define SDW_SCP_SDCA_INT_SDCA_0			BIT(0)
+#define SDW_SCP_SDCA_INT_SDCA_1			BIT(1)
+#define SDW_SCP_SDCA_INT_SDCA_2			BIT(2)
+#define SDW_SCP_SDCA_INT_SDCA_3			BIT(3)
+#define SDW_SCP_SDCA_INT_SDCA_4			BIT(4)
+#define SDW_SCP_SDCA_INT_SDCA_5			BIT(5)
+#define SDW_SCP_SDCA_INT_SDCA_6			BIT(6)
+#define SDW_SCP_SDCA_INT_SDCA_7			BIT(7)
+
+#define SDW_SCP_SDCA_INT2			0x59
+#define SDW_SCP_SDCA_INT_SDCA_8			BIT(0)
+#define SDW_SCP_SDCA_INT_SDCA_9			BIT(1)
+#define SDW_SCP_SDCA_INT_SDCA_10		BIT(2)
+#define SDW_SCP_SDCA_INT_SDCA_11		BIT(3)
+#define SDW_SCP_SDCA_INT_SDCA_12		BIT(4)
+#define SDW_SCP_SDCA_INT_SDCA_13		BIT(5)
+#define SDW_SCP_SDCA_INT_SDCA_14		BIT(6)
+#define SDW_SCP_SDCA_INT_SDCA_15		BIT(7)
+
+#define SDW_SCP_SDCA_INT3			0x5A
+#define SDW_SCP_SDCA_INT_SDCA_16		BIT(0)
+#define SDW_SCP_SDCA_INT_SDCA_17		BIT(1)
+#define SDW_SCP_SDCA_INT_SDCA_18		BIT(2)
+#define SDW_SCP_SDCA_INT_SDCA_19		BIT(3)
+#define SDW_SCP_SDCA_INT_SDCA_20		BIT(4)
+#define SDW_SCP_SDCA_INT_SDCA_21		BIT(5)
+#define SDW_SCP_SDCA_INT_SDCA_22		BIT(6)
+#define SDW_SCP_SDCA_INT_SDCA_23		BIT(7)
+
+#define SDW_SCP_SDCA_INT4			0x5B
+#define SDW_SCP_SDCA_INT_SDCA_24		BIT(0)
+#define SDW_SCP_SDCA_INT_SDCA_25		BIT(1)
+#define SDW_SCP_SDCA_INT_SDCA_26		BIT(2)
+#define SDW_SCP_SDCA_INT_SDCA_27		BIT(3)
+#define SDW_SCP_SDCA_INT_SDCA_28		BIT(4)
+#define SDW_SCP_SDCA_INT_SDCA_29		BIT(5)
+#define SDW_SCP_SDCA_INT_SDCA_30		BIT(6)
+/* BIT(7) not allocated in SoundWire 1.2 specification */
+
+#define SDW_SCP_SDCA_INTMASK1			0x5C
+#define SDW_SCP_SDCA_INTMASK_SDCA_0		BIT(0)
+#define SDW_SCP_SDCA_INTMASK_SDCA_1		BIT(1)
+#define SDW_SCP_SDCA_INTMASK_SDCA_2		BIT(2)
+#define SDW_SCP_SDCA_INTMASK_SDCA_3		BIT(3)
+#define SDW_SCP_SDCA_INTMASK_SDCA_4		BIT(4)
+#define SDW_SCP_SDCA_INTMASK_SDCA_5		BIT(5)
+#define SDW_SCP_SDCA_INTMASK_SDCA_6		BIT(6)
+#define SDW_SCP_SDCA_INTMASK_SDCA_7		BIT(7)
+
+#define SDW_SCP_SDCA_INTMASK2			0x5D
+#define SDW_SCP_SDCA_INTMASK_SDCA_8		BIT(0)
+#define SDW_SCP_SDCA_INTMASK_SDCA_9		BIT(1)
+#define SDW_SCP_SDCA_INTMASK_SDCA_10		BIT(2)
+#define SDW_SCP_SDCA_INTMASK_SDCA_11		BIT(3)
+#define SDW_SCP_SDCA_INTMASK_SDCA_12		BIT(4)
+#define SDW_SCP_SDCA_INTMASK_SDCA_13		BIT(5)
+#define SDW_SCP_SDCA_INTMASK_SDCA_14		BIT(6)
+#define SDW_SCP_SDCA_INTMASK_SDCA_15		BIT(7)
+
+#define SDW_SCP_SDCA_INTMASK3			0x5E
+#define SDW_SCP_SDCA_INTMASK_SDCA_16		BIT(0)
+#define SDW_SCP_SDCA_INTMASK_SDCA_17		BIT(1)
+#define SDW_SCP_SDCA_INTMASK_SDCA_18		BIT(2)
+#define SDW_SCP_SDCA_INTMASK_SDCA_19		BIT(3)
+#define SDW_SCP_SDCA_INTMASK_SDCA_20		BIT(4)
+#define SDW_SCP_SDCA_INTMASK_SDCA_21		BIT(5)
+#define SDW_SCP_SDCA_INTMASK_SDCA_22		BIT(6)
+#define SDW_SCP_SDCA_INTMASK_SDCA_23		BIT(7)
+
+#define SDW_SCP_SDCA_INTMASK4			0x5F
+#define SDW_SCP_SDCA_INTMASK_SDCA_24		BIT(0)
+#define SDW_SCP_SDCA_INTMASK_SDCA_25		BIT(1)
+#define SDW_SCP_SDCA_INTMASK_SDCA_26		BIT(2)
+#define SDW_SCP_SDCA_INTMASK_SDCA_27		BIT(3)
+#define SDW_SCP_SDCA_INTMASK_SDCA_28		BIT(4)
+#define SDW_SCP_SDCA_INTMASK_SDCA_29		BIT(5)
+#define SDW_SCP_SDCA_INTMASK_SDCA_30		BIT(6)
+/* BIT(7) not allocated in SoundWire 1.2 specification */
+
 /* Banked Registers */
 #define SDW_SCP_FRAMECTRL_B0			0x60
 #define SDW_SCP_FRAMECTRL_B1			(0x60 + SDW_BANK1_OFFSET)
 #define SDW_SCP_NEXTFRAME_B0			0x61
 #define SDW_SCP_NEXTFRAME_B1			(0x61 + SDW_BANK1_OFFSET)
 
+#define SDW_SCP_BUSCLOCK_SCALE_B0		0x62
+#define SDW_SCP_BUSCLOCK_SCALE_B1		(0x62 + SDW_BANK1_OFFSET)
+#define SDW_SCP_CLOCK_SCALE			GENMASK(3, 0)
+
+/* PHY registers - CTRL and STAT are the same address */
+#define SDW_SCP_PHY_OUT_CTRL_0			0x80
+#define SDW_SCP_PHY_OUT_CTRL_1			0x81
+#define SDW_SCP_PHY_OUT_CTRL_2			0x82
+#define SDW_SCP_PHY_OUT_CTRL_3			0x83
+#define SDW_SCP_PHY_OUT_CTRL_4			0x84
+#define SDW_SCP_PHY_OUT_CTRL_5			0x85
+#define SDW_SCP_PHY_OUT_CTRL_6			0x86
+#define SDW_SCP_PHY_OUT_CTRL_7			0x87
+
+#define SDW_SCP_CAP_LOAD_CTRL			GENMASK(2, 0)
+#define SDW_SCP_DRIVE_STRENGTH_CTRL		GENMASK(5, 3)
+#define SDW_SCP_SLEW_TIME_CTRL			GENMASK(7, 6)
+
 /* Both INT and STATUS register is same */
 #define SDW_DPN_INT(n)				(0x0 + SDW_DPN_SIZE * (n))
 #define SDW_DPN_INTMASK(n)			(0x1 + SDW_DPN_SIZE * (n))
-- 
2.17.1

