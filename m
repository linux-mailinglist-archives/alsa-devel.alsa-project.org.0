Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D37298B62
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 08:29:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC9291657;
	Thu, 22 Aug 2019 08:28:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC9291657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566455367;
	bh=OUcEGfw7+iAZpulCxlG7yKO8q9T+tffO1mjjOftJId4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WhflRnBmbSqb888dH9tx3e7AZD9lVV/rBvMZcqlPQEIxyZxfqIb+606XtvN45IFeM
	 iJ2hu/1KqdR5qzp3B5msJpNGa4K0WKq+LFEEfYg4am/ToeT1IQCltBV4xX+BNblF+4
	 9dtGWCE3pPW4n7YJGdCXTr3f8bKKaU6fsuVtIK90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82F36F803D5;
	Thu, 22 Aug 2019 08:27:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D73FFF8036E; Thu, 22 Aug 2019 08:27:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20251F80147
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 08:27:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20251F80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kl/yOs3Z"
Received: from localhost.localdomain (unknown [171.61.89.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3E911205ED;
 Thu, 22 Aug 2019 06:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566455251;
 bh=UBiVQJTLUuEREfE4wiyKi70+Ms880WoDypAEyoYBlWU=;
 h=From:To:Cc:Subject:Date:From;
 b=kl/yOs3Z+km7m1N2Utj3SrFx56+zrmhukYYNQD9+2MzKTHfIufbxfjlmWegPjsmO1
 MmOJ6abKsBqVaUbhVKTuAZ3qH4ZFHNwMDETSrbOWe4P1AHGwoagPDEt7jqffh08qKZ
 E1MZmMlAFGMFPC5EU0W7UIjzQ0gNop7+v6nF1J9A=
From: Vinod Koul <vkoul@kernel.org>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 11:55:55 +0530
Message-Id: <20190822062555.30216-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Vinod Koul <vkoul@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Shreyas NC <shreyas.nc@intel.com>
Subject: [alsa-devel] [PATCH] soundwire: intel: remove unused variables
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

Variables 'nval' and 'i' are no longer used sdw_master_read_intel_prop()
so remove them.

drivers/soundwire/intel.c: In function 'sdw_master_read_intel_prop':
drivers/soundwire/intel.c:829:12: warning: unused variable 'i' [-Wunused-variable]
  int nval, i;
            ^
drivers/soundwire/intel.c:829:6: warning: unused variable 'nval' [-Wunused-variable]
  int nval, i;
      ^~~~

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 085f4ace103d ("soundwire: intel: read mclk_freq property from firmware")
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/intel.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 459cc1e6355d..cad378f741c0 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -826,7 +826,6 @@ static int sdw_master_read_intel_prop(struct sdw_bus *bus)
 	struct sdw_master_prop *prop = &bus->prop;
 	struct fwnode_handle *link;
 	char name[32];
-	int nval, i;
 
 	/* Find master handle */
 	snprintf(name, sizeof(name),
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
