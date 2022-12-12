Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FC964A8F3
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 21:57:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7466220D;
	Mon, 12 Dec 2022 21:57:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7466220D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670878670;
	bh=C3Y31NJgTCvtZWViJNh+aWPdGFBsuWWbE/9Lncw3QLY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ghbXUA4lY0kwedZQM2KJV/Ig16BmoAJR44A8ZDK0MwcM8NhgpRXzoVdPlM6gj/x7E
	 F3oeRyI+1OsjH0DLxZqpq1ysBjc4muXdY3phw50fusw7Tzl2Khvx48oDq/HViDnU3N
	 GuHDpjt6FrJw4oGu9BAqOig7H6jX7PNj8rOj5eMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32B77F80579;
	Mon, 12 Dec 2022 21:54:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4BF3F80141; Mon, 12 Dec 2022 21:54:26 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 15909F80141
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 21:54:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15909F80141
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poT-00016V-Sl; Mon, 12 Dec 2022 21:54:13 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poS-00464H-H7; Mon, 12 Dec 2022 21:54:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1p4poR-004ahm-Vj; Mon, 12 Dec 2022 21:54:11 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 06/15] ASoC: ac97: Drop empty platform remove function
Date: Mon, 12 Dec 2022 21:53:57 +0100
Message-Id: <20221212205406.3771071-7-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
References: <20221212205406.3771071-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=850;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=C3Y31NJgTCvtZWViJNh+aWPdGFBsuWWbE/9Lncw3QLY=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjl5TL9YVtBnSjj1OAVmnBMjyQRj0w003al7umTHAc
 cXOuS5GJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5eUywAKCRDB/BR4rcrsCRaLB/
 97hpnm5E+z3IgCIMZ8GOOwpEUf3yG9GcuI0AXiSlIwvuOzuFfDJivt1K9C+LRmwYr2JqMaOlYso/47
 Bg6iYqDSH+YS/SwTlHbB1VJjfVDjgv4Yfwi7xB1x6bxQqRrNr0MWvwfgPbHostN3gM4SwaKVwromFL
 ZV3zCvHithph/DZ1Pkt/eZlBUSsc/vhO6mW4TgBOf3k8v4OLr7PSZt7fWQELpLqndQlkF0LcXwwmI+
 RpiIQKFOhW/rJxd55Bzy53ly7r31nHwYBb/QsdRZuaCod/rBIfHumpWsa6wtSU83mi7aS9naqOZ4RX
 Zk6Jx5PiTHEWrUmIOwz/nBEUeHONuL
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
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>, kernel@pengutronix.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

A remove callback just returning 0 is equivalent to no remove callback
at all. So drop the useless function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/codecs/ac97.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/codecs/ac97.c b/sound/soc/codecs/ac97.c
index cc12052e1920..0e013edfe63d 100644
--- a/sound/soc/codecs/ac97.c
+++ b/sound/soc/codecs/ac97.c
@@ -127,18 +127,12 @@ static int ac97_probe(struct platform_device *pdev)
 			&soc_component_dev_ac97, &ac97_dai, 1);
 }
 
-static int ac97_remove(struct platform_device *pdev)
-{
-	return 0;
-}
-
 static struct platform_driver ac97_codec_driver = {
 	.driver = {
 		.name = "ac97-codec",
 	},
 
 	.probe = ac97_probe,
-	.remove = ac97_remove,
 };
 
 module_platform_driver(ac97_codec_driver);
-- 
2.38.1

