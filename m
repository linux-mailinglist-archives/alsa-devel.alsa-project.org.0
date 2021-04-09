Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD574359205
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 04:29:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 326761616;
	Fri,  9 Apr 2021 04:28:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 326761616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617935363;
	bh=gNYQwQfD7LXbSB2PIj7VTrZ4TFZ7YzFAAnorebYJ100=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BUb/dHJwzuAJvjg0UUt/sgdweKM8ZIV1uPEjQ1mE9/IryQNVQHcjc8w2bgmYb42+m
	 fvavrMSOMD7W6goqXstbvJGC2H0WgS+GPvVkufeITMjlrx0RgA5sdY57k7/21pSNDR
	 sOfWQOCYpxfGMHKKe2IsWVwSqsWujcHC1s26rGPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39002F80162;
	Fri,  9 Apr 2021 04:27:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85DF8F8016A; Fri,  9 Apr 2021 04:27:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC7F8F800EE
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 04:27:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC7F8F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="iSsxcto9"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="pB8VQNWy"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 7B4051601;
 Thu,  8 Apr 2021 22:27:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 08 Apr 2021 22:27:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=8vbP9fg45Dikek6xYfJbrwWHoJX
 A+AFmOtV9eomdihs=; b=iSsxcto91EeURMwfvV0Om79exm/+g2pQwG2D1f3MS6L
 cQjvb11NzT53Ms0tVTpRve7x36JEVHGu2w+N0aX7NkqADrCtkpdGmNiilDd046hW
 jxlUTqUDN/d+oePx4qUkgCsfjHzUnxn0uVDmGsJqfzvAD5YuJrP5Xa+OHmUtDNFQ
 AoYWBRP9pcaInUor5/4lxgYNpuoO8zs0fhWkPDSu1Yfj7PQ3mSHz58rQANv8PdSe
 ZJ9iIPFniVXK6O6R4wOyXg+Eo4+DPvqaisnaMI88dHsPgYJSOqK6Ko3Z8p+8xQrW
 fCgbXJOTIc9JtB7Bf2IRkNhVBeXyJcuQOXH+KtVoFoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=8vbP9f
 g45Dikek6xYfJbrwWHoJXA+AFmOtV9eomdihs=; b=pB8VQNWy6/78/f+d89+Fxo
 jGr5nei3S0K90qUDMWy2yTbhYKMLlGc4J8jx2occ11pMb2TCTbOdQXWQ+zWtdXKq
 DTErNgPp/ST+hfGXdECvNfT0kbEAdoG66mKq/tTgyfUsi7xFKsAq8t9x2VpIwPJt
 o8ZxBo80MvDGIKy/aQtftaNREaIesquPDzC1KcXyqSbfq8bFcNaJLRcBNf8D9XL1
 231xFSrztY1050aiAR2iI87vRBtK4OCiZZdV49UjJYhbE6sn3TjgOGkCyrXVifhX
 VdJQT0slqbBocEHvKtkE23gcenbYbc8J2dpvMEVGJAhKRZATGMdPxPwvqT2JmyHg
 ==
X-ME-Sender: <xms:m7tvYBS8sfYHGEL044ooZhYrCnaNSPeTMxs3fXKSqRpouhKbtG9cBQ>
 <xme:m7tvYKwoDbvZMnvH_T3fBMGold-goqk3Eb11_dfU1qaJs4Qvbu9hsbzekwxQhAeDm
 lbk5K3JtUVFANkQrYE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudektddgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefvrghkrghs
 hhhiucfurghkrghmohhtohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjh
 hpqeenucggtffrrghtthgvrhhnpeelhfeugedvjefgjefgudekfedutedvtddutdeuieev
 tddtgeetjeekvdefgeefhfenucfkphepudegrdefrdeihedrudejheenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqdhtrghkrghshhhisehs
 rghkrghmohgttghhihdrjhhp
