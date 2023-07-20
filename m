Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FAA75A914
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 10:23:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0A127F4;
	Thu, 20 Jul 2023 10:22:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0A127F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689841428;
	bh=3ZbKJwObTrfZprQIX1Z/rbI9K4UAfCte+tJGEpVLCO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tQ+uvFm4+eW393mLp3twBLaKPAw6SssNNZ2Bv6bp8grAztIop67AeqZjxx+uJQw8e
	 PvYn9AQ7XqbfLFnbZJZpruIW2Udt8ra+jHm28PyPLMLChtoyew6BlAutyB1Jb4etGZ
	 GQ7xTKlvyRXCwjSK2ODg+1lKSD07eP5Z1oNOlxs0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA940F805C5; Thu, 20 Jul 2023 10:21:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3902BF805AE;
	Thu, 20 Jul 2023 10:21:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BE31F805B6; Thu, 20 Jul 2023 10:21:33 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A124F80567
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:21:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A124F80567
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=TL0kzQJh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=zxribTo5
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A9B032059B;
	Thu, 20 Jul 2023 08:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689841276;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CEva5Y3WwOHaTzNqNrt8HQ9HtsFyOyyFO+HmgBN2y/g=;
	b=TL0kzQJhntkpxH+PlAWsTIvtc6TYYm7BpGI7dEDTCDs1eYaMNI0DWzEeoBPqCJ1y8gBlJC
	FmF+psANVV+4aJ3IfZFtEYcgA4tlzh1uxNDK1yBkIwYbomdWcieKUz/ONniNobTkmCDWX2
	V1Nc1rMQRRuv9cz7RUinZ0hgAsJGsLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689841276;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CEva5Y3WwOHaTzNqNrt8HQ9HtsFyOyyFO+HmgBN2y/g=;
	b=zxribTo5hlSblYWciksdFhrsrS+nPloZ4bdxHCkde+6kQD1nMpPHS3ga/Cgb2lppC3zLDb
	HZWu/MLVZo9unyDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7DD23133DD;
	Thu, 20 Jul 2023 08:21:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KDReHXzuuGQmIgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 20 Jul 2023 08:21:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 06/11] ALSA: ice1712: Simplify with snd_ctl_find_id_mixer()
Date: Thu, 20 Jul 2023 10:21:03 +0200
Message-Id: <20230720082108.31346-7-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230720082108.31346-1-tiwai@suse.de>
References: <20230720082108.31346-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7FM6GCBTMTQF443OEPPRKAHQ5AT4YX5S
X-Message-ID-Hash: 7FM6GCBTMTQF443OEPPRKAHQ5AT4YX5S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7FM6GCBTMTQF443OEPPRKAHQ5AT4YX5S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace an open code with the new snd_ctl_find_id_mixer().
There is no functional change.

Also, add the missing NULL checks in psc724_set_jack_state() to deal
with error cases.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ice1712/juli.c    | 13 ++-----------
 sound/pci/ice1712/psc724.c  | 19 ++++++++-----------
 sound/pci/ice1712/quartet.c | 13 ++-----------
 sound/pci/ice1712/wm8776.c  |  6 +-----
 4 files changed, 13 insertions(+), 38 deletions(-)

