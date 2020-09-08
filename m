Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C13262491
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 03:41:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C286416F1;
	Wed,  9 Sep 2020 03:40:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C286416F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599615707;
	bh=rGWERoMeOosP6Nsh6DcF16crGKzKcNDVDvKSJJ3i0jE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=onAXMuI+DklYtEZ1iuOVY/MhBtC5o570Tz3xLXRT/fOLv7+P3URRmaga0jSK44zep
	 ghRhXjuoLXv1BS5YXYC0ujv/C+vSp1ZPXMPmRwdrwFqKA06XshiKc+kFrS8J14ABoY
	 uDp4S0bAr0x5i6mt+evUOGWCvPWk0dSI79QdVsDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31C74F80227;
	Wed,  9 Sep 2020 03:39:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3ED40F80227; Wed,  9 Sep 2020 03:39:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7505AF8021C
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 03:39:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7505AF8021C
IronPort-SDR: 4RSFNFuluCivYEybOgmCYCP16XNZIJUTGSeSKLln62LyQR7QTAZinKJ7EJdEsh1oE1VPgCDysg
 3VSl2wJnTnnQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="222458453"
X-IronPort-AV: E=Sophos;i="5.76,407,1592895600"; d="scan'208";a="222458453"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 18:39:09 -0700
IronPort-SDR: 4Y/nVQLmp2/69nk+7VA7hvE42A+kw6HtYXUyDSrp6OYe3a346nfWo++toTSkfXgcaZYkRhmxsM
 vnfJ9OXI/6gQ==
X-IronPort-AV: E=Sophos;i="5.76,407,1592895600"; d="scan'208";a="449018085"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 18:39:05 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 1/7] ASoC/soundwire: bus: use property to set interrupt
 masks
Date: Tue,  8 Sep 2020 21:45:15 +0800
Message-Id: <20200908134521.6781-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200908134521.6781-1-yung-chuan.liao@linux.intel.com>
References: <20200908134521.6781-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

Add a slave-level property and program the SCP_INT1_MASK as desired by
the codec driver. Since there is no DisCo property this has to be an
implementation-specific firmware property or hard-coded in the driver.

The only functionality change is that implementation-defined
interrupts are no longer set for amplifiers - those interrupts are
typically for jack detection or acoustic event detection/hotwording.

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c         | 12 ++++++------
 include/linux/soundwire/sdw.h   |  2 ++
 sound/soc/codecs/max98373-sdw.c |  3 +++
 sound/soc/codecs/rt1308-sdw.c   |  2 ++
 sound/soc/codecs/rt5682-sdw.c   |  4 ++++
 sound/soc/codecs/rt700-sdw.c    |  4 ++++
 sound/soc/codecs/rt711-sdw.c    |  4 ++++
 sound/soc/codecs/rt715-sdw.c    |  4 ++++
 sound/soc/codecs/wsa881x.c      |  1 +
 9 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index d808f0256ba0..9f4cc24ccea3 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1184,13 +1184,13 @@ static int sdw_initialize_slave(struct sdw_slave *slave)
 		return ret;
 
 	/*
-	 * Set bus clash, parity and SCP implementation
-	 * defined interrupt mask
-	 * TODO: Read implementation defined interrupt mask
-	 * from Slave property
+	 * Set SCP_INT1_MASK register, typically bus clash and
+	 * implementation-defined interrupt mask. The Parity detection
+	 * may not always be correct on startup so its use is
+	 * device-dependent, it might e.g. only be enabled in
+	 * steady-state after a couple of frames.
 	 */
