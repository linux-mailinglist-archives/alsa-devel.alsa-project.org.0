Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85829839417
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jan 2024 17:03:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C32B384D;
	Tue, 23 Jan 2024 17:03:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C32B384D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706025812;
	bh=6iomC1fv6XGKLh/5wOuoJeeMuD80o9yncgsidbFuLPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RtmR6wAvVXdXheQt02ULtoCpTM2NeCPJWZT5tPHjAvaoLoQwK2YGAfA9WvaaG1+Ga
	 JqKJO0WajQJlxtgNdLpp4KQ27Ti4ZWqNc+aaUB3AaNZsE20hB3sOa8ZqyjmuH/CAAc
	 4fpjCyNUZBzDjdRO1WZXhj0Sp3/aTQOaELbhqL/A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59A7AF80149; Tue, 23 Jan 2024 17:03:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1675EF8055B;
	Tue, 23 Jan 2024 17:03:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 463B4F8028D; Tue, 23 Jan 2024 17:02:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3BA83F800C1
	for <alsa-devel@alsa-project.org>; Tue, 23 Jan 2024 17:02:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BA83F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JlFPkc9h
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4687061E2C;
	Tue, 23 Jan 2024 16:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9407C433C7;
	Tue, 23 Jan 2024 16:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706025759;
	bh=6iomC1fv6XGKLh/5wOuoJeeMuD80o9yncgsidbFuLPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JlFPkc9haUkscVMtVhapVvG6jz3mm5RZ2lNLMQhlD1+86UeJMJaqI55N9V0vLKhDw
	 8SJ5O2/qLzEVJXuWPFpG1OvnJCkYz5T/MZsr+7sgnE6X3jcYcQ2qJ4bFtx5M7f7VfB
	 Nd8X66vzboN900SwkbUmgr5sm0weT+qJukLW2GmxdcH4txTtH+A6KmF2p/+iSLdm+v
	 skGSO11YE0/JMP6Vl80Omwb+oP30YcJiDliuloOrum4AMUpML5Oz+pLHC6gbZrORXM
	 O9jGkSmNMp9KUnrTM6t2dtVv9X7SOX5GBKQt+3kNfyc2ZEU8ycNI0W9Cy+SK+bVZLZ
	 d09blVTbqdnnQ==
Date: Tue, 23 Jan 2024 16:02:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Seven Lee <wtli@nuvoton.com>, lgirdwood@gmail.com,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh+dt@kernel.org,
	conor+dt@kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
	CTLIN0@nuvoton.com, SJLIN0@nuvoton.com, scott6986@gmail.com,
	supercraig0719@gmail.com, dardar923@gmail.com
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Added schema for "nuvoton,nau8325"
Message-ID: <20240123-brewery-roving-b9ebc70468f4@spud>
References: <20240122095650.60523-1-wtli@nuvoton.com>
 <20240122-daunting-woof-19fac5689bb2@spud>
 <04945799-eded-42f9-b8fa-8907be44c400@sirena.org.uk>
 <20240123-bottle-elevating-9fbba5424014@spud>
 <185f3912-5a92-4ef2-aac4-0df8363d8727@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CZOKZjrI+J1e9HlH"
Content-Disposition: inline
In-Reply-To: <185f3912-5a92-4ef2-aac4-0df8363d8727@sirena.org.uk>
Message-ID-Hash: GZIJ4JIA7COJTMPZW32CE4HLCCZYTFT4
X-Message-ID-Hash: GZIJ4JIA7COJTMPZW32CE4HLCCZYTFT4
X-MailFrom: conor@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GZIJ4JIA7COJTMPZW32CE4HLCCZYTFT4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--CZOKZjrI+J1e9HlH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 01:06:45PM +0000, Mark Brown wrote:
> On Tue, Jan 23, 2024 at 08:34:03AM +0000, Conor Dooley wrote:
> > On Mon, Jan 22, 2024 at 07:40:51PM +0000, Mark Brown wrote:
> > > On Mon, Jan 22, 2024 at 06:00:14PM +0000, Conor Dooley wrote:
> > > > On Mon, Jan 22, 2024 at 05:56:49PM +0800, Seven Lee wrote:
>=20
> > > > > +    enum:
> > > > > +      - 0 # VDDA
> > > > > +      - 1 # VDDA*1.5/1.8V
> > > > > +      - 2 # VDDA*1.6/1.8V
> > > > > +      - 3 # VDDA*1.7/1.8V
>=20
> > > > I would also rather than this enum was used to have sensible values=
 for
> > > > the enum itself (which I suppose means strings here), rather than t=
he
> > > > register values. Seeing "nuvoton,dac-vref =3D <2>" in a devicetree =
is not
> > > > very meaningful IMO.
>=20
> > > Do you have a concrete suggestion for how to more clearly write these
> > > directly?
>=20
> > I would use what's been given as the explanation comments for each of
> > the current enum values in the patch.
>=20
> Given that none of *, / nor . are usable in defines that's going to need
> a bit of massaging...

At the end of the day, if it is too painful on the driver, then I'll
live with another enum. This is one of the worse cases of this sort of
enum that is clearly a bunch of register values, given there's not a
"nice" explanation for them.

--CZOKZjrI+J1e9HlH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZa/jCAAKCRB4tDGHoIJi
0rzSAP9jk8KYC7hIX1HdXqnBFVDfINXYg5zeasUhnLdvnkiJNwEA63S74iCvYyqD
L2y649pIe19v3rQ2TUGetH88CEsCxgI=
=VtcS
-----END PGP SIGNATURE-----

--CZOKZjrI+J1e9HlH--
