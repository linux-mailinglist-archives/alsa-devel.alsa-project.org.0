Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C34A13635DE
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Apr 2021 16:29:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A3801680;
	Sun, 18 Apr 2021 16:28:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A3801680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618756160;
	bh=wvBq/QrZo6Bz6dCaCer/SjcuNnCL6tQvboyBl06vDtU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=beoIUiDPlOSCXTWaG6JCOqGj9kLbEqmn5TKI6O7uxzV/bTi2WoiwUb7lt+udo+FvC
	 T9Dc1MI1K4sBR49yL0G4g0BAW1OU9i+iMzOaV2MKAg2KPomh4SRlWZ2urID29kNJ74
	 pIxYtaBvMZUdCbWPuIJqzjQTfjN6Kjyf69mwdVnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87A91F8013C;
	Sun, 18 Apr 2021 16:27:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88128F80253; Sun, 18 Apr 2021 16:27:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08FD1F80164
 for <alsa-devel@alsa-project.org>; Sun, 18 Apr 2021 16:27:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08FD1F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="K+SgYVW4"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="WvbD57rG"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BBD845C0729;
 Sun, 18 Apr 2021 10:27:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 18 Apr 2021 10:27:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=jVQlLO3DzEK76JfSMWMbw+MC6VD
 O7y+FijbSruZpdKk=; b=K+SgYVW4B/oSwUn5WOYmkVZ43hzochROku20TXcUu83
 WXROqj+C5clZsWqqG6cryIemJl3ibAiklSWBPZE3lSbAkn376NdaU4vgIeKRBQ/I
 SHjFYQN/1eayJKvzj6xJtpItFpIAHNwH4JIEua62xK2Yz2yavbvt65AMftcDXWEV
 BoO8UUAMQTeF3pHZ42f4iOPoOaypD8xxgbR6QcwNgi+o1PSyFIfhmHjwyZhB/fR3
 7uSEfYLcNhI2MGWK00cJIBvZTnEBNiEzpqIGq5dl5PgcZA5Xs8mRWjIX48tK0ceq
 hatqNSq9tnRZxTRFSoJwLYdxm2mCayK5cOspZdlnRwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jVQlLO
 3DzEK76JfSMWMbw+MC6VDO7y+FijbSruZpdKk=; b=WvbD57rGXguepw/Z2kIQy9
 Wic8GEyugGS9w82GZIWaQUeT1SvlBHwP9f0P9hen2V3EbgQGvMMNIa9/LC5Wl3S7
 cRWyKocxuuAa1Ncjqq3QzqmNKK/RbZ3ycG7DwVJBC5f2IKX1oza6KGtA5psQyrw9
 1y+8Q3h5wDn7mfJGZbVE+Dhsfi2f9aWP+8fL2T6saXIwMGWg9prb73KT8zJEdNlh
 kbbvR0zph+6zsuji1HLpiJFVKuboERyPTzvu1awPEiZ8SzX++iYt6/0Ti1Auj6Ab
 jvqYMhba3J5jjRoa8rUnT6enE6qGsXL9MGq+MNMI66jFeEQpcoS75lerRWxjU8zw
 ==
X-ME-Sender: <xms:2EF8YFLx0Jr4KYb0tnlqIJiK1fz2lpUcbl7u7kfzKl32QwThbGQaWg>
 <xme:2EF8YBKIVH9_Cjx_uZz2EQKf3c8F8DFSUk5_5vXnElFXtD89CSClVwtX9FHYxrxTQ
 F37vNHjG7TOFQCGO4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddttddgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucfkphepudegrdefrdeihedrudejheenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehs
 rghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:2EF8YNtzNi1_XWxhb5e0tmGg5c9LkWhVegkty8BJhM-7-Vmwv6sCMw>
 <xmx:2EF8YGaCDSmRUnm1LvRPvTuMs6zETSmKDb_vi_m1hXMR9MMksz-1GA>
 <xmx:2EF8YMbtM4Rc9t-OvcICdsQZ19kfNuyyf7cB0JzUDXQIHwb4QN-uyg>
 <xmx:2EF8YC3rxjLVILwwFoim6lDo5l9705ehFnxkcRMesbq4VG6fZiy12g>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 771B624005B;
 Sun, 18 Apr 2021 10:27:35 -0400 (EDT)
