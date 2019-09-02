Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D2DA51D4
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 10:36:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3BEB169C;
	Mon,  2 Sep 2019 10:35:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3BEB169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567413378;
	bh=uO+oA0eTvaXwW7S1voF2iwIS1MWvIdM5H1Uyk7ePp80=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hBfYBe+ary8AsiuyuHDy3yArFh6x9m7Na5cw3m2G+58oEbHvLSJaAktZXXZWFVqC2
	 R/pRea94Wk0zhWkhD+SMYK65woZa90rgWIFRU0ATdb/pmbrryfcMJZsufr0YxmirVM
	 b6Mkri/Ixjks5ycdiwqpv/TeeSGc2baV10rHYU4w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 398EAF803D0;
	Mon,  2 Sep 2019 10:34:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB6CAF803D0; Mon,  2 Sep 2019 10:34:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 984C4F802E0
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 10:34:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 984C4F802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="EU0ACbEH"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="uDQx1bIc"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 7C8FA21E97;
 Mon,  2 Sep 2019 04:34:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 02 Sep 2019 04:34:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=hMX0v7CVKYm4kqWEV/5zzQLKbi7
 6ItOnSoow9qKgaMA=; b=EU0ACbEHdb4vy1KVDI47ff3Q+7n+IuOrLXYx7hpNr99
 k65FClt1YVal3bcGmWXNjX+nqF5YsuQRpbxxp/QMkCHR4Pz9t6hAq8Ck7V9qTXBK
 PgGcM8X0B2+DLOahZHq+7kCKZ4LwbBpOw6IY3xGd39mb511RqlvgdhZVxDh1KDRV
 y/yp1Tf0FDqexJ8klWnz2EhFj4Di1mbZz9M6WHShHhYt4XWMI4Nctya9Bzd25h22
 78DeUl4iY02kEQJ08oaDO7VAAuxhxKrDAJANm8igF9/a2e4qsGtQAmY3nXRgxfQK
 zy45DqsY3lEHgRo47Mb91XxgNolD9ZI7E7/K1yIkAhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=hMX0v7
 CVKYm4kqWEV/5zzQLKbi76ItOnSoow9qKgaMA=; b=uDQx1bIc9jLTQVHqo9w/iI
 AZwn/Yu9Q+mIGCynEzM3cyre5Ax7AXkQ5rNI3YMOu1s63ZrMecGWNoW81UJ6Uny0
 4KCLRWapBo5hD5V4zaBdTO0ZzR41pu4ObgLJAz0RJ3+krwl6AFFwuF4h3XMXASfS
 SLEbJW7uF9SdSqRg2QGrA3ZZOsx2EZ3eeNJgavjZ+bu+VcfcIZMTd56Qg3Wj3n7g
 ntNFG7woqPqRDOU2m9zMPeDnCXssFy0Pcb4XBw8iNEsFcluocbhkMfc1bgwu9FqH
 VSMhLoCOIJnJtSDtBjTdAWtu7mRHhMOxuF/eCwCxikIZXM6fq2nmfOmmaxVk0wKg
 ==
X-ME-Sender: <xms:DdRsXdxEDnRDkeGVpEmsKuwtPRPDTlMSKHmyzwGj-W87BfP0eFjrRA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejtddgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesthdtredttdervdenucfhrhhomhepvfgrkhgr
 shhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhird
 hjpheqnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepudegrdefrdejhedr
 udekudenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmh
 hotggthhhirdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:DdRsXZnma0Cuao4jLQWnXvqn4nJNAA7ZadOPmowzV9vCYaVSdITycA>
 <xmx:DdRsXaGuKbFSXbqWEsh9k_hXTpNCgiiis6JUAnsPiFmIOYrys-Bepw>
 <xmx:DdRsXRWgo1RK_IWUlqa5jZ0zs5MnA6xZNkzjKKL5_Thaou9DVF2cyg>
 <xmx:DtRsXcB7l1PPWjV1Rsx97xSXelYPDucE5U2q0MU2L6Py1kFBT4esjg>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id E8F408005B;
 Mon,  2 Sep 2019 04:34:19 -0400 (EDT)
Date: Mon, 2 Sep 2019 17:34:17 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190902083416.GA14883@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, clemens@ladisch.de,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20190830132446.5154-1-o-takashi@sakamocchi.jp>
 <s5h4l1xl5im.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5h4l1xl5im.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH] MAINTAINERS: update entry of firewire
	audio drivers
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

On Sat, Aug 31, 2019 at 05:27:13PM +0200, Takashi Iwai wrote:
> On Fri, 30 Aug 2019 15:24:46 +0200,
> Takashi Sakamoto wrote:
> > 
> > This commit adds myself as one of maintainers for firewire audio
> > drivers and IEC 61883-1/6 packet streaming engine. I call them ALSA
> > firewire stack as a whole.
> > 
> > 6 years ago I joined in development for this category of drivers with
> > heavy reverse-engineering tasks and over 100 models are now available
> > from ALSA applications. IEEE 1394 bus itself and units on the bus are
> > enough legacy but the development still continues.
> > 
> > I have a plan to add drastic enhancement in kernel v5.5 and v5.6 period.
> > This commit adds myself into MAINTAINERS so that developers and users
> > can easily find active developer to post their issues, especially for
> > regression.
> > 
> > Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> 
> Applied now (with a typo correction -- a superfluous '+' was added).
> Thanks.
> 
> 
> Takashi
 
Oops, thanks for your care to my typo...

> > ---
> >  MAINTAINERS | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 24e29b2e53c9..8929a2ec75f7 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6264,8 +6264,9 @@ S:	Maintained
> >  F:	drivers/hwmon/f75375s.c
> >  F:	include/linux/f75375s.h
> >  
> > -FIREWIRE AUDIO DRIVERS
> > +FIREWIRE AUDIO DRIVERS and IEC 61883-1/6 PACKET STREAMING ENGINE
> >  M:	Clemens Ladisch <clemens@ladisch.de>
> > ++M:	Takashi Sakamoto <o-takashi@sakamocchi.jp>
> >  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
> >  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
> >  S:	Maintained
> > -- 
> > 2.20.1
> > 


Regards

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
