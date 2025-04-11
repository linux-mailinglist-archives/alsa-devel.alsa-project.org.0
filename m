Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD58A8629F
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Apr 2025 18:00:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A321694C5;
	Fri, 11 Apr 2025 18:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A321694C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744387242;
	bh=vOk6NtGKkaKkmnDarGWyGjhkuEEJUhmiq4COsQeRkOM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DK+xK5h2Uxb/37CUHrPTj8UnfVUG7x5z2Z2m4PsGzlvtivzz49clhwESaSD2k8CEe
	 0SA8hsiT39zX1UZUJtabQugD2dXGg8IgXmxE+cfkSL2lB2/vmdV7APc7VQx1vDy1zL
	 TkwHYYQY6WOXONHfk9HWVUksJfHYuE9hgh9eISVY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF5F3F805BB; Fri, 11 Apr 2025 18:00:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC27EF805BA;
	Fri, 11 Apr 2025 18:00:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A4AEF8025F; Fri, 11 Apr 2025 18:00:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4CC9BF8025A
	for <alsa-devel@alsa-project.org>; Fri, 11 Apr 2025 17:59:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CC9BF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=eU17vUXC;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=cYlwC2Yv;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=eU17vUXC;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=cYlwC2Yv
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 839541F458;
	Fri, 11 Apr 2025 15:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1744387196;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JxFsVKFbgGYjFhRB59p6Wr8NpFA8/IETwc9tfN8jtA0=;
	b=eU17vUXCpkS/qinCUi/kX3YAXWyvsmNmh53vIcuxBrE1jziN77o6pYCFy6FwOVls897Nw2
	t2y/LxKSYsQRd1/7gay+X/vyFWGB/fIc0NFazvUNs1WHVrnxNLLMiQVVUiNHj70mtlQSVR
	Iaa00SwKHIv3urUIOewZCdfPbg7NAfU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744387196;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JxFsVKFbgGYjFhRB59p6Wr8NpFA8/IETwc9tfN8jtA0=;
	b=cYlwC2Yv8wVfbv4GMDtjrc15piVwkOzzvXMRBpyktlegJk0VmQ9/akhsaw7TJglW4iDOSZ
	MhWY0nbZQs/mO/AQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=eU17vUXC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cYlwC2Yv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1744387196;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JxFsVKFbgGYjFhRB59p6Wr8NpFA8/IETwc9tfN8jtA0=;
	b=eU17vUXCpkS/qinCUi/kX3YAXWyvsmNmh53vIcuxBrE1jziN77o6pYCFy6FwOVls897Nw2
	t2y/LxKSYsQRd1/7gay+X/vyFWGB/fIc0NFazvUNs1WHVrnxNLLMiQVVUiNHj70mtlQSVR
	Iaa00SwKHIv3urUIOewZCdfPbg7NAfU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744387196;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JxFsVKFbgGYjFhRB59p6Wr8NpFA8/IETwc9tfN8jtA0=;
	b=cYlwC2Yv8wVfbv4GMDtjrc15piVwkOzzvXMRBpyktlegJk0VmQ9/akhsaw7TJglW4iDOSZ
	MhWY0nbZQs/mO/AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 60145136A4;
	Fri, 11 Apr 2025 15:59:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jyYhFnw8+WenJwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 11 Apr 2025 15:59:56 +0000
Date: Fri, 11 Apr 2025 17:59:55 +0200
Message-ID: <87iknau1s4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.15-rc1
In-Reply-To: <4188eaa8e7f745f659ea1adbc4cf3375.broonie@kernel.org>
References: <4188eaa8e7f745f659ea1adbc4cf3375.broonie@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 839541F458
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:mid];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: 7C4U52HCEH3NTHHNAFLPTOMJRN7QGJDR
X-Message-ID-Hash: 7C4U52HCEH3NTHHNAFLPTOMJRN7QGJDR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7C4U52HCEH3NTHHNAFLPTOMJRN7QGJDR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 11 Apr 2025 13:53:04 +0200,
Mark Brown wrote:
> 
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.15-rc1
> 
> for you to fetch changes up to e6c4618422a25cb266bf752040eb509865caeb0e:
> 
>   MAINTAINERS: update my email address (2025-04-11 06:17:24 +0100)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.15
> 
> A set of small fixes, quirks and device ID additions that came in since
> -rc1, none of them super stand out.  There's also a change to Srini's
> email address in MAINTAINERS.

Pulled now.  Thanks.


Takashi
