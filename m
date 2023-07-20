Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 926D475A925
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 10:25:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D564D1D9;
	Thu, 20 Jul 2023 10:24:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D564D1D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689841542;
	bh=FX+ZOW47F066Qtxxzpu+vOWohmB18oe53AjabejB1+Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N2A4XZcEFCfmVu3TigAndNNhLFTAdAc5/zKAiA0S+s/oZpe4Nu8KMALid5Op0KZfD
	 p+ULZr8pEOjLde6Wzzbce6zgHNRMrSw8ljC4viOYpl1xNUbZ3vebssAjSAhTmikkeL
	 SFJ7FjrwsNCmotqkno/XGzvl13mjMuc5L1W9Bryc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66833F8057A; Thu, 20 Jul 2023 10:23:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2712DF80563;
	Thu, 20 Jul 2023 10:23:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A804F8032D; Thu, 20 Jul 2023 10:23:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 510DBF8056F
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:21:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 510DBF8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=QTpIVNeN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=9nA7caE3
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 765B42059A;
	Thu, 20 Jul 2023 08:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689841276;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DB+vYfx1hn3LaFRUZQuOUy/637bSLU0C9BrNp0ZxXZ8=;
	b=QTpIVNeNhEptHxDjZi5fxl/eEdgNxHcyqIKq788aT/oJrbL+lHuCo0kU6LLJBmbX6rbdbm
	h6Y05RbyjkCajt/ecRM6Zf9Xj8EPslE+3Ns12vDnWO6hIMOuhXeHYc/+GDsgQzye/3ZqjY
	mPugfpm1Qym2upPcQCF4lntTDXoKv7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689841276;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DB+vYfx1hn3LaFRUZQuOUy/637bSLU0C9BrNp0ZxXZ8=;
	b=9nA7caE3u7jJNOZKxtIPSZDZpOnrUDJ0sjkSgdQJvY+4cDbiNviQKCpGG0H9sv0NJA23H/
	N5BkkY+8BdUAwxDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 470E3133DD;
	Thu, 20 Jul 2023 08:21:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id OIcWDHzuuGQmIgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 20 Jul 2023 08:21:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 05/11] ALSA: es1968: Simplify with snd_ctl_find_id_mixer()
Date: Thu, 20 Jul 2023 10:21:02 +0200
Message-Id: <20230720082108.31346-6-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230720082108.31346-1-tiwai@suse.de>
References: <20230720082108.31346-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: H42D52EXQ2M6MF6MS6XLS63VGLJRJWKP
X-Message-ID-Hash: H42D52EXQ2M6MF6MS6XLS63VGLJRJWKP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H42D52EXQ2M6MF6MS6XLS63VGLJRJWKP/>
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
 sound/pci/es1968.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/sound/pci/es1968.c b/sound/pci/es1968.c
index 4a7e20bb11bc..4bc0f53c223b 100644
--- a/sound/pci/es1968.c
+++ b/sound/pci/es1968.c
@@ -2005,9 +2005,6 @@ snd_es1968_mixer(struct es1968 *chip)
 {
 	struct snd_ac97_bus *pbus;
 	struct snd_ac97_template ac97;
-#ifndef CONFIG_SND_ES1968_INPUT
-	struct snd_ctl_elem_id elem_id;
-#endif
 	int err;
 	static const struct snd_ac97_bus_ops ops = {
 		.write = snd_es1968_ac97_write,
@@ -2027,14 +2024,10 @@ snd_es1968_mixer(struct es1968 *chip)
 
 #ifndef CONFIG_SND_ES1968_INPUT
 	/* attach master switch / volumes for h/w volume control */
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

