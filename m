Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B74296EA77
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2024 08:31:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B139DB70;
	Fri,  6 Sep 2024 08:30:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B139DB70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725604259;
	bh=F5dpfLFMW4L3lcmxKTQhpPwIxuSSdg6Zbxv/ISgr6ik=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b0xv3XqH1QwyLJbD7s1BPzqtF3AEwHaezSCmQdd//Gj7O9AjBmzGfWQV2GpmXi9GK
	 OftDSLx1PT/yQrrulDvvcp+Eklwn35TO2DX7mvDqp5gduAsxcM2s/XPZmoIvX+J0/N
	 SI4mFrsnJMbwDD/M+GY0IxdDNGnDVZW0pv2loULk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8CE1F80536; Fri,  6 Sep 2024 08:30:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 913B6F805B2;
	Fri,  6 Sep 2024 08:30:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC709F8016C; Fri,  6 Sep 2024 08:30:23 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CF096F80027
	for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2024 08:30:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF096F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=nBqbd8rF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=qMi0+ogI;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=nBqbd8rF;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=qMi0+ogI
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A88E81F88F;
	Fri,  6 Sep 2024 06:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1725604220;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L/sBxIzx8ME25Epfc2OjJZieePm3HuJEw+pR2mROm/A=;
	b=nBqbd8rFTqMFmY9mEFMzoVFAOp5Ysp+7LIVsGUk2x586is8dVLwbzRyxVoE3Z6zukVGcdc
	R2Mrt/TTsfQa3Ueg07pkg3r/4/T5xNSuQJW48PVGfQKQdd7/oXq4Hs/fM2heo5Szcb1hiS
	IFMyHTjVAd/ZUs+HIQg8+YKynUOaTrw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725604220;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L/sBxIzx8ME25Epfc2OjJZieePm3HuJEw+pR2mROm/A=;
	b=qMi0+ogI9ww8Qq6uechUYrivduGHZKhzPGRE+YcpORKlQcq3W1xytn4boKFuNglRiJ4DQJ
	ViFbnV7XJ5CzOvCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=nBqbd8rF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=qMi0+ogI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1725604220;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L/sBxIzx8ME25Epfc2OjJZieePm3HuJEw+pR2mROm/A=;
	b=nBqbd8rFTqMFmY9mEFMzoVFAOp5Ysp+7LIVsGUk2x586is8dVLwbzRyxVoE3Z6zukVGcdc
	R2Mrt/TTsfQa3Ueg07pkg3r/4/T5xNSuQJW48PVGfQKQdd7/oXq4Hs/fM2heo5Szcb1hiS
	IFMyHTjVAd/ZUs+HIQg8+YKynUOaTrw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725604220;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=L/sBxIzx8ME25Epfc2OjJZieePm3HuJEw+pR2mROm/A=;
	b=qMi0+ogI9ww8Qq6uechUYrivduGHZKhzPGRE+YcpORKlQcq3W1xytn4boKFuNglRiJ4DQJ
	ViFbnV7XJ5CzOvCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 82EAE136A8;
	Fri,  6 Sep 2024 06:30:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id RD+zHnyh2mbkIwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 06 Sep 2024 06:30:20 +0000
Date: Fri, 06 Sep 2024 08:31:06 +0200
Message-ID: <87msklfg45.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	Jaroslav
 Kysela <perex@perex.cz>,
	"S.J. Wang" <shengjiu.wang@nxp.com>
Subject: Re: [EXT] Re: Suspend/resume Issue on pcm_dmix.c in alsa-lib
In-Reply-To: 
 <DB9PR04MB9498DBD22C18D9260C9F848DE39E2@DB9PR04MB9498.eurprd04.prod.outlook.com>
