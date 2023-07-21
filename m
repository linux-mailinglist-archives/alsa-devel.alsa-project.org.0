Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F50B75BF79
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 09:21:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A305206;
	Fri, 21 Jul 2023 09:21:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A305206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689924111;
	bh=AdAa4a4l6t+0i6luIonpBKcVhVziMDJAtLhKuk14D78=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=EBX7/DG8JkeXTyjPU/QIFhWE/rmyY3PeQ84SJvEb6tB2l/tQh1xrgc88njLqN6Vk8
	 hZYkMy7T5vwGijyvD/JWBEpLgEsbsOtnpwKLWYU64dyqEefvByXL2dA2hB+9NLUJ4D
	 HVuptUt0JjsuIy0NRVN0RGN37RQhLyhT9UfQRsNk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B461F80578; Fri, 21 Jul 2023 09:20:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BC4CF8055B;
	Fri, 21 Jul 2023 09:20:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27EE1F8047D; Fri, 21 Jul 2023 09:17:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3809FF804DA
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 09:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3809FF804DA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=bLYT8e+j;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=kG9MovDL
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F11BD219BF;
	Fri, 21 Jul 2023 07:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689923827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sWOtayF0fMT2IzKmQM67ZAWCMTbEJtvjXLr+Lli/Zi8=;
	b=bLYT8e+jgFO3pSqFs6Wp76zk0uPJkpyHlChpppS+IQ20EbOs1FV/Ho5k2hMny/NPok+ISg
	vtDJwTBwCgK3g4mMD61X89Ag73VFjouflQrN/YZACObTltrs7BQXkYZpZCj4tCYEgOfKxo
	qZyLvYFtFC2AcIv9T5AuKzv49tAKWSA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689923827;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sWOtayF0fMT2IzKmQM67ZAWCMTbEJtvjXLr+Lli/Zi8=;
	b=kG9MovDLIlaaVoH04IzxVszUQcZuJq8BMWb/+JVpSOYNf3LQOcXU3EWGR7q5apNA3lS9tc
	+L/txKlYb3xGUXAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D7B2F134B0;
	Fri, 21 Jul 2023 07:17:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id IMXDM/MwumRdLgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 21 Jul 2023 07:17:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/4] ALSA: ac97: Use the standard snd_ctl_add_followers()
 helper
Date: Fri, 21 Jul 2023 09:16:41 +0200
Message-Id: <20230721071643.3631-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230721071643.3631-1-tiwai@suse.de>
References: <20230721071643.3631-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U6HMLU2HAERADKQXU7M7QXURNI3KCJON
X-Message-ID-Hash: U6HMLU2HAERADKQXU7M7QXURNI3KCJON
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U6HMLU2HAERADKQXU7M7QXURNI3KCJON/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of open-code, use the new standard helper to manage vmaster
stuff for code simplification.

Except for a debug print, there should be no functional change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: drop unnecessary check of the error condition

 sound/pci/ac97/ac97_patch.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/sound/pci/ac97/ac97_patch.c b/sound/pci/ac97/ac97_patch.c
index ccfd9c7bf900..1d786bd5ce3e 100644
--- a/sound/pci/ac97/ac97_patch.c
+++ b/sound/pci/ac97/ac97_patch.c
@@ -3440,7 +3440,6 @@ static int snd_ac97_add_vmaster(struct snd_ac97 *ac97, char *name,
 				const char * const *followers)
 {
 	struct snd_kcontrol *kctl;
-	const char * const *s;
 	int err;
 
 	kctl = snd_ctl_make_virtual_master(name, tlv);
@@ -3450,20 +3449,7 @@ static int snd_ac97_add_vmaster(struct snd_ac97 *ac97, char *name,
 	if (err < 0)
 		return err;
 
-	for (s = followers; *s; s++) {
-		struct snd_kcontrol *sctl;
-
-		sctl = snd_ac97_find_mixer_ctl(ac97, *s);
-		if (!sctl) {
-			dev_dbg(ac97->bus->card->dev,
-				"Cannot find follower %s, skipped\n", *s);
-			continue;
-		}
-		err = snd_ctl_add_follower(kctl, sctl);
-		if (err < 0)
-			return err;
-	}
-	return 0;
+	return snd_ctl_add_followers(ac97->bus->card, kctl, followers);
 }
 
 static int patch_vt1616_specific(struct snd_ac97 * ac97)
-- 
2.35.3

