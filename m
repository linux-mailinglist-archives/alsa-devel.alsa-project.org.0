Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C24F170D686
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 10:01:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5509AE9;
	Tue, 23 May 2023 10:01:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5509AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684828918;
	bh=Gwl3sIBLAt6uCqoBH4A0o4d0pA6eBiCydG8g3NtQGqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gGNfWnfEEpeI+Dj1D4CdtBENjWdHO4FETuodENyCIV1smysPX+/ZPXO83+oOyGwZ1
	 Se03omTFojiqEUbPpqWNqbDA3FSkEeSUqYP9uEaIfsx3Sc7wHCFghcvzfTN5UUX8CG
	 HWMydczmPgvQXO0XMBmr0ajYYyHyIhvLfRxC8YwA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4107F806B1; Tue, 23 May 2023 09:55:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A944F805CB;
	Tue, 23 May 2023 09:55:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DE9FF80570; Tue, 23 May 2023 09:55:26 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D36BF8057B
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 09:54:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D36BF8057B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=y1cY/y9B;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=f4gFMx00
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 30F8921A67;
	Tue, 23 May 2023 07:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684828451;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sa3pwc1C5HhGxbLR03Hm6eyUQzwJ+yyOfNOAHUZ83fg=;
	b=y1cY/y9BBnkXdpqA9huOH9Pk87lfjP2H1VdxMtHiahqPP3DdE2zkn43/JVpxy4UIRZgFxJ
	G4HgsF9r9jHl6oSeTvNWd6BTeyPwFowKWPrgM2v59cCdylobh6mtWJgK1UoJBG9zdCmRz3
	jMtoVOsGNZjsPQROogmcLfS6+FlbHLU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684828451;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sa3pwc1C5HhGxbLR03Hm6eyUQzwJ+yyOfNOAHUZ83fg=;
	b=f4gFMx00Sm+Md8jzCk7Ggm5hQtj3eNjq6UkQcF5hJ2hy7VNTa5zXernYeQ9HfssNmiJUGl
	hYc7kWT8RYOOQkDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E3F3C13588;
	Tue, 23 May 2023 07:54:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id SFO7NSJxbGT4KgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 23 May 2023 07:54:10 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 29/37] ALSA: seq: Add UMP group number to snd_seq_port_info
Date: Tue, 23 May 2023 09:53:50 +0200
Message-Id: <20230523075358.9672-30-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230523075358.9672-1-tiwai@suse.de>
References: <20230523075358.9672-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 75GKAHSTW4RJPM6EIZ2PAQYWTZTCNDTI
X-Message-ID-Hash: 75GKAHSTW4RJPM6EIZ2PAQYWTZTCNDTI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/75GKAHSTW4RJPM6EIZ2PAQYWTZTCNDTI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add yet more new filed "ump_group" to snd_seq_port_info for specifying
the associated UMP Group number for each sequencer port.  This will be
referred in the upcoming automatic UMP conversion in sequencer core.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/sound/asequencer.h | 3 ++-
 sound/core/seq/seq_ports.c      | 9 +++++++--
 sound/core/seq/seq_ports.h      | 3 ++-
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/include/uapi/sound/asequencer.h b/include/uapi/sound/asequencer.h
index eae1e0b0bf37..2470eaa5edc5 100644
--- a/include/uapi/sound/asequencer.h
+++ b/include/uapi/sound/asequencer.h
@@ -478,7 +478,8 @@ struct snd_seq_port_info {
 	unsigned int flags;		/* misc. conditioning */
 	unsigned char time_queue;	/* queue # for timestamping */
 	unsigned char direction;	/* port usage direction (r/w/bidir) */
-	char reserved[58];		/* for future use */
+	unsigned char ump_group;	/* 0 = UMP EP (no conversion), 1-16 = UMP group number */
+	char reserved[57];		/* for future use */
 };
 
 
diff --git a/sound/core/seq/seq_ports.c b/sound/core/seq/seq_ports.c
index 5574341f49eb..9b80f8275026 100644
--- a/sound/core/seq/seq_ports.c
+++ b/sound/core/seq/seq_ports.c
@@ -356,8 +356,12 @@ int snd_seq_set_port_info(struct snd_seq_client_port * port,
 	port->time_real = (info->flags & SNDRV_SEQ_PORT_FLG_TIME_REAL) ? 1 : 0;
 	port->time_queue = info->time_queue;
 
-	/* direction */
+	/* UMP direction and group */
 	port->direction = info->direction;
+	port->ump_group = info->ump_group;
+	if (port->ump_group > SNDRV_UMP_MAX_GROUPS)
+		port->ump_group = 0;
+
 	/* fill default port direction */
 	if (!port->direction) {
 		if (info->capability & SNDRV_SEQ_PORT_CAP_READ)
@@ -403,8 +407,9 @@ int snd_seq_get_port_info(struct snd_seq_client_port * port,
 		info->time_queue = port->time_queue;
 	}
 
-	/* direction */
+	/* UMP direction and group */
 	info->direction = port->direction;
+	info->ump_group = port->ump_group;
 
 	return 0;
 }
diff --git a/sound/core/seq/seq_ports.h b/sound/core/seq/seq_ports.h
index dce733ab2398..c6c138edceab 100644
--- a/sound/core/seq/seq_ports.h
+++ b/sound/core/seq/seq_ports.h
@@ -72,8 +72,9 @@ struct snd_seq_client_port {
 	int midi_voices;
 	int synth_voices;
 		
-	/* direction */
+	/* UMP direction and group */
 	unsigned char direction;
+	unsigned char ump_group;
 };
 
 struct snd_seq_client;
-- 
2.35.3

