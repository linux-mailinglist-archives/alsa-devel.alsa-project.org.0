Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BB466E40B
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 17:50:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37EEA624F;
	Tue, 17 Jan 2023 17:49:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37EEA624F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673974236;
	bh=geVFw+x66BPE7cSV9gSOG/Vcv0XuPzKGoc3OhlV1vyM=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GT5HUEr4L9aeA6JbuUh0bPOIo+TnKdT1D9pqT5f2xwwJ8jgJuHInd7z6jiN8BcNOj
	 4ggz8jVJLnJELI78JXNOOKJXGqWhaFna3eGR2KfrLqCY/uIkvgT5wlyn+bCYCkHysp
	 wSbBO5ro1NpeaVwZmZtG1dHxXVYcNix5x2OPUNfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C6BDF804DE;
	Tue, 17 Jan 2023 17:49:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69689F804DE; Tue, 17 Jan 2023 17:49:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 342F2F80083
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 17:49:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 342F2F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com
 header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3
 header.b=a4/69VT1; dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=aWpZvGeQ
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 1B1195C013F;
 Tue, 17 Jan 2023 11:49:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 17 Jan 2023 11:49:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1673974173; x=
 1674060573; bh=aCJhFGV/MC7eN3JQFD3fCprBI+q2fHfHjF09fltqxsU=; b=a
 4/69VT1cn/vjLmxjeDQw3p3mb5lRMdB/9oxtaPlf8Ci9wAhxqY4YR9Rd+LkItmKy
 G409iPHpFqBP5usMI0zI3snHgLs4NHQrmnTUgD1/230ujDeSbAv5JBlVcLErt2Uz
 lK7AklRni/nmPJoj1Hh7c/52JZyRqaLMMm8YKxRDgF8lBdEP5MBLOFfiv1IsuISQ
 hMfv2oS4TBd2jM2RtejBUHQotGUVow12TP+by2ZUiXB+3IU8l6NLf8j3PLbGi7k/
 KjvI5cBNnr7ke0gG6fSLEkJlny+MsfOU0NV/2AYD6w7oJdbStsxFEUD5b5g5QJun
 Aj9HxdM8MBaEnMddjQPLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1673974173; x=1674060573; bh=aCJhFGV/MC7eN3JQFD3fCprBI+q2
 fHfHjF09fltqxsU=; b=aWpZvGeQ+phSgYa1eYhCxz4vcVbmrDVHQwoNpBBDteGr
 39Myis+STWb3Xsr0N3q8D+ivMxIzqVuYPFyg+lCVAuOC9HXT1z/DHVxfcYOyDGMv
 9Ft5BkTcPDus94z1KYgJMqGj1FVRefh6V+HRJVwXGiqpe0i9tXhK3hUo0/d3HR67
 3zDvZv9OWQLG0NtA5t/EoqxKdwJWmFgS4KspEr4FPSKCBYp05e1FXL5XKDOQq0ku
 6ckMYVRp0do+gCfKYR4nq+UbYrqXAJK3QwafWZdnKDsmrOf5HJc8uJoab3d/kZvT
 Z8NCb5M0U86f+3bKLd/LvOcwK1VuKJYvoHmqMhHI6A==
X-ME-Sender: <xms:nNHGY2qSxbMSX_NwgQEIp6bOl27tcl7dUVvF-15q0_IyguYY4q8SAQ>
 <xme:nNHGY0qvWDqGVroOQ4Nmclqlt7lhbVEj54MsNaxAYbomkzq0xP0udwNpLq411XCPp
 Gux4oA5cVvEdw>
X-ME-Received: <xmr:nNHGY7N210CVv3pFV2Eu2evcfS7G8-azvZIC_C8Rpp5VjASrUSpqnnehRPcgL3ToN1CpZ7glDoJXNPiAiyDSNTxO8K4E9oHj7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtiedgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieel
 uddvkeejueekhfffteegfeeiffefjeejvdeijedvgfejheetuddvkeffudeinecuffhomh
 grihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
 hlrggsrdgtohhm
