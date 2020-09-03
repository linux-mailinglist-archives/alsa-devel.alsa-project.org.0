Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA5E25C08A
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 13:48:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C505192A;
	Thu,  3 Sep 2020 13:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C505192A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599133692;
	bh=5tXXIUaHC2GpLhwQ/tJLbgRXJIwV75JIFYUvxhsL1YY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q7H+V8CntRqsX3c5oRQFGaZ8DX3ltJd2iHmfnwwm21em8hVcZKFWGUQKSYsp+pYOt
	 8lJB98LtzDaSlQajNCl731lqvnFyPYVVdPEsdOiVsWUVCYdRJJyHmPHANBhEsOAYom
	 qdhEw9iJFS0Fuv1BLSVlE6hXir6kE2U2rZKyRMhw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C74EF802C4;
	Thu,  3 Sep 2020 13:45:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDBF0F802A1; Thu,  3 Sep 2020 13:45:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 346EFF801DA
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 13:45:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 346EFF801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GaBclLxN"
Received: from localhost.localdomain (unknown [122.171.179.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A23D20709;
 Thu,  3 Sep 2020 11:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599133527;
 bh=5tXXIUaHC2GpLhwQ/tJLbgRXJIwV75JIFYUvxhsL1YY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GaBclLxNxySy2FhRJ/w6F9eaM6Ca8cTL00X/O7hGFs4hCxxAFPQ3XiWs6G+wae0fi
 86Ooiku1vtS/G2CXVBK9V83uCB6rVcXPibYy13aOO4alP0l5nDtf4MaXox0cisTDYA
 jV6S62TqSnAjsscovuVyQOFCSQyNCLN45eqsZbd4=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 3/9] soundwire: slave: use SDW_DISCO_LINK_ID()
Date: Thu,  3 Sep 2020 17:14:58 +0530
Message-Id: <20200903114504.1202143-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200903114504.1202143-1-vkoul@kernel.org>
References: <20200903114504.1202143-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>
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

use SDW_DISCO_LINK_ID() in slave code to extract field values instead of
open coding masks and shift operations to extract link_id

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/slave.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index a762ee24e6fa..2191dd6e7aa4 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -106,7 +106,7 @@ static bool find_slave(struct sdw_bus *bus,
 	}
 
 	/* Extract link id from ADR, Bit 51 to 48 (included) */
-	link_id = (addr >> 48) & GENMASK(3, 0);
+	link_id = SDW_DISCO_LINK_ID(addr);
 
 	/* Check for link_id match */
 	if (link_id != bus->link_id)
-- 
2.26.2

