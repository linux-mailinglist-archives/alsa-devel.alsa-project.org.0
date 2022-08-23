Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC7C59D099
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 07:38:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF675169B;
	Tue, 23 Aug 2022 07:37:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF675169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661233090;
	bh=EyWd4VGDEPE6hBiP5PLjEK5FM9hWuvmBy1zWByvjrrQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rn3GHQvtg4NC97pC+AVdpv0o8iDxiIXgCFOqPwuvJZ8RE0rSKUbbtBv5Kfr8O1TqL
	 /MaCg8C8eLCQmHpJ4t8DO9hGeMJO+zUZrZejJk+b4gYXjUD4hl1W1dtnLiBT51/EzW
	 ldir0m9zSORCue6U+i4MwGWnrJ+XCcnBnZz9IRbE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96964F80567;
	Tue, 23 Aug 2022 07:35:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C81ECF80566; Tue, 23 Aug 2022 07:35:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 230A4F8014E
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 07:35:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 230A4F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gL170rT9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661232932; x=1692768932;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EyWd4VGDEPE6hBiP5PLjEK5FM9hWuvmBy1zWByvjrrQ=;
 b=gL170rT9FuMpuwhF23ZRNr3WmkXGOFzWsLCVQsnAEiMQ4NQwTntm+5fI
 Ii5TmUhfZF/HUbcRE55iZF/t1HIczId3Ghy7GhgaQKRgcyd/SojHEZ361
 G1banBJuYK8TEYRp9tLJAeUEaKylBqForZwN2fa8NSN0i2d6Wv4AKySly
 8qm5EhfSFaoC6i+cmvchFa4AF9v5FKPSe+72u/fy0FIt9FCP/P0Agpjiz
 AYg+MYY8CEfzrWACZQsKn8D1Li/WEFyNK2KnQN3ikCb64kKpvvLBVyWot
 +WrZ/s1jm+HOZ6KVC+QwlmLkae7e8QvDOV64xIbSYjcWaNIpoa1p/jM4g A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="273349269"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="273349269"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 22:35:07 -0700
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="698558345"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 22:35:06 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 09/11] soundwire: intel: cleanup IO control
Date: Tue, 23 Aug 2022 13:38:44 +0800
Message-Id: <20220823053846.2684635-10-yung-chuan.liao@linux.intel.com>
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
 include/linux/soundwire/sdw_intel.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index a1810701642e..a2e1927ac8ac 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -63,11 +63,8 @@
 #define SDW_SHIM_PCMSYCM_STREAM		GENMASK(13, 8)
 #define SDW_SHIM_PCMSYCM_DIR		BIT(15)
 
+/* IO control */
 #define SDW_SHIM_IOCTL(x)		(0x06C + 0x60 * (x))
-#define SDW_SHIM_CTMCTL(x)		(0x06E + 0x60 * (x))
-
-#define SDW_SHIM_WAKEEN			0x190
-#define SDW_SHIM_WAKESTS		0x192
 
 #define SDW_SHIM_IOCTL_MIF		BIT(0)
 #define SDW_SHIM_IOCTL_CO		BIT(1)
@@ -79,6 +76,11 @@
 #define SDW_SHIM_IOCTL_CIBD		BIT(8)
 #define SDW_SHIM_IOCTL_DIBD		BIT(9)
 
+#define SDW_SHIM_CTMCTL(x)		(0x06E + 0x60 * (x))
+
+#define SDW_SHIM_WAKEEN			0x190
+#define SDW_SHIM_WAKESTS		0x192
+
 #define SDW_SHIM_CTMCTL_DACTQE		BIT(0)
 #define SDW_SHIM_CTMCTL_DODS		BIT(1)
 #define SDW_SHIM_CTMCTL_DOAIS		GENMASK(4, 3)
-- 
2.25.1

