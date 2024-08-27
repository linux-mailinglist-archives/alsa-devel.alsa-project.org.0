Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB61C960883
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2024 13:25:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D632DB70;
	Tue, 27 Aug 2024 13:25:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D632DB70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724757930;
	bh=KUISeYrzjhw6/aw5hwkwuvLK8ZfT66Za9la1C4MlMKY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tBSFkwoXiWyQ+p69RJFKfNouheU9Fzsx2LNFq6Y/mqXMnnGE6zQ48/tn3bZUi6ncv
	 +6kpKYTRXR67gaF4M4tcsq2bX2VET8s6T41fwzOafXkiuDys0X4gSpeqUp3Fd/KJ7j
	 fiEtFKdTHrDgzrh5Ba1mnZqsk+5q0S+VV3DmBC2Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 663E2F805D9; Tue, 27 Aug 2024 13:25:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAB21F805C0;
	Tue, 27 Aug 2024 13:25:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 891E7F80087; Tue, 27 Aug 2024 12:55:59 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04215F80087
	for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2024 12:49:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04215F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=uX3PeLlL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=vJ/aRcUf;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=fOwbIgxl;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=vs+Rymgu
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EBE411FB5F;
	Tue, 27 Aug 2024 10:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1724755754;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cnTFQ9Z2+TGCb+JVmoZXRZsj0m6fiDVuTrKd0R9ozUY=;
	b=uX3PeLlL/DeOvvRURk/3TemF3m68HqpSugUZNRmYRzLVYz/R1YpczTvVghZf6bZywZfmVO
	WpHNJ4LllY7OsE+wThPsRtHeQi2gsPTLa6gOlpUmDTBtCTkwIqDBO5kJ3G6efqOHds4w04
	vg8uR6recmOFIje4ZFCpQUb45ozNtp8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724755754;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cnTFQ9Z2+TGCb+JVmoZXRZsj0m6fiDVuTrKd0R9ozUY=;
	b=vJ/aRcUfaMMHpIJAjjlNULZDy7coesPqyQoXMo8siU0uOKocAb5TZh8OgQelnx/AN/jvKZ
	fNpzOnNEojICkEDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fOwbIgxl;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vs+Rymgu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1724755753;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cnTFQ9Z2+TGCb+JVmoZXRZsj0m6fiDVuTrKd0R9ozUY=;
	b=fOwbIgxlcXcXxq5Ip+niH0pnNZ6aTw6ZfAT9H0Yt/v8KBRWQpx81mIOg5/fJdN0q8DtPd0
	TL+ih12IFYx9ADqHWhkkxN2i72dOsJyVm9/xh7JSihnL2+x2PSkw5ZKAFNnRyZ1iUxHLOg
	BsOI1rBCoJhj5VDxAUZyJ1QJ/R8LH4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724755753;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cnTFQ9Z2+TGCb+JVmoZXRZsj0m6fiDVuTrKd0R9ozUY=;
	b=vs+RymguBipw1Hw87xp7+QKtTiOKfA/lzWeBtaVg2laDVqmNCyb9d20mZS7lx3Bt6Rtg8v
	kZxWV/EmAwpG9qBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CAF4013724;
	Tue, 27 Aug 2024 10:49:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gIp7MCmvzWb0PwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Aug 2024 10:49:13 +0000
Date: Tue, 27 Aug 2024 12:49:58 +0200
Message-ID: <87msky1bqh.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	Jaroslav Kysela <perex@perex.cz>,
	"S.J. Wang" <shengjiu.wang@nxp.com>
Subject: Re: Suspend/resume Issue on pcm_dmix.c in alsa-lib
In-Reply-To: 
 <DB9PR04MB94988752ED7C43B399E0BC00E3942@DB9PR04MB9498.eurprd04.prod.outlook.com>
References: 
 <DB9PR04MB94988752ED7C43B399E0BC00E3942@DB9PR04MB9498.eurprd04.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EBE411FB5F
