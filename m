Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8BD90FE17
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 09:57:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6162C93A;
	Thu, 20 Jun 2024 09:57:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6162C93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718870249;
	bh=2f1Od9j0kNZ9C125auahTDD/lvFjwmRaaRilrw7OwEQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DjLTNDeFkgIVbi33xgKZQPpDQEYxpHx82B//k/xvk6+Wygah3/PL1Jv2uA590WGcz
	 /DMvoZACQBNARqovg9XlKs9xYyuj1Wpr5BYleXraTSTRGaWKghUgDjRMiqxVqYBROm
	 Ydln02jAD6C8UtFS/nO/gARAW00roIwyjVOZMf9U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60AD8F805B2; Thu, 20 Jun 2024 09:57:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D45BF8059F;
	Thu, 20 Jun 2024 09:57:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 572ABF8023A; Thu, 20 Jun 2024 09:56:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1F31F800ED
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 09:56:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1F31F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=dZslguGu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=FbcfHPT3;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=dZslguGu;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=FbcfHPT3
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 11F5D1F7DF;
	Thu, 20 Jun 2024 07:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718870195;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BiPM555ZzJD1oXU+hzRkT4qSznj4dFJ5BmzsuFrO3Kc=;
	b=dZslguGuIC0PnEDmP/h3r9mHMqQxpC0J+6i+uqdL2ef3EQzRb+0FRTiVuudmVB/iZ/CanX
	mWg8I9wddNCJNpRoYD8coKj2lPrYwugByUybmIK0OnX9K8AAUrNJ4OFY2xT4joRhv4PC/0
	D9JmHWCPj/HrK2FvTM1IWD2CqqHUzsk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718870195;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BiPM555ZzJD1oXU+hzRkT4qSznj4dFJ5BmzsuFrO3Kc=;
	b=FbcfHPT3eu99VM/TclJn0m8xWux1UcazMB9ZAqpJrN8v33Vw0AHH9da4E4anPe3E86gylb
	cQ8iiJhmSHfVZ7Bw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1718870195;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BiPM555ZzJD1oXU+hzRkT4qSznj4dFJ5BmzsuFrO3Kc=;
	b=dZslguGuIC0PnEDmP/h3r9mHMqQxpC0J+6i+uqdL2ef3EQzRb+0FRTiVuudmVB/iZ/CanX
	mWg8I9wddNCJNpRoYD8coKj2lPrYwugByUybmIK0OnX9K8AAUrNJ4OFY2xT4joRhv4PC/0
	D9JmHWCPj/HrK2FvTM1IWD2CqqHUzsk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718870195;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BiPM555ZzJD1oXU+hzRkT4qSznj4dFJ5BmzsuFrO3Kc=;
	b=FbcfHPT3eu99VM/TclJn0m8xWux1UcazMB9ZAqpJrN8v33Vw0AHH9da4E4anPe3E86gylb
	cQ8iiJhmSHfVZ7Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C2EFF13AC1;
	Thu, 20 Jun 2024 07:56:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QAdILrLgc2blVgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 20 Jun 2024 07:56:34 +0000
Date: Thu, 20 Jun 2024 09:57:00 +0200
Message-ID: <87frt82gj7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lars@metafoo.de,
	perex@perex.cz,
	tiwai@suse.com,
	broonie@kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	shengjiu.wang@gmail.com
Subject: Re: [RESEND PATCH] ALSA: dmaengine_pcm: terminate dmaengine before
 synchronize
In-Reply-To: <1718851218-27803-1-git-send-email-shengjiu.wang@nxp.com>
References: <1718851218-27803-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[metafoo.de,perex.cz,suse.com,kernel.org,vger.kernel.org,alsa-project.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: EBEQF56CUNIG5SQYBEPJNXUZJMZLL2SM
X-Message-ID-Hash: EBEQF56CUNIG5SQYBEPJNXUZJMZLL2SM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EBEQF56CUNIG5SQYBEPJNXUZJMZLL2SM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 20 Jun 2024 04:40:18 +0200,
Shengjiu Wang wrote:
> 
> When dmaengine supports pause function, in suspend state,
> dmaengine_pause() is called instead of dmaengine_terminate_async(),
> 
> In end of playback stream, the runtime->state will go to
> SNDRV_PCM_STATE_DRAINING, if system suspend & resume happen
> at this time, application will not resume playback stream, the
> stream will be closed directly, the dmaengine_terminate_async()
> will not be called before the dmaengine_synchronize(), which
> violates the call sequence for dmaengine_synchronize().

Hmm, I can't follow this state change.
Do you mean that:
- snd_pcm_drain() is performed for a playback stream
- while draining operation, the system goes to suspend
- the system resumes (but the application doesn't call resume yet)
- The stream is closed (without calling resume)
??

If so, it's rather an inconsistent PCM state in the core side, and can
be fixed by a simple call like below:

-- 8< --
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2700,6 +2700,7 @@ void snd_pcm_release_substream(struct snd_pcm_substream *substream)
 	if (substream->ref_count > 0)
 		return;
 
+	snd_pcm_resume(substream);
 	snd_pcm_drop(substream);
 	if (substream->hw_opened) {
 		if (substream->runtime->state != SNDRV_PCM_STATE_OPEN)
-- 8< --

This will be no-op for the PCM device without SNDRV_PCM_INFO_RESUME.

But, this may need more rework, too; admittedly it imposes the
unnecessary resume of the stream although it shall be stopped and
closed immediately after that.  We may have some optimization in
addition.


thanks,

Takashi
