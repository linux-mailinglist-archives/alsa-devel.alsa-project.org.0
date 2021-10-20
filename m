Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FC2434BB6
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 14:59:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2A9A16EF;
	Wed, 20 Oct 2021 14:58:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2A9A16EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634734779;
	bh=HttVH5Ct4gC/lyTAKhpD1IttPms7gVBgbjDqngvZA0o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ofFAbXIrMcpEuFYpWaR5lgYmk6H7xXZFmc8QGq9Zo3sFbAb3hN6OxlWsjK4Iohuwr
	 T4tRWciL0Dtrdl6ZaGKcEVIb+dcncN0Ra1PCCGD/9KBbFVGyePNjd6sCCHbNVbyWrF
	 1NY+26BM6xueIku8DdRkiqzf1FVsCMT/sUQOOxfE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7097F802E0;
	Wed, 20 Oct 2021 14:58:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C3CCF802DF; Wed, 20 Oct 2021 14:58:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E807F80224
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 14:58:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E807F80224
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mdBAf-0001rC-VT; Wed, 20 Oct 2021 14:58:18 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mdBAf-000620-2p; Wed, 20 Oct 2021 14:58:17 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mdBAf-00040J-1u; Wed, 20 Oct 2021 14:58:17 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoc: wm8731: Drop empty spi_driver remove callback
Date: Wed, 20 Oct 2021 14:58:03 +0200
Message-Id: <20211020125803.23117-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=Y7xBbANbWLO2mbQDJa+DpqXxhnantOSwJNOSLTBuF58=;
 m=H2CYebE0C3w0pEIPV6p+i3ENgo2xahs3TAXJZPt6zAw=;
 p=bcMssGCSnNSvaBs1KoVO9VPflO2FIxIqq5Deqh6BVzg=;
 g=c09710cbdb794801eef9ad43ddd5c2dd91859eab
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFwElcACgkQwfwUeK3K7AljVQf9G7Z
 5hY5CSUhwQi2IIcCAvoSrko/gqhVqR/ZCBj2RD+9+10XJcbc8xUhrr/DxSOmcAK6+fbkHq8wdHWXz
 LJ93cx2/wTj4UJ8efG8LNlyCCeQNgbHqksS79GLGLy74UBPNYZ8ocNmjIoWL2ZG5rbZwuerMdRJpg
 5qzMJzgyEMxUEwnYMddV4aY1SsXzRTCaU2T9sEBwzjGoDWnDElX5AuCxPBaPJTTrCv7dkP0TuPFII
 YqRWSbhPNESqAEodrgs+cCplkd0lpAOoGwGbKkrelwop1O4UNtl6Gxi+ti1yayRKAoT8DoLTkFASs
 1DXcQmNlcYTVI/99exeIrpNVWSm+C/g==
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 kernel@pengutronix.de
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

A driver with a remove callback that just returns 0 behaves identically
to a driver with no remove callback at all. So simplify accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/codecs/wm8731.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index dcee7b2bd3d7..86b1f6eaa599 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -713,18 +713,12 @@ static int wm8731_spi_probe(struct spi_device *spi)
 	return 0;
 }
 
-static int wm8731_spi_remove(struct spi_device *spi)
-{
-	return 0;
-}
-
 static struct spi_driver wm8731_spi_driver = {
 	.driver = {
 		.name	= "wm8731",
 		.of_match_table = wm8731_of_match,
 	},
 	.probe		= wm8731_spi_probe,
-	.remove		= wm8731_spi_remove,
 };
 #endif /* CONFIG_SPI_MASTER */
 
-- 
2.30.2

