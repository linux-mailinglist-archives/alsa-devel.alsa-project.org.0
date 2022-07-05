Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DF1566337
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 08:37:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58B18826;
	Tue,  5 Jul 2022 08:36:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58B18826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657003059;
	bh=sbhe3NvuJsArAoK8rWveLaWzifBbNoYpMnw4ORL2u+I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g9zFSCKFriUWqu5DeMJMbrC8O+OsKt6Jjof20K6f+EVElUPaAhT1wYrFdoG7ww2KZ
	 YbFe4qX/vL1iFhMHvq7uXPtgaAdL0vAkTTM67vky7SR1U4VRj+wIr+/Yu9zyMuDpmH
	 U9Ha9GvPw92YK56br9zZCXoRT5r1hK8b0A6ZHelg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AB7EF80212;
	Tue,  5 Jul 2022 08:36:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5F39F8015B; Tue,  5 Jul 2022 08:36:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFF9BF80104
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 08:36:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFF9BF80104
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1o8cAW-000793-Dv; Tue, 05 Jul 2022 08:36:20 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o8cAQ-004Vzk-TZ; Tue, 05 Jul 2022 08:36:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o8cAT-00366O-B1; Tue, 05 Jul 2022 08:36:17 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: rsnd: Emit useful error messages in .remove()
Date: Tue,  5 Jul 2022 08:36:13 +0200
Message-Id: <20220705063613.93770-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1710; h=from:subject;
 bh=sbhe3NvuJsArAoK8rWveLaWzifBbNoYpMnw4ORL2u+I=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiw9vXbyJ1PvEXQ5BSSD5pYAu6vI3eE6s/mxlCq87x
 JzXRjGiJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYsPb1wAKCRDB/BR4rcrsCbKbCA
 CfbNdCiLyEMtq3UgYcr7LfvPaO20Os4lJXxe38xB7XgBg1uM+WBK8PpjeMg0OuWV6LhT+iRvjfdmGK
 6QalQXCiXp1FB7IuU1z8A7QCrfwGqmgnqtSxByDzLXIq9wS0w9J/JRCq0adlgE3TrAsBJ1/29UI/xr
 5gA28Bcwq7sgWjeugtn/jPeMQkGyWpqeefwK14CgVwvedvutezg0VilPZzdDpxZ32vQ1jbsdAMMH/b
 TZn7X5T+QxgKWyi2dqtkEeHp0IZjS3C1n00FYWhxC7V3i+ighW7RGFlpYimDMoefOmX7VbiNHzIGBE
 xhhG4SGkZKWRliS6lFLMKJBKVP0JmO
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel@pengutronix.de,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

If more than one call of rsnd_dai_call(remove, ...) fails the platform
remove callback returns all values orred together which then makes the
driver core emit a generic error message which is little helpful.

Instead emit details of which call failed exactly and return 0. Note
returning 0 instead of an error code doesn't make a difference in the
driver core apart from the error message.

This is a preparation for making platform remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/sh/rcar/core.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index eb762ab94d3e..01225344001a 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1968,19 +1968,26 @@ static int rsnd_remove(struct platform_device *pdev)
 		rsnd_cmd_remove,
 		rsnd_adg_remove,
 	};
-	int ret = 0, i;
+	int i;
 
 	pm_runtime_disable(&pdev->dev);
 
 	for_each_rsnd_dai(rdai, priv, i) {
-		ret |= rsnd_dai_call(remove, &rdai->playback, priv);
-		ret |= rsnd_dai_call(remove, &rdai->capture, priv);
+		int ret;
+
+		ret = rsnd_dai_call(remove, &rdai->playback, priv);
+		if (ret)
+			dev_warn(&pdev->dev, "Failed to remove playback dai #%d\n", i);
+
+		ret = rsnd_dai_call(remove, &rdai->capture, priv);
+		if (ret)
+			dev_warn(&pdev->dev, "Failed to remove capture dai #%d\n", i);
 	}
 
 	for (i = 0; i < ARRAY_SIZE(remove_func); i++)
 		remove_func[i](priv);
 
-	return ret;
+	return 0;
 }
 
 static int __maybe_unused rsnd_suspend(struct device *dev)

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1

