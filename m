Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0874A21ED46
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 11:54:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1E8B1673;
	Tue, 14 Jul 2020 11:53:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1E8B1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594720452;
	bh=69NDwPfEkbnCl+IKo1KaYa8NHEQkLg8q/hcElxsnFJM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=myUzNCdpcYJ2Pj1xh0L0UZd6/5fv5oq7CKghBciJmTbTNKt2j+PhG/wg3+jGbhEFp
	 BnAPqvehBhSkWltA4R5UGPaMSDVMUQ8daxpnF4Ufh01cf8XfYu8CHG7yBg/H/fvDFQ
	 SUlYVvM88u/Gbz7sBqXaFc78CwVZcj+fhnzEd3uQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D447F8019B;
	Tue, 14 Jul 2020 11:53:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0CC1F801F2; Tue, 14 Jul 2020 11:53:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BB1DF8014E
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 11:53:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BB1DF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b4S3d/Cp"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B50DD20EDD;
 Tue, 14 Jul 2020 09:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594720388;
 bh=69NDwPfEkbnCl+IKo1KaYa8NHEQkLg8q/hcElxsnFJM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b4S3d/Cpg/SKJZaLtxCRtdwqV5R+4hYj1NBblToFHsT2iKgKg7o6lDZaJdoaFwGDB
 YMjhQ6hyYwLYhwntegIrVyCLl1RkVr/LLUoSutGgg06I7ETTTHTvEwd5VW6DAEDgV8
 nkw33EMoPHD/WMF7+Ij0eHGWTVzqvo2vM4TIZBIs=
Date: Tue, 14 Jul 2020 10:52:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: ASoC: Convert UniPhier EVEA codec to
 json-schema
Message-ID: <20200714095259.GB4900@sirena.org.uk>
References: <20200623114005.791643-1-yamada.masahiro@socionext.com>
 <20200714022252.GA1151466@bogus>
 <CAK7LNAQrdqztMrHtAHnbMkxeaDLLyBS68WVovev+zytHdD7RVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Content-Disposition: inline
In-Reply-To: <CAK7LNAQrdqztMrHtAHnbMkxeaDLLyBS68WVovev+zytHdD7RVQ@mail.gmail.com>
X-Cookie: Your password is pitifully obvious.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Rob Herring <robh@kernel.org>, - <alsa-devel@alsa-project.org>,
 DTML <devicetree@vger.kernel.org>, Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
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


--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 14, 2020 at 03:13:26PM +0900, Masahiro Yamada wrote:

> What do you mean by Reviewed-by ?
> Do you expect this to go to the asoc tree?

> I just thought the schema conversion
> would go through the dt tree.

No, bindings changes usually go through the subsystem - if there's any
other work on the binding then it'll usually also involve driver
changes.

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8NgHoACgkQJNaLcl1U
h9Dsrgf/fPLrNlqqgRY19cFoFt6CgtBbNO86y/JcGKXNAdFdJ5lG9scZL2Rgzas/
0/YpfGyCQAOMGEWc5Icxjhcj+geFRr+aqL7mtvz4XT+Wv0I0VSWeCdVEeoYcFUpV
/J6PxuLhaOhAKkcKcm0UNz+dI5TmhySRUnB97ikprAPWs498y1c0otugjbP9hClu
nhkI6a7K+OtE/t21oN80kQzqNGfaMgai5G3t0kZ7knfmJqyXanwYZLUWxZuBueoR
4CDY9eOE/jaTkLyIerbibswcLl+MYv/L/jkh3Jmd3v1xmDNailW5yjE/TsZvc5E+
RUaalfr2073gZqSDnJz9e1PoPrNzzA==
=+jbC
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--
