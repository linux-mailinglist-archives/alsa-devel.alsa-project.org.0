Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EE896EDA7
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2024 10:20:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00C22A4B;
	Fri,  6 Sep 2024 10:20:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00C22A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725610843;
	bh=goNlHk0S5E+hfeAVClsIEG2X7rN6vT90nmYDJjJX/sI=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gK0GLjQaKmHH5aIbtBXSLPIKapcvXLZ0QB4JFNrg2F2B5k+Ax5gm6AKUfHoMtw4SC
	 JCQFfFyg9+F9Br1DOB+omkBigUgoP11HQ1wnTbY1zC+OKVtrTaoS0JdXo2nQaHVkhl
	 PeaSW6Ich2GJoICn3QDyCTqji6Zimsb5KayVxYnQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BA34F805AF; Fri,  6 Sep 2024 10:20:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11A47F805A8;
	Fri,  6 Sep 2024 10:20:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9FA8F80199; Fri,  6 Sep 2024 10:20:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CD88BF80107
	for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2024 10:20:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD88BF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=JuGRxzTk;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/B0btBri;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=MX9Rs5BC;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=zfTG1e0x
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4DBDC21966;
	Fri,  6 Sep 2024 08:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1725610803; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=ND4je+swVBZb8clgnn3ZbqeTVFs1dVgY8HvigYkoGcQ=;
	b=JuGRxzTk5S4kP3c+VvNsHTw2/Nq+roUekgQydlVSX8BmBklWxgXLJ+9AN49sQfQF8IZvaZ
	X9T7bICxNtGo+AAeTtHbppa5j/fSNxfanv68DoQblooWDN6lcuxfbmrbKjpu9vulA7XPlP
	4LLrcZAyAwmm0xh+eeemGBKBkoI4Tas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725610803;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=ND4je+swVBZb8clgnn3ZbqeTVFs1dVgY8HvigYkoGcQ=;
	b=/B0btBrifpwGVhwDF74TnTPJIz+TeL36UPNglsYydmFEiUeyPUqWCIldr7e/RPICV3YiH+
	iWJ27GV40wJOx1DQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MX9Rs5BC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zfTG1e0x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1725610802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=ND4je+swVBZb8clgnn3ZbqeTVFs1dVgY8HvigYkoGcQ=;
	b=MX9Rs5BCox99HSJ8813QTOSkBiPIZSyE3RW9FVEGnGJop5YVBZXkZ8YH7VOshMHTNrcvDB
	9oKR9DK3NPKImMkrfXkGB/WrJT+O5PEUioHFKMKd5y0qHwprsQ9ZbX+MDouKjBfPoyIUNn
	JRbmxh0Kx+taVpGChyBYT+266Y7xLkY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725610802;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=ND4je+swVBZb8clgnn3ZbqeTVFs1dVgY8HvigYkoGcQ=;
	b=zfTG1e0xnohohLfvuRikiuGiqIXSasW1nBEEWxjspog79+sSlz+QdE2/UoG5tmt3XcYkJO
	9Ba2skGLsZraTyAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3241D136A8;
	Fri,  6 Sep 2024 08:20:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rgr6CjK72maIRAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 06 Sep 2024 08:20:02 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] pcm: dmix: Fix resume with multiple instances
Date: Fri,  6 Sep 2024 10:20:36 +0200
Message-ID: <20240906082042.14256-1-tiwai@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4DBDC21966
X-Spamd-Result: default: False [-5.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
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
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.de:mid,nxp.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: UW454SJLRK7Z2UEMQKVHFFXHQCPOKVCS
X-Message-ID-Hash: UW454SJLRK7Z2UEMQKVHFFXHQCPOKVCS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UW454SJLRK7Z2UEMQKVHFFXHQCPOKVCS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The fix for PCM dmix suspend/resume checks spcm->info bit of
SND_PCM_INFO_RESUME for applying a workaround for drivers with the
full resume support.  This assumed that scpm->info is exposed from the
underlying slave PCM device.

The above is true for the first opened instance, but for the second
opened instance, it's a copy from the saved data in shmem.  And, we
dropped SND_PCM_INFO_RESUME bit there to assure not to expose the full
resume capability to applications.  This resulted in the
inconsistencies, and when the second instance is resumed at first, it
misses the snd_pcm_resume() call, hence the driver doesn't react
properly any longer.

For addressing it, we keep SND_PCM_INFO_RESUME bit in shmptr->s.info
bits as is, while dropping the bit exposed to apps in
snd_pcm_direct_hw_refine() and *_hw_params() callbacks.

Fixes: 6d1d620eadf3 ("pcm: dmix: resume workaround for buggy driver")
Reported-and-tested-by: Chancel Liu <chancel.liu@nxp.com>
Closes: https://lore.kernel.org/DB9PR04MB94988752ED7C43B399E0BC00E3942@DB9PR04MB9498.eurprd04.prod.outlook.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 src/pcm/pcm_direct.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c
index e53e59238119..17e677f60b19 100644
--- a/src/pcm/pcm_direct.c
+++ b/src/pcm/pcm_direct.c
@@ -1018,6 +1018,7 @@ int snd_pcm_direct_hw_refine(snd_pcm_t *pcm, snd_pcm_hw_params_t *params)
 	}
 	dshare->timer_ticks = hw_param_interval(params, SND_PCM_HW_PARAM_PERIOD_SIZE)->max / dshare->slave_period_size;
 	params->info = dshare->shmptr->s.info;
+	params->info &= ~SND_PCM_INFO_RESUME;
 #ifdef REFINE_DEBUG
 	snd_output_puts(log, "DMIX REFINE (end):\n");
 	snd_pcm_hw_params_dump(params, log);
@@ -1031,6 +1032,7 @@ int snd_pcm_direct_hw_params(snd_pcm_t *pcm, snd_pcm_hw_params_t * params)
 	snd_pcm_direct_t *dmix = pcm->private_data;
 
 	params->info = dmix->shmptr->s.info;
+	params->info &= ~SND_PCM_INFO_RESUME;
 	params->rate_num = dmix->shmptr->s.rate;
 	params->rate_den = 1;
 	params->fifo_size = 0;
@@ -1183,8 +1185,6 @@ static void save_slave_setting(snd_pcm_direct_t *dmix, snd_pcm_t *spcm)
 	COPY_SLAVE(buffer_time);
 	COPY_SLAVE(sample_bits);
 	COPY_SLAVE(frame_bits);
-
-	dmix->shmptr->s.info &= ~SND_PCM_INFO_RESUME;
 }
 
 #undef COPY_SLAVE
-- 
2.43.0

