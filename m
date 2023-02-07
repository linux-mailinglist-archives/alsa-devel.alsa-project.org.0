Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAB668E4A4
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 00:53:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E16F1E2;
	Wed,  8 Feb 2023 00:52:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E16F1E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675813985;
	bh=QndZ7tYlfmaqsT9TpWtutfsir/wk+cDucaDxJbdN7W8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KqIU8094UaYExcfU7rB1dW+wW0j7Y01y4hproNmwytPsDoEOAvX+mdHiAH5St09OQ
	 JmfASnmp7jTzBRg2RJ3rrO/QWB+fsE41ZfGP2Bo/KNLxqHGg6s1JK6WJJhIxB49tXO
	 jNUh7IVluPvtgQqI3rRdPzHHDme5zOQZHIxBj3UI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EB99F8010B;
	Wed,  8 Feb 2023 00:52:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C8DCF80152; Wed,  8 Feb 2023 00:52:10 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 19AFCF80095
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 00:52:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19AFCF80095
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pPTVA-0008RQ-8V; Tue, 07 Feb 2023 20:19:36 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pPTV8-003LvE-6l; Tue, 07 Feb 2023 20:19:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pPTV8-001ewC-RR; Tue, 07 Feb 2023 20:19:34 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/3] ALSA: core: Make snd_card_free_when_closed() return void
Date: Tue,  7 Feb 2023 20:19:06 +0100
Message-Id: <20230207191907.467756-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
References: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2431;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=QndZ7tYlfmaqsT9TpWtutfsir/wk+cDucaDxJbdN7W8=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj4qQihqS+RqvE4mHTbtFK25t/9HPpCE7QvpjDFs9f
 Hx8KRTOJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY+KkIgAKCRDB/BR4rcrsCYi3CA
 CCKHI+lrkoXLA2CbSJ4SFg/vgq1RZVLHyKNc4YX2LyU7Qf9H0mX8HERUduG/VCS3nbG5qB45/bI9nO
 IcDmLzI3Xe4Bh/KMc/g1vvgqp33/7q/v/RXmxId8sw8lOUL1Ct7Jb3klyLFaHSo/5s4PVcaXAjv43g
 F6ABuS5BV/uMFZSWb1enx7G493u19CHnq8oBd+kcIZQiptjTjKkqwCPf7h+8mCl0pZxMOd6OgTsCqM
 sLByoQuXA9E0MTe+LnMYVzoP0CYA+Y8PQal+QelNdGvywmJ4cWkLUxg3U51CbUWXv/9WpmA2REQ3IA
 0SGOyWIit5AWISkBwJ2KqIPsEfr97u
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: I3T5GFJWB56XANDBL7FSSQTLRHA5IXMI
X-Message-ID-Hash: I3T5GFJWB56XANDBL7FSSQTLRHA5IXMI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I3T5GFJWB56XANDBL7FSSQTLRHA5IXMI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

All callers from other files ignore the return value of this function.
And it can only ever return a non-zero value if the parameter card is NULL.

This cannot happen in snd_card_free() as card was dereferenced just before
snd_card_free_when_closed() is called. So the error handling can be dropped
there.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 include/sound/core.h |  2 +-
 sound/core/init.c    | 12 +++++-------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 9a73c60b6f1e..21884c979c17 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -289,7 +289,7 @@ int snd_devm_card_new(struct device *parent, int idx, const char *xid,
 void snd_card_disconnect(struct snd_card *card);
 void snd_card_disconnect_sync(struct snd_card *card);
 int snd_card_free(struct snd_card *card);
-int snd_card_free_when_closed(struct snd_card *card);
+void snd_card_free_when_closed(struct snd_card *card);
 int snd_card_free_on_error(struct device *dev, int ret);
 void snd_card_set_id(struct snd_card *card, const char *id);
 int snd_card_register(struct snd_card *card);
diff --git a/sound/core/init.c b/sound/core/init.c
index a03eddab12fe..6bb3e2b77971 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -608,14 +608,14 @@ static int snd_card_do_free(struct snd_card *card)
  *
  * Return: zero if successful, or a negative error code
  */
-int snd_card_free_when_closed(struct snd_card *card)
+void snd_card_free_when_closed(struct snd_card *card)
 {
 	if (!card)
-		return -EINVAL;
+		return;
 
 	snd_card_disconnect(card);
 	put_device(&card->card_dev);
-	return 0;
+	return;
 }
 EXPORT_SYMBOL(snd_card_free_when_closed);
 
@@ -635,7 +635,6 @@ EXPORT_SYMBOL(snd_card_free_when_closed);
 int snd_card_free(struct snd_card *card)
 {
 	DECLARE_COMPLETION_ONSTACK(released);
-	int ret;
 
 	/* The call of snd_card_free() is allowed from various code paths;
 	 * a manual call from the driver and the call via devres_free, and
@@ -647,9 +646,8 @@ int snd_card_free(struct snd_card *card)
 		return 0;
 
 	card->release_completion = &released;
-	ret = snd_card_free_when_closed(card);
-	if (ret)
-		return ret;
+	snd_card_free_when_closed(card);
+
 	/* wait, until all devices are ready for the free operation */
 	wait_for_completion(&released);
 
-- 
2.39.0

