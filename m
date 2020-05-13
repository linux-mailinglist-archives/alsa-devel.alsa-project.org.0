Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B7B1D0675
	for <lists+alsa-devel@lfdr.de>; Wed, 13 May 2020 07:42:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B98FC1655;
	Wed, 13 May 2020 07:41:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B98FC1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589348559;
	bh=7GPXho/Ck/GOy3r2AKYaUHNIQd+RBrREuDaBgmDIYUc=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SqAt1ca76TW2CMXgPa4ImXyM4dzFApfLFQxumKiJFGnCa2AkzndIpUoeNzYJtzKBH
	 1r55d6gUjQ5SBBTMc21WU5CXV6xvjBBndnLzMzI84ZNXXb93F11QUiDskrkb963EcN
	 OWULk32pYTsKtWViP/1uMpjfpHbPEqAIsCtSZU00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFA1AF800BD;
	Wed, 13 May 2020 07:40:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D91DF80247; Wed, 13 May 2020 07:40:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD5D2F800BD
 for <alsa-devel@alsa-project.org>; Wed, 13 May 2020 07:40:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD5D2F800BD
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 095C12007B4;
 Wed, 13 May 2020 07:40:46 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7D7E3201259;
 Wed, 13 May 2020 07:40:41 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 93F30402B4;
 Wed, 13 May 2020 13:40:35 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 shengjiu.wang@nxp.com, tglx@linutronix.de, allison@lohutok.net,
 info@metux.net, patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: wm8962: Use force clear for WM8962_SYSCLK_ENA after
 reset
Date: Wed, 13 May 2020 13:30:35 +0800
Message-Id: <1589347835-20554-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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

When CLOCKING2 is non-volatile register, we need force clear
the WM8962_SYSCLK_ENA bit after reset, for the value in cache
maybe 0 but in hardware it is 1. Otherwise there will issue
as below statement in driver.

/* SYSCLK defaults to on; make sure it is off so we can safely
 * write to registers if the device is declocked.

Fixes: c38b608504aa ("ASoC: wm8962: set CLOCKING2 as non-volatile register")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/wm8962.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 0a2cfff44441..08d19df8a700 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3798,8 +3798,8 @@ static int wm8962_runtime_resume(struct device *dev)
 	/* SYSCLK defaults to on; make sure it is off so we can safely
 	 * write to registers if the device is declocked.
 	 */
-	regmap_update_bits(wm8962->regmap, WM8962_CLOCKING2,
-			   WM8962_SYSCLK_ENA, 0);
+	regmap_write_bits(wm8962->regmap, WM8962_CLOCKING2,
+			  WM8962_SYSCLK_ENA, 0);
 
 	/* Ensure we have soft control over all registers */
 	regmap_update_bits(wm8962->regmap, WM8962_CLOCKING2,
-- 
2.21.0

