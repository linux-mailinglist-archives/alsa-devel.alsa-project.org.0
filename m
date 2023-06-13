Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4774F72E8FD
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 19:06:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0CFBE9B;
	Tue, 13 Jun 2023 19:05:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0CFBE9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686675980;
	bh=3pGRrQcY68kQcZzm4lhsxN6cGGmPdud3RM0v5x9xc2c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KTB5FXoLF1h+/oEAiVlIBfld+xD730rY1ubvc+aLI1qjKX8EtLtJIJ28LdVwLy0Rb
	 hqLy3Hq3eQXGZ4Ag6iAyP4iPa+2g8hLb3TL+njWmkSPmQZ+mj1EX2UutWC0hmUmQPX
	 4aN6M1cs3PL+RxhEX3iMim55mz7skP2IM+AFbDpo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32C05F80093; Tue, 13 Jun 2023 19:05:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB2BFF80132;
	Tue, 13 Jun 2023 19:05:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EE72F80149; Tue, 13 Jun 2023 19:05:26 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F2572F80093
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 19:05:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2572F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=zBWcqGYu;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=WfqJKZv6
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 655D11FDB2;
	Tue, 13 Jun 2023 17:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686675922;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4SwZHho/BwJapf6iwS9Bcg+rbEfSrGjWbdyyOWiF71c=;
	b=zBWcqGYuX2Gb6xG21jmzaJYvhuDC8TRvkie8TrULLNbf4pKIgxTooxoc517dsvmTjUT8Ti
	N4v7kVNn4/+cRjh5p+4MLR1wpPYg+zPRM8BdpcLdPkwj3l7Qctwb0Yjfr/Jc5HOf2nG8xX
	MbreelxpxDEchzAW65ioKmo689Lj4GU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686675922;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4SwZHho/BwJapf6iwS9Bcg+rbEfSrGjWbdyyOWiF71c=;
	b=WfqJKZv6uf12q8a1vlSPL9Hj/Ne1M4NlY+ERSPpBgncY1pMZHI06FTM+SKJ9yyP49grZnS
	wZZyOhU3+nW857Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3AAE113345;
	Tue, 13 Jun 2023 17:05:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2HlMDdKhiGTHTwAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 13 Jun 2023 17:05:22 +0000
Date: Tue, 13 Jun 2023 19:05:21 +0200
Message-ID: <874jnbcmy6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Use maple tree register cache
In-Reply-To: <18bcfcba-a6ce-4595-bd2b-4d4ba761fd58@sirena.org.uk>
References: <20230609-alsa-hda-maple-v1-1-a2b725c8b8f5@kernel.org>
	<87v8fua1qm.wl-tiwai@suse.de>
	<877cs7g6f1.wl-tiwai@suse.de>
	<e48bbd3b-544d-43d5-82a1-8fbbcb8cd1a4@sirena.org.uk>
	<87v8frcueb.wl-tiwai@suse.de>
	<60f70667-16b0-4071-aa0f-a83e43bbf2a0@sirena.org.uk>
	<87a5x3cp9r.wl-tiwai@suse.de>
	<18bcfcba-a6ce-4595-bd2b-4d4ba761fd58@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 2I7RVW6ZYRDG2TV5K7IKM3DPWWUCBMFI
X-Message-ID-Hash: 2I7RVW6ZYRDG2TV5K7IKM3DPWWUCBMFI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2I7RVW6ZYRDG2TV5K7IKM3DPWWUCBMFI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Jun 2023 18:41:15 +0200,
Mark Brown wrote:
> 
> On Tue, Jun 13, 2023 at 06:15:12PM +0200, Takashi Iwai wrote:
> > Mark Brown wrote:
> > > On Tue, Jun 13, 2023 at 04:24:28PM +0200, Takashi Iwai wrote:
> 
> > > > Since HD-audio codec has no known default values unlike normal codecs,
> > > > it needs to initialize itself only at the first access, and this
> > > > helper does it.
> 
> > > Ah, if it's just suppressing the write the code should just be removed.
> > > regmap_update_bits() already suppresses noop writes so unless we might
> > > write a different value to the register later the effect will be the
> > > same.  I can send a patch.
> 
> > Oh, I'm afraid that we're seeing different things.  The code there is
> > rather to *set* some initial value for each amp register (but only
> > once), and it's not about optimization for writing a same value
> > again.
> 
> > That is, the function helps to set an initial (mute) value on each amp
> > when the driver parses the topology and finds an amp.  But if the
> > driver already has parsed this amp beforehand by other paths, it skips
> > the initialization, as the other path may have already unmuted the
> > amp.
> 
> > Or I might have misunderstood what you mean about _update_bits()...
> 
> So it is possible that we might set two distinct values during setup
> then and we're doing this intentionally?  It's not obvious that this
> might happen.  A comment wouldn't hurt, and a big part of this is
> confusing is that in the non-regmap case all we're doing is suppressing
> duplicate writes, in that path it's just checking for changes in the
> register value.
> 
> None of this is what the non-regmap path does, it just suppresses noop
> writes to the hardware.

Actually, many of HD-audio codec driver code heavily relies on the
regmap, more or less mandatory.  The snd_hda_codec_amp_init() is one
of such.  You may write a codec driver without the regmap, but some
helpers won't work as expected.


Takashi
