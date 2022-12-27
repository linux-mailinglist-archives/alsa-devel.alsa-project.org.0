Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F41656C86
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 16:28:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB54C2AF3;
	Tue, 27 Dec 2022 16:27:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB54C2AF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672154889;
	bh=rqFPXVDVgiAuznLqnkiqVoTnCboUrTgCJz+7GAmQ/UI=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LIFyWjRqnoVoQL3sp6S4D36n/VflcpPiqg6bmWZNWtkSL5ZV5VzzmcXy0V1ZM4k5G
	 cKRwu3bzIjtYJqg77WZ83AJovhSDKyjk8CEfTZhpqYg/Y+EMRe6wQ0+0afFTirNUK2
	 Tp4/J+4YAX5+FRCx40ujvD/KRmfiPgeqHdkR1JuE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A794AF8023B;
	Tue, 27 Dec 2022 16:27:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E04AEF804B4; Tue, 27 Dec 2022 16:27:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F8CAF8027B
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 16:27:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F8CAF8027B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=invisiblethingslab.com
 header.i=@invisiblethingslab.com header.a=rsa-sha256 header.s=fm2
 header.b=QFX1WVzv; dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=vwRJjW3/
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 2D92C5C00E3;
 Tue, 27 Dec 2022 10:27:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 27 Dec 2022 10:27:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1672154820; x=
 1672241220; bh=21klW97vVNclkIxbPfL0Bl7Lh/8sXyuaCWSIpWyHYSw=; b=Q
 FX1WVzvEqNR2BHn8mBxR7cWNuVAoT4UOKO4k+rrSvavd1K4gX3/hZtjCM2on27DP
 yzPv+A/afdw9fvlFNo6lp1plon2CHgNCD9/QoODU+BVrUsVHoWZtjy+JE04QahNr
 /ZunrOuYoPOK40cJFj3AzypjTGmD9am87fba2yQJ26mzl9Swev2FVgVIlL6fZBOU
 0Qmq2TL3ckpiLUWp/kt4i4ypZlDW3CxqMaV4JXbGy+1mGTamz5CVtDYXjnwOHSJb
 jWLFmDhKofm1A4TrpfxD2Mev/cN/OVCf6cD2Vn5Tc69F8ttKkxuTURot2FtftQTY
 +w5R+fX4uk1csuwFQdCOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1672154820; x=1672241220; bh=21klW97vVNclkIxbPfL0Bl7Lh/8s
 XyuaCWSIpWyHYSw=; b=vwRJjW3/bBK3AfXivM9Yfbz8GQbEe+fFYb69zkxuiPag
 dPwUN7QMjYs1KnsmFE4KL5fCL78dWElx+FMowiAN7leRGt5KbqQ/XbRWTr1iX6nA
 XOjyhd+40jWpGVNXL6IKOUEh6xBvOgeGD4aKLu0xAG7ZKe9pej38vmZ1d3oCt6iB
 2emdb59DQQQ557q6/bt0taNuP6xQGIs4XWZXrtsVJdLNpsWRSBSD6BaBaZBpTtAT
 lPxJrWjFCmjlDSXX/SFpCr4HI/O0M5b4WkyWSscvUbmCevlEMiytpwqQV4d4x401
 c7DcqlPhCjxTsPzigYNlthajNmC0lpyjKS1csHCANg==
X-ME-Sender: <xms:ww6rY14JBUsnwcrYEfA0QoPgTCxKIVRKO-2SBIchp2HwRuhbFwAI7A>
 <xme:ww6rYy6NLeYd1b1q4oXOeBUNZ9DNpWqHHhzz3DiqVY8RF52CfAhv4V6oFZU3mlUtW
 w24re0zt7LvcQ>
X-ME-Received: <xmr:ww6rY8fIBPBwmvPBK7G-LNvOvC_nOL9K_GdbcgUF9A76_mTLD8OxRfYQZNsqPZOf7ahO2GfWnW88tOkEH9SrPIB2vHuxz5Q2Eg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedriedtgdejiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeiledu
 vdekjeeukefhffetgeefiefffeejjedvieejvdfgjeehteduvdekffduieenucffohhmrg
 hinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
 grsgdrtghomh
X-ME-Proxy: <xmx:ww6rY-Kyw2xVtq9OOu2DYPiad5D1RP2XmuVEpCaB0SypKaTfzt8OSg>
 <xmx:ww6rY5L6pUJ0vHztIjxhFAoDkc72EUpep3RSe0ftdLckidaPgCOYpQ>
 <xmx:ww6rY3x4SZuySHztmOCMqqKaJMYDC2gdiyrE6RZ58zEuFyJiibm_Nw>
 <xmx:xA6rYwUI608XZwNXnQAH8vZF4G830NkFPLVWhQHiTh7ubIFUb_I6NA>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Dec 2022 10:26:58 -0500 (EST)
