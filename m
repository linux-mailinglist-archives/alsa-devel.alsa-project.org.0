Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF323C7B3C
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 03:57:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9A8A1695;
	Wed, 14 Jul 2021 03:57:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9A8A1695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626227872;
	bh=K06VNf1+BAP0SJnOrwFHKmBCoSC7aTCG6EWn6ru/tMY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=l5rTdrXO2A88frBXqoe4R+eu9vLj9/v5/zlsyxj5ebJ9m4DLZR5DHKw5QTv/0Ub0j
	 hcqWH0JljRDR5Rs5JzWNGD/43MsqHsk0lNUyypBu/uJj056llZ5dJ8x9XsZEPlHfza
	 RdnJXLx3HcZk+/m1avsTkI2du8ayl34K6VKioMD0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACAE4F800D3;
	Wed, 14 Jul 2021 03:56:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46732F80254; Wed, 14 Jul 2021 03:56:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16EFBF8011C
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 03:56:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16EFBF8011C
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="210313917"
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; d="scan'208";a="210313917"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 18:56:11 -0700
X-IronPort-AV: E=Sophos;i="5.84,237,1620716400"; d="scan'208";a="493511001"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 18:56:08 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: cadence: Remove ret variable from sdw_cdns_irq()
Date: Wed, 14 Jul 2021 09:55:55 +0800
Message-Id: <20210714015555.17685-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vinod.koul@linaro.org, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

The ret is not used in the interrupt handler, it is just returned without
any condition or change.
We can return the IRQ_HANDLED directly.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/cadence_master.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
index 25950422b085..9a9b6110e763 100644
--- a/drivers/soundwire/cadence_master.c
+++ b/drivers/soundwire/cadence_master.c
@@ -822,7 +822,6 @@ irqreturn_t sdw_cdns_irq(int irq, void *dev_id)
 {
 	struct sdw_cdns *cdns = dev_id;
 	u32 int_status;
-	int ret = IRQ_HANDLED;
 
 	/* Check if the link is up */
 	if (!cdns->link_up)
@@ -900,7 +899,7 @@ irqreturn_t sdw_cdns_irq(int irq, void *dev_id)
 	}
 
 	cdns_writel(cdns, CDNS_MCP_INTSTAT, int_status);
-	return ret;
+	return IRQ_HANDLED;
 }
 EXPORT_SYMBOL(sdw_cdns_irq);
 
-- 
2.17.1

