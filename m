Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 803E96BB7C0
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:28:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F04851338;
	Wed, 15 Mar 2023 16:27:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F04851338
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894106;
	bh=9d6Wlk1f8zwDxEdM+dxWCYeIg6HO2iJkBJm4phRhmvM=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VacYz9UX6fk1U/tOHlCK2dQl0h4IDFatH6KYhkatMBlzLzmA5Tj1GsAFHGSc1v/Jc
	 ngns5KDDGTIX1THtoIbZdavx4rDPB7T21mURXfi+tQUO2D9S4EeGXnF0AFxDpg7Ehq
	 iiFtoOcQ5fDg3kt/8bgXkHEPBunUXNm+0od4ShPA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97E51F8057A;
	Wed, 15 Mar 2023 16:12:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD7F8F805C1; Wed, 15 Mar 2023 16:09:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68F8BF805C5
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68F8BF805C5
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjf-0007oG-KP; Wed, 15 Mar 2023 16:08:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjd-004KZE-HQ; Wed, 15 Mar 2023 16:08:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjc-0057gW-Ob; Wed, 15 Mar 2023 16:08:12 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 073/173] ASoC: fsl: fsl_spdif: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:05 +0100
Message-Id: <20230315150745.67084-74-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1472;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=9d6Wlk1f8zwDxEdM+dxWCYeIg6HO2iJkBJm4phRhmvM=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd4J4ZqwpeC374d3hlHRtireZgy2tHURmUov+
 Bt3eqEH/ZOJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeCQAKCRDB/BR4rcrs
 Ca7wB/9FePM5BfmGcKb8OLEr69V1N4BoOYLTRKRW7M8qLq7dmoCTXOeC0ZUwxU3mgkyV4qBlmZk
 FrGUk9MJTkK0xS1yj1FqhFuYRAZVWOUJZGzNhqMbchIuYMzPcGhLOvtWbuw+ogs+xaF36k8ggOq
 qtMMhtPRVuJDwDuWgyLNbXfGrSMllZUu2vdaDijhREnz2rmxxwKDNz8L+mL+C9Yx7uf587UNLYa
 N+8hIp+w//O2PXBn0tD9XAPzR1hNHp2YUkHkUoRDwU8nygcEfaM2OZT4Gp67yCFwKMO3kRzDGfx
 KwNAZiUPZ+Pik8xnMBcIwHxEYKN6LOHSC3toS/qd60XglNuu
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 4LZX2LAYJ7A346EAVF2X2IB2N4THINVL
X-Message-ID-Hash: 4LZX2LAYJ7A346EAVF2X2IB2N4THINVL
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4LZX2LAYJ7A346EAVF2X2IB2N4THINVL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/fsl/fsl_spdif.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 275aba8e0c46..015c3708aa04 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -1659,11 +1659,9 @@ static int fsl_spdif_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int fsl_spdif_remove(struct platform_device *pdev)
+static void fsl_spdif_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM
@@ -1765,7 +1763,7 @@ static struct platform_driver fsl_spdif_driver = {
 		.pm = &fsl_spdif_pm,
 	},
 	.probe = fsl_spdif_probe,
-	.remove = fsl_spdif_remove,
+	.remove_new = fsl_spdif_remove,
 };
 
 module_platform_driver(fsl_spdif_driver);
-- 
2.39.2

