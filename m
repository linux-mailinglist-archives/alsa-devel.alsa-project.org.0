Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5118B34F591
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Mar 2021 02:48:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9BFC1682;
	Wed, 31 Mar 2021 02:47:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9BFC1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617151682;
	bh=Fw7WuRtAehEHtJ08L2uytzWHsJaU4kA9eQluoZ/YoUU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=viqD1JWtZZor3/Kgsst81bP9zYenNrZf2wKnHRHsXbal2T99HK6mlvybfO8NqnddX
	 e5uYxGgo3pwI4tFhSvsRYsP5OBRDIV1CaFuHrUnJx1Vsm4zQDYRxnrbW3PA30QNwS6
	 Y+RIoI5n6smO2+R9L8gx/Y1smWiMb1bMglxaxxCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68874F8026B;
	Wed, 31 Mar 2021 02:46:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 992D3F80240; Wed, 31 Mar 2021 02:46:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F8FBF80141
 for <alsa-devel@alsa-project.org>; Wed, 31 Mar 2021 02:46:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F8FBF80141
IronPort-SDR: deZfMYckFGfLISpVSNtNZbnkqY9MrZFrCV7wY0Mc4TYTTte1m8yTmsz3DJ9gbPLEI8dIPccU05
 CIINkGtumzIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="191990643"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="191990643"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 17:46:21 -0700
IronPort-SDR: gm0YkBJEVZ4ivykypiNDPO+bUOLrPysK1t06a47gdChVlbVFQkY1n9d1OdeV2ZdiN6OSJweI+/
 VijoLndzWasg==
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="418407069"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 17:46:18 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: stream: fix memory leak in stream config error path
Date: Wed, 31 Mar 2021 08:46:10 +0800
Message-Id: <20210331004610.12242-1-yung-chuan.liao@linux.intel.com>
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

From: Rander Wang <rander.wang@intel.com>

When stream config is failed, master runtime will release all
slave runtime in the slave_rt_list, but slave runtime is not
added to the list at this time. This patch frees slave runtime
in the config error path to fix the memory leak.

Fixes: bbe7379d8040a ("soundwire: Add support for SoundWire stream management")
Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Keyon Jie <yang.jie@intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 9c064b672745..1eaedaaba094 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1375,8 +1375,16 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
 	}
 
 	ret = sdw_config_stream(&slave->dev, stream, stream_config, true);
-	if (ret)
+	if (ret) {
+		/*
+		 * sdw_release_master_stream will release s_rt in slave_rt_list in
+		 * stream_error case, but s_rt is only added to slave_rt_list
+		 * when sdw_config_stream is successful, so free s_rt explicitly
+		 * when sdw_config_stream is failed.
+		 */
+		kfree(s_rt);
 		goto stream_error;
+	}
 
 	list_add_tail(&s_rt->m_rt_node, &m_rt->slave_rt_list);
 
-- 
2.17.1

