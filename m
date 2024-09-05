Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8149196DA7A
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 15:36:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B88DA4B;
	Thu,  5 Sep 2024 15:36:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B88DA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725543387;
	bh=NZncUcdtUK8o+GZKU5l8QYyoFH7BmEV2aa7uZP4Yl8M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iocPbJEmue+nnstkas66MIQxzH25fzPym0EIm14tYLbPzDwYwaYr4zoGTFk6NVcoG
	 AgqT0jEZLUOKSSwVn3VnpmK2c1YTFXV3gakh1fdH4RFjBqMa0pBeMRBtYPSL8vbGNt
	 K40+RtXLULG07QP8w/mHBi5GsIofa9lEDZw/dick=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48F93F805B0; Thu,  5 Sep 2024 15:35:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F260F805B1;
	Thu,  5 Sep 2024 15:35:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AACDF8016C; Thu,  5 Sep 2024 15:35:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5425CF80116
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 15:35:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5425CF80116
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=nnGGobnS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/qd//4mw;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=nnGGobnS;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/qd//4mw
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 877411F7D4;
	Thu,  5 Sep 2024 13:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1725543348;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rtAsCpjIR7WobBBBnMsN99qPqayxv02MwKEJs5xRs/U=;
	b=nnGGobnSjsvHKhIjb/oQwJ2CkVMWVgsut5cUMIkWmHxnQBlPvpMwWp07vfEjkYurH3nowS
	MV+I6iIwkPFSBDFiVT9lBL1SVX/pxcPoVE3s0ZL0GmCQH0DWppGEq58q7Q5G0Z9q/wEEDu
	LJuLV/iO9jywNh3CUgWpX0Apqfg9JA0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725543348;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rtAsCpjIR7WobBBBnMsN99qPqayxv02MwKEJs5xRs/U=;
	b=/qd//4mwfFTPIjQ9QC7Cx8PSXD2Xr5PiwtonzkkEDQ36fRqAHD7m9qofVop8/6jHmDpcai
	RFzYQFSc9sfULnAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1725543348;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rtAsCpjIR7WobBBBnMsN99qPqayxv02MwKEJs5xRs/U=;
	b=nnGGobnSjsvHKhIjb/oQwJ2CkVMWVgsut5cUMIkWmHxnQBlPvpMwWp07vfEjkYurH3nowS
	MV+I6iIwkPFSBDFiVT9lBL1SVX/pxcPoVE3s0ZL0GmCQH0DWppGEq58q7Q5G0Z9q/wEEDu
	LJuLV/iO9jywNh3CUgWpX0Apqfg9JA0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725543348;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rtAsCpjIR7WobBBBnMsN99qPqayxv02MwKEJs5xRs/U=;
	b=/qd//4mwfFTPIjQ9QC7Cx8PSXD2Xr5PiwtonzkkEDQ36fRqAHD7m9qofVop8/6jHmDpcai
	RFzYQFSc9sfULnAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6467D13419;
	Thu,  5 Sep 2024 13:35:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yIU/F7Sz2WbjCAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 05 Sep 2024 13:35:48 +0000
Date: Thu, 05 Sep 2024 15:36:34 +0200
Message-ID: <877cbqgr31.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	Jaroslav
 Kysela <perex@perex.cz>,
	"S.J. Wang" <shengjiu.wang@nxp.com>
Subject: Re: [EXT] Re: Suspend/resume Issue on pcm_dmix.c in alsa-lib
In-Reply-To: 
 <DB9PR04MB9498BE3E297E22281C0E6914E39D2@DB9PR04MB9498.eurprd04.prod.outlook.com>
