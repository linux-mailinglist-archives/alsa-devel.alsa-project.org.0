Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A031128D2D
	for <lists+alsa-devel@lfdr.de>; Sun, 22 Dec 2019 09:06:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0F801660;
	Sun, 22 Dec 2019 09:06:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0F801660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577002016;
	bh=5u/hLS6HUhxOlJ8yoXG5XwSCOyCSfZneL7LUOVj6d/0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jHHBGp0qYKWYz7K3PFOsSOFcdGnm1fqNm05DZRBkgbwMFNmWYM75XLYyKwlD047j4
	 b0C9kr66RAS9r6oOYMrTCCkGVrVfLgg6rHIRPteWrEsiSM/yukZJyDl0R/vfk38vdH
	 osG7TEhztQkKk+zFhFx2fsRCHbY1Hxmldka7kX0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BAF5F8014C;
	Sun, 22 Dec 2019 09:05:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76F42F80136; Sun, 22 Dec 2019 09:05:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D001DF800BC
 for <alsa-devel@alsa-project.org>; Sun, 22 Dec 2019 09:05:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D001DF800BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="TqY6JrDm"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="EDDKXOga"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 3CCCF3A4;
 Sun, 22 Dec 2019 03:05:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 22 Dec 2019 03:05:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=v0cqd+1HE/TMOyzOTbDwUTnv4/8
 U+w7uIs+b60Qpo7I=; b=TqY6JrDmBeS1nG6BeGMAFF+OpAzxQKmJHyzA5ZIgmEM
 ueCEP/M4ED4u3WZQ/PioKBE+aPUyF2hq/CXQZd9Tp3hncOvS3e6CD44tCh79naUJ
 1Uk9Lfd9aXamVP3H4kTKwEEB7LrPa1+gVFEaKQ+KuQYG6zqN7/z9TZvYjpcrfoyF
 Mtl68c9Ok+fF/aQdglDD1aT20MSK6aE1q+Xim1zuokLkhNXffG6QZ/N7MpwyndLJ
 mi9P54cui8iGyxeCBvEs/sTYo+KHIL1xPTWr0XFbUbidOjV2WHEOJfIAXwrirahR
 s4Nfm2RzH/w4yunVxP0zrMDxEa9AqUkZCaWS1iaAJUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=v0cqd+
 1HE/TMOyzOTbDwUTnv4/8U+w7uIs+b60Qpo7I=; b=EDDKXOgaE+cl3/wMcz+JlO
 BF+s6rrKZgFQNBNhP26jUqr7LVuI1cDkMjRnBNrmQ2Z9bF/strB04IQQEeN4A1nJ
 E2ZfbUGga2SuQrCYtMJ+BkAG0B3t7KaxVf1C1HU3rM5ZcNlenYH9xcZvU9UVp/Rr
 No7PdLc1mj3gDmUuleEPF5YHkLWzDWvt6pOOvSYPvQnRyxDAeKmP8GJ51S7pchft
 iGhV13AHoV1KtMKqBglpjWsgK0Hef1iYNI7cnXzaYeSF42ByfOThbIU8iQrk6BJ/
 GCHd45raxS2ocKP2p4J/jGvNJVZxn2g7gIfOIKM6dU+6RtF7gtDRlryWZzKDqNwg
 ==
X-ME-Sender: <xms:rSP_XVKZquDgNkJp0yC9uwTu9RXVrOP9ZDer3f6I6Gm9s6mes_Yhqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddujedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgoufhushhpvggtthffohhmrghinhculdegledmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuffhomhgrihhnpehgihhthhhusgdrihhopdhgihhthhhusgdrtghomhenucfk
 phepudegrdefrdejhedrudekudenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkh
 grshhhihesshgrkhgrmhhotggthhhirdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:rSP_XciKg3pWdOerUUQvPYP4Tcpi2yZW10MfsMAqH60Ahc-CcsZILA>
 <xmx:rSP_XblLJxEzlmfvj_cd2-xxqPBRB9mVyIYPGZHRXyya9puoQZKTOA>
 <xmx:rSP_XRj9a3-xD7HigsVg1wfk7jpNgU3W0oRec6GFZSNAGJ6jHOFiXg>
 <xmx:riP_XfWI18C2hxLWRnxc4R4OeH5sLWfMO55kyyGQLqBgpfWX6REe1A>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9EAE180059;
 Sun, 22 Dec 2019 03:05:00 -0500 (EST)
Date: Sun, 22 Dec 2019 17:04:58 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Jaroslav Kysela <perex@perex.cz>
Message-ID: <20191222080454.GA16605@workstation>
Mail-Followup-To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
References: <20191201080449.GA408@workstation>
 <b121b3eb-3bb8-7efc-d5e1-f470049899b7@perex.cz>
 <20191214165242.GA32025@workstation>
 <a63e0b6b-b1c6-3044-cbd0-7fad47b78f35@perex.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a63e0b6b-b1c6-3044-cbd0-7fad47b78f35@perex.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Restart alsa-gi project as alsa-gobject project
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Jaroslav,

On Wed, Dec 18, 2019 at 08:20:44PM +0100, Jaroslav Kysela wrote:
> > Here excuse me for request you another work for documentation of
> > alsa-gobject. I utilize glib/gobject architecture developed by GNOME
> > project for gtk+. Documentation can be automatically generated by
> > gtk-doc. I'd like to publish the documentation in github pages[1]. I'd
> > like you to add another repository to maintain the publish the
> > documentation.
> > 
> > You can see an actual example of documentation for libhinawa. The
> > documentation is available in URL of github.io, and published documents
> > are maintained in my remote repository[3].
> > 
> > But this is not a kind of urgent work. I'm OK that you make it enough
> > later ;)
> 
> I created the new docs repo:
> 
> https://github.com/alsa-project/alsa-gobject-docs
> 
> You should have the admin access for this repository, too.

Thanks for your addition of the above repository. I upload generated
documentation and it's available in URL below:

https://alsa-project.github.io/alsa-gobject-docs/

For alsa-gobject repository, I file two PRs for improvements:
 * https://github.com/alsa-project/alsa-gobject/pull/1
 * https://github.com/alsa-project/alsa-gobject/pull/2

I'm glad if you grant these requests and merge. Or would I
merge them by myself? I think that we have no concrete policy
to maintain the repository.


Regards

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
