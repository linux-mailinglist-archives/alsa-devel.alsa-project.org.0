Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C85821349EA
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jan 2020 18:58:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2213F175E;
	Wed,  8 Jan 2020 18:57:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2213F175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578506315;
	bh=fVY5Nm2s+7evtSEOumzL1CaDdosKWz+hRunVrhh3IaE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ox8N2LP7rjMXq05wslyTV+cgCx8p3cgYxqcjcUeFq5XyK2o7XJltvTrkqkYeb4dGo
	 Hc3YFrFzLCvddIBsuFSGXE4m1b2uYRPQqRkQ3j32HBpX2huTeUIRj9Ns0gJKX78eb7
	 FtDiDXBWjiINj+9E0hlaVLKsMxYOMeStMm1dW0PM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B69F8F8027B;
	Wed,  8 Jan 2020 18:55:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E42CF80276; Wed,  8 Jan 2020 18:55:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D595F80149
 for <alsa-devel@alsa-project.org>; Wed,  8 Jan 2020 18:55:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D595F80149
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 09:54:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; d="scan'208";a="211617357"
Received: from cozturk-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.17.77])
 by orsmga007.jf.intel.com with ESMTP; 08 Jan 2020 09:54:57 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  8 Jan 2020 11:54:33 -0600
Message-Id: <20200108175438.13121-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200108175438.13121-1-pierre-louis.bossart@linux.intel.com>
References: <20200108175438.13121-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/6] soundwire: stream: remove redundant pr_err
	traces
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

Only keep pr_err to flag critical configuration errors that will
typically only happen during system integration.

For errors on prepare/deprepare/enable/disable, the caller can do a
much better job with more information on the DAI and device that
caused the issue.

Suggested-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/stream.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index e69f94a8c3a8..178ae92b8cc1 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1554,8 +1554,6 @@ int sdw_prepare_stream(struct sdw_stream_runtime *stream)
 	sdw_acquire_bus_lock(stream);
 
 	ret = _sdw_prepare_stream(stream);
-	if (ret < 0)
-		pr_err("Prepare for stream:%s failed: %d\n", stream->name, ret);
 
 	sdw_release_bus_lock(stream);
 	return ret;
@@ -1622,8 +1620,6 @@ int sdw_enable_stream(struct sdw_stream_runtime *stream)
 	sdw_acquire_bus_lock(stream);
 
 	ret = _sdw_enable_stream(stream);
-	if (ret < 0)
-		pr_err("Enable for stream:%s failed: %d\n", stream->name, ret);
 
 	sdw_release_bus_lock(stream);
 	return ret;
@@ -1698,8 +1694,6 @@ int sdw_disable_stream(struct sdw_stream_runtime *stream)
 	sdw_acquire_bus_lock(stream);
 
 	ret = _sdw_disable_stream(stream);
-	if (ret < 0)
-		pr_err("Disable for stream:%s failed: %d\n", stream->name, ret);
 
 	sdw_release_bus_lock(stream);
 	return ret;
@@ -1756,8 +1750,6 @@ int sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 
 	sdw_acquire_bus_lock(stream);
 	ret = _sdw_deprepare_stream(stream);
-	if (ret < 0)
-		pr_err("De-prepare for stream:%d failed: %d\n", ret, ret);
 
 	sdw_release_bus_lock(stream);
 	return ret;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
