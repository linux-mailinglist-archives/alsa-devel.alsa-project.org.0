Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D14DF893A64
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 12:52:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1104322AD;
	Mon,  1 Apr 2024 12:52:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1104322AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711968730;
	bh=TYTEdBIVC1Z/oTSAVS9915oEtXy+luiZF3wGunPuO2k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Np+ZGmopBjii1qjp7leItu56FubYacwgds0OQwzAHSE7PYaKcvbzX/Qq4731v45Br
	 5PH/nJU1tXm51193clke+vO13ks+9TA1aDoAy18guGTRZSuhKNoi9H1PmxQbY2FijO
	 4QpCk9po+ExUO58+E09HkueGuYak5HJbhrYiI/FY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4B36F805AB; Mon,  1 Apr 2024 12:51:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3D9DF80589;
	Mon,  1 Apr 2024 12:51:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 309B3F80236; Mon,  1 Apr 2024 12:51:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6679BF8016E
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 12:51:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6679BF8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ZF4ALryS;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=TnasG9lr
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A9AE633935;
	Mon,  1 Apr 2024 10:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1711968688;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0vjnYvWxTz0+ZehwqZVhDxLca96L+LN3bWSSurhMugo=;
	b=ZF4ALryS6mIB/E5CLxlyPgaUbGMtuvADRq1vVt6abjhEsVwIg5fFraUIdpSU8pqzZIANbB
	tVlT/90m/fGYhHCBEEZmFBniYOx06ulN8/GN3BlrS0qtVE67H64Wp0J8OX686N+LYCnRxe
	j5KNw0HPzMQQFziPe1nFt7cfHjX6ycE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711968688;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0vjnYvWxTz0+ZehwqZVhDxLca96L+LN3bWSSurhMugo=;
	b=TnasG9lrTw7Y3kjM0w6DTK1jp/39FOrJnyEWJUwvFb82pTxcsgBYzWu0OWygiF6RVfwQ8e
	gLdYBWlNqLCWzcDg==
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B3571348C;
	Mon,  1 Apr 2024 10:51:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id C8Q0HLCRCmakfwAAn2gu4w
	(envelope-from <tiwai@suse.de>); Mon, 01 Apr 2024 10:51:28 +0000
Date: Mon, 01 Apr 2024 12:51:32 +0200
Message-ID: <87r0fp5paj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: Re: [PATCH 00/18] ALSA: emu10k1 & emux: fixes related to wavetable
 playback
In-Reply-To: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
References: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-0.53 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 FREEMAIL_TO(0.00)[gmx.de];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.23)[72.72%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de,internode.on.net];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FREEMAIL_CC(0.00)[alsa-project.org,perex.cz,internode.on.net];
	 RCVD_TLS_ALL(0.00)[]
Message-ID-Hash: A3PAYJRVWAWOCKVW3YWBIOY7NBH65AT4
X-Message-ID-Hash: A3PAYJRVWAWOCKVW3YWBIOY7NBH65AT4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A3PAYJRVWAWOCKVW3YWBIOY7NBH65AT4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 01 Apr 2024 12:07:24 +0200,
Oswald Buddenhagen wrote:
> 
> this fixes the regression i introduced (though arguably, i just made it broken
> in a different way), and then some more.
> 
> Oswald Buddenhagen (18):
>   ALSA: emux: fix /proc teardown at module unload
>   ALSA: emux: prune unused parameter from snd_soundfont_load_guspatch()
>   ALSA: emux: fix validation of snd_emux.num_ports
>   ALSA: emux: fix init of patch_info.truesize in load_data()
>   ALSA: emu10k1: prune vestiges of
>     SNDRV_SFNT_SAMPLE_{BIDIR,REVERSE}_LOOP support
>   ALSA: emux: centralize & improve patch info validation
>   ALSA: emux: improve patch ioctl data validation
>   ALSA: emu10k1: move patch loader assertions into low-level functions
>   ALSA: emu10k1: fix sample signedness issues in wavetable loader
>   ALSA: emu10k1: fix playback of 8-bit wavetable samples
>   ALSA: emu10k1: make wavetable sample playback start position exact
>   ALSA: emu10k1: shrink blank space in front of wavetable samples
>   ALSA: emu10k1: merge conditions in patch loader
>   ALSA: emu10k1: fix wavetable offset recalculation
>   ALSA: emu10k1: de-duplicate size calculations for 16-bit samples
>   ALSA: emu10k1: improve cache behavior documentation
>   ALSA: emu10k1: fix playback of short wavetable samples
>   ALSA: emux: simplify snd_sf_list.callback handling

Could you give Fixes tag in each commit if it's a regression fix for
the  corresponding commit?


thanks,

Takashi
