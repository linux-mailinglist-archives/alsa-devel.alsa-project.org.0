Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4734425499
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 15:47:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28A6A165E;
	Thu,  7 Oct 2021 15:46:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28A6A165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633614433;
	bh=CzLXUpNEPe+Fc8D4lYwwX2ixsJtBDWtyruzWFlfomeE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ugO4IqLqQK8F5oKw7j1aLhRcMZtRzziCUdRpaame03O9yNMHakCq+kMp7gNZup4dE
	 yvvxAV/x06nlvmICCtD3OcwF+Xj23VwYvCAPoWYpjtKloykHzThhPDiDbhdUmFZ4/o
	 4D2fJdQbpPfjU6Ds/DSnN7W0eiSFqe/uF96K5nFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91A35F8028B;
	Thu,  7 Oct 2021 15:45:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47F59F8027D; Thu,  7 Oct 2021 15:45:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04C01F800F0
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 15:45:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04C01F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Cp/yQ+YY"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E466460F6F;
 Thu,  7 Oct 2021 13:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633614346;
 bh=CzLXUpNEPe+Fc8D4lYwwX2ixsJtBDWtyruzWFlfomeE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cp/yQ+YYegFh4JOVWZf2urVOANhRMdw83gJczirTSVqDvtLVaLXlg0ddDdNjuCR3V
 Hvc0MheowvxrzO36pEkvUNMBuupIyKILRvKHvCHm/f7jfFwltuLyNakC8gschlV58F
 RCh4SU28B2udGU5Wu/j0/+ayhvdDNKf1eG8t2LrDCzZUxl82xAQuta2A/HCYRmD227
 66xOEzpmSQoZycpSc00TpIaL0ATmTkXBh2xrJ7PxoEXzLiEDjjG26x+e1uohwtzto4
 Bv3Obpy2isyDcHITI8gfS1BKVMYLatzy1+u5dzQq4O2buus1y1zQh9c1DnUy74jMKh
 pSyKCw/EjIp4Q==
Date: Thu, 7 Oct 2021 14:45:43 +0100
From: Mark Brown <broonie@kernel.org>
To: ChiYuan Huang <u0084500@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: rt9120: Add initial bindings
Message-ID: <YV76ByQWKvKNOvF0@sirena.org.uk>
References: <1633396615-14043-1-git-send-email-u0084500@gmail.com>
 <YVw7vbpu4TS+7Su8@sirena.org.uk>
 <CADiBU39dvKS_a5FDgw9yMVFe8Uycn6bfjGwBWq+7MN_DdxkL1g@mail.gmail.com>
 <YVxFMaPhZdAFniMa@sirena.org.uk>
 <CADiBU3_TuHKiVG-r1TG-8WK_tW2GXi4VuqkidPwTyebOgE60OA@mail.gmail.com>
 <CADiBU3-4F-FdJxaa4Qp4xmUD3vsA=6u5_ojwDSr8zrDuW8JbXg@mail.gmail.com>
 <CADiBU38zCZk_P-q8BtbPfdeSacUF7LOvQYUFgvidbWZwcLY=wA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="KwxzcL8DXmUlXdOr"
Content-Disposition: inline
In-Reply-To: <CADiBU38zCZk_P-q8BtbPfdeSacUF7LOvQYUFgvidbWZwcLY=wA@mail.gmail.com>
X-Cookie: Colors may fade.
Cc: oder_chiou@realtek.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 lkml <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 tiwai@suse.com, cy_huang <cy_huang@richtek.com>,
 Rob Herring <robh+dt@kernel.org>, allen lin <allen_lin@richtek.com>
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


--KwxzcL8DXmUlXdOr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 07, 2021 at 10:44:49AM +0800, ChiYuan Huang wrote:
> ChiYuan Huang <u0084500@gmail.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=886=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:47=E5=AF=AB=E9=81=93=EF=BC=9A
> > ChiYuan Huang <u0084500@gmail.com> =E6=96=BC 2021=E5=B9=B410=E6=9C=885=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:39=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > > Mark Brown <broonie@kernel.org> =E6=96=BC 2021=E5=B9=B410=E6=9C=885=
=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=888:29=E5=AF=AB=E9=81=93=EF=BC=
=9A

> > > > > > I would expect this to be done through the regulator bindings, =
they
> > > > > > would allow the driver to query the supply voltage.

> > > > Please don't take things off-list unless there is a really strong r=
eason
> > > > to do so.  Sending things to the list ensures that everyone gets a
> > > > chance to read and comment on things.

> > After contacting our HW RD, to support DVDD 1.8V not just SW config,
> > also HW connections.
> > To get only DVDD supply voltage is not enough to meet the HW design.
> > The property seems indeed and need to be used by user's HW connection.

> > Can this property to be kept?

> After thinking, This property name may be improper.
> I think this change depends on HW external circuit for lowv application.
> Currently, I'm modifying the V3 change, this property name also affect
> the property parsing code change.
> May I directly change the name to 'richtek,dvdd-lowv-application' and
> submit the patch v3?

I still don't understand why you wouldn't describe this through the
regulator bindings, those exist to describe the physical supplies ont he
board and their constraints.

--KwxzcL8DXmUlXdOr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFe+gcACgkQJNaLcl1U
h9CxxQf/XLbUqCBWX7z5jeyDmyDvwzHIRGbjEWm8prqmKXOYerIrsa1wQAASMVIq
CUtmTRz779PvbCbSxbrV/3PWBvAU8f+ViQdCdma3TEn5TuCjhNczdySN+g1psMto
34MvNT+bJSyiaL6dXErgyXSEbbNAbbcKTVGe0he258QVMYefv3KfWoN98AG67cKM
pzKdjihlrgvzG8lXnxwOEcaKTJSsbsrSe9F+sUbUe9A9TWPP7KAouF6LGczYmdHE
0HyOYoqjFNg6fhVqJSHSRUv5qsBFUZdblgOv4W83CTzKARal9+K2aLuchHn50yla
03nh+5FcXTlNEvuuegJZGkhjwMQs/w==
=wb/1
-----END PGP SIGNATURE-----

--KwxzcL8DXmUlXdOr--
