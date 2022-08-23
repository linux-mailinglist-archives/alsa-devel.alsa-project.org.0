Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A38CB59D09E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 07:39:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A0721685;
	Tue, 23 Aug 2022 07:38:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A0721685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661233147;
	bh=Yc7RFkUtH2FXd/9strLCaMxqG9dXo+oRJXbSLQ9J/mE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rYCD+8+RbRmEQe3mLy2UV39XsXBJ9uAjaBISDxMqmNQE7H49KEfUT5hawSXFs8mqh
	 tg1ybD6ffU4rTH/Bpm99ujN0AVfobEEzSCfa4EHTXgLVN4Th++al2wpzZvBNRyjSe5
	 Thl/cTjAEvGiraNTPa/krQrQwa0YJkheC7W2kNJE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6869F8057E;
	Tue, 23 Aug 2022 07:36:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE32DF80525; Tue, 23 Aug 2022 07:36:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3523F8052D
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 07:35:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3523F8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IvyuzQru"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661232931; x=1692768931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yc7RFkUtH2FXd/9strLCaMxqG9dXo+oRJXbSLQ9J/mE=;
 b=IvyuzQru3TFXpqc4PWNtnPVrn6JeIQlNTYArJRgIi9mgKXrpZnUIMgBw
 l3s7RsEmvMZApea4BmbFhzXa75ltiKF2srrR1BCoELKSa2wNS3+9a7zlD
 4WCWN7yfv8MyAh3tBchQz8E6DRf5A7kgL15z36Cfq6Is7YBoqxCKw1eX7
 lStxkgySmLIjdlYrhqMoqJTRuqRXkZ27TS3RhkK1+BuuKGYv7KXr5cVEz
 TYbTpHvBZYhjXt4IrcXLEyJrhkzuTFICzRedUk2DLRH+mIx4pasPOw/IV
 SDu5H9wOFYMAewIcB3Jus4/Iu+TNAXveWvJmdr2KqTdhCA3AyRcf8WOgT w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="273349265"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="273349265"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 22:35:05 -0700
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="698558334"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 22:35:04 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 08/11] soundwire: intel: cleanup PCM Stream channel map and
 channel count
Date: Tue, 23 Aug 2022 13:38:43 +0800
Message-Id: <20220823053846.2684635-9-yung-chuan.liao@linux.intel.com>
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

Regroup offset and bitfield definitions.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/linux/soundwire/sdw_intel.h | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 958628e936ea..a1810701642e 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -52,19 +52,23 @@
 #define SDW_SHIM_PCMSCAP_OSS		GENMASK(7, 4)
 #define SDW_SHIM_PCMSCAP_BSS		GENMASK(12, 8)
 
+/* PCM Stream Channel Map */
 #define SDW_SHIM_PCMSYCHM(x, y)		(0x022 + (0x60 * (x)) + (0x2 * (y)))
+
+/* PCM Stream Channel Count */
 #define SDW_SHIM_PCMSYCHC(x, y)		(0x042 + (0x60 * (x)) + (0x2 * (y)))
-#define SDW_SHIM_IOCTL(x)		(0x06C + 0x60 * (x))
-#define SDW_SHIM_CTMCTL(x)		(0x06E + 0x60 * (x))
-
-#define SDW_SHIM_WAKEEN			0x190
-#define SDW_SHIM_WAKESTS		0x192
 
 #define SDW_SHIM_PCMSYCM_LCHN		GENMASK(3, 0)
 #define SDW_SHIM_PCMSYCM_HCHN		GENMASK(7, 4)
 #define SDW_SHIM_PCMSYCM_STREAM		GENMASK(13, 8)
 #define SDW_SHIM_PCMSYCM_DIR		BIT(15)
 
+#define SDW_SHIM_IOCTL(x)		(0x06C + 0x60 * (x))
+#define SDW_SHIM_CTMCTL(x)		(0x06E + 0x60 * (x))
+
+#define SDW_SHIM_WAKEEN			0x190
+#define SDW_SHIM_WAKESTS		0x192
+
 #define SDW_SHIM_IOCTL_MIF		BIT(0)
 #define SDW_SHIM_IOCTL_CO		BIT(1)
 #define SDW_SHIM_IOCTL_COE		BIT(2)
-- 
2.25.1

