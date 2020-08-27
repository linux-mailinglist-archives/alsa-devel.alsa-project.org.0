Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC612544F1
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Aug 2020 14:26:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0229F17E5;
	Thu, 27 Aug 2020 14:25:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0229F17E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598531208;
	bh=OM9p3KyXH00gdCIDmHPba2LdLatIUHQ1lNRqM/1UFcE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kI52RVlpkgzsHSJzDWgE6cFhsqMHDEdwdyvTgAMgBtoAF8xwCg2fDPUT3mPDa8p6k
	 hzpgsziL9qdf3gP47SF2xzVd1T3llObvlwoLFbk66XsILlSMKD+AmCH+JxOXKqP1dx
	 sX1gI3Qc5KGbtodbdQHIPMLzQVJm2LzE8q9WZPDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C461F801D9;
	Thu, 27 Aug 2020 14:25:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACF47F8016F; Thu, 27 Aug 2020 14:25:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AFABF800EB
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 14:24:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AFABF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ljW5AwOR"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="I3EaKJ2k"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id ECBF8FA1;
 Thu, 27 Aug 2020 08:24:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 27 Aug 2020 08:24:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=9lP0AHN9/JXyQakyhzFZ76scxaY
 lKfQHg07F1HIcjq0=; b=ljW5AwOR7mV2iksUx7d3DF6gUI3G3h0cAOOsEc025gr
 XSsPnPZMBM2E/qecywuI7iLwdn74KOlSmZwwNp2c4ivQBBjwbh+uvyNOQZ5Icc4E
 ZUZ50ZR+jZzeXE6ulM+eNhejG3LcpnfCSlkJZ0G04ftmY1m8NXB7AgyGruYDVKHf
 uypXxirWm365I3eYJ2/OJ+/fISCtNwutBcpkU8NX79pHCx68Mn+Vtt+LdZ0pqEq+
 TBkOMYEDlxipI8tfQdsIn3+8hZBPVX4TPCP4HCt6vZERSstpJ0+Zvy5BLS7hJooJ
 /kxsZcZe0o0EsSn/EshcyoXS+8XLmMPjwTb28Ep6/og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=9lP0AH
 N9/JXyQakyhzFZ76scxaYlKfQHg07F1HIcjq0=; b=I3EaKJ2kcZ0hHyEfWCE8f9
 7x/aV3SCRwirUIXmZ8sF54qYID6eeGHY5IbYfMPa8MMfFiXb49SIXkwQFvKeeNvf
 +MIyxUTiGnEv527ZZgVcVcoKHfoCrYpNjddrWPbKEMr8ntgWzP+90kTZ/CQb0n1i
 TJtXX+Vnsb5Q6UXJxAxjPzPc4a9g6bBX6J0MdsyKGENAz1KKNIqUIWVNBfPfxRC6
 MG12OMhGiGjjilcNd8E6DcjhP2LstA4Gq9kowbyUf1f1AnZGZsL2HtNSdC0f9Bnn
 TtE7CCksZMoTxZpMbypwZP+SnkzEhZDu+dKTWS39+lOk+N95V3zGxVEMFTRaaR6w
 ==
X-ME-Sender: <xms:DaZHX6YuooCkoMAMG5aLjYOhU0yOkqrUOFh0X7Us-Io6Jy7BypSDkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvgedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeetveeugfevgeduueffjeehffejleekhefgtdffheeh
 geduudetudduuedtteelfeenucffohhmrghinheptghonhhfihhguhhrvgdrrggtpdhmrg
 hkvghfihhlvgdrrghmpdhmvghsohhnsghuihhlugdrtghomhenucfkphepudektddrvdef
 hedrfedrheegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:DaZHX9Yc9bfY1VsH-C4fnjUfc7RMJ3yLFpDjdd-l66PaXISpn14eVw>
 <xmx:DaZHX0_j7atytIZ8YOGpW0PlQ00slUoGROOaqxtj8LLB1TnzwC4HJQ>
 <xmx:DaZHX8ouOkLAEVOl4GfQSFde3q5VzosmpRUruCksMWF8ONU9RiDdDQ>
 <xmx:DqZHX0R7kP22EWAq45QcvrgIEAgm1fkM85fxGMyBh89uE4c0Tj7-hQ>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id 88A6A30600A6;
 Thu, 27 Aug 2020 08:24:44 -0400 (EDT)
Date: Thu, 27 Aug 2020 21:24:42 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 00/25] alsa-tools: efw-downloader: add initial version of
 firmwre downloader for Echo Audio Fireworks devices
Message-ID: <20200827122442.GA394751@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, perex@perex.cz,
 alsa-devel@alsa-project.org, clemens@ladisch.de
References: <20200821073111.134857-1-o-takashi@sakamocchi.jp>
 <20200826093258.235615-1-o-takashi@sakamocchi.jp>
 <s5hy2m1skwm.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hy2m1skwm.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

Hi,

On Wed, Aug 26, 2020 at 01:31:53PM +0200, Takashi Iwai wrote:
> On Wed, 26 Aug 2020 11:32:58 +0200,
> Takashi Sakamoto wrote:
> > 
> > Hi,
> > 
> > Would I expect any reaction by maintainers of alsa-tools repository for
> > the patches?
> 
> I'm reviewing those patches now.
 
Thanks for your review.

> Since it's based on meson build, it'll be tricky to include this in
> alsa-tools whether others are all autoconf.  The tarball creation is
> done in the top directory and that assumes the execution of "make
> alsa-dist" in each subdirectory.  Without this integration, the
> directory won't be included in the release.
> 
> Could you work on it, too?

I didn't have enough care of distributing the package. Thank you for the
indication.

Although it's possible to write configure.ac/Makefile.am for
efw-downloader, I'd like to use meson.build for my convenience, especially
for the convenience of gnome module[1] in meson (Nowadays software in GNOME
project including GLib is mostly build by meson).

As long as I know, the concept of release creation in GNU Autotools is
different from the one in meson build system. GNU Autotools distributes
scripts generated from Makefile.am/configure.ac and so. On the other
hand, meson distributes files maintained by git or mercurial.

If we have a space to make enough arrangement for alsa-tools, the
top-level Makefile should be changed to have two variables for
subdirectories which includes software built by GNU Autotools and the
others, then be changed further for configure/install/alsa-dist/clean
targets.

Nevertheless, the idea to mix all of software built by several types of
build system into one repository is not so convenient itself. I'll take
more time to investigate further for better packaging of alsa-tools.
(Tools like Android repo is a bit over-engineering in the case, mmm)

I decline the patchset for now.


[1] https://mesonbuild.com/Gnome-module.html


Thanks

Takashi Sakamoto
