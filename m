Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 080E0C8CE8E
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Nov 2025 07:24:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 758B26019D;
	Thu, 27 Nov 2025 07:23:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 758B26019D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764224648;
	bh=k+FOmYCaGVE9vvb/Rm9s7ThCFFXpjQrDwKd3hjAY/K4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dT17OCED+tZi+mycJT54IwADeIf9BxmpdC0H6nRARcXqrBXE7EVcjg7YKqJjpz1VK
	 A+KmJWvYLbyJyJZnk8k+5ql1Ck1tHfJPFdF5iHhaxzHBYScsQeHwJAloZUjKTGIbtm
	 x7W5IfyVbOfT77K/k3Eqdc34GagZOPKMxUDiCDdg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8FBCF805C7; Thu, 27 Nov 2025 07:23:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DCDCDF8057C;
	Thu, 27 Nov 2025 07:23:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59B18F80551; Thu, 27 Nov 2025 07:22:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF1B8F8016D
	for <alsa-devel@alsa-project.org>; Thu, 27 Nov 2025 07:21:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF1B8F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ikTZD/YL;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Sa1IgNHw;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=ikTZD/YL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Sa1IgNHw
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 94CCF33691;
	Thu, 27 Nov 2025 06:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1764224512;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B6lQ0PJXC47mIHApHGtxuyK1Vt0FrzwjcYIOrOsXRnI=;
	b=ikTZD/YLctnXRP5zAYFQdsA6NENWz6lI9EwXrD5YobKqxL7EW+zmGIHe+BObrDIxUGyZrW
	YHiaDUkdd0PGtBKIHBJ6nzkY1ewTwVcmZu0R+xBsb3OAhmOUbl/6X7WWLG3gnTFKm7uJ4C
	c68N1kTReN0qokgi1jiCnyGjHw54xaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764224512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B6lQ0PJXC47mIHApHGtxuyK1Vt0FrzwjcYIOrOsXRnI=;
	b=Sa1IgNHwW8SqmQhPc//ATvKG8GkqcTMJZqaiaZ97GBNsRzUiwjSK7A7x5TzsKqx77UsHBH
	huadnLft7YW7MhAg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="ikTZD/YL";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Sa1IgNHw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1764224512;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B6lQ0PJXC47mIHApHGtxuyK1Vt0FrzwjcYIOrOsXRnI=;
	b=ikTZD/YLctnXRP5zAYFQdsA6NENWz6lI9EwXrD5YobKqxL7EW+zmGIHe+BObrDIxUGyZrW
	YHiaDUkdd0PGtBKIHBJ6nzkY1ewTwVcmZu0R+xBsb3OAhmOUbl/6X7WWLG3gnTFKm7uJ4C
	c68N1kTReN0qokgi1jiCnyGjHw54xaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1764224512;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B6lQ0PJXC47mIHApHGtxuyK1Vt0FrzwjcYIOrOsXRnI=;
	b=Sa1IgNHwW8SqmQhPc//ATvKG8GkqcTMJZqaiaZ97GBNsRzUiwjSK7A7x5TzsKqx77UsHBH
	huadnLft7YW7MhAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 617923EA63;
	Thu, 27 Nov 2025 06:21:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id C2oYFgDuJ2lrMgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 27 Nov 2025 06:21:52 +0000
Date: Thu, 27 Nov 2025 07:21:51 +0100
Message-ID: <87jyzc9erk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.18-rc7
In-Reply-To: <25d5b5826b2e8d821caf7a37dea59186@kernel.org>
References: <25d5b5826b2e8d821caf7a37dea59186@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 94CCF33691
Message-ID-Hash: GX6UI3UNQHT55HZKKOGSA62E4TDKAUP5
X-Message-ID-Hash: GX6UI3UNQHT55HZKKOGSA62E4TDKAUP5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GX6UI3UNQHT55HZKKOGSA62E4TDKAUP5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 26 Nov 2025 21:46:45 +0100,
Mark Brown wrote:
> 
> The following changes since commit 6a23ae0a96a600d1d12557add110e0bb6e32730c:
> 
>   Linux 6.18-rc6 (2025-11-16 14:25:38 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.18-rc7
> 
> for you to fetch changes up to 73b97d46dde64fa184d47865d4a532d818c3a007:
> 
>   ASoC: fsl_xcvr: clear the channel status control memory (2025-11-26 13:24:19 +0000)
> 
> ----------------------------------------------------------------
> ASoC: Fixes for v6.18
> 
> A small pile of driver specific fixes that came in during the past few
> weeks, none of them especially major.

Pulled now.  But not sure whether I'll send another PR for 6.18.
Might be postponed in the next week for 6.19 merge window.


thanks,

Takashi
