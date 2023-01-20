Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF5F6748A7
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 02:12:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD50129D3;
	Fri, 20 Jan 2023 02:11:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD50129D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674177136;
	bh=MdrbN94PEgG8mu4arbuMCYfcp6q1SgjOB5/w2f0Uv9g=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NYVtZZluNbx8qCDu5AzFDpdXKwDouw5CWatB82ftPWztI2jW3gfck7LAftsvnskUW
	 fAKsmv4RDhRrkt2zQ+GVVkXI1GoseAI6ZGF79c3R5R6W90oRlZecDHfeDr5Pz/STit
	 aazrJ5pZSZtIdTWvjpeAwHGac3rmZNrTR9waxzxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FFF3F804DE;
	Fri, 20 Jan 2023 02:11:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C16BDF8025D; Fri, 20 Jan 2023 02:11:16 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 63D36F8024D
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 02:11:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63D36F8024D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com
 header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3
 header.b=It2wkliu; dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=SDRtJ1+i
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 071915C0066;
 Thu, 19 Jan 2023 20:11:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 19 Jan 2023 20:11:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1674177061; x=
 1674263461; bh=SA/zujYSGKAPKa93VunxVQecnRZb9yvOc+FGswbVvjc=; b=I
 t2wkliuUo2gpxhrZiGwVkC2krUXT8LFxlgEuioDWAD7tWLhJ1RviN4qyRQzpqmUB
 7wxQ0ndU6Zkh5OWBh7N3gz8f1rozwa2A4uU79C4FPwUJZRhx3T+lb4dQwws9WshB
 prGCq9Ltz/hNH6xED9mcfNVxKtbCRU0bv4SHPy36V0yzNfKH7RnW/UFaMFLos5HW
 a2G0ybywev+87rHspSW5zUyr1Rc0d/iKARLLeDUXKDEEB905EZ5iIJC664MZeHPl
 QXEjNY+8LDlcbBHEXc27ftC3m+W/A/SC3CwlQfqWrWZWcIyRuOzvbF7phnjDmETe
 N2ths8zpOEE0OJPFfyHsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674177061; x=1674263461; bh=SA/zujYSGKAPKa93VunxVQecnRZb
 9yvOc+FGswbVvjc=; b=SDRtJ1+iiU3Grl2rLCZ4kg/At5nstXDbsgs+Yber7MsL
 jVdrDb86g3fD3CIBQPH4/1udyIlkEmc/D595rqZjpxJ9wCviPDBDRVY880zGvINA
 DqfX/TT3xqa/2vRKlRsdDaykUpXiWwdiy6E4iyKQQKdOHF8yzHE9WF7AVvoFUkAw
 lAuEGmZiTYquz/X2p4mvyLg3XnKF+2R0atAet01adCBJu7rHusLoDycuQXtwDd9g
 BWAeq5oqT1dMZH/svQggm7ef+TbRt/ydeCtCL+BwZmqwZGHhCXQlrbErKDVXMMue
 MZKc9JRN2YoiSbCS9dpvjkVw/8gce2l74clPvNDX0g==
X-ME-Sender: <xms:JOrJY8K6tiXIWUXQckAm_pqAz3Oyfu0mme7xCSfU6sUUXRkqa_175A>
 <xme:JOrJY8LsZemYtGScGj3prZnRP1rmtk4KIQGD4krE-Rjpp-BhoVw8eNsLSNPKQtjrQ
 3KViw7SHEr7Qg>
X-ME-Received: <xmr:JOrJY8tyVGmXP65XAL6k2t9sCmKRu6DAg7cfnMv7BIqlLqn05DhhR0wxlxCouIGsa8iW3qSfMiI-t1pRmJIuFzA8JdNXAT3Lzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduuddgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieel
 uddvkeejueekhfffteegfeeiffefjeejvdeijedvgfejheetuddvkeffudeinecuffhomh
 grihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
 hlrggsrdgtohhm
