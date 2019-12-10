Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B64691197D9
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 22:37:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AF721654;
	Tue, 10 Dec 2019 22:37:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AF721654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576013876;
	bh=Xe6crgvweXJmAVId/iwNF/owtH3PGZy7WFq5a+9sl40=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mBgDnQm8W6iMhuMOeG70DtQDSxJEXLSDaiBRsT7WL4T1iYqC2FR0lsGUe9Y9jwODb
	 Aly4QtXadw/W4O8nEV+/sifj3FCJAxpjwgebd+ckJgMz0bAQ+qpmZ1yPAatsXDi88D
	 omL3EOdh+FxyIqFbTJqIR1Gr5uijc41CXo1gXn6w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A734F80266;
	Tue, 10 Dec 2019 22:35:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE439F80266; Tue, 10 Dec 2019 22:35:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 002A0F80217
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 22:35:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 002A0F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VTdrBtun"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4129D24654;
 Tue, 10 Dec 2019 21:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576013700;
 bh=LGGLpN9446DPXRNWT7ia7WmCS+8dFNjLYAqjDsFvlbU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VTdrBtunAJdsD55DqZHJ0n5KGdlKFVg/RHxdTnUKPRUHt8OXaYcU1JDF5xT8KLljY
 1bHg2e+7/SGDfxcMeiNg1V3ZHDcKtx1pbsT+PfdU3KLNNTRb/pIRPkAN/6yJM3r5T4
 hOcCRTbniqokb/aTtPsYIJEZgDaxg7qwArd+kjaY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 10 Dec 2019 16:31:34 -0500
Message-Id: <20191210213221.11921-130-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210213221.11921-1-sashal@kernel.org>
References: <20191210213221.11921-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH AUTOSEL 4.19 130/177] soundwire: intel: fix
	PDI/stream mapping for Bulk
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit c134f914e9f55b7817e2bae625ec0e5f1379f7cd ]

The previous formula is incorrect for PDI0/1, the mapping is not
linear but has a discontinuity between PDI1 and PDI2.

This change has no effect on PCM PDIs (same mapping).

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191022232948.17156-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soundwire/intel.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 29bc99c4a7b66..e49d3c810677a 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -352,7 +352,10 @@ intel_pdi_shim_configure(struct sdw_intel *sdw, struct sdw_cdns_pdi *pdi)
 	unsigned int link_id = sdw->instance;
 	int pdi_conf = 0;
 
-	pdi->intel_alh_id = (link_id * 16) + pdi->num + 5;
+	/* the Bulk and PCM streams are not contiguous */
+	pdi->intel_alh_id = (link_id * 16) + pdi->num + 3;
+	if (pdi->num >= 2)
+		pdi->intel_alh_id += 2;
 
 	/*
 	 * Program stream parameters to stream SHIM register
@@ -381,7 +384,10 @@ intel_pdi_alh_configure(struct sdw_intel *sdw, struct sdw_cdns_pdi *pdi)
 	unsigned int link_id = sdw->instance;
 	unsigned int conf;
 
-	pdi->intel_alh_id = (link_id * 16) + pdi->num + 5;
+	/* the Bulk and PCM streams are not contiguous */
+	pdi->intel_alh_id = (link_id * 16) + pdi->num + 3;
+	if (pdi->num >= 2)
+		pdi->intel_alh_id += 2;
 
 	/* Program Stream config ALH register */
 	conf = intel_readl(alh, SDW_ALH_STRMZCFG(pdi->intel_alh_id));
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