References: 
 <DB9PR04MB94988752ED7C43B399E0BC00E3942@DB9PR04MB9498.eurprd04.prod.outlook.com>
	<87msky1bqh.wl-tiwai@suse.de>
	<DB9PR04MB9498F7BBF2688256DEE7D5F2E39C2@DB9PR04MB9498.eurprd04.prod.outlook.com>
	<877cbrkafv.wl-tiwai@suse.de>
	<DB9PR04MB94980B82ACA8CFF33EF14626E39D2@DB9PR04MB9498.eurprd04.prod.outlook.com>
	<87ed5yh66b.wl-tiwai@suse.de>
	<DB9PR04MB9498BE3E297E22281C0E6914E39D2@DB9PR04MB9498.eurprd04.prod.outlook.com>
	<877cbqgr31.wl-tiwai@suse.de>
	<DB9PR04MB9498DBD22C18D9260C9F848DE39E2@DB9PR04MB9498.eurprd04.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Rspamd-Queue-Id: A88E81F88F
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: HCO45NUL2AMLZJEYF5GCM5XCFFAMW4A5
X-Message-ID-Hash: HCO45NUL2AMLZJEYF5GCM5XCFFAMW4A5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HCO45NUL2AMLZJEYF5GCM5XCFFAMW4A5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 06 Sep 2024 08:22:23 +0200,
Chancel Liu wrote:
> 
> > > > > > > Hi Takashi,
> > > > > > >
> > > > > > > Thanks for your reply and suggestions. Finally we have found
> > > > > > > the root
> > > > cause.
> > > > > > > Seems it's related to both drivers and alsa-lib.
> > > > > > >
> > > > > > > When two dmix clients run in parallel we get two direct dmix
> > instances.
> > > > > > > 1st dmix instance:
> > > > > > > snd_pcm_dmix_open()
> > > > > > >       snd_pcm_direct_initialize_slave()
> > > > > > >               save_slave_setting() Since the driver we are
> > > > > > > using has SND_PCM_INFO_RESUME flag,
> > > > > > > dmix->spcm->info has this flag. Then this flag is cleared in
> > > > > > dmix->shmptr->s.info.
> > > > > > >
> > > > > > > 2nd dmix instance:
> > > > > > > snd_pcm_dmix_open()
> > > > > > >       snd_pcm_direct_open_secondary_client()
> > > > > > >               copy_slave_setting() 2nd dmix->spcm->info is
> > > > > > > copied from dmix->shmptr->s.info so it doesn'
> > > > > > > has this flag.
> > > > > > >
> > > > > > > If 1st dmix instance resumes firstly it should implement
> > > > > > > recovery of slave pcm in snd_pcm_direct_slave_recover().
> > > > > > > Because 1st
> > > > > > > dmix->spcm->info has
> > > > > > > SND_PCM_INFO_RESUME，snd_pcm_resume(direct->spcm) can be
> > called
> > > > > > > correctly to resume slave pcm.
> > > > > >
> > > > > > ... and immediately stop the stream, then prepare and restart as
> > > > > > a usual restart.
> > > > > >
> > > > > > > However if 2nd dmix instance resumes firstly,
> > > > > > > snd_pcm_resume(direct->spcm) will not be called because it's
> > > > > > > spcm->info doesn't has SND_PCM_INFO_RESUME flag. The 1st dmix
> > > > instance
> > > > > > > assumes someone else already did recovery so
> > > > > > > snd_pcm_resume(direct->spcm) won't be called neither. In
> > > > > > > result the slave pcm fails to resume.
> > > > > >
> > > > > > Something wrong happening here, then.
> > > > > >
> > > > > > In dmix, there is no hardware resume at all, but it's always a
> > > > > > restart of the stream.  The call of snd_pcm_resume() is only
> > > > > > temporarily for
> > > > inconsistencies
> > > > > > that can be a problem on some drivers (IIRC dmaengine stuff).
> > > > > > That said, dmix does a kind of fake resume, stops and restarts
> > > > > > the stream cleanly on
> > > > the
> > > > > > first instance.  On the second instance, it's already recovered,
> > > > > > hence it
> > > > bails
> > > > > > out.
> > > > > >
> > > > > > If poll() hangs on the second instance, there can be some other problem.
> > > > > > Maybe the resume -> stop -> restart sequence doesn't work with
> > > > > > your
> > > > driver
> > > > > > well?
> > > > > >
> > > > >
> > > > > Our dma driver will do PAUSE in system suspend and requires doing
> > > > > RESUME
> > > > in
> > > > > system resume. Current problem is that snd_pcm_resume() is not
> > > > > called by
> > > > both
> > > > > 1st instance and 2nd instance.
> > > >
> > > > That's weird.  Are you really testing with the latest alsa-lib code?
> > > >
> > > > If application doesn't call snd_pcm_resume(), it means that the PCM
> > > > state isn't set to SUSPENDED, so it pretends as if still running.
> > > >
> > > > Or if you mean that snd_pcm_resume() to the slave PCM isn't called
> > > > (even though snd_pcm_resume() is called for the dmix PCM), check
> > > > whether snd_pcm_direct_slave_recover() gets called, especially at
> > > > the
> > > > point:
> > > >
> > > >         /* some buggy drivers require the device resumed before
> > prepared;
> > > >          * when a device has RESUME flag and is in SUSPENDED state,
> > > > resume
> > > >          * here but immediately drop to bring it to a sane active state.
> > > >          */
> > > >         if (state == SND_PCM_STATE_SUSPENDED &&
> > > >             (direct->spcm->info & SND_PCM_INFO_RESUME)) {
> > > >                 snd_pcm_resume(direct->spcm);
> > > >                 snd_pcm_drop(direct->spcm);
> > > >                 snd_pcm_direct_timer_stop(direct);
> > > >                 snd_pcm_direct_clear_timer_queue(direct);
> > > >         }
> > > >
> > > > Try to put debug prints or catch via breakpoint whether this code
> > > > path is executed.
> > > >
> > > > Also, does the issue happen with the latest 6.11-rc kernel, too?
> > > > If yes, what if you drop SNDRV_PCM_INFO_RESUME bit flag in the
> > > > driver side?  Does the problem persist, or it works?
> > > >
> > >
> > > I'm working on kernel 6.6 and alsa-lib v1.2.11. It's not so outdated I
> > > think and then I will try to switch on the latest version.
> > >
> > > Indeed I did some debug on this part. Please see my comments inline.
> > >
> > > int snd_pcm_direct_slave_recover(snd_pcm_direct_t *direct) {
> > >       ...
> > >
> > >       /* [Chancel]
> > >        * When two dmix clients run in parallel we get two direct dmix
> > instances.
> > >        * 1st dmix->spcm->info has SND_PCM_INFO_RESUME flag but 2nd
> > dmix doesn't.
> > 
> > OK, that must be the cause.  It's because the second open copies the saved
> > shmem->s.info into spcm->info at its open time while we already dropped the
> > INFO_RESUME bit.  All the rest behavior are side effect of this inconsistency.
> > 
> > I guess dropping the INFO_RESUME bit at hw_params and hw_refine should
> > work instead.  A totally untested fix is below.
> > 
> > (And I believe the drop of INFO_PAUSE should be handled similarly,  too,
> > instead of dropping spcm->info bit there.)
> > 
> > 
> > Takashi
> > 
> > --- a/src/pcm/pcm_direct.c
> > +++ b/src/pcm/pcm_direct.c
> > @@ -1018,6 +1018,7 @@ int snd_pcm_direct_hw_refine(snd_pcm_t *pcm,
> > snd_pcm_hw_params_t *params)
> >         }
> >         dshare->timer_ticks = hw_param_interval(params,
> > SND_PCM_HW_PARAM_PERIOD_SIZE)->max / dshare->slave_period_size;
> >         params->info = dshare->shmptr->s.info;
> > +       params->info &= ~SND_PCM_INFO_RESUME;
> >  #ifdef REFINE_DEBUG
> >         snd_output_puts(log, "DMIX REFINE (end):\n");
> >         snd_pcm_hw_params_dump(params, log); @@ -1031,6 +1032,7
> > @@ int snd_pcm_direct_hw_params(snd_pcm_t *pcm,
> > snd_pcm_hw_params_t * params)
> >         snd_pcm_direct_t *dmix = pcm->private_data;
> > 
> >         params->info = dmix->shmptr->s.info;
> > +       params->info &= ~SND_PCM_INFO_RESUME;
> >         params->rate_num = dmix->shmptr->s.rate;
> >         params->rate_den = 1;
> >         params->fifo_size = 0;
> > @@ -1183,8 +1185,6 @@ static void save_slave_setting(snd_pcm_direct_t
> > *dmix, snd_pcm_t *spcm)
> >         COPY_SLAVE(buffer_time);
> >         COPY_SLAVE(sample_bits);
> >         COPY_SLAVE(frame_bits);
> > -
> > -       dmix->shmptr->s.info &= ~SND_PCM_INFO_RESUME;
> >  }
> > 
> >  #undef COPY_SLAVE
> 
> Thanks Takashi,
> 
> This patch can fix this issue on my side. From my test both dmix1->spcm->info and
> dmix2->spcm->info has SND_PCM_INFO_RESUME flag and snd_pcm_resume() can be
> successfully called by first resumed instance. I don't understand this patch well. Are
> you meant to drop SND_PCM_INFO_RESUME from dmix and keep it in slave pcm?

Yes.  The intention of dropping INFO_RESUME is because dmix can't do
the full resume due to its implementation nature.  It needs a prepare
/ restart like many other drivers.  So we have to drop the info bit
exposed to the outside for apps, while keeping the slave PCM info
internally intact.

> BTW, when will this patch merged to mainline?

Now the test result is positive, I'm going to submit & merge later.


thanks,

Takashi