X-ME-Proxy: <xmx:JOrJY5auHtoWeLCy2oYj9uGPGfeouayCz_UupeZBeQoWWksoXyixyg>
 <xmx:JOrJYzbedrKJXiw-8tEyFLYkUkne3zoAg5ineZgnMwZlwBWQ4wfNqg>
 <xmx:JOrJY1C97_ZXhU6ZYKbk0eHrpmC4G8kqxZczo0gC0pGAbETll7_lXw>
 <xmx:JerJYyk87zkZp3KSRwAAftzSjSvA5F9oNdpbPETqiJLtb6CKQmf-cg>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Jan 2023 20:10:59 -0500 (EST)
Date: Fri, 20 Jan 2023 02:10:37 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17
Message-ID: <Y8nqIBJISq9Vm710@mail-itl>
References: <87tu0p8uda.wl-tiwai@suse.de> <Y8aIPPcPuDeNkVEy@mail-itl>
 <Y8au5JiQ3w1YPZ8d@mail-itl> <87tu0p6xix.wl-tiwai@suse.de>
 <Y8bRmWMBVFVk0WZc@mail-itl> <874jsp6r3q.wl-tiwai@suse.de>
 <Y8cGVGCWjODvMXUe@mail-itl> <87sfg85ic1.wl-tiwai@suse.de>
 <Y8fMVtWshr+yFLWk@mail-itl> <87fsc8t3s3.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+FE84wz7QZrlsd1I"
Content-Disposition: inline
In-Reply-To: <87fsc8t3s3.wl-tiwai@suse.de>
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


--+FE84wz7QZrlsd1I
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Jan 2023 02:10:37 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Alex Xu <alex_y_xu@yahoo.ca>,
	Harald Arnesen <harald@skogtun.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17

On Wed, Jan 18, 2023 at 01:39:56PM +0100, Takashi Iwai wrote:
> On Wed, 18 Jan 2023 11:39:18 +0100,
> Marek Marczykowski-G=C3=B3recki wrote:
> >=20
> > On Wed, Jan 18, 2023 at 09:59:26AM +0100, Takashi Iwai wrote:
> > > On Tue, 17 Jan 2023 21:34:11 +0100,
> > > Marek Marczykowski-G=C3=B3recki wrote:
> > > >=20
> > > > On Tue, Jan 17, 2023 at 05:52:25PM +0100, Takashi Iwai wrote:
> > > > > On Tue, 17 Jan 2023 17:49:28 +0100,
> > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > >=20
> > > > > > On Tue, Jan 17, 2023 at 03:33:42PM +0100, Takashi Iwai wrote:
> > > > > > > On Tue, 17 Jan 2023 15:21:23 +0100,
> > > > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > >=20
> > > > > > > > On Tue, Jan 17, 2023 at 12:36:28PM +0100, Marek Marczykowsk=
i-G=C3=B3recki wrote:
> > > > > > > > > On Tue, Jan 17, 2023 at 08:58:57AM +0100, Takashi Iwai wr=
ote:
> > > > > > > > > > On Mon, 16 Jan 2023 16:55:11 +0100,
> > > > > > > > > > Takashi Iwai wrote:
> > > > > > > > > > >=20
> > > > > > > > > > > On Tue, 27 Dec 2022 16:26:54 +0100,
> > > > > > > > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > > > > >=20
> > > > > > > > > > > > On Thu, Dec 22, 2022 at 09:09:15AM +0100, Takashi I=
wai wrote:
> > > > > > > > > > > > > On Sat, 10 Dec 2022 17:17:42 +0100,
> > > > > > > > > > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > On Sat, Dec 10, 2022 at 02:00:06AM +0100, Marek=
 Marczykowski-G=C3=B3recki wrote:
> > > > > > > > > > > > > > > On Fri, Dec 09, 2022 at 01:40:15PM +0100, Mar=
ek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > > > > > > > > > On Fri, Dec 09, 2022 at 09:10:19AM +0100, T=
akashi Iwai wrote:
> > > > > > > > > > > > > > > > > On Fri, 09 Dec 2022 02:27:30 +0100,
> > > > > > > > > > > > > > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > > Under Xen PV dom0, with Linux >=3D 5.17=
, sound stops working after few
> > > > > > > > > > > > > > > > > > hours. pavucontrol still shows meter ba=
rs moving, but the speakers
> > > > > > > > > > > > > > > > > > remain silent. At least on some occasio=
ns I see the following message in
> > > > > > > > > > > > > > > > > > dmesg:
> > > > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > >   [ 2142.484553] snd_hda_intel 0000:00:=
1f.3: Unstable LPIB (18144 >=3D 6396); disabling LPIB delay counting
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > Hit the issue again, this message did not app=
ear in the log (or at least
> > > > > > > > > > > > > > > not yet).
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > (...)
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > In anyway, please check the behavior with=
 6.1-rc8 + the commit
