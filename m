Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4C69586D9
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2024 14:25:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4A936C1;
	Tue, 20 Aug 2024 14:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4A936C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724156709;
	bh=gB/qpTik6peKajUtgSyTNaIHZfSSkv4bwYe6mPLY8gA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aKj3lqB5/AH9wu7pxfins23sadKKytC/JbSi1JCz7FNYE4bn13ZIqNlrdoTVJndD7
	 Tfx+aTKBMAkvvTOd2nwyPJz2qSnbWox33D552YGmGcwpFlPetMlarYW4OAXMKRjO31
	 JfR9Cf08Nnmq6gkRG+TmN2V23k2ZiZtdmdUmvlKE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77339F805B4; Tue, 20 Aug 2024 14:24:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7101CF805AE;
	Tue, 20 Aug 2024 14:24:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0AE14F80494; Tue, 20 Aug 2024 14:24:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fhigh7-smtp.messagingengine.com
 (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A7C1F800F0
	for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2024 14:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A7C1F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.a=rsa-sha256 header.s=fm1 header.b=DHBlGvPl;
	dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=dKCsXqE4
Received: from phl-compute-01.internal (phl-compute-01.nyi.internal
 [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 89C431151B50;
	Tue, 20 Aug 2024 08:24:21 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 20 Aug 2024 08:24:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1724156661; x=
	1724243061; bh=a6zHW584Nt6I4NvQjIKpv2LAbK25vNr4J6/juyl2XvI=; b=D
	HBlGvPljnajsE2TZPOhVgHhFHjQ5hLd480/4ha2NXfEajJXKzgd+yTLKTP8h74qu
	bAPh7+vNUuaNRKPernqUyMvPuzZmiFur7n+xNFYcvN0FerBnr85ldvHUlA6RE7hi
	nnRK4aj8sAvmOS9Pl+Z1ctQkA3w54dluWCU/3reka+ffLxjLKd/phB2DPBOhmboG
	KwjMmmtCXILkK1m5qrvUw0XEw+a7+YN0YvX7ELj1cxSIZ4EZUHzrcawthkL7NB3P
	rHRnvjwazsntWoqObl2uqlLoDuPErMtTpXQF9faNa2OPys898EXMtgTSQ3xp/BNN
	ZDZB5L7CqB/qgd4j1vw7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1724156661; x=1724243061; bh=a6zHW584Nt6I4NvQjIKpv2LAbK25
	vNr4J6/juyl2XvI=; b=dKCsXqE4mgqbBiYs4L6avpVuatUuAXarNY81sT6eCemI
	8HREdw5kvZ2UbiBQmFeW2uOvH62fIiDQUqnoVFZk5slx7JX0bf19hWUaeuZye6cK
	EYZvzEqX+p/TAVWU2/4v78jB+OchLVJYcU/RtkQ5wyNDqL0h70dtpcimdJHpxJt4
	CxWtcn2WNzo6XH1ghRU+Sxz3bAAxdsYM/82+IxmX+wsb3HHJrUhjOL5SZx9X49SR
	DjVh54slhIZmhRrih/yo3ecFakyvwnwqg1nSr2I4Q7AQHmY1saMVD4wnj7fnGn52
	ddqj4EEmOIlcQFHlt6GRgdyDGiLMwuRhfHKRsoIaAg==
X-ME-Sender: <xms:9YrEZj-lx2HhCyjkUusKSq_uNPvR9A4rOeqvEi5NdYE2UsbowtnvQg>
    <xme:9YrEZvsRgkDhId5unwr6Lt6cDFjddkBW3n2FyLVZ8JudZuf6g-0qB6s9a2nNOIrjf
    oxqv9K1sCtBP0WOCj4>
X-ME-Received: 
 <xmr:9YrEZhCCTYgrtoTA-0KA_-ER0T7C916cVQ4l3xp6VXBxwarUvYZGlCiGfpYjs4Pf3AC3QjxwZ86tLstTSUBnxWtBQnvx2rZ_JR3H>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgeeftddrudduiedghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvve
    fukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghm
    ohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrg
    htthgvrhhnpeehhffhteetgfekvdeiueffveevueeftdelhfejieeitedvleeftdfgfeeu
    udekueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhppdhnsggprhgtphhtthhopeeg
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegvughmuhhnugdrrhgrihhlvgesph
    hrohhtohhnrdhmvgdprhgtphhtthhopegrlhhsrgdquggvvhgvlhesrghlshgrqdhprhho
    jhgvtghtrdhorhhgpdhrtghpthhtoheprhgvghhrvghsshhiohhnsheslhhishhtshdrlh
    hinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhsohhunhgusehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:9YrEZvcsfreCJPbrha42AE7R_ik2lGijWQvOZnzaVi2gSpx8cKUFkQ>
    <xmx:9YrEZoPTFl88xo2rKYVUX-4iY5OfHsuVl5FMOVmua_EpjHEOvxXSVA>
    <xmx:9YrEZhldahYcI9D6UkuZLKCTLSABDaAZF0l-6GVLsZS6KK1UbflXGQ>
    <xmx:9YrEZiurlw7hgaKrKlWbrNTWDd8u0rbxVGNsIV0RS-eAmT9sP7RdRQ>
    <xmx:9YrEZlpUBdxJ3dnx2E4tdhJI_xUHw0L3X7omhMe9ASchVsYm7O5sCjO->
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Aug 2024 08:24:19 -0400 (EDT)
Date: Tue, 20 Aug 2024 21:24:16 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: "edmund.raile" <edmund.raile@proton.me>
Cc: alsa-devel@alsa-project.org, regressions@lists.linux.dev,
	linux-sound@vger.kernel.org
Subject: Re: [REGRESSION] ALSA: firewire-lib: heavy digital distortion with
 Fireface 800
Message-ID: <20240820122416.GA26397@workstation.local>
Mail-Followup-To: "edmund.raile" <edmund.raile@proton.me>,
	alsa-devel@alsa-project.org, regressions@lists.linux.dev,
	linux-sound@vger.kernel.org
References: <n4jdkizinqfoztqn2cwv7uqqqnvkyu2xk32qebazqznh74b3d3@r23skt4k7mqe>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <n4jdkizinqfoztqn2cwv7uqqqnvkyu2xk32qebazqznh74b3d3@r23skt4k7mqe>
Message-ID-Hash: IKUHFTTAOFXA3EMB4PMQB7P4F3GFB3N5
X-Message-ID-Hash: IKUHFTTAOFXA3EMB4PMQB7P4F3GFB3N5
X-MailFrom: o-takashi@sakamocchi.jp
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IKUHFTTAOFXA3EMB4PMQB7P4F3GFB3N5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jul 18, 2024 at 12:29:48PM +0000, edmund.raile wrote:
> Between the kernel releases 6.9.9 and 6.10.0, something changed that causes
> heavy digital distortion on playback from at least ALSA and PipeWire.
> The rhythm of the music is discernable in the output, so it isn't just
> random noise.
> It sounds a bit like bitcrushing, but not quite.
> The generated overtones appear to be dependet on the sample rate.
> 
> I am sorry I can not be more specific, there are no kernel messages this time.
> 
> As Mr. Sakamoto recently committed all these changes to firewire he might
> be able to identify the issue easily, which is why I'd like to ask him to
> look into it.
> 
> Kind regards,
> Edmund Raile.
> 
> #regzbot introduced: v6.9.9..v6.10

Fixes included in:
* 6.11-rc2
* 6.10.4
* 6.6.45
* 6.1.104
* 5.15.165


Thanks

Takashi Sakamoto
