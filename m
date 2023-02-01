Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 096CD686973
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 16:02:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C1C2839;
	Wed,  1 Feb 2023 16:01:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C1C2839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675263726;
	bh=YmsUF8dYyS1t9iHkHZl4QyzCYaAaEk1KI4sRfdsRaIg=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=piCDn4Xi2bCK51DC2MuWGsGemVb2+vz+x1GA5yujcDLIBjwOBqEQ7DKh6BQFYkMIw
	 xPCiJENsZCPoXbgUtzUmbtqqKSW8McWwGwxW2TMUA1kDIPaTFSSQV5XfOKFWvZshGM
	 6C3CrohJUfdnkDExdlbycJR93M56pfnmpZaN8PdQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E189CF80155;
	Wed,  1 Feb 2023 16:01:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62432F80423; Wed,  1 Feb 2023 16:01:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B4E8F80155
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 16:01:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B4E8F80155
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uWU/uBx6
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3A9CF6179C;
 Wed,  1 Feb 2023 15:01:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699B2C433D2;
 Wed,  1 Feb 2023 15:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675263660;
 bh=YmsUF8dYyS1t9iHkHZl4QyzCYaAaEk1KI4sRfdsRaIg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uWU/uBx64dGc2xdxP94hbFndKoMOooiLvGJW9syKl5VW9CNhcBGfe7leZ3+USFgBz
 END1RF7ldrpYmDuxzDaiVcl6IPJ5pG9QQ53bx1raIxWCcQDSxdCpDsa6rssURWBx4e
 bmLZbMGPyovn5XkJpVagXH4LHEqA26B+k55d0yAn5S9Bdbc3rMwlI5PXi9yqc3QPWt
 1PlU3MdR5rEhCNKRaOyca1wGW2JCQ/cV0KO634+pEjX3Bqgb89r47NsWW97LSRSIpp
 GZGUqfY++Cvcb1L2sVUcukcpP72lKIVYac2xVj//PRSeeF3lXLJk+e2Pvl8LawP++J
 cIUrK0SftDKPA==
Date: Wed, 1 Feb 2023 15:00:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Drop broken irondevice, sma1303 binding
Message-ID: <Y9p+p6wt8WugDBuH@sirena.org.uk>
References: <20230201131059.65527-1-krzysztof.kozlowski@linaro.org>
 <1bcd61d6-810f-1239-1b6e-367e0fe87370@linaro.org>
 <Y9pxGUMWyMeXQpZM@sirena.org.uk>
 <6491d6fb-2a10-1c80-d422-8300d5a75ce4@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qLcimmkhW1yYyJm9"
Content-Disposition: inline
In-Reply-To: <6491d6fb-2a10-1c80-d422-8300d5a75ce4@linaro.org>
X-Cookie: Oh no, not again.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kiseok Jo <kiseok.jo@irondevice.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--qLcimmkhW1yYyJm9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 01, 2023 at 03:43:12PM +0100, Krzysztof Kozlowski wrote:

> I tried. I started writing patch to fix few things in this binding and
> then noticed that it is entirely empty and documents nothing.

I really don't see an empty binding as a major problem in and of itself,
we can always add properties later.  Again, I can't tell what the
problems you're seeing are.

> The trouble is that soon you will send it to Linus and then it becomes
> the ABI even though no one ever approved or reviewed the actual ABI.

So send a patch to delete the property parsing code then, like I say
removing the entire driver is very much an overraction.  The properties
are all optional in the code.

--qLcimmkhW1yYyJm9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPafqYACgkQJNaLcl1U
h9B4SQf/V/sdNWAHAktgLl/T/dtFKrx37Qe9wxNlsIs5nCLDx+P4A075LhmLQC7/
CBRhMIjVPmWoXMvMz+QcrL1YZw4Yuqt+pMg0vOxkKuQQplPLK+sj1Os36jT+NLAR
VXmvhhsy/ohXtnTdD7tx+YycrlQBw25Wd/iMBKzBRHoqjBFCYSyJqKcYtqxw2jqQ
wAoxYuNJi3NIZYHlOd4qVLJTp8zGmW023L+MomhTFTimbr94npCTbz49CjVZ8B5v
a9YHAKi3jsDWpIz45hLso5GQZvrvbvRbst3u92dAN2CXSQpb3mW75EDm+rn21TuF
ANteV+q5cPoO2CT9zGdGYBhFYe5pLw==
=mFhz
-----END PGP SIGNATURE-----

--qLcimmkhW1yYyJm9--
