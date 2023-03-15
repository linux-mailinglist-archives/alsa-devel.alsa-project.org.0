Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD466BB7A8
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:26:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 394A21327;
	Wed, 15 Mar 2023 16:25:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 394A21327
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893960;
	bh=ND/qfEK/K2yQMWNbGuK9dn2/B7iBBl8P2AgxRnz+K/U=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XooWm44zT2GUR17i/DnDcRHGkr/65NMlHNCWFzJ2Igyg+s4cNyO+xepief7r+/aAa
	 SHKgVXjPPNWHwN9A55sdBLeCSrCl5bw1uIE4uncA4F3z3o6WdakiOwItSSYO+SCl0/
	 FerlQDQQNy4QNRTpZPJCj++PVftFhQU4/UTUDH+s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDA4AF806AA;
	Wed, 15 Mar 2023 16:12:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 992D5F8065E; Wed, 15 Mar 2023 16:09:25 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BF36F805BE
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BF36F805BE
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSje-0007hB-1i; Wed, 15 Mar 2023 16:08:14 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjc-004KYo-8q; Wed, 15 Mar 2023 16:08:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjb-0057gB-Lk; Wed, 15 Mar 2023 16:08:11 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 068/173] ASoC: fsl: fsl_easrc: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:00 +0100
Message-Id: <20230315150745.67084-69-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1568;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=ND/qfEK/K2yQMWNbGuK9dn2/B7iBBl8P2AgxRnz+K/U=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd37/BxjPnlV5VAPElq4vSSy0N90dTuQ8/VkK
 TUwywSQSPaJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHd+wAKCRDB/BR4rcrs
 Ce4nB/9YjctLamI+NS6NLpoMnvCnOnU9ZRFDJiXHZavIJtFothyEpVyV4tePP4TAvem9U2IEbOC
 ogzOVYRQDyl74qDKdmoWD9k3Ct2loRXOs3W/acL2k5BeLNOpeAUleGzfH/nqYN33iQM7Smx0flH
 U1+MakbCW3mDsuLdW6ZVgovuVO7GQO/3uDD2vQ+rQUJnYW8JxLs15KQt+FOMOIkEnN955ZoJPW9
 fODaq0Fqv/JDPYEqP3XWAHY6+37obS7I5IqawPcgyYwelMtoBq8g9MBwYNTQqO0ZAR2I7enGb1s
 sgthKVaRkZ16Ib8phQ6i6QEuhdOLTVfvvZF+57dPCiNuftXr
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: 7YJYDXAOZYDFD4RSBBTNVVWMMAGSDCOQ
X-Message-ID-Hash: 7YJYDXAOZYDFD4RSBBTNVVWMMAGSDCOQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7YJYDXAOZYDFD4RSBBTNVVWMMAGSDCOQ/>
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
 sound/soc/fsl/fsl_easrc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 3153d19136b2..670cbdb361b6 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1979,11 +1979,9 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int fsl_easrc_remove(struct platform_device *pdev)
+static void fsl_easrc_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static __maybe_unused int fsl_easrc_runtime_suspend(struct device *dev)
@@ -2093,7 +2091,7 @@ static const struct dev_pm_ops fsl_easrc_pm_ops = {
 
 static struct platform_driver fsl_easrc_driver = {
 	.probe = fsl_easrc_probe,
-	.remove = fsl_easrc_remove,
+	.remove_new = fsl_easrc_remove,
 	.driver = {
 		.name = "fsl-easrc",
 		.pm = &fsl_easrc_pm_ops,
-- 
2.39.2

