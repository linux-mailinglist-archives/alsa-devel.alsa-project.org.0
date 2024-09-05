Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AB996D16C
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 10:10:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09717E8E;
	Thu,  5 Sep 2024 10:10:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09717E8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725523831;
	bh=ZTskrTHWhXuMWm8jDszzEy4PpcAHqmkDCntIEpRnOYg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SXMXePMqiet125WLSNEJqX/3S2cEns2ckm3/NoZ8g9/ni1G2i6tFZ42NcfS+d/HEx
	 1bsj8d2+iAmLYTQIDg4HZpcFDD9oISRyOrUSQ4Pt7YtExtKcEqTn3nlAaT8zyV5sJv
	 tsaZHdAOtXLykTgWeXs/QNvPzTwu5cPEqwH//YHM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EE8FF805BD; Thu,  5 Sep 2024 10:09:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A93AFF800E9;
	Thu,  5 Sep 2024 10:09:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1E01F8016C; Thu,  5 Sep 2024 10:09:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 75538F80027
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 10:09:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75538F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=zuQr9k0d;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jYnEsSQF;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=zuQr9k0d;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jYnEsSQF
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CDA4D219C9;
	Thu,  5 Sep 2024 08:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1725523789;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z+aUsccAwMxP8MofCGB/BTIcUcNncFCgju3ztGHe8HE=;
	b=zuQr9k0dQ8snaydQtziMNLLoTQJ86FL6QYoK2ahu8FYEEW9+ghpRhEJ/ua2cmknEejhliN
	nBPmoChKGLlg31s7TaU4D6mGzmMQulPmteKIydtaQc1yGL9qvO33hDoWJq7rR+9Z6JrCx9
	jhh8k/2qYvQUene6N2kVE5jnCaS1j1Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725523789;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z+aUsccAwMxP8MofCGB/BTIcUcNncFCgju3ztGHe8HE=;
	b=jYnEsSQFYABYCNKGU2DW7g4RSjADbpqkj3gA/xHU43gVARISG9rUYO2BTGvNnOSuwMP1fI
	zWSKYk06d2KkoFAw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1725523789;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z+aUsccAwMxP8MofCGB/BTIcUcNncFCgju3ztGHe8HE=;
	b=zuQr9k0dQ8snaydQtziMNLLoTQJ86FL6QYoK2ahu8FYEEW9+ghpRhEJ/ua2cmknEejhliN
	nBPmoChKGLlg31s7TaU4D6mGzmMQulPmteKIydtaQc1yGL9qvO33hDoWJq7rR+9Z6JrCx9
	jhh8k/2qYvQUene6N2kVE5jnCaS1j1Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725523789;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z+aUsccAwMxP8MofCGB/BTIcUcNncFCgju3ztGHe8HE=;
	b=jYnEsSQFYABYCNKGU2DW7g4RSjADbpqkj3gA/xHU43gVARISG9rUYO2BTGvNnOSuwMP1fI
	zWSKYk06d2KkoFAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 98934139D2;
	Thu,  5 Sep 2024 08:09:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MjR2I01n2WbgHAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Sep 2024 08:09:49 +0000
Date: Thu, 05 Sep 2024 10:10:36 +0200
Message-ID: <87ed5yh66b.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	Jaroslav
 Kysela <perex@perex.cz>,
	"S.J. Wang" <shengjiu.wang@nxp.com>
Subject: Re: Suspend/resume Issue on pcm_dmix.c in alsa-lib
In-Reply-To: 
 <DB9PR04MB94980B82ACA8CFF33EF14626E39D2@DB9PR04MB9498.eurprd04.prod.outlook.com>
References: 
 <DB9PR04MB94988752ED7C43B399E0BC00E3942@DB9PR04MB9498.eurprd04.prod.outlook.com>
	<87msky1bqh.wl-tiwai@suse.de>
	<DB9PR04MB9498F7BBF2688256DEE7D5F2E39C2@DB9PR04MB9498.eurprd04.prod.outlook.com>
	<877cbrkafv.wl-tiwai@suse.de>
	<DB9PR04MB94980B82ACA8CFF33EF14626E39D2@DB9PR04MB9498.eurprd04.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.994];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: NATJZSUDRD5E76QWQCJNKNNKFME7HCQW
