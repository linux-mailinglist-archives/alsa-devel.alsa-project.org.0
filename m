Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D11B777086
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 08:37:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE58B851;
	Thu, 10 Aug 2023 08:36:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE58B851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691649459;
	bh=p24DkrTwKvmii7rd8DLYKEm5RAmrHXW+B1kwrbC3X/U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tX+pKkCg/x4Lc6pH7UZtDGMKoEjpWqWKiIKiDqZdPyMHkZosLpSHYEhyIyGWJNGss
	 62AIB6xxbo/SXrb+8enyQ4C5ZEoO+r5beYW6lOPxUT/G16wb9WVvlEsHv9oQ9A9aFs
	 RDR12x97s8wzGfa3c9B+7z5b0QOLSv+oIaAWJKXY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AD73F80552; Thu, 10 Aug 2023 08:36:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33C8BF8016E;
	Thu, 10 Aug 2023 08:36:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70AA4F8016E; Thu, 10 Aug 2023 08:36:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DAC1AF80166
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 08:36:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAC1AF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=yH4d29zz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Hmp7YURu
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7E61521862;
	Thu, 10 Aug 2023 06:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1691649381;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WgSxFsObj2j3zQYLF7w8TnDbpCMs19foVN6ijkhLqqk=;
	b=yH4d29zzpZhFuTCmUrRyUovDE42kRyWodknoxKtRCfSlCaJrE9qzR/QJ31yHHXEtwW3peI
	2IjpzLZfzlUs33NvzGF7C9nb5BTrInFdlJ3Xu2pkQqYk0j9wr6w1dLy7T8Mi41oIXxhMM5
	Er+KUf1kaXPsdu0/Y9SGwhhUZsGEBzg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1691649381;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WgSxFsObj2j3zQYLF7w8TnDbpCMs19foVN6ijkhLqqk=;
	b=Hmp7YURuC9C79SHXjkxiENnAicvhVadX9R7PbI8KEXQGJD3OGzyqyVccsdDwAqW7Bk4mt9
	NFyaoxXQL6YT68AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5A86C138E2;
	Thu, 10 Aug 2023 06:36:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 7JAmFWWF1GTiMAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 10 Aug 2023 06:36:21 +0000
Date: Thu, 10 Aug 2023 08:36:20 +0200
Message-ID: <87jzu3cskb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: alsa-devel@alsa-project.org,
	Rolf Anderegg <rolf.anderegg@weiss.ch>,
	Michele Perrone <michele.perrone@weiss.ch>
Subject: Re: [PATCH] ALSA: dice: add stream format parameters for Weiss
 devices
In-Reply-To: <20230809225722.GA895382@workstation.local>
References: <20230809002631.750120-1-o-takashi@sakamocchi.jp>
	<87msz0e2jv.wl-tiwai@suse.de>
	<20230809141854.GA892647@workstation.local>
	<87bkfge0uc.wl-tiwai@suse.de>
	<20230809225722.GA895382@workstation.local>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: U5QD4U67J7EQKIS56RSUQBWUKAARS4LE
X-Message-ID-Hash: U5QD4U67J7EQKIS56RSUQBWUKAARS4LE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U5QD4U67J7EQKIS56RSUQBWUKAARS4LE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 10 Aug 2023 00:57:22 +0200,
Takashi Sakamoto wrote:
> 
> On Wed, Aug 09, 2023 at 04:39:55PM +0200, Takashi Iwai wrote:
> > On Wed, 09 Aug 2023 16:18:54 +0200,
> > Takashi Sakamoto wrote:
> > > 
> > > Hi,
> > > 
> > > On Wed, Aug 09, 2023 at 04:03:00PM +0200, Takashi Iwai wrote:
> > > > On Wed, 09 Aug 2023 02:26:31 +0200,
> > > > Takashi Sakamoto wrote:
> > > > > 
> > > > > This patch is for kernel prepatch v6.5.
> > > > 
> > > > Why it must be included in 6.5?  This sounds more like a new
> > > > implementation, rather than an urgent but fix that is needed for rc.
> > > 
> > > Thanks for your notice to the patch. Indeed, it is neither urgent nor
> > > bug fix. It is a kind of 'adding support for new device with slight
> > > change', like adding new entries in mod device table. The overall change
> > > and new lines are quite typical in ALSA dice driver, like TC Electronic
> > > devices in 'sound/firewire/dice/dice-tcelectronic.c'. Things are
> > > prepared and not brand-new.
> > > 
> > > Precisely, current ALSA dice driver supports the Weiss models already,
> > > while the functionality is limited that the part of sampling transfer
> > > frequencies are available as the initial author said (e.g. when 44.1/48.0
> > > kHz are available, 88.2/96.0 kHz are not, vise versa). The patch extends
> > > the functionality by hard-coding stream formats following to the design
> > > of ALSA dice driver.
> > > 
> > > Of cource, I don't mind postponing the patch to v6.6 kernel, but in my
> > > point of view, it is worth to v6.5 since users got benefits from the
> > > code which is not so novel.
> > 
> > OK, then I'd rather put it to 6.6.
> > If it were for rc2, I could take it.  But it's already in a second
> > half turn, and I'd rather like to limit the changes for later rcs.
> 
> It sounds reasonable. So should I post the patch on your for-next branch?

No need for that, the patch itself is applicable cleanly.
I just need to drop the commit log line indicating 6.5-rc.


thanks,

Takashi