References: 
 <DB9PR04MB94988752ED7C43B399E0BC00E3942@DB9PR04MB9498.eurprd04.prod.outlook.com>
	<87msky1bqh.wl-tiwai@suse.de>
	<DB9PR04MB9498F7BBF2688256DEE7D5F2E39C2@DB9PR04MB9498.eurprd04.prod.outlook.com>
	<877cbrkafv.wl-tiwai@suse.de>
	<DB9PR04MB94980B82ACA8CFF33EF14626E39D2@DB9PR04MB9498.eurprd04.prod.outlook.com>
	<87ed5yh66b.wl-tiwai@suse.de>
	<DB9PR04MB9498BE3E297E22281C0E6914E39D2@DB9PR04MB9498.eurprd04.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-2022-JP
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
Message-ID-Hash: OHHF3AF4HGMVN6OWNN5CKVFTBOBZZ5RJ
X-Message-ID-Hash: OHHF3AF4HGMVN6OWNN5CKVFTBOBZZ5RJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OHHF3AF4HGMVN6OWNN5CKVFTBOBZZ5RJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 05 Sep 2024 13:01:11 +0200,
Chancel Liu wrote:
> 
> > > > > Hi Takashi,
> > > > >
> > > > > Thanks for your reply and suggestions. Finally we have found the root
> > cause.
> > > > > Seems it's related to both drivers and alsa-lib.
> > > > >
> > > > > When two dmix clients run in parallel we get two direct dmix instances.
> > > > > 1st dmix instance:
> > > > > snd_pcm_dmix_open()
> > > > >       snd_pcm_direct_initialize_slave()
> > > > >               save_slave_setting()
> > > > > Since the driver we are using has SND_PCM_INFO_RESUME flag,
> > > > > dmix->spcm->info has this flag. Then this flag is cleared in
> > > > dmix->shmptr->s.info.
> > > > >
> > > > > 2nd dmix instance:
> > > > > snd_pcm_dmix_open()
> > > > >       snd_pcm_direct_open_secondary_client()
> > > > >               copy_slave_setting()
> > > > > 2nd dmix->spcm->info is copied from dmix->shmptr->s.info so it doesn'
> > > > > has this flag.
> > > > >
> > > > > If 1st dmix instance resumes firstly it should implement recovery of
> > > > > slave pcm in snd_pcm_direct_slave_recover(). Because 1st
> > > > > dmix->spcm->info has
> > > > > SND_PCM_INFO_RESUME，snd_pcm_resume(direct->spcm) can be called
> > > > > correctly to resume slave pcm.
> > > >
> > > > ... and immediately stop the stream, then prepare and restart as a usual
> > > > restart.
> > > >
> > > > > However if 2nd dmix instance resumes firstly,
> > > > > snd_pcm_resume(direct->spcm) will not be called because it's
> > > > > spcm->info doesn't has SND_PCM_INFO_RESUME flag. The 1st dmix
> > instance
> > > > > assumes someone else already did recovery so
> > > > > snd_pcm_resume(direct->spcm) won't be called neither. In result the
> > > > > slave pcm fails to resume.
> > > >
> > > > Something wrong happening here, then.
> > > >
> > > > In dmix, there is no hardware resume at all, but it's always a restart of the
> > > > stream.  The call of snd_pcm_resume() is only temporarily for
> > inconsistencies
> > > > that can be a problem on some drivers (IIRC dmaengine stuff).  That said,
> > > > dmix does a kind of fake resume, stops and restarts the stream cleanly on
> > the
> > > > first instance.  On the second instance, it's already recovered, hence it
> > bails
> > > > out.
> > > >
> > > > If poll() hangs on the second instance, there can be some other problem.
> > > > Maybe the resume -> stop -> restart sequence doesn't work with your
> > driver
> > > > well?
> > > >
> > >
> > > Our dma driver will do PAUSE in system suspend and requires doing RESUME
> > in
> > > system resume. Current problem is that snd_pcm_resume() is not called by
> > both
> > > 1st instance and 2nd instance.
> > 
> > That's weird.  Are you really testing with the latest alsa-lib code?
> > 
> > If application doesn't call snd_pcm_resume(), it means that the PCM
> > state isn't set to SUSPENDED, so it pretends as if still running.
> > 
> > Or if you mean that snd_pcm_resume() to the slave PCM isn't called
> > (even though snd_pcm_resume() is called for the dmix PCM), check
> > whether snd_pcm_direct_slave_recover() gets called, especially at the
> > point:
> > 
> >         /* some buggy drivers require the device resumed before prepared;
> >          * when a device has RESUME flag and is in SUSPENDED state,
> > resume
> >          * here but immediately drop to bring it to a sane active state.
> >          */
> >         if (state == SND_PCM_STATE_SUSPENDED &&
> >             (direct->spcm->info & SND_PCM_INFO_RESUME)) {
> >                 snd_pcm_resume(direct->spcm);
> >                 snd_pcm_drop(direct->spcm);
> >                 snd_pcm_direct_timer_stop(direct);
> >                 snd_pcm_direct_clear_timer_queue(direct);
> >         }
> > 
> > Try to put debug prints or catch via breakpoint whether this code path
> > is executed.
> > 
> > Also, does the issue happen with the latest 6.11-rc kernel, too?
> > If yes, what if you drop SNDRV_PCM_INFO_RESUME bit flag in the driver
> > side?  Does the problem persist, or it works?
> > 
> 
> I'm working on kernel 6.6 and alsa-lib v1.2.11. It's not so outdated I think and
> then I will try to switch on the latest version.
> 
> Indeed I did some debug on this part. Please see my comments inline.
> 
> int snd_pcm_direct_slave_recover(snd_pcm_direct_t *direct)
> {
> 	...
> 	
> 	/* [Chancel]
> 	 * When two dmix clients run in parallel we get two direct dmix instances.
> 	 * 1st dmix->spcm->info has SND_PCM_INFO_RESUME flag but 2nd dmix doesn't.

OK, that must be the cause.  It's because the second open copies the
saved shmem->s.info into spcm->info at its open time while we already
dropped the INFO_RESUME bit.  All the rest behavior are side effect of
this inconsistency.

I guess dropping the INFO_RESUME bit at hw_params and hw_refine should
work instead.  A totally untested fix is below.

(And I believe the drop of INFO_PAUSE should be handled similarly,
 too, instead of dropping spcm->info bit there.)


Takashi

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
