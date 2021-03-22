Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA3934380C
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 05:51:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B1209F6;
	Mon, 22 Mar 2021 05:50:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B1209F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616388661;
	bh=TiyK+ZesFuVaVzj+PQ/ImKR9fBxTJF0Vjb/JVJGAK8M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o3UQ9D7DdLUC7djPkJCxV9bIt52Ld3ovmuXbkOF01PSN45enb7QKfi5M/tw5vpQN0
	 lnxGP15QGInClC4oYr3RCcrQReR5DZSrhnzLiFJc36Z3FQxX/N/cpcIi5q0MoJOpFb
	 VUCBmGFKPfCadrn0BkCBL6r16N5YBT3rle2PARko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9408F80107;
	Mon, 22 Mar 2021 05:49:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7B2FF8016B; Mon, 22 Mar 2021 05:49:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4FD1F8012F
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 05:49:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4FD1F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="w0hEJWti"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="WDXwk2qe"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0D1A3120B;
 Mon, 22 Mar 2021 00:49:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 22 Mar 2021 00:49:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=XC90qSPgEXly9DZzHwa4H57cjoN
 QE4DR97A7C5u/lcU=; b=w0hEJWtiM4gKiLOZK3RnS0mtbpvbdkrdT9EyNXpTCOL
 zBtbF7jEmtNrEf8p4O16YH9BWOkvXB8h0YU59btBnRIG/T13sBmwTKHbzmMT2lLA
 3h+s4lEQ8dY1UI8t/a44yt4q0Py1cnL8DvLydAEe1vzryvr0kOz0U9Jgaud7+/7k
 rJoe8PKPpoE6t3+Q8EUl3txfIo6jKyQqbz71vMH7yqZXduGDTAAKgJMu0OKiD+zg
 hwHAmS84zglivaPzJ+W7Wbq1d8bmUfjp+eNJEb/lTB3m4XTILoGpQ+WYD3PHnB3Y
 o0VMAZlAXjebGKgLlcZzDjVSEECjAWZxE+XZmwknMXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=XC90qS
 PgEXly9DZzHwa4H57cjoNQE4DR97A7C5u/lcU=; b=WDXwk2qezgK4WS+/GQIoMW
 YMtKs2JUjydCaURlSI7IX5lyMsUrlse276V025nUqAkDvuuecMmnlEF4JmqpKRV4
 lLX521EtN3vEiY5ptS01SNVJWBhi93XeklsGbs81nyukLUpP25UfuLwui//VP30B
 Kw8UdpEVOJFRP4FP/69szEqyEWYOoIP7jDF3H5/LpRQgf/1THS3tuy3iJo2n+OjH
 kGjBChzGkAEMTecZ6DmkTyGYSAOJrC+SddkJN9D5SIYz89FGzTR7Gil7S1DRvPdi
 1tCQtHiBu6wm6j5GGJIIQP876dDGJGX02s1BfpB4RiVhAGrDzUMP4k6UFvEPJuSA
 ==
X-ME-Sender: <xms:1yFYYNSellB0C8mKSiZiqd6N_7-qTiK3Nowc5HwyzZr7dQwvdD1Esw>
 <xme:1yFYYGw0Oi7_q5L0Kmaul1HosXndqV8-iw3aWicsFFXeTyXdi2shCH8B5hv6aV3pV
 TNj2X_UxLo2yuTxCx4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegfedgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
 dttddtvdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnheplefhueegvd
 ejgfejgfdukeefudetvddtuddtueeivedttdegteejkedvfeegfefhnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:1yFYYC2y0eyBpJJJwkm4QA-sW3e_L0qmNm9v1nCc_n9zGqza8V22eQ>
 <xmx:1yFYYFC3vMd7DkoOdWwi2oI0rB_QYa1eF3W0JCcgJjhHi36e2SF4tw>
 <xmx:1yFYYGixDzI5Ej9mUAKqXqgbOKf36avSQ2F7tu6DZGGWj6N2li_SEw>
 <xmx:2CFYYKZcFT933tzy3t-AUBbDgPUnaqj2chBdut7ki8cjLGA7QLBwxQ>
Received: from laptop (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2509E240356;
 Mon, 22 Mar 2021 00:49:22 -0400 (EDT)
Date: Mon, 22 Mar 2021 13:49:18 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [alsa-lib][PATCH 0/6] add API of equality and comparison for a
 pair of control element IDs
Message-ID: <20210322044918.GB3554@laptop>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>, tiwai@suse.de,
 tanjeff@cccmz.de, alsa-devel@alsa-project.org
References: <20210318103013.265264-1-o-takashi@sakamocchi.jp>
 <16eab1c6-03ef-fb06-9e5d-888de1cb63b4@perex.cz>
 <20210318163715.GA273829@workstation>
 <20210318165634.GA277809@workstation>
 <4629d814-4f45-5b8f-4853-ddf32f040cb8@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4629d814-4f45-5b8f-4853-ddf32f040cb8@perex.cz>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, tanjeff@cccmz.de
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Jaroslav,

On Thu, Mar 18, 2021 at 06:17:54PM +0100, Jaroslav Kysela wrote:
> Dne 18. 03. 21 v 17:56 Takashi Sakamoto napsal(a):
> > On Fri, Mar 19, 2021 at 01:37:15AM +0900, Takashi Sakamoto wrote:
> >> As I described, your old implementation is not acceptable just by renaming.
> >> Although the idea of inline definitions is itself preferable. I suspect whether
> >> inline definition for your comparison algorithm is really less overhead than
> >> function call.
> >>
> >> Anyway I'll post revised version of patchset later.
> > 
> > Oops. These APIs have arguments with opaque pointers. In the case,
> > inline definition is not available since the layout of structure underlying
> > the pointer is not available for userspace applications. Thus the rest of
> > issue is whether to use 'tuple' or 'fields' in the name of new API.
> > 
> > In my opinion, 'fields' is generic expression and could give impression to
> > application developers that it includes numid field as well. On the other
> > hand, 'tuple' is weak expression somehow and the developers easily find
> > its meaning in alsa-lib documentation (see line 80). When considering about
> > helpfulness to developers, 'tuple' seems to be better than 'fields'.
> 
> With this logic, we can just create snd_ctl_id_compare1, snd_ctl_id_compare2
> functions to force developers to go to the docs.

It's not better since it's against common convention for name of
exposed API. When you work for internal helper function which is not
exposed, it's acceptable. At least, I have never seen such functions
in alsa-lib.

> Perhaps, snd_ctl_id_compare_full() may be better. Tuple is a generic set of
> fields, so there's no change.

As I described, the usage of 'tuple' in the context is in documentation.
In this case, it's not so bad idea and acceptable I think. At least,
it's better than the word 'full' since your comparison algorithm is not
based on full fields by ignoring numid field.

> Again, I don't expect to add other comparison functions soon.

I'd like you to explain about your rejection to add comparison function
according to numid as well as your view of the comparison algorithm as
being exclusive, single, unique than the others when we have many
comparison algorithms for fields of the tuple.


Regards

Takashi Sakamoto
