Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DD09700A3
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Sep 2024 09:46:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6C7393A;
	Sat,  7 Sep 2024 09:46:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6C7393A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725695206;
	bh=3LgmlzRDYQcbU29aCnEkw/j1THdclUZBEZIYhlErTDg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EcjD0UFEOzSLGX2E0Qr4b+xuDWwCVcTeWZWvVEHxJezbLlVTyZ5HdDfj1Q+gl7Dfe
	 IWrIrXM/BkYcG1JtKttjL+CwxwR4gLgaktaG6Xf1MKmyszC5leqbt2UDGiK57TUh7d
	 FC39NIKKevwxRsyVL5tseVSqaGl6/WcaJiYYTyD4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48BC1F8059F; Sat,  7 Sep 2024 09:46:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20593F805B1;
	Sat,  7 Sep 2024 09:46:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8664CF8016C; Sat,  7 Sep 2024 09:46:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7520FF80107
	for <alsa-devel@alsa-project.org>; Sat,  7 Sep 2024 09:46:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7520FF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=knctNF8Z;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4YsIm4iH;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=knctNF8Z;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4YsIm4iH
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5D4B21F76C;
	Sat,  7 Sep 2024 07:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1725695166;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5y08yYom5hgxeNrV883FMRRgZqve0Fw82wAbN3aKcfk=;
	b=knctNF8ZsmuoVn8QiUJFZcM7PKEgsN7TBE8IJEUUslhNbo03kyCr4V3lZnuddirHhxHhZK
	/niPUo28rpss6L91lJpMr8tlhR3TaFj49775lFKxi3p2ifsAIdCuIhnyHiq2GOLi49sqqv
	lEPRx+dyMjXiUiG5X3CThw/ciQfVifY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725695166;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5y08yYom5hgxeNrV883FMRRgZqve0Fw82wAbN3aKcfk=;
	b=4YsIm4iHFO9eBmREFhtHLFM2Cd4YzXq7vMa5YbDJ8Yt5hy6ypFTOui8qn4Uqs8RVKIacOy
	RQbJeRtqRjEbcXBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1725695166;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5y08yYom5hgxeNrV883FMRRgZqve0Fw82wAbN3aKcfk=;
	b=knctNF8ZsmuoVn8QiUJFZcM7PKEgsN7TBE8IJEUUslhNbo03kyCr4V3lZnuddirHhxHhZK
	/niPUo28rpss6L91lJpMr8tlhR3TaFj49775lFKxi3p2ifsAIdCuIhnyHiq2GOLi49sqqv
	lEPRx+dyMjXiUiG5X3CThw/ciQfVifY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725695166;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5y08yYom5hgxeNrV883FMRRgZqve0Fw82wAbN3aKcfk=;
	b=4YsIm4iHFO9eBmREFhtHLFM2Cd4YzXq7vMa5YbDJ8Yt5hy6ypFTOui8qn4Uqs8RVKIacOy
	RQbJeRtqRjEbcXBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 39769139DE;
	Sat,  7 Sep 2024 07:46:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id N9HLDL4E3GZCNQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 07 Sep 2024 07:46:06 +0000
Date: Sat, 07 Sep 2024 09:46:52 +0200
Message-ID: <877cbnewib.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ariadne Conill <ariadne@ariadne.space>
Cc: xen-devel@lists.xenproject.org,
	alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] Revert "ALSA: memalloc: Workaround for Xen PV"
In-Reply-To: <20240906184209.25423-1-ariadne@ariadne.space>
References: <20240906184209.25423-1-ariadne@ariadne.space>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,alsa-project.org:email]
Message-ID-Hash: BV6OUEMVHOPTABWHZJ3ZPI3UU44J2YBZ
X-Message-ID-Hash: BV6OUEMVHOPTABWHZJ3ZPI3UU44J2YBZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BV6OUEMVHOPTABWHZJ3ZPI3UU44J2YBZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 06 Sep 2024 20:42:09 +0200,
Ariadne Conill wrote:
> 
> This patch attempted to work around a DMA issue involving Xen, but
> causes subtle kernel memory corruption.
> 
> When I brought up this patch in the XenDevel matrix channel, I was
> told that it had been requested by the Qubes OS developers because
> they were trying to fix an issue where the sound stack would fail
> after a few hours of uptime.  They wound up disabling SG buffering
> entirely instead as a workaround.
> 
> Accordingly, I propose that we should revert this workaround patch,
> since it causes kernel memory corruption and that the ALSA and Xen
> communities should collaborate on fixing the underlying problem in
> such a way that SG buffering works correctly under Xen.
> 
> This reverts commit 53466ebdec614f915c691809b0861acecb941e30.
> 
> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
> Cc: stable@vger.kernel.org
> Cc: xen-devel@lists.xenproject.org
> Cc: alsa-devel@alsa-project.org
> Cc: Takashi Iwai <tiwai@suse.de>

The relevant code has been largely rewritten for 6.12, so please check
the behavior with sound.git tree for-next branch.  I guess the same
issue should happen as the Xen workaround was kept and applied there,
too, but it has to be checked at first.

If the issue is persistent with there, the fix for 6.12 code would be
rather much simpler like the blow.


thanks,

Takashi

--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -793,9 +793,6 @@ static void *snd_dma_sg_alloc(struct snd_dma_buffer *dmab, size_t size)
 	int type = dmab->dev.type;
 	void *p;
 
-	if (cpu_feature_enabled(X86_FEATURE_XENPV))
-		return snd_dma_sg_fallback_alloc(dmab, size);
-
 	/* try the standard DMA API allocation at first */
 	if (type == SNDRV_DMA_TYPE_DEV_WC_SG)
 		dmab->dev.type = SNDRV_DMA_TYPE_DEV_WC;

