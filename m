Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEB72492C1
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 04:06:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E060417CC;
	Wed, 19 Aug 2020 04:05:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E060417CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597802809;
	bh=YkxrOiCFSn39ITGcfr71iqwspd7LiTQt7Tgc5aieSoE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RBNYlDYQF70oe4PE+ozAiHK92BWvG+vzyXm9IvZORi9ZDlCRzDaFtHMVQr/8GHjMe
	 SFfTJ0wauq5kwNLUIU8sTmvuYV1xK/DvA6H8ska1UXXKqSGLFzFz29Ha5+53J/mCd8
	 Gun+k6iCw6QYXOkHP6izL+I7d9Y7CE1icuLfsMho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75CDDF80304;
	Wed, 19 Aug 2020 04:01:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AB48F802FB; Wed, 19 Aug 2020 04:01:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04623F802EA
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 04:01:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04623F802EA
IronPort-SDR: R0ILOmmgnkB5ggmwnwKtVLTcwLsWNt3bqIfCU0zJF/aQgp605co4O2HBDbUeas7bZKbSDT3lu8
 F0dNyUXsL41A==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="239865572"
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; d="scan'208";a="239865572"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 19:01:11 -0700
IronPort-SDR: cbTXgFi0nB8A2DPi3bkjFIXT+6zFCsja9KX6mMfSBfrimipQ6eJD8pc/iDNIqKIsDVOmNhPsCl
 gvUMODvkDJqg==
X-IronPort-AV: E=Sophos;i="5.76,329,1592895600"; d="scan'208";a="279565148"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2020 19:01:07 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 7/7] soundwire: cadence: add parity error injection through
 debugfs
Date: Tue, 18 Aug 2020 22:06:56 +0800
Message-Id: <20200818140656.29014-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818140656.29014-1-yung-chuan.liao@linux.intel.com>
References: <20200818140656.29014-1-yung-chuan.liao@linux.intel.com>
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

The Cadence IP can inject errors, let's make use of this capability to
test Slave parity error checks.

See e.g. example log where both the master and slave detect the parity
error injected on a dummy read command.

cd /sys/kernel/debug/soundwire/master-1/intel-sdw/
echo 1 > cdns-parity-error-injection

[   44.756249] intel-master sdw-master-1: Parity error
[   44.756313] intel-master sdw-master-1: Msg NACK received
[   44.756366] intel-master sdw-master-1: Msg NACKed for Slave 15
[   44.756375] intel-master sdw-master-1: trf on Slave 15 failed:-5
[   44.756382] intel-master sdw-master-1: parity error injection, read: -5
[   44.756649] rt1308 sdw:1:25d:1308:0: Parity error detected

The code makes sure the Master device is resumed, hence the clock
restarted, before sending a parity error.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 86 ++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 24eafe0aa1c3..807d70b82455 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -13,6 +13,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/pm_runtime.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw.h>
 #include <sound/pcm_params.h>
@@ -50,6 +51,9 @@ MODULE_PARM_DESC(cdns_mcp_int_mask, "Cadence MCP IntMask");
 #define CDNS_MCP_CONTROL_BLOCK_WAKEUP		BIT(0)
 
 #define CDNS_MCP_CMDCTRL			0x8
+
+#define CDNS_MCP_CMDCTRL_INSERT_PARITY_ERR	BIT(2)
+
 #define CDNS_MCP_SSPSTAT			0xC
 #define CDNS_MCP_FRAME_SHAPE			0x10
 #define CDNS_MCP_FRAME_SHAPE_INIT		0x14
@@ -367,6 +371,85 @@ static int cdns_hw_reset(void *data, u64 value)
 
 DEFINE_DEBUGFS_ATTRIBUTE(cdns_hw_reset_fops, NULL, cdns_hw_reset, "%llu\n");
 
+static int cdns_parity_error_injection(void *data, u64 value)
+{
+	struct sdw_cdns *cdns = data;
+	struct sdw_bus *bus;
+	int ret;
+
+	if (value != 1)
+		return -EINVAL;
+
+	bus = &cdns->bus;
+
+	/*
+	 * Resume Master device. If this results in a bus reset, the
+	 * Slave devices will re-attach and be re-enumerated.
+	 */
+	ret = pm_runtime_get_sync(bus->dev);
+	if (ret < 0 && ret != -EACCES) {
+		dev_err_ratelimited(cdns->dev,
+				    "pm_runtime_get_sync failed in %s, ret %d\n",
+				    __func__, ret);
+		pm_runtime_put_noidle(bus->dev);
+		return ret;
+	}
+
+	/*
+	 * wait long enough for Slave(s) to be in steady state. This
+	 * does not need to be super precise.
+	 */
+	msleep(200);
+
+	/*
+	 * Take the bus lock here to make sure that any bus transactions
+	 * will be queued while we inject a parity error on a dummy read
+	 */
+	mutex_lock(&bus->bus_lock);
+
+	/* program hardware to inject parity error */
+	cdns_updatel(cdns, CDNS_MCP_CMDCTRL,
+		     CDNS_MCP_CMDCTRL_INSERT_PARITY_ERR,
+		     CDNS_MCP_CMDCTRL_INSERT_PARITY_ERR);
+
+	/* commit changes */
+	cdns_updatel(cdns, CDNS_MCP_CONFIG_UPDATE,
+		     CDNS_MCP_CONFIG_UPDATE_BIT,
+		     CDNS_MCP_CONFIG_UPDATE_BIT);
+
+	/* do a broadcast dummy read to avoid bus clashes */
+	ret = sdw_bread_no_pm_unlocked(&cdns->bus, 0xf, SDW_SCP_DEVID_0);
+	dev_info(cdns->dev, "parity error injection, read: %d\n", ret);
+
+	/* program hardware to disable parity error */
+	cdns_updatel(cdns, CDNS_MCP_CMDCTRL,
+		     CDNS_MCP_CMDCTRL_INSERT_PARITY_ERR,
+		     0);
+
+	/* commit changes */
+	cdns_updatel(cdns, CDNS_MCP_CONFIG_UPDATE,
+		     CDNS_MCP_CONFIG_UPDATE_BIT,
+		     CDNS_MCP_CONFIG_UPDATE_BIT);
+
+	/* Continue bus operation with parity error injection disabled */
+	mutex_unlock(&bus->bus_lock);
+
+	/* Userspace changed the hardware state behind the kernel's back */
+	add_taint(TAINT_USER, LOCKDEP_STILL_OK);
+
+	/*
+	 * allow Master device to enter pm_runtime suspend. This may
+	 * also result in Slave devices suspending.
+	 */
+	pm_runtime_mark_last_busy(bus->dev);
+	pm_runtime_put_autosuspend(bus->dev);
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(cdns_parity_error_fops, NULL,
+			 cdns_parity_error_injection, "%llu\n");
+
 /**
  * sdw_cdns_debugfs_init() - Cadence debugfs init
  * @cdns: Cadence instance
@@ -378,6 +461,9 @@ void sdw_cdns_debugfs_init(struct sdw_cdns *cdns, struct dentry *root)
 
 	debugfs_create_file("cdns-hw-reset", 0200, root, cdns,
 			    &cdns_hw_reset_fops);
+
+	debugfs_create_file("cdns-parity-error-injection", 0200, root, cdns,
+			    &cdns_parity_error_fops);
 }
 EXPORT_SYMBOL_GPL(sdw_cdns_debugfs_init);
 
-- 
2.17.1

