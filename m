Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35242757F32
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 16:16:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 528AE203;
	Tue, 18 Jul 2023 16:15:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 528AE203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689689762;
	bh=FnfHNZB4xLMItHMZnT+AUkBCGr69HgX1xgz8HT0IcjM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YC/upxaOp/RzFeiviMmmF4ADJjYiLsisSgTJIUOYx6rFzq4X2KXPbbeK20o5hFiqj
	 V3mTGAEuaFhboYCgYILAMAi0w5+Ze36fuIg3+jAN5o9/NdPwVcpGAvipDrImdL++so
	 RYh7KaYD3/2zKIQt9LtlO+e31BQ0MASMnREDjgfg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED6E6F805C5; Tue, 18 Jul 2023 16:13:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA3F8F805C1;
	Tue, 18 Jul 2023 16:13:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80EA5F805AF; Tue, 18 Jul 2023 16:13:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7EC39F804DA
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 16:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EC39F804DA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=S9g6KJcY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ZzeMQ6/8
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7062121923;
	Tue, 18 Jul 2023 14:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689689596;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X3dadz9YFV/57Y8KoPgWlMnUM+i3sNjo6CMXkSSDwek=;
	b=S9g6KJcYEOgqis9Z3nyqJZWCPWb89ARCCsZ4TOZMW//Qr7f61AgjRjZ7Ja0fz1CYFX31i+
	4BSECgizKyB4LZRnuUT9L73R9h13N4pRFa3xzaWLE5PW8wbN+n/0TOAZJjGk0UKTmEAHvi
	nck0ibwU4UnY7ko1Zw4KWsi9lptsvSI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689689596;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X3dadz9YFV/57Y8KoPgWlMnUM+i3sNjo6CMXkSSDwek=;
	b=ZzeMQ6/8SKgsVHC6dlQ9iRg70F6kCyfabF8vSfyJIo8TMgN5eFWXmyB9nj9uVe99u5GCz+
	cqZowo8bP0tTzcDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 55D69138EC;
	Tue, 18 Jul 2023 14:13:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id aNYWFPydtmQ8AQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 18 Jul 2023 14:13:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 10/11] ALSA: control: Take lock in snd_ctl_find_id() and
 snd_ctl_find_numid()
Date: Tue, 18 Jul 2023 16:13:03 +0200
Message-Id: <20230718141304.1032-11-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230718141304.1032-1-tiwai@suse.de>
References: <20230718141304.1032-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NIJ7KTNQCGYF3TIIMDSJLU3OXMJAHW7I
X-Message-ID-Hash: NIJ7KTNQCGYF3TIIMDSJLU3OXMJAHW7I
X-MailFrom: tiwai@suse.de
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now all needed callers have been replaced with *_locked() versions,
let's turn on the locking in snd_ctl_find_id() and
snd_ctl_find_numid().

This patch also adds the lockdep assertions for debugging, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 30741293708d..e13e9d6b3b89 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -836,6 +836,7 @@ snd_ctl_find_numid_locked(struct snd_card *card, unsigned int numid)
 {
 	if (snd_BUG_ON(!card || !numid))
 		return NULL;
+	lockdep_assert_held(&card->controls_rwsem);
 #ifdef CONFIG_SND_CTL_FAST_LOOKUP
 	return xa_load(&card->ctl_numids, numid);
 #else
@@ -852,11 +853,18 @@ EXPORT_SYMBOL(snd_ctl_find_numid_locked);
  * Finds the control instance with the given number-id from the card.
  *
  * Return: The pointer of the instance if found, or %NULL if not.
+ *
+ * Note that this function takes card->controls_rwsem lock internally.
  */
 struct snd_kcontrol *snd_ctl_find_numid(struct snd_card *card,
 					unsigned int numid)
 {
-	return snd_ctl_find_numid_locked(card, numid);
+	struct snd_kcontrol *kctl;
+
+	down_read(&card->controls_rwsem);
+	kctl = snd_ctl_find_numid_locked(card, numid);
+	up_read(&card->controls_rwsem);
+	return kctl;
 }
 EXPORT_SYMBOL(snd_ctl_find_numid);
 
@@ -879,6 +887,7 @@ struct snd_kcontrol *snd_ctl_find_id_locked(struct snd_card *card,
 
 	if (snd_BUG_ON(!card || !id))
 		return NULL;
+	lockdep_assert_held(&card->controls_rwsem);
 	if (id->numid != 0)
 		return snd_ctl_find_numid_locked(card, id->numid);
 #ifdef CONFIG_SND_CTL_FAST_LOOKUP
@@ -905,11 +914,18 @@ EXPORT_SYMBOL(snd_ctl_find_id_locked);
  * Finds the control instance with the given id from the card.
  *
  * Return: The pointer of the instance if found, or %NULL if not.
+ *
+ * Note that this function takes card->controls_rwsem lock internally.
  */
 struct snd_kcontrol *snd_ctl_find_id(struct snd_card *card,
 				     const struct snd_ctl_elem_id *id)
 {
-	return snd_ctl_find_id_locked(card, id);
+	struct snd_kcontrol *kctl;
+
+	down_read(&card->controls_rwsem);
+	kctl = snd_ctl_find_id_locked(card, id);
+	up_read(&card->controls_rwsem);
+	return kctl;
 }
 EXPORT_SYMBOL(snd_ctl_find_id);
 
-- 
2.35.3

