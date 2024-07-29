Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9BD93FE43
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2024 21:30:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AACD846;
	Mon, 29 Jul 2024 21:30:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AACD846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722281458;
	bh=cvfsAHSi0d/dgRWJetm1h/PLtW/nC7SPpo8BdBSh174=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h9azuKc4onJOi7SfgDmSe09OQemGqfEQulL3a+PJzxRU8OonOfhvuBZMZJCBxv1cz
	 kefLp6+i/ioK8ONdJSKdx+5r5QBwWGXJwOS6Yjo4/U5b8zHctURsv/2YRQj/d9SaVj
	 JeTDPeE8M/ZxOiRzi0LJiikiQGCzvnVDbECundwc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C441F8058C; Mon, 29 Jul 2024 21:30:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 447A8F805B0;
	Mon, 29 Jul 2024 21:30:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CADCF802DB; Mon, 29 Jul 2024 21:27:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7D99FF80269
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 21:27:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D99FF80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=VliUM/b6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=f7J9uxb/;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=s69QFT0M;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=u5FK5zBv
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EEAB11F7B7;
	Mon, 29 Jul 2024 19:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1722281220;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ap1CzPaQNwLMZeEIW6gyKI8pGrm9CZN65+dOLmY4P3U=;
	b=VliUM/b6VWpb27ZaZ24e37m5yPfrVX8wD6h+TLPdru4kSlwBpSU+e/fgbFAkVimaJqhZlu
	T3ULJjgsuCPaTyb06A4EoT9IczZh7saH9TYDFe4bxDgVqagPzFVk0SuFx+aHbpNtcuw7Dp
	dOMq01hobuaYyrw4DKLZ1FZ5N4/tjzs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722281220;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ap1CzPaQNwLMZeEIW6gyKI8pGrm9CZN65+dOLmY4P3U=;
	b=f7J9uxb/14xDOSETXcQHsbDNG6dnajRdOnwdZKTKLGMLaTd1u9eajxFj2e4q7tr5tfW7qJ
	Cn7JiCGsSRZQurAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1722281218;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ap1CzPaQNwLMZeEIW6gyKI8pGrm9CZN65+dOLmY4P3U=;
	b=s69QFT0M1jaEEoIyemRP4nmXu+g4fEQed9H+o23IMdvnXyiYpCsknxXNTDK/zt7opkpOuK
	NKyHcKPslD23f/IUTt84ZingYVyWWjdOIup2Acghq77j11I6GXqNz/pgWre+/Tfsg2dUaw
	ZtuI+Z5z04epmG+tuTLyo5HIeBZkAjQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722281218;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ap1CzPaQNwLMZeEIW6gyKI8pGrm9CZN65+dOLmY4P3U=;
	b=u5FK5zBv/I7ikIqK/JCXDhj8aV0EV/O3VeWTBQvrzIBtrpA8NTWYoQAYPShS72vW33kDZb
	E4jpYECuYeoj7cCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C1229138A7;
	Mon, 29 Jul 2024 19:26:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Opr7LQLtp2YYPAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Jul 2024 19:26:58 +0000
Date: Mon, 29 Jul 2024 21:27:34 +0200
Message-ID: <87jzh49exl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Simon Trimmer <simont@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH] ALSA: hda: cs35l56: Stop creating ALSA controls for
 firmware coefficients
In-Reply-To: <019d01dae1da$bc32b1d0$34981570$@opensource.cirrus.com>
References: <20240729161532.147893-1-simont@opensource.cirrus.com>
	<019d01dae1da$bc32b1d0$34981570$@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.10 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,alsa-project.org:email,suse.com:email,cirrus.com:email]
Message-ID-Hash: PPUPPPOP2MYQLSPSSUWBDMKQIGQR6A73
X-Message-ID-Hash: PPUPPPOP2MYQLSPSSUWBDMKQIGQR6A73
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PPUPPPOP2MYQLSPSSUWBDMKQIGQR6A73/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 29 Jul 2024 19:14:13 +0200,
Simon Trimmer wrote:
> 
> Apologies Takashi - can you ignore this one please? It will need a V2

Sure.


thanks,

Takashi

> 
> > -----Original Message-----
> > From: Simon Trimmer <simont@opensource.cirrus.com>
> > Sent: Monday, July 29, 2024 5:16 PM
> > To: tiwai@suse.com
> > Cc: linux-sound@vger.kernel.org; alsa-devel@alsa-project.org; linux-
> > kernel@vger.kernel.org; patches@opensource.cirrus.com; Simon Trimmer
> > <simont@opensource.cirrus.com>
> > Subject: [PATCH] ALSA: hda: cs35l56: Stop creating ALSA controls for
> firmware
> > coefficients
> > 
> > A number of laptops have gone to market with old firmware versions that
> > export controls that have since been hidden, but we can't just install a
> > newer firmware because the firmware for each product is customized and
> > qualified by the OEM. The issue is that alsactl save and restore has no
> > idea what controls are good to persist which can lead to
> > misconfiguration.
> > 
> > As the ALSA controls for the firmware coefficients are not used in
> > normal operation they can all be hidden, but add a kernel parameter so
> > that they can be re-enabled for debugging.
> > 
> > Fixes: 73cfbfa9caea ("ALSA: hda/cs35l56: Add driver for Cirrus Logic
> CS35L56
> > amplifier")
> > Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
> > ---
> >  sound/pci/hda/cs35l56_hda.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
> > index 96d3f13c5abf..1494383b22c9 100644
> > --- a/sound/pci/hda/cs35l56_hda.c
> > +++ b/sound/pci/hda/cs35l56_hda.c
> > @@ -23,6 +23,10 @@
> >  #include "hda_cs_dsp_ctl.h"
> >  #include "hda_generic.h"
> > 
> > +static bool expose_dsp_controls;
> > +module_param(expose_dsp_controls, bool, 0444);
> > +MODULE_PARM_DESC(expose_dsp_controls, "Expose firmware controls as
> > ALSA controls 0=no (default), 1=yes");
> > +
> >   /*
> >    * The cs35l56_hda_dai_config[] reg sequence configures the device as
> >    *  ASP1_BCLK_FREQ = 3.072 MHz
> > @@ -758,6 +762,9 @@ static int cs35l56_hda_bind(struct device *dev, struct
> > device *master, void *mas
> > 
> >  	cs35l56_hda_create_controls(cs35l56);
> > 
> > +	if (expose_dsp_controls)
> > +		cs35l56_hda_add_dsp_controls(cs35l56);
> > +
> >  #if IS_ENABLED(CONFIG_SND_DEBUG)
> >  	cs35l56->debugfs_root = debugfs_create_dir(dev_name(cs35l56-
> > >base.dev), sound_debugfs_root);
> >  	cs_dsp_init_debugfs(&cs35l56->cs_dsp, cs35l56->debugfs_root);
> > --
> > 2.43.0
> 
> 
