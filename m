Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9B8188AD5
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 17:42:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A823183C;
	Tue, 17 Mar 2020 17:41:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A823183C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584463369;
	bh=UJuLb9wDaYvjFM4vmWNO9OgPyIWAGy6ZBh19nedPjZo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qj2Gx0BxTPED8VLseO/Tvzb2nYVqZJ0BYf1eXNjBzU3xrzu56nyQCZGX9rINq+Amm
	 UXImxO/NGTTE5kuqu8GEtrvW44Qa2SlLFy5FDxzs/qYAwR9fjItMQLshwIUEMISv2m
	 c7WgrkG0/NBwR5M9Kxqm2r7vtrXKJCuN4fj8LGJw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3FAFF802E1;
	Tue, 17 Mar 2020 17:36:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 969EEF80253; Tue, 17 Mar 2020 17:34:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84FA4F8022B
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 17:34:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84FA4F8022B
IronPort-SDR: TcYe5f6jRcUkA6z6yqH+SbvDwKBn0ukK/X3tIJcvy2IeZdjXBZGfMdYBHIFTSCtrxTC68YjZGo
 JZsgzDN146zg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 09:34:33 -0700
IronPort-SDR: lcAH2ffeFxx5x26Y1nVbvypyt3mutvCG0QdxTp52zZajFfDFHsDYdDvgQmuYsP2BzbmjTwdTu8
 t55st0bx0qEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,565,1574150400"; d="scan'208";a="244533234"
Received: from aavila-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.36.39])
 by orsmga003.jf.intel.com with ESMTP; 17 Mar 2020 09:34:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 11/17] soundwire: cadence: reorder MCP_CONFIG settings
Date: Tue, 17 Mar 2020 11:33:23 -0500
Message-Id: <20200317163329.25501-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200317163329.25501-1-pierre-louis.bossart@linux.intel.com>
References: <20200317163329.25501-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

Follow hardware programming flows and add placeholder comment for
multi-master mode.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 773341568d7e..9afce1f32076 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -1097,20 +1097,22 @@ int sdw_cdns_init(struct sdw_cdns *cdns)
 	/* Configure mcp config */
 	val = cdns_readl(cdns, CDNS_MCP_CONFIG);
 
-	/* Set Max cmd retry to 15 */
-	val |= CDNS_MCP_CONFIG_MCMD_RETRY;
+	/* Set cmd mode for Tx and Rx cmds */
+	val &= ~CDNS_MCP_CONFIG_CMD;
 
-	/* Set frame delay between PREQ and ping frame to 15 frames */
-	val |= 0xF << SDW_REG_SHIFT(CDNS_MCP_CONFIG_MPREQ_DELAY);
+	/* Disable sniffer mode */
+	val &= ~CDNS_MCP_CONFIG_SNIFFER;
 
 	/* Disable auto bus release */
 	val &= ~CDNS_MCP_CONFIG_BUS_REL;
 
-	/* Disable sniffer mode */
-	val &= ~CDNS_MCP_CONFIG_SNIFFER;
+	/* Multi-master support to be added here */
 
-	/* Set cmd mode for Tx and Rx cmds */
-	val &= ~CDNS_MCP_CONFIG_CMD;
+	/* Set frame delay between PREQ and ping frame to 15 frames */
+	val |= 0xF << SDW_REG_SHIFT(CDNS_MCP_CONFIG_MPREQ_DELAY);
+
+	/* Set Max cmd retry to 15 */
+	val |= CDNS_MCP_CONFIG_MCMD_RETRY;
 
 	cdns_writel(cdns, CDNS_MCP_CONFIG, val);
 
-- 
2.20.1

