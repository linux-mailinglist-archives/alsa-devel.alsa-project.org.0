Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E733E66DCA4
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 12:37:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BD2A66B2;
	Tue, 17 Jan 2023 12:36:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BD2A66B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673955463;
	bh=ZZnlx+fiAIa1hHC+wb9mQ2QzM1+QK1mDk28ozms0aSk=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=aVbv/1Nt/tCKMn+bWzWwV/1fRig/Q5E0OUfSAB2YX1f8W+vzEZ3FoVXp6V8FCyVa9
	 I1kq7tTqtnYLhj2UGrGBzSxU/W5xWP+nKURFErKQrXWrJ3cq4tBXQAbVL7lnuqTvup
	 vK0fOzf7JaFkC1ZHLDDetDgNPQZ5Yn9ICcsfZtx8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D293EF80083;
	Tue, 17 Jan 2023 12:36:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E135BF8026D; Tue, 17 Jan 2023 12:36:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EA6BF8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 12:36:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EA6BF8023A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com
 header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm3
 header.b=QgTkUG0U; dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=YyVmTUJC
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 6269C32003D3;
 Tue, 17 Jan 2023 06:36:33 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 17 Jan 2023 06:36:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1673955392; x=
 1674041792; bh=R3m2l1d/UJk+kClBwPuUtaUx1HBlk+z1iZUm61ODlcw=; b=Q
 gTkUG0UYFjM15QTlpUwBV3IfpYtzmjTPuCRmbLpnyQP/4OZ2p7oCMGFs3nqtJu3u
 t8aX05bxJIXqvKk0dJWbfgngPZUz7LdHTbJ7+OHj6OmCdrjMPTIb3MljMzHJqLCc
 BWGltSabLnlsV25k8+E7mZreccopssgF+AnwL1uOu8q7s66A6A397B28I/uL41UO
 Gq93x/VGbnRJtZzKfgrvPlNWYIBqjxV+T4A0EBuLip78QoFz4QhSzXwK0jMo2xfo
 Tm6U4mLipZ4NhjRwPlKlUAxIkjfFCc2T4dASRZiXkamnhqETcHk7ErrmJWuvaQkf
 8d61Oy7OUYvIh3fcjbCtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1673955392; x=1674041792; bh=R3m2l1d/UJk+kClBwPuUtaUx1HBl
 k+z1iZUm61ODlcw=; b=YyVmTUJCVL0fUGqAZxawcDN4Behe8GQUQsaxLbXT7UUm
 4dwoSkZV1H6fksCkNTGTK2GDL+B9xtMvdfNjZr3GeHgepozf4W4M2Ao5ML4+xnAc
 hjhiTwliVKWpgU/EoEFXt/vnaFM3/FW3tU1hl+SY2cVjni8jR/DEiDjvuIiAK6LV
 +bdKqYQysZlK1+zwZ1S5i0ivd7SflUsZvK2jAB3PFI0OvSXSEOn7pgcz1bZw4NYr
 ba50z35JXhYEnISj48BOuzMBIqQCHlUoUMQqUQ6I2+Pr6UGXQUTnG5lgy8oo15Ra
 UZX6lN51fx/pIC/N2X5DctA2Fhx3+L9ljrL3Eht9Fw==
X-ME-Sender: <xms:QIjGY24vIrBmAoIz5S8n6L0a-k3IKFABmENO2qh8iyRbnR210Fh8qA>
 <xme:QIjGY_4hiRorrZcrWZoSvnHX9AstO58p5a4CrF3S0orRAXd2iG3VxtyqJx_qYTF0D
 vtXUt_riTXtlw>
X-ME-Received: <xmr:QIjGY1cFdhLt0RzwsTjR9fiNcZ-CuGtxbHnxG6AD_PTH4oaVvFy7sQ_OSbz0vTNjsempJm2IktD_X9kEmk6Fy66K_OtJxIVZ7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtiedgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieel
 uddvkeejueekhfffteegfeeiffefjeejvdeijedvgfejheetuddvkeffudeinecuffhomh
 grihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
 hlrggsrdgtohhm
X-ME-Proxy: <xmx:QIjGYzLcI4iFlACS0bk-oV-0WuKHUzQViGbYs5ikZkXh-1tV5nzKnw>
 <xmx:QIjGY6JxdcXXIe7mT1Y3eL8dmRZ6AcufK2eMoublhEWtFqfIcy4sew>
 <xmx:QIjGY0yKV1VToMlcsj3EZGzkLNloJ3IqpxeySE62qWV9u1UynipJig>
 <xmx:QIjGYxVR7CxiIIVX1kcyKg2yzoVSlGNXUBsaWu2i3-_obZF0UR9V4w>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 06:36:31 -0500 (EST)
Date: Tue, 17 Jan 2023 12:36:28 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17
Message-ID: <Y8aIPPcPuDeNkVEy@mail-itl>
References: <Y5KPAs6f7S2dEoxR@mail-itl> <87tu256lqs.wl-tiwai@suse.de>
 <Y5MssNfvE+mUyyZR@mail-itl> <Y5PaF4LhQGIrKthy@mail-itl>
 <Y5SxJ3IkhHSC/Psu@mail-itl> <87o7rv507o.wl-tiwai@suse.de>
 <Y6sOvyYwuR8Pu0wj@mail-itl> <87bkmya2zk.wl-tiwai@suse.de>
 <87tu0p8uda.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tBSJwXWMvExu6qqg"
Content-Disposition: inline
In-Reply-To: <87tu0p8uda.wl-tiwai@suse.de>
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


