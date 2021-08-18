Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E613EF842
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 04:52:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F89E1681;
	Wed, 18 Aug 2021 04:51:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F89E1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629255138;
	bh=i6d4n4cMC0HFKL3t72vpHuGrLTiZVraXbqSkSb/g0Fo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L1LNjErkJC5E58nZUAKFLfIsaNjycjUWcS/6naqre5V5yZdKkhDw/QuWt1Iz/yFV8
	 afyjtltDRqJZYF62gXEdkpp7fhwwC9fyf1P/5U1gYk1B5qrYQ0yuXZx5pMcYN7FO3d
	 nopgiUgMC9Nd30ygly5ewvkKZ35YHKvT47vc1aUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17E48F804CA;
	Wed, 18 Aug 2021 04:50:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2210CF802C8; Wed, 18 Aug 2021 04:50:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35299F80249
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 04:50:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35299F80249
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="213119365"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="213119365"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 19:50:23 -0700
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="520723308"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 19:50:19 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 2/3] soundwire: intel: skip suspend/resume/wake when link
 was not started
Date: Wed, 18 Aug 2021 10:49:53 +0800
Message-Id: <20210818024954.16873-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818024954.16873-1-yung-chuan.liao@linux.intel.com>
References: <20210818024954.16873-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
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

The SoundWire Linux devices are created purely based on information
provided by platform firmware (e.g. ACPI DSDT table). When the kernel
finds a matching driver for the device address (_ADR), the probe will
initialize required data structures and initialize pm ops.

When the SoundWire link is started at a later point, the physical
devices will synchronize on the SoundWire frames and report their
attachment status, thereby triggering the enumeration and
initialization of device registers.

This two-step solution was a conscious design decision to allow e.g. a
driver to use sideband mechanisms to turn power rails on. This can
also allow OEMs to describe multiple platforms with the same DSDT
table, the devices that are not physically present in hardware.

The drawback of this approach is a bit of confusion, with more devices
than are actually present in hardware. This results in 'ghost'
devices, for which the driver successfully probes, but that will not
generate any traffic on the bus. suspend-resume transitions are
handled by drivers, and skipped when the devices are not physically
present.

This patch provides a work-around for a second-level of confusion in
platform firmware: some platforms only use HDaudio links, but
nevertheless expose SoundWire 'ghost' devices. This results in error
messages in the Intel driver while trying to suspend/resume these
links. The simplest solution is to add a boolean status flag to skip
all suspend/resume/wake sequences if the link was never started.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 22 ++++++++++++----------
 drivers/soundwire/intel.h |  1 +
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 808dda1380c2..8b42053b171f 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1525,6 +1525,7 @@ int intel_link_startup(struct auxiliary_device *auxdev)
 	if (!(link_flags & SDW_INTEL_MASTER_DISABLE_PM_RUNTIME_IDLE))
 		pm_runtime_idle(dev);
 
+	sdw->startup_done = true;
 	return 0;
 
 err_interrupt:
@@ -1564,8 +1565,9 @@ int intel_link_process_wakeen_event(struct auxiliary_device *auxdev)
 	sdw = dev_get_drvdata(dev);
 	bus = &sdw->cdns.bus;
 
-	if (bus->prop.hw_disabled) {
-		dev_dbg(dev, "SoundWire master %d is disabled, ignoring\n", bus->link_id);
+	if (bus->prop.hw_disabled || !sdw->startup_done) {
+		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
+			bus->link_id);
 		return 0;
 	}
 
@@ -1602,8 +1604,8 @@ static int __maybe_unused intel_suspend(struct device *dev)
 	u32 clock_stop_quirks;
 	int ret;
 
-	if (bus->prop.hw_disabled) {
-		dev_dbg(dev, "SoundWire master %d is disabled, ignoring\n",
+	if (bus->prop.hw_disabled || !sdw->startup_done) {
+		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
 			bus->link_id);
 		return 0;
 	}
@@ -1656,8 +1658,8 @@ static int __maybe_unused intel_suspend_runtime(struct device *dev)
 	u32 clock_stop_quirks;
 	int ret;
 
-	if (bus->prop.hw_disabled) {
-		dev_dbg(dev, "SoundWire master %d is disabled, ignoring\n",
+	if (bus->prop.hw_disabled || !sdw->startup_done) {
+		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
 			bus->link_id);
 		return 0;
 	}
@@ -1721,8 +1723,8 @@ static int __maybe_unused intel_resume(struct device *dev)
 	bool multi_link;
 	int ret;
 
-	if (bus->prop.hw_disabled) {
-		dev_dbg(dev, "SoundWire master %d is disabled, ignoring\n",
+	if (bus->prop.hw_disabled || !sdw->startup_done) {
+		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
 			bus->link_id);
 		return 0;
 	}
@@ -1819,8 +1821,8 @@ static int __maybe_unused intel_resume_runtime(struct device *dev)
 	int status;
 	int ret;
 
-	if (bus->prop.hw_disabled) {
-		dev_dbg(dev, "SoundWire master %d is disabled, ignoring\n",
+	if (bus->prop.hw_disabled || !sdw->startup_done) {
+		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
 			bus->link_id);
 		return 0;
 	}
diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 0b47b148da3f..cd93a44dba9a 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -41,6 +41,7 @@ struct sdw_intel {
 	struct sdw_cdns cdns;
 	int instance;
 	struct sdw_intel_link_res *link_res;
+	bool startup_done;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs;
 #endif
-- 
2.17.1

