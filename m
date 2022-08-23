Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 230CB59DAF2
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 13:32:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B56A84B;
	Tue, 23 Aug 2022 13:31:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B56A84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661254366;
	bh=HMMDK4yYSV9hm8Y33k5jiYF0HqGibjiYVN4UI5136Ok=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o6mtv0ZRXHtMFAFKy6F9Gp5zhkIyYBPmL1tjWGcojylGj2NFJXzPXC+guBC3mj7lR
	 uU9/JQXdxp2/xD/MokuebfjPjlaOTw0oxDRJs/XpXV+8CWsrZCB6Gllhi26kadbbUP
	 TgUvgHuDEZpitnCkflydK4p07yG2DS1D6urb4o1s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAFE3F8014E;
	Tue, 23 Aug 2022 13:31:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D76DFF8020D; Tue, 23 Aug 2022 13:31:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0CC8F800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 13:31:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0CC8F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eSG6Rpwd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D6275B81CE6;
 Tue, 23 Aug 2022 11:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BC2C433D6;
 Tue, 23 Aug 2022 11:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661254298;
 bh=HMMDK4yYSV9hm8Y33k5jiYF0HqGibjiYVN4UI5136Ok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eSG6RpwdXQVjXqGGUGSzBgYYSjjWgqK6gbvzkYRyVINwqKx29HDxHMkUtsepj0ygb
 3yft+3n5uIaY8Y5eeUicqzMTKjtQcK7bRHoIPBupQLfMnxrnPiIyBu9OX/UlhF8PUk
 JEHGI4X+MfTcUjKGsdVdfhdBsWhqH2LFtgIHK+5AO7nO3ShU043O+AGhLEFMhf6Aru
 4LB2YHR6z3H4fpx5j1KJY81JhWuBMDNIviXWyyOi/ZsWvjBFECr0Z81DeqkdBmajhF
 KqGRo+AqloYIYMiEjXdSP9F2ovz5OC1MFpuf1v+Rss1/N6/WeaIQ2PesRpejZ0gcTa
 ouQUX241mStIQ==
Date: Tue, 23 Aug 2022 12:31:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [PATCH v2 3/4] ASoC: apple: mca: Start new platform driver
Message-ID: <YwS6lHeGH0BZKHeB@sirena.org.uk>
References: <20220819125430.4920-1-povik+lin@cutebit.org>
 <20220819125430.4920-4-povik+lin@cutebit.org>
 <YwO/aqs7eqZx07kS@sirena.org.uk>
 <24C0ABFA-BF71-4492-8A6A-E9BE1462B403@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NBQO/q/cbDr7E10q"
Content-Disposition: inline
In-Reply-To: <24C0ABFA-BF71-4492-8A6A-E9BE1462B403@cutebit.org>
X-Cookie: You can't take damsel here now.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, asahi@lists.linux.dev,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
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


--NBQO/q/cbDr7E10q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2022 at 09:33:36AM +0200, Martin Povi=C5=A1er wrote:
> > On 22. 8. 2022, at 19:39, Mark Brown <broonie@kernel.org> wrote:
> > On Fri, Aug 19, 2022 at 02:54:29PM +0200, Martin Povi=C5=A1er wrote:

> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +/*
> >> + * Apple SoCs MCA driver
> >> + *
> >> + * Copyright (C) The Asahi Linux Contributors
> >> + *
> >> + * The MCA peripheral is made up of a number of identical units calle=
d clusters.

> > Please make the entire comment block a C++ one so things look more
> > intentional.

> Is this so that it does not look like the SPDX header was added
> mechanically? I will do it, just curious what the reasoning is.

Yes, broadly.

> >> +	/*
> >> +	 * We can't power up the device earlier than this because
> >> +	 * the power state driver would error out on seeing the device
> >> +	 * as clock-gated.
> >> +	 */
> >> +	cl->pd_link =3D device_link_add(mca->dev, cl->pd_dev,
> >> +				      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
> >> +					      DL_FLAG_RPM_ACTIVE);

> > I'm not clear on this dynamically adding and removing device links stuff
> > - it looks like the main (only?) purpose is to take a runtime PM
> > reference to the target device which is fine but it's not clear why
> > device links are involved given that the links are created and destroyed
> > every time the DAI is used, AFAICT always in the same fixed
> > relationship.  It's not a problem, it's just unclear.

> Indeed the only purpose is powering up the cluster=E2=80=99s power domain=
 (there=E2=80=99s
> one domain for each cluster). Adding the links is the only way I know to
> do it. They need to be added dynamically (as opposed to statically linkin=
g,
> say, the DAI=E2=80=99s ->dev to the cluster=E2=80=99s ->pd_dev, which I g=
uess may do
> something similar), because we need to sequence the power-up/power-down
> with the enablement of the clocks.

You could also just do the underlying runtime power management
operations directly couldn't you?  It's not clear what the device link
stuff is adding.

--NBQO/q/cbDr7E10q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMEupQACgkQJNaLcl1U
h9DK1wf+JNGwnyOsdkMz+Zc28n5YvfvcyoQByI5EreszsWd//Rg/MxJpVjsrCXpo
JkHBVOL9QMhZ8SBrmK3cZ80OpwHBZ1HnME6vXezsk0QzgH7jWXLvYZmEMcXSP/zJ
8rGk+8LdxeZMvYEbi4xL1/gOSRgOEKO8GOtIQuRsGAiit8bCFL2ukdG+PUji4pim
ZuNY1Hsh+hSHSG4jJDA0QaYqRBMcbMgZW8RTNkWIr02A12ZEDDs4ESd4ckDoYumX
tdl+LCIGBJDYc9A0RIvRUfCTgEqKqyWHQvGtlN1Ia5Nyg7BCynhMJx9oGt2HDxVk
Uvg0e3pz0L9taZVPcOrYU5p07Q8omQ==
=8Yqm
-----END PGP SIGNATURE-----

--NBQO/q/cbDr7E10q--
