Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4FEB10A46
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Jul 2025 14:34:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EF2E60229;
	Thu, 24 Jul 2025 14:34:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EF2E60229
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753360468;
	bh=tduPSYDDuATvwcsJQCcr0I+RoZMqHhcxjRvQ7KGZ6oA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f3KHCfqLEDpGksyg6s9Q1Dc9mNUV18MLkimHnnPtCyEAflf7DIzdWFwYxsCAB7s6M
	 rf0gUXLdXaggZ1tmuvZ55DMPpwIu5S+7Ueza7uKs4bILCeXus5KuMkAeulAq1LVxmt
	 rn3wgCaF6wJxZwQ94bhEoDnUdJjnHxjW03cHED7M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 997C7F805AA; Thu, 24 Jul 2025 14:33:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64EE9F805C5;
	Thu, 24 Jul 2025 14:33:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9E6BF804E5; Thu, 24 Jul 2025 14:33:33 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 810F7F8007E
	for <alsa-devel@alsa-project.org>; Thu, 24 Jul 2025 14:33:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 810F7F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=TrScDe4u;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=mBQItaT/;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=TrScDe4u;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=mBQItaT/
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D130E2198E;
	Thu, 24 Jul 2025 12:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1753360403;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f6sAatCeB3f+5pR7KX7oaUVc90BTZPqDLk+ReG+HIkk=;
	b=TrScDe4uuzNgwo6SOKXjK4ve+hTPBZdUsnacNh7Yx6xr6ylKwlfHCpimCzpQfYbfoxYW8V
	tmIkb/CG/rHee8SFIzNbalEVtgGcU1teNKlvBlhKD5MwDniRBL9S4cCy+lYMKsDVD4ovYK
	Di6gCRptZsieJp7o5q6yEah+fpDVpVo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753360403;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f6sAatCeB3f+5pR7KX7oaUVc90BTZPqDLk+ReG+HIkk=;
	b=mBQItaT/Hn9RSQIeCYpX0wExYyC54ExjMv54wwxFAsZp2yQ0gfyYDFXaM5CDbWA4UgHNSO
	7Ja8crEh0p+t64BA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=TrScDe4u;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="mBQItaT/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1753360403;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f6sAatCeB3f+5pR7KX7oaUVc90BTZPqDLk+ReG+HIkk=;
	b=TrScDe4uuzNgwo6SOKXjK4ve+hTPBZdUsnacNh7Yx6xr6ylKwlfHCpimCzpQfYbfoxYW8V
	tmIkb/CG/rHee8SFIzNbalEVtgGcU1teNKlvBlhKD5MwDniRBL9S4cCy+lYMKsDVD4ovYK
	Di6gCRptZsieJp7o5q6yEah+fpDVpVo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1753360403;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f6sAatCeB3f+5pR7KX7oaUVc90BTZPqDLk+ReG+HIkk=;
	b=mBQItaT/Hn9RSQIeCYpX0wExYyC54ExjMv54wwxFAsZp2yQ0gfyYDFXaM5CDbWA4UgHNSO
	7Ja8crEh0p+t64BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ADCCD136DC;
	Thu, 24 Jul 2025 12:33:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id s78OKRMogmgsDwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 24 Jul 2025 12:33:23 +0000
Date: Thu, 24 Jul 2025 14:33:23 +0200
Message-ID: <87y0sdkbu4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC updates for v6.17
In-Reply-To: <492f6d2b51bc6aeeda03fb8ac85ee34a.broonie@kernel.org>
References: <492f6d2b51bc6aeeda03fb8ac85ee34a.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Queue-Id: D130E2198E
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: DNW7BHTCERSLASSUTY6OHRAIQHMLOQUV
X-Message-ID-Hash: DNW7BHTCERSLASSUTY6OHRAIQHMLOQUV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DNW7BHTCERSLASSUTY6OHRAIQHMLOQUV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 24 Jul 2025 13:42:08 +0200,
Mark Brown wrote:
> 
> The following changes since commit 347e9f5043c89695b01e66b3ed111755afcf1911:
> 
>   Linux 6.16-rc6 (2025-07-13 14:25:58 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-v6.17
> 
> for you to fetch changes up to c58c35ef6ae62e36927f506a5afc66610b7261d9:
> 
>   ASoC: qcom: sm8250: Add Fairphone 4 soundcard compatible (2025-07-23 15:09:30 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Updates for v6.17
> 
> There's a few new drivers here and quite a lot of cleanup work from
> Morimoto-san but generally this has been quite a quiet release,
> resulting in a fairly small diffstat.  Highlights include:
> 
>  - Refactoring of the Kconfig menus to be hopefully more consistant and
>    easier to navigate.
>  - Refactoring of the DAPM code, mainly hiding functionality that
>    doesn't need to be exposed to drivers.
>  - Removal of the unused upstream weak paths DAPM functionality.
>  - Further work on the generic handling for SoundWire SDCA devices.
>  - Cleanups of our usage of the PM autosuspend functions, this pulls in
>    some PM core changes on a shared tag.
>  - Support for AMD ACP7.2 and SoundWire on ACP 7.1, Fairphone 4 & 5,
>    various Intel systems, Qualcomm QCS8275, Richtek RTQ9124 and TI TAS5753.

Pulled now.  Thanks.


Takashi
