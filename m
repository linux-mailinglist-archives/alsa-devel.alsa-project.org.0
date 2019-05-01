Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0827E10ACE
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 18:12:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9023316EA;
	Wed,  1 May 2019 18:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9023316EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556727167;
	bh=/Rre3QJqZYJG06aH9py6y/j6NWTwF+aVqQij8o4u9ac=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pDIYn5lAqpVE64JdUzwFn6OAp6h5FfbDoxg7N08zrqVnr17aE84q3k1Vndo5qaZ7b
	 uuU/XMva7/c58jThdtEHad6zkcjMwkeFD7xwA+gu711+WnoAU4/kondMwLe+OnHLXl
	 wy3i91G1DpRBqzvEiigBF9HIV8BIIKn6IbGqNT+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFE3CF89786;
	Wed,  1 May 2019 17:59:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFC84F89750; Wed,  1 May 2019 17:58:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9F17F89747
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 17:58:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9F17F89747
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 May 2019 08:58:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,418,1549958400"; d="scan'208";a="296115747"
Received: from modiarvi-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.134.211])
 by orsmga004.jf.intel.com with ESMTP; 01 May 2019 08:58:40 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  1 May 2019 10:57:42 -0500
Message-Id: <20190501155745.21806-20-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
References: <20190501155745.21806-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: [alsa-devel] [PATCH v4 19/22] soundwire: cadence_master: balance
	parentheses
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

While not strictly necessary, balanced parentheses help with code
readability.

Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index e45076be1e09..04632a97721e 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -569,8 +569,9 @@ irqreturn_t sdw_cdns_irq(int irq, void *dev_id)
 					   cdns->defer->length, 0);
 			complete(&cdns->defer->complete);
 			cdns->defer = NULL;
-		} else
+		} else {
 			complete(&cdns->tx_complete);
+		}
 	}
 
 	if (int_status & CDNS_MCP_INT_CTRL_CLASH) {
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
