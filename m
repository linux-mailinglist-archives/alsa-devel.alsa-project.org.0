Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DF759D088
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 07:37:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C582B1657;
	Tue, 23 Aug 2022 07:36:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C582B1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661233046;
	bh=zUZCrvll5EIj8yMSFdHa9CHP1hiI8H8cuO2HX4044Po=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gz7b5wiQNTpGIZ12mIewE/winSt5xcSc8T7DnSh627J9PRijWp07kCbCwqGiOGRzQ
	 NESL5CxhERIIF+LshNDW8xVh+NS1GqVm5BM+uV3Yp02giwcw1hXgrWZpTrfAKZKCBC
	 FAFyOjg2xSqBtodz7skWQgcZ5dXt345EnzAEMvP0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9468BF80551;
	Tue, 23 Aug 2022 07:35:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0E68F80552; Tue, 23 Aug 2022 07:35:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C033F8030F
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 07:35:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C033F8030F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RCFQx8k+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661232928; x=1692768928;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zUZCrvll5EIj8yMSFdHa9CHP1hiI8H8cuO2HX4044Po=;
 b=RCFQx8k+siQuHYue7JyHsInl1ZqPByfXlvpdgNUU8zGNG9OF/lRVC+iU
 I+mVoR16OmL4S98VOpeZ5jwx7tAvjw4Vg4QiUyLbPN6gPxZWJmWNp3Hgv
 yy0JfTl8MXVC0ScrYkyuAS5uFBLZIbrNxD7WSkdFsoiLCI0h90VkMQR0g
 YHSBJ3PnF4/fKqlWYMQ3gu/Dv2dEt7ItA4sYx/oDCeqt5HC8A1RwH7HOu
 MhZrhtL3u5xSjxBRG+BjHXc6ALVInomjSxhsbBQGP/BpwFK2PGCTJBANN
 lsaY8rDU76KZ8+UKJJW0mf8Bk4xHk8k2Jc+wWFJpTEr0n1c2P4dUEJWmy g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="273349238"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="273349238"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 22:34:57 -0700
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="698558266"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 22:34:55 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 03/11] soundwire: intel: remove IPPTR unused definition
Date: Tue, 23 Aug 2022 13:38:38 +0800
Message-Id: <20220823053846.2684635-4-yung-chuan.liao@linux.intel.com>
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

This read-only register only defines an offset which is known already
and a version which isn't used.

Remove unused definition.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/linux/soundwire/sdw_intel.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index d9f51f43e42c..581a9ba32f82 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -27,7 +27,6 @@
 #define SDW_SHIM_LCTL_CPA		BIT(8)
 #define SDW_SHIM_LCTL_CPA_MASK		GENMASK(11, 8)
 
-#define SDW_SHIM_IPPTR			0x8
 #define SDW_SHIM_SYNC			0xC
 
 #define SDW_SHIM_CTLSCAP(x)		(0x010 + 0x60 * (x))
-- 
2.25.1

