Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9C950A67C
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 19:00:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85A95163D;
	Thu, 21 Apr 2022 18:59:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85A95163D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650560443;
	bh=+kLX02+pvp0VAy7mZikCPZm3m+jcmFNycfkdqROEoG4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DmJuvbaP7FmXfng06zjK8Yt2ojj9Eh3OGucdIAZx3mnGBgpiIf4yRSFGvPtu8ZZ3h
	 EQ7IBtPABzE5yWIekl8WwXenIo2ouGXZHq1YN+XI2or/Uw61ViVjnQSEHynx24Tphs
	 biH+1w0jXqDonVGywEGxgTUlg8HvpvA+7KuiXY/Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEAF1F80526;
	Thu, 21 Apr 2022 18:59:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBA51F8051A; Thu, 21 Apr 2022 18:59:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66121F8050F
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 18:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66121F8050F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="W3SHqRLX"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C8CE561D99;
 Thu, 21 Apr 2022 16:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1578C385A1;
 Thu, 21 Apr 2022 16:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650560343;
 bh=+kLX02+pvp0VAy7mZikCPZm3m+jcmFNycfkdqROEoG4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W3SHqRLXFzShZFzr3y8krzbijHOnldDnMtuCLa00QdChMiuy1i4ZxmDQHLDToEZVs
 uLkKjUbQDKEo9gAWBIOSxVduMi9GFtbXCF9K0GyP8lyf8tjYtQtk1C7RA4V2VkmwnA
 iDlpWplntXOBBAvmzpsCiHsDb1f+qzCENxUUzez79+R71kn8SQAZoia12LIWfLkUQG
 Lf5zODhiJF6dc6Sh4cL7tKS/saLhylN5FBGNauYIXEY6LpEvrZODapz8vmT4nwwyJq
 sWhwTBF+RWkTpg4TPDgyi2uOMSBbByyYJmWvk5dmYz180M2wMXxvltygk4xCg4yhIP
 DIZzbg9ZbzyqA==
Date: Thu, 21 Apr 2022 17:58:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] Revert "ASoC: meson: axg-tdm-interface: manage
 formatters in trigger"
Message-ID: <YmGNUoOIHMDkciR8@sirena.org.uk>
References: <20220421155725.2589089-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3eyDRwkM/Maj7Zsh"
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


--3eyDRwkM/Maj7Zsh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 21, 2022 at 05:57:24PM +0200, Neil Armstrong wrote:
> This reverts commit bf5e4887eeddb48480568466536aa08ec7f179a5 because
> the following and required commit e138233e56e9829e65b6293887063a1a3ccb2d68
> causes the following system crash when using audio:

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--3eyDRwkM/Maj7Zsh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJhjVEACgkQJNaLcl1U
h9AZOAf+OjEB0rx20UWIL90pvczAy+XNaaircBEQ0cphHGKM9TrfcEbYFOlQm3qV
o6k6orFrbhYlVELViEbuHsjPrZVY3/NEowdMEK5eBwG1V3OdrLFDgSqKjpmRiWrX
eODgqxRNJ2U+7gBaBwJumlBUi2X0p5u5nVFlgvwmL87yKOl+Uom45nqL/ib7WMnM
VtrFfTZPgATIq/S98eN1SuswUtyYrtN7i7C+5Q7qGiIKKr067Vium6gBIliiLY19
pAT7lVyUEdDHWvNOrQdGveWoxe9Ospr+uvruoR8dGdp2BqC1tFXlrUHn9bm4S0Ai
AgQu/b0xjh2BW63QSFeG7clYApQUOg==
=5BRg
-----END PGP SIGNATURE-----

--3eyDRwkM/Maj7Zsh--
