Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 290AB990AF3
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2024 20:20:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C00CD82B;
	Fri,  4 Oct 2024 20:20:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C00CD82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728066029;
	bh=5Sirsl81FiH2D48MYd0spz+0sJvGdZ/Tfdt6W71no2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T0tjI3Q5KpFKz59OpTb/XCK9Q7DBUPfMf+Fygz6vkPD/9duPOI7GZumdEzIYYyJM4
	 u15gGfydnnFkUOCCpex/NvdaF5hJcsKuHgXBtSN3OwQrwmOO+R2yVja2ff8MtCIFwz
	 oT+tawR6bQgmHRjhl3SY9VuBCmI5HarngnDh/ElY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55C53F805D6; Fri,  4 Oct 2024 20:19:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB45DF805C9;
	Fri,  4 Oct 2024 20:19:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B37DFF80580; Fri,  4 Oct 2024 20:19:51 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C10CF80107
	for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2024 20:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C10CF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bVe6GwoY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A4845C5DB2;
	Fri,  4 Oct 2024 18:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D56C4CEC6;
	Fri,  4 Oct 2024 18:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728065987;
	bh=5Sirsl81FiH2D48MYd0spz+0sJvGdZ/Tfdt6W71no2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bVe6GwoY4KqMxvXwAJDVs8z54RtUPTd0akm5YqTthUU1lgnQ1beTRfL/1Pzzp8QCe
	 pLgtYdZLZG4hnup41JZnCKzqRXszl1v63XmHLFeCuHwpwnF7KPV3Cr78PBlp+qL2aH
	 VaCayZt4v9pMBUmiYT7SjzZ6jTCsks4R4as9fY/R5T8ZzpMgOoLwk9pCkuClzbTxp6
	 ku1+S0BX4OaSDji73ypMLQA8YoU16LZHlcUvoNfR/TWC1H4naS9dzNbmUqX2za4pJX
	 cfqiqLqARKIrfPbl03Xuidv2ESikd1UtO+x1OMFf95rlpF3buxIXlzT30q0wX4Kem1
	 rA2J8HAmXyOnA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.11 42/76] soundwire: cadence: re-check Peripheral
 status with delayed_work
Date: Fri,  4 Oct 2024 14:16:59 -0400
Message-ID: <20241004181828.3669209-42-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004181828.3669209-1-sashal@kernel.org>
References: <20241004181828.3669209-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.2
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BTKGZIINGW6F6MZJVQM5E2ESX5C2L7ZC
X-Message-ID-Hash: BTKGZIINGW6F6MZJVQM5E2ESX5C2L7ZC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BTKGZIINGW6F6MZJVQM5E2ESX5C2L7ZC/>
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
index e0683a5975d10..05652e983539b 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -890,8 +890,14 @@ static int cdns_update_slave_status(struct sdw_cdns *cdns,
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
@@ -988,6 +994,31 @@ irqreturn_t sdw_cdns_irq(int irq, void *dev_id)
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
@@ -1740,7 +1771,11 @@ int sdw_cdns_probe(struct sdw_cdns *cdns)
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
index 68838e843b543..f4235f5991c37 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -103,6 +103,8 @@ static inline void intel_writew(void __iomem *base, int offset, u16 value)
 
 #define INTEL_MASTER_RESET_ITERATIONS	10
 
+#define SDW_INTEL_DELAYED_ENUMERATION_MS	100
+
 #define SDW_INTEL_CHECK_OPS(sdw, cb)	((sdw) && (sdw)->link_res && (sdw)->link_res->hw_ops && \
 					 (sdw)->link_res->hw_ops->cb)
 #define SDW_INTEL_OPS(sdw, cb)		((sdw)->link_res->hw_ops->cb)
diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 8807e01cbf7c7..dff49c5ce5b30 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -475,6 +475,7 @@ static void intel_link_remove(struct auxiliary_device *auxdev)
 	 */
 	if (!bus->prop.hw_disabled) {
 		sdw_intel_debugfs_exit(sdw);
+		cancel_delayed_work_sync(&cdns->attach_dwork);
 		sdw_cdns_enable_interrupt(cdns, false);
 	}
 	sdw_bus_master_delete(bus);
diff --git a/drivers/soundwire/intel_bus_common.c b/drivers/soundwire/intel_bus_common.c
index a75e5d7d87154..d3ff6c65b64c3 100644
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

