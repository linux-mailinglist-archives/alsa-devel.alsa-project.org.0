Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CB133436F
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Mar 2021 17:46:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D8921764;
	Wed, 10 Mar 2021 17:45:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D8921764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615394761;
	bh=5ZFjFUrhf3iJfEJAYrBj1Bz8aThYGlqmj/G4EzHdiT0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UfuokTk2J5TixdJb/743HNCCnCF+yIwZXKqzXeifrP7BP1l3BXXt2sYhs3+8GZnfQ
	 PSs4y/yX4Dolbk2KTn4RGka5lkkspRWOF1quyHJY7HoXnZkFdXfquta8FzimKCiXoL
	 HMhnebX4bNSZA/z9DfDGxpqKDerYTgwmkbGBCz8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E55A4F8012F;
	Wed, 10 Mar 2021 17:44:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32C0DF801D8; Wed, 10 Mar 2021 17:44:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76E33F8014E
 for <alsa-devel@alsa-project.org>; Wed, 10 Mar 2021 17:44:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76E33F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IPTvgVVc"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9188164FBB;
 Wed, 10 Mar 2021 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615394659;
 bh=5ZFjFUrhf3iJfEJAYrBj1Bz8aThYGlqmj/G4EzHdiT0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IPTvgVVc0w0lqg0wznzjqwNacPJJZI3VP1DPdlRdDsrGjPjO4vPmQzlLP2X7cLNbA
 Y1TxHHsSx4/flhSxVmral4KsBPqBV1aTlfWIgI69/lyTPw3V1ZHVSU+1Xg3Bd5MU2o
 dVft2QKvaeQlrO7irDL8slBFXA6k2W7BtzGiH4a0asU+kLfpgRpBhIyLaJphUr1XbN
 V+UQTp4gqz0UgzX+fVSOV4TXssK7l9dSZWer/gOzs8KjPVgbqzathMbHKrQ+q2p8co
 aFay0F6FxxCA+EUmSLMOi67jePYn0TfxuscN2yKyueaMzVMkCPKGoWw/SRd27BGZun
 QYOTdwxgWMjTg==
Date: Wed, 10 Mar 2021 16:43:07 +0000
From: Mark Brown <broonie@kernel.org>
To: jack.yu@realtek.com
Subject: Re: [PATCH] ASoC: rt1019: add rt1019 amplifier driver
Message-ID: <20210310164307.GB28564@sirena.org.uk>
References: <20210310092434.26560-1-jack.yu@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MW5yreqqjyrRcusr"
Content-Disposition: inline
In-Reply-To: <20210310092434.26560-1-jack.yu@realtek.com>
X-Cookie: Yow!  Are we laid back yet?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 kent_chen@realtek.com, kenny_chen@realtek.com, lgirdwood@gmail.com,
 derek.fang@realtek.com, shumingf@realtek.com, flove@realtek.com
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


--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 10, 2021 at 05:24:34PM +0800, jack.yu@realtek.com wrote:

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/rt1019.txt
> @@ -0,0 +1,16 @@
> +RT1019 Mono Class-D Audio Amplifier
> +
> +This device supports I2C only.

New bindings should be in YAML format.  Otherwise this looks good.

--MW5yreqqjyrRcusr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBI9xoACgkQJNaLcl1U
h9DdZQf8DCJ8WbSbbbMP31yu4asxS88YB60CRDETCFa56MxPN5VHnujq86F8HmzK
GdhDhP+Ta1wBYE4QzehKhfDTq8iZRKnQiGkDyRZE4X9mY9TuUYCGjqUHbSo1ZHfC
RF6eJ69GXxOOdWRyJXfPbJXnov5IXsvIOe3fDdG+U0NG+L+vGwCDkPSlTecoWPxS
bIbD45swNr247eaDXWwRIFBmkt2hIdWJWjNTlKLoZhaF8e8JYjtDuRUs2Q46MipI
uWdG+0W5w1uAlj1WP6c36+EEo5KMB17NzKNdKm0bqsP/oU5wS2oldlh+JhUtV440
G+CAH3PgPpXQFgS/7fEDK4Kd01/AHg==
=qddp
-----END PGP SIGNATURE-----

--MW5yreqqjyrRcusr--
