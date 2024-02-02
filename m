Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CF38477D8
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Feb 2024 19:41:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3ED783B;
	Fri,  2 Feb 2024 19:40:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3ED783B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706899269;
	bh=MAtB2ChwFF1exhEfUKrF79D5jxW1fp8BGXZSzKt5ZVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mkRCSFXZYbqLxOmFxnvDx6F1Kpu/TSJJV/EcGnzor1K1gQcymyWAPnpqV13lIWPXj
	 jv7rvUqAt7XlDUjcppPW28hv8urwo1PP/v9xcKpA7BN0Z7eO8eS+ppoT15fr6CSjkU
	 FOjzSE2G7myR3sjkRpsxfrhHkU1rQ4AKi07ONagg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98C8CF80567; Fri,  2 Feb 2024 19:40:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFC15F805AC;
	Fri,  2 Feb 2024 19:40:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1325FF80563; Fri,  2 Feb 2024 19:40:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5D8AF8055B
	for <alsa-devel@alsa-project.org>; Fri,  2 Feb 2024 19:40:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5D8AF8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EhX0SRoZ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 20CC06259A;
	Fri,  2 Feb 2024 18:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4834C433F1;
	Fri,  2 Feb 2024 18:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706899240;
	bh=MAtB2ChwFF1exhEfUKrF79D5jxW1fp8BGXZSzKt5ZVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EhX0SRoZrAEPk9SP6uEk2AtaIuXHtQ5r6POkIp57CPHzxwigN4VraEnhaodTIespw
	 RRsN1F9kk0/obwmkwQQuu46fR7fbm2yGFBLdFlOPBnBFL5OxUd9SXdHqavjI9L9EPf
	 DmSsrU3VFgjDDXrpYQIOM5qKTV5TJkmfGLrGOdXuAROBTmbgcWhf68fiyifYaEtnlf
	 YRSP6tRTnU2kruNwgDp2iEjx2fqKQ5rpt6KiNHhnGDCVFiEES8gvQrjDcVvuFs0cXy
	 oirZOQ38spCtEA1ewAJuARG41ITGgXHaMeDNb2o/RGKmJigon8oXHZmIriWZzdiLsQ
	 9Qb0Lc25iloAQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	james.schulman@cirrus.com,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-spi@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 16/21] spi: cs42l43: Handle error from
 devm_pm_runtime_enable
Date: Fri,  2 Feb 2024 13:40:03 -0500
Message-ID: <20240202184015.540966-16-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202184015.540966-1-sashal@kernel.org>
References: <20240202184015.540966-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.15
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P7P57YO4D7XO4B24NIXPPDQRKCDWXV6L
X-Message-ID-Hash: P7P57YO4D7XO4B24NIXPPDQRKCDWXV6L
X-MailFrom: sashal@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P7P57YO4D7XO4B24NIXPPDQRKCDWXV6L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

[ Upstream commit f9f4b0c6425eb9ffd9bf62b8b8143e786b6ba695 ]

As it devm_pm_runtime_enable can fail due to memory allocations, it is
best to handle the error.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://msgid.link/r/20240124174101.2270249-1-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/spi/spi-cs42l43.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-cs42l43.c b/drivers/spi/spi-cs42l43.c
index d239fc5a49cc..c1556b652909 100644
--- a/drivers/spi/spi-cs42l43.c
+++ b/drivers/spi/spi-cs42l43.c
@@ -244,7 +244,10 @@ static int cs42l43_spi_probe(struct platform_device *pdev)
 	priv->ctlr->use_gpio_descriptors = true;
 	priv->ctlr->auto_runtime_pm = true;
 
-	devm_pm_runtime_enable(priv->dev);
+	ret = devm_pm_runtime_enable(priv->dev);
+	if (ret)
+		return ret;
+
 	pm_runtime_idle(priv->dev);
 
 	regmap_write(priv->regmap, CS42L43_TRAN_CONFIG6, CS42L43_FIFO_SIZE - 1);
-- 
2.43.0

