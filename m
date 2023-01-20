Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AECD674954
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 03:25:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E4772AAF;
	Fri, 20 Jan 2023 03:24:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E4772AAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674181547;
	bh=3GsIyYQdsjwr0hN6WfKBIrPC3gTA8HbIZYkjYyYEpyc=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pC4JGUaRqLEUrMDU355fRy/13cALzJ7jR1N51ubD9HtOlKI87PmAa1XDpUdVhKzEj
	 Q0qZW/sv/Uk2AIAQ3jjpCS4sFgGv721wV7NkMyZIlSEGx21HvV1HAddfRk52KkEhd1
	 VSV9W/DcfR9DMUlj9T0ShCATbETyqY4hK8yHnPAk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34AE1F804DE;
	Fri, 20 Jan 2023 03:24:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 886B4F8047B; Fri, 20 Jan 2023 03:24:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8930FF800F0
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 03:24:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8930FF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com
 header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3
 header.b=iyY6Eys1; dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=JW70Vdau
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 1AC535C0074;
 Thu, 19 Jan 2023 21:24:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 19 Jan 2023 21:24:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1674181475; x=
 1674267875; bh=uT4kLza8RlIsxn5amzQpafEHIu72ROvuvN7Ka1p3Neo=; b=i
 yY6Eys1rrIBe4qah9SQ6BQ3zwqqtPX2N1XTGpHmYRNKrNb7T/rG+y7wUHPRRfUbd
 CSUcNnWybtT1Dc5Tmth0k5R5GBR3SGaRKSUDTN2UMzJCt7Q/u8poy/lezudYUO+g
 FWYhCrCxL5tNbD/6e+bisq1N8Pn7vb7JuQ9yF71hCf3RfO3VY4a7rQL7odr7XegD
 TTS9gA5pxceUjrDLiTBt/epdeoZmgse1KfKrEIGNPWbRSD64iEAN1LQ/wPvxRRCi
 bhQ5RNt6ztt3TBpBvcJP94YNqOT8skwIW+fi4VM34CdUTgmezSdwrEjtq46ZXJjZ
 6WJj1jl6bhlNycQwQParg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674181475; x=1674267875; bh=uT4kLza8RlIsxn5amzQpafEHIu72
 ROvuvN7Ka1p3Neo=; b=JW70VdauCDdyldhnsBinXCnlajza+p2y2nqdfsXhH1iz
 ZzI5xeXupL5/qDM5kWMmO7mqOOozmRR9pGPQx8iuBlCn4uT4s5BrHy8avUlwlCOu
 EYd/QVqDt3swXTqiWej3U2Y59BzrA632uDKFO52CX2fl4cwBFR1vx3MzBo9J3st9
 VgUqxlpDzPI0FC/dE7YvOsf7+c1E+/p0x4CtOi4Pa6OhW2yzcuXNo123gya03NSt
 9EZZsZ/ZgDF3KbnnpKPkh5sgkmx3EcjxZ8BI9mJRWqsAU1ELOlgsT44yI+hZU9SQ
 +UcqRDEdZBvkQQlzyUfSjzc0qAUqRNG7uW9dpL0WFg==
X-ME-Sender: <xms:YvvJY_xOWHXE8PFrahSmLwFAIVaeezCwWzDeiMuhPpSp5aCXoEc3vw>
 <xme:YvvJY3Ql1u1Dp1jmNGSjwuef6dOEX_MvRwD78X1R534m19OB767AxsyiMCu91PV8n
 CKnDXb1T8c-6Q>
X-ME-Received: <xmr:YvvJY5WCJMDBMMY9kDFRzylmcc0PrjRamBiiuBZA33lt5bH8qaFMD4rG6WG08rbzWwx23-BZO_CaIy4jydLN1iaxRmsfpwBjYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduuddggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieel
 uddvkeejueekhfffteegfeeiffefjeejvdeijedvgfejheetuddvkeffudeinecuffhomh
 grihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
 hlrggsrdgtohhm
