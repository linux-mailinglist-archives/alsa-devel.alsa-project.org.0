Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF96D2D3ABF
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 06:38:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61DC816CF;
	Wed,  9 Dec 2020 06:37:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61DC816CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607492317;
	bh=TVG+EDMjOaNqmpUDAOxvgaA09bQRZDq+VSEnbOHuEg8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=noU7HdcxXAHo0TvtN2vUP4FKPD+4l+Wrvge+aiUOzS7kY+qtORLtlrtRlzE+8XPA5
	 XzzOkZERudfiQOKBy4lbG4p2LpSTagbja3zqo1A+oazbF3twvRXrxTUFP4rlDzyp61
	 8tOE4/oUHQya/+4BDtlVF6onr4BY5fvFX/1bLjXQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D5F3F804E2;
	Wed,  9 Dec 2020 06:35:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 186EBF804C3; Wed,  9 Dec 2020 06:35:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 420F7F8021D
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 06:35:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 420F7F8021D
IronPort-SDR: Cp3AL2M8t4ycWlg+ehSLTeOaWixXxu4e9/z2NxCJBkG9LS1WW2GkDAwXViAf0WweyHpWKDHWDk
 KAlTGMO5q+xg==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="153259003"
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; d="scan'208";a="153259003"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 21:35:20 -0800
IronPort-SDR: O99JrVXAUy+jhyslBgmo6HOP/RkfH54h2UB8hiQkzp+lo8QV+M2qBesujOTFlWnNLoXY0cvoMv
 TahI5W6hKc0w==
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; d="scan'208";a="363989464"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 21:35:17 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 3/9] soundwire: bus: use no_pm IO routines for all
 interrupt handling
Date: Wed,  9 Dec 2020 13:34:53 +0800
Message-Id: <20201209053459.5515-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201209053459.5515-1-yung-chuan.liao@linux.intel.com>
References: <20201209053459.5515-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

There is no need to play with pm_runtime reference counts, if needed
the codec drivers are already explicitly resumed.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index b1830032b052..86c339d77a39 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1295,7 +1295,7 @@ static int sdw_handle_dp0_interrupt(struct sdw_slave *slave, u8 *slave_status)
 	u8 clear, impl_int_mask;
 	int status, status2, ret, count = 0;
 
-	status = sdw_read(slave, SDW_DP0_INT);
+	status = sdw_read_no_pm(slave, SDW_DP0_INT);
 	if (status < 0) {
 		dev_err(slave->bus->dev,
 			"SDW_DP0_INT read failed:%d\n", status);
@@ -1334,7 +1334,7 @@ static int sdw_handle_dp0_interrupt(struct sdw_slave *slave, u8 *slave_status)
 		}
 
 		/* clear the interrupts but don't touch reserved and SDCA_CASCADE fields */
-		ret = sdw_write(slave, SDW_DP0_INT, clear);
+		ret = sdw_write_no_pm(slave, SDW_DP0_INT, clear);
 		if (ret < 0) {
 			dev_err(slave->bus->dev,
 				"SDW_DP0_INT write failed:%d\n", ret);
@@ -1342,7 +1342,7 @@ static int sdw_handle_dp0_interrupt(struct sdw_slave *slave, u8 *slave_status)
 		}
 
 		/* Read DP0 interrupt again */
