Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0F472DB21
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 09:39:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5636C820;
	Tue, 13 Jun 2023 09:38:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5636C820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686641964;
	bh=UVimVAlQaD/qBIwR7YjTiZUQ57bbmjM9i8VSrHde7r8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iMxLQx5zPIpfOz9EPTgeT+ctdLz/GXQcwBgqYxhFnXMU/n5f37+reLoT5ZOxb/Phc
	 qmcqWQU68ZY0abQ0aiUgPCRC8R9v/Qbq9aUGcaGAEybf4T3vdfl+wFoag2315neeb2
	 orq1QujL1Y+AeMraY4heLDwSu800DJER9iH4b83Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2570BF80557; Tue, 13 Jun 2023 09:38:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D79ECF80548;
	Tue, 13 Jun 2023 09:38:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94D4EF80544; Tue, 13 Jun 2023 09:38:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8D88F80130
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 09:38:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8D88F80130
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 94B622426F;
	Tue, 13 Jun 2023 03:38:22 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q8ybe-dRp-00; Tue, 13 Jun 2023 09:38:22 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 5/8] ALSA: add snd_ctl_add_locked()
Date: Tue, 13 Jun 2023 09:38:19 +0200
Message-Id: <20230613073822.1343234-6-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230613073822.1343234-1-oswald.buddenhagen@gmx.de>
References: <20230613073822.1343234-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5PAAL2IJ6EO6O45KRZ3XL23KHXFCPQVM
X-Message-ID-Hash: 5PAAL2IJ6EO6O45KRZ3XL23KHXFCPQVM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5PAAL2IJ6EO6O45KRZ3XL23KHXFCPQVM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is in fact more symmetrical to snd_ctl_remove() than snd_ctl_add()
is - the former could be named snd_ctl_remove_locked() just as well.

This will be used to dynamically change the available controls from
another control's put() callback, which is already locked.

One might want to add snd_ctl_replace_locked() for completeness, but I
have no use for it now.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
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

