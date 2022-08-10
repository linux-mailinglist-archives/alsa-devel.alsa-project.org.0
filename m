Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C8858ECAB
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Aug 2022 15:02:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E89691607;
	Wed, 10 Aug 2022 15:01:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E89691607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660136530;
	bh=seQEyWy+c6mv05+V8++n+CWhbwAc677sfa/vT4UF+f4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z6af7PkC2Ix+5FOT1FAGkr9Pz4faUaOZ7unD0UjSGBX7eOgvHeGIp7/Pjw9PFjr+r
	 XeOdmnkOLUwNK4x7k1KMgJZXKPro0+uqk9grNN2eXEoRVL9Jsn8zgPVtpDMQB5WpIu
	 rIGsbbZTyst/PHGYc2nJb6873QBIW4K/T05z3SZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E056F802E3;
	Wed, 10 Aug 2022 15:01:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9F5BF80240; Wed, 10 Aug 2022 15:01:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C839F8012A
 for <alsa-devel@alsa-project.org>; Wed, 10 Aug 2022 15:01:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C839F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uKYE0kFG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 35D2761414;
 Wed, 10 Aug 2022 13:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6453C433D6;
 Wed, 10 Aug 2022 13:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660136464;
 bh=seQEyWy+c6mv05+V8++n+CWhbwAc677sfa/vT4UF+f4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uKYE0kFG7aqHbhU8C95U752HrbDLQ0bksXKUre5xrlOHOx/myR7KfosnDfIKUzDCA
 OJKSVKE57vNDjyae/tIEuBv9JN6Yze+cqLrxorwjeUjppKc4qy08uf/Xr3V7fBEovE
 iFf/S3xT/5vVq1WmGTN6m0QK+jTZQK+/cefgpCLkxHkuuldkvO90ie5nayRt5joe5F
 FOfjah14Icu6oI2oYpQhQnhEWgBXflB/KBXfFNogt/RnGLdcW11cRJvxw5k03RZ3e5
 oMo3Xj6xgpR4zUzvIdCLU3bDFqhBytsXsMFByUrdT2dLJICMs0dAFXUNRGFOGhi0Q9
 5zGgRELrwQfbA==
Date: Wed, 10 Aug 2022 14:01:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Matt Flax <flatmax@flatmax.com>
Subject: Re: [PATCH] ASoC: codecs: dt bind. doc for the new TI SRC4392 codec
Message-ID: <YvOsDNtJnkqmnp4M@sirena.org.uk>
References: <20220810013502.1544961-1-flatmax@flatmax.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RrAR3/9AgkZITPpP"
Content-Disposition: inline
In-Reply-To: <20220810013502.1544961-1-flatmax@flatmax.com>
X-Cookie: First pull up, then pull down.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org
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


--RrAR3/9AgkZITPpP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 10, 2022 at 11:35:02AM +1000, Matt Flax wrote:

> +maintainers:
> +  - Mark Brown <broonie@kernel.org>

Please don't add me as a maintainer for device specific bindings that
I'm not working on, the expectation is that people listed will know
something about the device.  If the schema requires an address and you
don't want to take it on I guess alsa-devel would work?

--RrAR3/9AgkZITPpP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLzrAsACgkQJNaLcl1U
h9ARgggAgqL1nVTUqvoAyjFcBg+A9/XhKxdf3Nx6tyLpDKjJIMEpUNVRtM0i9XgH
EkVz2pStxn1hrFI74fUZXVt/Hr0ciZY6zCjw1SHCRHbU8izUAjVyv3ixU41anEhH
T9oSatEzmWYnD7wbYpFI783GpVg60m2/X7c03Z1QSo2Fe22kgS53CjmniMnxwI8B
yUCfEEwAkkSD0yevGn47uYIGpeimQKUKbuYURm379Vg2+56t/pekLN9QqAqxVNK9
Jf6lc6ADWuNg2lS/GxnN8MKhJtRvnOsQ1hBNbN8ZUIxKguKVKEwx/w3n+Ayx206i
xKT8fYSumvRVR3wmQ7zZhUZKzcmeFg==
=qPCk
-----END PGP SIGNATURE-----

--RrAR3/9AgkZITPpP--