X-Message-ID-Hash: NATJZSUDRD5E76QWQCJNKNNKFME7HCQW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NATJZSUDRD5E76QWQCJNKNNKFME7HCQW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 05 Sep 2024 09:44:10 +0200,
Chancel Liu wrote:
> 
> > >
> > > Hi Takashi,
> > >
> > > Thanks for your reply and suggestions. Finally we have found the root cause.
> > > Seems it's related to both drivers and alsa-lib.
> > >
> > > When two dmix clients run in parallel we get two direct dmix instances.
> > > 1st dmix instance:
> > > snd_pcm_dmix_open()
> > >       snd_pcm_direct_initialize_slave()
> > >               save_slave_setting()
> > > Since the driver we are using has SND_PCM_INFO_RESUME flag,
> > > dmix->spcm->info has this flag. Then this flag is cleared in
> > dmix->shmptr->s.info.
> > >
> > > 2nd dmix instance:
> > > snd_pcm_dmix_open()
> > >       snd_pcm_direct_open_secondary_client()
> > >               copy_slave_setting()
> > > 2nd dmix->spcm->info is copied from dmix->shmptr->s.info so it doesn'
> > > has this flag.
> > >
> > > If 1st dmix instance resumes firstly it should implement recovery of
> > > slave pcm in snd_pcm_direct_slave_recover(). Because 1st
> > > dmix->spcm->info has
> > > SND_PCM_INFO_RESUME，snd_pcm_resume(direct->spcm) can be called
> > > correctly to resume slave pcm.
> > 
> > ... and immediately stop the stream, then prepare and restart as a usual
> > restart.
> > 
> > > However if 2nd dmix instance resumes firstly,
> > > snd_pcm_resume(direct->spcm) will not be called because it's
> > > spcm->info doesn't has SND_PCM_INFO_RESUME flag. The 1st dmix instance
> > > assumes someone else already did recovery so
> > > snd_pcm_resume(direct->spcm) won't be called neither. In result the
> > > slave pcm fails to resume.
> > 
> > Something wrong happening here, then.
> > 
> > In dmix, there is no hardware resume at all, but it's always a restart of the
> > stream.  The call of snd_pcm_resume() is only temporarily for inconsistencies
> > that can be a problem on some drivers (IIRC dmaengine stuff).  That said,
> > dmix does a kind of fake resume, stops and restarts the stream cleanly on the
> > first instance.  On the second instance, it's already recovered, hence it bails
> > out.
> > 
> > If poll() hangs on the second instance, there can be some other problem.
> > Maybe the resume -> stop -> restart sequence doesn't work with your driver
> > well?
> > 
> 
> Our dma driver will do PAUSE in system suspend and requires doing RESUME in
> system resume. Current problem is that snd_pcm_resume() is not called by both
> 1st instance and 2nd instance.

That's weird.  Are you really testing with the latest alsa-lib code?

If application doesn't call snd_pcm_resume(), it means that the PCM
state isn't set to SUSPENDED, so it pretends as if still running.

Or if you mean that snd_pcm_resume() to the slave PCM isn't called
(even though snd_pcm_resume() is called for the dmix PCM), check
whether snd_pcm_direct_slave_recover() gets called, especially at the
point:

	/* some buggy drivers require the device resumed before prepared;
	 * when a device has RESUME flag and is in SUSPENDED state, resume
	 * here but immediately drop to bring it to a sane active state.
	 */
	if (state == SND_PCM_STATE_SUSPENDED &&
	    (direct->spcm->info & SND_PCM_INFO_RESUME)) {
		snd_pcm_resume(direct->spcm);
		snd_pcm_drop(direct->spcm);
		snd_pcm_direct_timer_stop(direct);
		snd_pcm_direct_clear_timer_queue(direct);
	}

Try to put debug prints or catch via breakpoint whether this code path
is executed.

Also, does the issue happen with the latest 6.11-rc kernel, too?
If yes, what if you drop SNDRV_PCM_INFO_RESUME bit flag in the driver
side?  Does the problem persist, or it works?

> > > SND_PCM_INFO_RESUME flag has impact on the flow of dmix resume. In my
> > > opinion the first resumed dmix instance should make sure slave pcm can
> > > be recovered properly no matter it's the first opened instance or
> > > secondary opened instance
> > .
> > 
> > The snd_pcm_resume() gets called no matter which instance, just the first one
> > who tries to recover the suspended state.  (And it's called internally at
> > updating the various state, not necessarily an explicit recovery call.)
> > 
> 
> Unfortunately if secondary opened instance resumes first it doesn't has
> SND_PCM_INFO_RESUME which causes snd_pcm_resume() never be called.

No, it's misunderstanding.  SND_PCM_INFO_RESUME isn't exposed to the
application in the case of dmix at all; i.e. dmix doesn't support the
full resume, per se. That's the design.  So it doesn't matter which
instance gets resumed at first.

> > > Do you know why the secondary opened instance clear the
> > > SND_PCM_INFO_RESUME flag? Can we do the following modification?
> > >
> > > diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c @@ -1183,8
> > > +1226,6 @@ static void save_slave_setting(snd_pcm_direct_t *dmix,
> > snd_pcm_t *spcm)
> > >         COPY_SLAVE(buffer_time);
> > >         COPY_SLAVE(sample_bits);
> > >         COPY_SLAVE(frame_bits);
> > > -
> > > -       dmix->shmptr->s.info &= ~SND_PCM_INFO_RESUME;
> > 
> > I don't think so.  The clearance of the RESUME flag here is correct.
> > dmix doesn't support the hardware resume feature.  It does its own.
> > (And this flag is merely a info for apps, which isn't really evaluated except for
> > the code in dmix workaround there.)
> > 
> > 
> > Takashi
> > 
> 
> I think dmix should know what state the real driver is. If driver requires that
> app should do snd_pcm_resume() how can dmix get this information?

The dmix already knows.  But the PCM state exposed to applications
isn't always tied as 1:1.


Takashi
