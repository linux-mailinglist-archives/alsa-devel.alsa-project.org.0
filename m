Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 945DC49C0A0
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 02:20:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 424E21928;
	Wed, 26 Jan 2022 02:19:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 424E21928
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643160012;
	bh=7Vi0ipWt+SE4d8d/Oad96LsqbZ3AwLIRa7/Y3EQ/lyM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WH0Z8RQ+w+EtGyvIid0mv+80kiaGT24uFjrXpbihdm/o0m4kDEMsPJ6YCmVJzU2Ek
	 c8sXdm4V1bvlJkM88+feEU5hz1O4azu7bQlZjLg+qCmgoqmJrZldf5cv/J35NvEgXv
	 66TbWMq2P/XJebIVQL2lrUI4zUUXcpWg9nLoDTnE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED4C4F8051C;
	Wed, 26 Jan 2022 02:17:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C2C1F8051C; Wed, 26 Jan 2022 02:17:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EF22F80118
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 02:17:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EF22F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TvwQoSEU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643159861; x=1674695861;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=7Vi0ipWt+SE4d8d/Oad96LsqbZ3AwLIRa7/Y3EQ/lyM=;
 b=TvwQoSEUXjAaP8f7bwASfVqBoi67fRgxU1nWbojpwSeY34l3kJm2ioWK
 6JV17TDvcfzt1z2pYZ6/2Rc9TAEnLfcv95PF1+QHQ5Q8YtZVGRA/9EHCT
 C5AWYf/TFeAerjJfHGcfvP0JavGsNUOualMQKXxfjfaV5W9vaeJZ1pWGN
 GjvLxYfK3r1lWmD/IxV3nfMUiml7NA4Sh+WaJBezUtqTLP3idkJFfNatT
 +Mi/v18XD+5fE9cVpY/LvMr118Ypu0/Zcar2QFi2dswTWIc/9Ox7NWS3P
 UGv/Y7yWu6Hvn87IuoIz+nyptsaAF9Vy8skqf2s/COSfdue8h3l9sgb8n A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="246236129"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="246236129"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="520617385"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 17:17:35 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 03/19] soundwire: stream: simplify check on port range
Date: Wed, 26 Jan 2022 09:16:59 +0800
Message-Id: <20220126011715.28204-4-yung-chuan.liao@linux.intel.com>
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

Pass the index directly to sdw_is_valid_port_range(), this will be
useful for further simplifications.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/stream.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index a75d3576bfcf..3ac2e5a66700 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1177,12 +1177,10 @@ static int sdw_config_stream(struct device *dev,
 	return 0;
 }
 
-static int sdw_is_valid_port_range(struct device *dev,
-				   struct sdw_port_runtime *p_rt)
+static int sdw_is_valid_port_range(struct device *dev, int num)
 {
-	if (!SDW_VALID_PORT_RANGE(p_rt->num)) {
-		dev_err(dev,
-			"SoundWire: Invalid port number :%d\n", p_rt->num);
+	if (!SDW_VALID_PORT_RANGE(num)) {
+		dev_err(dev, "SoundWire: Invalid port number :%d\n", num);
 		return -EINVAL;
 	}
 
@@ -1249,7 +1247,7 @@ static int sdw_slave_port_config(struct sdw_slave *slave,
 		 * TODO: Check valid port range as defined by DisCo/
 		 * slave
 		 */
-		ret = sdw_is_valid_port_range(&slave->dev, p_rt);
+		ret = sdw_is_valid_port_range(&slave->dev, port_config[i].num);
 		if (ret < 0) {
 			kfree(p_rt);
 			return ret;
-- 
2.17.1

