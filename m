Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 156CF50A6FC
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 19:22:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62D7D16A0;
	Thu, 21 Apr 2022 19:21:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62D7D16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650561729;
	bh=WuG3mEg/8lhQCajKRUfY5lcdr1UBJIgbvl5qAQTm+EY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LuVW1/m3jpfoCyQaKv1LtTyh7Tv3I0MWKYBhfIsAKA8ifnb/UXoD1HrPK601+PclX
	 znSIEfiNmiHIi6to3M9C6uwdRm0rdkYdUAryq6nyQbxI856telcs6uVQ0oadEGsyyz
	 F7AnhbN4KC5hSlsG++nZr6Fy1xZFp2X9tybZW0us=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C29C3F8047D;
	Thu, 21 Apr 2022 19:21:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E679F8032D; Thu, 21 Apr 2022 19:21:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA2DCF800F4
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 19:21:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA2DCF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QgU9T0yP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AD933B827C0;
 Thu, 21 Apr 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1DE7C385A1;
 Thu, 21 Apr 2022 17:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650561662;
 bh=WuG3mEg/8lhQCajKRUfY5lcdr1UBJIgbvl5qAQTm+EY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QgU9T0yPDN+B9ndtK6XGBtJz7BOCT2pQGzZtRilym1TB1fF1H4OfAvk8ixGMBldhD
 86IQupGzW9mQTW+UVdMOlzVM7RmIPhHD0b6dv+3KPDS40b9sfIjHGVbzKSzJ9EdANb
 fLYYUIP0IaXf/QvH2/ldBkPA5M0Gs5/d8L5iuiSArtxtls3b0yrQFhAOzFk68CFvLl
 Dk3+HdS8UhgbFXkXTmrlo6etqzcQw/WWk9PmRKH34oE0inbVTSJpxCSJ38tPxsmvDO
 d/jiuaRtBv5NGu31Cb2qpMvODgvEE/uhTA5++8pGrHhoAKqytXxixnsX8z4l/lrqGi
 p9huEZboOlSLQ==
Date: Thu, 21 Apr 2022 18:20:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] Revert "ASoC: meson: axg-tdm-interface: manage
 formatters in trigger"
Message-ID: <YmGSeVbwWtyHP/Tz@sirena.org.uk>
References: <20220421155725.2589089-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IrsbsSdYKQuD+rKo"
Content-Disposition: inline
In-Reply-To: <20220421155725.2589089-1-narmstrong@baylibre.com>
X-Cookie: Two percent of zero is almost nothing.
Cc: alsa-devel@alsa-project.org, Dmitry Shmidt <dimitrysh@google.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
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


--IrsbsSdYKQuD+rKo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 21, 2022 at 05:57:24PM +0200, Neil Armstrong wrote:
> This reverts commit bf5e4887eeddb48480568466536aa08ec7f179a5 because
> the following and required commit e138233e56e9829e65b6293887063a1a3ccb2d68

One other thing - these should be Fixes: tags, that helps tooling figure
out things like backports.

Also:

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--IrsbsSdYKQuD+rKo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJhkngACgkQJNaLcl1U
h9C8Fgf/VidmSJ2cMNCtprev2dZXNKdvl5hp5ru5Oetxz+eMGSCdPjKGw4OW35Dc
mj7OuaoYqZ6+1sHDdYhwtY5rpDGBpxXsRrLLun3ddBp6SrgFIFVZH4hUWAljayN4
eLXEOdvmlTixcnKoGgvEnl7FxldrV3Ojvi6VixOhXWTpDPo3dlj1BoJvHKvU5rsr
A3Iip2GOibnZvUxLfzblfBzGs6jg7kAdUF19GflvFDoSNtCMJ2O/lAULE6QUA8CC
+dkIBIWWJCHsGgwtaRPfridNv0z1gHS+gWQOxb1F8MM7zWcoVqHg3FQBNm+pRVIX
DL2OPncZcm5/LpBtB0O7NM88PFr70Q==
=JmF7
-----END PGP SIGNATURE-----

--IrsbsSdYKQuD+rKo--
