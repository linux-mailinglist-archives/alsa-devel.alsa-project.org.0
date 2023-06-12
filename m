Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1888D72B870
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 09:10:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62D626C1;
	Mon, 12 Jun 2023 09:09:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62D626C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686553819;
	bh=uG+Rz5OykdyyUm2fBqQxDeg/Pr8LncchsyBz2TQ6teA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lkx/6MoLFurVI0GTTc/iSqEZKX16tRJaVd1oZeJc+vY7hVWZGockuaYUklFmkKuLN
	 O7msLLf+VZLWSXTtB0kMWT1vJiCOnS0HbW5OrlluuIyocS95TOPdx+fIsciruNQlnv
	 Gb31J584tk96KK04CiRAeaMQ0rXUR95ErcZisFK8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7D4CF80301; Mon, 12 Jun 2023 09:09:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EC8BF80132;
	Mon, 12 Jun 2023 09:09:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 291C8F80149; Mon, 12 Jun 2023 09:06:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11619F800BA
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 09:06:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11619F800BA
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q8bd3-0008Cc-Sx; Mon, 12 Jun 2023 09:06:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q8bd0-006pe7-Rm; Mon, 12 Jun 2023 09:06:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q8bd0-00DQ8O-1m; Mon, 12 Jun 2023 09:06:14 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Lucas Tanure <tanureal@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	kernel@pengutronix.de
Subject: [PATCH] ASoC: Switch two more i2c drivers back to use .probe()
Date: Mon, 12 Jun 2023 09:06:08 +0200
Message-Id: <20230612070608.836186-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1701;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=uG+Rz5OykdyyUm2fBqQxDeg/Pr8LncchsyBz2TQ6teA=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkhsPfL2jWX5FRHLgh7JhU0BLkefn/hDF+gUm7a
 8lw9ltmJeOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZIbD3wAKCRCPgPtYfRL+
 Tvr8B/9Kum/LjyUZDHX21e4Mx3AlVnDAcUOtawcwqx0pWdV6YHVCvn+T0dBSg6SIKeHyU5eDgpb
 2M7slC6XvNDc+Xn0v5NXntSCLTnlARsymEPkBUFyCjhB/2uU9hCQXOxjaxrX4FI5TMJdxb+7Bfv
 kztnCNXb8YGiKD8EwW05VZgCYfbcas6IkUEM0c8Ka4hG6hs+QrqcjgH2r7eyt/5d++nH8Mzzo50
 +3IgUifQu9M8V56X5ci0Mkae/i7tW/5LmgKQo5+KWe5CcMv44jA1gID2KBZHbYf34+z2K6JPm/t
 /QpRj9OCtwAscarqAG/nFd07Wp6ubtdRHqo44vJlGAnqZlzk
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: MPQIMXOVIO6E6CBK6AIPWVMZEJHWFON5
X-Message-ID-Hash: MPQIMXOVIO6E6CBK6AIPWVMZEJHWFON5
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MPQIMXOVIO6E6CBK6AIPWVMZEJHWFON5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The previous conversion back to .probe() applied in commit 9abcd24002bf
("ASoC: Switch i2c drivers back to use .probe()") was created based on
v6.3. Since then two more drivers were added which need to be convert
back in the same way before eventually .probe_new() can be dropped from
struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

cs35l56 was already in v6.4-rc1, ssm3515 is only in next. This patch is
based on 4ac690bbae02 ("ASoC: ssm3515: Add new amp driver") which is the
oldest commit in next that has both drivers.

Best regards
Uwe

 sound/soc/codecs/cs35l56-i2c.c | 2 +-
 sound/soc/codecs/ssm3515.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-i2c.c b/sound/soc/codecs/cs35l56-i2c.c
index 295caad26224..ed2a41943d97 100644
--- a/sound/soc/codecs/cs35l56-i2c.c
+++ b/sound/soc/codecs/cs35l56-i2c.c
@@ -68,7 +68,7 @@ static struct i2c_driver cs35l56_i2c_driver = {
 		.pm = &cs35l56_pm_ops_i2c_spi,
 	},
 	.id_table	= cs35l56_id_i2c,
-	.probe_new	= cs35l56_i2c_probe,
+	.probe		= cs35l56_i2c_probe,
 	.remove		= cs35l56_i2c_remove,
 };
 
diff --git a/sound/soc/codecs/ssm3515.c b/sound/soc/codecs/ssm3515.c
index 784e890031a4..008cb3eb5758 100644
--- a/sound/soc/codecs/ssm3515.c
+++ b/sound/soc/codecs/ssm3515.c
@@ -439,7 +439,7 @@ static struct i2c_driver ssm3515_i2c_driver = {
 		.name = "ssm3515",
 		.of_match_table = of_match_ptr(ssm3515_of_match),
 	},
-	.probe_new = ssm3515_i2c_probe,
+	.probe = ssm3515_i2c_probe,
 };
 module_i2c_driver(ssm3515_i2c_driver);
 

base-commit: 4ac690bbae02e26e36e133becd86babb657126ef
-- 
2.39.2

