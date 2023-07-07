Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4686274ABF4
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jul 2023 09:32:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61D15844;
	Fri,  7 Jul 2023 09:31:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61D15844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688715146;
	bh=syUMKSGjxh7NRVw33HrCzFyieXBaPTREi0AYgvj8YJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eG73tFWXbErqHFmYLPKyB32Rp/N2BcDY8t5uHh4DAq1GPh5Jr5lkjZWR5nEKlpCW1
	 hsDfRYtHj8TyMsnhsCaWMRNADTupnVb9a/af42arOa7oFuuc2AOAbwOAmqPBOynCY9
	 yYvOq+emvWZscyTtwMzqKn6oayvdZHi+GIxcnJtU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3253F80544; Fri,  7 Jul 2023 09:30:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F071F80544;
	Fri,  7 Jul 2023 09:30:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D361CF80132; Fri,  7 Jul 2023 09:29:09 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 23010F80093
	for <alsa-devel@alsa-project.org>; Fri,  7 Jul 2023 09:28:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23010F80093
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qHftX-0002hW-2l; Fri, 07 Jul 2023 09:28:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qHftV-00CgFY-8k; Fri, 07 Jul 2023 09:28:45 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qHftU-002wnv-8j; Fri, 07 Jul 2023 09:28:44 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	alsa-devel@alsa-project.org,
	kernel@pengutronix.de
Subject: [PATCH 1/2] ASoC: amd: ps-sdw-dma: Convert to platform remove
 callback returning void
Date: Fri,  7 Jul 2023 09:28:29 +0200
Message-Id: <20230707072830.3395789-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707072830.3395789-1-u.kleine-koenig@pengutronix.de>
References: <20230707072830.3395789-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=syUMKSGjxh7NRVw33HrCzFyieXBaPTREi0AYgvj8YJA=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkp76ZyP/bI/Pv69GNVPUh9mXhFqQBUXp2VoZUr
 yEXokumaniJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZKe+mQAKCRCPgPtYfRL+
 TjsjB/9t1PSN0uLpcNbYYdtCUztGUjZqHXo4FUThXDYfX+YEGxEjOAEIenq93/NCFcE0aHvN8Yi
 fnaFr2wL996ElZPSeOhG6aiN9y8ntxwMPIaeG+9sNg+MObqxKZH0mTofGyreHeFmMiBeGa/0ikc
 z7+3e06XEhyYIpQFLsCJtd4QbwHKZ3RXVIFDrI2/WwUD2Dx7AIlvfQxvHvFXIBxNj051rF9eXUU
 TR2jCjLmx0ajKW2kjZ459KW/Swx7eSfuWLHzQl8KFDqLxJAu0wZ2LSZTkrrX4z6MxOfwa93OXUE
 jofW0W96R0q55Lo2e4e0gl21wlg25M9kLW/wgw4iuh9qIrzr
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: SFYZFOJHFVZQRTKJJWNK2HKWLYJS4TT2
X-Message-ID-Hash: SFYZFOJHFVZQRTKJJWNK2HKWLYJS4TT2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SFYZFOJHFVZQRTKJJWNK2HKWLYJS4TT2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.
To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new() which already returns void. Eventually after all drivers
are converted, .remove_new() is renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/amd/ps/ps-sdw-dma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index ade130a8062a..29ceb52061af 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -476,10 +476,9 @@ static int acp63_sdw_platform_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int acp63_sdw_platform_remove(struct platform_device *pdev)
+static void acp63_sdw_platform_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
 
 static int acp_restore_sdw_dma_config(struct sdw_dma_dev_data *sdw_data)
@@ -540,7 +539,7 @@ static const struct dev_pm_ops acp63_pm_ops = {
 
 static struct platform_driver acp63_sdw_dma_driver = {
 	.probe = acp63_sdw_platform_probe,
-	.remove = acp63_sdw_platform_remove,
+	.remove_new = acp63_sdw_platform_remove,
 	.driver = {
 		.name = "amd_ps_sdw_dma",
 		.pm = &acp63_pm_ops,
-- 
2.39.2