-		status2 = sdw_read(slave, SDW_DP0_INT);
+		status2 = sdw_read_no_pm(slave, SDW_DP0_INT);
 		if (status2 < 0) {
 			dev_err(slave->bus->dev,
 				"SDW_DP0_INT read failed:%d\n", status2);
@@ -1373,7 +1373,7 @@ static int sdw_handle_port_interrupt(struct sdw_slave *slave,
 		return sdw_handle_dp0_interrupt(slave, slave_status);
 
 	addr = SDW_DPN_INT(port);
-	status = sdw_read(slave, addr);
+	status = sdw_read_no_pm(slave, addr);
 	if (status < 0) {
 		dev_err(slave->bus->dev,
 			"SDW_DPN_INT read failed:%d\n", status);
@@ -1407,7 +1407,7 @@ static int sdw_handle_port_interrupt(struct sdw_slave *slave,
 		}
 
 		/* clear the interrupt but don't touch reserved fields */
-		ret = sdw_write(slave, addr, clear);
+		ret = sdw_write_no_pm(slave, addr, clear);
 		if (ret < 0) {
 			dev_err(slave->bus->dev,
 				"SDW_DPN_INT write failed:%d\n", ret);
@@ -1415,7 +1415,7 @@ static int sdw_handle_port_interrupt(struct sdw_slave *slave,
 		}
 
 		/* Read DPN interrupt again */
-		status2 = sdw_read(slave, addr);
+		status2 = sdw_read_no_pm(slave, addr);
 		if (status2 < 0) {
 			dev_err(slave->bus->dev,
 				"SDW_DPN_INT read failed:%d\n", status2);
@@ -1457,7 +1457,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 	}
 
 	/* Read Intstat 1, Intstat 2 and Intstat 3 registers */
-	ret = sdw_read(slave, SDW_SCP_INT1);
+	ret = sdw_read_no_pm(slave, SDW_SCP_INT1);
 	if (ret < 0) {
 		dev_err(slave->bus->dev,
 			"SDW_SCP_INT1 read failed:%d\n", ret);
@@ -1465,7 +1465,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 	}
 	buf = ret;
 
-	ret = sdw_nread(slave, SDW_SCP_INTSTAT2, 2, buf2);
+	ret = sdw_nread_no_pm(slave, SDW_SCP_INTSTAT2, 2, buf2);
 	if (ret < 0) {
 		dev_err(slave->bus->dev,
 			"SDW_SCP_INT2/3 read failed:%d\n", ret);
@@ -1473,7 +1473,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 	}
 
 	if (slave->prop.is_sdca) {
-		ret = sdw_read(slave, SDW_DP0_INT);
+		ret = sdw_read_no_pm(slave, SDW_DP0_INT);
 		if (ret < 0) {
 			dev_err(slave->bus->dev,
 				"SDW_DP0_INT read failed:%d\n", ret);
@@ -1570,7 +1570,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		}
 
 		/* Ack interrupt */
-		ret = sdw_write(slave, SDW_SCP_INT1, clear);
+		ret = sdw_write_no_pm(slave, SDW_SCP_INT1, clear);
 		if (ret < 0) {
 			dev_err(slave->bus->dev,
 				"SDW_SCP_INT1 write failed:%d\n", ret);
@@ -1584,7 +1584,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		 * Read status again to ensure no new interrupts arrived
 		 * while servicing interrupts.
 		 */
-		ret = sdw_read(slave, SDW_SCP_INT1);
+		ret = sdw_read_no_pm(slave, SDW_SCP_INT1);
 		if (ret < 0) {
 			dev_err(slave->bus->dev,
 				"SDW_SCP_INT1 read failed:%d\n", ret);
@@ -1592,7 +1592,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		}
 		_buf = ret;
 
-		ret = sdw_nread(slave, SDW_SCP_INTSTAT2, 2, _buf2);
+		ret = sdw_nread_no_pm(slave, SDW_SCP_INTSTAT2, 2, _buf2);
 		if (ret < 0) {
 			dev_err(slave->bus->dev,
 				"SDW_SCP_INT2/3 read failed:%d\n", ret);
@@ -1600,7 +1600,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		}
 
 		if (slave->prop.is_sdca) {
-			ret = sdw_read(slave, SDW_DP0_INT);
+			ret = sdw_read_no_pm(slave, SDW_DP0_INT);
 			if (ret < 0) {
 				dev_err(slave->bus->dev,
 					"SDW_DP0_INT read failed:%d\n", ret);
-- 
2.17.1

