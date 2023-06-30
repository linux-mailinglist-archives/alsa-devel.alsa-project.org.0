Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DB3743DD8
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 16:48:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38753826;
	Fri, 30 Jun 2023 16:47:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38753826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688136503;
	bh=om19YwZRaeZE6X20j5l+l2oUoqXQHxFVsju2Yo1ZiIo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ckAbM4kyf/7rE5tNl13WGkWbCAF2HyzC9Odk90faav/MMa6XPgpfaymAN3YtyEGzn
	 iUlIYHgpJhif8mbC5XkSFwkgoI5LWnu9tr6JJiCCuBVe+4daIQVuq3+d1lWrdk76Am
	 QEOfkLQvys7ievLUImZuwHnfcEbOJGvn9nPnlBtA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15F1AF805B3; Fri, 30 Jun 2023 16:46:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3A01F805AF;
	Fri, 30 Jun 2023 16:46:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE487F805AC; Fri, 30 Jun 2023 16:46:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1411BF80535
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 16:45:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1411BF80535
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id DAA33242EE;
	Fri, 30 Jun 2023 10:45:43 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1qFFNX-mnX-00; Fri, 30 Jun 2023 16:45:43 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v2 5/8] ALSA: add snd_ctl_add_locked()
Date: Fri, 30 Jun 2023 16:45:39 +0200
Message-Id: <20230630144542.664190-6-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230630144542.664190-1-oswald.buddenhagen@gmx.de>
References: <20230630144542.664190-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZIJ476BBKWDPYAG6P4B7EWIMROCPRC6P
X-Message-ID-Hash: ZIJ476BBKWDPYAG6P4B7EWIMROCPRC6P
X-MailFrom: ossi@kde.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZIJ476BBKWDPYAG6P4B7EWIMROCPRC6P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is in fact more symmetrical to snd_ctl_remove() than snd_ctl_add()
is - the former could be named snd_ctl_remove_locked() just as well.

One may argue that this is going in the wrong direction, as drivers have
no business managing the lock. This may be true in principle, but in
practice the vast majority of controls is created even before the device
was registered, and therefore before any locking is necessary at all.
That means that an even more radical approach of changing snd_ctl_add()
do do no locking, and converting the call sites that actually need
locking to a new function, would better match reality, and would be
somewhat more efficient at that. However, that seems a bit risky and way
too much work.

This will be used to dynamically change the available controls from
another control's put() callback, which is already locked.

One might want to add snd_ctl_replace_locked() for completeness, but I
have no use for it now.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
v2:
- extended commit message
---
 include/sound/control.h |  1 +
 sound/core/control.c    | 31 +++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/include/sound/control.h b/include/sound/control.h
index cc3dcc6cfb0f..d4e210831a38 100644
--- a/include/sound/control.h
+++ b/include/sound/control.h
@@ -134,6 +134,7 @@ void snd_ctl_notify_one(struct snd_card * card, unsigned int mask, struct snd_kc
 struct snd_kcontrol *snd_ctl_new1(const struct snd_kcontrol_new * kcontrolnew, void * private_data);
 void snd_ctl_free_one(struct snd_kcontrol * kcontrol);
 int snd_ctl_add(struct snd_card * card, struct snd_kcontrol * kcontrol);
+int snd_ctl_add_locked(struct snd_card * card, struct snd_kcontrol * kcontrol);
 int snd_ctl_remove(struct snd_card * card, struct snd_kcontrol * kcontrol);
 int snd_ctl_replace(struct snd_card *card, struct snd_kcontrol *kcontrol, bool add_on_replace);
 int snd_ctl_remove_id(struct snd_card * card, struct snd_ctl_elem_id *id);
diff --git a/sound/core/control.c b/sound/core/control.c
index 82aa1af1d1d8..ede5ab911add 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -527,6 +527,27 @@ static int snd_ctl_add_replace(struct snd_card *card,
 	return err;
 }
 
+static int snd_ctl_add_replace_locked(struct snd_card *card,
+				      struct snd_kcontrol *kcontrol,
+				      enum snd_ctl_add_mode mode)
+{
+	int err = -EINVAL;
+
+	if (! kcontrol)
+		return err;
+	if (snd_BUG_ON(!card || !kcontrol->info))
+		goto error;
+
+	err = __snd_ctl_add_replace(card, kcontrol, mode);
+	if (err < 0)
+		goto error;
+	return 0;
+
+ error:
+	snd_ctl_free_one(kcontrol);
+	return err;
+}
+
 /**
  * snd_ctl_add - add the control instance to the card
  * @card: the card instance
@@ -547,6 +568,16 @@ int snd_ctl_add(struct snd_card *card, struct snd_kcontrol *kcontrol)
 }
 EXPORT_SYMBOL(snd_ctl_add);
 
+/**
+ * snd_ctl_add_locked - same as snd_ctl_add(), but card->controls_rwsem
+ * is expected to be already locked if necessary.
+ */
+int snd_ctl_add_locked(struct snd_card *card, struct snd_kcontrol *kcontrol)
+{
+	return snd_ctl_add_replace_locked(card, kcontrol, CTL_ADD_EXCLUSIVE);
+}
+EXPORT_SYMBOL(snd_ctl_add_locked);
+
 /**
  * snd_ctl_replace - replace the control instance of the card
  * @card: the card instance
-- 
2.40.0.152.g15d061e6df

