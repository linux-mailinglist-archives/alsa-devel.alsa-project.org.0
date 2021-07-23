Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B993D39DE
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jul 2021 13:59:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C22C172E;
	Fri, 23 Jul 2021 13:58:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C22C172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627041542;
	bh=d/v+eKQIltOHlJGn0n5hOQgYImu7lpKX//LyUiT2D2c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tnz0NCrNh8c2/VLLJil0vXO+IYyGuDk7klWlRwNY5+0t8QeZfntzFSbaYS6c1heCT
	 BE1XzhNprmABrHDgQL8zUN/mw6l6Z8HuWilND9qG7aUA9REYg3Tbs+ToirxqqGFR0M
	 AaydlG6ES/pax8TmRW4bQgM8jzyl1nGr9XxFkbJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABBF1F80507;
	Fri, 23 Jul 2021 13:55:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2F6EF804F2; Fri, 23 Jul 2021 13:55:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EA6DF804BD
 for <alsa-devel@alsa-project.org>; Fri, 23 Jul 2021 13:55:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EA6DF804BD
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="209972222"
X-IronPort-AV: E=Sophos;i="5.84,263,1620716400"; d="scan'208";a="209972222"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 04:55:19 -0700
X-IronPort-AV: E=Sophos;i="5.84,263,1620716400"; d="scan'208";a="455069803"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2021 04:55:16 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 6/6] soundwire: intel: introduce shim and alh base
Date: Fri, 23 Jul 2021 19:54:51 +0800
Message-Id: <20210723115451.7245-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210723115451.7245-1-yung-chuan.liao@linux.intel.com>
References: <20210723115451.7245-1-yung-chuan.liao@linux.intel.com>
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

shim base and alh base are platform-dependent. Adding these two
parameters allows us to use different shim/alh base for each
platform.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 drivers/soundwire/intel_init.c      | 8 +++++---
 include/linux/soundwire/sdw_intel.h | 8 ++++++++
 sound/soc/sof/intel/hda.c           | 2 ++
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index 03ff69ab1797..e329022e1669 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -63,8 +63,8 @@ static struct sdw_intel_link_dev *intel_link_dev_register(struct sdw_intel_res *
 	link->mmio_base = res->mmio_base;
 	link->registers = res->mmio_base + SDW_LINK_BASE
 		+ (SDW_LINK_SIZE * link_id);
-	link->shim = res->mmio_base + SDW_SHIM_BASE;
-	link->alh = res->mmio_base + SDW_ALH_BASE;
+	link->shim = res->mmio_base + res->shim_base;
+	link->alh = res->mmio_base + res->alh_base;
 
 	link->ops = res->ops;
 	link->dev = res->dev;
@@ -214,6 +214,8 @@ static struct sdw_intel_ctx
 	}
 
 	ctx->mmio_base = res->mmio_base;
+	ctx->shim_base = res->shim_base;
+	ctx->alh_base = res->alh_base;
 	ctx->link_mask = res->link_mask;
 	ctx->handle = res->handle;
 	mutex_init(&ctx->shim_lock);
@@ -302,7 +304,7 @@ sdw_intel_startup_controller(struct sdw_intel_ctx *ctx)
 		return -EINVAL;
 
 	/* Check SNDWLCAP.LCOUNT */
-	caps = ioread32(ctx->mmio_base + SDW_SHIM_BASE + SDW_SHIM_LCAP);
+	caps = ioread32(ctx->mmio_base + ctx->shim_base + SDW_SHIM_LCAP);
 	caps &= GENMASK(2, 0);
 
 	/* Check HW supported vs property value */
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 7fce6aee0c36..8a463b8fc12a 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -195,6 +195,8 @@ struct sdw_intel_slave_id {
  * @link_list: list to handle interrupts across all links
  * @shim_lock: mutex to handle concurrent rmw access to shared SHIM registers.
  * @shim_mask: flags to track initialization of SHIM shared registers
+ * @shim_base: sdw shim base.
+ * @alh_base: sdw alh base.
  */
 struct sdw_intel_ctx {
 	int count;
@@ -207,6 +209,8 @@ struct sdw_intel_ctx {
 	struct list_head link_list;
 	struct mutex shim_lock; /* lock for access to shared SHIM registers */
 	u32 shim_mask;
+	u32 shim_base;
+	u32 alh_base;
 };
 
 /**
@@ -225,6 +229,8 @@ struct sdw_intel_ctx {
  * machine-specific quirks are handled in the DSP driver.
  * @clock_stop_quirks: mask array of possible behaviors requested by the
  * DSP driver. The quirks are common for all links for now.
+ * @shim_base: sdw shim base.
+ * @alh_base: sdw alh base.
  */
 struct sdw_intel_res {
 	int count;
@@ -236,6 +242,8 @@ struct sdw_intel_res {
 	struct device *dev;
 	u32 link_mask;
 	u32 clock_stop_quirks;
+	u32 shim_base;
+	u32 alh_base;
 };
 
 /*
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index c979581c6812..b4e35fbbe693 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -166,6 +166,8 @@ static int hda_sdw_probe(struct snd_sof_dev *sdev)
 	memset(&res, 0, sizeof(res));
 
 	res.mmio_base = sdev->bar[HDA_DSP_BAR];
+	res.shim_base = hdev->desc->sdw_shim_base;
+	res.alh_base = hdev->desc->sdw_alh_base;
 	res.irq = sdev->ipc_irq;
 	res.handle = hdev->info.handle;
 	res.parent = sdev->dev;
-- 
2.17.1

