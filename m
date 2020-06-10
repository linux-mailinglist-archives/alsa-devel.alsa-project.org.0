Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 886BC1F5252
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jun 2020 12:30:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE9AF1607;
	Wed, 10 Jun 2020 12:29:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE9AF1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591785026;
	bh=pWbMBf+2NHLWsd74kJCHTKb/ilpX227pIQD4SgmxOzY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=To+7uUqoBHV80gMmbSory9Pbz+utdY7eQ0VS6jIdVyLvrkig4nuMJMJ7FnTKLN1u5
	 Suv0FEzd7VfQyimER3yG/RaATwI011Wy+h9yeeub5Hl9GDPFD50qNZTSiw5abjlQrx
	 rd26eUzjQgyrht7pLtZBY9TOAzzgiv1cjQmWgqGo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D5CEF800E0;
	Wed, 10 Jun 2020 12:29:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BA73F8021C; Wed, 10 Jun 2020 12:29:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B585F80088
 for <alsa-devel@alsa-project.org>; Wed, 10 Jun 2020 12:29:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B585F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1XmLlrBy"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 762FE20656;
 Wed, 10 Jun 2020 10:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591784963;
 bh=pWbMBf+2NHLWsd74kJCHTKb/ilpX227pIQD4SgmxOzY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1XmLlrByds01M+op+BGXfLVCmQNRSnVf5dOMutgcNHgrt1Pf4i7SBvhZ9G2zTZsOG
 KtO7gr4mFkvcNsDUD1RoMT4uuweLbOKyjlxmUI5arnGFC+9eE22vLXgefXEnpceHLD
 fXUQQIy6V1Q9PWKQzwHPypIwFKSufu/mSvdOMHsU=
Date: Wed, 10 Jun 2020 11:29:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [RFC PATCH 1/2] dt-bindings: tas2562: Add firmware support for
 tas2563
Message-ID: <20200610102920.GC5005@sirena.org.uk>
References: <20200609172841.22541-1-dmurphy@ti.com>
 <20200609172841.22541-2-dmurphy@ti.com>
 <20200609173143.GN4583@sirena.org.uk>
 <bb7cff87-f814-1b37-c9eb-e68919e3c077@ti.com>
 <20200609175852.GQ4583@sirena.org.uk>
 <414a2d73-6d09-1e76-59c8-4943c0e8f720@ti.com>
 <20200609184734.GS4583@sirena.org.uk>
 <014b85b5-677b-569a-4eb2-74526d3f00bc@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Content-Disposition: inline
In-Reply-To: <014b85b5-677b-569a-4eb2-74526d3f00bc@ti.com>
X-Cookie: fortune: No such file or directory
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com
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


--xo44VMWPx7vlQ2+2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 09, 2020 at 02:20:29PM -0500, Dan Murphy wrote:
> On 6/9/20 1:47 PM, Mark Brown wrote:

> > That's really not very idiomatic for how Linux does stuff and seems to
> > pretty much guarantee issues with hotplugging controls and ordering -
> > you'd need special userspace to start up even if it was just a really
> > simple DSP config doing only speaker correction or something.  I'm not
> > sure what the advantage would be - what problem is this solving over
> > static names?

> IMO having a static name is the problem. It is an inflexible design.=A0
> Besides the firmware-name property seems to be used in other drivers to
> declare firmwares for the boards.

> But if no one is complaining or submitting patches within the codecs to be
> more flexible with firmware then I can just hard code the name like other
> drivers do.

I'm not *completely* opposed to having the ability to suggest a name in
firmware, the big problem is making use of the DSP completely dependent
on having a DT property or doing some non-standard dance in userspace.

--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7gtf8ACgkQJNaLcl1U
h9CbrQf7B8RtgYmxR3DH0mpsVd3cVro2R/WpXyZk1PyY6j+8VLCYx2e1D8Qu0GJn
6nGhVdulQbM2keMV421wGC73yoAPvIU+UHrW8JdJLJ+Se2uhqZS7DPPjcdUJBmz6
pSt2frp+Jz4iNn+8bFV69Ubj7FoDB71r4wkSqprOW38aB7wNZOIM31mAf+hfn8ps
juyneFqACKwv4OctOdk3A3kK8UP+EQviWvR+EAG5kJIkznLGht+Fx9U5Li8fBXEz
IXv0w6uKhw919KWhtVQg+w2yLPCqDSopsIo7UGg9HJ/FXeVK4qgbXdpvQPo26H6m
Gc92N1Ej/OumXlfZArpAtbFZjNhDpQ==
=SvRr
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--
