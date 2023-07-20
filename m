Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6F375A91F
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 10:24:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31A6293A;
	Thu, 20 Jul 2023 10:24:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31A6293A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689841493;
	bh=lJrH3gDCtAkg+90x5AWcNs82XlqZt1pFdmKcdZ4bYsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GpQLIYkxXBfeeXDsVOf5IsXz4Y/nYlObs3bDAbfg/dQVQc7FywFQYZuVSFryFAxyJ
	 2OrY1odTHaN6h/neayHvYu0xYZec8ezm4y7Xg3LY9B8xPsQTgKknIvsJ74ogUkjDbF
	 y2eqY/b1YIG+PVECbdIkb8oPFxVaSK2hWf7ucnn8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38922F805F5; Thu, 20 Jul 2023 10:21:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1713F805EE;
	Thu, 20 Jul 2023 10:21:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D3E35F805D7; Thu, 20 Jul 2023 10:21:39 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E12ABF80579
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:21:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E12ABF80579
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=xdDDKW8C;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=mEdgwJQ7
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CD73B2059C;
	Thu, 20 Jul 2023 08:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689841276;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3r/FtEDnCnsRxswu2gYU+CsO43aX0mwDg/BHPXp6Fvo=;
	b=xdDDKW8CYYSU1d9rpahW2tTgJN6cYaQEc+xS5wppwBqCO5eiQe00V1xQPumD6e+GxXltoF
	xcju88DHobwOP0W4qgmfznIByZXXWyysdM2bD/s47DP8g8Ny/fjIlSzHcA9ezoyEgMgkGF
	QtUnK7arrJ/2Eht8QzwpvlX/RU7EDnk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689841276;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3r/FtEDnCnsRxswu2gYU+CsO43aX0mwDg/BHPXp6Fvo=;
	b=mEdgwJQ7U7t4tQP5g22INg5iAbF3fvVTZ/6u8Ub6q4oVGgFQmXiqYsN7lioD0ZovB6xBxP
	H+6sXtp7k1sN4hCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ACCED13924;
	Thu, 20 Jul 2023 08:21:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id aJFfKXzuuGQmIgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 20 Jul 2023 08:21:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 07/11] ALSA: maestro3: Simplify with snd_ctl_find_id_mixer()
Date: Thu, 20 Jul 2023 10:21:04 +0200
Message-Id: <20230720082108.31346-8-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230720082108.31346-1-tiwai@suse.de>
References: <20230720082108.31346-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DZLYMB574QS5NAHBMWTUUWKGZMSRAFN6
X-Message-ID-Hash: DZLYMB574QS5NAHBMWTUUWKGZMSRAFN6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DZLYMB574QS5NAHBMWTUUWKGZMSRAFN6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace an open code with the new snd_ctl_find_id_mixer().
There is no functional change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/maestro3.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/pci/maestro3.c b/sound/pci/maestro3.c
index 261850775c80..305cbd24a391 100644
--- a/sound/pci/maestro3.c
+++ b/sound/pci/maestro3.c
@@ -2029,9 +2029,6 @@ static int snd_m3_mixer(struct snd_m3 *chip)
 {
 	struct snd_ac97_bus *pbus;
 	struct snd_ac97_template ac97;
-#ifndef CONFIG_SND_MAESTRO3_INPUT
-	struct snd_ctl_elem_id elem_id;
-#endif
 	int err;
 	static const struct snd_ac97_bus_ops ops = {
 		.write = snd_m3_ac97_write,
@@ -2054,14 +2051,10 @@ static int snd_m3_mixer(struct snd_m3 *chip)
 	snd_ac97_write(chip->ac97, AC97_PCM, 0);
 
 #ifndef CONFIG_SND_MAESTRO3_INPUT
-	memset(&elem_id, 0, sizeof(elem_id));
-	elem_id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	strcpy(elem_id.name, "Master Playback Switch");
-	chip->master_switch = snd_ctl_find_id(chip->card, &elem_id);
-	memset(&elem_id, 0, sizeof(elem_id));
-	elem_id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	strcpy(elem_id.name, "Master Playback Volume");
-	chip->master_volume = snd_ctl_find_id(chip->card, &elem_id);
+	chip->master_switch = snd_ctl_find_id_mixer(chip->card,
+						    "Master Playback Switch");
+	chip->master_volume = snd_ctl_find_id_mixer(chip->card,
+						    "Master Playback Volume");
 #endif
 
 	return 0;
-- 
2.35.3

