Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1807B455D20
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 14:58:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADE46184E;
	Thu, 18 Nov 2021 14:57:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADE46184E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637243903;
	bh=WyD60zF4TADv7Odqa4b6XduvB11Zc9zW6/nl4Y+HIfg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EDSmAjotASEEBcC/ld4FT9p7g2SOd5lw1cA3fSXjHdenp2/efsAWLcN3wB4jkNaTe
	 YB8EjNJFqoXuUswVnfP87GkQTOlXklnJF07kyLOq6LkwO2GeR5QqrFHdVNT+CQ8J+e
	 QGZ/UJ3wfModYvbkFB3nTjO+QUfu+oxxyT6OPmiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B0ECF802C4;
	Thu, 18 Nov 2021 14:57:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D8ABF80272; Thu, 18 Nov 2021 14:57:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F03BCF800FA
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 14:56:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F03BCF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KSNT3Nis"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C1AE61A88;
 Thu, 18 Nov 2021 13:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637243814;
 bh=WyD60zF4TADv7Odqa4b6XduvB11Zc9zW6/nl4Y+HIfg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KSNT3NisYQGLoK+k8jV9XStEAIBSLtOy3AwfJ3ZsSdbitcJgpSr45ucmlAkBoM1q0
 cFrD8wtYUSDxLvO76PmxuTmrsSpE2XY+lNKTGYAo9CEqBKa7/is0HSuNRXSDeIb/aD
 eVQyF3z5QqqpTDmPvF2q90VPMs2bKGtG8Zctjs5+JwqTOLA6gZVWXqJTcgo8C624kz
 +tB42/Jj7G5+Rdv4ff29qSci9IFMLFnYxf9KOiPuXOIAQzsmYWgFQtI0q5mU24jGRo
 aOlghhOy1yLc0genpTVf7xhF9rNw0rOF0XpMWGJMF18nVklg91gQEsVE1TYKEFBKDA
 CD0553Ou1FGlg==
Date: Thu, 18 Nov 2021 13:56:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Subject: Re: [PATCH 2/3] ASoC: stm32: dfsdm: add pm_runtime support for audio
Message-ID: <YZZboeQpqK8CwmL+@sirena.org.uk>
References: <20211118090035.5331-1-olivier.moysan@foss.st.com>
 <20211118090035.5331-3-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/HMgHyk9z9XITysq"
Content-Disposition: inline
In-Reply-To: <20211118090035.5331-3-olivier.moysan@foss.st.com>
X-Cookie: People respond to people who respond.
Cc: alsa-devel@alsa-project.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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


--/HMgHyk9z9XITysq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 18, 2021 at 10:00:34AM +0100, Olivier Moysan wrote:

>  	ret =3D snd_soc_add_component(component, NULL, 0);
> -	if (ret < 0)
> +	if (ret < 0) {
>  		dev_err(&pdev->dev, "%s: Failed to register PCM platform\n",
>  			__func__);
> +		return ret;
> +	}
> =20
> -	return ret;
> +	pm_runtime_enable(&pdev->dev);

Enabling runtime PM after registering the component may potentially lead
to a race where something manages to go in and starts using the device
including what should be runtime PM stuff.  That'd lead to a reference
not being taken that should be.  It's unlikely to actually happen but
it's better to be safe.

--/HMgHyk9z9XITysq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGWW6AACgkQJNaLcl1U
h9CLGAf/ZPgpWw+sUfS92Ur9sKBg2iJ8B0peY+lx9xIeWYpe4VUroAOLj1ZPvJGA
FuarngOZVU6HQb9qTBibk10pwkoYkyvH5g7wqCtj54sQQLx0TCD94mxFEx10ag33
/4WbSlYmxgC4W2xLr5acaPCaik8qm2qQMMaNIYLyZpFgPya1cSAxUnUC8FMr5erl
tctUP/CIoF7vBR+u+96lVB4BDqm0kQFGo8ftUg+h1kxf1gtEV/eD/Y1gCFZ1O/SW
6IN5K1ATFMZPHNUMkEpPLt23NCLinzdkxy2/eF87sj+gkDk+7fbgya/deQmu5oLL
0y++J0llhfmrUPbM25n7D//VjII/PA==
=OGhT
-----END PGP SIGNATURE-----

--/HMgHyk9z9XITysq--
