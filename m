Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 949236BB8A4
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:54:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B708155E;
	Wed, 15 Mar 2023 16:53:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B708155E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895654;
	bh=sk1qEXx9hxufZWcKJoi2K7B+q2dhAbe5HE7FKeg27oY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GGlWy4m5nT/SmPxiZ01gJuQIorG5HjkeHKVU5lyKpYRAEkRRl2qpWYEHmdX9h2909
	 W5reVmVVzUumc6naGipSyUc0qkDC5+pM36gqMMocUhK8UFZltS/ICQwmKFTNaP1vNz
	 fJmpl7QS+cOoxrbCUAszyyzCSeCc296yOu2JPmuk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1711F805FC;
	Wed, 15 Mar 2023 16:17:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8587EF80623; Wed, 15 Mar 2023 16:11:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 380B0F8057E
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:09:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 380B0F8057E
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjj-00085u-QN; Wed, 15 Mar 2023 16:08:19 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjg-004KaK-UJ; Wed, 15 Mar 2023 16:08:16 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjf-0057hR-Vx; Wed, 15 Mar 2023 16:08:16 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 087/173] ASoC: img: img-i2s-out: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:19 +0100
Message-Id: <20230315150745.67084-88-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1614;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=sk1qEXx9hxufZWcKJoi2K7B+q2dhAbe5HE7FKeg27oY=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd4x+r81vz2NWpCoMLQLtqDV0mIFceAwPcpRO
 c4fMWkUg5+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeMQAKCRDB/BR4rcrs
 CewlB/4pLq94+tOFLPu1XYpKenw9KCZQELbsip0gVSW0sxXUopaZxZQ1WSL0vitoyYfh1nkqoe6
 bc5LSZ1Q/oQYSgyO++TAODhMMVDs+Vw/tIHnsp6P1laOdvItLMRnpCtTRzlgP+fGHD4IdEFIml6
 IVc+HFcQ52LWtAvSjMYBsZX4gtAC6Shr/YLF0Msn70/HvI8WK2Yl9B5YHvZq8LOyFns7RBxnV+S
 7jQGmgjVfoTkpoi3DyUbZYHBdh1Z+Xy/qR/weDtipW2fJiSh7zSRRA22CgzRNLeTJdltSWi2VWY
 k1UPy3X37m8ztXlQDHA+P6pcw9FdVPMfoeRSCD9deAxsvZ+u
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: DJGELFWKRJRVD7RKCBGBSW7FRSWS33RS
X-Message-ID-Hash: DJGELFWKRJRVD7RKCBGBSW7FRSWS33RS
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DJGELFWKRJRVD7RKCBGBSW7FRSWS33RS/>
List-Archive: <>
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
 sound/soc/img/img-i2s-out.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/img/img-i2s-out.c b/sound/soc/img/img-i2s-out.c
index abeff7829310..fe95ddfb8407 100644
--- a/sound/soc/img/img-i2s-out.c
+++ b/sound/soc/img/img-i2s-out.c
@@ -532,13 +532,11 @@ static int img_i2s_out_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int img_i2s_out_dev_remove(struct platform_device *pdev)
+static void img_i2s_out_dev_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		img_i2s_out_runtime_suspend(&pdev->dev);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -609,7 +607,7 @@ static struct platform_driver img_i2s_out_driver = {
 		.pm = &img_i2s_out_pm_ops
 	},
 	.probe = img_i2s_out_probe,
-	.remove = img_i2s_out_dev_remove
+	.remove_new = img_i2s_out_dev_remove
 };
 module_platform_driver(img_i2s_out_driver);
 
-- 
2.39.2

