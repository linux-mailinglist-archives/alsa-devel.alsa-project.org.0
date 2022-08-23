Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C744559D097
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 07:37:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 627F41675;
	Tue, 23 Aug 2022 07:36:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 627F41675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661233067;
	bh=G5tPQYoYyQx9LRdvjr1phTNkVbVqfOYGd3NZCF5nUc8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Onn7wEBhBAhD6zl5QGMU6xplI5sB4JEzqf/o6tuLoZN80PSR0Hv3q35m7r9a27lKS
	 dybyLy8Y+HgIxddmqaCLSXmskTg80PpTuhgy0uj2MLJDygorMKKO4Kd3Nqo/xQ8wMR
	 uc3vbHdkMKN3MuXoB8j2lxd/WYDvY8tI7BNOYZdo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BCD7F80559;
	Tue, 23 Aug 2022 07:35:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E79B7F80551; Tue, 23 Aug 2022 07:35:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7EF9F800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 07:35:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7EF9F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="n06+jRD9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661232929; x=1692768929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=G5tPQYoYyQx9LRdvjr1phTNkVbVqfOYGd3NZCF5nUc8=;
 b=n06+jRD9TY7amuvm0FzpKZkh7zxlUZAjVhOmmQN3bvkOgtS7rsKj/2uE
 hYcZSwjtccN5+6eGcVKV/rokX/uvLX/tf+uzoAivWv+EYHycjzjlt+VF7
 FmnUKXbQxBKGnVODx5jBYvN1clPB8j3YJcE9Vq8wEhuohvbRB4iL3lpOl
 N0m5mR+BmlCwxwHh7ny7dL/zr2OtGoIi/73MzsAqqyHTZ47dyHEyA1Jqx
 /2gB8JtQgbw0c1TiPz22P5nv4pXYWmnbg3+VovXBW2mTe41miJqxijiHt
 HoXmFhWhKAIE0idU/eFIfhv0vSAsLFtV+tvcDE82ATatlxchZh4UvhSua g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="273349243"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="273349243"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 22:34:58 -0700
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="698558270"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 22:34:57 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 04/11] soundwire: intel: cleanup SHIM SYNC
Date: Tue, 23 Aug 2022 13:38:39 +0800
Message-Id: <20220823053846.2684635-5-yung-chuan.liao@linux.intel.com>
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

Regroup offset and bitfields, no functionality change

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/linux/soundwire/sdw_intel.h | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 581a9ba32f82..66503cf29f48 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -27,8 +27,17 @@
 #define SDW_SHIM_LCTL_CPA		BIT(8)
 #define SDW_SHIM_LCTL_CPA_MASK		GENMASK(11, 8)
 
+/* SYNC */
 #define SDW_SHIM_SYNC			0xC
 
+#define SDW_SHIM_SYNC_SYNCPRD_VAL_24	(24000 / SDW_CADENCE_GSYNC_KHZ - 1)
+#define SDW_SHIM_SYNC_SYNCPRD_VAL_38_4	(38400 / SDW_CADENCE_GSYNC_KHZ - 1)
+#define SDW_SHIM_SYNC_SYNCPRD		GENMASK(14, 0)
+#define SDW_SHIM_SYNC_SYNCCPU		BIT(15)
+#define SDW_SHIM_SYNC_CMDSYNC_MASK	GENMASK(19, 16)
+#define SDW_SHIM_SYNC_CMDSYNC		BIT(16)
+#define SDW_SHIM_SYNC_SYNCGO		BIT(24)
+
 #define SDW_SHIM_CTLSCAP(x)		(0x010 + 0x60 * (x))
 #define SDW_SHIM_CTLS0CM(x)		(0x012 + 0x60 * (x))
 #define SDW_SHIM_CTLS1CM(x)		(0x014 + 0x60 * (x))
@@ -45,14 +54,6 @@
 #define SDW_SHIM_WAKEEN			0x190
 #define SDW_SHIM_WAKESTS		0x192
 
-#define SDW_SHIM_SYNC_SYNCPRD_VAL_24	(24000 / SDW_CADENCE_GSYNC_KHZ - 1)
-#define SDW_SHIM_SYNC_SYNCPRD_VAL_38_4	(38400 / SDW_CADENCE_GSYNC_KHZ - 1)
-#define SDW_SHIM_SYNC_SYNCPRD		GENMASK(14, 0)
-#define SDW_SHIM_SYNC_SYNCCPU		BIT(15)
-#define SDW_SHIM_SYNC_CMDSYNC_MASK	GENMASK(19, 16)
-#define SDW_SHIM_SYNC_CMDSYNC		BIT(16)
-#define SDW_SHIM_SYNC_SYNCGO		BIT(24)
-
 #define SDW_SHIM_PCMSCAP_ISS		GENMASK(3, 0)
 #define SDW_SHIM_PCMSCAP_OSS		GENMASK(7, 4)
 #define SDW_SHIM_PCMSCAP_BSS		GENMASK(12, 8)
-- 
2.25.1