Date: Sun, 18 Apr 2021 23:27:32 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v3] ALSA: control: Add memory consumption limit to user
 controls
Message-ID: <20210418142732.GB36507@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20210408103149.40357-1-o-takashi@sakamocchi.jp>
 <20210408105025.GB40407@workstation> <s5h1rbl80yy.wl-tiwai@suse.de>
 <20210409022735.GA3776@workstation> <s5h5z0v67wh.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h5z0v67wh.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
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

Sorry to be late for catching up...

On Fri, Apr 09, 2021 at 12:59:10PM +0200, Takashi Iwai wrote:
> On Fri, 09 Apr 2021 04:27:35 +0200,
> Takashi Sakamoto wrote:
> > 
> > Hi,
> > 
> > On Thu, Apr 08, 2021 at 01:33:41PM +0200, Takashi Iwai wrote:
> > > On Thu, 08 Apr 2021 12:50:25 +0200, Takashi Sakamoto wrote:
> > > > On Thu, Apr 08, 2021 at 07:31:49PM +0900, Takashi Sakamoto wrote:
> > > > > ALSA control interface allows users to add arbitrary control elements
> > > > > (called "user controls" or "user elements"), and its resource usage is
> > > > > limited just by the max number of control sets (currently 32).  This
> > > > > limit, however, is quite loose: each allocation of control set may
> > > > > have 1028 elements, and each element may have up to 512 bytes (ILP32) or
> > > > > 1024 bytes (LP64) of value data. Moreover, each control set may contain
> > > > > the enum strings and TLV data, which can be up to 64kB and 128kB,
> > > > > respectively.  Totally, the whole memory consumption may go over 38MB --
> > > > > it's quite large, and we'd rather like to reduce the size.
> > > > > 
> > > > > OTOH, there have been other requests even to increase the max number
> > > > > of user elements; e.g. ALSA firewire stack require the more user
> > > > > controls, hence we want to raise the bar, too.
> > > > > 
> > > > > For satisfying both requirements, this patch changes the management of
> > > > > user controls: instead of setting the upper limit of the number of
> > > > > user controls, we check the actual memory allocation size and set the
> > > > > upper limit of the total allocation in bytes.  As long as the memory
> > > > > consumption stays below the limit, more user controls are allowed than
> > > > > the current limit 32. At the same time, we set the lower limit (8MB)
> > > > > as default than the current theoretical limit, in order to lower the
> > > > > risk of DoS.
> > > > > 
> > > > > As a compromise for lowering the default limit, now the actual memory
> > > > > limit is defined as a module option, 'max_user_ctl_alloc_size', so that
> > > > > user can increase/decrease the limit if really needed, too.
> > > > > 
> > > > > Co-developed-by: Takashi Iwai <tiwai@suse.de>
> > > > > Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> > > > > Tested-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> > > > > Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> > > > > ---
> > > > > v1->v2: Drop alloc_size field from user_element, calculate at private_free
> > > > > v2->v3: Rebase. Fix boundary error. Obsolete macro usage relying on modern
> > > > >         compiler optimization. Change comment style by modern coding
> > > > >         convention. Rename module parameter so that users get it easily.
> > > > >         Patch comment improvements.
> > > > > ---
> > > > >  include/sound/core.h |  2 +-
> > > > >  sound/core/control.c | 75 ++++++++++++++++++++++++++++++--------------
> > > > >  2 files changed, 52 insertions(+), 25 deletions(-)
> > > > 
> > > > The original content of patch comes from Iwai-san[1]. I have no clear
> > > > idea to handle the case so add 'Co-developed-by' tag to the patch. If
> > > > this is not good, I apologize the lack of my understanding to the
> > > > development process in Linux kernel.
> > > 
> > > It depends.  In some cases, you just carry the patch with the original
> > > authorship (From address) and put your sign-off.  In some cases,
> > > Co-developed-by can be used.  I don't mind much either way, so I took
> > > your v3 patch now (with the addition of the Link URL to v2 patch).
> > 
> > Thanks for applying the patch as is. I would post it just with my sign-off
> > without no changes to your patch, However in the case I added some changes,
> > so I have no conviction to it...
> > 
> > Well, relevant to the function, I have some ideas to refactor ALSA control
> > core. If you have room to discuss about them, I'd like to ask your opinion.
> > 
> > At present, I have five ideas:
> > 
> > 1. Split code relevant to user-defined element set into new module
> > 
> > Although the function is itself useful to me, it's useless in the case
> > to use driver in which every functions are in kernel land, especially in
> > embedded systems. The layering function introduced recently (and ctl ioctl
> > registration function) enables to capsulate it into module. This results
> > in building the function according to kernel configuration and reduction
> > of the size of snd.ko for embedded systems. (But I wish usual desktop
> > environment enables it...)
> > 
> > In my plan, the name of new module is snd_ctl_user_elem_set.ko and the
> > configuration is CONFIG_SND_CTL_USER_ELEM_SETS. I've already written
> > patchset in my hand and find some negative points:
> > 
> >  * Comparing environments in which the function is enable or disabled,
> >    we have difference about the system behaviour against some ioctl
> >    requests (ELEM_ADD, ELEM_REPLACE, ELEM_REMOVE). I have no idea to
> >    judge whether this is evil or not.
> >  * Some internal functions and tables in snd.ko should be expoted to the
> >    new module; e.g. 'value_sizes' or 'snd_ctl_new()'. The symbol table
> >    is increased.
> >  * Some code should be moved from compatibility layer of ALSA control
> >    core. This seems to increate the cost of maintenance for the layer.
> 
> The module would be useful if this can work additionally on top of the
> others.  And, in the case of user-element, it has nothing to do with
> the driver, so if the module is split, user would have to load the
> module manually -- which is inconvenient.
> 
> If your concern is about the driver size, the needed change isn't
> about splitting to another module but the conditional builds either
> with ifdef or factor out to another file (and conditionally build via
> Makefile).
 
