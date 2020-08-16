Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F08245ED0
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 10:07:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0ED78168D;
	Mon, 17 Aug 2020 10:06:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0ED78168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597651649;
	bh=JBwne32d8Prl+WslNZHmOrVJDeWqw0xaR7BsN8sSSHw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KaoRVJrEE2M8jdtqF23xe4wNr+7vIN2BEPqZz7o6R1HJZR3GIaeGILOML9dmcg5jY
	 MniRJ4781u4N6JGfcu+wNDyduqPlq82brR9AaQejj0v5fv2sKZ3M2WEWi0Rwt5yVRX
	 9+DwEyvVGKSUJL5m0ZL/xIg5txtPuD0JX+nrEudQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44C66F80218;
	Mon, 17 Aug 2020 10:05:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE4E8F8025A; Mon, 17 Aug 2020 10:05:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 323B5F80218
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 10:05:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 323B5F80218
IronPort-SDR: hbL6H2FGU8pj+cbIKhKYoI2FCUjQOsoBfSXmgnDGSFaUtKIlXVzftb1UY3oUpmiQvKjc4GcUbY
 RsxWCS9YzyDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9715"; a="134714329"
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; d="scan'208";a="134714329"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 01:05:09 -0700
IronPort-SDR: 64K6dnPNVKR9qvBU/y1LfCdzlj1GACHiyNuFquKD/3+mhTQV9q7pEe+eB1Xczq56HcUTpADT68
 Xcdds2NWTNDA==
X-IronPort-AV: E=Sophos;i="5.76,322,1592895600"; d="scan'208";a="279060308"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 01:05:06 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2] soundwire: SDCA: detect sdca_cascade interrupt
Date: Mon, 17 Aug 2020 04:11:22 +0800
Message-Id: <20200816201122.9744-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
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

The SoundWire 1.2 specification defines an "SDCA cascade" bit which
handles a logical OR of all SDCA interrupt sources (up to 30 defined).

Due to limitations of the addressing space, this bit is located in the
SDW_DP0_INT register when DP0 is used, or alternatively in the
DP0_SDCA_Support_INTSTAT register when DP0 is not used.

To allow for both cases to be handled, this bit will be checked in the
main device-level interrupt handling code. This will result in the
register being read twice if DP0 is enabled, but it's not clear how to
optimize this case. It's also more logical to deal with this interrupt
at the device than the port level, this bit is really not DP0 specific
and its location in the DP0_INTSTAT bit is only due to the lack of
free space in SCP_INTSTAT_1.

The SDCA_Cascade bit cannot be masked or cleared, so the interrupt
handling only forwards the detection to the Slave driver, which will
deal with reading the relevant SDCA status bits and clearing them. The
bus driver only signals the detection.

The communication with the Slave driver is based on the same interrupt
callback, with only an extension to provide the status of the
sdca_cascade bit.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---

Changelog:

v2:
 - Re-read SDW_DP0_INT while reading status again. 

---
 drivers/soundwire/bus.c       | 28 +++++++++++++++++++++++++++-
 include/linux/soundwire/sdw.h |  4 ++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index e6e0fb9a81b4..d254c23201b9 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1361,6 +1361,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 	int port_num, stat, ret, count = 0;
 	unsigned long port;
 	bool slave_notify = false;
+	u8 sdca_cascade = 0;
 	u8 buf, buf2[2], _buf, _buf2[2];
 
 	sdw_modify_slave_status(slave, SDW_SLAVE_ALERT);
@@ -1388,6 +1389,16 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		goto io_err;
 	}
 
+	if (slave->prop.is_sdca) {
+		ret = sdw_read(slave, SDW_DP0_INT);
+		if (ret < 0) {
+			dev_err(slave->bus->dev,
+				"SDW_DP0_INT read failed:%d\n", ret);
+			goto io_err;
+		}
+		sdca_cascade = ret & SDW_DP0_SDCA_CASCADE;
+	}
+
 	do {
 		/*
 		 * Check parity, bus clash and Slave (impl defined)
@@ -1416,6 +1427,10 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 			slave_notify = true;
 		}
 
+		/* the SDCA interrupts are cleared in the codec driver .interrupt_callback() */
+		if (sdca_cascade)
+			slave_notify = true;
+
 		/* Check port 0 - 3 interrupts */
 		port = buf & SDW_SCP_INT1_PORT0_3;
 
@@ -1453,6 +1468,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		/* Update the Slave driver */
 		if (slave_notify && slave->ops &&
 		    slave->ops->interrupt_callback) {
+			slave_intr.sdca_cascade = sdca_cascade;
 			slave_intr.control_port = clear;
 			memcpy(slave_intr.port, &port_status,
 			       sizeof(slave_intr.port));
@@ -1487,11 +1503,21 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 			goto io_err;
 		}
 
+		if (slave->prop.is_sdca) {
+			ret = sdw_read(slave, SDW_DP0_INT);
+			if (ret < 0) {
+				dev_err(slave->bus->dev,
+					"SDW_DP0_INT read failed:%d\n", ret);
+				goto io_err;
+			}
+			sdca_cascade = ret & SDW_DP0_SDCA_CASCADE;
+		}
+
 		/* Make sure no interrupts are pending */
 		buf &= _buf;
 		buf2[0] &= _buf2[0];
 		buf2[1] &= _buf2[1];
-		stat = buf || buf2[0] || buf2[1];
+		stat = buf || buf2[0] || buf2[1] || sdca_cascade;
 
 		/*
 		 * Exit loop if Slave is continuously in ALERT state even
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 76052f12c9f7..a51494646a2c 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -355,6 +355,7 @@ struct sdw_dpn_prop {
  * @dp0_prop: Data Port 0 properties
  * @src_dpn_prop: Source Data Port N properties
  * @sink_dpn_prop: Sink Data Port N properties
+ * @is_sdca: the Slave supports the SDCA specification
  */
 struct sdw_slave_prop {
 	u32 mipi_revision;
@@ -376,6 +377,7 @@ struct sdw_slave_prop {
 	struct sdw_dp0_prop *dp0_prop;
 	struct sdw_dpn_prop *src_dpn_prop;
 	struct sdw_dpn_prop *sink_dpn_prop;
+	bool is_sdca;
 };
 
 /**
@@ -465,10 +467,12 @@ struct sdw_slave_id {
 
 /**
  * struct sdw_slave_intr_status - Slave interrupt status
+ * @sdca_cascade: set if the Slave device reports an SDCA interrupt
  * @control_port: control port status
  * @port: data port status
  */
 struct sdw_slave_intr_status {
+	bool sdca_cascade;
 	u8 control_port;
 	u8 port[15];
 };
-- 
2.17.1

