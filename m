Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CE6254A25
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Aug 2020 18:04:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F57B17FA;
	Thu, 27 Aug 2020 18:03:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F57B17FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598544258;
	bh=InPYkJCYrJmhxVP5EEX97exZUhUoEm1oaubW+hf9FXQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i1NkG5czUFjK0+c5khiAyUtdSgJ95z7Cb1k0AbvgsOR6g4bQQ6fzcvp3DAkEc2u7Z
	 EEkf1h/mF+VOlWhvw6ZHvWJppmD+LVsmR+ZcK8Ka0ITsI1YlKNjlVoTQyE78/P/6J8
	 3sYg+GYMsmTO05PsZMS6SK86XK3TuvB2GDiTO1nY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66D75F80105;
	Thu, 27 Aug 2020 18:02:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6324BF8016F; Thu, 27 Aug 2020 18:02:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76849F80105
 for <alsa-devel@alsa-project.org>; Thu, 27 Aug 2020 18:02:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76849F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ZRKGZZ80"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="IjZUgF5n"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id EC9332C3;
 Thu, 27 Aug 2020 12:02:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 27 Aug 2020 12:02:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=2vB6ju1ym1dHSPU1ht3atJagQzK
 6jUIZ6b0A1Vu2fHo=; b=ZRKGZZ80QB9g3OYnfo6DVPu7r/Mt4LSQ1yIZzZ63sFW
 t9PkHfESgfKrPB8NwWSigBaCLs5R91EgGZmHprj6iZarESlF//Oz9sV9dyduB6nB
 B8sSCC2lg6d+RCDG0gVHkzNtk27mxH3mnK5FzTlfAft8zK0U7d+Yk/FfLpnLMTQZ
 hcvs0hSV/GTbnoIbSCc15G2/QwFQPMpZpaKcwPzU0mnaX9eiRJtqVgHI/7C9/fNa
 dF3ZvHbJw13phRsLOtFQFC8qDNQjCJb//XlSqG6wZOXVtmmF+RrAI8qDM6DTdJuR
 6IWpRFjYyJlTGD8EHf4oj5KRt8BLo3txuGHjdSA8DvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=2vB6ju
 1ym1dHSPU1ht3atJagQzK6jUIZ6b0A1Vu2fHo=; b=IjZUgF5nr90SDk4jA9RfX2
 PywB2qwKrPbsMD/wvHf6VA2rH436QeV83+avatYrBKPjR4Y+OJf0OZ+NzA7jJzkG
 kmJtyEDC84ja83v7MaXaTlVFvul7USjYj98F0zz+PPXUjK/IYWgmF/KmDHICONAt
 eaWheV2lr52gCctnMhJPwE57qxJLhQLbR0qMukGEGrdOm33a9gnYzmfi8uL/JBtB
 Od9r0AhYrndOxRXlBwMHCex6haaqkELKaNKnv/nGdlTOgAWPBwvi2cTCWUA5s+dU
 ehOn31uLd/rpdzlRj1KvIQevT5WklX8pknyFziYgGIiM43Cp1G77k++ERiPlVhKQ
 ==
X-ME-Sender: <xms:B9lHX4lrl4jZBkuY0sDZoOVcP7WT4UXIWZRu8rTEuliLE9M68VKXig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvgedgledvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpedujeeugfekudejleetieduledufeeffefhkedtffel
 jedtueelfeffheeftedugeenucffohhmrghinheptghonhhfihhguhhrvgdrrggtpdhmrg
 hkvghfihhlvgdrrghmpdguvggsihgrnhdrohhrghenucfkphepudektddrvdefhedrfedr
 heegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepoh
 dqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:CNlHX337V2sZRKsQQjt3X4aw4onBPuVF21PMDAtIkAo5wuw4MARsMQ>
 <xmx:CNlHX2q6BPVduevROLaz6C4QhwQFPDKmRyhMBJOFvHJzth7IR1YVfA>
 <xmx:CNlHX0kHGp032I0C2I1m1Deej79cA6ch8AGhyhxEyGacOEMgo5FX6g>
 <xmx:CdlHX7_6AnXSIVF-OHzqaaagRmu3Ock14H9-kh16QrluBVDp-_4l6g>
Received: from workstation (ad003054.dynamic.ppp.asahi-net.or.jp
 [180.235.3.54])
 by mail.messagingengine.com (Postfix) with ESMTPA id E6C3B3280059;
 Thu, 27 Aug 2020 12:02:14 -0400 (EDT)
