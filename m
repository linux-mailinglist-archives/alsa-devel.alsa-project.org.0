Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B77F3671922
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 11:40:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D99F770B;
	Wed, 18 Jan 2023 11:39:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D99F770B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674038429;
	bh=lZptWxDz97qU/jRCPjdSr9ekGepLgblkKXS0wAWx//s=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HT2cjt1uGIwloCTOt5SuGxGj+9ycytihjXpjODnH5oeVRBiaG2FDsQ/d5NGB9DyB9
	 HP3lC40rmbBdxpRRSHiZXrf49z1Fjs8wBTxoy/oWqxgm0Ns72986UQJnCIaC648Xlf
	 POGCAfYIWcb6i9XO67vvRBPRBlvWcwwYIGaGszc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A32ABF80482;
	Wed, 18 Jan 2023 11:39:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F61DF8024D; Wed, 18 Jan 2023 11:39:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66AC0F80083
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 11:39:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66AC0F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com
 header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3
 header.b=qJgsp1by; dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=eQVcL/2V
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id EBE145C0162;
 Wed, 18 Jan 2023 05:39:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 18 Jan 2023 05:39:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1674038362; x=
 1674124762; bh=u+ewJAYjRGX8xs03YtOwqvaaF34E4hcMVvlWYynrJqg=; b=q
 Jgsp1bycppOKmA2E0ZR6IOqEssOAxTGsqfdB4sXaprWjV9eAoybThVmfzOljdS6c
 DnQWRWr+GXQZlc9wL9r4vpUVaELfIzcLWf07AsZoQSgbAnF32Nf5UhcboNJzc5n2
 rtXTUbfBVvWeKPe+CNpybmqFf20MbdpWOBuuEaSRj2wR+g7vnAhYQSWk46vT59op
 Oq+mvQMZcaBRDO1b7H+vnghPmNRjhYv7tLC9mDk1crVmtahVh6UeLYmg+CEhkV1B
 ay048VosWPm9ieugHyAar6+S4r4d+ehqMYeFPmsczumQvr7lFcW8ZS5DkfuolAGF
 j6eO4Onf36MCzX/HAtDtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1674038362; x=1674124762; bh=u+ewJAYjRGX8xs03YtOwqvaaF34E
 4hcMVvlWYynrJqg=; b=eQVcL/2VQn/lNFt/X+ayj7utaALkVP5KvIMAUWCKjK5t
 RWSwByNJG4g+HTwQmiFOmasut8OU2naO4F+ND9iITUgPVVoC6GWr+aFx6RMNUkHf
 R3rT0Npr5QMRMqs0MC0E+wX9Ls7fGdJRwfrFyD03I87kgzz7gOkA65Nh4kMcbS26
 jqVnRK8h7///upV25NQ9EQulTT38AbaCSKvAcZE78tJb2fQLCygG1jPDXN7+3lSv
 gBHQ4Ix9gduR3shcKNvk/B4JRYT0gN0ACMtLi94SnUyEp4eCoTgFZ3LbwmMKyDM7
 PMZyuN3xe2TQhc0iKwUWla0QfZCxkRhlTVeXUbnmkA==
X-ME-Sender: <xms:WszHY7uQXvhBWIQgGy6m9uWlXNjtr1zhLrjE_nEzRlybM8cENBbVXw>
 <xme:WszHY8e9pZRWCUBj1PEjXFOyU0ccjRXljj80Q3pmKnweiYd8Mvs0k82-M9g8l5FU5
 LvI4z4F5og0uA>
X-ME-Received: <xmr:WszHY-zv5q_3ddpXeRgizun4TxmmBz1F7AVxdOxK5H0xoHOsGv-6QaW1p3vXX9i-aeXh5LU9jlUUDM7p5WfwoCgSkE4b9-5OyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtkedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieel
 uddvkeejueekhfffteegfeeiffefjeejvdeijedvgfejheetuddvkeffudeinecuffhomh
 grihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
 hlrggsrdgtohhm
X-ME-Proxy: <xmx:WszHY6ObVXsech63yk1dZwrOtvzX4ZujCWdFtJ10iWrV815VlBir-w>
 <xmx:WszHY796z330WD7gFNc2dBOjJ_ZIoziDDtbV-2--M96rerHAKGIptA>
 <xmx:WszHY6V5mUSz_1XM7qVXGTQmJuCLK8f48qC5sEGp_DWxR_C1HtHy8A>
 <xmx:WszHY9KAYTC56kVb4TNQxMmsv5wDbsOZhr3fQH3Ugjgse8gzXwp79Q>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jan 2023 05:39:21 -0500 (EST)