--tBSJwXWMvExu6qqg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Jan 2023 12:36:28 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Alex Xu <alex_y_xu@yahoo.ca>,
	Harald Arnesen <harald@skogtun.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17

On Tue, Jan 17, 2023 at 08:58:57AM +0100, Takashi Iwai wrote:
> On Mon, 16 Jan 2023 16:55:11 +0100,
> Takashi Iwai wrote:
> >=20
> > On Tue, 27 Dec 2022 16:26:54 +0100,
> > Marek Marczykowski-G=C3=B3recki wrote:
> > >=20
> > > On Thu, Dec 22, 2022 at 09:09:15AM +0100, Takashi Iwai wrote:
> > > > On Sat, 10 Dec 2022 17:17:42 +0100,
> > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > >=20
> > > > > On Sat, Dec 10, 2022 at 02:00:06AM +0100, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > > On Fri, Dec 09, 2022 at 01:40:15PM +0100, Marek Marczykowski-G=
=C3=B3recki wrote:
> > > > > > > On Fri, Dec 09, 2022 at 09:10:19AM +0100, Takashi Iwai wrote:
> > > > > > > > On Fri, 09 Dec 2022 02:27:30 +0100,
> > > > > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > >=20
> > > > > > > > > Hi,
> > > > > > > > >=20
> > > > > > > > > Under Xen PV dom0, with Linux >=3D 5.17, sound stops work=
ing after few
> > > > > > > > > hours. pavucontrol still shows meter bars moving, but the=
 speakers
> > > > > > > > > remain silent. At least on some occasions I see the follo=
wing message in
> > > > > > > > > dmesg:
> > > > > > > > >=20
> > > > > > > > >   [ 2142.484553] snd_hda_intel 0000:00:1f.3: Unstable LPI=
B (18144 >=3D 6396); disabling LPIB delay counting
> > > > > >=20
> > > > > > Hit the issue again, this message did not appear in the log (or=
 at least
> > > > > > not yet).
> > > > > >=20
> > > > > > (...)
> > > > > >=20
> > > > > > > > In anyway, please check the behavior with 6.1-rc8 + the com=
mit
> > > > > > > > cc26516374065a34e10c9a8bf3e940e42cd96e2a
> > > > > > > >     ALSA: memalloc: Allocate more contiguous pages for fall=
back case
> > > > > > > > from for-next of my sound git tree (which will be in 6.2-rc=
1).
> > > > > >=20
> > > > > > This did not helped.
> > > > > >=20
> > > > > > > Looking at the mentioned commits, there is one specific aspec=
t of Xen PV
> > > > > > > that may be relevant. It configures PAT differently than nati=
ve Linux.
> > > > > > > Theoretically Linux adapts automatically and using proper API=
 (like
> > > > > > > set_memory_wc()) should just work, but at least for i915 driv=
er it
> > > > > > > causes issues (not fully tracked down yet). Details about tha=
t bug
> > > > > > > report include some more background:
> > > > > > > https://lore.kernel.org/intel-gfx/Y5Hst0bCxQDTN7lK@mail-itl/
> > > > > > >=20
> > > > > > > Anyway, I have tested it on a Xen modified to setup PAT the s=
ame way as
> > > > > > > native Linux and the audio issue is still there.
> > > > > > >=20
> > > > > > > > If the problem persists, another thing to check is the hack=
 below
> > > > > > > > works.
> > > > > >=20
> > > > > > Trying this one now.
> > > > >=20
> > > > > And this one didn't either :/
> > > >=20
> > > > (Sorry for the late reply, as I've been off in the last weeks.)
> > > >=20
> > > > I think the hack doesn't influence on the PCM buffer pages, but only
> > > > about BDL pages.  Could you check the patch below instead?
> > > > It'll disable the SG-buffer handling on x86 completely.=20
> > >=20
> > > This seems to "fix" the issue, thanks!
> > > I guess I'll run it this way for now, but a proper solution would be
> > > nice. Let me know if I can collect any more info that would help with
> > > that.
> >=20
> > Then we seem to go back again with the coherent memory allocation for
> > the fallback sg cases.  It was changed because the use of
> > dma_alloc_coherent() caused a problem with IOMMU case for retrieving
> > the page addresses, but since the commit 9736a325137b, we essentially
> > avoid the fallback when IOMMU is used, so it should be fine again.
> >=20
> > Let me know if the patch like below works for you instead of the
> > previous hack to disable SG-buffer (note: totally untested!)
>=20
> Gah, there was an obvious typo, scratch that.
>=20
> Below is a proper patch.  Please try this one instead.

Thanks, I'll give it a try.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--tBSJwXWMvExu6qqg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmPGiDwACgkQ24/THMrX
1yzv/Qf/eDTJdU/uyQdVRJKKisDDUqvRdi597RqrvRllsSexAqZVlWa+fm0CvY7z
rQnRgk9i09eQ6S6wXbq5sL2hAj+XPClLOPJzamjSesfnBUofaB6rvUFOGw2BPySz
wTcz/SUjVuYjGJv0TmmVebWIFaycFay6/YcI5y9XVrlQYgSGiMx+RShefIvumc7z
uEclp47UM1hnnZsFROgUdDWNVVenv1Q6qXtWCbcX9anW/E2A+3rpI5fWzqrI3JS2
4QMK/knysWrgRi9rOzx1i1wKOB20TZnCOKqmoFmLWEEg/ptYXQZd3upr7ciry5/7
kzaw38ea8eqydnaUzAeP3pWmkPWGVg==
=tt4I
-----END PGP SIGNATURE-----

--tBSJwXWMvExu6qqg--
