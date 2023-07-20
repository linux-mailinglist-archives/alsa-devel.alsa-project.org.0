Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFFF75A93E
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 10:27:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14BE41F7;
	Thu, 20 Jul 2023 10:26:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14BE41F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689841659;
	bh=qFSg4Nrsi/B+e2tlyqbg1y99VJaof9FeiooHLd1AtWQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ffu2mYQsrR0i+/hnB0kBaSmeJ3Lzgu+LiqOtaehROWDtObPzDt+qFv5I3U7qDm0th
	 UDG58cGWKTchK9b9wAG42AKcxdZD6RzuUtzkHa4ni5+7BOC8h9fTrzf9+B0Y8jfeMq
	 Sv6dlh1xusFaZC/+WwHXmnFvd5aqpgbdsfC0uLP4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3597EF8055B; Thu, 20 Jul 2023 10:26:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7562BF80544;
	Thu, 20 Jul 2023 10:26:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DB80F80520; Thu, 20 Jul 2023 10:26:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A930F800D2
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:25:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A930F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Nry2dmEc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=TrSUc2Ss
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 16E8522A23;
	Thu, 20 Jul 2023 08:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689841557;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ArAGPYt99/duFoPW1QhLnK4nczAggyoc5eHLNDPC00=;
	b=Nry2dmEcmrNjRjLdY84HQe1tVeN2P+CpXy4VZr89juLl4zl6zMhjZP5vvER+hNu8AqFw4m
	ZNzo6oCpW5e7t/bBSuHMxa3Ad+ReCpN4Z0xWZIFzphEXPRUPPO1x/dWRRN8Q1a+WZx+51x
	+4Tju+eSmfQZn/R6X1GsiyFCo2S0FqU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689841557;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ArAGPYt99/duFoPW1QhLnK4nczAggyoc5eHLNDPC00=;
	b=TrSUc2SsBWym/VP6yWt9MKNzXLkW1SfwZFZhqhq5MGMc1tJz5/xE32EJcVT8VJ513+6SVD
	YJ7AnFIynH59IeAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EE41213924;
	Thu, 20 Jul 2023 08:25:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id oCVHOZTvuGRrJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 20 Jul 2023 08:25:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 3/4] ALSA: ca0106: Use the standard snd_ctl_add_followers()
 helper
Date: Thu, 20 Jul 2023 10:25:53 +0200
Message-Id: <20230720082554.31891-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230720082554.31891-1-tiwai@suse.de>
References: <20230720082554.31891-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: C26JJQGGQL4INIGM5KQE3LH2HA3RL5C2
X-Message-ID-Hash: C26JJQGGQL4INIGM5KQE3LH2HA3RL5C2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C26JJQGGQL4INIGM5KQE3LH2HA3RL5C2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of open-code, use the new standard helper to manage vmaster
stuff for code simplification.

Also, handle the errors from the helper more properly instead of
silently ignoring.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ca0106/ca0106_mixer.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/sound/pci/ca0106/ca0106_mixer.c b/sound/pci/ca0106/ca0106_mixer.c
index 2f37d2c3dd38..1d5a899b2c24 100644
--- a/sound/pci/ca0106/ca0106_mixer.c
+++ b/sound/pci/ca0106/ca0106_mixer.c
@@ -751,17 +751,6 @@ static const char * const follower_sws[] = {
 	NULL
 };
 
-static void add_followers(struct snd_card *card,
-			  struct snd_kcontrol *master, const char * const *list)
-{
-	for (; *list; list++) {
-		struct snd_kcontrol *follower =
-			snd_ctl_find_id_mixer(card, *list);
-		if (follower)
-			snd_ctl_add_follower(master, follower);
-	}
-}
-
 int snd_ca0106_mixer(struct snd_ca0106 *emu)
 {
 	int err;
@@ -843,7 +832,9 @@ int snd_ca0106_mixer(struct snd_ca0106 *emu)
 	err = snd_ctl_add(card, vmaster);
 	if (err < 0)
 		return err;
-	add_followers(card, vmaster, follower_vols);
+	err = snd_ctl_add_followers(card, vmaster, follower_vols);
+	if (err < 0)
+		return err;
 
 	if (emu->details->spi_dac) {
 		vmaster = snd_ctl_make_virtual_master("Master Playback Switch",
@@ -853,7 +844,9 @@ int snd_ca0106_mixer(struct snd_ca0106 *emu)
 		err = snd_ctl_add(card, vmaster);
 		if (err < 0)
 			return err;
-		add_followers(card, vmaster, follower_sws);
+		err = snd_ctl_add_followers(card, vmaster, follower_sws);
+		if (err < 0)
+			return err;
 	}
 
 	strcpy(card->mixername, "CA0106");
-- 
2.35.3

