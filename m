Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0CB6BB71B
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:10:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5D481280;
	Wed, 15 Mar 2023 16:09:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5D481280
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678893013;
	bh=Nv0fFDdpMsYv/AziGAvneOUwDP6WrEsgaTtZmnVlKCs=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FI8a4DCRREPHfHs7ODb1ClhZBJ+3zo0U0TXEtbqJEVsWfaCfytweO9acTyi+EMakI
	 uRm33pj9PaIuWuWaRQhmASMrX9vp40tZKGjiCOjSMYKv7ZOtU2nzElEbbNP7owHFnz
	 DLuutFckkETZhWyxV5UG8277oAWJqw5X8v2AycmY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 007F1F805AF;
	Wed, 15 Mar 2023 16:08:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DAAEF80551; Wed, 15 Mar 2023 16:08:11 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 20A77F8051B
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:08:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20A77F8051B
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjR-00076k-Ax; Wed, 15 Mar 2023 16:08:01 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjP-004KUH-UP; Wed, 15 Mar 2023 16:07:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pcSjO-0057cP-L6; Wed, 15 Mar 2023 16:07:58 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 010/173] ALSA: ppc/powermac: Convert to platform remove
 callback returning void
Date: Wed, 15 Mar 2023 16:05:02 +0100
Message-Id: <20230315150745.67084-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=Nv0fFDdpMsYv/AziGAvneOUwDP6WrEsgaTtZmnVlKCs=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd1Fc2m0HdG8hA2w0W66WSSsQN5kZZ2uuzZom
 b2v/sqUuJeJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHdRQAKCRDB/BR4rcrs
 CZ0jCACPrpIlHkrSaBq80LSctZcXy1yzAvLgskca4LBO4LBxyHTTfFqyTugrTL1GHnkHXn20Yd3
 qNiV7pzR8UaVog2UzIuYKI/Gi1m2RpaEjbKH1DiowL6BhptZtU2lpFdSarRMoTqSQzhB+mRNSlQ
 1i4INPcYOTV4qgeWvJ9WF2kVUTWDx97fFyM/EXzloZXvgcZ6naAHbsep49lw9jSyKf0u615E3Hs
 CO6gHhimXOCTNEWaRcapCulnRlma6ioLO2QYKmyGdY9hg73FWmMcfzbu9caNUa4Xfkvpd4cof8F
 /fcHSV3XnyjSoJgJXTbPwrfr7wt8waK16GdZ5ZTLI+tbA/mO
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: IQ3ZC3VKT2O4OYXONQT7UIMFGSW7PMHH
X-Message-ID-Hash: IQ3ZC3VKT2O4OYXONQT7UIMFGSW7PMHH
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IQ3ZC3VKT2O4OYXONQT7UIMFGSW7PMHH/>
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
 sound/ppc/powermac.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/ppc/powermac.c b/sound/ppc/powermac.c
index db414b61157e..e17af46abddd 100644
--- a/sound/ppc/powermac.c
+++ b/sound/ppc/powermac.c
@@ -130,10 +130,9 @@ static int snd_pmac_probe(struct platform_device *devptr)
 }
 
 
-static int snd_pmac_remove(struct platform_device *devptr)
+static void snd_pmac_remove(struct platform_device *devptr)
 {
 	snd_card_free(platform_get_drvdata(devptr));
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -161,7 +160,7 @@ static SIMPLE_DEV_PM_OPS(snd_pmac_pm, snd_pmac_driver_suspend, snd_pmac_driver_r
 
 static struct platform_driver snd_pmac_driver = {
 	.probe		= snd_pmac_probe,
-	.remove		= snd_pmac_remove,
+	.remove_new	= snd_pmac_remove,
 	.driver		= {
 		.name	= SND_PMAC_DRIVER,
 		.pm	= SND_PMAC_PM_OPS,
-- 
2.39.2

