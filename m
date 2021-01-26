Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E000303829
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 09:40:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68CAF17C5;
	Tue, 26 Jan 2021 09:39:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68CAF17C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611650399;
	bh=x32WrkGUgQciq85+Bq+/F1Jtj/Tu1vtw2eeRIX75M4Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rRebQsto7FhJ8BgwlliEzfpqFHQPooWuzqxRVsYds8SAd3o+IHOcRz+d47+keqGD9
	 2+FWsX0AAUGDjeOllO/e9m0srx20mwLS3vkEoTP+JTyUsFmyjQ4U6ptz9CZVsAunTY
	 r0MxQI/8HLBiKUiKb0DBMyfpzaeMJjgaVGcgt4V8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C102F8015B;
	Tue, 26 Jan 2021 09:38:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDE9AF8011C; Tue, 26 Jan 2021 09:38:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77304F8011C
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 09:38:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77304F8011C
IronPort-SDR: dn/IYHZgNoatxcFriReoaXmn29osoonVIsxlepc6wZztg6RuAEEVDSoLnN1Z9q+dFXkyLLLYCB
 LkwKMqDuVIXg==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="198653710"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="198653710"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 00:38:00 -0800
IronPort-SDR: 8bmCHHC/GO89cpya/Zc4H5EOzdOzGuGl34sxhsdi9m3qpSR2jjbQBU3eFB+cUdn4ihd1DfXyHv
 9x56m0kMX5iA==
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="577731222"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 00:37:57 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 1/3] soundwire: bus: clear bus clash interrupt before the mask
 is enabled
Date: Tue, 26 Jan 2021 16:37:44 +0800
Message-Id: <20210126083746.3238-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210126083746.3238-1-yung-chuan.liao@linux.intel.com>
References: <20210126083746.3238-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com,
 srinivas.kandagatla@linaro.org, jank@cadence.com, sanyog.r.kale@intel.com,
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

The SoundWire specification allows a Slave device to report a bus clash
with the in-band interrupt mechanism when it detects a conflict while
driving a bitSlot it owns. This can be a symptom of an electrical conflict
or a programming error, and it's vital to detect reliably.

Unfortunately, on some platforms, bus clashes are randomly reported by
Slave devices after a bus reset, with an interrupt status set even before
the bus clash interrupt is enabled. These initial spurious interrupts are
not relevant and should optionally be filtered out, while leaving the
interrupt mechanism enabled to detect 'true' issues.

This patch suggests the addition of a Master level quirk to discard such
interrupts. The quirk should in theory have been added at the Slave level,
but since the problem was detected with different generations of Slave
devices it's hard to point to a specific IP. The problem might also be
board-dependent and hence dealing with a Master quirk is simpler.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/bus.c       | 10 ++++++++++
 include/linux/soundwire/sdw.h |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 6e1c988f3845..d394905936e4 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1240,6 +1240,7 @@ static int sdw_slave_set_frequency(struct sdw_slave *slave)
 static int sdw_initialize_slave(struct sdw_slave *slave)
 {
 	struct sdw_slave_prop *prop = &slave->prop;
+	int status;
 	int ret;
 	u8 val;
 
@@ -1247,6 +1248,15 @@ static int sdw_initialize_slave(struct sdw_slave *slave)
 	if (ret < 0)
 		return ret;
 
+	if (slave->bus->prop.quirks & SDW_MASTER_QUIRKS_CLEAR_INITIAL_CLASH) {
+		/* Clear bus clash interrupt before enabling interrupt mask */
+		status = sdw_read_no_pm(slave, SDW_SCP_INT1);
+		if (status & SDW_SCP_INT1_BUS_CLASH) {
+			dev_warn(&slave->dev, "Bus clash detected before INT mask is enabled\n");
+			sdw_write_no_pm(slave, SDW_SCP_INT1, SDW_SCP_INT1_BUS_CLASH);
+		}
+	}
+
 	/*
 	 * Set SCP_INT1_MASK register, typically bus clash and
 	 * implementation-defined interrupt mask. The Parity detection
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index f0b01b728640..a2766c3b603d 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -405,6 +405,7 @@ struct sdw_slave_prop {
  * command
  * @mclk_freq: clock reference passed to SoundWire Master, in Hz.
  * @hw_disabled: if true, the Master is not functional, typically due to pin-mux
+ * @quirks: bitmask identifying optional behavior beyond the scope of the MIPI specification
  */
 struct sdw_master_prop {
 	u32 revision;
@@ -421,8 +422,11 @@ struct sdw_master_prop {
 	u32 err_threshold;
 	u32 mclk_freq;
 	bool hw_disabled;
+	u32 quirks;
 };
 
+#define SDW_MASTER_QUIRKS_CLEAR_INITIAL_CLASH	BIT(0)
+
 int sdw_master_read_prop(struct sdw_bus *bus);
 int sdw_slave_read_prop(struct sdw_slave *slave);
 
-- 
2.17.1

