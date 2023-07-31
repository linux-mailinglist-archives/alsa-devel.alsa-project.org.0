Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5369676A14C
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 21:31:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B753D6C0;
	Mon, 31 Jul 2023 21:30:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B753D6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690831898;
	bh=zzuGJk4xWMsyNXrxwteru5fzBPfT1VViZZ32J4yvkIU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e7rSrYTo8T+vw/tgbhTM0aEXlPY/nTS0huXYu05P1qgmZJZ3movK6/Dj36pwRIHsk
	 kDiUymau6Im/19YpG8v2q+vZhFt6YtbGp2hTgMgnQkniPmPPnf5DeH2PZEJDZq/c0o
	 xwjuq2c/qYQ06CCtblpSI6dVXczmTvGUbK1Sj73c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25D15F80548; Mon, 31 Jul 2023 21:30:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ADD31F80163;
	Mon, 31 Jul 2023 21:30:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEA11F8016D; Mon, 31 Jul 2023 21:30:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D277F8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 21:30:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D277F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=wfOQ7CjF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Qd4OrjEG
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 62B401F8B9;
	Mon, 31 Jul 2023 19:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690831830;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u7USeY0/jtJxkYj9/QN1XyAb2M3n3eeaiC5yDhmFdY8=;
	b=wfOQ7CjFJqQePEa7OdDroF7echFEOEHR/6vLvlCgaHsMGc5p3jgEArAk5dc0jkq2W2SGSy
	GfcClBPxAOQ6E6Gw1fQREbSQEwYnUAY2Evc0hsf6IqB3iyr3y0XmXAGuhNYxL7mMHBbSJS
	2BCLtuk3fcVYke+aItcBz9RgRJ2HhEM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690831830;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u7USeY0/jtJxkYj9/QN1XyAb2M3n3eeaiC5yDhmFdY8=;
	b=Qd4OrjEGeQ8Yv2c20NXO+uRfjaHL2ARq+fEgYKcKp+AaD4GHakZdhSu2htPkHeqG/+cw+Y
	6ecdtJBy3k+qWYAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F4174133F7;
	Mon, 31 Jul 2023 19:30:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4dSvOtULyGTxYAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 19:30:29 +0000
Date: Mon, 31 Jul 2023 21:30:29 +0200
Message-ID: <87h6pjj2ui.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Anton Sviridenko <anton@corp.bluecherry.net>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-media@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 00/24] ALSA: Generic PCM copy ops using sockptr_t
In-Reply-To: <b906d60b-ece4-45b5-8167-2046c8dc00f4@sirena.org.uk>
References: <20230731154718.31048-1-tiwai@suse.de>
	<b906d60b-ece4-45b5-8167-2046c8dc00f4@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: O64Z4GV7N7FQCKKVE7BXV4BZ25NVIKIR
X-Message-ID-Hash: O64Z4GV7N7FQCKKVE7BXV4BZ25NVIKIR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O64Z4GV7N7FQCKKVE7BXV4BZ25NVIKIR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 31 Jul 2023 19:20:54 +0200,
Mark Brown wrote:
> 
> On Mon, Jul 31, 2023 at 05:46:54PM +0200, Takashi Iwai wrote:
> 
> > this is a patch set to clean up the PCM copy ops using sockptr_t as a
> > "universal" pointer, inspired by the recent patch from Andy
> > Shevchenko:
> >   https://lore.kernel.org/r/20230721100146.67293-1-andriy.shevchenko@linux.intel.com
> 
> > Even though it sounds a bit weird, sockptr_t is a generic type that is
> > used already in wide ranges, and it can fit our purpose, too.  With
> > sockptr_t, the former split of copy_user and copy_kernel PCM ops can
> > be unified again gracefully.
> 
> It really feels like we ought to rename, or add an alias for, the type
> if we're going to start using it more widely - it's not helping to make
> the code clearer.

That was my very first impression, too, but I changed my mind after
seeing the already used code.  An alias might work, either typedef or
define genptr_t or such as sockptr_t.  But we'll need to copy the
bunch of helper functions, too...


Takashi
