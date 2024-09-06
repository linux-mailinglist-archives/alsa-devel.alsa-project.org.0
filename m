Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1640596EDAA
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2024 10:20:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66D40E76;
	Fri,  6 Sep 2024 10:20:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66D40E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725610855;
	bh=CZUjl+4EhmgtMpSHH9kcWKRwm/Z3BbCa1D866Dj09Zo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=YBnTytm44OzUsXh20qW4+2kWdirtos+qFNWzxkmbM1h82CRdtgTKkj90Izs8FwFiX
	 0Maa9h3D7wMc2zXEUMfTXdTHp8Pz0+/l/nH9BnXnAQZBldK9oeixuCjCzbIMJyjuQ1
	 ZIjEvjBysutuAF86Mqm+FqoeWkqqGwFwhtYzFdIc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E99A5F805E6; Fri,  6 Sep 2024 10:20:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 029B7F805D6;
	Fri,  6 Sep 2024 10:20:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B933F8016C; Fri,  6 Sep 2024 10:20:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1B32F8014C
	for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2024 10:20:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1B32F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=FGOjczYm;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=EFxRD3lT;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=ifpZkLDC;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=VOo47Rnx
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7B61E1F8A4;
	Fri,  6 Sep 2024 08:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1725610803; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sor30VvyarrGTl9Ilns1HZZh7sWJmohyoTnXRVirQ7Y=;
	b=FGOjczYmsykyaLMMIRifuJVHpXBl2eC5w1mwLjcVMV400x3JdlOIcF05NqMbtBx35n1HIP
	Ub5AoGQwJsSM7Ep36wvwSAI5crtgNN2ONB5MBkPZsATTkgvzCKhzijmN1rUFuKusl3ErvZ
	w30h6AtOaWB9h5R0ZdY2RRnjfP/cSWc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725610803;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sor30VvyarrGTl9Ilns1HZZh7sWJmohyoTnXRVirQ7Y=;
	b=EFxRD3lTfPldIrf6RI7GqDBkzk0M8lryovuODYvS9LCF34R0346Agnwnp4ueBJ4NFMg64J
	Oom8oUXZeTMTA1DQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ifpZkLDC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VOo47Rnx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1725610802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sor30VvyarrGTl9Ilns1HZZh7sWJmohyoTnXRVirQ7Y=;
	b=ifpZkLDCRGlbL6ZNCx99uH9XjqsRTM/Bf81rYURx02k4BAy/wYXfsa3uBaOKjWnhlfckNF
	lnla+9W6SrLy2iskacVB0P4OkyKEQYCRHHpG9WFJ2Hb8uC8PgtLRVe32QlQBCpbucGm3vq
	/f746Lfm52quiupmS3XNh+m6IX0MZOY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725610802;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sor30VvyarrGTl9Ilns1HZZh7sWJmohyoTnXRVirQ7Y=;
	b=VOo47Rnx+5jhrFN//uEQ4r7JQSHC9s+Xr42kf5btPwVcF6a4rsYsnP4rJi0EWPbIbqz1oN
	gBRwGKdzq90UEIBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5303413A7A;
	Fri,  6 Sep 2024 08:20:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2CT/EjK72maIRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 06 Sep 2024 08:20:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] pcm: dmix: Don't clear scpm->info flag
Date: Fri,  6 Sep 2024 10:20:37 +0200
Message-ID: <20240906082042.14256-2-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240906082042.14256-1-tiwai@suse.de>
References: <20240906082042.14256-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7B61E1F8A4
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_ONE(0.00)[1];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: MCGS4UGYTRGDMJDL6MIGBESQMJ54CEES
X-Message-ID-Hash: MCGS4UGYTRGDMJDL6MIGBESQMJ54CEES
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MCGS4UGYTRGDMJDL6MIGBESQMJ54CEES/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

spcm->info bits should be a copy of the slave PCM info as is.
While we clear the unsupported SND_PCM_INFO_PAUSE bit there, it should
be rather cleared only for the exposed info to apps, not spcm->info.

Fixes: 982786e9ebff ("Fix bogus pause flag on dmix")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 src/pcm/pcm_direct.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c
index 17e677f60b19..5b8ec08fe2b8 100644
--- a/src/pcm/pcm_direct.c
+++ b/src/pcm/pcm_direct.c
@@ -1018,7 +1018,7 @@ int snd_pcm_direct_hw_refine(snd_pcm_t *pcm, snd_pcm_hw_params_t *params)
 	}
 	dshare->timer_ticks = hw_param_interval(params, SND_PCM_HW_PARAM_PERIOD_SIZE)->max / dshare->slave_period_size;
 	params->info = dshare->shmptr->s.info;
-	params->info &= ~SND_PCM_INFO_RESUME;
+	params->info &= ~(SND_PCM_INFO_RESUME | SND_PCM_INFO_PAUSE);
 #ifdef REFINE_DEBUG
 	snd_output_puts(log, "DMIX REFINE (end):\n");
 	snd_pcm_hw_params_dump(params, log);
@@ -1032,7 +1032,7 @@ int snd_pcm_direct_hw_params(snd_pcm_t *pcm, snd_pcm_hw_params_t * params)
 	snd_pcm_direct_t *dmix = pcm->private_data;
 
 	params->info = dmix->shmptr->s.info;
-	params->info &= ~SND_PCM_INFO_RESUME;
+	params->info &= ~(SND_PCM_INFO_RESUME | SND_PCM_INFO_PAUSE);
 	params->rate_num = dmix->shmptr->s.rate;
 	params->rate_den = 1;
 	params->fifo_size = 0;
@@ -1156,8 +1156,6 @@ int snd_pcm_direct_resume(snd_pcm_t *pcm)
 /* copy the slave setting */
 static void save_slave_setting(snd_pcm_direct_t *dmix, snd_pcm_t *spcm)
 {
-	spcm->info &= ~SND_PCM_INFO_PAUSE;
-
 	COPY_SLAVE(access);
 	COPY_SLAVE(format);
 	COPY_SLAVE(subformat);
-- 
2.43.0

