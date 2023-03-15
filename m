Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7F26BB7DA
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:31:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4231E1374;
	Wed, 15 Mar 2023 16:30:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4231E1374
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678894307;
	bh=7Rm5rl8OeCAWkljQe3o+60Np2E6ukGuyAf9jP9IYc6w=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nxoFaci7flRrTAJjsg8WyPNSm+tXgB/lEeMJvN+c8/z6oNbwPUeW4VWCtYxWJQ+e5
	 rZgD6oQ4dW9Mwhx5arIrmp8y8SdjtvgwaUn5UQnwWQv4xo++U0fnAsgQ0ND+hHXocQ
	 dhXrfN7mCkqYkDRw/cVMBy4T23a3+mgeFmp5vI3k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 930FEF8071F;
	Wed, 15 Mar 2023 16:13:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14D52F805D4; Wed, 15 Mar 2023 16:09:45 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7ED3AF805E2
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7ED3AF805E2
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjh-0007vL-3K; Wed, 15 Mar 2023 16:08:17 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSje-004KZf-Mv; Wed, 15 Mar 2023 16:08:14 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjd-0057gi-FY; Wed, 15 Mar 2023 16:08:13 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 076/173] ASoC: fsl: imx-audmux: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:06:08 +0100
Message-Id: <20230315150745.67084-77-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1554;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=7Rm5rl8OeCAWkljQe3o+60Np2E6ukGuyAf9jP9IYc6w=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd4T+blhcfk/vA8SLzk8BQ6UIEqcD7+ntHVHw
 Wb+oBL6KG2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHeEwAKCRDB/BR4rcrs
 CTSLB/9eXoylhVzAMqbRiHhprdMuMUbIVlVgfD0C87T3tY9+/9AKbctAsw8Me/vDWb5QiTeTX04
 g9ziAPQDgR0rNecSyAoEHQJZfOkhqbsL0fe9XlE9lBZtw8oHfLgKSMg8o9rmUtcoUEobOVDm5k7
 yNqn2b7tH0V9xQBho5A8B+Y1GW4GzsYNnPBN8aYjqbYgFj3hAjYHqRi+Rrn2g+6SPgGMqTCBVqc
 +wpCb6q2RUy1XPgYMUaUI1WygF+W/vvQAXYYJG9BqRLMFt6xVClGhZD0T6L+ka69ayiQHbDcDwo
 VIP8SbRM8pTNnThiUUK05indWUHbmvZ7I1z9eFMY7IpRxM/L
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: XGWJSYWDDN4AGW2Y3IELUWFZF4GH3D44
X-Message-ID-Hash: XGWJSYWDDN4AGW2Y3IELUWFZF4GH3D44
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XGWJSYWDDN4AGW2Y3IELUWFZF4GH3D44/>
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
 sound/soc/fsl/imx-audmux.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
index 582f1e2431ee..be003a117b39 100644
--- a/sound/soc/fsl/imx-audmux.c
+++ b/sound/soc/fsl/imx-audmux.c
@@ -315,12 +315,10 @@ static int imx_audmux_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int imx_audmux_remove(struct platform_device *pdev)
+static void imx_audmux_remove(struct platform_device *pdev)
 {
 	if (audmux_type == IMX31_AUDMUX)
 		audmux_debugfs_remove();
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -359,7 +357,7 @@ static const struct dev_pm_ops imx_audmux_pm = {
 
 static struct platform_driver imx_audmux_driver = {
 	.probe		= imx_audmux_probe,
-	.remove		= imx_audmux_remove,
+	.remove_new	= imx_audmux_remove,
 	.driver	= {
 		.name	= DRIVER_NAME,
 		.pm = &imx_audmux_pm,
-- 
2.39.2

