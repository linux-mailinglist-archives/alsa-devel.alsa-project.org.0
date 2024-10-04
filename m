Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B0C990B52
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2024 20:26:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46A86B6A;
	Fri,  4 Oct 2024 20:26:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46A86B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728066392;
	bh=mzsbmkV0hCx2JN++0RDlnBmuHV6SBxJB1kzWYjTHHYc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N0Vh5pos38DmZj4JIQbqcFMDvK9uDSjJhug05fip2GRshgmfv45ayidODuk3eL4bp
	 +nLEeImnz1ylkBqVVt0A3uCXw2BfIzc3TDzjmIQiGfZCopxtS7mn3wYdHqawVO4wLx
	 4PAB3EVffv80zqr2qMXqP0cGU431QjP8lV5TJiqs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53ADFF805C7; Fri,  4 Oct 2024 20:26:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B71A3F805C6;
	Fri,  4 Oct 2024 20:26:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA132F805B0; Fri,  4 Oct 2024 20:26:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CBA2CF805AC
	for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2024 20:26:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBA2CF805AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=i/P06Z7C
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D627E5C04CE;
	Fri,  4 Oct 2024 18:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B99D0C4CECC;
	Fri,  4 Oct 2024 18:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728066363;
	bh=mzsbmkV0hCx2JN++0RDlnBmuHV6SBxJB1kzWYjTHHYc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i/P06Z7C2TYFLaLMED9FXy/DQY3SrSDN7EjhbB0zPd1EN4mFbDTPaQwqShtaypWzM
	 iLT8bL0Ql95PHLBVeQETsBhfYEQBXAYdgRbzYpjFG3f/DjY/4SnPNcrbwX2UCmZR/w
	 6RUC+N0LVmvjesPXU0tWnMUEpnO7IjfVTTnDr12Ed60+uofi4YAGkNqIK9shzNp664
	 naGULd+yJg/JDci8xtB0/UL3cWcvCiyhn41knhE+6R+HAnKL8h8PwRMDdG4+O9wfgy
	 Tzaq3TmTcjz+cnDImLsGyAQScu0rAkBW15HiKbsb5pYW93biPZobZH8qXKzkbqHWcY
	 A6n3fyFNhMCDQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.6 34/58] soundwire: cadence: re-check Peripheral
 status with delayed_work
Date: Fri,  4 Oct 2024 14:24:07 -0400
Message-ID: <20241004182503.3672477-34-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004182503.3672477-1-sashal@kernel.org>
References: <20241004182503.3672477-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.54
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QZRYRJ5WZSAIZK63HOSA4T62VYW6GMM4
X-Message-ID-Hash: QZRYRJ5WZSAIZK63HOSA4T62VYW6GMM4
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QZRYRJ5WZSAIZK63HOSA4T62VYW6GMM4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit f8c35d61ba01afa76846905c67862cdace7f66b0 ]

The SoundWire peripheral enumeration is entirely based on interrupts,
more specifically sticky bits tracking state changes.

This patch adds a defensive programming check on the actual status
reported in PING frames. If for some reason an interrupt was lost or
delayed, the delayed work would detect a peripheral change of status
after the bus starts.

The 100ms defined for the delay is not completely arbitrary, if a
Peripheral didn't join the bus within that delay then probably the
hardware link is broken, and conversely if the detection didn't happen
because of software issues the 100ms is still acceptable in terms of
user experience.

The overhead of the one-shot workqueue is minimal, and the mutual
exclusion ensures that the interrupt and delayed work cannot update
the status concurrently.

Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20240805114921.88007-1-yung-chuan.liao@linux.intel.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soundwire/cadence_master.c   | 39 ++++++++++++++++++++++++++--
 drivers/soundwire/cadence_master.h   |  5 ++++
 drivers/soundwire/intel.h            |  2 ++
 drivers/soundwire/intel_auxdevice.c  |  1 +
 drivers/soundwire/intel_bus_common.c | 11 ++++++++
 5 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 3e7cf04aaf2a6..e69982dbd449b 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -891,8 +891,14 @@ static int cdns_update_slave_status(struct sdw_cdns *cdns,
 		}
 	}
 
-	if (is_slave)
-		return sdw_handle_slave_status(&cdns->bus, status);
+	if (is_slave) {
+		int ret;
+
+		mutex_lock(&cdns->status_update_lock);
+		ret = sdw_handle_slave_status(&cdns->bus, status);
+		mutex_unlock(&cdns->status_update_lock);
+		return ret;
+	}
 
 	return 0;
 }
@@ -989,6 +995,31 @@ irqreturn_t sdw_cdns_irq(int irq, void *dev_id)
 }
 EXPORT_SYMBOL(sdw_cdns_irq);
 
