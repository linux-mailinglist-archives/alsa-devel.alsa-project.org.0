Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D2B757F26
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 16:14:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91699207;
	Tue, 18 Jul 2023 16:13:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91699207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689689669;
	bh=xKaM1+dSFHSzbJcPHf40P1YwD3yh0j2PgNpbHkTqtTA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j7LbhQsXuojeWujvYIrYjmevy8J3rJQ08rf/F3PIpZyK0JMC7/+87DJW4Wz7s354m
	 pcXTFjljsBI2ymNAwlWWUF9V9h0G5Ec5CKT5pL9pmQOhE8Sd7Tb4am+qLnRb3/Yx44
	 T/ocyfVb5TWoqpa3/PNUss58asnnh2BXj7CfoW5E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C136F80558; Tue, 18 Jul 2023 16:13:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7790AF8055C;
	Tue, 18 Jul 2023 16:13:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68BDCF80563; Tue, 18 Jul 2023 16:13:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A501F800D2
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 16:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A501F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=YTd2tQSP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/F9VGhZn
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 07CC81F45A;
	Tue, 18 Jul 2023 14:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689689595;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QtRvsWMnAzvCPhrLpYhM6bpI/l2G1ziz1wtPWyf4Pss=;
	b=YTd2tQSPHefHaYmTiWqcJWovJKXDJywbftKhy4kIgbio9zDMkhSU4VVrznlXotU3fmglXh
	QYFQ6dkNppp8SlzAHtWCrzoxaGUtHBD72t7K6pdBcZS5XwoukFbc8h1SJzC85OOr3Zu005
	r4B4KR/xAKW/L7H770udjWwvVL+D61Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689689595;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QtRvsWMnAzvCPhrLpYhM6bpI/l2G1ziz1wtPWyf4Pss=;
	b=/F9VGhZnh3Yudx6UP1E6Jcwyp9ZsLTHQ8qRo9V13bxtabrDfikHuxZzz6/es6BUC19cbWH
	vqc9An6LN1L7opCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D6D8B138EC;
	Tue, 18 Jul 2023 14:13:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id yJmcM/qdtmQ8AQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 18 Jul 2023 14:13:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 01/11] ALSA: control: Take card->controls_rwsem in
 snd_ctl_rename()
Date: Tue, 18 Jul 2023 16:12:54 +0200
Message-Id: <20230718141304.1032-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230718141304.1032-1-tiwai@suse.de>
References: <20230718141304.1032-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZFRGUYBUP7VGBEZF5KY2HBWQUEAQKX6C
X-Message-ID-Hash: ZFRGUYBUP7VGBEZF5KY2HBWQUEAQKX6C
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZFRGUYBUP7VGBEZF5KY2HBWQUEAQKX6C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_ctl_rename() expects that card->controls_rwsem is held in the
caller side for avoiding possible races, but actually no one really
did that.  It's likely because this operation is done usually only at
the device initialization where no race can happen.  But, it's still
safer to take a lock, so we just take the lock inside snd_ctl_rename()
like most of other API functions do.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/control.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 8386b53acdcd..a41d19c46df2 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -769,11 +769,12 @@ EXPORT_SYMBOL(snd_ctl_rename_id);
  *
  * Renames the specified control on the card to the new name.
  *
- * Make sure to take the control write lock - down_write(&card->controls_rwsem).
+ * Note that this function takes card->controls_rwsem lock internally.
  */
 void snd_ctl_rename(struct snd_card *card, struct snd_kcontrol *kctl,
 		    const char *name)
 {
+	down_write(&card->controls_rwsem);
 	remove_hash_entries(card, kctl);
 
 	if (strscpy(kctl->id.name, name, sizeof(kctl->id.name)) < 0)
@@ -781,6 +782,7 @@ void snd_ctl_rename(struct snd_card *card, struct snd_kcontrol *kctl,
 			name, kctl->id.name);
 
 	add_hash_entries(card, kctl);
+	up_write(&card->controls_rwsem);
 }
 EXPORT_SYMBOL(snd_ctl_rename);
 
-- 
2.35.3

