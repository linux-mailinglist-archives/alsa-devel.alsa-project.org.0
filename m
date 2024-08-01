Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BAD9449D1
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 12:56:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A9E53C89;
	Thu,  1 Aug 2024 12:55:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A9E53C89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722509747;
	bh=3S77w1Xdj4sjt0GavF7TflXe5fmeRetRhxudSfMRh+s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cQZ6vJ5KbpW4r33D0yVg+1FrRiIPuYNrIm3c36hMziubGOKjepx7bThEqIaCwE0Zf
	 z62SQqoWhRRnzsQUThS2auvlXL7pXBkYLMWM3j7pAS9eFWfIfG0bqQUtdmFyzQCmL7
	 eE1moHA8e0ZPt2bY7oE4r1mHx0Av4uFKsqmhftZk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 990D3F805AD; Thu,  1 Aug 2024 12:55:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA2CFF805B0;
	Thu,  1 Aug 2024 12:55:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33BF9F802DB; Thu,  1 Aug 2024 12:48:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 846AEF8019B
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 12:48:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 846AEF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=cDdy7DhD;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=zzlubY6d;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=cDdy7DhD;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=zzlubY6d
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 412C61FB45;
	Thu,  1 Aug 2024 10:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1722509296;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9rRT5f2lfto24xGLd1ocjYE1HNuuqJWD7CDMwrXX7hQ=;
	b=cDdy7DhDo1FFHROw2vQBR+Y8+WTJ2WE5aZ7FNeXM+IrZB9Ft9Mq4c9kruHvkEU9KL5doqL
	Sl1q0Q72mpOXXdPaxR7tpuR7GyTPXSN9FqeZCUPWBX8k+uIH8Fsr+p7JnWjWy4qrGyCJ0C
	i0NYHynOx3l58nUGsHHhu6RIgIF0qSE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722509296;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9rRT5f2lfto24xGLd1ocjYE1HNuuqJWD7CDMwrXX7hQ=;
	b=zzlubY6df5FMoQB1d0+J/0aoc8/dOhgcK1Nb+PIx0YhzL0p/1Ts5UbHWnNEBipLnA/CWgd
	F6LSAZPbOsvJq9Dw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=cDdy7DhD;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zzlubY6d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1722509296;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9rRT5f2lfto24xGLd1ocjYE1HNuuqJWD7CDMwrXX7hQ=;
	b=cDdy7DhDo1FFHROw2vQBR+Y8+WTJ2WE5aZ7FNeXM+IrZB9Ft9Mq4c9kruHvkEU9KL5doqL
	Sl1q0Q72mpOXXdPaxR7tpuR7GyTPXSN9FqeZCUPWBX8k+uIH8Fsr+p7JnWjWy4qrGyCJ0C
	i0NYHynOx3l58nUGsHHhu6RIgIF0qSE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1722509296;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9rRT5f2lfto24xGLd1ocjYE1HNuuqJWD7CDMwrXX7hQ=;
	b=zzlubY6df5FMoQB1d0+J/0aoc8/dOhgcK1Nb+PIx0YhzL0p/1Ts5UbHWnNEBipLnA/CWgd
	F6LSAZPbOsvJq9Dw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 20CE8136CF;
	Thu,  1 Aug 2024 10:48:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xU3MBvBnq2aJPgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 Aug 2024 10:48:16 +0000
Date: Thu, 01 Aug 2024 12:48:53 +0200
Message-ID: <8734noecx6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
	Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 00/12] ALSA/ASoC: use snd_pcm_direction_name()
In-Reply-To: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
References: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-5.31 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 412C61FB45
Message-ID-Hash: OXNOBTM4L6ANUOQAX7J52YDRV2DXXGMS
X-Message-ID-Hash: OXNOBTM4L6ANUOQAX7J52YDRV2DXXGMS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OXNOBTM4L6ANUOQAX7J52YDRV2DXXGMS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 30 Jul 2024 04:04:43 +0200,
Kuninori Morimoto wrote:
> 
> 
> Hi Tatasi, Mark
> 
> Many drivers are selecting strings "playback" / "capture" by own
> handling, but we have snd_pcm_direction_name() function for it.
> This patch use it.
> 
> One note is that snd_pcm_direction_name() will select
> "Playback" and "Capture", instead of "playback" / "capture".
> Almost all drivers are using it as dev_dbg() or dev_err()
> so no problem. But some other drivers are using it as other
> purpose. It might be issue (?). For example ASoC debugfs dir name
> will be changed by this patch.
> 
> Kuninori Morimoto (12):
>   ALSA: pci: pcxhr: use snd_pcm_direction_name()
>   ALSA: pci: rme9652: use snd_pcm_direction_name()
>   ALSA: trace: use snd_pcm_direction_name()
>   ALSA: aloop: use snd_pcm_direction_name()
>   ALSA: pcm_timer: use snd_pcm_direction_name()
>   ASoC: stm: use snd_pcm_direction_name()
>   ASoC: sof: pcm: use snd_pcm_direction_name()
>   ASoC: sof: intel: use snd_pcm_direction_name()
>   ASoC: fsl: lpc3xxx-i2s: use snd_pcm_direction_name()
>   ASoC: tegra: use snd_pcm_direction_name()
>   ASoC: soc-pcm: use snd_pcm_direction_name()
>   ASoC: soc-dapm: use snd_pcm_direction_name()

Applied from patch 1 to 5 to for-next branch.
I leave the rest for ASoC to Mark.


thanks,

Takashi
