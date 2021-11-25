Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 866D445DE46
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 17:05:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1534A18D5;
	Thu, 25 Nov 2021 17:04:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1534A18D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637856347;
	bh=KdhSkXjkdaP3MlPJHTn/Y5rldvqlD30vDk4OrRZDGKk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CEEdZNuV2Fi69qBe9XtobMCrH5QSRIx9eVtAzF72VuYKwDcRa2aV0+W/37/Fg8irF
	 Bf7a7tWAEttQlIb1yQijcYz59KaDIkoYeY++ht6LrUVyzKs0/HtlGfwUlfcz2asgYl
	 MMkroGkVX9+kPJZ3D6LbFvOT/SpK8QltwYbRn0ps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DD0EF8007E;
	Thu, 25 Nov 2021 17:04:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBFAEF8049E; Thu, 25 Nov 2021 17:04:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B8A0F80302
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 17:04:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B8A0F80302
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lt0lqCFz"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 39F0C60200;
 Thu, 25 Nov 2021 16:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637856255;
 bh=KdhSkXjkdaP3MlPJHTn/Y5rldvqlD30vDk4OrRZDGKk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lt0lqCFzS2OgfQbao/5lQKll2XYntB/PIV6jwUtWT0qBqf/hIz4IVt/mPVut2SyL9
 3A1gtB+ozJ4Ip4e7N4fCBK7aBbqGZljrGO7iCL71oMLftVpTrQsMxt63EQZjrakvI3
 EA4BB2njilar/v2O4ZYz6q2W1uppOkOC9RgeuoKMU3I4BLKL/N/gyI2OlxbIw3yBjR
 +LtAtY0Si3WewtPBtNh/R+diN370QEpwvlgPWLJi/7nvB2qwRf/bZimJltZj7E4G2m
 p1Qy9e92OFQGPIt4NEfNgECw4r66Ix4mXzTjmLMIXAFZuZElBD5sUQMyu0FSJvZXGp
 mcj3Zb7Rsq5Ww==
Date: Thu, 25 Nov 2021 16:04:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: Re: [PATCH v4 00/10] Add support for audio on SC7280 based targets
Message-ID: <YZ+z+XPyecvDJA88@sirena.org.uk>
References: <1635838265-27346-1-git-send-email-srivasam@codeaurora.org>
 <YZUT6BQKz00jXov9@sirena.org.uk>
 <e01729cd-0b2b-fe27-809b-c75ccbb6fac4@codeaurora.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4hRPBrvlJm1eOICO"
Content-Disposition: inline
In-Reply-To: <e01729cd-0b2b-fe27-809b-c75ccbb6fac4@codeaurora.org>
X-Cookie: This bag is recyclable.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-arm-msm@vger.kernel.org, plai@codeaurora.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 bjorn.andersson@linaro.org, agross@kernel.org, rohitkr@codeaurora.org,
 swboyd@chromium.org, judyhsiao@chromium.org, linux-kernel@vger.kernel.org
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


--4hRPBrvlJm1eOICO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 18, 2021 at 03:35:46PM +0530, Srinivasa Rao Mandadapu wrote:
> On 11/17/2021 8:08 PM, Mark Brown wrote:
> > On Tue, Nov 02, 2021 at 01:00:55PM +0530, Srinivasa Rao Mandadapu wrote:
> >=20
> > > This patch set depends on:
> > > 	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=3D57=
0161
> > > 	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=3D57=
2615
> > > 	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=3D55=
9677
> > None of those links seem to show any patches (or errors)?
>=20
> Sorry for Inconvenience Rob. I think due to it's status change patches are
> not being appeared on provided link.

I'm not Rob...

> With removing filter able to see patch set. Below are the links with view
> filter change.
>=20
> --=20
> https://patchwork.kernel.org/project/alsa-devel/list/?series=3D570161&arc=
hive=3Dboth&state=3D*

Please note this bit of the mail:

> > Please include human readable descriptions of things like commits and
> > issues being discussed in e-mail in your mails, this makes them much
> > easier for humans to read especially when they have no internet access.
> > I do frequently catch up on my mail on flights or while otherwise
> > travelling so this is even more pressing for me than just being about
> > making things a bit easier to read.

So it looks like we still depend on at least the sc7280 machine driver?

--4hRPBrvlJm1eOICO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGfs/gACgkQJNaLcl1U
h9D8cwf7Bff6TgE+WAzqNt2VB/K+kGas4TbADTHreLi1oEV1ONDQb+aKeV5FQXbl
mQi1ps0bNGYak+GLne3wYLWe+H6xJKlPKh7SssQDqoSSEhKxJvf0ZVivuhTlcKK/
IUTPJJBcnh6ftPjn5u8XJN9JWm2HMj5LgkG6itJZcK+/Au7RfpPmrCGl/+UYmfZc
IXZGhdIkk/k3g6ZK/+UE/gAtDfsznLHDNKQMU/wygs+j4vjF5vUhkt5HBAnksnrK
tr1LWGjemENfMvsTRfXtokbL39lJ4Ej9t1qz7qknJc02ZSuhUJS/8JBamgJpbtTH
GpCeSMkLRDocDDSSAjs9EnDjCS9FnA==
=8KsA
-----END PGP SIGNATURE-----

--4hRPBrvlJm1eOICO--
