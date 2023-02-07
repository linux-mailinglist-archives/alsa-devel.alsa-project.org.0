Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBC268E4A7
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 00:54:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 745E383A;
	Wed,  8 Feb 2023 00:53:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 745E383A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675814039;
	bh=JrtvmnG60IpCa3g342NWkBGfpziD8Runnsf6I+fRevc=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H7gePavnLhIHPK5bk8kTV3pub/GguUvWBLgS74Cky96EGlG0hfBVa3uqHhABamyni
	 fAfQWNd+FPmQs+pZt7Oi4ZbZKbyEcWTpcIwaTmEAPVu1ojFgJJ8t5QSZmQ2dCY0lp2
	 N63X2455N3X7x5LOTQOGDcAlbRrdha4W9IjLRsF0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 277ECF8051F;
	Wed,  8 Feb 2023 00:52:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94D5BF80152; Wed,  8 Feb 2023 00:52:13 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CCF3FF800E2
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 00:52:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCF3FF800E2
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pPTVA-0008RP-8U; Tue, 07 Feb 2023 20:19:36 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pPTV8-003LvB-1M; Tue, 07 Feb 2023 20:19:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pPTV8-001ew8-Hn; Tue, 07 Feb 2023 20:19:34 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/3] ALSA: core: Make snd_card_disconnect() return void
Date: Tue,  7 Feb 2023 20:19:05 +0100
Message-Id: <20230207191907.467756-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
References: <20230207191907.467756-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2965;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=JrtvmnG60IpCa3g342NWkBGfpziD8Runnsf6I+fRevc=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBj4qQfxFXQV937j3r5E264qu6mQ2U2tSeFZ2eFwWDD
 Wa2F5uKJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY+KkHwAKCRDB/BR4rcrsCXkEB/
 4jwn7HLhxvidRm8WkltlHnGLE7Z+kvM9vmCc5A/rgRs8xY2VfmtkT9fJFZe0II5AKPlhLDPplscXFH
 LIzb2r+OoNdujn2ZEaagWe8IiHxb3j4E2GueTG0q/24FvJerwASVgZhTwF3w7pcuEYcFK2ksISJgKC
 3trm4Vs9N63yrBNBfmaVgRkFTfT6jW2CkbCcRd8D7IX3LsvmHdq/pmy6g+SVu/4/CV0k8XYJ1F2SBp
 LsbXcKkvGSvSlic83cxLtBPL+eXSr3HJOqZz7hv8/E9QkQB8gMwRbNN6rtezSV7X8rKRG0AFuNRuYC
 ehhvAFExsIwL7rjYbLuIgNhxc/O2VM
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Message-ID-Hash: M3BZOE3I7IYDQSRJJSIRWNT2SQYVE4UQ
X-Message-ID-Hash: M3BZOE3I7IYDQSRJJSIRWNT2SQYVE4UQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M3BZOE3I7IYDQSRJJSIRWNT2SQYVE4UQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

All callers from other files ignore the return value of this function.
And it can only ever return a non-zero value if the parameter card is NULL.

Move the check for card being NULL into snd_card_free_when_closed() to keep
the previous behaviour. Note this isn't necessary for
snd_card_disconnect_sync() because if card was NULL in there the dereference
of card for dev_err() would oops the kernel. Replace this by an oops
triggered by the dereference of card for spin_lock_irq().

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 include/sound/core.h |  2 +-
 sound/core/init.c    | 24 ++++++++----------------
 2 files changed, 9 insertions(+), 17 deletions(-)

diff --git a/include/sound/core.h b/include/sound/core.h
index 4365c35d038b..9a73c60b6f1e 100644
--- a/include/sound/core.h
+++ b/include/sound/core.h
@@ -286,7 +286,7 @@ int snd_devm_card_new(struct device *parent, int idx, const char *xid,
 		      struct module *module, size_t extra_size,
 		      struct snd_card **card_ret);
 
-int snd_card_disconnect(struct snd_card *card);
+void snd_card_disconnect(struct snd_card *card);
 void snd_card_disconnect_sync(struct snd_card *card);
 int snd_card_free(struct snd_card *card);
 int snd_card_free_when_closed(struct snd_card *card);
diff --git a/sound/core/init.c b/sound/core/init.c
index 5377f94eb211..a03eddab12fe 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -489,17 +489,17 @@ static const struct file_operations snd_shutdown_f_ops =
  *  Note: The current implementation replaces all active file->f_op with special
  *        dummy file operations (they do nothing except release).
  */
-int snd_card_disconnect(struct snd_card *card)
+void snd_card_disconnect(struct snd_card *card)
 {
 	struct snd_monitor_file *mfile;
 
 	if (!card)
-		return -EINVAL;
+		return;
 
 	spin_lock(&card->files_lock);
 	if (card->shutdown) {
 		spin_unlock(&card->files_lock);
-		return 0;
+		return;
 	}
 	card->shutdown = 1;
 
@@ -548,7 +548,6 @@ int snd_card_disconnect(struct snd_card *card)
 	wake_up(&card->power_sleep);
 	snd_power_sync_ref(card);
 #endif
-	return 0;	
 }
 EXPORT_SYMBOL(snd_card_disconnect);
 
@@ -563,15 +562,7 @@ EXPORT_SYMBOL(snd_card_disconnect);
  */
 void snd_card_disconnect_sync(struct snd_card *card)
 {
-	int err;
-
-	err = snd_card_disconnect(card);
-	if (err < 0) {
-		dev_err(card->dev,
-			"snd_card_disconnect error (%d), skipping sync\n",
-			err);
-		return;
-	}
+	snd_card_disconnect(card);
 
 	spin_lock_irq(&card->files_lock);
 	wait_event_lock_irq(card->remove_sleep,
@@ -619,9 +610,10 @@ static int snd_card_do_free(struct snd_card *card)
  */
 int snd_card_free_when_closed(struct snd_card *card)
 {
-	int ret = snd_card_disconnect(card);
-	if (ret)
-		return ret;
+	if (!card)
+		return -EINVAL;
+
+	snd_card_disconnect(card);
 	put_device(&card->card_dev);
 	return 0;
 }
-- 
2.39.0

