Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 387FF62500C
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 03:16:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCF021670;
	Fri, 11 Nov 2022 03:15:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCF021670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668132974;
	bh=aszcFf1expwwBBUpdvSSxdjfZppq0RpVWeHal7GmSks=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CnoOJ7BsprdDvmYF+i2So8jm3YD8PoZbPV8bThDpaCqvUpMta9xwJddShf/nF52JH
	 VwZtR11Khn59ASkW1H3H/fOEN6Tt6FHRUMfHcXdrXQ4rpRR8UuiSD7z9OGHfNQvWrr
	 tJwpF6Bt/4DI0shUaNe4+Z2UAKklZxScmmuKGleA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9975F80114;
	Fri, 11 Nov 2022 03:14:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1CA6F804FF; Fri, 11 Nov 2022 03:14:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E36A2F80114
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 03:14:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E36A2F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dZKWf32c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668132892; x=1699668892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aszcFf1expwwBBUpdvSSxdjfZppq0RpVWeHal7GmSks=;
 b=dZKWf32cRoVaYzi13PF2Df/Q4Mhu5GYEauf9O8aUcCM/MPf15VBWUrBy
 4c3GvZaeOYtz7tDBN9/kcnkEh81GAINXbzXUdJrcqkc9DyOzPrrCdSwtn
 d5uav6K1iFtsj9RTaMv5g0f4UTbHxVVlmCOH3U6lHZgRgbHKe28+dyK06
 l/9SnPV+1jB5x4fEYzn0WwkinAlZcckLoMtODxhTKaiytL48ItumRoB78
 8UWW4vqJA/lyC61KjUhJXhMWmAu64Az3vSkGKwD8tFObtoMey7Ey+Covy
 1tkZ5l4xRUOPifJ9sgNswV7B8zwIeyNRN+QxHsO9HU5wyj57m22BTojoG g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="291904404"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="291904404"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 18:14:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="615335547"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="615335547"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 18:14:44 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 1/2] soundwire: remove is_sdca boolean property
Date: Fri, 11 Nov 2022 10:16:32 +0800
Message-Id: <20221111021633.39908-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111021633.39908-1-yung-chuan.liao@linux.intel.com>
References: <20221111021633.39908-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 sound/soc/codecs/rt711-sdca-sdw.c | 1 -
 4 files changed, 2 insertions(+), 6 deletions(-)

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
index ed0a11436362..8b27401237f7 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -203,7 +203,6 @@ static int rt1316_read_prop(struct sdw_slave *slave)
 
 	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
 	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
-	prop->is_sdca = true;
 
 	prop->paging_support = true;
 
diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index 4120842fe699..6ca8795eed68 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -186,7 +186,6 @@ static int rt711_sdca_read_prop(struct sdw_slave *slave)
 
 	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
 	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
-	prop->is_sdca = true;
 
 	prop->paging_support = true;
 
-- 
2.25.1