> > > > > > > > > > > > > > > > > cc26516374065a34e10c9a8bf3e940e42cd96e2a
> > > > > > > > > > > > > > > > >     ALSA: memalloc: Allocate more contigu=
ous pages for fallback case
> > > > > > > > > > > > > > > > > from for-next of my sound git tree (which=
 will be in 6.2-rc1).
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > This did not helped.
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > Looking at the mentioned commits, there is =
one specific aspect of Xen PV
> > > > > > > > > > > > > > > > that may be relevant. It configures PAT dif=
ferently than native Linux.
> > > > > > > > > > > > > > > > Theoretically Linux adapts automatically an=
d using proper API (like
> > > > > > > > > > > > > > > > set_memory_wc()) should just work, but at l=
east for i915 driver it
> > > > > > > > > > > > > > > > causes issues (not fully tracked down yet).=
 Details about that bug
> > > > > > > > > > > > > > > > report include some more background:
> > > > > > > > > > > > > > > > https://lore.kernel.org/intel-gfx/Y5Hst0bCx=
QDTN7lK@mail-itl/
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > Anyway, I have tested it on a Xen modified =
to setup PAT the same way as
> > > > > > > > > > > > > > > > native Linux and the audio issue is still t=
here.
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > > If the problem persists, another thing to=
 check is the hack below
> > > > > > > > > > > > > > > > > works.
> > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > Trying this one now.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > And this one didn't either :/
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > (Sorry for the late reply, as I've been off in th=
e last weeks.)
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > I think the hack doesn't influence on the PCM buf=
fer pages, but only
> > > > > > > > > > > > > about BDL pages.  Could you check the patch below=
 instead?
> > > > > > > > > > > > > It'll disable the SG-buffer handling on x86 compl=
etely.=20
> > > > > > > > > > > >=20
> > > > > > > > > > > > This seems to "fix" the issue, thanks!
> > > > > > > > > > > > I guess I'll run it this way for now, but a proper =
solution would be
> > > > > > > > > > > > nice. Let me know if I can collect any more info th=
at would help with
> > > > > > > > > > > > that.
> > > > > > > > > > >=20
> > > > > > > > > > > Then we seem to go back again with the coherent memor=
y allocation for
> > > > > > > > > > > the fallback sg cases.  It was changed because the us=
e of
> > > > > > > > > > > dma_alloc_coherent() caused a problem with IOMMU case=
 for retrieving
