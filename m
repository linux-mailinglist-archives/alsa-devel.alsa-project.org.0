Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9FE96B78A
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 11:57:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A730B70;
	Wed,  4 Sep 2024 11:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A730B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725443871;
	bh=/4F4jCsOnN9cUIlBqMZOqaOFslH5cm0T64+c72G1cS4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZbSLiOZeYa79nJvSxje0so4ezFQvw74kWUu39BixXGh5Ic6j5hGicnOBbQvqwKL9F
	 2n5ZrYPY8ztsfs9QVgkFBSQUROMMUJxxJ4fBQKLWqCNhKSR78C2+6/alp2cE4CDVn/
	 9p5fpepqGx9OSddrURzUL9Udt5CC4XpU0n/l3LhY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5549FF80027; Wed,  4 Sep 2024 11:57:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16069F805AF;
	Wed,  4 Sep 2024 11:57:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE125F80199; Wed,  4 Sep 2024 11:57:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5DBF5F80107
	for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2024 11:57:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DBF5F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=tZB/iJrn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=VXS3XCmZ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=tZB/iJrn;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=VXS3XCmZ
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3CBCD1F7B4;
	Wed,  4 Sep 2024 09:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1725443830;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nUK7Oq25vYqwVhgfLnjPAoWdMfgveyiNuGkEE9Vw62o=;
	b=tZB/iJrn75ZS3FGvWxQzFil0gpnPO2dw7qupj5YIDjnjTZGX/GgXwiKl8cchqjch/tu0K/
	cZ/ZgVceigf78KzEPFh7tkk7TZKpL+LgTfQj8Lx+yiPx6R9ns5mJKIp3unln4VSHH03w73
	coUIInzA2Z4i1AXJ75oEfKKq8b5cp2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725443830;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nUK7Oq25vYqwVhgfLnjPAoWdMfgveyiNuGkEE9Vw62o=;
	b=VXS3XCmZlkCh+k6pbcbLFmcvaDPLfgyEk05c/V5xW4+rBBVSKq/HVC0WJ4z9iVxVhCnvEe
	AGJZ9ADswSwhJuAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="tZB/iJrn";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=VXS3XCmZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1725443830;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nUK7Oq25vYqwVhgfLnjPAoWdMfgveyiNuGkEE9Vw62o=;
	b=tZB/iJrn75ZS3FGvWxQzFil0gpnPO2dw7qupj5YIDjnjTZGX/GgXwiKl8cchqjch/tu0K/
	cZ/ZgVceigf78KzEPFh7tkk7TZKpL+LgTfQj8Lx+yiPx6R9ns5mJKIp3unln4VSHH03w73
	coUIInzA2Z4i1AXJ75oEfKKq8b5cp2c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725443830;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nUK7Oq25vYqwVhgfLnjPAoWdMfgveyiNuGkEE9Vw62o=;
	b=VXS3XCmZlkCh+k6pbcbLFmcvaDPLfgyEk05c/V5xW4+rBBVSKq/HVC0WJ4z9iVxVhCnvEe
	AGJZ9ADswSwhJuAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 19576139D2;
	Wed,  4 Sep 2024 09:57:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id a774BPYu2Gb4HgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Sep 2024 09:57:10 +0000
Date: Wed, 04 Sep 2024 11:57:56 +0200
Message-ID: <877cbrkafv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	Jaroslav
 Kysela <perex@perex.cz>,
	"S.J. Wang" <shengjiu.wang@nxp.com>
Subject: Re: Suspend/resume Issue on pcm_dmix.c in alsa-lib
In-Reply-To: 
 <DB9PR04MB9498F7BBF2688256DEE7D5F2E39C2@DB9PR04MB9498.eurprd04.prod.outlook.com>
