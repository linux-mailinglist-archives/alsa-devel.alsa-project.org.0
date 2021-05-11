Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CA6379F58
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 07:52:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC766177B;
	Tue, 11 May 2021 07:51:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC766177B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620712335;
	bh=WC+CE2sZjpnX9YSQaGpUf0AKVlLe3q+0qnDQoR2Jc4I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XKHPZ2U0pzLd1//zf5KB7GEBFmRUbTtffK3WtYJQdO/DsZALdXdZZmioDjf3B5qBE
	 PreGOf/Ok+Hwf8Kgq6Y6MfXzyPTz5kgD3FYuf0G6hJ3JcDSEy9oHzA6Wy61TdrR2n7
	 OqBPRURtmWce+ncGFK3qw3bJF+Cg3PHeH5ukTwQA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33EFEF80156;
	Tue, 11 May 2021 07:50:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8BD9F80163; Tue, 11 May 2021 07:50:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18708F80129
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 07:50:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18708F80129
IronPort-SDR: kpw7RIog8cSxp7CHVJMjWP7LmpAEq/AHP4u7M3aayV8GISwLFmgZl0G1do2c/GY5PWvVOw/+Hf
 FjJ+3oTk/QLw==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="284849664"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="284849664"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 22:50:34 -0700
IronPort-SDR: JwxCby8GjlLqq08831+dJxFqvOpq93xdcW725vcuaLR5Ksvy/7B7iN6SFcCMpMqd0YfIFpC0Hm
 +ZZ7MRHWE4LA==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="471020665"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 22:49:57 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: bandwidth allocation: improve error messages
Date: Tue, 11 May 2021 13:49:45 +0800
Message-Id: <20210511054945.29558-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, sanyog.r.kale@intel.com, rander.wang@linux.intel.com,
 bard.liao@intel.com
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

In rare corner cases, we see an error with the log:

[  838.297840] soundwire sdw-master-1: Compute bus params failed: -22

That's not very useful, there can be two different error conditions
with the same -EINVAL code provided to the caller.

Let's add better dev_err() messages to figure out what went wrong.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/generic_bandwidth_allocation.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
index 84d129587084..f7c66083a4dd 100644
--- a/drivers/soundwire/generic_bandwidth_allocation.c
+++ b/drivers/soundwire/generic_bandwidth_allocation.c
@@ -382,12 +382,18 @@ static int sdw_compute_bus_params(struct sdw_bus *bus)
 		 */
 	}
 
-	if (i == clk_values)
+	if (i == clk_values) {
+		dev_err(bus->dev, "%s: could not find clock value for bandwidth %d\n",
+			__func__, bus->params.bandwidth);
 		return -EINVAL;
+	}
 
 	ret = sdw_select_row_col(bus, curr_dr_freq);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(bus->dev, "%s: could not find frame configuration for bus dr_freq %d\n",
+			__func__, curr_dr_freq);
 		return -EINVAL;
+	}
 
 	bus->params.curr_dr_freq = curr_dr_freq;
 	return 0;
@@ -404,10 +410,8 @@ int sdw_compute_params(struct sdw_bus *bus)
 
 	/* Computes clock frequency, frame shape and frame frequency */
 	ret = sdw_compute_bus_params(bus);
-	if (ret < 0) {
-		dev_err(bus->dev, "Compute bus params failed: %d\n", ret);
+	if (ret < 0)
 		return ret;
-	}
 
 	/* Compute transport and port params */
 	ret = sdw_compute_port_params(bus);
-- 
2.17.1

