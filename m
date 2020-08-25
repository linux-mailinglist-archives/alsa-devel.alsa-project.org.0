Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9162251C6C
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 17:38:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59B8B168A;
	Tue, 25 Aug 2020 17:37:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59B8B168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598369926;
	bh=Ax1keoZOXJyKLpCuadTSZZAlgawNptGR18bz0sLj4W0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QEim5Tn4wINy28x737bqjUV/eh9A/GG3l3xadcYD4/wBVge/OgvZ7Nja8kkAReAaB
	 yI5arW6YtI4BX4eAYx/uDpu1lWzIsAtxTteOPkLlmDAgeajrZ1Qtgb8mPGRX0OZ/zW
	 nilVuLSI3GNBr+L8wIrNlYWcKkoGmyBDnfKuwfEA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 685A3F800EB;
	Tue, 25 Aug 2020 17:37:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55F8EF80269; Tue, 25 Aug 2020 17:37:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C285F80245
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 17:37:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C285F80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oVAKxQ8B"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D327B207DF;
 Tue, 25 Aug 2020 15:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598369848;
 bh=Ax1keoZOXJyKLpCuadTSZZAlgawNptGR18bz0sLj4W0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oVAKxQ8Bq9JnGqLUhblEQ/Yd4eZ31GQZ5vWvwRhs9iGwLEO58toJk8luL6rNKxhS7
 TGOhpmFAXoEt8oPW70f7/eRjT3GWkpYHvtwfP9BVZRsJc4DpQLitmuaJ2iufQjlKWh
 hFIic9cuzZ5wYI7If9oLIrvhSmc+NjBYY7nHo/yY=
Date: Tue, 25 Aug 2020 16:36:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 0/7] Allwinner A64 digital audio codec fixes
Message-ID: <20200825153652.GG5379@sirena.org.uk>
References: <20200726012557.38282-1-samuel@sholland.org>
 <159776961932.56094.2705667823777375165.b4-ty@kernel.org>
 <20200824140334.6gflonflqju6g5ea@gilmour.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NY6JkbSqL3W9mApi"
Content-Disposition: inline
In-Reply-To: <20200824140334.6gflonflqju6g5ea@gilmour.lan>
X-Cookie: Don't get to bragging.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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


--NY6JkbSqL3W9mApi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 24, 2020 at 04:03:34PM +0200, Maxime Ripard wrote:

> > [5/7] ARM: dts: sun8i: a33: Update codec widget names
> >       (no commit info)
> > [6/7] arm64: dts: allwinner: a64: Update codec widget names
> >       (no commit info)
> > [7/7] arm64: dts: allwinner: a64: Update the audio codec compatible
> >       (no commit info)

> Ideally we should get the DT patches through arm-soc, can you drop the
> patches 5 to 7?

When it says "no commit info" that means the patch wasn't applied.

--NY6JkbSqL3W9mApi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9FMBMACgkQJNaLcl1U
h9CGrAf/YXOychvfLSo+ENlHR7yzKuh19qnN87y2Lr7ovM8T9KEI/c3beLUcDACp
J72jJsGTMJGt/fwCnwcTC/jy0rwD8eLuGuPI6KntFg/RjJ8QK41qoGw3GN55y2vg
N9Ifs2Hrwxg7sjiz587HR4+eY5xQ43elWgqmZhVAQ7fkKv+q8ZuCCvYDaA8Nh7vw
VxDutIQayldOP6Esdfc9BT2emqj7qN+WYJbjFW3Ex2uI+FunwnkdyhXanmfBd2S6
GIAuhhaGwET+OQZDVqjeF3K5M5Y5Na+2t2ZWAIB0jYuKi4U3ubb/KUP35mulEIRS
vJrbLkHUlnCT5Lg/yUpppEoEXh/hDw==
=Bh2t
-----END PGP SIGNATURE-----

--NY6JkbSqL3W9mApi--
