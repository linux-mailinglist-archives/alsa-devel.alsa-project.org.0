Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CA17AB912
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 20:22:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29536BC0;
	Fri, 22 Sep 2023 20:21:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29536BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695406943;
	bh=SJcH9WWUC7b4icS4mYzsgIi5682dqbrCHyF82Gm43a4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZmkwiA4INiC2wczGrB0S3uV299YuCdllKE9J4j+z8Kjr9UJPqLi5gDKdrU4kOY/TK
	 QQvQW67PmRMeVYJ3ufhlnYjUtrMujhg3a9s0g+R3WqYG2cerobBedVpNjru7qFsZtc
	 QkfBq3vE+QFB4H40MKmcyYoNOBbNcr6mgV+AnEOE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B0E5F800AA; Fri, 22 Sep 2023 20:21:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE21AF80124;
	Fri, 22 Sep 2023 20:21:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C2D4F80125; Fri, 22 Sep 2023 20:21:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05EDEF800AA
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 20:21:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05EDEF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=d8gs3/mY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C9E1462349;
	Fri, 22 Sep 2023 18:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E29C433C7;
	Fri, 22 Sep 2023 18:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695406880;
	bh=SJcH9WWUC7b4icS4mYzsgIi5682dqbrCHyF82Gm43a4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d8gs3/mY6Sf+oS/SUeaP2Jr42tQw1grzspJHmvAh0xv4/+drpEjIlsXppZcRi7KdK
	 H1xlDY+5Jmqc350YgZ7s6/KjEMpRr+IuBZ72LbFd9JXI1PEgD+32dQcBfMFlOg6StE
	 eJVTLbJwx0SQxQIYCQEBuN98pStC4Aw+jowy/I8t8vTk84nQXTJckh7RvlU2XicOa9
	 6rfz7Ywp5RXslfiTwqe3jlbCfReheshhS0PhfbfYGj4+umuwO5qtaRnb/kF1jNEmuR
	 3jRzhBYdCS86IkHBLADgzu6gsL2OujwgGAGNPW9myq2JtxWCGAFWKgliszWbwcFz8a
	 byzboUiwmGsuw==
Date: Fri, 22 Sep 2023 19:21:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: tfa9879: Convert to dtschema
Message-ID: <20230922-scoreless-battalion-8b33e36066eb@spud>
References: <20230921183313.54112-1-bragathemanick0908@gmail.com>
 <20230922-unmindful-anyplace-f1da73ab168c@spud>
 <c6f795f1-2832-c282-5819-f8f402a312bd@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rF2zpNVePdlmTHic"
Content-Disposition: inline
In-Reply-To: <c6f795f1-2832-c282-5819-f8f402a312bd@gmail.com>
Message-ID-Hash: MGYMJAIVEU3OJOKQCJ7ATSQVWRWBTLEJ
X-Message-ID-Hash: MGYMJAIVEU3OJOKQCJ7ATSQVWRWBTLEJ
X-MailFrom: conor@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MGYMJAIVEU3OJOKQCJ7ATSQVWRWBTLEJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--rF2zpNVePdlmTHic
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 10:53:06PM +0530, Bragatheswaran Manickavel wrote:
>=20
> On 22/09/23 20:56, Conor Dooley wrote:
> > On Fri, Sep 22, 2023 at 12:03:13AM +0530, Bragatheswaran Manickavel wro=
te:
> > > Convert the tfa9879 audio CODEC bindings to DT schema
> > > No error/warning seen when running make dt_binding_check
> > >=20
> > > Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.co=
m>
> > > Changes:
> > > V1 -> V2: Fixed DT syntax errors and doc warning
> > These should be under the --- line, not above it.
> > Perhaps Mark will change it on application.
> > Otherwise,
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> Thanks for reviewing it.
> Do I need to send a new patch by addressing the above comments ?

To be clear, it's the changelog, not the sign off, that needs to go
under the ---. It'd look like:

Signed-off-by: Bragatheswaran Manickavel <bragathemanick0908@gmail.com>
---
Changes:
V1 -> V2: Fixed DT syntax errors and doc warning

Mark often fixes these things when he applies patches, but sending a v2
w/ the changelog fixed might make his life easier.

Cheers,
Conor.

--rF2zpNVePdlmTHic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZQ3bHAAKCRB4tDGHoIJi
0o6LAP9Vq8grg9fJf5i45dQtQG833qk7XMbr9PXVfnfcitVhBgD/b/LHnihKc99a
Ei0JpNNTNhBFWQLwjwosqqdeiWJJFgI=
=xq4J
-----END PGP SIGNATURE-----

--rF2zpNVePdlmTHic--