X-ME-Proxy: <xmx:YvvJY5jjHHmzvusfftIC1qJ0zVhr8KJsWhli8suv8c9o0z5HBNJAyQ>
 <xmx:YvvJYxA8K2KNH-COd-jvUq2SeuMySXCoO1Oj9HT4SNJfGGqQmyZJBQ>
 <xmx:YvvJYyKPBWS5av6xFqJpjly-snI5pw-FMudndzzFXLgLN5EK5Yxefw>
 <xmx:Y_vJY0O7-9xj7KqZp4f2ZXRxH1PxJqsEIt5WAsWw91t-nkjOrgOrig>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jan 2023 21:24:33 -0500 (EST)
Date: Fri, 20 Jan 2023 03:24:30 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17
Message-ID: <Y8n7XkbM0aIEshlX@mail-itl>
References: <Y8aIPPcPuDeNkVEy@mail-itl> <Y8au5JiQ3w1YPZ8d@mail-itl>
 <87tu0p6xix.wl-tiwai@suse.de> <Y8bRmWMBVFVk0WZc@mail-itl>
 <874jsp6r3q.wl-tiwai@suse.de> <Y8cGVGCWjODvMXUe@mail-itl>
 <87sfg85ic1.wl-tiwai@suse.de> <Y8fMVtWshr+yFLWk@mail-itl>
 <87fsc8t3s3.wl-tiwai@suse.de> <Y8nqIBJISq9Vm710@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DZT1vfsoSyjwyXKB"
Content-Disposition: inline
In-Reply-To: <Y8nqIBJISq9Vm710@mail-itl>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Harald Arnesen <harald@skogtun.org>,
 Alex Xu <alex_y_xu@yahoo.ca>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--DZT1vfsoSyjwyXKB
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Jan 2023 03:24:30 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Alex Xu <alex_y_xu@yahoo.ca>,
	Harald Arnesen <harald@skogtun.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17

On Fri, Jan 20, 2023 at 02:10:37AM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Wed, Jan 18, 2023 at 01:39:56PM +0100, Takashi Iwai wrote:
> > On Wed, 18 Jan 2023 11:39:18 +0100,
> > Marek Marczykowski-G=C3=B3recki wrote:
> > >=20
> > > On Wed, Jan 18, 2023 at 09:59:26AM +0100, Takashi Iwai wrote:
> > > > On Tue, 17 Jan 2023 21:34:11 +0100,
> > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > >=20
> > > > > On Tue, Jan 17, 2023 at 05:52:25PM +0100, Takashi Iwai wrote:
> > > > > > On Tue, 17 Jan 2023 17:49:28 +0100,
> > > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > >=20
> > > > > > > On Tue, Jan 17, 2023 at 03:33:42PM +0100, Takashi Iwai wrote:
> > > > > > > > On Tue, 17 Jan 2023 15:21:23 +0100,
> > > > > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > >=20
> > > > > > > > > On Tue, Jan 17, 2023 at 12:36:28PM +0100, Marek Marczykow=
ski-G=C3=B3recki wrote:
> > > > > > > > > > On Tue, Jan 17, 2023 at 08:58:57AM +0100, Takashi Iwai =
wrote:
> > > > > > > > > > > On Mon, 16 Jan 2023 16:55:11 +0100,
> > > > > > > > > > > Takashi Iwai wrote:
> > > > > > > > > > > >=20
> > > > > > > > > > > > On Tue, 27 Dec 2022 16:26:54 +0100,
> > > > > > > > > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > On Thu, Dec 22, 2022 at 09:09:15AM +0100, Takashi=
 Iwai wrote:
> > > > > > > > > > > > > > On Sat, 10 Dec 2022 17:17:42 +0100,
> > > > > > > > > > > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > On Sat, Dec 10, 2022 at 02:00:06AM +0100, Mar=
ek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > > > > > > > > > On Fri, Dec 09, 2022 at 01:40:15PM +0100, M=
arek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > > > > > > > > > > On Fri, Dec 09, 2022 at 09:10:19AM +0100,=
 Takashi Iwai wrote:
