Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5BA62EC35
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Nov 2022 03:57:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4530B16D7;
	Fri, 18 Nov 2022 03:56:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4530B16D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668740237;
	bh=ZsbjKmI8r3wmxokls6Yj3fJektnJREEilC4V+S5EGkY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aYb8opmzzk+c//K+0qBnt3vGvDkH4b2E2c+BJXgMGTg0NtxDjU47ewee7WN742LHj
	 aGPVWbrUICaBQ4UruDUGJ87NKX6QDdUq2Fb27h06j6SgbajAgMKRvOkkn2sEHo07CR
	 I/tmUgBAynu4fvVH2sdS3UO0uvJJBXEQ78Ey1krI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20D84F804D8;
	Fri, 18 Nov 2022 03:55:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA0B4F800B5; Fri, 18 Nov 2022 03:55:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78A1DF800B5
 for <alsa-devel@alsa-project.org>; Fri, 18 Nov 2022 03:55:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78A1DF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="amHMwDEO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668740153; x=1700276153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZsbjKmI8r3wmxokls6Yj3fJektnJREEilC4V+S5EGkY=;
 b=amHMwDEObN52cMx3/mLdhg29DBXC5u/Nhe2Zi9BetFJt4yg7DQc70/Uz
 IeRzjw90Sy1EPW9JJ9p/1LhCVlr5kfzGLE9vKTVqfBgNmixl08Agath+A
 nJ/E1V5cTiGvhyC3DDGnxD+K28DHOhNrZwl6fpbv4AD+XtVeq4ckMyr4+
 F7OZGSqDyiy0qI2KIz0mqxwOqZ5St1fu2Lau1PkDAzaKRNTXCAM62e3Zj
 1ptaj5O/c4p1IdV2ERGOIa6hCvYGuYlzUCPKuyc6b6FHAiung/ZZvzROQ
 s+AkW8rYJRz17OHj3WhpOS3UvfaAKclGcAhyBL6bGOPYeVVbcsH8G+C7Q Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="399323288"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="399323288"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 18:55:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="642347884"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="642347884"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 18:55:45 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH v2 1/2] ASoC/soundwire: remove is_sdca boolean property
Date: Fri, 18 Nov 2022 10:58:06 +0800
Message-Id: <20221118025807.534863-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221118025807.534863-1-yung-chuan.liao@linux.intel.com>
References: <20221118025807.534863-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, vinod.koul@linaro.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, vkoul@kernel.org,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
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

The Device_ID registers already tell us if a device supports the SDCA
specification or not, in hindsight we never needed a property when the
information is reported by both hardware and ACPI.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c           | 4 ++--
 include/linux/soundwire/sdw.h     | 2 --
 sound/soc/codecs/rt1316-sdw.c     | 1 -
 sound/soc/codecs/rt1318-sdw.c     | 1 -
 sound/soc/codecs/rt711-sdca-sdw.c | 1 -
 5 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 76515c33e639..c23275b443ac 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1587,7 +1587,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		goto io_err;
 	}
 
-	if (slave->prop.is_sdca) {
+	if (slave->id.class_id) {
 		ret = sdw_read_no_pm(slave, SDW_DP0_INT);
 		if (ret < 0) {
 			dev_err(&slave->dev,
@@ -1724,7 +1724,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 			goto io_err;
 		}
 
-		if (slave->prop.is_sdca) {
+		if (slave->id.class_id) {
 			ret = sdw_read_no_pm(slave, SDW_DP0_INT);
 			if (ret < 0) {
 				dev_err(&slave->dev,
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 9e4537f409c2..8fb458931772 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -365,7 +365,6 @@ struct sdw_dpn_prop {
  * @sink_dpn_prop: Sink Data Port N properties
  * @scp_int1_mask: SCP_INT1_MASK desired settings
  * @quirks: bitmask identifying deltas from the MIPI specification
- * @is_sdca: the Slave supports the SDCA specification
  */
 struct sdw_slave_prop {
 	u32 mipi_revision;
@@ -389,7 +388,6 @@ struct sdw_slave_prop {
 	struct sdw_dpn_prop *sink_dpn_prop;
 	u8 scp_int1_mask;
 	u32 quirks;
-	bool is_sdca;
 };
 
 #define SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY	BIT(0)
diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index 2db7ee6c6d33..fbc7e9c0254d 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -203,7 +203,6 @@ static int rt1316_read_prop(struct sdw_slave *slave)
 
 	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
 	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
-	prop->is_sdca = true;
 
 	prop->paging_support = true;
 
diff --git a/sound/soc/codecs/rt1318-sdw.c b/sound/soc/codecs/rt1318-sdw.c
index f85f5ab2c6d0..8bc379215c34 100644
--- a/sound/soc/codecs/rt1318-sdw.c
+++ b/sound/soc/codecs/rt1318-sdw.c
@@ -353,7 +353,6 @@ static int rt1318_read_prop(struct sdw_slave *slave)
 
 	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
 	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
-	prop->is_sdca = true;
 
 	prop->paging_support = true;
 
diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index 88a8392a58ed..693e11ed8d08 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -186,7 +186,6 @@ static int rt711_sdca_read_prop(struct sdw_slave *slave)
 
 	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
 	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
-	prop->is_sdca = true;
 
 	prop->paging_support = true;
 
-- 
2.25.1