diff --git a/sound/pci/ice1712/juli.c b/sound/pci/ice1712/juli.c
index f0f8324b08b6..d80ecf1edc16 100644
--- a/sound/pci/ice1712/juli.c
+++ b/sound/pci/ice1712/juli.c
@@ -408,22 +408,13 @@ static const char * const follower_vols[] = {
 static
 DECLARE_TLV_DB_SCALE(juli_master_db_scale, -6350, 50, 1);
 
-static struct snd_kcontrol *ctl_find(struct snd_card *card,
-				     const char *name)
-{
-	struct snd_ctl_elem_id sid = {0};
-
-	strscpy(sid.name, name, sizeof(sid.name));
-	sid.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	return snd_ctl_find_id(card, &sid);
-}
-
 static void add_followers(struct snd_card *card,
 			  struct snd_kcontrol *master,
 			  const char * const *list)
 {
 	for (; *list; list++) {
-		struct snd_kcontrol *follower = ctl_find(card, *list);
+		struct snd_kcontrol *follower =
+			snd_ctl_find_id_mixer(card, *list);
 		/* dev_dbg(card->dev, "add_followers - %s\n", *list); */
 		if (follower) {
 			/* dev_dbg(card->dev, "follower %s found\n", *list); */
diff --git a/sound/pci/ice1712/psc724.c b/sound/pci/ice1712/psc724.c
index 82cf365cda10..0818e42c94ca 100644
--- a/sound/pci/ice1712/psc724.c
+++ b/sound/pci/ice1712/psc724.c
@@ -177,7 +177,6 @@ static bool psc724_get_master_switch(struct snd_ice1712 *ice)
 static void psc724_set_jack_state(struct snd_ice1712 *ice, bool hp_connected)
 {
 	struct psc724_spec *spec = ice->spec;
-	struct snd_ctl_elem_id elem_id;
 	struct snd_kcontrol *kctl;
 	u16 power = spec->wm8776.regs[WM8776_REG_PWRDOWN] & ~WM8776_PWR_HPPD;
 
@@ -187,17 +186,15 @@ static void psc724_set_jack_state(struct snd_ice1712 *ice, bool hp_connected)
 	snd_wm8776_set_power(&spec->wm8776, power);
 	spec->hp_connected = hp_connected;
 	/* notify about master speaker mute change */
-	memset(&elem_id, 0, sizeof(elem_id));
-	elem_id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	strscpy(elem_id.name, "Master Speakers Playback Switch",
-						sizeof(elem_id.name));
-	kctl = snd_ctl_find_id(ice->card, &elem_id);
-	snd_ctl_notify(ice->card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
+	kctl = snd_ctl_find_id_mixer(ice->card,
+				     "Master Speakers Playback Switch");
+	if (kctl)
+		snd_ctl_notify(ice->card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
 	/* and headphone mute change */
-	strscpy(elem_id.name, spec->wm8776.ctl[WM8776_CTL_HP_SW].name,
-						sizeof(elem_id.name));
-	kctl = snd_ctl_find_id(ice->card, &elem_id);
-	snd_ctl_notify(ice->card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
+	kctl = snd_ctl_find_id_mixer(ice->card,
+				     spec->wm8776.ctl[WM8776_CTL_HP_SW].name);
+	if (kctl)
+		snd_ctl_notify(ice->card, SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
 }
 
 static void psc724_update_hp_jack_state(struct work_struct *work)
diff --git a/sound/pci/ice1712/quartet.c b/sound/pci/ice1712/quartet.c
index 20b3e8f94719..9450c4b104f7 100644
--- a/sound/pci/ice1712/quartet.c
+++ b/sound/pci/ice1712/quartet.c
@@ -766,21 +766,12 @@ static const char * const follower_vols[] = {
 static
 DECLARE_TLV_DB_SCALE(qtet_master_db_scale, -6350, 50, 1);
 
-static struct snd_kcontrol *ctl_find(struct snd_card *card,
-				     const char *name)
-{
-	struct snd_ctl_elem_id sid = {0};
-
-	strscpy(sid.name, name, sizeof(sid.name));
-	sid.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	return snd_ctl_find_id(card, &sid);
-}
-
 static void add_followers(struct snd_card *card,
 			  struct snd_kcontrol *master, const char * const *list)
 {
 	for (; *list; list++) {
-		struct snd_kcontrol *follower = ctl_find(card, *list);
+		struct snd_kcontrol *follower =
+			snd_ctl_find_id_mixer(card, *list);
 		if (follower)
 			snd_ctl_add_follower(master, follower);
 	}
diff --git a/sound/pci/ice1712/wm8776.c b/sound/pci/ice1712/wm8776.c
index 6eda86119dff..493425697bb4 100644
--- a/sound/pci/ice1712/wm8776.c
+++ b/sound/pci/ice1712/wm8776.c
@@ -34,13 +34,9 @@ static void snd_wm8776_activate_ctl(struct snd_wm8776 *wm,
 	struct snd_card *card = wm->card;
 	struct snd_kcontrol *kctl;
 	struct snd_kcontrol_volatile *vd;
-	struct snd_ctl_elem_id elem_id;
 	unsigned int index_offset;
 
-	memset(&elem_id, 0, sizeof(elem_id));
-	strscpy(elem_id.name, ctl_name, sizeof(elem_id.name));
-	elem_id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	kctl = snd_ctl_find_id(card, &elem_id);
+	kctl = snd_ctl_find_id_mixer(card, ctl_name);
 	if (!kctl)
 		return;
 	index_offset = snd_ctl_get_ioff(kctl, &kctl->id);
-- 
2.35.3

