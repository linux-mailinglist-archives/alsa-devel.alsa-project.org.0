Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E23EA4FA2A
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 10:33:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1C5E60305;
	Wed,  5 Mar 2025 10:33:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1C5E60305
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741167226;
	bh=q85vfpYHpJ2biozbBEkt0MjQUKiv2EvIMnKK5SrvW6w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o/iqTT5Olp8Q6dQJATE/vB2l7SAe3uJSEyBXW0xy2vRZiwaNt6zz51kHn8teX6vTL
	 omiaTycrPzzZyHPd7xQDiGsPcy9JB5mOZPqvotRRuzEyO7s8LhFPxIk4KqJjbitFye
	 kS0DSyeNM234OqOYW4rFFRJ4TpzEmHE1p0sz4Kv0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5FEDF805C0; Wed,  5 Mar 2025 10:33:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A005F805AF;
	Wed,  5 Mar 2025 10:33:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26F42F802BE; Wed,  5 Mar 2025 10:33:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5572F8001D
	for <alsa-devel@alsa-project.org>; Wed,  5 Mar 2025 10:33:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5572F8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=P5RSvRd3;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=s8Rl3BVg;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=P5RSvRd3;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=s8Rl3BVg
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BEF6D1F76B;
	Wed,  5 Mar 2025 09:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1741167184;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dt2bJ54GGzPVZuWctqtO5R+0fENr5gsNIodPEK2FUog=;
	b=P5RSvRd3rg7miFTddKlJGomhxNDu4WaNby9+IHUHuv6zcLXfCHarKgTPS0GxediJvMwvQ5
	HG1LwFjAfUedkOYV182T3wJ1NDLx86k3XyznyCn3Swi5/KOzCz0iXVCtVDeppEVKXC+ks+
	XFpiO5Wwl4GPY9lh8AxHKVxX1SZ8mJY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741167184;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dt2bJ54GGzPVZuWctqtO5R+0fENr5gsNIodPEK2FUog=;
	b=s8Rl3BVgnActW5LdaN/vHEJRqsv0zi9AndoF8PiIFbIqCmzVE+B+nP9DV8VGAEsgVB7Fpe
	N9ehDoYdYlE1r0CQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=P5RSvRd3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=s8Rl3BVg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1741167184;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dt2bJ54GGzPVZuWctqtO5R+0fENr5gsNIodPEK2FUog=;
	b=P5RSvRd3rg7miFTddKlJGomhxNDu4WaNby9+IHUHuv6zcLXfCHarKgTPS0GxediJvMwvQ5
	HG1LwFjAfUedkOYV182T3wJ1NDLx86k3XyznyCn3Swi5/KOzCz0iXVCtVDeppEVKXC+ks+
	XFpiO5Wwl4GPY9lh8AxHKVxX1SZ8mJY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741167184;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dt2bJ54GGzPVZuWctqtO5R+0fENr5gsNIodPEK2FUog=;
	b=s8Rl3BVgnActW5LdaN/vHEJRqsv0zi9AndoF8PiIFbIqCmzVE+B+nP9DV8VGAEsgVB7Fpe
	N9ehDoYdYlE1r0CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 95D4C1366F;
	Wed,  5 Mar 2025 09:33:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zJn2IlAayGc0bQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 05 Mar 2025 09:33:04 +0000
Date: Wed, 05 Mar 2025 10:33:04 +0100
Message-ID: <87o6yfu8j3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Hoku Ishibe <me@hokuishi.be>
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.com
Subject: Re: [PATCH] ALSA: hda: intel: Add Dell ALC3271 to power_save denylist
In-Reply-To: <20250224020517.51035-1-me@hokuishi.be>
References: <20250224020517.51035-1-me@hokuishi.be>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: BEF6D1F76B
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
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
Message-ID-Hash: WKSUW2LVVOBWBLPHRPAAIRAT2PLYGMUC
X-Message-ID-Hash: WKSUW2LVVOBWBLPHRPAAIRAT2PLYGMUC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WKSUW2LVVOBWBLPHRPAAIRAT2PLYGMUC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 24 Feb 2025 03:05:17 +0100,
Hoku Ishibe wrote:
> 
> Dell XPS 13 7390 with the Realtek ALC3271 codec experiences
> persistent humming noise when the power_save mode is enabled.
> This issue occurs when the codec enters power saving mode,
> leading to unwanted noise from the speakers.
> 
> This patch adds the affected model (PCI ID 0x1028:0x0962) to the
> power_save denylist to ensure power_save is disabled by default,
> preventing power-off related noise issues.
> 
> Steps to Reproduce
> 1. Boot the system with `snd_hda_intel` loaded.
> 2. Verify that `power_save` mode is enabled:
> ```sh
> cat /sys/module/snd_hda_intel/parameters/power_save
> ````
> output: 10 (default power save timeout)
> 3. Wait for the power save timeout
> 4. Observe a persistent humming noise from the speakers
> 5. Disable `power_save` manually:
> ```sh
> echo 0 | sudo tee /sys/module/snd_hda_intel/parameters/power_save
> ````
> 6. Confirm that the noise disappears immediately.
> 
> This issue has been observed on my system, and this patch
> successfully eliminates the unwanted noise. If other users
> experience similar issues, additional reports would be helpful.
> 
> 
> Signed-off-by: Hoku Ishibe <me@hokuishi.be>

Thanks, applied now.

But, at the next time, please submit to linux-sound@vger.kernel.org
instead of alsa-devel ML, and put maintainers to Cc.


Takashi