Date: Wed, 18 Jan 2023 11:39:18 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17
Message-ID: <Y8fMVtWshr+yFLWk@mail-itl>
References: <Y6sOvyYwuR8Pu0wj@mail-itl> <87bkmya2zk.wl-tiwai@suse.de>
 <87tu0p8uda.wl-tiwai@suse.de> <Y8aIPPcPuDeNkVEy@mail-itl>
 <Y8au5JiQ3w1YPZ8d@mail-itl> <87tu0p6xix.wl-tiwai@suse.de>
 <Y8bRmWMBVFVk0WZc@mail-itl> <874jsp6r3q.wl-tiwai@suse.de>
 <Y8cGVGCWjODvMXUe@mail-itl> <87sfg85ic1.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6TVM+kqQL6afjnQg"
Content-Disposition: inline
In-Reply-To: <87sfg85ic1.wl-tiwai@suse.de>
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


--6TVM+kqQL6afjnQg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Jan 2023 11:39:18 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Alex Xu <alex_y_xu@yahoo.ca>,
	Harald Arnesen <harald@skogtun.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17

On Wed, Jan 18, 2023 at 09:59:26AM +0100, Takashi Iwai wrote:
> On Tue, 17 Jan 2023 21:34:11 +0100,
> Marek Marczykowski-G=C3=B3recki wrote:
> >=20
> > On Tue, Jan 17, 2023 at 05:52:25PM +0100, Takashi Iwai wrote:
> > > On Tue, 17 Jan 2023 17:49:28 +0100,
> > > Marek Marczykowski-G=C3=B3recki wrote:
> > > >=20
> > > > On Tue, Jan 17, 2023 at 03:33:42PM +0100, Takashi Iwai wrote:
> > > > > On Tue, 17 Jan 2023 15:21:23 +0100,
> > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > >=20
> > > > > > On Tue, Jan 17, 2023 at 12:36:28PM +0100, Marek Marczykowski-G=
=C3=B3recki wrote:
> > > > > > > On Tue, Jan 17, 2023 at 08:58:57AM +0100, Takashi Iwai wrote:
> > > > > > > > On Mon, 16 Jan 2023 16:55:11 +0100,
> > > > > > > > Takashi Iwai wrote:
> > > > > > > > >=20
> > > > > > > > > On Tue, 27 Dec 2022 16:26:54 +0100,
> > > > > > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > > >=20
> > > > > > > > > > On Thu, Dec 22, 2022 at 09:09:15AM +0100, Takashi Iwai =
wrote:
> > > > > > > > > > > On Sat, 10 Dec 2022 17:17:42 +0100,
> > > > > > > > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > > > > >=20
> > > > > > > > > > > > On Sat, Dec 10, 2022 at 02:00:06AM +0100, Marek Mar=
czykowski-G=C3=B3recki wrote:
> > > > > > > > > > > > > On Fri, Dec 09, 2022 at 01:40:15PM +0100, Marek M=
arczykowski-G=C3=B3recki wrote:
> > > > > > > > > > > > > > On Fri, Dec 09, 2022 at 09:10:19AM +0100, Takas=
hi Iwai wrote:
> > > > > > > > > > > > > > > On Fri, 09 Dec 2022 02:27:30 +0100,
> > > > > > > > > > > > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > Hi,
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > > Under Xen PV dom0, with Linux >=3D 5.17, so=
und stops working after few
> > > > > > > > > > > > > > > > hours. pavucontrol still shows meter bars m=
oving, but the speakers
> > > > > > > > > > > > > > > > remain silent. At least on some occasions I=
 see the following message in
> > > > > > > > > > > > > > > > dmesg:
> > > > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > >   [ 2142.484553] snd_hda_intel 0000:00:1f.3=
: Unstable LPIB (18144 >=3D 6396); disabling LPIB delay counting
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > Hit the issue again, this message did not appear =
in the log (or at least
> > > > > > > > > > > > > not yet).
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > (...)
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > In anyway, please check the behavior with 6.1=
-rc8 + the commit
> > > > > > > > > > > > > > > cc26516374065a34e10c9a8bf3e940e42cd96e2a
> > > > > > > > > > > > > > >     ALSA: memalloc: Allocate more contiguous =
pages for fallback case
> > > > > > > > > > > > > > > from for-next of my sound git tree (which wil=
l be in 6.2-rc1).
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > This did not helped.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > > Looking at the mentioned commits, there is one =
specific aspect of Xen PV
> > > > > > > > > > > > > > that may be relevant. It configures PAT differe=
ntly than native Linux.
> > > > > > > > > > > > > > Theoretically Linux adapts automatically and us=
ing proper API (like
> > > > > > > > > > > > > > set_memory_wc()) should just work, but at least=
 for i915 driver it
