Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 215BA58EC27
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Aug 2022 14:39:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AC8515E2;
	Wed, 10 Aug 2022 14:38:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AC8515E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660135178;
	bh=vPpn+dGLzKb7Sc6Czii2tdPohCYiVuar8IVF4AUuPeQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s8kqSS02Axn2L+q1TlwtHhTJ2ZtK9PhWjnzvfL+Ks0COhIUFNERwr5wf+mCbfg1cH
	 5xAHFnH21CdIQV+xUCobw//mCIH8GfXdO0wOygeSrjkUDGbudj+6IEt8me0IpjY1PX
	 wHah1AqhBivxW+H5v3Yqtkmi3R6DtQup79+jhu6Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBACFF80240;
	Wed, 10 Aug 2022 14:38:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A1F0F801F5; Wed, 10 Aug 2022 14:38:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EFA3F800FB
 for <alsa-devel@alsa-project.org>; Wed, 10 Aug 2022 14:38:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EFA3F800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KqEAwT2E"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E5FEDB81C3C;
 Wed, 10 Aug 2022 12:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47DA7C433D6;
 Wed, 10 Aug 2022 12:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660135107;
 bh=vPpn+dGLzKb7Sc6Czii2tdPohCYiVuar8IVF4AUuPeQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KqEAwT2EOk+jDmHldnh6OQGmRp3C1Bt+kOGg/vQZDwNgQ95yt0/UllzC1sypkM381
 VoVi47u2MxCTA2tW8qWivLBlk+l00O/4JLVXJ3cvwGzmntQ0Oq7uBsfiIzvJ9iTazK
 ghO5qoaVrVkpq2fKn5AOGDJslZn5bROZXmJXdM2iJgVRsDv+UEzm9q8JxCkuoXWRkU
 IFqY0XuBXi+3K/umTuNQcWvaxnbZIFO6vWxcyNt4UroEWmihU0qT23Npd0wmj31cDU
 58V28sw+rBdPnA5z4ccojXUEWkaIckAAAA523IY012rVUYgB9i+wLLer4nQdFIG8sn
 mY8IBclIh+1Eg==
Date: Wed, 10 Aug 2022 13:38:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 5/5] dt-bindings: Drop Dan Murphy and Ricardo
 Rivera-Matos
Message-ID: <YvOmu3KvVl5xxtgY@sirena.org.uk>
References: <20220809162752.10186-1-krzysztof.kozlowski@linaro.org>
 <20220809162752.10186-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IEszeuZxEA7/bbtR"
Content-Disposition: inline
In-Reply-To: <20220809162752.10186-6-krzysztof.kozlowski@linaro.org>
X-Cookie: First pull up, then pull down.
Cc: linux-fbdev@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>, linux-pm@vger.kernel.org,
 Tim Harvey <tharvey@gateworks.com>, Rob Herring <robh+dt@kernel.org>,
 linux-hwmon@vger.kernel.org, netdev@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Andrew Davis <afd@ti.com>,
 Sebastian Reichel <sre@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
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


--IEszeuZxEA7/bbtR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 09, 2022 at 07:27:52PM +0300, Krzysztof Kozlowski wrote:
> Emails to Dan Murphy and Ricardo Rivera-Matos bounce ("550 Invalid
> recipient").  Andrew Davis agreed to take over the bindings.

Acked-by: Mark Brown <broonie@kernel.org>

--IEszeuZxEA7/bbtR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLzproACgkQJNaLcl1U
h9Btywf/Ylfto3rP12Is+BQJ2PghIgdBExy5qdKGCvvgKFln7xaTTlF3RaoXLQ0d
VAqhXaSdvHBsHgWzJ8c/B9p71/s7K5CXfcIrGeVm2OY9ZH2Cows3vqURj5tO5/FE
sEhZRrwYC2bI4okDihJglpf7HSCZT6OjniTKbc7sk3HP3W77xpCu9VPLfBCDreh0
WI0Uu3/vVOEsDt4IgAHXlqNqbRjQD2Rhwesx2PRPNpzrI7hCZ+qHORgTFlD7Qx3F
Qa8wcybPT0S6C5o/et9+rajj4M4plbo6uNxd9B4rrTYzLMUDZsMwZOpTkCiMhz7F
lgDRHQHDel322uDH+eBVQB/Aum7p+g==
=2qBa
-----END PGP SIGNATURE-----

--IEszeuZxEA7/bbtR--
