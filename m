Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D5B30386C
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 09:56:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E77C317C7;
	Tue, 26 Jan 2021 09:55:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E77C317C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611651387;
	bh=tXL3IgNgQUnqEBQSYKhtiiLFZRIqdRjit/dBSG06O94=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oP05NlOfgR62dabnITzJfCqVlAO0wSlHybonTleX4s5l8G8LxqM2FDsfxUO8Uy5Yx
	 C3VSQ7dzOPn5/FN4+hhfIiw97k0MRXrRJzUtKhkqoIZhgTp7emcid0d2jKYFy140Uu
	 d+F0sjibYiAVlZXwrVuKGEZGTRngc5XrHHVntHV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87977F80217;
	Tue, 26 Jan 2021 09:55:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EF39F8020D; Tue, 26 Jan 2021 09:55:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6350F801D8
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 09:54:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6350F801D8
IronPort-SDR: h6AQAfhV7zWDcsYezFGj06akC4ha+pNGxo7+iszzQv3HEgo4KfTB1R0CPBuSPsaElMTuim2SbE
 yV1vk8+vvVJQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9875"; a="176359135"
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="176359135"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 00:54:48 -0800
IronPort-SDR: KETQn8n0cYfo66tl7EI/stZzeC0TYas9jeyvygLCNiTRh3SuD/IWoXiSjNN6dhwddE/FCarKFk
 FRpeeAHCLceA==
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="577736991"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2021 00:54:45 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: return earlier if no slave is attached
Date: Tue, 26 Jan 2021 16:54:39 +0800
Message-Id: <20210126085439.4349-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com,
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

From: Chao Song <chao.song@linux.intel.com>

If there is no slave attached to soundwire bus, we
can return earlier from sdw_bus_prep_clk_stop() and
sdw_bus_exit_clk_stop(), this saves a redundant value
check.

Signed-off-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 82df088c9333..d9deafdcf495 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -951,17 +951,17 @@ int sdw_bus_prep_clk_stop(struct sdw_bus *bus)
 			simple_clk_stop = false;
 	}
 
-	if (is_slave && !simple_clk_stop) {
+	/* Skip remaining clock stop preparation if no Slave is attached */
+	if (!is_slave)
+		return ret;
+
+	if (!simple_clk_stop) {
 		ret = sdw_bus_wait_for_clk_prep_deprep(bus,
 						       SDW_BROADCAST_DEV_NUM);
 		if (ret < 0)
 			return ret;
 	}
 
-	/* Don't need to inform slaves if there is no slave attached */
-	if (!is_slave)
-		return ret;
-
 	/* Inform slaves that prep is done */
 	list_for_each_entry(slave, &bus->slaves, node) {
 		if (!slave->dev_num)
@@ -1075,16 +1075,13 @@ int sdw_bus_exit_clk_stop(struct sdw_bus *bus)
 				 "clk stop deprep failed:%d", ret);
 	}
 
-	if (is_slave && !simple_clk_stop)
+	/* Skip remaining clock stop de-preparation if no Slave is attached */
+	if (!is_slave)
+		return 0;
+
+	if (!simple_clk_stop)
 		sdw_bus_wait_for_clk_prep_deprep(bus, SDW_BROADCAST_DEV_NUM);
 
-	/*
-	 * Don't need to call slave callback function if there is no slave
-	 * attached
-	 */
-	if (!is_slave)
-		return 0;
-
 	list_for_each_entry(slave, &bus->slaves, node) {
 		if (!slave->dev_num)
 			continue;
-- 
2.17.1