> > > > > > > > > > > > > > causes issues (not fully tracked down yet). Det=
ails about that bug
> > > > > > > > > > > > > > report include some more background:
> > > > > > > > > > > > > > https://lore.kernel.org/intel-gfx/Y5Hst0bCxQDTN=
7lK@mail-itl/
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > Anyway, I have tested it on a Xen modified to s=
etup PAT the same way as
> > > > > > > > > > > > > > native Linux and the audio issue is still there.
> > > > > > > > > > > > > >=20
> > > > > > > > > > > > > > > If the problem persists, another thing to che=
ck is the hack below
> > > > > > > > > > > > > > > works.
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > Trying this one now.
> > > > > > > > > > > >=20
> > > > > > > > > > > > And this one didn't either :/
> > > > > > > > > > >=20
> > > > > > > > > > > (Sorry for the late reply, as I've been off in the la=
st weeks.)
> > > > > > > > > > >=20
> > > > > > > > > > > I think the hack doesn't influence on the PCM buffer =
pages, but only
> > > > > > > > > > > about BDL pages.  Could you check the patch below ins=
tead?
> > > > > > > > > > > It'll disable the SG-buffer handling on x86 completel=
y.=20
> > > > > > > > > >=20
> > > > > > > > > > This seems to "fix" the issue, thanks!
> > > > > > > > > > I guess I'll run it this way for now, but a proper solu=
tion would be
> > > > > > > > > > nice. Let me know if I can collect any more info that w=
ould help with
> > > > > > > > > > that.
> > > > > > > > >=20
> > > > > > > > > Then we seem to go back again with the coherent memory al=
location for
> > > > > > > > > the fallback sg cases.  It was changed because the use of
> > > > > > > > > dma_alloc_coherent() caused a problem with IOMMU case for=
 retrieving
> > > > > > > > > the page addresses, but since the commit 9736a325137b, we=
 essentially
> > > > > > > > > avoid the fallback when IOMMU is used, so it should be fi=
ne again.
> > > > > > > > >=20
> > > > > > > > > Let me know if the patch like below works for you instead=
 of the
> > > > > > > > > previous hack to disable SG-buffer (note: totally unteste=
d!)
> > > > > > > >=20
> > > > > > > > Gah, there was an obvious typo, scratch that.
> > > > > > > >=20
> > > > > > > > Below is a proper patch.  Please try this one instead.
> > > > > > >=20
> > > > > > > Thanks, I'll give it a try.
> > > > > >=20
> > > > > > Unfortunately, it doesn't help, it stopped working again, after=
 about 3h
> > > > > > uptime.
> > > > >=20
> > > > > Aha, then it might be rather other way round;
> > > > > dma_alloc_noncontiguous() doesn't work on Xen properly.
> > > > >=20
> > > > > Could you try the one below instead of the previous?
> > > >=20
> > > > Unfortunately, this one doesn't fix it either :/
> > >=20
> > > Hmm.  Then how about applying both of the last two patches?  The last
> > > one to enforce the fallback allocation and the previous one to use
> > > dma_alloc_coherent().  It should be essentially reverting to the old
> > > way.
> >=20
> > Oh, I noticed only now: the last patch made it fail to initialize.
>=20
> The "last patch" means the patch to enforce the fallback allocation?

Yes, the one about dma_alloc_noncontiguous().

> > I
> > don't see obvious errors in dmesg, but when trying aplay, I get:
> >=20
> >     ALSA lib pcm_direct.c:1284:(snd1_pcm_direct_initialize_slave) unabl=
e to install hw params
> >     ALSA lib pcm_dmix.c:1087:(snd_pcm_dmix_open) unable to initialize s=
lave
> >     aplay: main:830: audio open error: Cannot allocate memory
>=20
> It's -ENOMEM, so it must be from there.  Does it appear always?  If
> yes, your system is with IOMMU, and the patch made return always NULL
> intentionally.

While the system do have IOMMU, it isn't configured by Linux, but by
Xen. And it maps all the memory that Linux see.

> If that's the case, the problem is that IOMMU doesn't handle the
> coherent memory on Xen.
>=20
> Please check more explicitly, whether get_dma_ops(dmab->dev.dev) call
> in snd_dma_noncontig_alloc() returns NULL or not.

Will do.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--6TVM+kqQL6afjnQg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmPHzFYACgkQ24/THMrX
1yz3rQf/fSsUlPI0uQuP5Lr5WjoNZWSnyooyiX3FeXU18LEMMkB6MXQUKFaRUB61
0/pXGjE4flJ4LTu6FQQAawLqhGuu4xDWrBAAHeA27g8lG+3NN+7ViX1KHFqngkC1
b3fcz/TwNDX9aPk9Uh+nFK3UyJtcgYKh7b2+3sxbjjieovtVKTfCwpmzksnQyqsW
ZlOZkwCeVmicvgcj+0UyZw3snPGUE8nejUgTSrXoKZxkZocVMteyU+Wvn65Niw1y
b8vYobYLQYdYNPHT4K37TWAivlyGQRrelE8Ul4RexL9Ny4kj5Jp7BMjT8m13WX/O
Wq9jnDz2lo17IA1zQqLs33rhCc7WYg==
=aV9y
-----END PGP SIGNATURE-----

--6TVM+kqQL6afjnQg--
