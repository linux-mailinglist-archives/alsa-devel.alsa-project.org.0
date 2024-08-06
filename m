Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2B5949359
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 16:40:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F04D3BA2;
	Tue,  6 Aug 2024 16:40:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F04D3BA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722955235;
	bh=VeVFwzdPDtjQPaFz1jm1yMDwgZIIGuStVBwOb+RKa8o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XeowsH3E+uwXKm48XeYyeksBvTFs+Y/LK2CprG/8CRc6GRKXEpAmlZqurFKRll3a1
	 ux1rUuOLdHJbUnHQQqmC8YutsBKreLPN/iS5oEWXKqoDmeP6++q8XF61aSPXZ09p5P
	 b0+IRpimJ949K0o0Try0BpQbr6f2Fqpxz2Y37XXU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8ADD8F805A9; Tue,  6 Aug 2024 16:40:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97B73F805AE;
	Tue,  6 Aug 2024 16:39:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 682AFF802DB; Tue,  6 Aug 2024 16:20:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 472F3F800B0
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 16:20:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 472F3F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=xXuF0Qda;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=pAqx58lq;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=xXuF0Qda;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=pAqx58lq
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 05AF41FB55;
	Tue,  6 Aug 2024 14:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1722954026;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ud7zPkC2x9AzVQHj1OnvE/Jms2tb+atw+AF82NxaIqU=;
	b=xXuF0QdaIhvM8/eRHfxCC9HB/4/NkIbNBklEDUEe8XqytMzpARTsZKgnFkCxYOe6WgrzUy
	6qrSAi+lb+tXn6jTe0dTq32T3Ijz+pMQRBFpwITxHqcsouB57IPJ43T/8MJCKTaHpMHeKU
	j4BfGjCansqUVctTrlDJGkb//+05VhE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722954026;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ud7zPkC2x9AzVQHj1OnvE/Jms2tb+atw+AF82NxaIqU=;
	b=pAqx58lqRcD8BfVAdqUcn73Hg3X77gXfHB15i8bGdxPx+l60CbKcMpZlqH55/XfMtQC+Q0
	LN3/OWP+wGd+lGBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xXuF0Qda;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=pAqx58lq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1722954026;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ud7zPkC2x9AzVQHj1OnvE/Jms2tb+atw+AF82NxaIqU=;
	b=xXuF0QdaIhvM8/eRHfxCC9HB/4/NkIbNBklEDUEe8XqytMzpARTsZKgnFkCxYOe6WgrzUy
	6qrSAi+lb+tXn6jTe0dTq32T3Ijz+pMQRBFpwITxHqcsouB57IPJ43T/8MJCKTaHpMHeKU
	j4BfGjCansqUVctTrlDJGkb//+05VhE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722954026;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ud7zPkC2x9AzVQHj1OnvE/Jms2tb+atw+AF82NxaIqU=;
	b=pAqx58lqRcD8BfVAdqUcn73Hg3X77gXfHB15i8bGdxPx+l60CbKcMpZlqH55/XfMtQC+Q0
	LN3/OWP+wGd+lGBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EBD2A13770;
	Tue,  6 Aug 2024 14:20:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id JQEDOSkxsmbzVwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 06 Aug 2024 14:20:25 +0000
Date: Tue, 06 Aug 2024 16:21:04 +0200
Message-ID: <87mslp91gv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Stefan Stistrup <sstistrup@gmail.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: usb-audio: Add input gain and master output mixer
 controls for RME Babyface Pro
In-Reply-To: <87jzgu9bsr.wl-tiwai@suse.de>
References: <20240802142439.2823864-1-sstistrup@gmail.com>
	<87jzgu9bsr.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 05AF41FB55
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[suse.de:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: 5XPFLZNV6JLDTUWP5OU36L4HHTY4LV5R
X-Message-ID-Hash: 5XPFLZNV6JLDTUWP5OU36L4HHTY4LV5R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5XPFLZNV6JLDTUWP5OU36L4HHTY4LV5R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 06 Aug 2024 12:37:56 +0200,
Takashi Iwai wrote:
> 
> On Fri, 02 Aug 2024 16:24:39 +0200,
> Stefan Stistrup wrote:
> > 
> > Add missing input gain and master output mixer controls for RME Babyface Pro
> > 
> > This patch implements:
> > 
> > 1. Input gain controls for 2 mic and 2 line inputs
> > 2. Master output volume controls for all 12 output channels
> > 
> > These additions allow for more complete control of the Babyface Pro under Linux.
> > 
> > Signed-off-by: Stefan Stistrup <sstistrup@gmail.com>
> > +static int snd_bbfpro_gain_update(struct usb_mixer_interface *mixer,
> > +				  u8 channel, u8 gain)
> > +{
> > +	int err;
> > +
> > +	struct snd_usb_audio *chip = mixer->chip;
> 
> An unneeded blank line.  There are a few other coding style issues, as
> it seems.  Please correct the errors reported by checkpatch.pl.
> 
> > +static int snd_bbfpro_gain_put(struct snd_kcontrol *kcontrol,
> > +                               struct snd_ctl_elem_value *ucontrol)
> > +{
> > +	int pv, channel, old_value, value, err;
> > +
> > +	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kcontrol);
> > +	struct usb_mixer_interface *mixer = list->mixer;
> > +
> > +	pv = kcontrol->private_value;
> > +	channel = (pv >> SND_BBFPRO_GAIN_CHANNEL_SHIFT) &
> > +		  SND_BBFPRO_GAIN_CHANNEL_MASK;
> > +	old_value = pv & SND_BBFPRO_GAIN_VAL_MASK;
> > +	value = ucontrol->value.integer.value[0];
> > +
> > +	if (channel < 2) {
> > +		if (value > SND_BBFPRO_GAIN_VAL_MIC_MAX)
> > +			return -EINVAL;
> 
> Also check an invalid negative value, too.

Last but not least: when you resubmit, please send to
linux-sound@vger.kernel.org and Cc to me, instead of alsa-devel ML.
That's the new official ML for kernel patches.


thanks,

Takashi