+static void cdns_check_attached_status_dwork(struct work_struct *work)
+{
+	struct sdw_cdns *cdns =
+		container_of(work, struct sdw_cdns, attach_dwork.work);
+	enum sdw_slave_status status[SDW_MAX_DEVICES + 1];
+	u32 val;
+	int ret;
+	int i;
+
+	val = cdns_readl(cdns, CDNS_MCP_SLAVE_STAT);
+
+	for (i = 0; i <= SDW_MAX_DEVICES; i++) {
+		status[i] = val & 0x3;
+		if (status[i])
+			dev_dbg(cdns->dev, "Peripheral %d status: %d\n", i, status[i]);
+		val >>= 2;
+	}
+
+	mutex_lock(&cdns->status_update_lock);
+	ret = sdw_handle_slave_status(&cdns->bus, status);
+	mutex_unlock(&cdns->status_update_lock);
+	if (ret < 0)
+		dev_err(cdns->dev, "%s: sdw_handle_slave_status failed: %d\n", __func__, ret);
+}
+
 /**
  * cdns_update_slave_status_work - update slave status in a work since we will need to handle
  * other interrupts eg. CDNS_MCP_INT_RX_WL during the update slave
@@ -1745,7 +1776,11 @@ int sdw_cdns_probe(struct sdw_cdns *cdns)
 	init_completion(&cdns->tx_complete);
 	cdns->bus.port_ops = &cdns_port_ops;
 
+	mutex_init(&cdns->status_update_lock);
+
 	INIT_WORK(&cdns->work, cdns_update_slave_status_work);
+	INIT_DELAYED_WORK(&cdns->attach_dwork, cdns_check_attached_status_dwork);
+
 	return 0;
 }
 EXPORT_SYMBOL(sdw_cdns_probe);
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index bc84435e420f5..e1d7969ba48ae 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -117,6 +117,8 @@ struct sdw_cdns_dai_runtime {
  * @link_up: Link status
  * @msg_count: Messages sent on bus
  * @dai_runtime_array: runtime context for each allocated DAI.
+ * @status_update_lock: protect concurrency between interrupt-based and delayed work
+ * status update
  */
 struct sdw_cdns {
 	struct device *dev;
@@ -148,10 +150,13 @@ struct sdw_cdns {
 	bool interrupt_enabled;
 
 	struct work_struct work;
+	struct delayed_work attach_dwork;
 
 	struct list_head list;
 
 	struct sdw_cdns_dai_runtime **dai_runtime_array;
+
+	struct mutex status_update_lock; /* add mutual exclusion to sdw_handle_slave_status() */
 };
 
 #define bus_to_cdns(_bus) container_of(_bus, struct sdw_cdns, bus)
diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 511932c55216c..bb6b1df2d2c20 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -91,6 +91,8 @@ static inline void intel_writew(void __iomem *base, int offset, u16 value)
 
 #define INTEL_MASTER_RESET_ITERATIONS	10
 
+#define SDW_INTEL_DELAYED_ENUMERATION_MS	100
+
 #define SDW_INTEL_CHECK_OPS(sdw, cb)	((sdw) && (sdw)->link_res && (sdw)->link_res->hw_ops && \
 					 (sdw)->link_res->hw_ops->cb)
 #define SDW_INTEL_OPS(sdw, cb)		((sdw)->link_res->hw_ops->cb)
diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 93698532deac4..bdfff78ac2f81 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -398,6 +398,7 @@ static void intel_link_remove(struct auxiliary_device *auxdev)
 	 */
 	if (!bus->prop.hw_disabled) {
 		sdw_intel_debugfs_exit(sdw);
+		cancel_delayed_work_sync(&cdns->attach_dwork);
 		sdw_cdns_enable_interrupt(cdns, false);
 	}
 	sdw_bus_master_delete(bus);
diff --git a/drivers/soundwire/intel_bus_common.c b/drivers/soundwire/intel_bus_common.c
index 179aa0d85951b..db9cf211671a3 100644
--- a/drivers/soundwire/intel_bus_common.c
+++ b/drivers/soundwire/intel_bus_common.c
@@ -60,6 +60,9 @@ int intel_start_bus(struct sdw_intel *sdw)
 	sdw_cdns_check_self_clearing_bits(cdns, __func__,
 					  true, INTEL_MASTER_RESET_ITERATIONS);
 
+	schedule_delayed_work(&cdns->attach_dwork,
+			      msecs_to_jiffies(SDW_INTEL_DELAYED_ENUMERATION_MS));
+
 	return 0;
 }
 
@@ -151,6 +154,9 @@ int intel_start_bus_after_reset(struct sdw_intel *sdw)
 	}
 	sdw_cdns_check_self_clearing_bits(cdns, __func__, true, INTEL_MASTER_RESET_ITERATIONS);
 
+	schedule_delayed_work(&cdns->attach_dwork,
+			      msecs_to_jiffies(SDW_INTEL_DELAYED_ENUMERATION_MS));
+
 	return 0;
 }
 
@@ -184,6 +190,9 @@ int intel_start_bus_after_clock_stop(struct sdw_intel *sdw)
 
 	sdw_cdns_check_self_clearing_bits(cdns, __func__, true, INTEL_MASTER_RESET_ITERATIONS);
 
+	schedule_delayed_work(&cdns->attach_dwork,
+			      msecs_to_jiffies(SDW_INTEL_DELAYED_ENUMERATION_MS));
+
 	return 0;
 }
 
@@ -194,6 +203,8 @@ int intel_stop_bus(struct sdw_intel *sdw, bool clock_stop)
 	bool wake_enable = false;
 	int ret;
 
+	cancel_delayed_work_sync(&cdns->attach_dwork);
+
 	if (clock_stop) {
 		ret = sdw_cdns_clock_stop(cdns, true);
 		if (ret < 0)
-- 
2.43.0