-	val = SDW_SCP_INT1_IMPL_DEF | SDW_SCP_INT1_BUS_CLASH |
-					SDW_SCP_INT1_PARITY;
+	val = slave->prop.scp_int1_mask;
 
 	/* Enable SCP interrupts */
 	ret = sdw_update(slave, SDW_SCP_INTMASK1, val, val);
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 1e9010c139f0..9d94cdf6346f 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -357,6 +357,7 @@ struct sdw_dpn_prop {
  * @dp0_prop: Data Port 0 properties
  * @src_dpn_prop: Source Data Port N properties
  * @sink_dpn_prop: Sink Data Port N properties
+ * @scp_int1_mask: SCP_INT1_MASK desired settings
  */
 struct sdw_slave_prop {
 	u32 mipi_revision;
@@ -378,6 +379,7 @@ struct sdw_slave_prop {
 	struct sdw_dp0_prop *dp0_prop;
 	struct sdw_dpn_prop *src_dpn_prop;
 	struct sdw_dpn_prop *sink_dpn_prop;
+	u8 scp_int1_mask;
 };
 
 /**
diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index a3ec92775ea7..76ddde509a08 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -15,6 +15,7 @@
 #include <linux/of.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_type.h>
+#include <linux/soundwire/sdw_registers.h>
 #include "max98373.h"
 #include "max98373-sdw.h"
 
@@ -287,6 +288,8 @@ static int max98373_read_prop(struct sdw_slave *slave)
 	unsigned long addr;
 	struct sdw_dpn_prop *dpn;
 
+	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
+
 	/* BITMAP: 00001000  Dataport 3 is active */
 	prop->source_ports = BIT(3);
 	/* BITMAP: 00000010  Dataport 1 is active */
diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 09c69dbab12a..e02b325240df 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -123,6 +123,8 @@ static int rt1308_read_prop(struct sdw_slave *slave)
 	unsigned long addr;
 	struct sdw_dpn_prop *dpn;
 
+	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
+
 	prop->paging_support = true;
 
 	/* first we need to allocate memory for set bits in port lists */
diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index b7c97aba7f17..8d4ea46bc6b5 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -19,6 +19,7 @@
 #include <linux/mutex.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_type.h>
+#include <linux/soundwire/sdw_registers.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -542,6 +543,9 @@ static int rt5682_read_prop(struct sdw_slave *slave)
 	unsigned long addr;
 	struct sdw_dpn_prop *dpn;
 
+	prop->scp_int1_mask = SDW_SCP_INT1_IMPL_DEF | SDW_SCP_INT1_BUS_CLASH |
+		SDW_SCP_INT1_PARITY;
+
 	prop->paging_support = false;
 
 	/* first we need to allocate memory for set bits in port lists */
diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index b19fbcc12c69..8d9678d1f3c7 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -11,6 +11,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_type.h>
+#include <linux/soundwire/sdw_registers.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <sound/soc.h>
@@ -338,6 +339,9 @@ static int rt700_read_prop(struct sdw_slave *slave)
 	unsigned long addr;
 	struct sdw_dpn_prop *dpn;
 
+	prop->scp_int1_mask = SDW_SCP_INT1_IMPL_DEF | SDW_SCP_INT1_BUS_CLASH |
+		SDW_SCP_INT1_PARITY;
+
 	prop->paging_support = false;
 
 	/* first we need to allocate memory for set bits in port lists */
diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index dc4a2b482462..d4b3d7716cac 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -11,6 +11,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_type.h>
+#include <linux/soundwire/sdw_registers.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <sound/soc.h>
@@ -342,6 +343,9 @@ static int rt711_read_prop(struct sdw_slave *slave)
 	unsigned long addr;
 	struct sdw_dpn_prop *dpn;
 
+	prop->scp_int1_mask = SDW_SCP_INT1_IMPL_DEF | SDW_SCP_INT1_BUS_CLASH |
+		SDW_SCP_INT1_PARITY;
+
 	prop->paging_support = false;
 
 	/* first we need to allocate memory for set bits in port lists */
diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index d8ed07305ffc..0e5c75f85926 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -12,6 +12,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_type.h>
+#include <linux/soundwire/sdw_registers.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
@@ -436,6 +437,9 @@ static int rt715_read_prop(struct sdw_slave *slave)
 	unsigned long addr;
 	struct sdw_dpn_prop *dpn;
 
+	prop->scp_int1_mask = SDW_SCP_INT1_IMPL_DEF | SDW_SCP_INT1_BUS_CLASH |
+		SDW_SCP_INT1_PARITY;
+
 	prop->paging_support = false;
 
 	/* first we need to allocate memory for set bits in port lists */
diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index d39d479e2378..68e774e69c85 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1112,6 +1112,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 	wsa881x->sconfig.type = SDW_STREAM_PDM;
 	pdev->prop.sink_ports = GENMASK(WSA881X_MAX_SWR_PORTS, 0);
 	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
+	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
 	gpiod_direction_output(wsa881x->sd_n, 1);
 
 	wsa881x->regmap = devm_regmap_init_sdw(pdev, &wsa881x_regmap_config);
-- 
2.17.1

