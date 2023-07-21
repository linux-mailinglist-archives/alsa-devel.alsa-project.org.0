Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA7275BF77
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 09:21:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FDAA1F7;
	Fri, 21 Jul 2023 09:20:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FDAA1F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689924057;
	bh=qFSg4Nrsi/B+e2tlyqbg1y99VJaof9FeiooHLd1AtWQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=oB/P55Tq/tZ06QOLPf4OChx8zpqEbuvjlhEvzkDmN3GnHjldYQSVaPkH3ggNgpIMA
	 mLiwiU71PIkgXc+iKEg2fkKWzZa6yIsbCuszhanqW0q6Kxt0eM5nR6jIa4ILJPjdf3
	 xWG2Cd6h7ELtnum/DnNwPQmnTcn7fCHnF2+I1weQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12CA9F8053B; Fri, 21 Jul 2023 09:20:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B760EF8032D;
	Fri, 21 Jul 2023 09:20:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE71FF80527; Fri, 21 Jul 2023 09:17:13 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 944CCF8027B
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 09:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 944CCF8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=OwoZ1ohk;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=zzWcHCqM
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1A5E1219C9;
	Fri, 21 Jul 2023 07:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689923828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ArAGPYt99/duFoPW1QhLnK4nczAggyoc5eHLNDPC00=;
	b=OwoZ1ohk2T8GUhVGS0lyHPv250GAMCoK9MGCPq3txH5vUwz3s/2oksIzPojL1FaVLmHGqv
	ihP71DY18wKHu/fD/oZJLqfHUTXoq97hf8vfWf2NLQSMx+c8RmJoXNcjfjD6AFyrDGCx+2
	SU/qfg5FYpiH99dSWMOMG52Y2kU32BY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689923828;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ArAGPYt99/duFoPW1QhLnK4nczAggyoc5eHLNDPC00=;
	b=zzWcHCqMwQljuQsENbuVo/ZseoCvi38bsz0jeG/mMslz5+4eGDu2nroX/2A3qDgWkYvETF
	1Ap29PpZHO4kq8AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F3EF4139AF;
	Fri, 21 Jul 2023 07:17:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id kM7FOvMwumRdLgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 21 Jul 2023 07:17:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 3/4] ALSA: ca0106: Use the standard snd_ctl_add_followers()
 helper
Date: Fri, 21 Jul 2023 09:16:42 +0200
Message-Id: <20230721071643.3631-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230721071643.3631-1-tiwai@suse.de>
References: <20230721071643.3631-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X7GYY3I5WSE254ALRFBJGFC7ACMNYUTE
X-Message-ID-Hash: X7GYY3I5WSE254ALRFBJGFC7ACMNYUTE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X7GYY3I5WSE254ALRFBJGFC7ACMNYUTE/>
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

