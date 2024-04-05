Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0FD899956
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Apr 2024 11:21:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AC392D1A;
	Fri,  5 Apr 2024 11:21:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AC392D1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712308872;
	bh=Hitw+OKyIjvFyk3sT1mZHnOoKL1sqaPCUYTdbfBpADo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ibwrMm9L2MvT181wtz8pGFHipfphbp+oE+kVpRAzWyHsIilFwPuOOo5i5K5sw4I+Y
	 Ru16hfQv/PFfZCPZPppbkVPx4uDaEr5eNRuTTgSQT/MJLOc1sRigG9hmlR9FdFRwIk
	 sSrgLARhSKGNKnbBCw41chvBVe0lYLZACPtyJX2w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9063F8057B; Fri,  5 Apr 2024 11:20:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31ED5F8059F;
	Fri,  5 Apr 2024 11:20:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 767D8F8020D; Fri,  5 Apr 2024 11:20:36 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 07CB9F80007
	for <alsa-devel@alsa-project.org>; Fri,  5 Apr 2024 11:20:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07CB9F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=blH7RpvF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=UIvEuy2O;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=blH7RpvF;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=UIvEuy2O
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0C1F521A27;
	Fri,  5 Apr 2024 09:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1712308828;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i7RI3ngvjncPEp7pDUhZBMSqWdHKtC1fTz19Pxc32RY=;
	b=blH7RpvFCk0CD8Hx4YiHYotzGZUUSl3KBOgYyUAsv0trj2UKJG9jTD7e0OojGq+QUXPi8d
	00aAqRxjcf8We5rvi9YW11Lr+UcUIE7bS+HCLVzSKV+XZ4JUzYjegFLYsnNC18tvi5NNU8
	64/kkGI+jN/Kfucd2Q+e6R3pkYiYuko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712308828;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i7RI3ngvjncPEp7pDUhZBMSqWdHKtC1fTz19Pxc32RY=;
	b=UIvEuy2OnLA53fsA/4JfMDTpA4jujpsH2mYq6Tz6f7k5GyZZBDaoJ8WAMNyBS+oCbmyFWS
	xWfNGtHizqYkTZAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=blH7RpvF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UIvEuy2O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1712308828;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i7RI3ngvjncPEp7pDUhZBMSqWdHKtC1fTz19Pxc32RY=;
	b=blH7RpvFCk0CD8Hx4YiHYotzGZUUSl3KBOgYyUAsv0trj2UKJG9jTD7e0OojGq+QUXPi8d
	00aAqRxjcf8We5rvi9YW11Lr+UcUIE7bS+HCLVzSKV+XZ4JUzYjegFLYsnNC18tvi5NNU8
	64/kkGI+jN/Kfucd2Q+e6R3pkYiYuko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712308828;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i7RI3ngvjncPEp7pDUhZBMSqWdHKtC1fTz19Pxc32RY=;
	b=UIvEuy2OnLA53fsA/4JfMDTpA4jujpsH2mYq6Tz6f7k5GyZZBDaoJ8WAMNyBS+oCbmyFWS
	xWfNGtHizqYkTZAA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id D40F8139F1;
	Fri,  5 Apr 2024 09:20:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id ZMDBMVvCD2ZSVQAAn2gu4w
	(envelope-from <tiwai@suse.de>); Fri, 05 Apr 2024 09:20:27 +0000
Date: Fri, 05 Apr 2024 11:20:32 +0200
Message-ID: <875xwwnp27.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: Re: [PATCH v2 00/17] ALSA: emu10k1 & emux: fixes related to wavetable
 playback
In-Reply-To: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
References: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 0C1F521A27
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmx.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmx.de,internode.on.net];
	FREEMAIL_CC(0.00)[alsa-project.org,perex.cz,internode.on.net];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap2.dmz-prg2.suse.org:helo,imap2.dmz-prg2.suse.org:rdns]
Message-ID-Hash: UQHKBRXSS5CSHQANIMFVL6I2WKOJOBDH
X-Message-ID-Hash: UQHKBRXSS5CSHQANIMFVL6I2WKOJOBDH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UQHKBRXSS5CSHQANIMFVL6I2WKOJOBDH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 04 Apr 2024 12:00:31 +0200,
Oswald Buddenhagen wrote:
> 
> ---
> This patch series needs to be applied on top of the patch titled
> "Revert "ALSA: emu10k1: fix synthesizer sample playback position and
> caching"".

The patch set isn't cleanly applicable even after the revert patch.
The patch 7 fails.

Please rebase to the latest for-linus branch and resubmit.


thanks,

Takashi

> 
> Oswald Buddenhagen (17):
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
>   ALSA: emu10k1: merge conditions in patch loader
>   ALSA: emu10k1: fix wavetable offset recalculation
>   ALSA: emu10k1: de-duplicate size calculations for 16-bit samples
>   ALSA: emu10k1: improve cache behavior documentation
>   ALSA: emu10k1: fix wavetable playback position and caching, take 2
>   ALSA: emu10k1: shrink blank space in front of wavetable samples
>   ALSA: emux: simplify snd_sf_list.callback handling
> 
>  include/sound/emu10k1.h              |  32 +++--
>  include/sound/soundfont.h            |   2 +-
>  sound/isa/sb/emu8000_patch.c         |  13 --
>  sound/pci/emu10k1/emu10k1_callback.c |  13 +-
>  sound/pci/emu10k1/emu10k1_patch.c    | 207 +++++++++++----------------
>  sound/pci/emu10k1/memory.c           |  55 +++++--
>  sound/synth/emux/emux.c              |   6 +-
>  sound/synth/emux/emux_hwdep.c        |   3 +-
>  sound/synth/emux/emux_oss.c          |   3 +-
>  sound/synth/emux/emux_proc.c         |   1 +
>  sound/synth/emux/emux_seq.c          |   6 +-
>  sound/synth/emux/soundfont.c         |  73 +++++++---
>  12 files changed, 219 insertions(+), 195 deletions(-)
> 
> 
> base-commit: ed93395844979f6bf2e1fbfcda38d1718289b426
> prerequisite-patch-id: b7769e1c8649b86fd9e0b259e11bfd8e468393e5
> --
> 2.42.0.419.g70bf8a5751
> 
