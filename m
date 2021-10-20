Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C16434BA9
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Oct 2021 14:59:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C70B16E4;
	Wed, 20 Oct 2021 14:58:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C70B16E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634734754;
	bh=mYnVE4n2leb+EcCYf+CAdW38fk+wnL5VE8U7mW7E4Mw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TOTIg9OM9SiPEi7aFcJ23EQ8S9nAL6WiOE7ei8MVzvV1Hhn172fjURLTpdFjjYyLp
	 uOK9OTjnzU6fxtsiZroIjgFr0FONcjWeiwheYmmwtpMQ5/8Ahzp+uMw3rjEsp9zQwl
	 R6OA1pSmVfxaghzl3lAP5eGFkCyJDL2FsT3GS65o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CACFF80253;
	Wed, 20 Oct 2021 14:57:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA69BF80229; Wed, 20 Oct 2021 14:57:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC8D7F80155
 for <alsa-devel@alsa-project.org>; Wed, 20 Oct 2021 14:57:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC8D7F80155
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mdBA5-0001kv-0u; Wed, 20 Oct 2021 14:57:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mdBA0-00061p-Uj; Wed, 20 Oct 2021 14:57:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1mdBA0-0003zg-Tg; Wed, 20 Oct 2021 14:57:36 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoc: wm8900: Drop empty spi_driver remove callback
Date: Wed, 20 Oct 2021 14:57:26 +0200
Message-Id: <20211020125726.22946-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Patch-Hashes: v=1; h=sha256; i=zIi5gRuEiYNJVh/w3qxVSSYbZxuvZ/hJH1fEbheIp3M=;
 m=H2CYebE0C3w0pEIPV6p+i3ENgo2xahs3TAXJZPt6zAw=;
 p=kvg2gPMiQ0bwMaN/9y81alXechA4psrhpYfA1Xzp6uU=;
 g=8358fb004c6da5ca73a8a43ae1b5a1a6dbf3510b
X-Patch-Sig: m=pgp; i=u.kleine-koenig@pengutronix.de;
 s=0x0D2511F322BFAB1C1580266BE2DCDD9132669BD6;
 b=iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFwEjIACgkQwfwUeK3K7AlgZwf/WIm
 diKR3LRYmKvJGo+BheSosxdhlamFeyPclAMgbXBvTHCJ7fQAqOtO4zYXbm1BVXSwgZ2tkjsy3eq/y
 z1afF5euBpwF6kIVXEMRf6nliT5COId95rkrtx6ZJ3Gd7CIpzM6JBgP4v/+xT0MLERm77B1k0Uq8R
 lAWk22qT0VBgstEoa8ry9zl+kYZ6n3vP2gjRLPzfyiECPHLYsEtFseQhImfY9uAUmWElarbVfRG6w
 G4NIGDyePGE6zLSlndbjpnUAaHTEr1+RfNaS6pn8k7ifEKuA79R6HqvbvUmzsuUbGwyeYgdua2TMx
 2QPWfOm09TH6faQYwNDMDIlcv1N9FRA==
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
 sound/soc/codecs/wm8900.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/wm8900.c b/sound/soc/codecs/wm8900.c
index a9a6d766a176..bf3a4415a85f 100644
--- a/sound/soc/codecs/wm8900.c
+++ b/sound/soc/codecs/wm8900.c
@@ -1252,17 +1252,11 @@ static int wm8900_spi_probe(struct spi_device *spi)
 	return ret;
 }
 
-static int wm8900_spi_remove(struct spi_device *spi)
-{
-	return 0;
-}
-
 static struct spi_driver wm8900_spi_driver = {
 	.driver = {
 		.name	= "wm8900",
 	},
 	.probe		= wm8900_spi_probe,
-	.remove		= wm8900_spi_remove,
 };
 #endif /* CONFIG_SPI_MASTER */
 
-- 
2.30.2

