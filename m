Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C50A97D6DB7
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 15:53:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 057107F1;
	Wed, 25 Oct 2023 15:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 057107F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698242005;
	bh=hL8faD/dghsUf3CnbB2uNSzoMB+mjxFh9oemfPRK8z0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nX5ojDx2i2MkuDD1xkOr22C4mN8heXk701g0NuABBVuUO2fKPx35V4JJtp2j++f1R
	 YtGsdJUqCIT7d0ngXi9gUA4Fh/n3szw2YT8DTmrOjK45amlkR88O5LPNCEBhKrU9/R
	 tWOff3G23q+59kVBFxht5Ws5ABtW1ad7EbMYEKMs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41639F80165; Wed, 25 Oct 2023 15:52:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9C36F80157;
	Wed, 25 Oct 2023 15:52:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EE24F80165; Wed, 25 Oct 2023 15:52:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF25CF80152
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 15:52:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF25CF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=F8SQL8Yo;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=PYxvHGWU
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5A03121AED;
	Wed, 25 Oct 2023 13:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1698241945;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bvAtfcFKPIhFq7yc9YeNmFko/t4QqEHM4fNQzPfIYN4=;
	b=F8SQL8YooJ6MgVEfdR50GPqZsrzjznQEEJBduc3NIzwZmd7NFdQXpnpTmaIPwbV08LZjpe
	z3MFiC3ZjmK3B7PeSwIyKUE27f8hRk5SoiO/6aAI2a95XkSDsTELlTbVYEvesh3b4fZuK9
	jkINaGUMb7PzsQltbiLREUmKxxMjun4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1698241945;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bvAtfcFKPIhFq7yc9YeNmFko/t4QqEHM4fNQzPfIYN4=;
	b=PYxvHGWUACgTryLc6vkgOvQn6mj8EJ3mOA+2QER1mYv3VlLD28S3DI72DFyOr2M+SURPyM
	f017qDsd/hHeZ5AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4808D13524;
	Wed, 25 Oct 2023 13:52:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id JQ4GEZkdOWX/CwAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 25 Oct 2023 13:52:25 +0000
Date: Wed, 25 Oct 2023 15:52:24 +0200
Message-ID: <87o7gmx10n.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	ALSA development <alsa-devel@alsa-project.org>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: ALSA: change mailing list to linux-sound on
 vger
In-Reply-To: <20231025-unique-dingo-of-proficiency-fa998c@meerkat>
References: <20231020071247.973909-1-perex@perex.cz>
	<87wmvdwkxm.wl-tiwai@suse.de>
	<87wmvax1is.wl-tiwai@suse.de>
	<20231025-unique-dingo-of-proficiency-fa998c@meerkat>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-8.43 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-2.83)[99.27%];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 RCPT_COUNT_FIVE(0.00)[6];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 TO_DN_ALL(0.00)[];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[];
	 FREEMAIL_CC(0.00)[perex.cz,alsa-project.org,suse.com,kernel.org,gmail.com]
Message-ID-Hash: OA3YFL3SV76O6M5EUEZCPXCB7ECYTB63
X-Message-ID-Hash: OA3YFL3SV76O6M5EUEZCPXCB7ECYTB63
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OA3YFL3SV76O6M5EUEZCPXCB7ECYTB63/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 25 Oct 2023 15:49:48 +0200,
Konstantin Ryabitsev wrote:
> 
> On Wed, Oct 25, 2023 at 03:41:31PM +0200, Takashi Iwai wrote:
> > ... and I tested posting patches to linux-sound ML:
> >   https://lore.kernel.org/linux-sound/20231025132314.5878-1-tiwai@suse.de
> > 
> > I thought those are forwarded to alsa-devel, but apparently they
> > aren't.
> 
> In case there was confusion, I meant that the patches sent to that list will
> be automatically fed to the alsa-devel patchwork, which they were:
> 
> https://patchwork.kernel.org/project/alsa-devel/list/?series=796434

Ah I see.

> > So we all devs need to subscribe this ML now?
> 
> Until we can do search-based pseudo-lists in the near future, that is indeed
> what I would recommend. There is almost no other traffic on that list, so this
> will not impact your inboxes in any meaningful way.

OK, thanks!


Takashi
