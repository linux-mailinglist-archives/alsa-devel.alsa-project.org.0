Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0F35334D9
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 03:43:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DF841660;
	Wed, 25 May 2022 03:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DF841660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653443010;
	bh=9A8ThEC2ErIIFJecu8bCQUpO5CaNPlxjrrFQe5WZQrk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hwNCQF7qpXwm6o1Qy4vS0xW+PFR9MOP9pPFhktxkGGLsgN3azuvVIdFbG+Q8is4Hn
	 /9Y+kpPiiZDvi1eGqfzZrvkBkB9V/02gMhFF6xKgjNR4HT5bdbVWBvwkqGB9dM6dTp
	 kpgBvIuSVYZ2SOnPwUwm3OvUycgI3lcsRkdU5m8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3F74F801EC;
	Wed, 25 May 2022 03:42:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A788F8016D; Wed, 25 May 2022 03:42:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFA12F800D0
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 03:42:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFA12F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="HzrsVesv"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="JZ0OjPIK"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2D9BC320092A;
 Tue, 24 May 2022 21:42:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 24 May 2022 21:42:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1653442933; x=1653529333; bh=aK
 P2MtBf5wJ3Hxavvnk5ztlpYWleHN1j8hVNDSToJ/Y=; b=HzrsVesvfM11shZsnj
 ojnDWz/1E5McA4o3n/rbY0yQUFAu4ttblmcwqT4PHZDkAobRsKEWb2KFJTJONemT
 /VreibCtbXyem7ukRf01xQhfUSyrNN7eT2kL5pdGLZ7c9+PjHR/E2gdnUebKTMQn
 Mzkfb1WjfSD2BIIJV7VntgtiX4UZMyqwzNwKNUKAanUFUfz7lRhJPTnJ3CzxcuOk
 rmpqudh/ieG9AnO4GRoduY3WzOqE+PCC0/zS5wRgAiLej8AffPQtZ2RF98QMLwW6
 maSw6cHi40Q8Vj/hSZM5GepMgQQRNPIUgfYCWN/Xze6xU7Rm/KGJjM98bh91Y2jw
 zW2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1653442933; x=1653529333; bh=aKP2MtBf5wJ3Hxavvnk5ztlpYWle
 HN1j8hVNDSToJ/Y=; b=JZ0OjPIKsLHZwBxy2G/oUdDyiCvNR4FHFcw1cblfdzk1
 JlOO0J3ygO/qd7XCgRHynt67gsBVsRBUnL9jme8PSa2ZHy/DRfXYysJ688khHBia
 7TG5rkOKINi6lgmSQfB+2EA+hOPMvzs2qQLYQQ685hCPV7l3p6CcPbGMc3FZQ4eq
 MuEbjdXMJA20mrRUsTzeH5wuLnuTQSgHBlsjrWpkM24r4m22dUy2VljXagaNfQxp
 oo5VGX0Yawe9AQyKEtn1DgFEp9wAtEr6xbR28cWwFVgFpbz3FhnGSj99s79cXTHA
 3kXBA8fQwnts5kvSWkPvoNX8QYFMy7T6B9ZDWGKlrQ==
X-ME-Sender: <xms:dImNYk3X2T_bo8wTxL7ituURwzvG33LeFoVeqFIxohQs-PvRtDrvmw>
 <xme:dImNYvH1IXAKYrxuMAkxZehrQpRpz8MD4veS41_32kJK7NXZHHAMExS8kRc5m5Adu
 7K0_VMHixiJOTqkkeg>
X-ME-Received: <xmr:dImNYs6V-PBhfxyPfKHWlpOd5XD8njrvryA5Ref061iHLKIG6c-TWzV9b4OncDQzXimZCwi6CrvegmgtgdsES5HTPOm52KN7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrjeeggdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 fuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpeffhffvvefukfhfgggtuggj
 sehttdertddttddvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqd
 htrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtthgvrhhnpedu
 jeeiiedtveekgeehveevvefgkeetteduffdukedvledvudehudeujedvkeeugfenucffoh
 hmrghinhepghhithhhuhgsrdgtohhmpdhgihhthhhusgdrihhonecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:dImNYt1IOvNy9_Tc53uCh5HvOlCr5RMoTRrMb-mG_ReFZev5jHWBzw>
 <xmx:dImNYnFYR_vH9ebvN5jfY6rp4QUCiHOHV2Q6xLT0QEkqtMshISJdYQ>
 <xmx:dImNYm_K6B0jZaRQNkWF_xPB6G0bkJbdJ3CS4riIIEGipjiDYZSj1w>
 <xmx:dYmNYtOyDHQnYGvuTTF01c3GYRdDKaOrToaIK5CGPZTPJlhWG9btTw>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 May 2022 21:42:11 -0400 (EDT)