X-ME-Proxy: <xmx:nNHGY17ISRxSGXWx73-2nmvc38eTc1DgRWG5J9D01xruR55i2YBjEw>
 <xmx:nNHGY16IWszVkLcS9xy-glVqZADEUhaVeRMvbCmnmeEYJ0ox9qGxvw>
 <xmx:nNHGY1ggnxQy0JgQifhY9UhiSfKs2JcQVOo25F-8Uyv3E5TJ3_tPgQ>
 <xmx:ndHGY1EDv2YiJy_-sZOmsG3t1RsJPAMUrCtivoTRVB971b11PkU1cQ>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 11:49:31 -0500 (EST)
Date: Tue, 17 Jan 2023 17:49:28 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17
Message-ID: <Y8bRmWMBVFVk0WZc@mail-itl>
References: <Y5MssNfvE+mUyyZR@mail-itl> <Y5PaF4LhQGIrKthy@mail-itl>
 <Y5SxJ3IkhHSC/Psu@mail-itl> <87o7rv507o.wl-tiwai@suse.de>
 <Y6sOvyYwuR8Pu0wj@mail-itl> <87bkmya2zk.wl-tiwai@suse.de>
 <87tu0p8uda.wl-tiwai@suse.de> <Y8aIPPcPuDeNkVEy@mail-itl>
 <Y8au5JiQ3w1YPZ8d@mail-itl> <87tu0p6xix.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="C01NnvavSPu49EG9"
Content-Disposition: inline
In-Reply-To: <87tu0p6xix.wl-tiwai@suse.de>
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


--C01NnvavSPu49EG9
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Jan 2023 17:49:28 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Alex Xu <alex_y_xu@yahoo.ca>,
	Harald Arnesen <harald@skogtun.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17

On Tue, Jan 17, 2023 at 03:33:42PM +0100, Takashi Iwai wrote:
> On Tue, 17 Jan 2023 15:21:23 +0100,
> Marek Marczykowski-G=C3=B3recki wrote:
> >=20
> > On Tue, Jan 17, 2023 at 12:36:28PM +0100, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > On Tue, Jan 17, 2023 at 08:58:57AM +0100, Takashi Iwai wrote:
> > > > On Mon, 16 Jan 2023 16:55:11 +0100,
> > > > Takashi Iwai wrote:
> > > > >=20
> > > > > On Tue, 27 Dec 2022 16:26:54 +0100,
> > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > >=20
> > > > > > On Thu, Dec 22, 2022 at 09:09:15AM +0100, Takashi Iwai wrote:
> > > > > > > On Sat, 10 Dec 2022 17:17:42 +0100,
> > > > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > >=20
> > > > > > > > On Sat, Dec 10, 2022 at 02:00:06AM +0100, Marek Marczykowsk=
i-G=C3=B3recki wrote:
> > > > > > > > > On Fri, Dec 09, 2022 at 01:40:15PM +0100, Marek Marczykow=
ski-G=C3=B3recki wrote:
> > > > > > > > > > On Fri, Dec 09, 2022 at 09:10:19AM +0100, Takashi Iwai =
wrote:
> > > > > > > > > > > On Fri, 09 Dec 2022 02:27:30 +0100,
> > > > > > > > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > > > > >=20
> > > > > > > > > > > > Hi,
> > > > > > > > > > > >=20
> > > > > > > > > > > > Under Xen PV dom0, with Linux >=3D 5.17, sound stop=
s working after few
> > > > > > > > > > > > hours. pavucontrol still shows meter bars moving, b=
ut the speakers
> > > > > > > > > > > > remain silent. At least on some occasions I see the=
 following message in
> > > > > > > > > > > > dmesg:
> > > > > > > > > > > >=20
> > > > > > > > > > > >   [ 2142.484553] snd_hda_intel 0000:00:1f.3: Unstab=
le LPIB (18144 >=3D 6396); disabling LPIB delay counting
> > > > > > > > >=20
> > > > > > > > > Hit the issue again, this message did not appear in the l=
og (or at least
> > > > > > > > > not yet).
> > > > > > > > >=20
> > > > > > > > > (...)
> > > > > > > > >=20
> > > > > > > > > > > In anyway, please check the behavior with 6.1-rc8 + t=
he commit
> > > > > > > > > > > cc26516374065a34e10c9a8bf3e940e42cd96e2a
> > > > > > > > > > >     ALSA: memalloc: Allocate more contiguous pages fo=
r fallback case
> > > > > > > > > > > from for-next of my sound git tree (which will be in =
6.2-rc1).
> > > > > > > > >=20
> > > > > > > > > This did not helped.
> > > > > > > > >=20
> > > > > > > > > > Looking at the mentioned commits, there is one specific=
 aspect of Xen PV
