Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2253296EC
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 09:29:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAD9F16B8;
	Tue,  2 Mar 2021 09:29:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAD9F16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614673793;
	bh=RciUQNXVWuYGnbSCzCRvL3tHLSG5s1KgsdZnQnc5ZX8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GXxOUtQznJRf7mWkeIYmtPomSD097mAECZ0xGyKyo9lHj6NCTSX5uF7zAkkSw5bU/
	 BqohKnfFu55VqPYN6pg0GxfeuaKl1902Xp3rmDDvyQOZQeI59UA1JHdlQQ4u7fou2f
	 vk1SZKrO8yYn+hHHB70ArkBVTtnEV8M+stiMvsX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52638F8032B;
	Tue,  2 Mar 2021 09:27:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CAB1F802E7; Tue,  2 Mar 2021 09:27:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43BC9F8025B
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 09:27:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43BC9F8025B
IronPort-SDR: bezPFLN+18O+Efl/v+canMW+cdnoruE+ZbbyqTZifdrhaLOZqKqeo07fCWdO12hcwop7EkmHY0
 kcuhncR9qy4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="184302381"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="184302381"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 00:27:31 -0800
IronPort-SDR: xAlpQ8JXAmQ+n8fC89bie0evDYi+YCMqQXG2YNdWADQCthuTTF9VGQiK2yCWnJZzLAG1JTToOU
 9V+Qs2wrzwRQ==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="406613472"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 00:27:27 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 2/3] soundwire: bus: handle master quirks for bus clash and
 parity
Date: Tue,  2 Mar 2021 16:27:19 +0800
Message-Id: <20210302082720.12322-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210302082720.12322-1-yung-chuan.liao@linux.intel.com>
References: <20210302082720.12322-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org,
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

Add optional interrupt status read/clear if the master quirks are set.

In the case of the parity, the master quirk is only applied if the
Slave doesn't already have a parity-related quirk.

Co-developed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 drivers/soundwire/bus.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 46885429928a..04eb879de145 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1253,6 +1253,7 @@ static int sdw_slave_set_frequency(struct sdw_slave *slave)
 static int sdw_initialize_slave(struct sdw_slave *slave)
 {
 	struct sdw_slave_prop *prop = &slave->prop;
+	int status;
 	int ret;
 	u8 val;
 
@@ -1260,6 +1261,44 @@ static int sdw_initialize_slave(struct sdw_slave *slave)
 	if (ret < 0)
 		return ret;
 
+	if (slave->bus->prop.quirks & SDW_MASTER_QUIRKS_CLEAR_INITIAL_CLASH) {
+		/* Clear bus clash interrupt before enabling interrupt mask */
+		status = sdw_read_no_pm(slave, SDW_SCP_INT1);
+		if (status < 0) {
+			dev_err(&slave->dev,
+				"SDW_SCP_INT1 (BUS_CLASH) read failed:%d\n", status);
+			return status;
+		}
+		if (status & SDW_SCP_INT1_BUS_CLASH) {
+			dev_warn(&slave->dev, "Bus clash detected before INT mask is enabled\n");
+			ret = sdw_write_no_pm(slave, SDW_SCP_INT1, SDW_SCP_INT1_BUS_CLASH);
+			if (ret < 0) {
+				dev_err(&slave->dev,
+					"SDW_SCP_INT1 (BUS_CLASH) write failed:%d\n", ret);
+				return ret;
+			}
+		}
+	}
+	if ((slave->bus->prop.quirks & SDW_MASTER_QUIRKS_CLEAR_INITIAL_PARITY) &&
+	    !(slave->prop.quirks & SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY)) {
+		/* Clear parity interrupt before enabling interrupt mask */
+		status = sdw_read_no_pm(slave, SDW_SCP_INT1);
+		if (status < 0) {
+			dev_err(&slave->dev,
+				"SDW_SCP_INT1 (PARITY) read failed:%d\n", status);
+			return status;
+		}
+		if (status & SDW_SCP_INT1_PARITY) {
+			dev_warn(&slave->dev, "PARITY error detected before INT mask is enabled\n");
+			ret = sdw_write_no_pm(slave, SDW_SCP_INT1, SDW_SCP_INT1_PARITY);
+			if (ret < 0) {
+				dev_err(&slave->dev,
+					"SDW_SCP_INT1 (PARITY) write failed:%d\n", ret);
+				return ret;
+			}
+		}
+	}
+
 	/*
 	 * Set SCP_INT1_MASK register, typically bus clash and
 	 * implementation-defined interrupt mask. The Parity detection
-- 
2.17.1

