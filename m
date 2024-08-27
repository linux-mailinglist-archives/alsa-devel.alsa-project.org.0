Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E626960880
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2024 13:25:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 860CA82C;
	Tue, 27 Aug 2024 13:25:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 860CA82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724757920;
	bh=lg80m3bbRV8aQWN3QBlfRNByV1b6pgldUsLoJ5vhwJk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MfcZJEi7OK31nsD+sHYl0OixD8tCkstcYo38D4A0SKlQNQM9dvVdN/2YQ7PpDLD8b
	 rv68erjuIwrRkgoiEeHNLsaEAt3qmRR1j5ueyyUPVELuC5g563g0OtlcEgjwJgPecj
	 SzDKIrEUZYAH3nIUWdTqy/mTj0F8vkdSLnYGeQjY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3A42F805B4; Tue, 27 Aug 2024 13:24:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AECC3F805B1;
	Tue, 27 Aug 2024 13:24:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A1D5F80107; Tue, 27 Aug 2024 12:01:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8538F80301
	for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2024 11:54:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8538F80301
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=iQwnOPuf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=5AwI/x2l;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=iQwnOPuf;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=5AwI/x2l
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A913C1FB52;
	Tue, 27 Aug 2024 09:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1724752424;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GpLvkHJ8C9brc+hC9rvDMRBS/LTx2U69Ldf8cCZoiX4=;
	b=iQwnOPuftegz8h3ugnk/YP6Wpz+QaPInG1u/n6VsZ6FgBq43Zm+fhNzn7FfGzjowLvPNKO
	tVgD+UbKHW8ozek4qGwiAQOEGm9b3I0kOQmzVswI3komq0gvCcS3Czt/LHLZWuVyYmXm49
	VeBiZ4zWTgmOczYIfkNzE8kMSwrExI8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724752424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GpLvkHJ8C9brc+hC9rvDMRBS/LTx2U69Ldf8cCZoiX4=;
	b=5AwI/x2le4m/6ozdgOjxkQAmH9Fo/bVrmPdCXDyLy2UcooMF5gqcoQtk+eaHIpDG0oWHxv
	TIguhRHfCqAP3PCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=iQwnOPuf;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="5AwI/x2l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1724752424;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GpLvkHJ8C9brc+hC9rvDMRBS/LTx2U69Ldf8cCZoiX4=;
	b=iQwnOPuftegz8h3ugnk/YP6Wpz+QaPInG1u/n6VsZ6FgBq43Zm+fhNzn7FfGzjowLvPNKO
	tVgD+UbKHW8ozek4qGwiAQOEGm9b3I0kOQmzVswI3komq0gvCcS3Czt/LHLZWuVyYmXm49
	VeBiZ4zWTgmOczYIfkNzE8kMSwrExI8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1724752424;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GpLvkHJ8C9brc+hC9rvDMRBS/LTx2U69Ldf8cCZoiX4=;
	b=5AwI/x2le4m/6ozdgOjxkQAmH9Fo/bVrmPdCXDyLy2UcooMF5gqcoQtk+eaHIpDG0oWHxv
	TIguhRHfCqAP3PCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9704613A44;
	Tue, 27 Aug 2024 09:53:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 76FUJCiizWbSLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 27 Aug 2024 09:53:44 +0000
Date: Tue, 27 Aug 2024 11:54:29 +0200
Message-ID: <87r0aa1eay.wl-tiwai@suse.de>
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
X-Rspamd-Queue-Id: A913C1FB52
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: SNPVFBTYDEN4UNQPADHZGNLHC3HDYQRA
X-Message-ID-Hash: SNPVFBTYDEN4UNQPADHZGNLHC3HDYQRA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SNPVFBTYDEN4UNQPADHZGNLHC3HDYQRA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

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
