Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7C349C098
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 02:19:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE4091F73;
	Wed, 26 Jan 2022 02:18:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE4091F73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643159962;
	bh=r96d366BOZOklC6E0TxFNatMgTAwkA3B2SyQlBSc03c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DquEkGN4gs2kXD9SIjMEDkuUF4vp8UtixSefwhjP7ArIgDfHZmlf6Gh6oDSon3abT
	 cT1JOxeiyXIEGDc3/H/Xv8G0vLdUQpnSV1/0duAgxUE03sQVl0fJrqrFFlWuDMNbl9
	 4V9QUoMB+gpfXd6jJhN8uuyd0OtAuHINIrpupfWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 147EDF80508;
	Wed, 26 Jan 2022 02:17:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BACC7F80506; Wed, 26 Jan 2022 02:17:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F557F80161
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 02:17:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F557F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="J6Vwe0DQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643159858; x=1674695858;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=r96d366BOZOklC6E0TxFNatMgTAwkA3B2SyQlBSc03c=;
 b=J6Vwe0DQWxUeqCh8xYuMxdkkvFf+ROTLIcmTgrZ2ELOlexyzsECGPB0q
 pJWSk3hBfvi3171bq4Qk9tqxiUnH3LMvjtSYzOHnv6o2ObOAk3sAT1bqn
 6rrlK0iqrKxAOhLIQ/sVTQSMtTXp7uwlkJtqEOE9+fENqdj4PKc72dsfE
 yHrOlzno860ys7BH07pHpX2TIIJ9NVzTg4dVVcv1vmbl1MeeQ13mR5yJ1
 ajIK1M0vRNhDbajvlL5EDcbR2IdIIFggOg2WWWR3vpvrF8mxYKQnsYtUo
 s/z3pT5xbM187lUgei4ugrBfL+TuDZ3D2PN5yhPcAb2kAXGEZx5L50e+Z A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246236110"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="246236110"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="520617318"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:30 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 01/19] soundwire: stream: remove unused parameter in
 sdw_stream_add_slave
Date: Wed, 26 Jan 2022 09:16:57 +0800
Message-Id: <20220126011715.28204-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220126011715.28204-1-yung-chuan.liao@linux.intel.com>
References: <20220126011715.28204-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

The stream parameter is not used, remove before further simplifications.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 980f26d49b66..a30d0fb4871b 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -968,14 +968,12 @@ static struct sdw_master_runtime
  *
  * @slave: Slave handle
  * @stream_config: Stream configuration
- * @stream: Stream runtime handle
  *
  * This function is to be called with bus_lock held.
  */
 static struct sdw_slave_runtime
 *sdw_alloc_slave_rt(struct sdw_slave *slave,
-		    struct sdw_stream_config *stream_config,
-		    struct sdw_stream_runtime *stream)
+		    struct sdw_stream_config *stream_config)
 {
 	struct sdw_slave_runtime *s_rt;
 
@@ -1367,7 +1365,7 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 		goto error;
 	}
 
-	s_rt = sdw_alloc_slave_rt(slave, stream_config, stream);
+	s_rt = sdw_alloc_slave_rt(slave, stream_config);
 	if (!s_rt) {
 		dev_err(&slave->dev,
 			"Slave runtime config failed for stream:%s\n",
-- 
2.17.1

