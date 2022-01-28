Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CABF149FA58
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 14:07:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C87EC1706;
	Fri, 28 Jan 2022 14:06:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C87EC1706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643375258;
	bh=Is4olLhsk3j3j8qTWxE/Zeo3FckilHNlsQ9Vsr92LR4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uzxPUqFxm//aTzONm1KqZPiUnZ/MJd9CUvjij14iZy/evJQ2u6omdVcgu6fXK74JB
	 VlPa1Acv4OogmBKv7R5XHTbFRGNH6Fh9h9HnIWBc36gYNS09N95TYm+mh8d+LAeBa5
	 F63HWVTMDoS1H1nnlc0Q9X8DQ2ZoV3cj8VwfH8Oc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D7BBF80246;
	Fri, 28 Jan 2022 14:06:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC45FF80240; Fri, 28 Jan 2022 14:06:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6989AF800C0
 for <alsa-devel@alsa-project.org>; Fri, 28 Jan 2022 14:06:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6989AF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kxHVqdph"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D9427B825A8;
 Fri, 28 Jan 2022 13:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F72C340E0;
 Fri, 28 Jan 2022 13:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643375186;
 bh=Is4olLhsk3j3j8qTWxE/Zeo3FckilHNlsQ9Vsr92LR4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kxHVqdphzE5X65rhBYzku+ROQZ7aH2C2kVbgzXgCFeRoMOCeiHDTKzyYC5JXPCx8O
 qLJIElrOFLMEc6J7VO8RKxlV06WAYysknXqJ/90758o/XCcmaZwOUEkZYhg+xnHe8P
 8KIa4AQMDgUwzwjeJvYg8IfmtPPcDN2Xopvt1l3bUCe599gs10SVIB3J1bO5OYifU0
 rtkA+fCVMLIjBMkb0pYl7JvLOeqDVmVun9zBrVvQF1MQRXPF7xeLmYDXkMZPx4uN6H
 KVZy/JdC6uSH2CyrpJCCu9yJh/ASWXV+aQj4LcD8oIsWXHJ+ig92ZcxWx+sdeutxQk
 ClKOKWSVWEsnw==
Date: Fri, 28 Jan 2022 13:06:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Centralize the 'sound-dai' definition
Message-ID: <YfPqS8v7ZtT6HDyS@sirena.org.uk>
References: <20220126231427.1638089-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YNdayVbVmdPYqrJn"
Content-Disposition: inline
In-Reply-To: <20220126231427.1638089-1-robh@kernel.org>
X-Cookie: The Moral Majority is neither.
Cc: alsa-devel@alsa-project.org, Jonathan Bakker <xc-racer2@live.ca>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rohit kumar <rohitkr@codeaurora.org>, Fabio Estevam <festevam@gmail.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Andy Gross <agross@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Jerome Brunet <jbrunet@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
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


--YNdayVbVmdPYqrJn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 26, 2022 at 05:14:27PM -0600, Rob Herring wrote:
> 'sound-dai' is a common property, but has duplicate type definitions.
> Create a new common definition to define the type and then update all
> the other occurrences to just define how many entries there are just
> like other phandle+arg properties.

Acked-by: Mark Brown <broonie@kernel.org>

--YNdayVbVmdPYqrJn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHz6koACgkQJNaLcl1U
h9B49Qf+Jhz1zqYprzEs4mjpHmY22CKnG6zMmgy5bCBIfVwqA0nwKfsC9ul8fXXL
NcltbAqGcCxr7u0lJoXY3h/Oob0gwpuqzMMyS+bUHzXQPnK994clJApOdV/J7UXC
YJpbL78jiNhLsi9SZP9cTucY/LJTMEpN595HZ2+LPO6xeY6tq9RP4EWQj/0zvSn/
dO3Z1egfcbsjKVGilRNKIjeK9WfKUdpRAwv3AS+0wSglY+fsSrpNe7Fij2CUN5zs
nNlnVrsIvRZ45CK8pgK3YOkcvaWp/9GgS4+4+DJXwtVH8V8shpAsK/dxY+ddPhdK
5xeCdZoQNFc+Ixkd9EQwLZLSUgKTOw==
=AKJ7
-----END PGP SIGNATURE-----

--YNdayVbVmdPYqrJn--
