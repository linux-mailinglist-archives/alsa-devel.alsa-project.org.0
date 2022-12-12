Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 805A064A62F
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 18:48:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07DBC18F6;
	Mon, 12 Dec 2022 18:48:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07DBC18F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670867334;
	bh=uJLtbFtHBBMQCLXRPUzbdo6bPxcrQVso0t3nAmy1gcU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=C8YvIDP6ax2zvSHVCwJmZiDXqhKh0qPl6tGzX096v/7acARM55aEGRAS3YPymefEq
	 Fopcfb/RMykVgCGSPTJMtjbQ/YB7bbOvKB/XimMpDnpFSYuxhTsQUWsSaVLJZaiAbB
	 xbtZpz5A0dXNKGBy6rdRpJF1dVS85QLMqsYBLJmw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D2EDF804B4;
	Mon, 12 Dec 2022 18:47:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A9E7F8042F; Mon, 12 Dec 2022 18:47:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13D7BF800F8
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 18:47:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13D7BF800F8
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4mtz-0005xL-Jh; Mon, 12 Dec 2022 18:47:43 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4mtx-0044PR-9k; Mon, 12 Dec 2022 18:47:42 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4mtw-004YxA-VN; Mon, 12 Dec 2022 18:47:40 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Subject: [PATCH] ASoC: pxa: Drop empty platform remove function
Date: Mon, 12 Dec 2022 18:47:37 +0100
Message-Id: <20221212174737.3740223-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=836;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=uJLtbFtHBBMQCLXRPUzbdo6bPxcrQVso0t3nAmy1gcU=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjl2k1Djlqr9YwFf4OJ37Rm/0aX1BVR5eUBaZzIMOw
 V3KZiyeJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5dpNQAKCRDB/BR4rcrsCf06B/
 0QgN78x3SSGPNLvXlhZ9UtZQRKCyni7rFdwtVzBRmYDHkz6KwiVogjERzHLDBPoKSWXCYMLUl6V2R8
 RMXCAjsAOG8v7uzK3DvcdALi6XMJhtAuUaW6eMGWmPe1XIknprlr0QJm/p07UquqBmg9uMCHSNKlDY
 lOsU+sIOttm/CnJiT9Y9KhejIYLhuLcnAXI01EltU2vXqKmwaF3+s5ftzLdoAwZypysE+tOuRtykEM
 AerLBvVvY+39oTBbK4YbWLVTpY/Mz04knwtnAIolVyNMDNdmySgKz2E7hkwgZHCzQtH2lFr1sfvOXc
 Ca8rus5G1HfBgEDmyl3au0M66zvFOX
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: kernel@pengutronix.de, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

A remove callback just returning 0 is equivalent to no remove callback
at all. So drop the useless function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/pxa/spitz.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/pxa/spitz.c b/sound/soc/pxa/spitz.c
index 44303b6eb228..70442315f5c5 100644
--- a/sound/soc/pxa/spitz.c
+++ b/sound/soc/pxa/spitz.c
@@ -306,18 +306,12 @@ static int spitz_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int spitz_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 static struct platform_driver spitz_driver = {
 	.driver		= {
 		.name	= "spitz-audio",
 		.pm     = &snd_soc_pm_ops,
 	},
 	.probe		= spitz_probe,
-	.remove		= spitz_remove,
 };
 
 module_platform_driver(spitz_driver);
-- 
2.38.1