Date: Tue, 27 Dec 2022 16:26:54 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17
Message-ID: <Y6sOvyYwuR8Pu0wj@mail-itl>
References: <Y5KPAs6f7S2dEoxR@mail-itl> <87tu256lqs.wl-tiwai@suse.de>
 <Y5MssNfvE+mUyyZR@mail-itl> <Y5PaF4LhQGIrKthy@mail-itl>
 <Y5SxJ3IkhHSC/Psu@mail-itl> <87o7rv507o.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UYpQzp6InHM0NElA"
Content-Disposition: inline
In-Reply-To: <87o7rv507o.wl-tiwai@suse.de>
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


--UYpQzp6InHM0NElA
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Dec 2022 16:26:54 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Alex Xu <alex_y_xu@yahoo.ca>,
	Harald Arnesen <harald@skogtun.org>,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: Intel HD Audio: sound stops working in Xen PV dom0 in >=5.17

On Thu, Dec 22, 2022 at 09:09:15AM +0100, Takashi Iwai wrote:
> On Sat, 10 Dec 2022 17:17:42 +0100,
> Marek Marczykowski-G=C3=B3recki wrote:
> >=20
> > On Sat, Dec 10, 2022 at 02:00:06AM +0100, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > On Fri, Dec 09, 2022 at 01:40:15PM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > On Fri, Dec 09, 2022 at 09:10:19AM +0100, Takashi Iwai wrote:
> > > > > On Fri, 09 Dec 2022 02:27:30 +0100,
> > > > > Marek Marczykowski-G=C3=B3recki wrote:
> > > > > >=20
> > > > > > Hi,
> > > > > >=20
> > > > > > Under Xen PV dom0, with Linux >=3D 5.17, sound stops working af=
ter few
> > > > > > hours. pavucontrol still shows meter bars moving, but the speak=
ers
> > > > > > remain silent. At least on some occasions I see the following m=
essage in
> > > > > > dmesg:
> > > > > >=20
> > > > > >   [ 2142.484553] snd_hda_intel 0000:00:1f.3: Unstable LPIB (181=
44 >=3D 6396); disabling LPIB delay counting
> > >=20
> > > Hit the issue again, this message did not appear in the log (or at le=
ast
> > > not yet).
> > >=20
> > > (...)
> > >=20
> > > > > In anyway, please check the behavior with 6.1-rc8 + the commit
> > > > > cc26516374065a34e10c9a8bf3e940e42cd96e2a
> > > > >     ALSA: memalloc: Allocate more contiguous pages for fallback c=
ase
> > > > > from for-next of my sound git tree (which will be in 6.2-rc1).
> > >=20
> > > This did not helped.
> > >=20
> > > > Looking at the mentioned commits, there is one specific aspect of X=
en PV
> > > > that may be relevant. It configures PAT differently than native Lin=
ux.
> > > > Theoretically Linux adapts automatically and using proper API (like
> > > > set_memory_wc()) should just work, but at least for i915 driver it
> > > > causes issues (not fully tracked down yet). Details about that bug
> > > > report include some more background:
> > > > https://lore.kernel.org/intel-gfx/Y5Hst0bCxQDTN7lK@mail-itl/
> > > >=20
> > > > Anyway, I have tested it on a Xen modified to setup PAT the same wa=
y as
> > > > native Linux and the audio issue is still there.
> > > >=20
> > > > > If the problem persists, another thing to check is the hack below
> > > > > works.
> > >=20
> > > Trying this one now.
> >=20
> > And this one didn't either :/
>=20
> (Sorry for the late reply, as I've been off in the last weeks.)
>=20
> I think the hack doesn't influence on the PCM buffer pages, but only
> about BDL pages.  Could you check the patch below instead?
> It'll disable the SG-buffer handling on x86 completely.=20

This seems to "fix" the issue, thanks!
I guess I'll run it this way for now, but a proper solution would be
nice. Let me know if I can collect any more info that would help with
that.

> -- 8< --
> --- a/sound/core/Kconfig
> +++ b/sound/core/Kconfig
> @@ -225,8 +225,8 @@ config SND_VMASTER
>  	bool
> =20
>  config SND_DMA_SGBUF
> -	def_bool y
> -	depends on X86
> +	def_bool n
> +#	depends on X86
> =20
>  config SND_CTL_LED
>  	tristate

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--UYpQzp6InHM0NElA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmOrDsAACgkQ24/THMrX
1yxBFgf/dNJC3JuXuRUdnRV81xzhchWQuitEZsO+uGXJ2i7xQ8ro5WLw8axQ8zJy
ZmoPPBko/FrrEYN73hvSwlDx87A/wcN23jlw/Dt8jOIzlM3sU93anLv0eQLuPOIM
PZYPvx7JluhAmVIZmpxfU0k5aiQhIVGcy0WNUYLc4cCub8mave2aqDmFiiUGQ1YO
kMQWwSjNupyI7ZbR22Tl/mT/ROCmf9wiOOVACJy442IOuLyaXLPY6/YW3VGc6BnD
xEAZOz1hkTNppB0EvrolkNHrdK36jux5n5nt36vhEfRpadthgERv74dPdZuiCl/z
KZrbnvvj1kgr8doSgStjWcAKBKtTOQ==
=u8jn
-----END PGP SIGNATURE-----

--UYpQzp6InHM0NElA--
