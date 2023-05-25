Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F064971183C
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 22:38:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FFB31E7;
	Thu, 25 May 2023 22:37:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FFB31E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685047100;
	bh=XFldES2aPMwZZSw7UdtRfyJxjA5nYzer9ZVAMlZDwlo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=kKgU4mTd4ZBPpdizgMR+JhAeO8uKxuaNU0mAxP+JcZXlazomtneUb5VCctnxXI3SP
	 /k+f2V/dOKc/HEe21IrC0T07js3LQhBMYKNJ4nZAgqm/7jQd4qBmCV9nG471WJ8gsN
	 MMlcqtQJmYC2XAe/uas6z0GwFR6QUav7PpXgrcpU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3ECB7F8016A; Thu, 25 May 2023 22:37:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 819BDF8016A;
	Thu, 25 May 2023 22:37:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D49C4F80249; Thu, 25 May 2023 22:37:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99ABBF80053
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 22:37:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99ABBF80053
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1q2HhZ-0005wd-86; Thu, 25 May 2023 22:36:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q2HhS-002nnC-NR; Thu, 25 May 2023 22:36:42 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1q2HhS-007xX3-1m; Thu, 25 May 2023 22:36:42 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Lucas Tanure <tanureal@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Wolfram Sang <wsa@kernel.org>,
	=?utf-8?q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Peter Senna Tschudin <peter.senna@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Corey Minyard <cminyard@mvista.com>,
	linuxppc-dev@lists.ozlabs.org,
	alsa-devel@alsa-project.org,
	kernel@pengutronix.de,
	patches@opensource.cirrus.com
Subject: [PATCH] sound: Switch i2c drivers back to use .probe()
Date: Thu, 25 May 2023 22:36:40 +0200
Message-Id: <20230525203640.677826-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2359;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=XFldES2aPMwZZSw7UdtRfyJxjA5nYzer9ZVAMlZDwlo=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkb8bWfkjQ/JugH4K3qwzdQT+0sIkKIUX1sVLv4
 PCm7XWM5HiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZG/G1gAKCRCPgPtYfRL+
 ThbxB/9kjwfTH5ux2APCpTMvB6ywkqXnkK/4PjlUX105jgWLthKoXF67qaJw1VdjeLrK3wibmSy
 0hS/fU/6LogdKr+CMQrcRTBQg/npOJ97yETh5+ost6naqaJhl3Aa8+NEWEyU03MEmx3aC+TW+4/
 7bDzOa6RDaWCDl5seImwUsrPOLdDXN6z9td6XeeoXqmi5M3SJ8eYU/g6YEL2A0ibM/bq34s5aGD
 gjgjQPSLrwPnHgsRKiKMXwj0spyFeVaoKpVGX1wquWWcj0KDYnhPWHrEGHI5h4N6IlSD18Z6nIY
 bYdTkZfOOVv2+OZnIeAIDxUYLis7AYydX5Kh0Qpimn+QbyJ+
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: J2ZTQAWVLFQ2Y2XVNXFZZWSTFUAAQO5K
X-Message-ID-Hash: J2ZTQAWVLFQ2Y2XVNXFZZWSTFUAAQO5K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J2ZTQAWVLFQ2Y2XVNXFZZWSTFUAAQO5K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
back to (the new) .probe() to be able to eventually drop .probe_new() from
struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/aoa/codecs/onyx.c         | 2 +-
 sound/aoa/codecs/tas.c          | 2 +-
 sound/pci/hda/cs35l41_hda_i2c.c | 2 +-
 sound/ppc/keywest.c             | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/aoa/codecs/onyx.c b/sound/aoa/codecs/onyx.c
index 4c75381f5ab8..a8a59d71dcec 100644
--- a/sound/aoa/codecs/onyx.c
+++ b/sound/aoa/codecs/onyx.c
@@ -1048,7 +1048,7 @@ static struct i2c_driver onyx_driver = {
 	.driver = {
 		.name = "aoa_codec_onyx",
 	},
-	.probe_new = onyx_i2c_probe,
+	.probe = onyx_i2c_probe,
 	.remove = onyx_i2c_remove,
 	.id_table = onyx_i2c_id,
 };
diff --git a/sound/aoa/codecs/tas.c b/sound/aoa/codecs/tas.c
index f906e9aaddcf..ab1472390061 100644
--- a/sound/aoa/codecs/tas.c
+++ b/sound/aoa/codecs/tas.c
@@ -936,7 +936,7 @@ static struct i2c_driver tas_driver = {
 	.driver = {
 		.name = "aoa_codec_tas",
 	},
-	.probe_new = tas_i2c_probe,
+	.probe = tas_i2c_probe,
 	.remove = tas_i2c_remove,
 	.id_table = tas_i2c_id,
 };
diff --git a/sound/pci/hda/cs35l41_hda_i2c.c b/sound/pci/hda/cs35l41_hda_i2c.c
index 7826b1a12d7d..b44536fbba17 100644
--- a/sound/pci/hda/cs35l41_hda_i2c.c
+++ b/sound/pci/hda/cs35l41_hda_i2c.c
@@ -58,7 +58,7 @@ static struct i2c_driver cs35l41_i2c_driver = {
 		.pm		= &cs35l41_hda_pm_ops,
 	},
 	.id_table	= cs35l41_hda_i2c_id,
-	.probe_new	= cs35l41_hda_i2c_probe,
+	.probe		= cs35l41_hda_i2c_probe,
 	.remove		= cs35l41_hda_i2c_remove,
 };
 module_i2c_driver(cs35l41_i2c_driver);
diff --git a/sound/ppc/keywest.c b/sound/ppc/keywest.c
index 0c4f43963c75..dfc1fc9b701d 100644
--- a/sound/ppc/keywest.c
+++ b/sound/ppc/keywest.c
@@ -90,7 +90,7 @@ static struct i2c_driver keywest_driver = {
 	.driver = {
 		.name = "PMac Keywest Audio",
 	},
-	.probe_new = keywest_probe,
+	.probe = keywest_probe,
 	.remove = keywest_remove,
 	.id_table = keywest_i2c_id,
 };

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2

