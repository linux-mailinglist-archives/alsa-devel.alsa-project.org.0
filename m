Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B0F1D75CC
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 13:02:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B91916E9;
	Mon, 18 May 2020 13:01:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B91916E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589799733;
	bh=w4nIU5kRonXxVT907f5K7p1MJ9HZJHoOD03DSyBIRkc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qjC0u/vJVGXcnzTH4J8fGrNUuPf47xisgfAbkulhfRrrNgjfsZrp/0l2oHxDKFPV1
	 PHONfCHT4mYJ2OrkPPcjwCDaVzCb7V6hgGTKMAJ2pRcXN7HTmU1l6nCe4f2LJ9Hc06
	 8J7GU5MqvIIyVBP6KyUYDAEqks4ABGAaSAJ7+lUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFF84F800C9;
	Mon, 18 May 2020 13:00:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE69BF80216; Mon, 18 May 2020 13:00:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cmccmta1.chinamobile.com (cmccmta1.chinamobile.com
 [221.176.66.79])
 by alsa1.perex.cz (Postfix) with ESMTP id 7BDE4F801F9
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 13:00:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BDE4F801F9
Received: from spf.mail.chinamobile.com (unknown[172.16.121.17]) by
 rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee25ec26ab0fc7-376d3;
 Mon, 18 May 2020 19:00:00 +0800 (CST)
X-RM-TRANSID: 2ee25ec26ab0fc7-376d3
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.146])
 by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee95ec26aadd27-b87e8;
 Mon, 18 May 2020 19:00:00 +0800 (CST)
X-RM-TRANSID: 2ee95ec26aadd27-b87e8
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: broonie@kernel.org, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com, perex@perex.cz
Subject: [PATCH] ASoC: fsl_micfil: Fix unused assignment in
 fsl_set_clock_params()
Date: Mon, 18 May 2020 19:00:40 +0800
Message-Id: <20200518110040.18036-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tang Bin <tangbin@cmss.chinamobile.com>
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

Delete unused initialized value of 'ret', because it will
be assigned by the function fsl_micfil_set_mclk_rate().

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/fsl/fsl_micfil.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 79cf488fa..a7a6118be 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -295,7 +295,7 @@ static int fsl_set_clock_params(struct device *dev, unsigned int rate)
 {
 	struct fsl_micfil *micfil = dev_get_drvdata(dev);
 	int clk_div;
-	int ret = 0;
+	int ret;
 
 	ret = fsl_micfil_set_mclk_rate(micfil, rate);
 	if (ret < 0)
-- 
2.20.1.windows.1



