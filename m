Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DF32208E2
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 11:34:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 207201674;
	Wed, 15 Jul 2020 11:33:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 207201674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594805683;
	bh=HcDFWjUqz+Mqr0LBxnFco62GiPVhl+/KT9MbJSWrjT4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LP5VWid9HpTpianQik8/RLhjD0tr0/+I61Q8Tq38yYkNX+yIs5VQ3kX+1AujV013C
	 DmcNCxvgemyXHTXqDBSUyMTn5PAx8ZtST0ydtvEewwiq91/xHxxGFQZWT8THgOFNKv
	 jq2rMsgHJWxlmisjCRmHOoEP328bMVAfa3FqyYFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13AA3F80113;
	Wed, 15 Jul 2020 11:32:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 400CCF80227; Wed, 15 Jul 2020 11:32:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46CD1F80217
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 11:32:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46CD1F80217
IronPort-SDR: qKs3fDTI0FWn16X66PoCcPcwN0eIfmd9kXJ5dMhsjJIeTdr1Y2zA3LWKv8at/L34n8M1umYWzb
 UtE1+SVvympQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="137241502"
X-IronPort-AV: E=Sophos;i="5.75,354,1589266800"; d="scan'208";a="137241502"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 02:32:04 -0700
IronPort-SDR: CGidmK//KfAqvtPF13ztwd8cu+OmxMBIBBmgxo9a42dlEeYtmG5VDpXqm/OPEfzLS+4v7xs+ec
 qmpW/HuM+PyA==
X-IronPort-AV: E=Sophos;i="5.75,354,1589266800"; d="scan'208";a="460006226"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 02:32:00 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 1/2] soundwire: sdw.h: fix PRBS/Static_1 swapped definitions
Date: Wed, 15 Jul 2020 05:37:43 +0800
Message-Id: <20200714213744.24674-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200714213744.24674-1-yung-chuan.liao@linux.intel.com>
References: <20200714213744.24674-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
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

Table 110 "Port Data Modes" of the SoundWire 1.2 specification lists
PRBS as b01 and Static_1 as b11. The existing headers swapped the two
values, fix.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/linux/soundwire/sdw.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 4057adf7f049..6452bac957b3 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -152,19 +152,19 @@ enum sdw_data_direction {
  *
  * @SDW_PORT_DATA_MODE_NORMAL: Normal data mode where audio data is received
  * and transmitted.
+ * @SDW_PORT_DATA_MODE_PRBS: Test mode which uses a PRBS generator to produce
+ * a pseudo random data pattern that is transferred
+ * @SDW_PORT_DATA_MODE_STATIC_0: Simple test mode which uses static value of
+ * logic 0. The encoding will result in no signal transitions
  * @SDW_PORT_DATA_MODE_STATIC_1: Simple test mode which uses static value of
  * logic 1. The encoding will result in signal transitions at every bitslot
  * owned by this Port
- * @SDW_PORT_DATA_MODE_STATIC_0: Simple test mode which uses static value of
- * logic 0. The encoding will result in no signal transitions
- * @SDW_PORT_DATA_MODE_PRBS: Test mode which uses a PRBS generator to produce
- * a pseudo random data pattern that is transferred
  */
 enum sdw_port_data_mode {
 	SDW_PORT_DATA_MODE_NORMAL = 0,
-	SDW_PORT_DATA_MODE_STATIC_1 = 1,
+	SDW_PORT_DATA_MODE_PRBS = 1,
 	SDW_PORT_DATA_MODE_STATIC_0 = 2,
-	SDW_PORT_DATA_MODE_PRBS = 3,
+	SDW_PORT_DATA_MODE_STATIC_1 = 3,
 };
 
 /*
-- 
2.17.1