Date: Wed, 25 May 2022 10:42:08 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: Request for setup of new repositories
Message-ID: <Yo2JcNT9rQ0xw0+Q@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <YmagC3V3t0k84k9A@workstation>
 <7d90c47a-ce1a-d9d7-ba8a-e794f20487cb@perex.cz>
 <YmfZxmfv5dfgdYG1@workstation> <YmtNgqfFREYKZM6t@workstation>
 <YnO4A43EUdnG0b7n@workstation>
 <14235475-bd6b-4b86-61f4-8c2aa7f95838@perex.cz>
 <b6e986d0-b594-4543-ae63-e08e88ad3418@www.fastmail.com>
 <YozAmQFZ3LhqQoZN@workstation>
 <afd7c233-39c5-b73f-75c7-728a8abbd434@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afd7c233-39c5-b73f-75c7-728a8abbd434@perex.cz>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

On Tue, May 24, 2022 at 02:36:19PM +0200, Jaroslav Kysela wrote:
> On 24. 05. 22 13:25, Takashi Sakamoto wrote:
> > Hi Jaroslav,
> > 
> > On Thu, May 05, 2022 at 09:49:52PM +0900, Takashi Sakamoto wrote:
> > > At present I prefer separated pages from source since the pages can be
> > > generated from the source, however as you say the inclusive way is worth
> > > to reduce repository maintained by the project. I test the idea later in
> > > my libhinoko repository. When it looks well, I'll request you for
> > > configuration change.
> > 
> > I'd like to fix the issue for the URL of documentation before releasing
> > libhitaki since I put the URL to configuration for gi-docgen.
> > 
> > I'm investigating to put the documentation into the same repository
> > where source is maintained, however I prefer to separate the two into
> > different repositories. Then I suppose it good to put several
> > documentations into one repository rather than maintaining them in
> > different repositories.
> > 
> > At present, three repositories are maintained for documentations:
> > 
> > * https://github.com/alsa-project/alsa-gobject-docs
> > * https://github.com/alsa-project/libhinawa-docs
> > * https://github.com/alsa-project/libhitaki-doc
> > 
> > Let us consolidate them in one repository. For example, by referring to
> > team name:
> > 
> > * https://github.com/alsa-project/gobject-introspection-docs/
> > 
> > The documentations are expected to be public under below URL:
> > 
> > * https://alsa-project.github.io/gobject-introspection-docs/alsa-gobject/
> > * https://alsa-project.github.io/gobject-introspection-docs/hinawa/
> > * https://alsa-project.github.io/gobject-introspection-docs/hitaki/
> > 
> > I'd like to ask your opinion about the idea.
> 
> Thanks for this idea. I just noted that github allows to specify a branch
> for the git pages (github.io). Do you think that a 'doc' or 'docs' branch in
> the separate source repos will be sufficient for your work? It may be more
> logical than having a common doc repo (logical URLs) and things (source and
> generated pages) will not mix together.

Thanks for the suggestion. Indeed, we can choose the way to put
documentation to specific branch in the repository. I've already
investigated the way then had complexed feeling.

...To be honest, I'd like to avoid it, as much as possible, in a point
of the essential concept in source control management. The branching
idea forces to put several histories disconnected each other into one
repository. It's surely available technically, however I feel sort of
awkward somehow.

(I think I'm enough conservative when using tools. I feel something
shooting myself in the foot when doing it. It perhaps comes from my
experience under UNIX-like environment...)

The separated common repository for documents had room for integration of
documentation. For example, I can put library documentations as well as
overview page for included software such like Rust crates. It's flexible
and logical in a view of top level of software stack.


Thanks

Takashi Sakamoto
