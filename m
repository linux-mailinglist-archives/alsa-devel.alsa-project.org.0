Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6824155456B
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 12:55:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15FBF1AE8;
	Wed, 22 Jun 2022 12:54:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15FBF1AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655895310;
	bh=G4XroPUQxa6e/wOY4UG53P8PsXH1RZHdojRCRxtIFkk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B6dNta+HnzbMFwLdCnh3FSmAK5NfRzbE9YCpJZFXaw4UT7XpDkikptwu06jM6RhQf
	 KEXgFktUk+k0GYtLMp5WLwH1XxIEwu75WXJbFhO1F6tsZmPMPZ0nGqgcQ9Gb7T5BDd
	 y4xOBlqbmqfodKc6VD+8d5sjGpL6LrHSf+UIKquM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1E27F800CB;
	Wed, 22 Jun 2022 12:54:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D321BF802D2; Wed, 22 Jun 2022 12:54:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B9FFF800CB
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 12:54:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B9FFF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rYovtcRP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 644DA61227;
 Wed, 22 Jun 2022 10:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C635C34114;
 Wed, 22 Jun 2022 10:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655895241;
 bh=G4XroPUQxa6e/wOY4UG53P8PsXH1RZHdojRCRxtIFkk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rYovtcRPdYqEUX1Yg7P6xGKNzlkeHiuI8UBV2EJsEeVSqkz0989+AH4S/1o3VfUC8
 p1UFB8Ycr54oZ2Y5Mm1LPKyXTMD4CIf+bp13SgdufvpiqCqGwLhwFsAkuOlPHxMTvf
 g/j3fKfAf+oQ805lgMLxegAaE2H3V3ujhgKbdzLm1brWB0sxgkBufBup+s/QNjG13J
 yM/h1pNKs7fLedLBxqkk2Oze5iTqBXWbXJW8nR+OMZY0RTRc1WSwr/EeVuvXUn9gd9
 WiQkL/7orpicNW2QwOWP9tSsMxrhB2e/RWtwyvL/M/yOy9Cl/qMjjTUToUCLuNvNR9
 y3NeBX07/dQeQ==
Date: Wed, 22 Jun 2022 11:53:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Subject: Re: (subset) [PATCH v4 0/3] ASoC: rockchip: i2s: switch BCLK to GPIO
Message-ID: <YrL0wzzfeQwmyHfK@sirena.org.uk>
References: <20220619095324.492678-1-judyhsiao@chromium.org>
 <165583076931.271995.9857794745310978104.b4-ty@kernel.org>
 <CAGb2v66+ZjKFvCfq-H3F_ZdyxiKHY6=7juhSCmHPK3o8kgw+Og@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4AruQWY53Tdw7RRr"
Content-Disposition: inline
In-Reply-To: <CAGb2v66+ZjKFvCfq-H3F_ZdyxiKHY6=7juhSCmHPK3o8kgw+Og@mail.gmail.com>
X-Cookie: Truckers welcome.
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, briannorris@chromium.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, wenst@chromium.org, judyhsiao@chromium.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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


--4AruQWY53Tdw7RRr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 22, 2022 at 01:58:40AM +0800, Chen-Yu Tsai wrote:
> On Wed, Jun 22, 2022 at 1:00 AM Mark Brown <broonie@kernel.org> wrote:
> > On Sun, 19 Jun 2022 09:53:21 +0000, Judy Hsiao wrote:

> > [1/3] ASoC: rockchip: i2s: switch BCLK to GPIO
> >       commit: 44f362c2cc6dd0c5e3cb499c4fb4ed45b63a6196

> Seems you applied v1 instead of v4?

b4 will reply to anything it knows about that thinks is close enough to
something that got applied.

--4AruQWY53Tdw7RRr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKy9MIACgkQJNaLcl1U
h9COkgf9HKKAvRzjNs2p5CEqeFNtnVzhD95omRkCIyXAyPgMzsXQ86HrXzkr7Qf6
6aty2J1RMF1ryi1b4Jw+B8DfhbDCjmS9nB7H4IV/GlQCmkoUzbFmCdf8qSPLuQNk
bVTyLRDSCh0FUFJXvc894JrLpg1DkjGqfTKmT3OWmAENtixWknby7elcr+CnNAqM
hZujXhxdwazBRH5RtQLO+z8cMOnLgpEWoklHTmzsPrW7EPGMzgBaCbFe4fNac1oI
teB7zkGZqX242LJoeBs9m/yIzPhQYGBAtAie5witncajUnxnAFaWx+Zrbr7PTGci
LOU8M7FkgC0tpcUbs+Eec0tfnEZLsA==
=nzIr
-----END PGP SIGNATURE-----

--4AruQWY53Tdw7RRr--
