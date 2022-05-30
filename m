Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB2F537FAB
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 16:21:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E2B51EF2;
	Mon, 30 May 2022 16:20:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E2B51EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653920474;
	bh=mqoAqsjBcDXcw9PiUEES97ufmThPSY4MfFp/E6LjfcY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NmjZsHZRudCQYAUTseR7aYCpp8kxojedXnXFB0KUD0a0yXSvtC1SfQO8SL6UUFEno
	 JPVvo6ffUxnk2bodOoFqXM5chdP+fd+LcwmBUnpIgQLH14csrN6oT4PYFD+Ql6ZlID
	 DbqmkCRfAFjfZzXWqRDj9/3MGJQw0Ryh0f0BVaso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08ED2F800DE;
	Mon, 30 May 2022 16:20:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0018BF800E5; Mon, 30 May 2022 16:20:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3366F800E5
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 16:20:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3366F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pG1EQ9MY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6E76560AFB;
 Mon, 30 May 2022 14:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538F4C3411C;
 Mon, 30 May 2022 14:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653920406;
 bh=mqoAqsjBcDXcw9PiUEES97ufmThPSY4MfFp/E6LjfcY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pG1EQ9MYt1rwtjTf6xMu41KnNZKqIkFxQChFq7ffaXaZSxj2Qy4KjwdM3/0azsH8C
 5cSu0LrHFOda0VvlO6vv/UzUt4TnrvkSAaa8scZp6jwaM9tVxbD5s2Mgc4QydRcmYr
 /u0jdjfDejga2mqShdrkBcdfwEwxbKqos+vfGXDpc0AG6Kbah8q30TNIX0kpd/RwI1
 SYSenxoK2qgjboLkqtjGFJtwmESG73dV9r0zLJMJo/jLpz1CGDor9AzOwwzj+u70y8
 w1BoGzV+uTOzxLbZ43OlBqK+KQvXbpGEHrt80cViQBJUqQor1Hcen7GlwHHEGNICjW
 UxzfMvA/ZDolA==
Date: Mon, 30 May 2022 16:20:02 +0200
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.18 089/159] ASoC: tscs454: Add endianness flag
 in snd_soc_component_driver
Message-ID: <YpTSkjYKAZLcOykC@sirena.org.uk>
References: <20220530132425.1929512-1-sashal@kernel.org>
 <20220530132425.1929512-89-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="HrYJqQMmui+RX7XF"
Content-Disposition: inline
In-Reply-To: <20220530132425.1929512-89-sashal@kernel.org>
X-Cookie: May your camel be as swift as the wind.
Cc: steven.eckhoff.opensource@gmail.com, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, lgirdwood@gmail.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org, stable@vger.kernel.org
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


--HrYJqQMmui+RX7XF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 30, 2022 at 09:23:14AM -0400, Sasha Levin wrote:
> From: Charles Keepax <ckeepax@opensource.cirrus.com>
>=20
> [ Upstream commit ff69ec96b87dccb3a29edef8cec5d4fefbbc2055 ]
>=20
> The endianness flag is used on the CODEC side to specify an
> ambivalence to endian, typically because it is lost over the hardware
> link. This device receives audio over an I2S DAI and as such should
> have endianness applied.
>=20
> A fixup is also required to use the width directly rather than relying
> on the format in hw_params, now both little and big endian would be
> supported. It is worth noting this changes the behaviour of S24_LE to
> use a word length of 24 rather than 32. This would appear to be a
> correction since the fact S24_LE is stored as 32 bits should not be
> presented over the bus.

This series of commits doesn't feel like a good idea for stable,
it will probably be safe but it's effectively new feature stuff
so out of scope and there's some possibility we might uncover
some bug which might've been being masked.

--HrYJqQMmui+RX7XF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKU0pIACgkQJNaLcl1U
h9Ahbgf+LHN76oP+HIfs5W8ozL7j+orPH45zHI+PQPZeiSMVQbPsakBwTf5fOMi4
vDOwGGNz5r3D/OYytHbH7v89EFqwJI0zRpopIiaC9rkUOKBVc6c4/dBfddj0Fhjp
5UOzUjzLP7n4IfYdwFcN/ThC/vAo4B2mn0nm4Syj1VC1Ayavzl/976zR83eVpvBX
rtT1MR1k/j44UMGkRdyNYC/WbkGYGRXuq3wfnlYc6e9tW+YOQrPkk1pvEOZFrQoO
ZyAKV2ANrudifVI2AnvIQ02rviWsL0f89Wjg3MWuF7bjf4gojlW+PwHon4o83JuL
MJpR6ljgbtubclAUhYL9ac5tTzJXMA==
=Kb3f
-----END PGP SIGNATURE-----

--HrYJqQMmui+RX7XF--
