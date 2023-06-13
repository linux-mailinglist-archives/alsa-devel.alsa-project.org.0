Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9A272E803
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 18:16:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08F7BE89;
	Tue, 13 Jun 2023 18:15:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08F7BE89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686672970;
	bh=MP324iDrYbfm0eWrmNDNfTJUUqQns+aJUtdK0/b/X+Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YLAPypzZVWAeMzNubodLEYJMem0MTDnvywTFF0ybDZkGLVh+rIgCPcEDlfJFZWG28
	 ZEJsQoTwJxy6ioR+pRPjI9SCAGloSWscVwWRwUrM3s67GZUyC/zIjPAgnFSQu9BFbJ
	 eQrP8ldDnYaboZsg/lQKE+dYfCj+N8w7SRZfypPY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82B10F80301; Tue, 13 Jun 2023 18:15:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CF3AF80132;
	Tue, 13 Jun 2023 18:15:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B91AF80149; Tue, 13 Jun 2023 18:15:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 80A47F80130
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 18:15:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80A47F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=0G5jX+9U;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=aElo1Jkk
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B33C222509;
	Tue, 13 Jun 2023 16:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686672912;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fVqYdpZ9HtvtVy/54sJHHRor7pEOHvMaLqDV/HaUw1A=;
	b=0G5jX+9UYczBF+s6QA38vytr4oilg44y+74CkIkuzUm1nQM8k8MKzGCxBlJNwC/JL129mX
	9YbdCOql6vXbEMATY3MvLA9ZKzjHueeaIknwzGuyOc9Jo3v6KrYC602Ive1hFO2nE9Ywvi
	fZMm/Avt8bAkV3hihqihi/y55vhS0OY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686672912;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fVqYdpZ9HtvtVy/54sJHHRor7pEOHvMaLqDV/HaUw1A=;
	b=aElo1Jkk7a3gk/PrHe8ck2pi5hl6MJjw+G1A6kr1VcZ9nHk7AHYwNgFMU4kdLHal5ChdZh
	agcjayAmo2xQr+DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8D66F13345;
	Tue, 13 Jun 2023 16:15:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id o4JrIRCWiGSzOAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 13 Jun 2023 16:15:12 +0000
Date: Tue, 13 Jun 2023 18:15:12 +0200
Message-ID: <87a5x3cp9r.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Use maple tree register cache
In-Reply-To: <60f70667-16b0-4071-aa0f-a83e43bbf2a0@sirena.org.uk>
References: <20230609-alsa-hda-maple-v1-1-a2b725c8b8f5@kernel.org>
	<87v8fua1qm.wl-tiwai@suse.de>
	<877cs7g6f1.wl-tiwai@suse.de>
	<e48bbd3b-544d-43d5-82a1-8fbbcb8cd1a4@sirena.org.uk>
	<87v8frcueb.wl-tiwai@suse.de>
	<60f70667-16b0-4071-aa0f-a83e43bbf2a0@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 6ZHFB5D2ZZBZ75N63WCP3Q5R2D5XFQIJ
X-Message-ID-Hash: 6ZHFB5D2ZZBZ75N63WCP3Q5R2D5XFQIJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6ZHFB5D2ZZBZ75N63WCP3Q5R2D5XFQIJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Jun 2023 17:49:41 +0200,
Mark Brown wrote:
> 
> On Tue, Jun 13, 2023 at 04:24:28PM +0200, Takashi Iwai wrote:
> > Mark Brown wrote:
> 
> > > BTW I was just looking at reg_raw_update_once() and I can't figure out
> > > why it's trying to do what it's doing - it does a read to check if it's
> > > seen the register before and then does an _update_bits() if the register
> > > hasn't been cached yet, apparently trying suppress duplicate writes but
> > > possibly deliberately discarding changes to multiple bitfields in the
> > > same register.  That's not what the non-regmap path does, it'll only
> > > discard noop changes to the same bitfield.
> 
> > Yes, it's a quite hackish way of optimization of the initialization.
> 
> > Since HD-audio codec has no known default values unlike normal codecs,
> > it needs to initialize itself only at the first access, and this
> > helper does it.
> 
> Ah, if it's just suppressing the write the code should just be removed.
> regmap_update_bits() already suppresses noop writes so unless we might
> write a different value to the register later the effect will be the
> same.  I can send a patch.

Oh, I'm afraid that we're seeing different things.  The code there is
rather to *set* some initial value for each amp register (but only
once), and it's not about optimization for writing a same value
again.

That is, the function helps to set an initial (mute) value on each amp
when the driver parses the topology and finds an amp.  But if the
driver already has parsed this amp beforehand by other paths, it skips
the initialization, as the other path may have already unmuted the
amp.

Or I might have misunderstood what you mean about _update_bits()...


thanks,

Takashi