Date: Fri, 28 Aug 2020 01:02:12 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 00/25] alsa-tools: efw-downloader: add initial version of
 firmwre downloader for Echo Audio Fireworks devices
Message-ID: <20200827160212.GA406268@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, perex@perex.cz,
 alsa-devel@alsa-project.org, clemens@ladisch.de
References: <20200821073111.134857-1-o-takashi@sakamocchi.jp>
 <20200826093258.235615-1-o-takashi@sakamocchi.jp>
 <s5hy2m1skwm.wl-tiwai@suse.de>
 <20200827122442.GA394751@workstation>
 <s5hd03cp7q7.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hd03cp7q7.wl-tiwai@suse.de>
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

On Thu, Aug 27, 2020 at 02:57:04PM +0200, Takashi Iwai wrote:
> On Thu, 27 Aug 2020 14:24:42 +0200, Takashi Sakamoto wrote:
> > On Wed, Aug 26, 2020 at 01:31:53PM +0200, Takashi Iwai wrote:
> > > Since it's based on meson build, it'll be tricky to include this in
> > > alsa-tools whether others are all autoconf.  The tarball creation is
> > > done in the top directory and that assumes the execution of "make
> > > alsa-dist" in each subdirectory.  Without this integration, the
> > > directory won't be included in the release.
> > > 
> > > Could you work on it, too?
> > 
> > I didn't have enough care of distributing the package. Thank you for the
> > indication.
> > 
> > Although it's possible to write configure.ac/Makefile.am for
> > efw-downloader, I'd like to use meson.build for my convenience, especially
> > for the convenience of gnome module[1] in meson (Nowadays software in GNOME
> > project including GLib is mostly build by meson).
> > 
> > As long as I know, the concept of release creation in GNU Autotools is
> > different from the one in meson build system. GNU Autotools distributes
> > scripts generated from Makefile.am/configure.ac and so. On the other
> > hand, meson distributes files maintained by git or mercurial.
> > 
> > If we have a space to make enough arrangement for alsa-tools, the
> > top-level Makefile should be changed to have two variables for
> > subdirectories which includes software built by GNU Autotools and the
> > others, then be changed further for configure/install/alsa-dist/clean
> > targets.
> > 
> > Nevertheless, the idea to mix all of software built by several types of
> > build system into one repository is not so convenient itself. I'll take
> > more time to investigate further for better packaging of alsa-tools.
> > (Tools like Android repo is a bit over-engineering in the case, mmm)
> > 
> > I decline the patchset for now.
> 
> OK.  It's indeed awkward to mix up both auto-tools and meson.
> So the more suitable option would be either to modernize everything
> with meson, or just create a configure.ac for efw-downloader.
> Maybe the latter is easier, as the dependency would be only about
> hinawa and the check via pkgconfig is trivial even with automake.
> But, obviously, modernization is more appealing (with a risk of
> breakage, as always :)

The modernization is itself preferrable, but the idea of everything with
meson is not better since we have several build systems in the world. In
my opinion, the preferrable way is to enable developers to add software
without limitations about its build system and dependency.

As a quick glance, below applications have dependency to Gtk+2 or Gtk+3.
For them, replacement with meson build system is reasonable:

* echomixer
* envy24control
* hdajackretask
* rmedigicontrol

As you know, Gtk+2 is already obsoleted, thus the above should be ported to
Gtk4[1].

Qlo10k1 is only an application of Qt3. I guess CMake is more preferrable
than GNU Autotools in the case. As well as Gtk+2, Gt3 is already
obsoleted.

Hwmixvolume is written by Python 3, thus it's better to follow the
standard way in Python world (setup.py).

For the other software, it doesn't matter still to use GNU autotools.

However, ld10k1 includes tools (ld10k1/lo10k1/dl10k1) seem to depend on
local library (liblo10k1) but Makefile seems not to describe the dependency
appropriately.

At present, I have no proposal for the issue, but it's possible to
split the software into several repositories depending on build system,
like:

 * alsa-tools-meson
 * alsa-tools-cmake
 * alsa-tools-python
 * alsa-tools-autotools

Then put release script to alsa-tools repository with git-submodules for them.


[1] Debian Bug report logs - #967250
alsa-tools: depends on deprecated GTK 2
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=967250


Regards

Takashi Sakamoto
