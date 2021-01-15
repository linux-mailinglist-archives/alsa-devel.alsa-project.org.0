Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DE82F724A
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 06:40:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D7F01799;
	Fri, 15 Jan 2021 06:39:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D7F01799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610689229;
	bh=wXrNb3Fo1n1/2dxgN4xDOV7MR/MMuf6OcRhjUWLwbbk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RsznzcsyQ9KkIWxO/NgI55K8+f/LzgxHiC9uiEzY4XnPwG3jFt8hM0bXKGlNSEb0X
	 75izUSzbdTg3TJj7fGKjsIz/zMVjLdr/TttD6nkBLRIKyCbfQNmD80PMHeiyeipJNS
	 Y21dqKuGAhPHmo2blE8rek8qJCeZTAHCxKDHT7J0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90A16F804D2;
	Fri, 15 Jan 2021 06:38:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42281F8026B; Fri, 15 Jan 2021 06:37:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1CD7F8026B
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 06:37:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1CD7F8026B
IronPort-SDR: 6rZ+nxTWYsN7Y+yUv4UTtfV4LRx6LpMVxrY17wvoXfTNCccUZuCrlv4lIVnM5ybDtCdfofa2Xh
 /P4BD6M7Kspg==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="240046297"
X-IronPort-AV: E=Sophos;i="5.79,348,1602572400"; d="scan'208";a="240046297"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 21:37:50 -0800
IronPort-SDR: mhokcHvfHOx9j9BiXi81wh8un63TEPt4jKAj6DjlXGvCqsA6pMwIM7FT77dMLysqBj3g70x6i1
 b8WzwkYtP34Q==
X-IronPort-AV: E=Sophos;i="5.79,348,1602572400"; d="scan'208";a="382542474"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 21:37:47 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 4/5] soundwire: cadence: fix ACK/NAK handling
Date: Fri, 15 Jan 2021 13:37:37 +0800
Message-Id: <20210115053738.22630-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210115053738.22630-1-yung-chuan.liao@linux.intel.com>
References: <20210115053738.22630-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org, jank@cadence.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

The existing code reports a NAK only when ACK=0
This is not aligned with the SoundWire 1.x specifications.

Table 32 in the SoundWire 1.2 specification shows that a Device shall
not set NAK=1 if ACK=1. But Table 33 shows the Combined Response
may very well be NAK=1/ACK=1, e.g. if another Device than the one
addressed reports a parity error.

NAK=1 signals a 'Command_Aborted', regardless of the ACK bit value.

Move the tests for NAK so that the NAK=1/ACK=1 combination is properly
detected according to the specification.

Fixes: 956baa1992f9a ('soundwire: cdns: Add sdw_master_ops and IO transfer support')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 801e1fef59d8..d3c9cf920cbd 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -484,10 +484,10 @@ cdns_fill_msg_resp(struct sdw_cdns *cdns,
 		if (!(cdns->response_buf[i] & CDNS_MCP_RESP_ACK)) {
 			no_ack = 1;
 			dev_dbg_ratelimited(cdns->dev, "Msg Ack not received\n");
-			if (cdns->response_buf[i] & CDNS_MCP_RESP_NACK) {
-				nack = 1;
-				dev_err_ratelimited(cdns->dev, "Msg NACK received\n");
-			}
+		}
+		if (cdns->response_buf[i] & CDNS_MCP_RESP_NACK) {
+			nack = 1;
+			dev_err_ratelimited(cdns->dev, "Msg NACK received\n");
 		}
 	}
 
-- 
2.17.1

