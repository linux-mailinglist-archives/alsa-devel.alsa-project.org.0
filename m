Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DC5470647
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Dec 2021 17:49:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3966F20D9;
	Fri, 10 Dec 2021 17:48:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3966F20D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639154954;
	bh=6ULRFlF6ggAUebNwOsW20mMAGwZd17GitGH1nC/qLc0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q8EBsE+330YOrOtwnwrWCURwOW78c79gIcnapcmdLIsP2H2EuxRWjTWebwO8Gj+BJ
	 FdiG8RaA3ur9XFRYAFgaITMK88AnEEhdqF5fpZncM2BkB+QLolsXs9Ad2wdcOyzvJy
	 IL0qFOrEqBWjPEnqPnhM3Tq5TW6YomaKm3lx7lQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92A42F8028D;
	Fri, 10 Dec 2021 17:48:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54496F804EC; Fri, 10 Dec 2021 17:48:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 039DFF804E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 17:47:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 039DFF804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="S86sY7tC"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CC855B828FC;
 Fri, 10 Dec 2021 16:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41F41C341C5;
 Fri, 10 Dec 2021 16:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639154871;
 bh=6ULRFlF6ggAUebNwOsW20mMAGwZd17GitGH1nC/qLc0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S86sY7tCtmaIad9AR7OGz+bxVwKLFTNZr/3GJs5jBRVv+nc/sx/7x6ySIqhVjSfZm
 Ng3QoJfjsey7EeJ3Q/k3s2slWZmePliSrV5yI2rAbjZfHtVuoiyA1rSau0tXBA9O4y
 mD4/vN0vfpvOJ6WmzyR7iofd6YWoHyVcWuXIL4ykgKYtwgn9gJbHg5rBMzNY0RjgvY
 3tXtUhcitAmwbEPnSpg1PJNxc+2X4ZjvqFM+210itrQBzKoErD1tru2Ko899QRt/mt
 +D4G6vWmTtSH7zR8mD2lhkIqIHjk5EwLwlzO0+Q3UIZF8CD4z2aFP+OuS1/LvqvPYm
 srqPUpYR3dGzg==
Date: Fri, 10 Dec 2021 16:47:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Shumin Chen <chenshumin86@sina.com>
Subject: Re: [PATCH 2/2] ASoC: convert Everest ES8156 binding to yaml
Message-ID: <YbOEs4HCdJYA3j/1@sirena.org.uk>
References: <20211210151041.108751-1-chenshumin86@sina.com>
 <20211210151041.108751-3-chenshumin86@sina.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sZ83QS/cFF5Ofdsn"
Content-Disposition: inline
In-Reply-To: <20211210151041.108751-3-chenshumin86@sina.com>
X-Cookie: One picture is worth 128K words.
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org
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


--sZ83QS/cFF5Ofdsn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 10, 2021 at 11:10:41PM +0800, Shumin Chen wrote:

> +properties:
> +  compatible:
> +    const: everest,es8156
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: clock for master clock (MCLK)

This was optional in the code but is mandatory in the binding.

--sZ83QS/cFF5Ofdsn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGzhLIACgkQJNaLcl1U
h9Aywwf/bCaMMeg4FUrNaO8S3/ctSVTmAVyydCmnsYgPm74lkejOxnCZld4ngSK7
oE+sJqtPCCWgv0N4MFkJmjHZqmDQZGUDiLHhcmPnlNxoZcpH/hVGz9wk5EIEPn0I
xC7vilb8j6ps7H5g/y4E7JrcMt7Smb6t9l9WbcreLp7EWPGr342wW+ZJH7yNwbnR
nWvhSWlBgpRWfgywA52ZHNvEav44GA6UVJzamV2jAn3JRUrsEFI4sYBsMlxGv4Sh
/2wQiGJQA4hErHQAQIXR3P22YeSzQN2Q5jVmASJi3DRVqB6yLdWp3MNl6LQ4wgN2
Xb+mSBqCgZliigQPnFNdwPqSNjKHnw==
=o+40
-----END PGP SIGNATURE-----

--sZ83QS/cFF5Ofdsn--
