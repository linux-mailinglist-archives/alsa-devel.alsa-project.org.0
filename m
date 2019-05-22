Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FBE26F3F
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 21:56:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF7571664;
	Wed, 22 May 2019 21:55:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF7571664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558554977;
	bh=Qz9mOetFhCtyrkzDCCeg2YhoPXZy9xaFzZ//t11Yo2g=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mht03CbZsgqHB4iSfwdKXNDLaNxzTDuFfSpa3bW7gK7xo365D8F1KSsi1kH+Jf7/d
	 Ij22CLVeFLvasl3oCLx5AmVuMAQJ9JVHo4gIoiL+I+W83unS+W96lf9t1AetQsR7eO
	 dxbY4Jf4YBI+ftkBN/+kTprnweL4bo8vkgd/cxL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EB6DF8975B;
	Wed, 22 May 2019 21:48:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 575C3F89734; Wed, 22 May 2019 21:48:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FC85F8962F
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 21:48:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FC85F8962F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 May 2019 12:48:02 -0700
X-ExtLoop1: 1
Received: from cjpowell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.154.39])
 by fmsmga008.fm.intel.com with ESMTP; 22 May 2019 12:48:00 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 22 May 2019 14:47:26 -0500
Message-Id: <20190522194732.25704-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522194732.25704-1-pierre-louis.bossart@linux.intel.com>
References: <20190522194732.25704-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH v2 10/15] soundwire: cadence_master: use
	rate_limited dynamic debug
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When commands start failing, e.g. due to a bad electrical connection
or bus conflicts, the dmesg log is flooded. This should not happen for
production devices but it's quite frequent when bringing-up a new
platform.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 682789bb8ab3..6f4184f5256c 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -236,19 +236,19 @@ cdns_fill_msg_resp(struct sdw_cdns *cdns,
 	for (i = 0; i < count; i++) {
 		if (!(cdns->response_buf[i] & CDNS_MCP_RESP_ACK)) {
 			no_ack = 1;
-			dev_dbg(cdns->dev, "Msg Ack not received\n");
+			dev_dbg_ratelimited(cdns->dev, "Msg Ack not received\n");
 			if (cdns->response_buf[i] & CDNS_MCP_RESP_NACK) {
 				nack = 1;
-				dev_err(cdns->dev, "Msg NACK received\n");
+				dev_err_ratelimited(cdns->dev, "Msg NACK received\n");
 			}
 		}
 	}
 
 	if (nack) {
-		dev_err(cdns->dev, "Msg NACKed for Slave %d\n", msg->dev_num);
+		dev_err_ratelimited(cdns->dev, "Msg NACKed for Slave %d\n", msg->dev_num);
 		return SDW_CMD_FAIL;
 	} else if (no_ack) {
-		dev_dbg(cdns->dev, "Msg ignored for Slave %d\n", msg->dev_num);
+		dev_dbg_ratelimited(cdns->dev, "Msg ignored for Slave %d\n", msg->dev_num);
 		return SDW_CMD_IGNORED;
 	}
 
@@ -356,12 +356,12 @@ cdns_program_scp_addr(struct sdw_cdns *cdns, struct sdw_msg *msg)
 
 	/* For NACK, NO ack, don't return err if we are in Broadcast mode */
 	if (nack) {
-		dev_err(cdns->dev,
-			"SCP_addrpage NACKed for Slave %d\n", msg->dev_num);
+		dev_err_ratelimited(cdns->dev,
+				    "SCP_addrpage NACKed for Slave %d\n", msg->dev_num);
 		return SDW_CMD_FAIL;
 	} else if (no_ack) {
-		dev_dbg(cdns->dev,
-			"SCP_addrpage ignored for Slave %d\n", msg->dev_num);
+		dev_dbg_ratelimited(cdns->dev,
+				    "SCP_addrpage ignored for Slave %d\n", msg->dev_num);
 		return SDW_CMD_IGNORED;
 	}
 
@@ -524,9 +524,9 @@ static int cdns_update_slave_status(struct sdw_cdns *cdns,
 
 		/* first check if Slave reported multiple status */
 		if (set_status > 1) {
-			dev_warn(cdns->dev,
-				 "Slave reported multiple Status: %d\n",
-				 status[i]);
+			dev_warn_ratelimited(cdns->dev,
+					     "Slave reported multiple Status: %d\n",
+					     status[i]);
 			/*
 			 * TODO: we need to reread the status here by
 			 * issuing a PING cmd
@@ -612,7 +612,7 @@ irqreturn_t sdw_cdns_thread(int irq, void *dev_id)
 	struct sdw_cdns *cdns = dev_id;
 	u32 slave0, slave1;
 
-	dev_dbg(cdns->dev, "Slave status change\n");
+	dev_dbg_ratelimited(cdns->dev, "Slave status change\n");
 
 	slave0 = cdns_readl(cdns, CDNS_MCP_SLAVE_INTSTAT0);
 	slave1 = cdns_readl(cdns, CDNS_MCP_SLAVE_INTSTAT1);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
