Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D406C838910
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jan 2024 09:35:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68CBF3E8;
	Tue, 23 Jan 2024 09:35:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68CBF3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705998920;
	bh=uu/UrPYghNR4U5sRW6Qlp+lVme52+r5hsD7sS1eyNRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l1stKuFjhnE1ldUAOMRCoHI6WFmiSUBZG7OBHEhXnGoKiH6GfEuUcET4xhamA0li8
	 inFVqOA0FgPRnsv+ijWOinSaQVk8p9M370SVD0pC2UiOryB+BVzBQfSt/Yvz+DVTHa
	 szC1zUkZlqrxaYM9hZREZcIDkk+sWkNtlge/pzOE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DABF1F805C2; Tue, 23 Jan 2024 09:34:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A00BFF805C5;
	Tue, 23 Jan 2024 09:34:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DCF1F805A8; Tue, 23 Jan 2024 09:34:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7340F800C1
	for <alsa-devel@alsa-project.org>; Tue, 23 Jan 2024 09:34:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7340F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TAdoutgQ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 39E04CE2E1E;
	Tue, 23 Jan 2024 08:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1C1C433C7;
	Tue, 23 Jan 2024 08:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705998848;
	bh=uu/UrPYghNR4U5sRW6Qlp+lVme52+r5hsD7sS1eyNRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TAdoutgQDyyKKbpsGXwgTTHcBPw+6PWfLQjVdyq0E1gUsEirKQQ4A0nfyTVk/ESzQ
	 3ChB6nqC+n0tExtnfEF4Ttz+qpuUDSmbL09JQkO93O74bBUHrE7S/K5HxT/pHoW3Ab
	 +44/wMQehcrbTaaiqvX1U+1iRpBXUP+ZCj8wCrleJWoWtSTBCmPuz5q1yLhJy4xY+Y
	 LiLItGt3vVIIuu8apfU6OXS8aT3G82I3zZabZhSrWfoYlAGsZf2jXB+hmYchU6PlsK
	 Hm+GApDiFlX1uLA8HU2DU2ZBSfGjmsPZSl3fFmB7gdnkY3MNuV+FvL1YnXHCRwQM0V
	 Zft539LpYjPOg==
Date: Tue, 23 Jan 2024 08:34:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Seven Lee <wtli@nuvoton.com>, lgirdwood@gmail.com,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh+dt@kernel.org,
	conor+dt@kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
	CTLIN0@nuvoton.com, SJLIN0@nuvoton.com, scott6986@gmail.com,
	supercraig0719@gmail.com, dardar923@gmail.com
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Added schema for "nuvoton,nau8325"
Message-ID: <20240123-bottle-elevating-9fbba5424014@spud>
References: <20240122095650.60523-1-wtli@nuvoton.com>
 <20240122-daunting-woof-19fac5689bb2@spud>
 <04945799-eded-42f9-b8fa-8907be44c400@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="K+axl3EeoQm3ZSCb"
Content-Disposition: inline
In-Reply-To: <04945799-eded-42f9-b8fa-8907be44c400@sirena.org.uk>
Message-ID-Hash: AS26FUJ2JWCQHEZM3BJ76EA5QDBLS2EN
X-Message-ID-Hash: AS26FUJ2JWCQHEZM3BJ76EA5QDBLS2EN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AS26FUJ2JWCQHEZM3BJ76EA5QDBLS2EN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--K+axl3EeoQm3ZSCb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 07:40:51PM +0000, Mark Brown wrote:
> On Mon, Jan 22, 2024 at 06:00:14PM +0000, Conor Dooley wrote:
> > On Mon, Jan 22, 2024 at 05:56:49PM +0800, Seven Lee wrote:
>=20
> > > +    enum:
> > > +      - 0 # VDDA
> > > +      - 1 # VDDA*1.5/1.8V
> > > +      - 2 # VDDA*1.6/1.8V
> > > +      - 3 # VDDA*1.7/1.8V
>=20
> > I would also rather than this enum was used to have sensible values for
> > the enum itself (which I suppose means strings here), rather than the
> > register values. Seeing "nuvoton,dac-vref =3D <2>" in a devicetree is n=
ot
> > very meaningful IMO.
>=20
> Do you have a concrete suggestion for how to more clearly write these
> directly?

I would use what's been given as the explanation comments for each of
the current enum values in the patch.



--K+axl3EeoQm3ZSCb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZa959wAKCRB4tDGHoIJi
0irOAQDRL7yl6C/+n2xvB8NKEx9GHhK0OMyyTPuFK8pZ7FzO0wEAh+Kw6TfejHXO
fxYlVmNXWliNfWXXjY1AtBaOaIKg3Qo=
=wpIP
-----END PGP SIGNATURE-----

--K+axl3EeoQm3ZSCb--
