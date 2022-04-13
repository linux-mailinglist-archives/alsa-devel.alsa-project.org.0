Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEB14FF9B2
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Apr 2022 17:06:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53606175A;
	Wed, 13 Apr 2022 17:05:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53606175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649862366;
	bh=VjQY5nrpmgcSuXTK7yu3ew0bxgkZKQoSqOgDwl0n0qs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AAIbbiUCjhU2eZS9ZeA18Iy0/pg1Ye05feQv+Lslo8/gNb6Ff9Pc4OoB1oFqV/smo
	 LDFEK4UiPoRgb6NMkoF3qmLXdeoeODaehj8/ZQ3y+jrna8JNJc1B4ssoxzHyU6awte
	 7s+2rtgqcHlgmxINhbSVn2m6AFj1CPRbX9jEU8OY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1751F8028B;
	Wed, 13 Apr 2022 17:05:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB4DFF80095; Wed, 13 Apr 2022 17:05:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87488F80095
 for <alsa-devel@alsa-project.org>; Wed, 13 Apr 2022 17:05:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87488F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XPlaH6Uw"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3FDD761D1C;
 Wed, 13 Apr 2022 15:04:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D66F2C385A6;
 Wed, 13 Apr 2022 15:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649862297;
 bh=VjQY5nrpmgcSuXTK7yu3ew0bxgkZKQoSqOgDwl0n0qs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XPlaH6Uwu0ASIIeC4tABPUXxD+o5rD0bVVjxiaGSaGJzSnoa7pEbwYOJVPzdwxBr8
 gjmVBL3QASH7L3+kPUTYd3ATwDf+Ww0FtHN/+gbvrLwirjJnoM+Ox8JGAveDN8iQhi
 SdaVZOW03yWFbj2CcXTV4aWWL0XDafDczT09RCDSqlvv7X+Rl5IVzmVger+t9Iy9eH
 jThrWoEVjusVit/qemkFT1q2MPHcWZwM9WuBMXMhtyTzr35msxMUgJEUao4rjg/dAk
 2SM9lnWA7c1kD7cKtP8brJcgyKbwO3srdZROYmi951/rZzD5QjgTYtIODfsI9TJUc5
 LmilSMYDd1Pwg==
Date: Wed, 13 Apr 2022 16:04:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix array constraints on scalar properties
Message-ID: <YlbmkSFqY34UuVzN@sirena.org.uk>
References: <20220413140121.3132837-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VekwRPP0COgtFOIs"
Content-Disposition: inline
In-Reply-To: <20220413140121.3132837-1-robh@kernel.org>
X-Cookie: The horror... the horror!
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-iio@vger.kernel.org, Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-remoteproc@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Agathe Porte <agathe.porte@nokia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-hwmon@vger.kernel.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>
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


--VekwRPP0COgtFOIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 13, 2022 at 09:01:21AM -0500, Rob Herring wrote:
> Scalar properties shouldn't have array constraints (minItems, maxItems,
> items). These constraints can simply be dropped with any constraints under
> 'items' moved up a level.

Acked-by: Mark Brown <broonie@kernel.org>

--VekwRPP0COgtFOIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJW5pAACgkQJNaLcl1U
h9DmlQf+J09i7xHNBLa9qVJkVXaOe/HVJYPPltu9GIpREcAJsawEZ8ZgDKwby26+
+O8wcS47jwyM2wZ375w8CG/0FcziZRNk6g7yndlWyV64CN/Df4tje+K9ZC9Gdo4n
OQrfdNzqXLPs7KxCpSYGQUhDaEKBAd0bUY/L+lszBvk1MzWBaDVeexfjwLGy+YVL
4M+OkSQ++mNAsRvPNgyOqID8nPkKlrnkXL5dm/GG8SHl39P3GxGKl4Cag+Gd1/R9
yIrjCokgS3AhWjKGygEYh1AFNJZqueydevyr6s4e1JRm/Fi6lYL0xRlPPx5aPsGZ
xfaeAjTvT59WiM8RA/ZX4aZX46zCXg==
=O1L2
-----END PGP SIGNATURE-----

--VekwRPP0COgtFOIs--
