Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 460CE5A5D23
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 09:39:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7939F1FE;
	Tue, 30 Aug 2022 09:38:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7939F1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661845139;
	bh=4146rQbNgpJKmVBNz3ybM+Hn/wyGiAEsiucLmRjbNWI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OkmOyMfQTfh0ScqySx3824nIEm1lh1vemjLmIs5RIkvGi4jRcKUBdNP+9VLIo/LtT
	 Ae1KVenAEoT7AqerHJ2iw40KN2VVRLDvFJwWtSGiLe5Z9LPUoTz1VeMo63glLid57d
	 U55SPudARZovzaNb6xaHrGHYfdJTYycebxDUzq3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCF4EF800AA;
	Tue, 30 Aug 2022 09:37:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3B09F8023A; Tue, 30 Aug 2022 09:37:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6C9CF8012A
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 09:37:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6C9CF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hXSXDo0z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661845070; x=1693381070;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4146rQbNgpJKmVBNz3ybM+Hn/wyGiAEsiucLmRjbNWI=;
 b=hXSXDo0zxr8FQjTsgXbgW4ccI4lN4Hf6kAdVtNcXgtuT6iu1UYZzpYno
 3GHj0Lm9nC+8CG0EsH7OBhxUVyOkHG+6dlKaPvq5sts2U6Flw+jJwdQJ8
 WZsMTwcaBPNeKcZP0lOLHPRALgGBqzzaymkw8xX9VJyBCtCYVmXBsjsaz
 1FpfrThFlgm40HMx/rnN9qLGgYgmFLcUCq2KFqQAeZUBzYCamw+pEl+u6
 K+6A3xm2wVZ1VpfuNP3gpw4EPS8e5KgtcSzh4GYSZpsxqxN8YGqKW0Oy3
 4HfQxpJopSvfieMwxdILnnZ1Fs0QrLTzDzzVXEjsVxEDsY+/hMHGqJzby Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="274856262"
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; d="scan'208";a="274856262"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 00:37:45 -0700
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; d="scan'208";a="672734380"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 00:37:43 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org
Subject: [PATCH] soundwire: bus: conditionally recheck UNATTACHED status
Date: Tue, 30 Aug 2022 15:42:24 +0800
Message-Id: <20220830074224.2924179-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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

In configurations with two amplifiers on the same link, the Intel CI
reports occasional enumeration/initialization timeouts during
suspend-resume stress tests, where one of the two amplifiers becomes
UNATTACHED immediately after being enumerated. This problem was
reported both with Maxim and Realtek codecs, which pointed initially
to a problem with status handling on the Intel side.

The Cadence IP integrated on Intel platforms throws an interrupt when
the status changes, and the information is kept with sticky bits until
cleared. We initially added more checks to make sure the edge
detection did not miss any transition, but that did not improve the
results significantly.

With the recent addition of the read_ping_status() callback, we were
able to show that the status in sticky bits is shown as UNATTACHED
even though the PING frames show the problematic device as
ATTACHED. That completely breaks the entire logic where we assumed
that a peripheral would always re-attach as device0. The resume
timeouts make sense in that in those cases, the
enumeration/initialization never happens a second time.

One possible explanation is that this problem typically happens when a
bus clash is reported, so it could very well be that the detection is
fooled by a transient electrical issue or conflict between two
peripherals.

This patch conditionally double-checks the status reported in the
sticky bits with the actual PING frame status. If the peripheral
reports as attached in PING frames, the early detection based on
sticky bits is discarded.

Note that this patch only corrects issues of false positives on the
manager side.

If the peripheral lost and regain sync, then it would report as
attached on Device0. A peripheral that would not reset its dev_num
would not be compliant with the MIPI specification.

BugLink: https://github.com/thesofproject/linux/issues/3638
BugLink: https://github.com/thesofproject/linux/issues/3325
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
Hi Vinod,

You will need the "ASoC/soundwire: log actual PING status on resume issues"
series which is applied at ASoC tree before appling this patch.

---
 drivers/soundwire/bus.c       | 19 +++++++++++++++++++
 drivers/soundwire/intel.c     |  1 +
 include/linux/soundwire/sdw.h |  3 +++
 3 files changed, 23 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 2772973eebb1..d0d486f07673 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1767,6 +1767,25 @@ int sdw_handle_slave_status(struct sdw_bus *bus,
 		    slave->status != SDW_SLAVE_UNATTACHED) {
 			dev_warn(&slave->dev, "Slave %d state check1: UNATTACHED, status was %d\n",
 				 i, slave->status);
+
+			if (bus->recheck_unattached && bus->ops->read_ping_status) {
+				u32 ping_status;
+
+				mutex_lock(&bus->msg_lock);
+
+				ping_status = bus->ops->read_ping_status(bus);
+
+				mutex_unlock(&bus->msg_lock);
+
+				ping_status >>= (i * 2);
+				ping_status &= 0x3;
+
+				if (ping_status != 0) {
+					dev_warn(&slave->dev, "Slave %d state in PING frame is %d, ignoring earlier detection\n",
+						 i, ping_status);
+					continue;
+				}
+			}
 			sdw_modify_slave_status(slave, SDW_SLAVE_UNATTACHED);
 		}
 	}
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 25ec9c272239..0c6e674dbf85 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1311,6 +1311,7 @@ static int intel_link_probe(struct auxiliary_device *auxdev,
 
 	bus->link_id = auxdev->id;
 	bus->dev_num_ida_min = INTEL_DEV_NUM_IDA_MIN;
+	bus->recheck_unattached = true;
 
 	sdw_cdns_probe(cdns);
 
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index a2b31d25ea27..51ac71984260 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -892,6 +892,8 @@ struct sdw_master_ops {
  * @dev_num_ida_min: if set, defines the minimum values for the IDA
  * used to allocate system-unique device numbers. This value needs to be
  * identical across all SoundWire bus in the system.
+ * @recheck_unattached: if set, double-check UNATTACHED status changes
+ * by reading PING frame status.
  */
 struct sdw_bus {
 	struct device *dev;
@@ -917,6 +919,7 @@ struct sdw_bus {
 	bool multi_link;
 	int hw_sync_min_links;
 	int dev_num_ida_min;
+	bool recheck_unattached;
 };
 
 int sdw_bus_master_add(struct sdw_bus *bus, struct device *parent,
-- 
2.25.1

