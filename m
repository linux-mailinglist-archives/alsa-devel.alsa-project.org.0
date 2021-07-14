Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF953C7C08
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 04:48:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0A371692;
	Wed, 14 Jul 2021 04:47:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0A371692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626230913;
	bh=xC3EUYjQJUQPrI+k68p01BsKFKH4avjpUze8Ge8peKY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vVaSYIj0BXmGMEuQzekpmojEI/7MYHW9AKFaP3R1GB1zzwxhe+Xg2D+1fM2bWpsN9
	 Vpk/H23fd9EGKWKw6xX9NJ1xoXHZ2h/U4XhMNA1OuE+VaaKZAe8BNiODvgGS1hm6FU
	 P2fDJSCowB5cudgJef5pc75PnhlXNZvcw56oh42M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 637E1F804E5;
	Wed, 14 Jul 2021 04:46:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18EB9F804DF; Wed, 14 Jul 2021 04:46:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C7E9F800D3
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 04:46:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C7E9F800D3
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="210092385"
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="210092385"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 19:46:27 -0700
X-IronPort-AV: E=Sophos;i="5.84,238,1620716400"; d="scan'208";a="493593198"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 19:46:24 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 1/6] soundwire: move intel sdw register definitions to
 sdw_intel.h
Date: Wed, 14 Jul 2021 10:46:09 +0800
Message-Id: <20210714024614.9357-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210714024614.9357-1-yung-chuan.liao@linux.intel.com>
References: <20210714024614.9357-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

So it is visible to other drivers.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 drivers/soundwire/intel.c           | 74 ---------------------------
 drivers/soundwire/intel_init.c      |  6 ---
 include/linux/soundwire/sdw_intel.h | 79 +++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+), 80 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index c11e3d8cd308..15668d6fecd6 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -40,80 +40,6 @@ static int md_flags;
 module_param_named(sdw_md_flags, md_flags, int, 0444);
 MODULE_PARM_DESC(sdw_md_flags, "SoundWire Intel Master device flags (0x0 all off)");
 