References: 
 <DB9PR04MB94988752ED7C43B399E0BC00E3942@DB9PR04MB9498.eurprd04.prod.outlook.com>
	<87msky1bqh.wl-tiwai@suse.de>
	<DB9PR04MB9498F7BBF2688256DEE7D5F2E39C2@DB9PR04MB9498.eurprd04.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3CBCD1F7B4
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: 7V5CJKCMEJK3MC2H43DBFJWGSK4TLWFT
X-Message-ID-Hash: 7V5CJKCMEJK3MC2H43DBFJWGSK4TLWFT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7V5CJKCMEJK3MC2H43DBFJWGSK4TLWFT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 04 Sep 2024 11:07:30 +0200,
Chancel Liu wrote:
> 
> Hi Takashi,
> 
> Thanks for your reply and suggestions. Finally we have found the root cause. 
> Seems it's related to both drivers and alsa-lib.
> 
> When two dmix clients run in parallel we get two direct dmix instances.
> 1st dmix instance:
> snd_pcm_dmix_open()
> 	snd_pcm_direct_initialize_slave()
> 		save_slave_setting()
> Since the driver we are using has SND_PCM_INFO_RESUME flag, dmix->spcm->info
> has this flag. Then this flag is cleared in dmix->shmptr->s.info.
> 		
> 2nd dmix instance:
> snd_pcm_dmix_open()
> 	snd_pcm_direct_open_secondary_client()
> 		copy_slave_setting()
> 2nd dmix->spcm->info is copied from dmix->shmptr->s.info so it doesn' has this
> flag.
> 
> If 1st dmix instance resumes firstly it should implement recovery of slave pcm
> in snd_pcm_direct_slave_recover(). Because 1st dmix->spcm->info has
> SND_PCM_INFO_RESUME，snd_pcm_resume(direct->spcm) can be called correctly to
> resume slave pcm.

... and immediately stop the stream, then prepare and restart as a
usual restart.

> However if 2nd dmix instance resumes firstly, snd_pcm_resume(direct->spcm) will
> not be called because it's spcm->info doesn't has SND_PCM_INFO_RESUME flag. The
> 1st dmix instance assumes someone else already did recovery so
> snd_pcm_resume(direct->spcm) won't be called neither. In result the slave pcm
> fails to resume.

Something wrong happening here, then.

In dmix, there is no hardware resume at all, but it's always a restart
of the stream.  The call of snd_pcm_resume() is only temporarily for
inconsistencies that can be a problem on some drivers (IIRC dmaengine
stuff).  That said, dmix does a kind of fake resume, stops and
restarts the stream cleanly on the first instance.  On the second
instance, it's already recovered, hence it bails out.

If poll() hangs on the second instance, there can be some other
problem.  Maybe the resume -> stop -> restart sequence doesn't work
with your driver well?

> SND_PCM_INFO_RESUME flag has impact on the flow of dmix resume. In my opinion
> the first resumed dmix instance should make sure slave pcm can be recovered
> properly no matter it's the first opened instance or secondary opened instance
.

The snd_pcm_resume() gets called no matter which instance, just the
first one who tries to recover the suspended state.  (And it's called
internally at updating the various state, not necessarily an explicit
recovery call.)

> Do you know why the secondary opened instance clear the SND_PCM_INFO_RESUME
> flag? Can we do the following modification?
> 
> diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c
> @@ -1183,8 +1226,6 @@ static void save_slave_setting(snd_pcm_direct_t *dmix, snd_pcm_t *spcm)
>         COPY_SLAVE(buffer_time);
>         COPY_SLAVE(sample_bits);
>         COPY_SLAVE(frame_bits);
> -
> -       dmix->shmptr->s.info &= ~SND_PCM_INFO_RESUME;

I don't think so.  The clearance of the RESUME flag here is correct.
dmix doesn't support the hardware resume feature.  It does its own.
(And this flag is merely a info for apps, which isn't really evaluated
except for the code in dmix workaround there.)


Takashi

