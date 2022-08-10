Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E535358ECBA
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Aug 2022 15:04:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83E6F1616;
	Wed, 10 Aug 2022 15:03:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83E6F1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660136655;
	bh=KEo510Q8e0tbmH4sUyO300IAYUCxjELa8Km+uTE+G+c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EqnQ67cpYinZlIoTzaV550BkMHyysrtS5I43+zSbo6bjawiR2QXuhDy4HfwvWh/Pc
	 z3GPoeihDVsesMfc8l3KHqiBSXzonF3mmkCY5PZOOxY+K411S1z0iLPlzG+VLqsrb8
	 vcRpz2VQRv0xpA8ZKfGK5MlYQ54rwnPH2E0Vaqao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AFA8F80240;
	Wed, 10 Aug 2022 15:03:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB62FF801F5; Wed, 10 Aug 2022 15:03:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77635F8012A
 for <alsa-devel@alsa-project.org>; Wed, 10 Aug 2022 15:03:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77635F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="NLRhoSg3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6AFEBB81C50;
 Wed, 10 Aug 2022 13:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0D1C433C1;
 Wed, 10 Aug 2022 13:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660136591;
 bh=KEo510Q8e0tbmH4sUyO300IAYUCxjELa8Km+uTE+G+c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NLRhoSg3aTjVlwWdBjWjzHMMYCUwoquU3fz/HOSoAZjSmkjLO2kJ0ZeF+Mnq9wNpV
 r2pNk3SnmohElHqnqAIdulAHn0CI/tdxVbvmDOaAfy/NzxxSEI1MWCIBYHoG4TPf30
 LKRS4g6ytnUR0d/KYQt+uOBD5tJg8f7phEM1xpUAOD+YEsnnHFYleKfDBSymyAxhzg
 QElNhOqYuazO+M5jRYlSd6f3OLCPVcLUXgtkdQ+cNdno5VJZfTfzfIBkKZo4VmPiB9
 NO7BYtUOSLrMTO4x9FX/amMfukKtnO2/li1UkIyeJUThdGUVvleyaEhosPZzpoRV7e
 CjuoR130OX1ew==
Date: Wed, 10 Aug 2022 14:03:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Matt Flax <flatmax@flatmax.com>
Subject: Re: [PATCH v3] ASoC: codecs: add support for the TI SRC4392 codec
Message-ID: <YvOsirpEN7uG94lz@sirena.org.uk>
References: <20220810013213.1544645-1-flatmax@flatmax.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Jy10xczsLwIhtrtD"
Content-Disposition: inline
In-Reply-To: <20220810013213.1544645-1-flatmax@flatmax.com>
X-Cookie: First pull up, then pull down.
Cc: alsa-devel@alsa-project.org
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


--Jy10xczsLwIhtrtD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 10, 2022 at 11:32:13AM +1000, Matt Flax wrote:
> The src4xxx keyword is used for	future capability to integrate
> other codecs similar to the src4392 to the same	code base.

This looks good.

--Jy10xczsLwIhtrtD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLzrIkACgkQJNaLcl1U
h9Bp1ggAhkW88FrmY/2MvaC9nmibGMTzbKUvU9BJ2T06NsW9P4gWLLJ1Upa5dUBE
o5F9InDSrvomjSX/KPAIod/exZK7DSrLldtw1SVbuuiu6fQpBbLCUWsl4xRD5N31
Pm4oy0rNwQJGqiHZGGKPN6EcADSKjquKkg5sdhHQat5SRJm/NPVvjWbdd17YxBpd
aZjYG1YQ0YK2nhOvctqVt8uCW8AvQeHeoU+POSRaEys24svEnnxDAWgfoVPTJUuB
nqiFZrdmiZYFJow3AG0Cpqsp/Nbz8KaIDlUU1efk01IjIHX0gMnl9XXbUDq+OI4F
oOCYbIp9RBkpeyukZDUanCaKIiRwcA==
=PIGP
-----END PGP SIGNATURE-----

--Jy10xczsLwIhtrtD--
