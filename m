Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBA9682645
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 09:22:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C261CDF3;
	Tue, 31 Jan 2023 09:21:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C261CDF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675153363;
	bh=yFQ1qG0jsHqm+BUmxpFhla3Gby6Zs7EEkbLzeChKoEQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=GLeEzdnBxg6oYwdQDpvTKYC8dMpywnmqP2Vm5BgEFyIO3iLqTEl5GpNJW7MkpQ49D
	 KjmVVIdEXcRKSOPEsJYNRcrCkSJQV5/rOS10zcSbZmg6Iatcun2J4jAnfx6MZcnoXN
	 k8cGo511mjR6/nB4cWLpnby/McCb4jvQL5DR8iMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDC03F804DF;
	Tue, 31 Jan 2023 09:21:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2625AF804C2; Tue, 31 Jan 2023 09:21:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3AD5F80169
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 09:21:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3AD5F80169
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1pMltM-0007oW-3v; Tue, 31 Jan 2023 09:21:24 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pMltM-001eGQ-2U; Tue, 31 Jan 2023 09:21:23 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1pMltK-00HHJH-1Y; Tue, 31 Jan 2023 09:21:22 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: sma1303: Convert to i2c's .probe_new()
Date: Tue, 31 Jan 2023 09:21:07 +0100
Message-Id: <20230131082107.174739-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1589;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=yFQ1qG0jsHqm+BUmxpFhla3Gby6Zs7EEkbLzeChKoEQ=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj2M9vRn4DB7ysoONzHdytsuBjbeh1Znx1FjVLUusJ
 MtJfvPeJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY9jPbwAKCRDB/BR4rcrsCdEnCA
 CLIr5eij7+AXJA2NME28CnR2uDVyIEkknNBtrG3ORLK6H8hzS6acapJLDIHWRBg+UDdoDOnkWqkmLO
 yD+NUP3bW8/uelqYoIiOKqocY00kr+1i06DukLD5EmCCcohvQARYTtAgpZpYnzTVpFILXb2WNF22VF
 oIDYbNeWkrguvNBSjx4BndJMbHK/4aIzSgyZPQrrzv/9qOdFH5KRGAqRQPTaRqcjNRRbM14EyAeDo6
 GdeCEj2iYMr3Py1Y9ckmeeGiICn+WB4As2HfBPdMgZNp5SH2vIlLfBgw9BhMhP0hvBechl9/vxWpCe
 BrqYmf9Wupm6odfS6bprqUtpWdzeCs
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
Cc: Wolfram Sang <wsa@kernel.org>, alsa-devel@alsa-project.org,
 kernel@pengutronix.de, Colin Ian King <colin.i.king@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The probe function doesn't make use of the i2c_device_id * parameter so it
can be trivially converted.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

there is an ongoing effort to convert all drivers to .probe_new to
eventually drop .probe with the i2c_device_id parameter. This driver
currently sits in next so wasn't on my radar before.

My plan is to tackle that after the next merge window. So I ask you to
either apply this patch during the next merge window or accept that it
will go in via the i2c tree together with the patch that drops .probe().

Best regards
Uwe

 sound/soc/codecs/sma1303.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index 3d8e3900f5c3..fbedba574ff4 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -1597,8 +1597,7 @@ static struct attribute_group sma1303_attr_group = {
 	.attrs = sma1303_attr,
 };
 
-static int sma1303_i2c_probe(struct i2c_client *client,
-				const struct i2c_device_id *id)
+static int sma1303_i2c_probe(struct i2c_client *client)
 {
 	struct sma1303_priv *sma1303;
 	struct device_node *np = client->dev.of_node;
@@ -1791,7 +1790,7 @@ static struct i2c_driver sma1303_i2c_driver = {
 		.name = "sma1303",
 		.of_match_table = sma1303_of_match,
 	},
-	.probe = sma1303_i2c_probe,
+	.probe_new = sma1303_i2c_probe,
 	.remove = sma1303_i2c_remove,
 	.id_table = sma1303_i2c_id,
 };

base-commit: 5b28c049ff53cf49e3a97d80cebd2e9c2779ea96
-- 
2.39.0