> > > > > > > > > > > > > > > > > > On Fri, 09 Dec 2022 02:27:30 +0100,
> > > > > > > > > > > > > > > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > > > Under Xen PV dom0, with Linux >=3D 5.=
17, sound stops working after few
> > > > > > > > > > > > > > > > > > > hours. pavucontrol still shows meter =
bars moving, but the speakers
> > > > > > > > > > > > > > > > > > > remain silent. At least on some occas=
ions I see the following message in
> > > > > > > > > > > > > > > > > > > dmesg:
> > > > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > > >   [ 2142.484553] snd_hda_intel 0000:0=
0:1f.3: Unstable LPIB (18144 >=3D 6396); disabling LPIB delay counting
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > Hit the issue again, this message did not a=
ppear in the log (or at least
> > > > > > > > > > > > > > > > not yet).
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > (...)
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > > In anyway, please check the behavior wi=
th 6.1-rc8 + the commit
> > > > > > > > > > > > > > > > > > cc26516374065a34e10c9a8bf3e940e42cd96e2a
> > > > > > > > > > > > > > > > > >     ALSA: memalloc: Allocate more conti=
guous pages for fallback case
> > > > > > > > > > > > > > > > > > from for-next of my sound git tree (whi=
ch will be in 6.2-rc1).
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > This did not helped.
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > Looking at the mentioned commits, there i=
s one specific aspect of Xen PV
> > > > > > > > > > > > > > > > > that may be relevant. It configures PAT d=
ifferently than native Linux.
> > > > > > > > > > > > > > > > > Theoretically Linux adapts automatically =
and using proper API (like
> > > > > > > > > > > > > > > > > set_memory_wc()) should just work, but at=
 least for i915 driver it
> > > > > > > > > > > > > > > > > causes issues (not fully tracked down yet=
). Details about that bug
> > > > > > > > > > > > > > > > > report include some more background:
> > > > > > > > > > > > > > > > > https://lore.kernel.org/intel-gfx/Y5Hst0b=
CxQDTN7lK@mail-itl/
> > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > Anyway, I have tested it on a Xen modifie=
d to setup PAT the same way as
> > > > > > > > > > > > > > > > > native Linux and the audio issue is still=
 there.
> > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > > If the problem persists, another thing =
to check is the hack below
> > > > > > > > > > > > > > > > > > works.
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > Trying this one now.
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > And this one didn't either :/
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > (Sorry for the late reply, as I've been off in =
the last weeks.)
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > I think the hack doesn't influence on the PCM b=
uffer pages, but only
> > > > > > > > > > > > > > about BDL pages.  Could you check the patch bel=
ow instead?
> > > > > > > > > > > > > > It'll disable the SG-buffer handling on x86 com=
pletely.=20
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > This seems to "fix" the issue, thanks!
> > > > > > > > > > > > > I guess I'll run it this way for now, but a prope=
r solution would be
> > > > > > > > > > > > > nice. Let me know if I can collect any more info =
that would help with
> > > > > > > > > > > > > that.
> > > > > > > > > > > >=20
> > > > > > > > > > > > Then we seem to go back again with the coherent mem=
ory allocation for
> > > > > > > > > > > > the fallback sg cases.  It was changed because the =
use of
> > > > > > > > > > > > dma_alloc_coherent() caused a problem with IOMMU ca=
se for retrieving
> > > > > > > > > > > > the page addresses, but since the commit 9736a32513=
7b, we essentially
> > > > > > > > > > > > avoid the fallback when IOMMU is used, so it should=
 be fine again.
> > > > > > > > > > > >=20
> > > > > > > > > > > > Let me know if the patch like below works for you i=
nstead of the
> > > > > > > > > > > > previous hack to disable SG-buffer (note: totally u=
ntested!)
> > > > > > > > > > >=20
> > > > > > > > > > > Gah, there was an obvious typo, scratch that.
> > > > > > > > > > >=20
> > > > > > > > > > > Below is a proper patch.  Please try this one instead.
> > > > > > > > > >=20
> > > > > > > > > > Thanks, I'll give it a try.
> > > > > > > > >=20
> > > > > > > > > Unfortunately, it doesn't help, it stopped working again,=
 after about 3h
> > > > > > > > > uptime.
> > > > > > > >=20
> > > > > > > > Aha, then it might be rather other way round;
> > > > > > > > dma_alloc_noncontiguous() doesn't work on Xen properly.
> > > > > > > >=20
> > > > > > > > Could you try the one below instead of the previous?
> > > > > > >=20
> > > > > > > Unfortunately, this one doesn't fix it either :/
> > > > > >=20
> > > > > > Hmm.  Then how about applying both of the last two patches?  Th=
e last
> > > > > > one to enforce the fallback allocation and the previous one to =
use
> > > > > > dma_alloc_coherent().  It should be essentially reverting to th=
e old
> > > > > > way.
> > > > >=20
> > > > > Oh, I noticed only now: the last patch made it fail to initialize.
> > > >=20
> > > > The "last patch" means the patch to enforce the fallback allocation?
> > >=20
> > > Yes, the one about dma_alloc_noncontiguous().
> > >=20
> > > > > I
> > > > > don't see obvious errors in dmesg, but when trying aplay, I get:
> > > > >=20
> > > > >     ALSA lib pcm_direct.c:1284:(snd1_pcm_direct_initialize_slave)=
 unable to install hw params
