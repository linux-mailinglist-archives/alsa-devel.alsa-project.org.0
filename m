Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F21C0979BE9
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2024 09:16:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9945E80;
	Mon, 16 Sep 2024 09:16:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9945E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726471009;
	bh=HSY+P674ZC//NI+yJrY0M1U5P0BgZX3TedYhmPf6JCc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JXMb0rosOzeFYQOqjvvUZnMJUx+azOQU2BgeQr03sSgHzH/FFTtL262cFUIsh+DUG
	 YdRy9wiB7XPyqtBRkK6lc6KvCDxD8O22KkVhfIrgYPIUUhcekNAE2I3iJLB95WOkup
	 TXx5t+U04c5VsuzgS+yHZ1QRLMhlerBEkmYsvoqA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC821F805B2; Mon, 16 Sep 2024 09:16:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D03F0F804FC;
	Mon, 16 Sep 2024 09:16:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B80ECF8020D; Mon, 16 Sep 2024 09:16:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E375FF80107
	for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2024 09:16:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E375FF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=tWC+tkRZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=uqmp8RwK;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=D/PWzUlj;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=PgXA8jh8
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C9F411F86B;
	Mon, 16 Sep 2024 07:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1726470970;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/sSjzr5HtMz2pqKGcdEToj0QWZJuyrJg/ZaZJWn3ez0=;
	b=tWC+tkRZSIILrMkX3PiwGWsBW6zdfHTqG3kqixGQ7cPTArpL8x/xRtnqqWgB4AecZAGn0g
	wFsDCBVexmux1UA6KQO89Rxu/04unwGKJJdyC5jIGf5BfwBXkh9a0PiF82MsAY8nnkkMGB
	MGB/SEZ9U/q01KQ4s40yDbVinqT4a78=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726470970;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/sSjzr5HtMz2pqKGcdEToj0QWZJuyrJg/ZaZJWn3ez0=;
	b=uqmp8RwKdGFtm4DmshUo59x2lZGJMy1LTO02FLGgrIMEFy3ZLY3iFPOV4fDwfF79Yrr2Xq
	KHFhEf3l2zp6fhAw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1726470968;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/sSjzr5HtMz2pqKGcdEToj0QWZJuyrJg/ZaZJWn3ez0=;
	b=D/PWzUljxJ8oLF8aG3BG/eE3gmGfrLC9qv1ZM+Ut4tBAkgI5nVmUqTI+Ng6w3jNOTbtaiF
	5zVuQQTL4Y8pSrjjnVpfR2XhxGG59Ia2ywk7jzhKXZhq3VqtjIsjNksMOQwZbqI+YZM5hx
	mxophtHHZFqZDZKXcomFx/Ie0VC0q/0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726470968;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/sSjzr5HtMz2pqKGcdEToj0QWZJuyrJg/ZaZJWn3ez0=;
	b=PgXA8jh8vvF6cxpxPAmnG5qnK/9FOOAFAdo2uTAh+5Eg6kRMavX6GfiJPqfP9zkFPV8eye
	huOSo+Y9fOspuYAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 96C631397F;
	Mon, 16 Sep 2024 07:16:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qWQ2Izjb52b0KAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Sep 2024 07:16:08 +0000
Date: Mon, 16 Sep 2024 09:16:58 +0200
Message-ID: <874j6g9ifp.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christoph Hellwig <hch@infradead.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ariadne Conill <ariadne@ariadne.space>,
	xen-devel@lists.xenproject.org,
	alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] Revert "ALSA: memalloc: Workaround for Xen PV"
In-Reply-To: <ZuK6xcmAE4sngFqk@infradead.org>
References: <20240906184209.25423-1-ariadne@ariadne.space>
	<877cbnewib.wl-tiwai@suse.de>
	<9eda21ac-2ce7-47d5-be49-65b941e76340@citrix.com>
	<ZuK6xcmAE4sngFqk@infradead.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
Message-ID-Hash: FO4SIX6TBTMOHC3ZYKNMYTV6YXKTRXNK
X-Message-ID-Hash: FO4SIX6TBTMOHC3ZYKNMYTV6YXKTRXNK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FO4SIX6TBTMOHC3ZYKNMYTV6YXKTRXNK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 12 Sep 2024 11:56:21 +0200,
Christoph Hellwig wrote:
> 
> On Sat, Sep 07, 2024 at 11:38:50AM +0100, Andrew Cooper wrote:
> > Individual subsystems ought not to know or care about XENPV; it's a
> > layering violation.
> 
> Agreed.
> 
> > If the main APIs don't behave properly, then it probably means we've got
> > a bug at a lower level (e.g. Xen SWIOTLB is a constant source of fun)
> > which is probably affecting other subsystems too.
> > 
> > I think we need to re-analyse the original bug.  Right now, the
> > behaviour resulting from 53466ebde is worse than what it was trying to fix.
> 
> 53466ebde looks bogus to me, and the commit message doesn't even
> try to explain what bad behavior it works around.  I'd also like to
> state once again that if you think something is broken about dma
> allocation or mapping helpers please Cc me and the iommu list.
> 
> Most of the time it's actually the drivers doing something invalid, but
> sometimes it is a core dma layer bug or something that needs a proper
> API.
> 
> Also while looking at the above commit I noticed the broken fallback
> code in snd_dma_noncontig_alloc - get_dma_ops is not for driver use,
> and starting with the code queued up for 6.12 will also return NULL
> when using dma-iommu for example.

Yes, all those are really ugly hacks and have been already removed for
6.12.  Let's hope everything works as expected with it.


thanks,

Takashi
