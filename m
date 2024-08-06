Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC472948D04
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 12:44:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCA2539DC;
	Tue,  6 Aug 2024 12:44:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCA2539DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722941064;
	bh=QkpGSkbekU65CyNZ6Go/3sPioDO7v6PTx9Io42oqkMc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sRNJgKML1SkDeerDr64DA3V09VZsdkiVrsGnu9NjtsrQcAv/iZ5CV3KqurOC4GhkF
	 604P2n/ocg6ILwm9NWi+C8Z9rk1f+hfdb9eaOpVLGLaGDbmKo4lairqoW2To1mYBfo
	 K2GDR1VThB6Y/QsTQ5l+UuCXAR+v5DgfbDkq2R5Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28834F805AD; Tue,  6 Aug 2024 12:43:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75432F805AF;
	Tue,  6 Aug 2024 12:43:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D502F8023A; Tue,  6 Aug 2024 12:39:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39047F8049C
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 12:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39047F8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=F78/w7Hc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=dCM/3xqn;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=F78/w7Hc;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=dCM/3xqn
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0D1901FB44;
	Tue,  6 Aug 2024 10:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1722940638;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sxDufsMSRoTTfgOt2HU3HOyQ+7jkyAj1dGKnhs/i/ig=;
	b=F78/w7Hc51nyhOlt9terW1GCXpwSDjuqSktl0PbrKoUuaDi/FSJ0aPoOG26aDG4ML3M1DF
	h6ZDK+EyV3rLA75t2pEaIui99Tkwq7+9a5TsNnV+nfiJ0tiZnwOa4W5ghAiVvKtQR9sgmg
	t2ldvl4y1Qd51GVbuTcS/w6tlp1ulfQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722940638;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sxDufsMSRoTTfgOt2HU3HOyQ+7jkyAj1dGKnhs/i/ig=;
	b=dCM/3xqniYmTqr5RlXi4A4zkLMcxcug5UGiygmea6frFFzxRH8bB6ZLWybm86yhTuYb8Ev
	8zAoFZxTTKaTiLAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="F78/w7Hc";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="dCM/3xqn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1722940638;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sxDufsMSRoTTfgOt2HU3HOyQ+7jkyAj1dGKnhs/i/ig=;
	b=F78/w7Hc51nyhOlt9terW1GCXpwSDjuqSktl0PbrKoUuaDi/FSJ0aPoOG26aDG4ML3M1DF
	h6ZDK+EyV3rLA75t2pEaIui99Tkwq7+9a5TsNnV+nfiJ0tiZnwOa4W5ghAiVvKtQR9sgmg
	t2ldvl4y1Qd51GVbuTcS/w6tlp1ulfQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722940638;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sxDufsMSRoTTfgOt2HU3HOyQ+7jkyAj1dGKnhs/i/ig=;
	b=dCM/3xqniYmTqr5RlXi4A4zkLMcxcug5UGiygmea6frFFzxRH8bB6ZLWybm86yhTuYb8Ev
	8zAoFZxTTKaTiLAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F3FB513770;
	Tue,  6 Aug 2024 10:37:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XpUFO938sWaQFAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 06 Aug 2024 10:37:17 +0000
Date: Tue, 06 Aug 2024 12:37:56 +0200
Message-ID: <87jzgu9bsr.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Stistrup <sstistrup@gmail.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: usb-audio: Add input gain and master output mixer
 controls for RME Babyface Pro
In-Reply-To: <20240802142439.2823864-1-sstistrup@gmail.com>
References: <20240802142439.2823864-1-sstistrup@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0D1901FB44
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: CTTD2ZKZCM3BNQTNJWAVJEQXN63CWJDC
X-Message-ID-Hash: CTTD2ZKZCM3BNQTNJWAVJEQXN63CWJDC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CTTD2ZKZCM3BNQTNJWAVJEQXN63CWJDC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 02 Aug 2024 16:24:39 +0200,
Stefan Stistrup wrote:
> 
> Add missing input gain and master output mixer controls for RME Babyface Pro
> 
> This patch implements:
> 
> 1. Input gain controls for 2 mic and 2 line inputs
> 2. Master output volume controls for all 12 output channels
> 
> These additions allow for more complete control of the Babyface Pro under Linux.
> 
> Signed-off-by: Stefan Stistrup <sstistrup@gmail.com>
> +static int snd_bbfpro_gain_update(struct usb_mixer_interface *mixer,
> +				  u8 channel, u8 gain)
> +{
> +	int err;
> +
> +	struct snd_usb_audio *chip = mixer->chip;

An unneeded blank line.  There are a few other coding style issues, as
it seems.  Please correct the errors reported by checkpatch.pl.

> +static int snd_bbfpro_gain_put(struct snd_kcontrol *kcontrol,
> +                               struct snd_ctl_elem_value *ucontrol)
> +{
> +	int pv, channel, old_value, value, err;
> +
> +	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kcontrol);
> +	struct usb_mixer_interface *mixer = list->mixer;
> +
> +	pv = kcontrol->private_value;
> +	channel = (pv >> SND_BBFPRO_GAIN_CHANNEL_SHIFT) &
> +		  SND_BBFPRO_GAIN_CHANNEL_MASK;
> +	old_value = pv & SND_BBFPRO_GAIN_VAL_MASK;
> +	value = ucontrol->value.integer.value[0];
> +
> +	if (channel < 2) {
> +		if (value > SND_BBFPRO_GAIN_VAL_MIC_MAX)
> +			return -EINVAL;

Also check an invalid negative value, too.


thanks,

Takashi