> > > > >     ALSA lib pcm_dmix.c:1087:(snd_pcm_dmix_open) unable to initia=
lize slave
> > > > >     aplay: main:830: audio open error: Cannot allocate memory
> > > >=20
> > > > It's -ENOMEM, so it must be from there.  Does it appear always?  If
> > > > yes, your system is with IOMMU, and the patch made return always NU=
LL
> > > > intentionally.
> > >=20
> > > While the system do have IOMMU, it isn't configured by Linux, but by
> > > Xen. And it maps all the memory that Linux see.
> > >=20
> > > > If that's the case, the problem is that IOMMU doesn't handle the
> > > > coherent memory on Xen.
> > > >=20
> > > > Please check more explicitly, whether get_dma_ops(dmab->dev.dev) ca=
ll
> > > > in snd_dma_noncontig_alloc() returns NULL or not.
> > >=20
> > > Will do.
> >=20
> > If get_dma_ops() is non-NULL,=20
>=20
> Yes, it's non-NULL.
>=20
> > it means we need some Xen-specific
> > workaround not to use dma_alloc_noncontiguous().
> > What's the best way to see whether the driver is running on Xen PV?
>=20
> Usually it's this: cpu_feature_enabled(X86_FEATURE_XENPV)
>=20
> > Meanwhile, it's helpful if you can try the combo of my last two
> > patches, too.  It should work, and if it doesn't, it implies that
> > we're looking at a wrong place.
>=20
> It doesn't because the last of them causes "Cannot allocate memory".
> I'm trying now with this on top:
>=20
> ---8<---
> diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
> index 97d7b8106869..e927d18d1ebb 100644
> --- a/sound/core/memalloc.c
> +++ b/sound/core/memalloc.c
> @@ -545,7 +545,7 @@ static void *snd_dma_noncontig_alloc(struct snd_dma_b=
uffer *dmab, size_t size)
>  	// sgt =3D dma_alloc_noncontiguous(dmab->dev.dev, size, dmab->dev.dir,
>  	//	      DEFAULT_GFP, 0);
>  #ifdef CONFIG_SND_DMA_SGBUF
> -	if (!sgt && !get_dma_ops(dmab->dev.dev)) {
> +	if (!sgt) { // && !get_dma_ops(dmab->dev.dev)) {
>  		if (dmab->dev.type =3D=3D SNDRV_DMA_TYPE_DEV_WC_SG)
>  			dmab->dev.type =3D SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
>  		else
> ---8<---

Unfortunately, the above doesn't help. I mean, I don't get an error
anymore, but no sound output either (even though pavucontrol says I
should hear it). So, it's like the original issue, but without any
delay, just straight from the start.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--DZT1vfsoSyjwyXKB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmPJ+14ACgkQ24/THMrX
1yyjJwf/dYqiARRQHpYXQ/3Up1GFmZMb2dUqC7U3HZ0lJekSKitvWCnFWaS/ud0R
wq3hQRUn7oJDvns2VlcRf9OIT66VGsYh3oILYWpyFcw/EYzPcG2ybXggbyj/og0l
OXYWX/RRqojJwbKe1/qdvSRFgVZS1h5H6RWahzlH+46vuhnwLnHlFcRY2CPvzakm
s7KH2Cg5AwVR9sDglkKZVC28QzIxhn47gktIUSnWWG5Tpj7VRo7Z8VbqMh9xqABP
buO0hgB7pW3b6GuVOspy2cBd2PQCSGUUV2T8At+4pDy5Y/39GR0vkMcKd2fN/Fnn
MqrDSYX5tYqljOADeMzKACEdXGiksA==
=u46k
-----END PGP SIGNATURE-----

--DZT1vfsoSyjwyXKB--
