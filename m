Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6823164910
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 16:46:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D8031699;
	Wed, 19 Feb 2020 16:45:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D8031699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582127175;
	bh=dMrXMbrs9gNU7fLzRfLtwAolv6etgSudzWhW2W2FRn8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eZvhuXlq06NpgcqBDEfwrO4ouerfTBRjFtR9uPkm07MptIuaMrPL5qSOviG+9Ud/s
	 yW80q+EOG8re0ThnhUIny/EZKuCUVFTeZQIpnoNmatF8DwUZdnwa2ee00LPGW5kHGC
	 FkNB8fpsAGoVTkdraDSVcvOTUdfRXV9TyuLRCt1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D66DF801F5;
	Wed, 19 Feb 2020 16:44:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6775F80273; Wed, 19 Feb 2020 16:44:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_30, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 59B53F801F5
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 16:44:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59B53F801F5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D0061FB;
 Wed, 19 Feb 2020 07:44:27 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5C233F68F;
 Wed, 19 Feb 2020 07:44:26 -0800 (PST)
Date: Wed, 19 Feb 2020 15:44:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 2/2] ASoC: meson: add t9015 internal DAC driver
Message-ID: <20200219154425.GD4488@sirena.org.uk>
References: <20200219133646.1035506-1-jbrunet@baylibre.com>
 <20200219133646.1035506-3-jbrunet@baylibre.com>
 <20200219145500.GC4488@sirena.org.uk>
 <1ja75ey4vj.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="JwB53PgKC5A7+0Ej"
Content-Disposition: inline
In-Reply-To: <1ja75ey4vj.fsf@starbuckisacylon.baylibre.com>
X-Cookie: FORTH IF HONK THEN
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
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


--JwB53PgKC5A7+0Ej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 19, 2020 at 04:27:12PM +0100, Jerome Brunet wrote:
> On Wed 19 Feb 2020 at 15:55, Mark Brown <broonie@kernel.org> wrote:

> >> +	/* Channel Src */
> >> +	SOC_ENUM("Right DAC Source", dacr_in_enum),
> >> +	SOC_ENUM("Left DAC Source",  dacl_in_enum),

> > Ideally these would be moved into DAPM (using an AIF_IN widget for the
> > DAI).

> I can (I initially did) but I don't think it is worth it.

> I would split Playback into 2 AIF for Left and Right, then add a mux to
> select one them if front of both DAC. It will had 4 widgets and 6 routes
> but it won't allow turn anything on or off. There is no PM improvement.

> Do you still want me to change this ?

It can help us track things like external amps connected to the DACs,
especially when we manage to get to the point of tracking individual
audio streams over DAI links.

--JwB53PgKC5A7+0Ej
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5NV9gACgkQJNaLcl1U
h9B1bggAg2Hke5eWreSl3h32yjHnSqSd3PP0FGDmBKiB8wwIidEnFIVCpcMesE/D
a6aM9T+fI+H0uiiAhroMreYDklRU+cJaTcDHBfEHMiTB7p8WPTUiGjUz8ZwqbmTM
rn93VmzRm+hGQj9oj6QGxUxpXQ2j3UKh/iXEa/SItvNP7/cGs/mPjpFZ5PLJjSvO
2glHbvcvqLgm54cNrHsC/Wx4LbpVMznw1dXRXNkzi4sWgcpBNwVm6Rph32EijKuE
W4klrGqOa2Oj0ha5e97b+cZbTONpIPgVrDfegcbcPf+EHsYevSyPS4Pzdk0mGNXI
36fS/u8fbsdVLyq3L89UxhOXP6vvMw==
=bIhx
-----END PGP SIGNATURE-----

--JwB53PgKC5A7+0Ej--
