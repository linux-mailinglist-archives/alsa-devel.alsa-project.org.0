Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B531D117FC
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 13:10:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4401C17C0;
	Thu,  2 May 2019 13:09:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4401C17C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556795411;
	bh=/sxgrjYH1yaGI/N9cLN8i1Whf/QnNy+u1+Wv5b2hQjU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oEXQmLa237n+9ApxcVpiW+6C8S5boQkJNAH+Jy9RJ4y8sQXNHgBoyq0Ih9x5CHczD
	 UlEtwD4ziymv+ZxNkTDCKtnt0Yi7mc93FrjGNgI9cmjHNsHRnBswG9P8WoOolXHFlz
	 n8b9/epbtvhXHrk+RWiOLt4OI/csvtokln2o1qfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF0FFF89756;
	Thu,  2 May 2019 13:00:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8767F8974F; Thu,  2 May 2019 13:00:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C4A6F8974F
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 13:00:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C4A6F8974F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jEEHLq9y"
Received: from localhost.localdomain (unknown [171.76.113.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0097920656;
 Thu,  2 May 2019 11:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556794842;
 bh=Nxjf/qNQYqjiBe9R0eKn/f1btuiVEF1z0Y4EiTwpn2Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jEEHLq9ym/iSL2+plp0F0SwO1ytk+FzysVTbEO7AwdHaMw4beQzfFVuBHoEaW0obp
 w1sdojsMbvyVIW5Sqyn8Wj30FdEaM+nU9zeDdKqkeUMuQI1h4CKlrRQxoyB10p53sg
 rmIelJ28tTMCcut/bpgvSjfjBZwrmLc9zHiCNE04=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Date: Thu,  2 May 2019 16:29:28 +0530
Message-Id: <20190502105930.9889-13-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502105930.9889-1-vkoul@kernel.org>
References: <20190502105930.9889-1-vkoul@kernel.org>
MIME-Version: 1.0
Cc: Greg KH <gregkh@linuxfoundation.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Shreyas NC <shreyas.nc@intel.com>
Subject: [alsa-devel] [PATCH 12/14] soundwire: wrap macro argument in
	parenthesis
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

macro argument should be inside a parenthesis to avoid precedence
issues

checkpatch complains:
CHECK: Macro argument 'n' may be better as '(n)' to avoid
precedence issues

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 include/linux/soundwire/sdw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 41c49631288a..35662d9c2c62 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -36,7 +36,7 @@ struct sdw_slave;
 #define SDW_FRAME_CTRL_BITS		48
 #define SDW_MAX_DEVICES			11
 
-#define SDW_VALID_PORT_RANGE(n)		(n <= 14 && n >= 1)
+#define SDW_VALID_PORT_RANGE(n)		((n) <= 14 && (n) >= 1)
 
 #define SDW_DAI_ID_RANGE_START		100
 #define SDW_DAI_ID_RANGE_END		200
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
