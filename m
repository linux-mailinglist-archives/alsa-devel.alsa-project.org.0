Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCCB1BA36C
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 14:15:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37909169B;
	Mon, 27 Apr 2020 14:15:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37909169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587989751;
	bh=yGzhsU6WhWm7uamQy2CRWWpAW8P1mXU8LbyMHZ1Xkk8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GU8vS4k3Z2g+qSOiwyIhaikCXWPYeZ8W/IpteVLPno21DdFOK9k2+jzWgZY4FQYcg
	 B4JV4z2tJeoJpfjsqWNOXTC4RJdbRjvvwq66O3ZBBN9h7Iq1byJzbMSp/GNOpCTnD4
	 a8Fb7LWrbR97vP4pSZPADi2XNSh57YBEJxhkRf5g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52506F80217;
	Mon, 27 Apr 2020 14:14:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7C26F8022B; Mon, 27 Apr 2020 14:14:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E07EAF80113
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 14:14:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E07EAF80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cAA15cIG"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7107020656;
 Mon, 27 Apr 2020 12:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587989644;
 bh=yGzhsU6WhWm7uamQy2CRWWpAW8P1mXU8LbyMHZ1Xkk8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cAA15cIGfhTDviM32WxhxH4Hh0HAkfBnu4l1HNP7cuvmkoGYnafEZblFVU1gnicG2
 PcPRm4/rYzZlafSmiLQrgWmzCdnc+0b66R9DrHhx2+uyHJtAIAJhgeqi8Azoc+dmYJ
 OH0xnjQ6ZPpW3wbblrf0kej6S6EfW8Wi3mYOftHc=
Date: Mon, 27 Apr 2020 13:14:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Mateusz Gorski <mateusz.gorski@linux.intel.com>
Subject: Re: [PATCH v5 1/3] ASoC: Intel: Skylake: Add alternative topology
 binary name
Message-ID: <20200427121401.GB4383@sirena.org.uk>
References: <20200427111520.12076-1-mateusz.gorski@linux.intel.com>
 <20200427111520.12076-2-mateusz.gorski@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline
In-Reply-To: <20200427111520.12076-2-mateusz.gorski@linux.intel.com>
X-Cookie: If your bread is stale, make toast.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: cezary.rojewski@intel.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
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


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2020 at 01:15:18PM +0200, Mateusz Gorski wrote:
> Add alternative topology binary file name based on used machine driver
> and fallback to use this name after failed attempt to load topology file
> with name based on NHLT.
> This change addresses multiple issues with current mechanism, for
> example - there are devices without NHLT table, and that currently
> results in tplg_name being empty.
>=20
> Changes in v2:
> - added <sound/soc-acpi.h> include
> - machine driver name is now read from different field

As covered in submitting-patches.rst the changelog should go after the
--- so it doesn't end up in the git changelog.

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6mzIgACgkQJNaLcl1U
h9BGZgf+NETZ6FUopPy2Olqhoo9KcENfg42ZV6fmDySSU8m/nXJ+0BCy93M3mEqc
Y7AGoL3eHaM7F5zCB2EcD3WDcszkNcWwiqCPyGAEJ8TwC6xf7WN3+jotBrlU0AzC
V+DvpWOwZR2vpj7bUWR1Emig30R1S3Fb4RtJnBRAJ84zd+zFXMUvYUG4H0TCW994
+zvxzW0MONUzqnjq2nrn1AK9AHZZNIsf5N8n2TivgFd5YV4wV1ZgrARikRCMx2CK
+qBc+CXrbvvXoQ2bElC8UaGphcP7bRVK/2FLNTC+p9EEVUOFnqXNdYtUP2RvkTaK
MX8f4IgAhbKwB6Bgf928bU8jtOWBcw==
=HLKN
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
