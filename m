Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 179B486C2F8
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Feb 2024 09:01:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56F3493A;
	Thu, 29 Feb 2024 09:01:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56F3493A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709193715;
	bh=7gVZBffV5ET91xGCn9g9Lc58TUCCN5Lyadr+5Z7Eu8M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C1I4sgn5ulqEt2T0vz/Z9HcOJBcMNGKYt2bnKsoPgm8HBkgNDV2Vga7dDbz5UuN0h
	 rpFBAOSmBhOTy2tJBR+mXDhkNRp+JEEIGYNSbV7cJHcQCg+AVZwkoaLCepofyAuu8+
	 Xm3niocrM3dBCqJlYNX+n0fKVQC12xEBdjI2kFgE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30977F8057A; Thu, 29 Feb 2024 09:01:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A849AF805A0;
	Thu, 29 Feb 2024 09:01:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2516F801C0; Thu, 29 Feb 2024 09:01:16 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 80FC9F80088
	for <alsa-devel@alsa-project.org>; Thu, 29 Feb 2024 09:00:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80FC9F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=PyHjHZgL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=bPoeXd6N;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=PyHjHZgL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=bPoeXd6N
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 00C1822295;
	Thu, 29 Feb 2024 08:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1709193647;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+OghcDKcsB6v5yBV6QewQrZL6yYW2i8yj15Dnj8J8i8=;
	b=PyHjHZgL+tgf09H0nnK1AN4mKtccJiyTV/JU22ncJVMLqjCdY+YHiQeYOj2ukLrkf53GCN
	M+6T9jS/BTEbyKkonxcWBKZqhjWfjHkNYSck9fz84jbcm5vDRBrF4CSlbDtokhA8ukGeLd
	IKRcG751MC/jNsIJMaJTEv8UjhJnQn0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709193647;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+OghcDKcsB6v5yBV6QewQrZL6yYW2i8yj15Dnj8J8i8=;
	b=bPoeXd6N+VvO6bOCMCFvXBhTI6VhwosuV5XTtBzWIqacQneYspkvGjLwrRWfmnzTUbT+hq
	oMRb2Y8Oldp38KDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1709193647;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+OghcDKcsB6v5yBV6QewQrZL6yYW2i8yj15Dnj8J8i8=;
	b=PyHjHZgL+tgf09H0nnK1AN4mKtccJiyTV/JU22ncJVMLqjCdY+YHiQeYOj2ukLrkf53GCN
	M+6T9jS/BTEbyKkonxcWBKZqhjWfjHkNYSck9fz84jbcm5vDRBrF4CSlbDtokhA8ukGeLd
	IKRcG751MC/jNsIJMaJTEv8UjhJnQn0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709193647;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+OghcDKcsB6v5yBV6QewQrZL6yYW2i8yj15Dnj8J8i8=;
	b=bPoeXd6N+VvO6bOCMCFvXBhTI6VhwosuV5XTtBzWIqacQneYspkvGjLwrRWfmnzTUbT+hq
	oMRb2Y8Oldp38KDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BCB6E13503;
	Thu, 29 Feb 2024 08:00:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id o7jyLK454GVWRQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 29 Feb 2024 08:00:46 +0000
Date: Thu, 29 Feb 2024 09:00:46 +0100
Message-ID: <878r33hf81.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: <broonie@kernel.org>,
	<shengjiu.wang@gmail.com>,
	<Xiubo.Lee@gmail.com>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: soc-card: Fix missing locking in
 snd_soc_card_get_kcontrol()
In-Reply-To: <20240221123710.690224-1-rf@opensource.cirrus.com>
References: <20240221123710.690224-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=PyHjHZgL;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=bPoeXd6N
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.01 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,alsa-project.org,lists.ozlabs.org,opensource.cirrus.com];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[];
	 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Queue-Id: 00C1822295
