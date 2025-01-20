Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7600A16F26
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 16:18:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38C4160246;
	Mon, 20 Jan 2025 16:17:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38C4160246
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737386280;
	bh=k8mXPfvYUYkXVZrGxEj9DNQYKzyGMkPwmX/ZBrQLYV4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BBaxhzzgEw1kiswr88bRpsOja4dan3cASqugWHFvh41w6FZb1jKRUUVmFlF3PaNoW
	 7mknTMvWMqr/ZA/2G0IxOJvRzz8MGrf47IgNhv7asWntHW5AW/MWNyAsOhYUcMoe80
	 3lRNQOl447sHXdRSWGiWJ+KQSwTP4b87OrULb3XA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BBAAF80533; Mon, 20 Jan 2025 16:17:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C788F805B6;
	Mon, 20 Jan 2025 16:17:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7BB6F80482; Mon, 20 Jan 2025 16:17:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1C16F800E4
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 16:17:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1C16F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Ejok83y7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ITWtHHkZ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Oak6AIbp;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=mti96kw5
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CAA282117C;
	Mon, 20 Jan 2025 15:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1737386237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A9vQXpJyi+woLkHIQL8sYksJvUXJcFn2kpUZynK/+PM=;
	b=Ejok83y7L/JSY7laa/z0qR1Qlu+dbc0mmGnyHdK/MB0vdzgZ4lzy1RFuIH3AxOHXcJV+lb
	QPQk6udWja/TJ/m+jCj8tgtVWgcuwhgXArDo171dX9CKuaBnr4PiLbxXl4/xzpwZhmskv4
	Db0F7J5rq0MqPkIH/287nRcI8PJ8Am0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737386237;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A9vQXpJyi+woLkHIQL8sYksJvUXJcFn2kpUZynK/+PM=;
	b=ITWtHHkZx/Zx3Y4QuM5dhiRiWPc0T+8yWYXbUzzoU5/JB5A22uCGAKfraMWx+tZrDco1r9
	zq2EfJ6mFUfPo/Cw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Oak6AIbp;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mti96kw5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1737386236;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A9vQXpJyi+woLkHIQL8sYksJvUXJcFn2kpUZynK/+PM=;
	b=Oak6AIbpjQfMC5AKr9PbMW7BiZxD53/BCvH51BOvGKTOe5EcBNIppdOny5jc4uvTdrYxvB
	xSZEmmgERwvmDBTcwtlQbZ2O5nHsJBo4k0sEZDbDVp1Kpzuig3paoEG+UAooDTScTwU6ma
	hoGd0FxqBGASSeUUh8Cxw5e06seR/NM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737386236;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A9vQXpJyi+woLkHIQL8sYksJvUXJcFn2kpUZynK/+PM=;
	b=mti96kw5+ykyoZpXhaBn8Ro+DwGrJkAIf6croqD0hhKIXeIlW7MF+s/W7zhmq7C3uXv4Zo
	wkknW8iJJgKSRBCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AB1951393E;
	Mon, 20 Jan 2025 15:17:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id h6GIKPxojmecWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 20 Jan 2025 15:17:16 +0000
Date: Mon, 20 Jan 2025 16:17:16 +0100
Message-ID: <87a5blbjlv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v6.14
In-Reply-To: <ed5e9273a349fd6ad9cb6edc0223ace5.broonie@kernel.org>
References: <ed5e9273a349fd6ad9cb6edc0223ace5.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: CAA282117C
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: WNUNTRIN4BOLRMEU25TEZJFPDXVERRXZ
X-Message-ID-Hash: WNUNTRIN4BOLRMEU25TEZJFPDXVERRXZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WNUNTRIN4BOLRMEU25TEZJFPDXVERRXZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 20 Jan 2025 16:04:04 +0100,
Mark Brown wrote:
> 
> The following changes since commit 9d89551994a430b50c4fffcb1e617a057fa76e20:
> 
>   Linux 6.13-rc6 (2025-01-05 14:13:40 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.14
> 
> for you to fetch changes up to fee89ddd76e45841a2b01d87b481bc02483f4572:
> 
>   ASoC: xilinx: xlnx_spdif: Simpify using devm_clk_get_enabled() (2025-01-16 15:20:41 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Updates for v6.14
> 
> This was quite a quiet release for what I imagine are holiday related
> reasons, the diffstat is dominated by some Cirrus Logic Kunit tests.
> There's the usual mix of small improvements and fixes, plus a few new
> drivers and features.  The diffstat includes some DRM changes due to
> work on HDMI audio.
> 
>  - Allow clocking on each DAI in an audio graph card to be configured
>    separately.
>  - Improved power management for Renesas RZ-SSI.
>  - KUnit testing for the Cirrus DSP framework.
>  - Memory to meory operation support for Freescale/NXP platforms.
>  - Support for pause operations in SOF.
>  - Support for Allwinner suinv F1C100s, Awinc AW88083, Realtek
>    ALC5682I-VE

Pulled now.  Thanks.


Takashi