-/* Intel SHIM Registers Definition */
-#define SDW_SHIM_LCAP			0x0
-#define SDW_SHIM_LCTL			0x4
-#define SDW_SHIM_IPPTR			0x8
-#define SDW_SHIM_SYNC			0xC
-
-#define SDW_SHIM_CTLSCAP(x)		(0x010 + 0x60 * (x))
-#define SDW_SHIM_CTLS0CM(x)		(0x012 + 0x60 * (x))
-#define SDW_SHIM_CTLS1CM(x)		(0x014 + 0x60 * (x))
-#define SDW_SHIM_CTLS2CM(x)		(0x016 + 0x60 * (x))
-#define SDW_SHIM_CTLS3CM(x)		(0x018 + 0x60 * (x))
-#define SDW_SHIM_PCMSCAP(x)		(0x020 + 0x60 * (x))
-
-#define SDW_SHIM_PCMSYCHM(x, y)		(0x022 + (0x60 * (x)) + (0x2 * (y)))
-#define SDW_SHIM_PCMSYCHC(x, y)		(0x042 + (0x60 * (x)) + (0x2 * (y)))
-#define SDW_SHIM_PDMSCAP(x)		(0x062 + 0x60 * (x))
-#define SDW_SHIM_IOCTL(x)		(0x06C + 0x60 * (x))
-#define SDW_SHIM_CTMCTL(x)		(0x06E + 0x60 * (x))
-
-#define SDW_SHIM_WAKEEN			0x190
-#define SDW_SHIM_WAKESTS		0x192
-
-#define SDW_SHIM_LCTL_SPA		BIT(0)
-#define SDW_SHIM_LCTL_SPA_MASK		GENMASK(3, 0)
-#define SDW_SHIM_LCTL_CPA		BIT(8)
-#define SDW_SHIM_LCTL_CPA_MASK		GENMASK(11, 8)
-
-#define SDW_SHIM_SYNC_SYNCPRD_VAL_24	(24000 / SDW_CADENCE_GSYNC_KHZ - 1)
-#define SDW_SHIM_SYNC_SYNCPRD_VAL_38_4	(38400 / SDW_CADENCE_GSYNC_KHZ - 1)
-#define SDW_SHIM_SYNC_SYNCPRD		GENMASK(14, 0)
-#define SDW_SHIM_SYNC_SYNCCPU		BIT(15)
-#define SDW_SHIM_SYNC_CMDSYNC_MASK	GENMASK(19, 16)
-#define SDW_SHIM_SYNC_CMDSYNC		BIT(16)
-#define SDW_SHIM_SYNC_SYNCGO		BIT(24)
-
-#define SDW_SHIM_PCMSCAP_ISS		GENMASK(3, 0)
-#define SDW_SHIM_PCMSCAP_OSS		GENMASK(7, 4)
-#define SDW_SHIM_PCMSCAP_BSS		GENMASK(12, 8)
-
-#define SDW_SHIM_PCMSYCM_LCHN		GENMASK(3, 0)
-#define SDW_SHIM_PCMSYCM_HCHN		GENMASK(7, 4)
-#define SDW_SHIM_PCMSYCM_STREAM		GENMASK(13, 8)
-#define SDW_SHIM_PCMSYCM_DIR		BIT(15)
-
-#define SDW_SHIM_PDMSCAP_ISS		GENMASK(3, 0)
-#define SDW_SHIM_PDMSCAP_OSS		GENMASK(7, 4)
-#define SDW_SHIM_PDMSCAP_BSS		GENMASK(12, 8)
-#define SDW_SHIM_PDMSCAP_CPSS		GENMASK(15, 13)
-
-#define SDW_SHIM_IOCTL_MIF		BIT(0)
-#define SDW_SHIM_IOCTL_CO		BIT(1)
-#define SDW_SHIM_IOCTL_COE		BIT(2)
-#define SDW_SHIM_IOCTL_DO		BIT(3)
-#define SDW_SHIM_IOCTL_DOE		BIT(4)
-#define SDW_SHIM_IOCTL_BKE		BIT(5)
-#define SDW_SHIM_IOCTL_WPDD		BIT(6)
-#define SDW_SHIM_IOCTL_CIBD		BIT(8)
-#define SDW_SHIM_IOCTL_DIBD		BIT(9)
-
-#define SDW_SHIM_CTMCTL_DACTQE		BIT(0)
-#define SDW_SHIM_CTMCTL_DODS		BIT(1)
-#define SDW_SHIM_CTMCTL_DOAIS		GENMASK(4, 3)
-
-#define SDW_SHIM_WAKEEN_ENABLE		BIT(0)
-#define SDW_SHIM_WAKESTS_STATUS		BIT(0)
-
-/* Intel ALH Register definitions */
-#define SDW_ALH_STRMZCFG(x)		(0x000 + (0x4 * (x)))
-#define SDW_ALH_NUM_STREAMS		64
-
-#define SDW_ALH_STRMZCFG_DMAT_VAL	0x3
-#define SDW_ALH_STRMZCFG_DMAT		GENMASK(7, 0)
-#define SDW_ALH_STRMZCFG_CHN		GENMASK(19, 16)
-
 enum intel_pdi_type {
 	INTEL_PDI_IN = 0,
 	INTEL_PDI_OUT = 1,
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index 9e283bef53d2..03ff69ab1797 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -18,12 +18,6 @@
 #include "cadence_master.h"
 #include "intel.h"
 
-#define SDW_SHIM_LCAP		0x0
-#define SDW_SHIM_BASE		0x2C000
-#define SDW_ALH_BASE		0x2C800
-#define SDW_LINK_BASE		0x30000
-#define SDW_LINK_SIZE		0x10000
-
 static void intel_link_dev_release(struct device *dev)
 {
 	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 1ebea7764011..7fce6aee0c36 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -7,6 +7,85 @@
 #include <linux/irqreturn.h>
 #include <linux/soundwire/sdw.h>
 
+#define SDW_SHIM_BASE			0x2C000
+#define SDW_ALH_BASE			0x2C800
+#define SDW_LINK_BASE			0x30000
+#define SDW_LINK_SIZE			0x10000
+
+/* Intel SHIM Registers Definition */
+#define SDW_SHIM_LCAP			0x0
+#define SDW_SHIM_LCTL			0x4
+#define SDW_SHIM_IPPTR			0x8
+#define SDW_SHIM_SYNC			0xC
+
+#define SDW_SHIM_CTLSCAP(x)		(0x010 + 0x60 * (x))
+#define SDW_SHIM_CTLS0CM(x)		(0x012 + 0x60 * (x))
+#define SDW_SHIM_CTLS1CM(x)		(0x014 + 0x60 * (x))
+#define SDW_SHIM_CTLS2CM(x)		(0x016 + 0x60 * (x))
+#define SDW_SHIM_CTLS3CM(x)		(0x018 + 0x60 * (x))
+#define SDW_SHIM_PCMSCAP(x)		(0x020 + 0x60 * (x))
+
+#define SDW_SHIM_PCMSYCHM(x, y)		(0x022 + (0x60 * (x)) + (0x2 * (y)))
+#define SDW_SHIM_PCMSYCHC(x, y)		(0x042 + (0x60 * (x)) + (0x2 * (y)))
+#define SDW_SHIM_PDMSCAP(x)		(0x062 + 0x60 * (x))
+#define SDW_SHIM_IOCTL(x)		(0x06C + 0x60 * (x))
+#define SDW_SHIM_CTMCTL(x)		(0x06E + 0x60 * (x))
+
+#define SDW_SHIM_WAKEEN			0x190
+#define SDW_SHIM_WAKESTS		0x192
+
+#define SDW_SHIM_LCTL_SPA		BIT(0)
+#define SDW_SHIM_LCTL_SPA_MASK		GENMASK(3, 0)
+#define SDW_SHIM_LCTL_CPA		BIT(8)
+#define SDW_SHIM_LCTL_CPA_MASK		GENMASK(11, 8)
+
+#define SDW_SHIM_SYNC_SYNCPRD_VAL_24	(24000 / SDW_CADENCE_GSYNC_KHZ - 1)
+#define SDW_SHIM_SYNC_SYNCPRD_VAL_38_4	(38400 / SDW_CADENCE_GSYNC_KHZ - 1)
+#define SDW_SHIM_SYNC_SYNCPRD		GENMASK(14, 0)
+#define SDW_SHIM_SYNC_SYNCCPU		BIT(15)
+#define SDW_SHIM_SYNC_CMDSYNC_MASK	GENMASK(19, 16)
+#define SDW_SHIM_SYNC_CMDSYNC		BIT(16)
+#define SDW_SHIM_SYNC_SYNCGO		BIT(24)
+
+#define SDW_SHIM_PCMSCAP_ISS		GENMASK(3, 0)
+#define SDW_SHIM_PCMSCAP_OSS		GENMASK(7, 4)
+#define SDW_SHIM_PCMSCAP_BSS		GENMASK(12, 8)
+
+#define SDW_SHIM_PCMSYCM_LCHN		GENMASK(3, 0)
+#define SDW_SHIM_PCMSYCM_HCHN		GENMASK(7, 4)
+#define SDW_SHIM_PCMSYCM_STREAM		GENMASK(13, 8)
+#define SDW_SHIM_PCMSYCM_DIR		BIT(15)
+
+#define SDW_SHIM_PDMSCAP_ISS		GENMASK(3, 0)
+#define SDW_SHIM_PDMSCAP_OSS		GENMASK(7, 4)
+#define SDW_SHIM_PDMSCAP_BSS		GENMASK(12, 8)
+#define SDW_SHIM_PDMSCAP_CPSS		GENMASK(15, 13)
+
+#define SDW_SHIM_IOCTL_MIF		BIT(0)
+#define SDW_SHIM_IOCTL_CO		BIT(1)
+#define SDW_SHIM_IOCTL_COE		BIT(2)
+#define SDW_SHIM_IOCTL_DO		BIT(3)
+#define SDW_SHIM_IOCTL_DOE		BIT(4)
+#define SDW_SHIM_IOCTL_BKE		BIT(5)
+#define SDW_SHIM_IOCTL_WPDD		BIT(6)
+#define SDW_SHIM_IOCTL_CIBD		BIT(8)
+#define SDW_SHIM_IOCTL_DIBD		BIT(9)
+
+#define SDW_SHIM_CTMCTL_DACTQE		BIT(0)
+#define SDW_SHIM_CTMCTL_DODS		BIT(1)
+#define SDW_SHIM_CTMCTL_DOAIS		GENMASK(4, 3)
+
+#define SDW_SHIM_WAKEEN_ENABLE		BIT(0)
+#define SDW_SHIM_WAKESTS_STATUS		BIT(0)
+
+/* Intel ALH Register definitions */
+#define SDW_ALH_STRMZCFG(x)		(0x000 + (0x4 * (x)))
+#define SDW_ALH_NUM_STREAMS		64
+
+#define SDW_ALH_STRMZCFG_DMAT_VAL	0x3
+#define SDW_ALH_STRMZCFG_DMAT		GENMASK(7, 0)
+#define SDW_ALH_STRMZCFG_CHN		GENMASK(19, 16)
+
 /**
  * struct sdw_intel_stream_params_data: configuration passed during
  * the @params_stream callback, e.g. for interaction with DSP
-- 
2.17.1