Message-ID-Hash: A4BNENRK6SOPSUAOFY4EBGVZF4LENON7
X-Message-ID-Hash: A4BNENRK6SOPSUAOFY4EBGVZF4LENON7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A4BNENRK6SOPSUAOFY4EBGVZF4LENON7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 21 Feb 2024 13:37:10 +0100,
Richard Fitzgerald wrote:
> 
> snd_soc_card_get_kcontrol() must be holding a read lock on
> card->controls_rwsem while walking the controls list.
> 
> Compare with snd_ctl_find_numid().
> 
> The existing function is renamed snd_soc_card_get_kcontrol_locked()
> so that it can be called from contexts that are already holding
> card->controls_rwsem (for example, control get/put functions).
> 
> There are few direct or indirect callers of
> snd_soc_card_get_kcontrol(), and most are safe. Three require
> changes, which have been included in this patch:
> 
> codecs/cs35l45.c:
>   cs35l45_activate_ctl() is called from a control put() function so
>   is changed to call snd_soc_card_get_kcontrol_locked().
> 
> codecs/cs35l56.c:
>   cs35l56_sync_asp1_mixer_widgets_with_firmware() is called from
>   control get()/put() functions so is changed to call
>   snd_soc_card_get_kcontrol_locked().
> 
> fsl/fsl_xcvr.c:
>   fsl_xcvr_activate_ctl() is called from three places, one of which
>   already holds card->controls_rwsem:
>   1. fsl_xcvr_mode_put(), a control put function, which will
>      already be holding card->controls_rwsem.
>   2. fsl_xcvr_startup(), a DAI startup function.
>   3. fsl_xcvr_shutdown(), a DAI shutdown function.
> 
>   To fix this, fsl_xcvr_activate_ctl() has been changed to call
>   snd_soc_card_get_kcontrol_locked() so that it is safe to call
>   directly from fsl_xcvr_mode_put().
>   The fsl_xcvr_startup() and fsl_xcvr_shutdown() functions have been
>   changed to take a read lock on card->controls_rsem() around calls
>   to fsl_xcvr_activate_ctl(). While this is not very elegant, it
>   keeps the change small, to avoid this patch creating a large
>   collateral churn in fsl/fsl_xcvr.c.
> 
> Analysis of other callers of snd_soc_card_get_kcontrol() is that
> they do not need any changes, they are not holding card->controls_rwsem
> when they call snd_soc_card_get_kcontrol().
> 
> Direct callers of snd_soc_card_get_kcontrol():
>   fsl/fsl_spdif.c: fsl_spdif_dai_probe() - DAI probe function
>   fsl/fsl_micfil.c: voice_detected_fn() - IRQ handler
> 
> Indirect callers via soc_component_notify_control():
>   codecs/cs42l43: cs42l43_mic_shutter() - IRQ handler
>   codecs/cs42l43: cs42l43_spk_shutter() - IRQ handler
>   codecs/ak4118.c: ak4118_irq_handler() - IRQ handler
>   codecs/wm_adsp.c: wm_adsp_write_ctl() - not currently used
> 
> Indirect callers via snd_soc_limit_volume():
>   qcom/sc8280xp.c: sc8280xp_snd_init() - DAIlink init function
>   ti/rx51.c: rx51_aic34_init() - DAI init function
> 
> I don't have hardware to test the fsl/*, qcom/sc828xp.c, ti/rx51.c
> and ak4118.c changes.
> 
> Backport note:
> The fsl/, qcom/, cs35l45, cs35l56 and cs42l43 callers were added
> since the Fixes commit so won't all be present on older kernels.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Fixes: 209c6cdfd283 ("ASoC: soc-card: move snd_soc_card_get_kcontrol() to soc-card")
> ---
> It would be great if people could test the fsl/, qcom/, ti/rx51 and ak4418
> drivers.

This fix itself looks correct, and I merged Mark's PR now.

But in general, it'd be better to use snd_ctl_find_id() and
snd_ctl_find_id_unlocked() if possible.  Those standard APIs can use
the fast Xarray lookup, and especially for the case like many ASoC
drivers that expose hundreds of kcontrols, the performance gain
becomes significant.

I see that there is no snd_ctl_find_mixer_id_unlocked() variant, but
it should be trivial to add.


thanks,

Takashi
