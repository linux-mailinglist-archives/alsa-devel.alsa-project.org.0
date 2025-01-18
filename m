Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1106A15BF8
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Jan 2025 09:31:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FCE560550;
	Sat, 18 Jan 2025 09:31:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FCE560550
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737189114;
	bh=K+8mkXMDfzh5vDgvCqZewgxETLP4JuGxJjf7hIlPdTY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bc6yL4vp43jCUj7a3IciurFcBOy/5FXGjy+DIT0tPkuhO9D/kP/EJt9hkyAPlicVh
	 g/GRVxp8mGw9UvbMBtZLhFKZfJIEAald0allT7vxVZXurEYRQ1ZC8xVenQtaYu/5G9
	 yqTrc8i+g9244TneD+iehgrGLn1YJgijXTu1VM/E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 990D9F80246; Sat, 18 Jan 2025 09:31:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69B5AF805B2;
	Sat, 18 Jan 2025 09:31:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08C0FF80246; Sat, 18 Jan 2025 09:31:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37F61F800B6
	for <alsa-devel@alsa-project.org>; Sat, 18 Jan 2025 09:30:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37F61F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=zyLASME1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=EgrdrQer;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=zyLASME1;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=EgrdrQer
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 79CFF1F37C;
	Sat, 18 Jan 2025 08:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1737189041;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=apVLRx8PFzZS7u0pzEM7L/zI4JJ1ExyCAZWvpHH15fI=;
	b=zyLASME1eZ7g3Z0nt8KKoO4Koi1epoENzjkyQpnNQMYzrFj4W0i+EOy1XMUzXGxCtDNsFQ
	rMHEYz7kEufulAuB88ahF33mQTttjeBDkVbipslMQX7MNAE2gn/zbizN5KliZHfs4yY3PX
	Qwr5ootR8FJSp4iO3m8Ec8FLamOs+60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737189041;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=apVLRx8PFzZS7u0pzEM7L/zI4JJ1ExyCAZWvpHH15fI=;
	b=EgrdrQerfx0m1jG/ZMeQHkNi1Cp9paD2YUqcp9P9zMkahlSOT0Ti4pbyylxJSEmeVJs8fP
	z5yJfjitsbWoVmBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1737189041;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=apVLRx8PFzZS7u0pzEM7L/zI4JJ1ExyCAZWvpHH15fI=;
	b=zyLASME1eZ7g3Z0nt8KKoO4Koi1epoENzjkyQpnNQMYzrFj4W0i+EOy1XMUzXGxCtDNsFQ
	rMHEYz7kEufulAuB88ahF33mQTttjeBDkVbipslMQX7MNAE2gn/zbizN5KliZHfs4yY3PX
	Qwr5ootR8FJSp4iO3m8Ec8FLamOs+60=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737189041;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=apVLRx8PFzZS7u0pzEM7L/zI4JJ1ExyCAZWvpHH15fI=;
	b=EgrdrQerfx0m1jG/ZMeQHkNi1Cp9paD2YUqcp9P9zMkahlSOT0Ti4pbyylxJSEmeVJs8fP
	z5yJfjitsbWoVmBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 598261373B;
	Sat, 18 Jan 2025 08:30:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nZ61FLFmi2ftWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 18 Jan 2025 08:30:41 +0000
Date: Sat, 18 Jan 2025 09:30:40 +0100
Message-ID: <87r050r0b3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.13-rc7
In-Reply-To: <5636192d519d94773ff137dc403547ef.broonie@kernel.org>
References: <5636192d519d94773ff137dc403547ef.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
Message-ID-Hash: LGXMQFKZTDPCJAKCFW7ORP4AIYOE2ZBQ
X-Message-ID-Hash: LGXMQFKZTDPCJAKCFW7ORP4AIYOE2ZBQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LGXMQFKZTDPCJAKCFW7ORP4AIYOE2ZBQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 17 Jan 2025 20:12:40 +0100,
Mark Brown wrote:
> 
> The following changes since commit 139fa599cea0fd9d38e00246ea9f79af6c59acbd:
> 
>   ASoC: rsnd: check rsnd_adg_clk_enable() return value (2025-01-09 13:17:02 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.13-rc7
> 
> for you to fetch changes up to 75a7f7d6e7e10b9052d287be37f965103e1abae1:
> 
>   ASoC: Intel: sof_sdw: Fix DMI match entries for a (2025-01-15 19:50:01 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.13
> 
> A few final driver specific fixes - a couple of x86 ID field changes,
> plus bug fixes for simple-card-utils and nau8824.

Pulled now.  But I'm not going to send a PR in this weekend, so the
upstreaming might be delayed in the next week after 6.13 final
release.


thanks,

Takashi
