Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC4459E68E
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 18:05:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0924115E2;
	Tue, 23 Aug 2022 18:04:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0924115E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661270710;
	bh=fYdMfktNKHFq24X7NJ8h8EJKjeWjNqBelu68P9jBtBY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PYq86MHIlntCxYOoClIL4uHclQLfuPaRgt07WAzr2UNlqdHQ1SjuNhK0H2TQM+61d
	 MkB9vQ4WEarNqHuywJl5tWTWDKYsF9dMvOviwpXssW2NrzSwLEr/h9motRURkU+141
	 aobRWVq9fd+XaFjxYmpjN1e05eADSQs8/8wI70dA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 649E1F800A7;
	Tue, 23 Aug 2022 18:04:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2752EF8020D; Tue, 23 Aug 2022 18:04:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBC14F8014E
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 18:04:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBC14F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BAW4lBiC"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8B32161626;
 Tue, 23 Aug 2022 16:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 641F5C433C1;
 Tue, 23 Aug 2022 16:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661270644;
 bh=fYdMfktNKHFq24X7NJ8h8EJKjeWjNqBelu68P9jBtBY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BAW4lBiCfcbfYLEylH3hcpXAnmDCtoBdyBanrOxql8kD4MtOvJ1E1HFFsyQbkrw8m
 vZwB+UMExBUJ6L9YKSaiIZTNl13g2LQS13aNsBVKw22iHh9tFpgsLwhGZ3vdH39ekm
 svEvl/cH0iZV/Qni1KD765BMuDN4qdXCzFG2+9ou8s6o7Ap6vCKhcwy0d4LsB0u8yU
 DEEOoUSULNex09GO3DoskZaoGwpPPyK4fL0KqLKqTRQUIDcYL2SZVdUEjx64y89QSW
 v5GXwt1lj0qduhAy43VsgvuRxvkuQyZUz4Mnx4nHZoBYYjp+6nJr/qahmgrNINyInX
 jfm4j/9pkNAoQ==
Date: Tue, 23 Aug 2022 17:03:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] ASoC: mchp-spdiftx: Fix clang
 -Wbitfield-constant-conversion
Message-ID: <YwT6bmqeBeoYcRi7@sirena.org.uk>
References: <20220810010809.2024482-1-nathan@kernel.org>
 <166058059542.769843.4941839393289864947.b4-ty@kernel.org>
 <YwT0oUjo/lzBDRdH@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bRD/piUAUlQcMCKB"
Content-Disposition: inline
In-Reply-To: <YwT0oUjo/lzBDRdH@dev-arch.thelio-3990X>
X-Cookie: You can't take damsel here now.
Cc: alsa-devel@alsa-project.org, llvm@lists.linux.dev,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Tom Rix <trix@redhat.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
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


--bRD/piUAUlQcMCKB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 23, 2022 at 08:39:13AM -0700, Nathan Chancellor wrote:

> I noticed that this was applied to for-6.1. I know you do not rebase or
> change your trees so this request might be rejected based on that alone
> but would it be possible to cherry-pick this to for-6.0 so that it can
> be applied to Linus's tree quicker? We have had to apply this change to
> our CI to keep our builds green in mainline, -tip, and 5.19/5.15 stable
> with clang-16 due to -Werror. If not, no worries, I should have made it
> clearer that is what I was looking for with the subject prefix.

Hrm, OK - it's a bit surprising that this didn't get fixed in -next
before the clang change made it to mainline TBH, it looked like
something that had just hit -next.

--bRD/piUAUlQcMCKB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmME+m4ACgkQJNaLcl1U
h9DGGAf9FQ1B6+3Dfsp8LkqcAvNpYaPcgLbadzxOSiNhCz3nKbqjHeLn7qgXzCSi
ZsLpU8FfqcWvIzvDuDUt/lAFh2GEDS04od0HLNJ81imVRVaywR9qlc96Mpm+Ist2
Cz4yEkb9Ydw0kZCXXehsIPlCFtNVu5AKKHJJpgn6YFFjem/IMkeKrftmsIsMoQ6F
bfS+p2h7dJVYPOpEWSm3wAr2zrknfATV9SlDJcHqGd1E5GiKi3s3flgUpip2qHaX
g62kCwtHXs14FD+lbhUmIw3YxQyRrfQYXMosmDoNlvl7SahsauyoeRxgh3bCR0vk
GGUbcahF77/1Pzn+McWxNTRucJ2ueg==
=Xfht
-----END PGP SIGNATURE-----

--bRD/piUAUlQcMCKB--