> > > > > > > > > > > the page addresses, but since the commit 9736a325137b=
, we essentially
> > > > > > > > > > > avoid the fallback when IOMMU is used, so it should b=
e fine again.
> > > > > > > > > > >=20
> > > > > > > > > > > Let me know if the patch like below works for you ins=
tead of the
> > > > > > > > > > > previous hack to disable SG-buffer (note: totally unt=
ested!)
> > > > > > > > > >=20
> > > > > > > > > > Gah, there was an obvious typo, scratch that.
> > > > > > > > > >=20
> > > > > > > > > > Below is a proper patch.  Please try this one instead.
> > > > > > > > >=20
> > > > > > > > > Thanks, I'll give it a try.
> > > > > > > >=20
> > > > > > > > Unfortunately, it doesn't help, it stopped working again, a=
fter about 3h
> > > > > > > > uptime.
> > > > > > >=20
> > > > > > > Aha, then it might be rather other way round;
> > > > > > > dma_alloc_noncontiguous() doesn't work on Xen properly.
> > > > > > >=20
> > > > > > > Could you try the one below instead of the previous?
> > > > > >=20
> > > > > > Unfortunately, this one doesn't fix it either :/
> > > > >=20
> > > > > Hmm.  Then how about applying both of the last two patches?  The =
last
> > > > > one to enforce the fallback allocation and the previous one to use
> > > > > dma_alloc_coherent().  It should be essentially reverting to the =
old
> > > > > way.
> > > >=20
> > > > Oh, I noticed only now: the last patch made it fail to initialize.
> > >=20
> > > The "last patch" means the patch to enforce the fallback allocation?
> >=20
> > Yes, the one about dma_alloc_noncontiguous().
> >=20
> > > > I
> > > > don't see obvious errors in dmesg, but when trying aplay, I get:
> > > >=20
> > > >     ALSA lib pcm_direct.c:1284:(snd1_pcm_direct_initialize_slave) u=
nable to install hw params
> > > >     ALSA lib pcm_dmix.c:1087:(snd_pcm_dmix_open) unable to initiali=
ze slave
> > > >     aplay: main:830: audio open error: Cannot allocate memory
> > >=20
> > > It's -ENOMEM, so it must be from there.  Does it appear always?  If
> > > yes, your system is with IOMMU, and the patch made return always NULL
> > > intentionally.
> >=20
> > While the system do have IOMMU, it isn't configured by Linux, but by
> > Xen. And it maps all the memory that Linux see.
> >=20
> > > If that's the case, the problem is that IOMMU doesn't handle the
> > > coherent memory on Xen.
> > >=20
> > > Please check more explicitly, whether get_dma_ops(dmab->dev.dev) call
> > > in snd_dma_noncontig_alloc() returns NULL or not.
> >=20
> > Will do.
>=20
> If get_dma_ops() is non-NULL,=20

Yes, it's non-NULL.

> it means we need some Xen-specific
> workaround not to use dma_alloc_noncontiguous().
> What's the best way to see whether the driver is running on Xen PV?

Usually it's this: cpu_feature_enabled(X86_FEATURE_XENPV)

> Meanwhile, it's helpful if you can try the combo of my last two
> patches, too.  It should work, and if it doesn't, it implies that
> we're looking at a wrong place.

It doesn't because the last of them causes "Cannot allocate memory".
I'm trying now with this on top:

---8<---
diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 97d7b8106869..e927d18d1ebb 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -545,7 +545,7 @@ static void *snd_dma_noncontig_alloc(struct snd_dma_buf=
fer *dmab, size_t size)
 	// sgt =3D dma_alloc_noncontiguous(dmab->dev.dev, size, dmab->dev.dir,
 	//	      DEFAULT_GFP, 0);
 #ifdef CONFIG_SND_DMA_SGBUF
-	if (!sgt && !get_dma_ops(dmab->dev.dev)) {
+	if (!sgt) { // && !get_dma_ops(dmab->dev.dev)) {
 		if (dmab->dev.type =3D=3D SNDRV_DMA_TYPE_DEV_WC_SG)
 			dmab->dev.type =3D SNDRV_DMA_TYPE_DEV_WC_SG_FALLBACK;
 		else
---8<---


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--+FE84wz7QZrlsd1I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmPJ6iAACgkQ24/THMrX
1yxuOQgAjNLc+dt0vBgU7r619fAiljIGzRCKM8RONf24YfTXifQArNflhE2GEJpZ
WduT8zcA9FXMehGg6CirETRRO6qQisF0RcjT7lOEJSB1eYV9TVGzdW8peOhNWIF8
5X0w0lP792x3T1OMsYFNmQIYPUTosRUT3pJJ1wz7ZgJSAF8Kfq53USyHC1SPkv+g
5NfLxsUj4ROhk2QFG6z5kUBpncbUe9nX0IsLCbo+3dnnaHc3Tkc+Hw4VnMb0FsO4
yGIG8JSoDEIf5W2e4ymDC8hrWNUDizdalQksEu54EXLMBwia9U4vaZ1dbRjTZaOX
J2vaqmSkmSgppo0D9BjutRiTa055cg==
=UChq
-----END PGP SIGNATURE-----

--+FE84wz7QZrlsd1I--