X-Spam-Level: 
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -5.51
X-Spam-Flag: NO
Message-ID-Hash: BWR2RFTILEKOST2QMR5ECXAKDJTFIDUI
X-Message-ID-Hash: BWR2RFTILEKOST2QMR5ECXAKDJTFIDUI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BWR2RFTILEKOST2QMR5ECXAKDJTFIDUI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

[ it seems that my previous post didn't go out properly, so resent;
  if you've seen already the same, please disregard ]

On Tue, 27 Aug 2024 09:06:39 +0200,
Chancel Liu wrote:
> 
> 
> Hi Takashi Iwai, Jaroslav Kysela
> 
> We found an issue on dmix in alsa-lib when do suspend and resume. It can be
> easily reproduced by following steps:
> 
> 1. Run two dmix clients in parallel. (Only one client doesn¢t has such issue)
> 
> ~# aplay xxx1.wav &
> 
> ~# aplay xxx2.wav &
> 
> Here I attach the asound.conf we're using.
> 
> ~# cat /etc/asound.conf
> 
> defaults.pcm.rate_converter "linear"
> 
> pcm.dmix_44100{
> 
>     type dmix
> 
>     ipc_key 5678293
> 
>     ipc_key_add_uid yes
> 
>     slave{
> 
>         pcm "hw:0,0"
> 
>         period_time 40000
> 
>         format S16_LE
> 
>         rate 44100
> 
>         }
> 
> }
> 
> pcm.asymed{
> 
>     type asym
> 
>     playback.pcm "dmix_44100"
> 
>     capture.pcm "dsnoop_44100"
> 
> }
> 
> pcm.!default{
> 
>     type plug
> 
>     route_policy "average"
> 
>     slave.pcm "asymed"
> 
> }
> 
> 2. Let linux enter into suspend and then resume(Repeat this step if not
> reproduced)
> 
> 3. After resume, aplay will get stuck in snd_pcm_wait(). The GDB shows:
> 
> (gdb) bt
> 
> #0  0x0000fffff7da9264 in __GI___poll (fds=fds@entry=0xfffffffff480, nfds=
> nfds@entry=1, timeout=timeout@entry=240)
> 
>     at /usr/src/debug/glibc/2.39+git/sysdeps/unix/sysv/linux/poll.c:41
> 
> #1  0x0000fffff7edf468 in poll (__timeout=240, __nfds=1, __fds=0xfffffffff480)
> 
> #2  snd1_pcm_wait_nocheck (pcm=pcm@entry=0xaaaaaaad2cb0, timeout=240,
> timeout@entry=-10001) at pcm.c:2993
> 
> #3  0x0000fffff7ee54a0 in snd1_pcm_write_areas (pcm=pcm@entry=0xaaaaaaad2cb0,
> areas=areas@entry=0xfffffffff560, offset=<optimized out>, offset@entry=0, size
> =<optimized out>,
> 
>     size@entry=1768, func=func@entry=0xfffff7ef5190
> <snd_pcm_plugin_write_areas>) at pcm.c:7699
> 
> #4  0x0000fffff7ef5020 in snd_pcm_plugin_writei (pcm=0xaaaaaaad2cb0, buffer=
> <optimized out>, size=1768) at pcm_plugin.c:354
> 
> It seems that sometimes after suspend and resume there's no available space
> for data written into buffer. Then aplay keeps stuck in snd_pcm_wait(). I
> checked the hw_ptr of dmix and found that hw_ptr is always 0 after resume.
> 
> I don't have a solution now so I turn to you for help. The version of alsa-lib
> is v1.2.11. Could you please help check it?

I tried your setup but I couldn't reproduce the issue locally with my
laptop and HD-audio device.  Possibly depending on the kernel driver?

In the case of dmix, it's a poll() against the PCM slave timer.  So
it doesn't take care of suspend/resume state unlike the real PCM
device.  OTOH, the timer device should send notification events at
suspend/resume, and it should trigger the poll wakeup, too.

Does poll() return after the suspend/resume once but falls into a loop
due to revents being unset?  Or it's stuck and never returns at
suspend/resume?


thanks,

Takashi
