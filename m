Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E566BB739
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:13:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD4661277;
	Wed, 15 Mar 2023 16:12:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD4661277
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893201;
	bh=4XkIDipUvzJhlTbbh5RiS7LYTQNtjS4CElPfU0UHaw4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Yl7kF9jSPmCyOqkX+4Z896HDLGfcWo01Wf3T4Gsi1ZSDvEFKG5tplrt04hyu5yoC/
	 CP5bULOyLI7/MAQee3pe3zkLj3un8/2TztUwQPCUBo5VCZ/5c10LODxne0PvvtA7Ll
	 oxcYlvSMixWTl29Fh+KNk7BQExsSC6w+jmkRUOFs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABAB5F805AC;
	Wed, 15 Mar 2023 16:09:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C33FF805E7; Wed, 15 Mar 2023 16:08:30 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C99BEF8053B
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C99BEF8053B
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjT-0007FE-Bh; Wed, 15 Mar 2023 16:08:03 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjS-004KV9-0s; Wed, 15 Mar 2023 16:08:02 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjR-0057dF-5Y; Wed, 15 Mar 2023 16:08:01 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH 022/173] ASoC: amd: yc: acp6x-pdm-dma: Convert to platform
 remove callback returning void
Date: Wed, 15 Mar 2023 16:05:14 +0100
Message-Id: <20230315150745.67084-23-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=4XkIDipUvzJhlTbbh5RiS7LYTQNtjS4CElPfU0UHaw4=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd1rhu2HYliz16v3Ymu9IkC+Ox+6wR1tSIDcp
 k77lTAMPPCJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdawAKCRDB/BR4rcrs
 CT8mB/9MGW8v62iHbXZJqWsPqXbfzbbXFGYFmQRqcFJwJKWxbYeVmK4Z8g733Q6SsyO3yUJd6EE
 c2O0a8ErOzzM/c1rB8hYc2pP5IAsjS551CuowsnC7l1uTjOeFO+eKGZSyxdIyXBd6wccFWN7jWh
 3UNUIl/Nk5eBBVbY0kL7lZFZk2jiiW2rSqphPURK6RTXKtxrBRne+K2gp21Ec7ZtFBAWtNu8zj+
 q/D0uaxi1+dX4i687TMzC3rdRlGgP26cQG13S+RjqQAZjnGzN1bJYjn6uLnQ/sre2/rR/cNmV9Z
 0j9CNANzX7JAmKSQFUKHBjZXFKuiO+n6hituOpGrr60eCgYJ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: PZBIJNO54M2SLAO6QPNDJANCUGNIRJSO
X-Message-ID-Hash: PZBIJNO54M2SLAO6QPNDJANCUGNIRJSO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PZBIJNO54M2SLAO6QPNDJANCUGNIRJSO/>
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
 sound/soc/amd/yc/acp6x-pdm-dma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
index 294dd7fb43c9..d818eba48546 100644
--- a/sound/soc/amd/yc/acp6x-pdm-dma.c
+++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
@@ -388,10 +388,9 @@ static int acp6x_pdm_audio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int acp6x_pdm_audio_remove(struct platform_device *pdev)
+static void acp6x_pdm_audio_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-	return 0;
 }
 
 static int __maybe_unused acp6x_pdm_resume(struct device *dev)
@@ -440,7 +439,7 @@ static const struct dev_pm_ops acp6x_pdm_pm_ops = {
 
 static struct platform_driver acp6x_pdm_dma_driver = {
 	.probe = acp6x_pdm_audio_probe,
-	.remove = acp6x_pdm_audio_remove,
+	.remove_new = acp6x_pdm_audio_remove,
 	.driver = {
 		.name = "acp_yc_pdm_dma",
 		.pm = &acp6x_pdm_pm_ops,
-- 
2.39.2

