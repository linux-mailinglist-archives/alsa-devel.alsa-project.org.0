Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B42CA74EC79
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 13:15:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28B896C1;
	Tue, 11 Jul 2023 13:14:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28B896C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689074128;
	bh=JuN+s1eZ5wk4safJRzybtAnuKoIeujKAEkFxCxYMMWM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B/rjJrPXYz1++VoeFP2wCVqCKeKRsIvfIMh/ycGx+ULLxicIDlo/gFd6mQZMDLOYG
	 jBlhIDFE/aE//67Vad+z8mxuwAfJ0HxGjaqk2336c28ZNam4cg2KFLSoupgcigNpSq
	 c4/+GrX4ZWgk+NCswsri0SfZQkHbRsrl14a9PoLY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D77EF80290; Tue, 11 Jul 2023 13:14:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D630F80236;
	Tue, 11 Jul 2023 13:14:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A355F80249; Tue, 11 Jul 2023 13:14:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B8AEF80153
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 13:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B8AEF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=pIsSSFff;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=PWL9v25n
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 439791FD70;
	Tue, 11 Jul 2023 11:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689074070;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pZGTifs6iVzlBA0HqdWYxfec1qao7gX9+EA/kXSxkho=;
	b=pIsSSFffeLjU7jRP9AVhXW8YZ1TirNnjUaXxPALI/0SK/mxo/C2aHizrCy2CIGR31l69mx
	NiEtmsasErTPN9fIDokyTJzDE4TWsMjW2KZJ/X7sWQWUxyIYWEpHzaoz8Z/LXEwEiQrtM5
	tshpQomrSkkz3CnWZ5jqzNasvQYoU9Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689074070;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pZGTifs6iVzlBA0HqdWYxfec1qao7gX9+EA/kXSxkho=;
	b=PWL9v25nf27PZ/7Q74gL0zjI/rwLUKkZ2qHhvu3J4tEqTQ03+VXVMyw8fyj+35Wg7ctAP5
	HPkVZvPJ3aT0zFAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 262101390F;
	Tue, 11 Jul 2023 11:14:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Tnv7B5Y5rWQkFQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 11 Jul 2023 11:14:30 +0000
Date: Tue, 11 Jul 2023 13:14:29 +0200
Message-ID: <87lefmwvhm.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 2/2] ALSA: emu10k1: track loss of external clock on E-MU
 cards
In-Reply-To: <ZK0q0prNuOz2Be6b@ugly>
References: <20230710065956.1246364-1-oswald.buddenhagen@gmx.de>
	<20230710065956.1246364-2-oswald.buddenhagen@gmx.de>
	<87ttubyfh9.wl-tiwai@suse.de>
	<ZKxBJVxHdkmpHSVh@ugly>
	<87cz0zxbih.wl-tiwai@suse.de>
	<ZK0q0prNuOz2Be6b@ugly>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: YG3IUA24FHX5ARZTILMZIS63X2JTJEB3
X-Message-ID-Hash: YG3IUA24FHX5ARZTILMZIS63X2JTJEB3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YG3IUA24FHX5ARZTILMZIS63X2JTJEB3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 11 Jul 2023 12:11:30 +0200,
Oswald Buddenhagen wrote:
> 
> On Tue, Jul 11, 2023 at 07:28:22AM +0200, Takashi Iwai wrote:
> > Again, snd_ctl_notify() itself doesn't need the rwsem lock at all.
> > 
> ah, you mean i could fully release it before the notification.
> 
> > It's snd_ctl_notify_one() that needs a more careful call pattern.
> > 
> i suppose that's because the snd_ctl_layer callbacks might require it.
> i would recommend actually documenting that.

Yes, but this helper itself needs more change at first, I'm afraid.
The current implementation with the nested rwsem is fragile.  It's a
new stuff (or new restriction), and it's to be revisited.

> > And, that ugly implementation is a thing to be improved in future in
> > ALSA core side.
> > 
> it is? like, really?

Yes.  See my earlier RFC patch for reducing the nested rwlock, for
example.  Jaroslav didn't like the implementation, so it needs more
respin, though.

Another idea could to be make the controls_rwsem back to read-only for
both get and put, but introduce another lock just wrapping around
get/put call (but conditionally - there are drivers that don't need
it).  This will avoid the rwsem deadlock problem.


Takashi