> 
> Regards, 
> Chancel Liu
> 
> > [ it seems that my previous post didn't go out properly, so resent;
> >   if you've seen already the same, please disregard ]
> > 
> > On Tue, 27 Aug 2024 09:06:39 +0200,
> > Chancel Liu wrote:
> > >
> > >
> > > Hi Takashi Iwai, Jaroslav Kysela
> > >
> > > We found an issue on dmix in alsa-lib when do suspend and resume. It
> > > can be easily reproduced by following steps:
> > >
> > > 1. Run two dmix clients in parallel. (Only one client doesnʼt has such
> > > issue)
> > >
> > > ~# aplay xxx1.wav &
> > >
> > > ~# aplay xxx2.wav &
> > >
> > > Here I attach the asound.conf we're using.
> > >
> > > ~# cat /etc/asound.conf
> > >
> > > defaults.pcm.rate_converter "linear"
> > >
> > > pcm.dmix_44100{
> > >
> > >     type dmix
> > >
> > >     ipc_key 5678293
> > >
> > >     ipc_key_add_uid yes
> > >
> > >     slave{
> > >
> > >         pcm "hw:0,0"
> > >
> > >         period_time 40000
> > >
> > >         format S16_LE
> > >
> > >         rate 44100
> > >
> > >         }
> > >
> > > }
> > >
> > > pcm.asymed{
> > >
> > >     type asym
> > >
> > >     playback.pcm "dmix_44100"
> > >
> > >     capture.pcm "dsnoop_44100"
> > >
> > > }
> > >
> > > pcm.!default{
> > >
> > >     type plug
> > >
> > >     route_policy "average"
> > >
> > >     slave.pcm "asymed"
> > >
> > > }
> > >
> > > 2. Let linux enter into suspend and then resume(Repeat this step if
> > > not
> > > reproduced)
> > >
> > > 3. After resume, aplay will get stuck in snd_pcm_wait(). The GDB shows:
> > >
> > > (gdb) bt
> > >
> > > #0  0x0000fffff7da9264 in __GI___poll (fds=fds@entry=0xfffffffff480,
> > > nfds= nfds@entry=1, timeout=timeout@entry=240)
> > >
> > >     at /usr/src/debug/glibc/2.39+git/sysdeps/unix/sysv/linux/poll.c:41
> > >
> > > #1  0x0000fffff7edf468 in poll (__timeout=240, __nfds=1,
> > > __fds=0xfffffffff480)
> > >
> > > #2  snd1_pcm_wait_nocheck (pcm=pcm@entry=0xaaaaaaad2cb0,
> > timeout=240,
> > > timeout@entry=-10001) at pcm.c:2993
> > >
> > > #3  0x0000fffff7ee54a0 in snd1_pcm_write_areas
> > > (pcm=pcm@entry=0xaaaaaaad2cb0, areas=areas@entry=0xfffffffff560,
> > > offset=<optimized out>, offset@entry=0, size =<optimized out>,
> > >
> > >     size@entry=1768, func=func@entry=0xfffff7ef5190
> > > <snd_pcm_plugin_write_areas>) at pcm.c:7699
> > >
> > > #4  0x0000fffff7ef5020 in snd_pcm_plugin_writei (pcm=0xaaaaaaad2cb0,
> > > buffer= <optimized out>, size=1768) at pcm_plugin.c:354
> > >
> > > It seems that sometimes after suspend and resume there's no available
> > > space for data written into buffer. Then aplay keeps stuck in
> > > snd_pcm_wait(). I checked the hw_ptr of dmix and found that hw_ptr is
> > always 0 after resume.
> > >
> > > I don't have a solution now so I turn to you for help. The version of
> > > alsa-lib is v1.2.11. Could you please help check it?
> > 
> > I tried your setup but I couldn't reproduce the issue locally with my laptop and
> > HD-audio device.  Possibly depending on the kernel driver?
> > 
> > In the case of dmix, it's a poll() against the PCM slave timer.  So it doesn't take
> > care of suspend/resume state unlike the real PCM device.  OTOH, the timer
> > device should send notification events at suspend/resume, and it should trigger
> > the poll wakeup, too.
> > 
> > Does poll() return after the suspend/resume once but falls into a loop due to
> > revents being unset?  Or it's stuck and never returns at suspend/resume?
> > 
> > 
> > thanks,
> > 
> > Takashi
