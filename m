Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A86A753DC9C
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jun 2022 17:40:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43C6618F1;
	Sun,  5 Jun 2022 17:39:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43C6618F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654443642;
	bh=6hY9gRpUjWKHjJ/A9SAH4/Bd42zGqX34ZSYebkngAI8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KZA0KwJBy8IL9vAAv/8f5UqQA3J23VnK0BtHAbNUGSHM1vv9RJ9Reb6WJs/sPPlK8
	 CEi9nNU8BxpGL+aBNK3H7yx8bAUt5LI2Lo6kmwSIS50rz/Fm24LmeipAUc9ZjbS9uX
	 yqU+qyHk1aoZDm/1LrlDUThs2RoWXlYdovBCf30w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6137F8016C;
	Sun,  5 Jun 2022 17:39:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E346EF800D3; Sun,  5 Jun 2022 17:39:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E547AF800D3
 for <alsa-devel@alsa-project.org>; Sun,  5 Jun 2022 17:39:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E547AF800D3
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nxsLX-0002W8-2B; Sun, 05 Jun 2022 17:39:19 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nxsLU-006dEJ-Rs; Sun, 05 Jun 2022 17:39:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nxsLS-00ENhP-QT; Sun, 05 Jun 2022 17:39:14 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Intel: broadwell: Make broadwell_disable_jack() return
 void
Date: Sun,  5 Jun 2022 17:39:04 +0200
Message-Id: <20220605153904.26921-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610; h=from:subject;
 bh=6hY9gRpUjWKHjJ/A9SAH4/Bd42zGqX34ZSYebkngAI8=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBinM4UbzQW+etNJg8KpfPRlXzGqaPA1oekDxVlFzD7
 M8BisUCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYpzOFAAKCRDB/BR4rcrsCViuB/
 44oUvYgrHLE9DeGxy4x9n/AeY3uGa5iCy+rjh6KqySScePqP5akcATWXF9RJ5/ju1khF399mqthQux
 LSgvf/L+uvTn9glTKNEn6DH43aCnVglEhdHm5Hb1dgY0q8mP9Zqj7bWzAWr8WFogEStadOSgAy34+n
 IuMBLjpKBzI1GtKVS8hJruMQ0vrNjwjv86QbIdNgNYrTui4viudhpv2c+fsiC7jXaBhSlg+f19m/o6
 yoTX/EhRBVgdG4L5BAP8fNZqPIWO6n4DV3yIsdm4CukIuexxrY75CnuUO6VvtpkHAU3rc5GdzhAYq5
 zqFB8wUyqQ3oYgax0jZueSZDp0D8XH
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
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

broadwell_disable_jack() returns zero unconditionally. Letting it
return void instead makes it easier to see in the callers that there is no
error to handle.

This is a preparation for making platform remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/intel/boards/broadwell.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/broadwell.c b/sound/soc/intel/boards/broadwell.c
index d37c74fd1a3c..280e84bbe185 100644
--- a/sound/soc/intel/boards/broadwell.c
+++ b/sound/soc/intel/boards/broadwell.c
@@ -227,7 +227,7 @@ static struct snd_soc_dai_link broadwell_rt286_dais[] = {
 	},
 };
 
-static int broadwell_disable_jack(struct snd_soc_card *card)
+static void broadwell_disable_jack(struct snd_soc_card *card)
 {
 	struct snd_soc_component *component;
 
@@ -239,13 +239,13 @@ static int broadwell_disable_jack(struct snd_soc_card *card)
 			break;
 		}
 	}
-
-	return 0;
 }
 
 static int broadwell_suspend(struct snd_soc_card *card)
 {
-	return broadwell_disable_jack(card);
+	broadwell_disable_jack(card);
+
+	return 0;
 }
 
 static int broadwell_resume(struct snd_soc_card *card){
@@ -315,7 +315,9 @@ static int broadwell_audio_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 
-	return broadwell_disable_jack(card);
+	broadwell_disable_jack(card);
+
+	return 0;
 }
 
 static struct platform_driver broadwell_audio = {

base-commit: 4b0986a3613c92f4ec1bdc7f60ec66fea135991f
-- 
2.36.1

