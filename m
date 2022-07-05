Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F217566625
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 11:28:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B353B16E0;
	Tue,  5 Jul 2022 11:27:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B353B16E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657013303;
	bh=qDxgHKU+doIhEne6ScFlapgjylf1pJ+0Tr9JEKNAYEY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cNN7TE3Bli0rnx+/5G05+lFL2pylCaohtnZf5lK+L5Ge9OF1jLniUPvO4IJ6jnYaW
	 RJTbY6qIFGLCTKWVL2VaPLECRVQPQT8x/2ZTIZNBd8PuFVBuy/rHfZpWSimAWi0rIz
	 oPUBhtUT+WgUa4+emAb8O23pdN6aGLEAylegqZ6U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EDCFF800CB;
	Tue,  5 Jul 2022 11:27:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A3C0F800CB; Tue,  5 Jul 2022 11:27:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E084F800CB
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 11:27:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E084F800CB
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1o8epq-0006Bm-KO; Tue, 05 Jul 2022 11:27:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o8epk-004XSE-Ay; Tue, 05 Jul 2022 11:27:07 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o8epn-0037i9-3c; Tue, 05 Jul 2022 11:27:07 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: xilinx: Suppress second error message about reset
 failure in .remove()
Date: Tue,  5 Jul 2022 11:26:45 +0200
Message-Id: <20220705092645.101343-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1129; h=from:subject;
 bh=qDxgHKU+doIhEne6ScFlapgjylf1pJ+0Tr9JEKNAYEY=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBixAPS7RESMsGyow+QX+KR/Iz7pFWBq2U40Ie995C+
 k3NwGYGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYsQD0gAKCRDB/BR4rcrsCU32CA
 CClenbIgn9YVIMowqp2NKMgCNBkpQ8mICVwgFsnXx04PhpgCsdXWrLfTX5/R8F+qDYzyubbNpQiN50
 uoQwuiNbhGdDz7X71OdOyH0jRpupNU2pZZYHsJwR4ANMuHS5Y/10w2dha5L1tRgk1o6j50t3AePyyN
 fdq7ixn2PM2q5aET5S5Oh2VtFkmhuJiGki/PDZj7pPo3ZJ+jCM21qlmnlr/N3I7/a/aqBLRqGPBhxw
 xh+JovndIyiQFMGeoSToXeb3IDzJlSfWa1hCttqnabWX0O8j7ns2iOzxPBjzyyRTd1XCOPKokgU3Ca
 f4FanvAapQKFgWwAWXiePqNE/7Clp7
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 Michal Simek <michal.simek@xilinx.com>, kernel@pengutronix.de
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

Returning an error value in a platform remove callback results in an error
message being emitted by the platform core, but otherwise it doesn't make
a difference. If ret is != 0, there is already an error message and another
very generic doesn't add any value, so return 0 unconditionally.

This is a preparation for making platform remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 5c4158069a5a..c42de48caea5 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -703,7 +703,7 @@ static int xlnx_formatter_pcm_remove(struct platform_device *pdev)
 		dev_err(&pdev->dev, "audio formatter reset failed\n");
 
 	clk_disable_unprepare(adata->axi_clk);
-	return ret;
+	return 0;
 }
 
 static const struct of_device_id xlnx_formatter_pcm_of_match[] = {

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1