In a point of driver side, we have some solution. Usage of
'request_module()', as control-led layer does. Or exported symbol from
the module takes userspace kernel module loader to work expectedly
according to module dependency graph, as long as device driver refers to
it.

Nevertheless, in a point of userspace application side, we seems to have
no good way in non-privilege process. In this point, I agree with the
inconvenience about which you mentioned.

The point is which stuff is dominant to determine usage of the function,
in my opinion. In the case of ALSA firewire stack (or HDA driver for
some platforms), it's driver side. In the case of softvol plugin in
alsa-lib, it's usrspace side. When standing on the former, modular
function is enough convenient. On the other hand, for the latter,
it's not necessarily convenient.

> > 2. Introduce control component structure and move codes from card structure
> > 
> > This is just an idea and preparation for following items. Historically,
> > ALSA card structure includes some control-related stuffs. The card has
> > two Linux device structures for pseudo card (card_dev) and control
> > cdev (ctl_dev).  The card also aggregates the list of the other
> > components such as pcm, hwdep. In this item, I add a new control
> > structure and split control related stuffs from card structure. As a
> > result, the control component becomes to be equivalent to the other
> > components, in a point of both relationship to pseudo card device and
> > relationship to cdev.
> > 
> > The change results in the reduction of size of card structure somehow. I
> > expect it to be friendly to memory object allocator, and to be clear
> > view of code structure.
> 
> Well, moving the control-related fields into another allocated object
> wouldn't reduce the size in total, so I don't see any big merit by
> that.  Note that the control API is mandatory for each card, hence it
> can be never optional; that's the difference from other components.
> 
> Though, moving control-related fields into another struct and embed it
> in snd_card would be fine if it improves the readability.  It'll be
> essentially just grouping and renaming.

The readability is certainly improved by grouping and renaming. But in a
point of actual memory consumption in slab allocation, I can find another
merit in scenario to split structures, since larger structure brings
larger unused space in object according to cache size of slab
allocation, in theory.

In system V ABI for LP64, the size of 'struct snd_card' is 2248 bytes as
maximum, then 4k object is used for it. When splitting into structures,
we can reduce the unused space. As long as I calculated, the issued
control structure reduces the size of card structure up to 1400 bytes,
and its size is 864 bytes (including pointer to card and member for
devices list), then 2k and 1k objects are used. Rough calculation brings
1k free memory between these cases (for simplicity I omit administration
space).

As you note, control component is not optional for card. However,
control component is actually maintained as device component. As current
card implementation maintains each component successfully, it's worth to
investigate putting control-related members from card to unique
structure behind private data of component. Additionally, when integrating
control functionality, it's convenient to me that relevant stuffs are
capsulated apart from card structure. In short, I'd like 'divide and
conquer' method in code refactoring.


Thanks

Takashi Sakamoto
