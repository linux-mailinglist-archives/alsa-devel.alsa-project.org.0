Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E61025550D
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 09:24:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E8E3182B;
	Fri, 28 Aug 2020 09:23:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E8E3182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598599489;
	bh=weA419a+xC1jcTxulzyOYS/qNThRhkh6zQRQsVsEt48=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OtDc36Twqd6dWxsaF2cNUxZsd/5VI4UTaR3BwzuyVrzn7lKhM1ybuQ4xmM9f6qG2f
	 Zpj14mUCV9OrmsIrTw72cV9gMhntSTxLQ3FTKHzk8YGZQ7O5ojv36EdvmHLbQmnhI3
	 sx9X3EO//ZNgU8nnLRcwCQ03w91II8JTOx6qFwx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18814F80264;
	Fri, 28 Aug 2020 09:21:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94B81F802BC; Fri, 28 Aug 2020 09:21:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 608D5F801F2
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 09:21:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 608D5F801F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZHCkkteO"
Received: from localhost.localdomain (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 93C5420CC7;
 Fri, 28 Aug 2020 07:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598599282;
 bh=weA419a+xC1jcTxulzyOYS/qNThRhkh6zQRQsVsEt48=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZHCkkteOy45g1aR6QM60uzr+gk+nMedLCE3TGJS3LHJzfOJdTgb06fanVkZG0rX+h
 /xL9wvtznw3e9iPq8timCBxQoMuKXz7u0pSkA5fl/MRIyGb2V5tgzkopu0qRp1gaYK
 RYHiZCCsBpDqiNhmLAOJ/P+AAnG4YvjJ2h3xcaM8=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/9] soundwire: slave: use SDW_DISCO_LINK_ID()
Date: Fri, 28 Aug 2020 12:50:55 +0530
Message-Id: <20200828072101.3781956-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200828072101.3781956-1-vkoul@kernel.org>
References: <20200828072101.3781956-1-vkoul@kernel.org>
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
index 0839445ee07b..72bf15322526 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -102,7 +102,7 @@ static bool find_slave(struct sdw_bus *bus,
 	}
 
 	/* Extract link id from ADR, Bit 51 to 48 (included) */
-	link_id = (addr >> 48) & GENMASK(3, 0);
+	link_id = SDW_DISCO_LINK_ID(addr);
 
 	/* Check for link_id match */
 	if (link_id != bus->link_id)
-- 
2.26.2

