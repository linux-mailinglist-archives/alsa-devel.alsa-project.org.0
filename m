Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE61E87775D
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Mar 2024 15:40:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1442EDE5;
	Sun, 10 Mar 2024 15:39:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1442EDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710081602;
	bh=tcCJcDqDYZaFzocjDP4wiXd1T+ypqrL+pY4JYmx+XM0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QiBQe1pgvf2kUoV7Jb63Vm6nzuTAJbOC0JpDx9TgWBA7OWQ6xOyAzjGFe/biJEEVo
	 +O9GYVK4xv6NTot+Af26Hto+FB8JQD4ZWnqNJHlALuvjFR+Qhi9OgWWjVBi0QUhvDl
	 aK+kBwA4pon70mf43UfYToieQqVv4YHp6ut3wj7M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D69AF805A1; Sun, 10 Mar 2024 15:39:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91E4CF8028D;
	Sun, 10 Mar 2024 15:39:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B4CAF8028D; Sun, 10 Mar 2024 15:39:21 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F969F80088
	for <alsa-devel@alsa-project.org>; Sun, 10 Mar 2024 15:39:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F969F80088
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rjKKN-0001Cv-0y; Sun, 10 Mar 2024 15:39:03 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rjKKK-005XJm-VP; Sun, 10 Mar 2024 15:39:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rjKKK-003TZj-2p;
	Sun, 10 Mar 2024 15:39:00 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	kernel@pengutronix.de
Subject: [PATCH] ASoC: tlv320adc3xxx: Don't strip remove function when driver
 is builtin
Date: Sun, 10 Mar 2024 15:38:51 +0100
Message-ID: <20240310143852.397212-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=tcCJcDqDYZaFzocjDP4wiXd1T+ypqrL+pY4JYmx+XM0=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBl7cX8VWtYhL0KtuOOqhLGjI6fvbv4I6W1Z4U92
 ZFLuAirQBiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZe3F/AAKCRCPgPtYfRL+
 TvreCACBY53KQpaQ1S6h0Znmi9qhSZ9KGdIbyorjr/T8fAbh7lRp4Yt5ksFJlyqorX1/CRtMZ/+
 f/IwumkOihqjbZZvEkm2RiaRJWh7zsaP1F3og52SGJw6r1LGdBGRvB5llSETqFB5Xv96GJlqCpc
 lu4yP20GOhukwEnAGWKh7zbRH0i8L/0UTI9sPvtgkJ5OeULSH0gYxF5Ji9jrGHRsUJ079s2frcY
 SoiZYns8FibUBnlCfNRj3aj+9BKf/K0Ku6C9BSjaz3T+FGQXOcJqVNWtXKzyrxJN/u+JdDthkPu
 gHEmE7wfmdR68YKkD+3eSiXm2VkUNQPK4IWzLbZ8gwKH9rq2
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: T3QAY3HB3VM3LSQM4WR7CBLSQ6UYIY4M
X-Message-ID-Hash: T3QAY3HB3VM3LSQM4WR7CBLSQ6UYIY4M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T3QAY3HB3VM3LSQM4WR7CBLSQ6UYIY4M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Using __exit for the remove function results in the remove callback
being discarded with SND_SOC_TLV320ADC3XXX=y. When such a device gets
unbound (e.g. using sysfs or hotplug), the driver is just removed
without the cleanup being performed. This results in resource leaks. Fix
it by compiling in the remove callback unconditionally.

This also fixes a W=1 modpost warning:

	WARNING: modpost: sound/soc/codecs/snd-soc-tlv320adc3xxx: section mismatch in reference: adc3xxx_i2c_driver+0x10 (section: .data) -> adc3xxx_i2c_remove (section: .exit.text)

(which only happens with SND_SOC_TLV320ADC3XXX=m).

Fixes: e9a3b57efd28 ("ASoC: codec: tlv320adc3xxx: New codec driver")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

note that this patch only applies as is after commit 4e8ff3587868 ("ASoC:
codecs: tlv320adc3xxx: Wrap adc3xxx_i2c_remove() in __exit_p()") which was the
wrong approach to fix the build error.

Best regards
Uwe

 sound/soc/codecs/tlv320adc3xxx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
index 420bbf588efe..e100cc9f5c19 100644
--- a/sound/soc/codecs/tlv320adc3xxx.c
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -1429,7 +1429,7 @@ static int adc3xxx_i2c_probe(struct i2c_client *i2c)
 	return ret;
 }
 
-static void __exit adc3xxx_i2c_remove(struct i2c_client *client)
+static void adc3xxx_i2c_remove(struct i2c_client *client)
 {
 	struct adc3xxx *adc3xxx = i2c_get_clientdata(client);
 
@@ -1452,7 +1452,7 @@ static struct i2c_driver adc3xxx_i2c_driver = {
 		   .of_match_table = tlv320adc3xxx_of_match,
 		  },
 	.probe = adc3xxx_i2c_probe,
-	.remove = __exit_p(adc3xxx_i2c_remove),
+	.remove = adc3xxx_i2c_remove,
 	.id_table = adc3xxx_i2c_id,
 };
 

base-commit: 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
-- 
2.43.0

