Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B72678231
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 17:51:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05C76DEE;
	Mon, 23 Jan 2023 17:50:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05C76DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674492685;
	bh=HEpvnrA4Tlx5I4mJKgGyxfVZD+ree3cHt7EDxpcbw7M=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=C1z5yY8gO1OWg/ENcmMfHz0Dr+LwgAAiA++beC3sJvTLVaGHbfaRkJ+IOGL4x8Oip
	 kWl8JEuhE4c77/IhjCaq85dXuVlDa7qH09Y4J3a506F76kU72mphg/2yjFtj99iNXC
	 qQz1Uuci1sz+1WcPVueSVg+YhZzkMmhuugVLZRAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48662F80543;
	Mon, 23 Jan 2023 17:50:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 059DDF80515; Mon, 23 Jan 2023 17:50:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB49FF804A9
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 17:49:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB49FF804A9
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=PoJp6Fav
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30NBjTsf014286; Mon, 23 Jan 2023 10:49:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=cztfwVFlfOjp8dP1eltnyub2r0woweooJSZIP1F8Hxc=;
 b=PoJp6Fav2EeYBNqzndKRIu3DmPmO+P+/CYKXFSqPwAKjIAekn+MN/vqSll7bm8kfHWko
 6u9fSv7MbiGMt/aL/LqvA34XjodTByUGm6EAyt2G6fn9IepZs4GMQK+RhSy490Ak28RV
 aGcd90i+zpB3B7tYPh8m95G/Ded8c8WQM7Cde0qbimt4Ul5tnlpIhtTNzw4cn22r2eMN
 6NnIlJL49uYd8gB6l9LHuBxVHjRPpSIj9ENTjdNwWTUDn88Uonj3EJ1pDtziPXrotcN4
 Rpwp3bZujJ43GES+DcprQuq8R+hlPgTwjVY2LDhvp0avGy9Js73Pre1n84reaBBEFwzo gQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3n8dbsknrm-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Jan 2023 10:49:51 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Mon, 23 Jan
 2023 10:49:49 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via
 Frontend Transport; Mon, 23 Jan 2023 10:49:49 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 98C43B06;
 Mon, 23 Jan 2023 16:49:49 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <sanyog.r.kale@intel.com>
Subject: [PATCH v2 2/2] soundwire: bus: Remove unused reset_page_addr()
 callback
Date: Mon, 23 Jan 2023 16:49:49 +0000
Message-ID: <20230123164949.245898-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230123164949.245898-1-rf@opensource.cirrus.com>
References: <20230123164949.245898-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: flhPy3dSBywLTdhgLfAL1Xs5OFIEWyi7
X-Proofpoint-GUID: flhPy3dSBywLTdhgLfAL1Xs5OFIEWyi7
X-Proofpoint-Spam-Reason: safe
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

A previous patch removed unnecessary zeroing of the page registers
after a paged transaction, so now the reset_page_addr callback is
unused and can be removed.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c  | 14 --------------
 drivers/soundwire/cadence_master.h  |  3 ---
 drivers/soundwire/intel_auxdevice.c |  1 -
 include/linux/soundwire/sdw.h       |  3 ---
 4 files changed, 21 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 521387322145..f44e8f9a1c09 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -770,20 +770,6 @@ cdns_xfer_msg_defer(struct sdw_bus *bus,
 }
 EXPORT_SYMBOL(cdns_xfer_msg_defer);
 
-enum sdw_command_response
-cdns_reset_page_addr(struct sdw_bus *bus, unsigned int dev_num)
-{
-	struct sdw_cdns *cdns = bus_to_cdns(bus);
-	struct sdw_msg msg;
-
-	/* Create dummy message with valid device number */
-	memset(&msg, 0, sizeof(msg));
-	msg.dev_num = dev_num;
-
-	return cdns_program_scp_addr(cdns, &msg);
-}
-EXPORT_SYMBOL(cdns_reset_page_addr);
-
 u32 cdns_read_ping_status(struct sdw_bus *bus)
 {
 	struct sdw_cdns *cdns = bus_to_cdns(bus);
diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
index fa9dc38264a4..2efc857d21aa 100644
--- a/drivers/soundwire/cadence_master.h
+++ b/drivers/soundwire/cadence_master.h
@@ -182,9 +182,6 @@ struct sdw_cdns_pdi *sdw_cdns_alloc_pdi(struct sdw_cdns *cdns,
 void sdw_cdns_config_stream(struct sdw_cdns *cdns,
 			    u32 ch, u32 dir, struct sdw_cdns_pdi *pdi);
 
-enum sdw_command_response
-cdns_reset_page_addr(struct sdw_bus *bus, unsigned int dev_num);
-
 enum sdw_command_response
 cdns_xfer_msg(struct sdw_bus *bus, struct sdw_msg *msg);
 
diff --git a/drivers/soundwire/intel_auxdevice.c b/drivers/soundwire/intel_auxdevice.c
index 96c6b2112feb..5021be0f4158 100644
--- a/drivers/soundwire/intel_auxdevice.c
+++ b/drivers/soundwire/intel_auxdevice.c
@@ -113,7 +113,6 @@ static struct sdw_master_ops sdw_intel_ops = {
 	.override_adr = sdw_dmi_override_adr,
 	.xfer_msg = cdns_xfer_msg,
 	.xfer_msg_defer = cdns_xfer_msg_defer,
-	.reset_page_addr = cdns_reset_page_addr,
 	.set_bus_conf = cdns_bus_conf,
 	.pre_bank_switch = generic_pre_bank_switch,
 	.post_bank_switch = generic_post_bank_switch,
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 3cd2a761911f..a8d74635ea0d 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -838,7 +838,6 @@ struct sdw_defer {
  * @override_adr: Override value read from firmware (quirk for buggy firmware)
  * @xfer_msg: Transfer message callback
  * @xfer_msg_defer: Defer version of transfer message callback
- * @reset_page_addr: Reset the SCP page address registers
  * @set_bus_conf: Set the bus configuration
  * @pre_bank_switch: Callback for pre bank switch
  * @post_bank_switch: Callback for post bank switch
@@ -854,8 +853,6 @@ struct sdw_master_ops {
 	enum sdw_command_response (*xfer_msg_defer)
 			(struct sdw_bus *bus, struct sdw_msg *msg,
 			struct sdw_defer *defer);
-	enum sdw_command_response (*reset_page_addr)
-			(struct sdw_bus *bus, unsigned int dev_num);
 	int (*set_bus_conf)(struct sdw_bus *bus,
 			struct sdw_bus_params *params);
 	int (*pre_bank_switch)(struct sdw_bus *bus);
-- 
2.30.2

