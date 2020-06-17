Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 782341FD8C8
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 00:31:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 121E71679;
	Thu, 18 Jun 2020 00:30:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 121E71679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592433071;
	bh=dg3SvFjzi9DAbVUIJl09OFZrjQTXK9kAkfxi/gTdXGo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dRiCC40spGClzxv7YEC5/sf6AOTT781THgxj9iwn279zv1L1qedxrg7RDhcLGCb0e
	 OTW2mFHkwH9EQnND0zSxgUJesiTOuCL2cpmSwqHM/f+hvl1PogaHYLoXvjn48B9bwA
	 LZUDAo78PN9jnJEKlzRn8JamkFVChsJYpzNBlHjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26351F80101;
	Thu, 18 Jun 2020 00:29:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54B0AF80171; Thu, 18 Jun 2020 00:29:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5CD6F800EF
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 00:29:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5CD6F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ZkWOWZQ1"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="KK91JT/4"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 281D15C0154;
 Wed, 17 Jun 2020 18:29:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 17 Jun 2020 18:29:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=5TPf6HfOJbJh/LX2pzZEKTUu7NI
 jABLLVeLKiCaUtcs=; b=ZkWOWZQ1yAW4rMQhnrC5GfCE2MH6lSLTrpKeJpEYqzq
 fCYw4Hx5GCWnO9NIxPv0rHR07paURLPOI6xFirbsxG75rbkoGnZuI+FWUMCoJhOQ
 BOWFfNyN5ayguBN/9upgvWu/VYUgtg8RxvQvTsl/njc9VyPqMWeCgse+ywnPEvPr
 EYGAyAp6KTEnH7lxGA5TAji8yJRIAsCnK04qC5BKRTsq2FVFDrfgrFD1r20cJ95k
 gKw4x8fjRwoFyEcSjuvrdwWMixTnVw3ulqy/WA+Ey/s/PI2vSdYJiFw1I5i5KfBN
 aeoFWPL+0Vts4dZE1o0wcZUwPWpXGeQpDdTBZw/5caA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5TPf6H
 fOJbJh/LX2pzZEKTUu7NIjABLLVeLKiCaUtcs=; b=KK91JT/42nYlF9D9IDvDuI
 gnkinhFHk7GCEx572DR5U5O19jx47WGi4HnusPzoXB03kcHaVfC3pAd/u8ePM5L8
 Y5cjA7tzQc/Xo4vhVkHuA5awq76hSEfWLW8puDzA/Db4pUju9oea8J8c3gpFhDMU
 jxNRRN0bp4/DJUdIE1umhV8drfOB8gIBBsBs813Swp5JhtSBR3nv5Mdzs9WZ0ZBx
 YVUrH8db2wmwATL4rBPwU84tllICskMvE+FVoNTpXYAH+lRrRplLlXsCkEBpbMYT
 +1lVtyX3e6k4uGEAkHpkCO8WCJRO7oyP+15GQN6BwVJiig3AjMqKRiJxKFGj+9hg
 ==
X-ME-Sender: <xms:PJnqXhd8m2pNE2vqHWc1J6xLkvt1mMZweRAJuB19YKDrVUWMgKOtjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejfedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelfeelieekieeivedtffefieehfefhudefieeifffh
 tefffeehfedvveduudfgtdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppe
 dukedtrddvfeehrdefrdehgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:PJnqXvOb2rRarcr85YUKiyer93QkRhLNEL_A_i54GGRqWpa_esLCsw>
 <xmx:PJnqXqgQld5Lp3CXpL0jSi5Yn8SJkbzRLO6uxkYPFIzeqPBZh39O4w>
 <xmx:PJnqXq9zMgIUSnkcOmV5DVu5e7z11ip49sGVNqcwEx3RarU3nJX0_w>
 <xmx:PZnqXr6ywBTVtH8oLc065mwy3hxH9jT2uN35Twd37Zdt7K-lILBD7Q>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0F42D3060F09;
 Wed, 17 Jun 2020 18:29:15 -0400 (EDT)
Date: Thu, 18 Jun 2020 07:29:13 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Subject: Re: Move ownership for repositories in Github related to
 gobject-introspection
Message-ID: <20200617222913.GA279571@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20200617080114.GA265611@workstation>
 <26bcc126-6688-5996-b6ad-3288bd2facd8@perex.cz>
 <20200617125716.GA273906@workstation>
 <350b8bbe-afed-294f-a96a-0caf99ecb567@perex.cz>
 <20200617131746.GA274842@workstation>
 <3feba622-81f6-f2a6-b4dd-289d98f0aca2@perex.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3feba622-81f6-f2a6-b4dd-289d98f0aca2@perex.cz>
Cc: ALSA development <alsa-devel@alsa-project.org>
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

On Wed, Jun 17, 2020 at 04:57:22PM +0200, Jaroslav Kysela wrote:
> Dne 17. 06. 20 v 15:17 Takashi Sakamoto napsal(a):
> > On Wed, Jun 17, 2020 at 03:07:02PM +0200, Jaroslav Kysela wrote:
> > > > Thanks for your approval. Just now I transferred below four repositories
> > > > from my account to alsa-project account:
> > > > 
> > > >    * https://github.com/alsa-project/alsa-gobject-rs
> > > >    * https://github.com/alsa-project/libhinawa
> > > >    * https://github.com/alsa-project/libhinawa-docs
> > > >    * https://github.com/alsa-project/hinawa-rs
> > > > 
> > > > Fortunately I can select the 'gobject-introspection' team as destination
> > > > of the transferring, but I'm grant for read-only access. Would I request
> > > > you to grant my account Admin (or Writeable) right?
> > > > 
> > > > And you made 'Hinawa' team and put libhinawa/hinawa-rs repositories into
> > > > it. But in my preference they're in 'gobject-introspection' team as well
> > > > as alsa-gobject repositories.
> > > 
> > > I created new 'Hinawa' team and changed the priviledges for all new repos
> > > appropriately.
> > > 
> > > If something is wrong, let me know.
> > 
> > The half of libhinawa is an application of ALSA hwdep interface to
> > implement user/kernel interaction described in 'include/uapi/sound/firewire.h'[1].
> > (The rest is an application of Linux FireWire stack.)
> > 
> > Furthermore, in a point of application of gobject-introspection and
> > abstraction to a kind of ioctl requests, libhinawa and alsa-gobject has
> > similar design. For me, it's convenient to put them into the same
> > 'gobject-introspection' team without adding the specific team.
> > 
> > Would I request you to put all of them under 'gobject-introspection'
> > team, again?
> 
> Ok, done, the 'GObject Introspection' team is member of 'Hinawa' team now.

Thanks for your arrangement. However, I would not expect the 'Hinawa' team
itself and I would like to continue to use 'GObject Instrospection' team only...

Would I request you to delete the 'Hinawa' team from 'alsa-project'
project, and put all of the repositories under 'GObject introspection' team
under 'alsa-project' project?


Regars

Takashi Sakamoto