> > > > > > > > > > that may be relevant. It configures PAT differently tha=
n native Linux.
> > > > > > > > > > Theoretically Linux adapts automatically and using prop=
er API (like
> > > > > > > > > > set_memory_wc()) should just work, but at least for i91=
5 driver it
> > > > > > > > > > causes issues (not fully tracked down yet). Details abo=
ut that bug
> > > > > > > > > > report include some more background:
> > > > > > > > > > https://lore.kernel.org/intel-gfx/Y5Hst0bCxQDTN7lK@mail=
-itl/
> > > > > > > > > >=20
> > > > > > > > > > Anyway, I have tested it on a Xen modified to setup PAT=
 the same way as
> > > > > > > > > > native Linux and the audio issue is still there.
> > > > > > > > > >=20
> > > > > > > > > > > If the problem persists, another thing to check is th=
e hack below
> > > > > > > > > > > works.
> > > > > > > > >=20
> > > > > > > > > Trying this one now.
> > > > > > > >=20
> > > > > > > > And this one didn't either :/
> > > > > > >=20
> > > > > > > (Sorry for the late reply, as I've been off in the last weeks=
=2E)
> > > > > > >=20
> > > > > > > I think the hack doesn't influence on the PCM buffer pages, b=
ut only
> > > > > > > about BDL pages.  Could you check the patch below instead?
> > > > > > > It'll disable the SG-buffer handling on x86 completely.=20
> > > > > >=20
> > > > > > This seems to "fix" the issue, thanks!
> > > > > > I guess I'll run it this way for now, but a proper solution wou=
ld be
> > > > > > nice. Let me know if I can collect any more info that would hel=
p with
> > > > > > that.
> > > > >=20
> > > > > Then we seem to go back again with the coherent memory allocation=
 for
> > > > > the fallback sg cases.  It was changed because the use of
> > > > > dma_alloc_coherent() caused a problem with IOMMU case for retriev=
ing
> > > > > the page addresses, but since the commit 9736a325137b, we essenti=
ally
> > > > > avoid the fallback when IOMMU is used, so it should be fine again.
> > > > >=20
> > > > > Let me know if the patch like below works for you instead of the
> > > > > previous hack to disable SG-buffer (note: totally untested!)
> > > >=20
> > > > Gah, there was an obvious typo, scratch that.
> > > >=20
> > > > Below is a proper patch.  Please try this one instead.
> > >=20
> > > Thanks, I'll give it a try.
> >=20
> > Unfortunately, it doesn't help, it stopped working again, after about 3h
> > uptime.
>=20
> Aha, then it might be rather other way round;
> dma_alloc_noncontiguous() doesn't work on Xen properly.
>=20
> Could you try the one below instead of the previous?

Unfortunately, this one doesn't fix it either :/

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--C01NnvavSPu49EG9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmPG0ZkACgkQ24/THMrX
1yxsogf/dexma9FI8fBC4rg26qYqFUKFWuet48JuKJFZ87I7I9iEilCW2bpmZfTk
fqs28/W2LMPtOGhvDFWRt+py1QLyqlYtDFZ1HoXMDDYi4WceE4sGd5oBhrYvGNiA
IfCD436OpD2VfiO8XN4Jr6RPUEtw55eZ6+m2dEzMWtiptv9gdFcQHpSyFZnzsCiV
oXMw0Q34ltzTApoGCe7lYF5xbUGdUajPl6mESQPNLse+69EPBJ2eUcnw0GCUDOr/
b6hq5mppromIn9e611we9yayiysHqzhvm8e0RSnsNNAe8mnJ+YgqUMM4LrZVPfQn
X8kaBsdEbA0cGdxc96u08aqzRU/mLg==
=42jv
-----END PGP SIGNATURE-----

--C01NnvavSPu49EG9--