X-ME-Proxy: <xmx:m7tvYG0xFRX8OTEmVqLIJKCo42eAXfuAEEL0OiraSuBT0TZyzFmzTQ>
 <xmx:m7tvYJBlzV9ZKZmggenAAx6JCI3IfuGfM9tGZopypiaKcZnac2-DaA>
 <xmx:m7tvYKhitxDB4NFH3QHeZYNfHcXOswdvBLFoTurUK28rVjnTzD4kew>
 <xmx:nLtvYAdFlW0PSCeispHt78iL_Nb1_89NgS0TNdsCHjp8-yki6Ff_UA>
Received: from workstation (ae065175.dynamic.ppp.asahi-net.or.jp [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 74D10108005C;
 Thu,  8 Apr 2021 22:27:38 -0400 (EDT)
Date: Fri, 9 Apr 2021 11:27:35 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v3] ALSA: control: Add memory consumption limit to user
 controls
Message-ID: <20210409022735.GA3776@workstation>
Mail-Followup-To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20210408103149.40357-1-o-takashi@sakamocchi.jp>
 <20210408105025.GB40407@workstation> <s5h1rbl80yy.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5h1rbl80yy.wl-tiwai@suse.de>
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

On Thu, Apr 08, 2021 at 01:33:41PM +0200, Takashi Iwai wrote:
> On Thu, 08 Apr 2021 12:50:25 +0200, Takashi Sakamoto wrote:
> > On Thu, Apr 08, 2021 at 07:31:49PM +0900, Takashi Sakamoto wrote:
> > > ALSA control interface allows users to add arbitrary control elements
> > > (called "user controls" or "user elements"), and its resource usage is
> > > limited just by the max number of control sets (currently 32).  This
> > > limit, however, is quite loose: each allocation of control set may
> > > have 1028 elements, and each element may have up to 512 bytes (ILP32) or
> > > 1024 bytes (LP64) of value data. Moreover, each control set may contain
> > > the enum strings and TLV data, which can be up to 64kB and 128kB,
> > > respectively.  Totally, the whole memory consumption may go over 38MB --
> > > it's quite large, and we'd rather like to reduce the size.
> > > 
> > > OTOH, there have been other requests even to increase the max number
> > > of user elements; e.g. ALSA firewire stack require the more user
> > > controls, hence we want to raise the bar, too.
> > > 
> > > For satisfying both requirements, this patch changes the management of
> > > user controls: instead of setting the upper limit of the number of
> > > user controls, we check the actual memory allocation size and set the
> > > upper limit of the total allocation in bytes.  As long as the memory
> > > consumption stays below the limit, more user controls are allowed than
> > > the current limit 32. At the same time, we set the lower limit (8MB)
> > > as default than the current theoretical limit, in order to lower the
> > > risk of DoS.
> > > 
> > > As a compromise for lowering the default limit, now the actual memory
> > > limit is defined as a module option, 'max_user_ctl_alloc_size', so that
> > > user can increase/decrease the limit if really needed, too.
> > > 
> > > Co-developed-by: Takashi Iwai <tiwai@suse.de>
> > > Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> > > Tested-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> > > Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> > > ---
> > > v1->v2: Drop alloc_size field from user_element, calculate at private_free
> > > v2->v3: Rebase. Fix boundary error. Obsolete macro usage relying on modern
> > >         compiler optimization. Change comment style by modern coding
> > >         convention. Rename module parameter so that users get it easily.
> > >         Patch comment improvements.
> > > ---
> > >  include/sound/core.h |  2 +-
> > >  sound/core/control.c | 75 ++++++++++++++++++++++++++++++--------------
> > >  2 files changed, 52 insertions(+), 25 deletions(-)
> > 
> > The original content of patch comes from Iwai-san[1]. I have no clear
> > idea to handle the case so add 'Co-developed-by' tag to the patch. If
> > this is not good, I apologize the lack of my understanding to the
> > development process in Linux kernel.
> 
> It depends.  In some cases, you just carry the patch with the original
> authorship (From address) and put your sign-off.  In some cases,
> Co-developed-by can be used.  I don't mind much either way, so I took
> your v3 patch now (with the addition of the Link URL to v2 patch).

Thanks for applying the patch as is. I would post it just with my sign-off
without no changes to your patch, However in the case I added some changes,
so I have no conviction to it...

Well, relevant to the function, I have some ideas to refactor ALSA control
core. If you have room to discuss about them, I'd like to ask your opinion.

At present, I have five ideas:

1. Split code relevant to user-defined element set into new module

Although the function is itself useful to me, it's useless in the case
to use driver in which every functions are in kernel land, especially in
embedded systems. The layering function introduced recently (and ctl ioctl
registration function) enables to capsulate it into module. This results
in building the function according to kernel configuration and reduction
of the size of snd.ko for embedded systems. (But I wish usual desktop
environment enables it...)

In my plan, the name of new module is snd_ctl_user_elem_set.ko and the
configuration is CONFIG_SND_CTL_USER_ELEM_SETS. I've already written
patchset in my hand and find some negative points:

 * Comparing environments in which the function is enable or disabled,
   we have difference about the system behaviour against some ioctl
   requests (ELEM_ADD, ELEM_REPLACE, ELEM_REMOVE). I have no idea to
   judge whether this is evil or not.
 * Some internal functions and tables in snd.ko should be expoted to the
   new module; e.g. 'value_sizes' or 'snd_ctl_new()'. The symbol table
   is increased.
 * Some code should be moved from compatibility layer of ALSA control
   core. This seems to increate the cost of maintenance for the layer.

2. Introduce control component structure and move codes from card structure

This is just an idea and preparation for following items. Historically,
ALSA card structure includes some control-related stuffs. The card has
two Linux device structures for pseudo card (card_dev) and control
cdev (ctl_dev).  The card also aggregates the list of the other
components such as pcm, hwdep. In this item, I add a new control
structure and split control related stuffs from card structure. As a
result, the control component becomes to be equivalent to the other
components, in a point of both relationship to pseudo card device and
relationship to cdev.

The change results in the reduction of size of card structure somehow. I
expect it to be friendly to memory object allocator, and to be clear
view of code structure.

At present, I don't prepare any patch. But I guess some negative
points:
 * I don't get the range of code influenced by the change yet. If it's
   huge, I would give up the idea itself...
 * Theoretically, the new control structure is released as the same way
   as the other components such as PCM. However I'm afraid of
   fatal regressions comes from structural problems in complicated release
   process of ALSA core...
 * Any change of behaviour relevant to kobject in a view of userspace.

3. Add kobject attributes into the control device

At present, card structure has kobject attributes. Some kernel APIs are
exposed to in-kernel drivers and some drivers already use it; e.g. the
series of line6 drivers.

In this item, referring to the idea of case for card structure, I add
kobject attributes into the control device, and add mechanism for
in-kernel drivers to register own attributes as well as common
attributes.

As you know, kobject attributes exposed via sysfs node is often abused,
like recent patch for any name of card structure. It should be done with
enough care of future change, since it's a part of interface to
userspace once exposed to userspace,

4. Add `max_user_ctl_alloc_size` kobject attribute to the control device

In the patch, a new module parameter 'max_user_ctl_alloc_size' is added.
In the item, I use the value of this parameter as initial value per
control device. The value per control device can be changed via sysfs
node.

The `max_user_ctl_alloc_size` is really the attribute of control device,
so I think it acceptable. Additionally, 'curr_user_ctl_alloc_size' is
also added so that userspace applications get current status.

5. add any mechanism to bind lifetime of user-defined element set to user
   process

At present, the lifetime of user-defined element set is bound to card
itself. However, it's convenient to user processes to bind the lifetime
to process itself. I add any mechanism for it.

For recent years I've made some patches in house but never arrive at the
best one. In the patches, I utilize access flags but in general the
maintenance of lifetime is not easy issue. I tackle again in this time.

Anyway, I'm a developer in private time, so it's my convenient to hear
maintainer's opinion, especially about 'go' or 'no-go', to use my life
time efficiently. I'm happy to receive any of your opinions.


Thanks

Takashi Sakamoto
