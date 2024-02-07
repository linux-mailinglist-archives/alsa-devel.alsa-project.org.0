Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7E284D16B
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 19:44:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B2B4823;
	Wed,  7 Feb 2024 19:43:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B2B4823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707331449;
	bh=Nj1hfFsyjq6xs8JqMS+euEQwaY/7srUsVpEx0j3EMYE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ef/ZeGV16CvjF2eShIu78ThYuQf20gyGCLfpjqb3ArbfNp7sV84B80mh7xNTGJ3AB
	 opcDqY8tcBjKTMjWVyjVUAy+hv0jBRZKD0XB7VXqW5b7Wsl/5a0q7nbFAtdVoB2Faw
	 AxYBiAx6lSbonIHwoI0kx1D+JUZk3hE6M5oSGEZI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7A7AF801EB; Wed,  7 Feb 2024 19:43:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5125CF80570;
	Wed,  7 Feb 2024 19:43:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E95DF801EB; Wed,  7 Feb 2024 19:43:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42388F8016E
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 19:43:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42388F8016E
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rXmt8-0007UO-6s; Wed, 07 Feb 2024 19:43:14 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rXmt5-0054XY-3P; Wed, 07 Feb 2024 19:43:11 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rXmt5-00HRsY-02;
	Wed, 07 Feb 2024 19:43:11 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: kernel@pengutronix.de,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/32] mtd: dataflash: Follow renaming of SPI "master" to
 "controller"
Date: Wed,  7 Feb 2024 19:40:26 +0100
Message-ID: 
 <38bf50b391c117621e406fa8cd00c4daef78615c.1707324794.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120;
 i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id;
 bh=Nj1hfFsyjq6xs8JqMS+euEQwaY/7srUsVpEx0j3EMYE=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlw86jMqw4ltSTXwLQoh9w6paW5SuiO+i/OQP4/
 aOSlb/Cxo6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcPOowAKCRCPgPtYfRL+
 TjrnCACykE5iNjuwUOalnLCibPbZzFNctipOmpqjUPC8qgwgD5BYLPLFNHhOX5G0Isz2+UbaG89
 0AU2cfpxvSwpkFvt8Y0OkUYwClhioF+9d6lQ/qBoGXQ3VXQBlAB/L99vvk764QKk0dknR3ctVZn
 kNJi7XbxtiY8SWFYhs7xh/XQnKlb8spVTPs2P5XBok7m7S0FWuSVpQY8CWAvyucGjpEtSPYcxBc
 JE8tsv9mFFU3DGEPsy7l/9ZHo6yEjrinlOIpsESpd20SgfTKJ/8CuY28zfK58vmSCYy14oHgDGW
 jyuow/xCdY+iCtvbqNdMja+reRkwAfXFAxP8uaONYkVN5Ymt
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: ERLLNN7FO7LL3BPQMDJC76AEXHGOIGNW
X-Message-ID-Hash: ERLLNN7FO7LL3BPQMDJC76AEXHGOIGNW
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ERLLNN7FO7LL3BPQMDJC76AEXHGOIGNW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In commit 8caab75fd2c2 ("spi: Generalize SPI "master" to "controller"")
some functions and struct members were renamed. To not break all drivers
compatibility macros were provided.

To be able to remove these compatibility macros push the renaming into
this driver.

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mtd/devices/mtd_dataflash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 0c1b93303618..ec52277e3dd5 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -638,7 +638,7 @@ static int add_dataflash_otp(struct spi_device *spi, char *name, int nr_pages,
 
 	/* name must be usable with cmdlinepart */
 	sprintf(priv->name, "spi%d.%d-%s",
-			spi->master->bus_num, spi_get_chipselect(spi, 0),
+			spi->controller->bus_num, spi_get_chipselect(spi, 0),
 			name);
 
 	device = &priv->mtd;
-- 
2.43.0

