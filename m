Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E53D17C7B02
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Oct 2023 03:02:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36EDB844;
	Fri, 13 Oct 2023 03:01:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36EDB844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697158967;
	bh=A8vxlDAoN4G/XceJuG50VnLiTJyN1JUtwmw+OsBrbOE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IS4myceEVXqB6bGR1GeB0IXM/MZjBR5NbVAQHGnHJcdLi/7v6KWGECG8EJ8+M6a+b
	 UIHrXODxsUQInbZ49LGvQ3N0IzlplEGPKJx+C4bs7wdq+j4xCyG/I7vRchtHG6kky9
	 15AYmdszO2mFcQYvPjl/TOJdX4/YMpH3BEI4PmoY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33B61F80166; Fri, 13 Oct 2023 03:01:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D742CF8027B;
	Fri, 13 Oct 2023 03:01:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC8BEF802BE; Fri, 13 Oct 2023 03:01:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74A7EF80166
	for <alsa-devel@alsa-project.org>; Fri, 13 Oct 2023 03:01:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74A7EF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ivruexGe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697158879; x=1728694879;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=A8vxlDAoN4G/XceJuG50VnLiTJyN1JUtwmw+OsBrbOE=;
  b=ivruexGeJEkBR3vmKSvGVga3p4yQXQ7/qvZWp37+TdIaZ0ADqiiyED8z
   +wh8qVmzt8kfzPL3gVvYYPyDz2rePC96GGU6ilWdU45u98usyQH2vZ012
   laK75Xb56Uhzbiht4z9bpdSZGz1egGjHW5BrObskrJhtEogejlpcZ/8+t
   iYlG6H4NBVKAvketKjuZxfFXMQ4hVbru0r3XZJC9vFtzoSJAUPvVhdzJ3
   RsD6MunpNH4Q23Mg09+AWTaQRhXIZrKt/F/m7cx/es5fTbqrYe7f9xP9A
   zP2DnF5zf69m1BDdg15Z8Kv7YYE3pS1CROquAe9ptC/trp0GyfH9DC35f
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="370147610"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="370147610"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 18:00:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="870824070"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200";
   d="scan'208";a="870824070"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 18:00:53 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH] soundwire: bus: improve error handling for clock stop
 prepare/deprepare
Date: Fri, 13 Oct 2023 09:08:12 +0800
Message-Id: <20231013010812.114216-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HE2MMNMFAXCFBON3YPAUTIJARY66R6YL
X-Message-ID-Hash: HE2MMNMFAXCFBON3YPAUTIJARY66R6YL
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HE2MMNMFAXCFBON3YPAUTIJARY66R6YL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The same logic is used for clock stop prepare and deprepare, and
having different logs for the two steps helps identify problems.

In addition, when the "NotFinished" bit remains set, the error
handling is not quite right:

a) for the clock stop prepare, the error is handled at the caller
level, and the error is ignored: there's no good reason to prevent the
pm_runtime suspend from happening. Throwing an error that is later
ignored is confusing.

b) for the clock stop deprepare, the error is ignored in bus.c and a
dev_warn() log shown. Throwing an error is also alarming users for no
good reason.

For both cases, demoting the error to dev_dbg() makes more sense.

Link: https://github.com/thesofproject/linux/issues/4619
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/bus.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 1720031f35a3..327ce316fed9 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1022,7 +1022,7 @@ static int sdw_slave_clk_stop_prepare(struct sdw_slave *slave,
 	return ret;
 }
 
-static int sdw_bus_wait_for_clk_prep_deprep(struct sdw_bus *bus, u16 dev_num)
+static int sdw_bus_wait_for_clk_prep_deprep(struct sdw_bus *bus, u16 dev_num, bool prepare)
 {
 	int retry = bus->clk_stop_timeout;
 	int val;
@@ -1036,7 +1036,8 @@ static int sdw_bus_wait_for_clk_prep_deprep(struct sdw_bus *bus, u16 dev_num)
 		}
 		val &= SDW_SCP_STAT_CLK_STP_NF;
 		if (!val) {
-			dev_dbg(bus->dev, "clock stop prep/de-prep done slave:%d\n",
+			dev_dbg(bus->dev, "clock stop %s done slave:%d\n",
+				prepare ? "prepare" : "deprepare",
 				dev_num);
 			return 0;
 		}
@@ -1045,7 +1046,8 @@ static int sdw_bus_wait_for_clk_prep_deprep(struct sdw_bus *bus, u16 dev_num)
 		retry--;
 	} while (retry);
 
-	dev_err(bus->dev, "clock stop prep/de-prep failed slave:%d\n",
+	dev_dbg(bus->dev, "clock stop %s did not complete for slave:%d\n",
+		prepare ? "prepare" : "deprepare",
 		dev_num);
 
 	return -ETIMEDOUT;
@@ -1116,7 +1118,7 @@ int sdw_bus_prep_clk_stop(struct sdw_bus *bus)
 	 */
 	if (!simple_clk_stop) {
 		ret = sdw_bus_wait_for_clk_prep_deprep(bus,
-						       SDW_BROADCAST_DEV_NUM);
+						       SDW_BROADCAST_DEV_NUM, true);
 		/*
 		 * if there are no Slave devices present and the reply is
 		 * Command_Ignored/-ENODATA, we don't need to continue with the
@@ -1236,7 +1238,7 @@ int sdw_bus_exit_clk_stop(struct sdw_bus *bus)
 	 * state machine
 	 */
 	if (!simple_clk_stop) {
-		ret = sdw_bus_wait_for_clk_prep_deprep(bus, SDW_BROADCAST_DEV_NUM);
+		ret = sdw_bus_wait_for_clk_prep_deprep(bus, SDW_BROADCAST_DEV_NUM, false);
 		if (ret < 0)
 			dev_warn(bus->dev, "clock stop deprepare wait failed:%d\n", ret);
 	}
-- 
2.25.1

