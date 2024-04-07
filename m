Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E8289B00B
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 11:19:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE8A42366;
	Sun,  7 Apr 2024 11:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE8A42366
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712481594;
	bh=4u5f176C4LnSiKAkzGaGogX5QzoGwqXuhtyT7BlKIAE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q9VbA98Z/38qiU5SWfPhKcg1MQWypaT0PdApQxO4qaNW10fBEmyiu8KlqHsH0L8E8
	 rtFnX+wSa12e73mYg6TCrt3neA0He4RLeyp8eTH54fvG38yq+36z2iGwUuX2t0h3Pz
	 umeJoLzAZBWvhDLlgUZQWXRP/SihoDY3nSqw5hyE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BE45F80589; Sun,  7 Apr 2024 11:19:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB287F8055C;
	Sun,  7 Apr 2024 11:19:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE129F8026D; Sun,  7 Apr 2024 11:18:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA174F80236
	for <alsa-devel@alsa-project.org>; Sun,  7 Apr 2024 11:18:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA174F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ec6eQO+J;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7drtTMtN;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=ec6eQO+J;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7drtTMtN
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 689F61F8AC;
	Sun,  7 Apr 2024 09:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1712481507;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2H5F1O/haQHYg7GPhwnxPTb/qjd7GMOLAfnh7fLjdfc=;
	b=ec6eQO+JgbAqndtgOGFjm0tLyJcaSWieWIK0W+MTGaqqBfHuS5ESpCgAk/Fahfo6WnJWxd
	cm+1c+9HzQ1sdomklwsOKqDRa52yWSrI5jFLy8n1PgrDV35OLm8y4iGeEXk+YMLEDw0NaY
	asKwlD/QE1gjfI4isH1LNeRzl3ymueg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712481507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2H5F1O/haQHYg7GPhwnxPTb/qjd7GMOLAfnh7fLjdfc=;
	b=7drtTMtNEZqhfuU1MS9NE8iSe4rtpFHIDCtlXywHLEUVxi31DzT7J1PsCcl+A8NNg0o1Gh
	JbGSSwXxQ4ihdaAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1712481507;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2H5F1O/haQHYg7GPhwnxPTb/qjd7GMOLAfnh7fLjdfc=;
	b=ec6eQO+JgbAqndtgOGFjm0tLyJcaSWieWIK0W+MTGaqqBfHuS5ESpCgAk/Fahfo6WnJWxd
	cm+1c+9HzQ1sdomklwsOKqDRa52yWSrI5jFLy8n1PgrDV35OLm8y4iGeEXk+YMLEDw0NaY
	asKwlD/QE1gjfI4isH1LNeRzl3ymueg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1712481507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2H5F1O/haQHYg7GPhwnxPTb/qjd7GMOLAfnh7fLjdfc=;
	b=7drtTMtNEZqhfuU1MS9NE8iSe4rtpFHIDCtlXywHLEUVxi31DzT7J1PsCcl+A8NNg0o1Gh
	JbGSSwXxQ4ihdaAw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 3D13D132FF;
	Sun,  7 Apr 2024 09:18:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id IwdHDeNkEmb3TwAAn2gu4w
	(envelope-from <tiwai@suse.de>); Sun, 07 Apr 2024 09:18:27 +0000
Date: Sun, 07 Apr 2024 11:18:33 +0200
Message-ID: <87il0tledy.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: Re: [PATCH v3 00/17] ALSA: emu10k1 & emux: fixes related to wavetable
 playback
In-Reply-To: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
References: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.36 / 50.00];
	BAYES_HAM(-1.06)[87.78%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmx.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmx.de,internode.on.net];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[alsa-project.org,perex.cz,internode.on.net];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4]
Message-ID-Hash: VWUMTKFUVGNDFBHEWMPZ4VWI7OC4JQQU
X-Message-ID-Hash: VWUMTKFUVGNDFBHEWMPZ4VWI7OC4JQQU
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 06 Apr 2024 08:48:13 +0200,
Oswald Buddenhagen wrote:
> 
> ---
> v3:
> - re-send with safer transfer encoding
> v2:
> - rebased on top of reverting problematic commit first
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

Applied to for-next branch now.

At the next time, please send to linux-sound@vger.kernel.org instead,
though, as listed in MAINTAINERS file.


thanks,

Takashi
