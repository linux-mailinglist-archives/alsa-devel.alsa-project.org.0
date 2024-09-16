Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF7F979C1E
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2024 09:37:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B72ACE94;
	Mon, 16 Sep 2024 09:37:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B72ACE94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726472272;
	bh=Sjf08PRYXtgkIv9NQ0v4ETz3t7ZhXERBTQnmQ4ghrVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FU/ZQ6jkIXUQeDeGRB/pbxdr2GosUbM1lFKJfhwILbM8eFFFzQGSsTVmjy0k55HSD
	 7trPRZ2BMTaegkRJf3HA7Y7FQHL9kjQhHLuYO3kr5fnQ04Ex/vjc+C0ADGhKVc4Itz
	 UoBx1PfTF9NQx6edUu1M2Y/3rweasWkMWCg8Mv7A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40228F805BD; Mon, 16 Sep 2024 09:37:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F7B6F805B0;
	Mon, 16 Sep 2024 09:37:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B159F8020D; Mon, 16 Sep 2024 09:37:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBEE4F800D0
	for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2024 09:37:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBEE4F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jazc38fw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gju9XBeCOro1y93nA5waVyVrbX5nWYeDFXoNrraZEsk=; b=jazc38fw1Kh+LNx9gSWOMO22Uy
	MM3h6EiwAwxcdUMkuErVz1aregLWF5DHESZ+q9zuakvOu/jVvxmkNXbgYIPq7xz4yL5JtTCeEabZ+
	hWeE0eWeI4rydIgD43gTdxHDw/fo7eJQ1p0Sr7Ffv6Xog6cr13f0lkpZAzn8gk0mVVAp4wmGeV6NW
	hsl3XsG/NwVC2d8ZTy582+ZkpBX6fr6epOnyKhKOmwNCIMgLDxlLwEsKlVJuEXtBl0ebNvLNyz1Pm
	ECbYkBWhDHZr82ysQtk5zKsUhVg3OGPYilMFKfj7g19a3Yb8MogwJI8BT5ZrYRjRxiStmsYmGGzUd
	28lNN+QQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux))
	id 1sq6IF-00000003Kd9-3lbI;
	Mon, 16 Sep 2024 07:37:07 +0000
Date: Mon, 16 Sep 2024 00:37:07 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Christoph Hellwig <hch@infradead.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ariadne Conill <ariadne@ariadne.space>,
	xen-devel@lists.xenproject.org, alsa-devel@alsa-project.org,
	stable@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Subject: Re: [PATCH] Revert "ALSA: memalloc: Workaround for Xen PV"
Message-ID: <ZufgI6gw1kA8v4OD@infradead.org>
References: <20240906184209.25423-1-ariadne@ariadne.space>
 <877cbnewib.wl-tiwai@suse.de>
 <9eda21ac-2ce7-47d5-be49-65b941e76340@citrix.com>
 <ZuK6xcmAE4sngFqk@infradead.org>
 <874j6g9ifp.wl-tiwai@suse.de>
 <ZufdOjFCdqQQX7tz@infradead.org>
 <87wmjc8398.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87wmjc8398.wl-tiwai@suse.de>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Message-ID-Hash: OSYODJS5OG6KXUMC3KWNKXX3XTCKGLBY
X-Message-ID-Hash: OSYODJS5OG6KXUMC3KWNKXX3XTCKGLBY
X-MailFrom: 
 BATV+500305f64adcbfb43b9e+7694+infradead.org+hch@bombadil.srs.infradead.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OSYODJS5OG6KXUMC3KWNKXX3XTCKGLBY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Sep 16, 2024 at 09:30:11AM +0200, Takashi Iwai wrote:
> On Mon, 16 Sep 2024 09:24:42 +0200,
> Christoph Hellwig wrote:
> > 
> > On Mon, Sep 16, 2024 at 09:16:58AM +0200, Takashi Iwai wrote:
> > > Yes, all those are really ugly hacks and have been already removed for
> > > 6.12.  Let's hope everything works as expected with it.
> > 
> > The code currently in linux-next will not work as explained in my
> > previous mail, because it tries to side step the DMA API and abuses
> > get_dma_ops in an unsupported way.
> 
> Those should have been removed since the last week.
> Could you check the today's linux-next tree?

Ok, looks like the Thursday updates fix the dma_get_ops abuse.

They introduce new bugs at least for architectures with virtuall
indexed caches by combining vmap and dma mappings without
mainintaining the cache coherency using the proper helpers.

What confuses my about this is the need to set the DMAable memory
to write combinable.  How does that improve things over the default
writeback cached memory on x86?  We could trivially add support for
WC mappings for cache coherent DMA, but someone needs to explain
how that actually makes sense first.
