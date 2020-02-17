Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1100F161549
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 15:58:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D13D166E;
	Mon, 17 Feb 2020 15:57:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D13D166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581951519;
	bh=3GdZid6LxgTeLD73K+9R8CstPXO7oMjUjouY859f5YE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RSbOiW8JclJCIHk8jk+yYJU9ZXYzGlKPeIlX95b8PRAOByebEbo6cy6a++PrU1bsz
	 syKTCIDt0rY9ReA3bdTmIWbrRykfTp9U3RyR8G7nK1saRID6acDhZcM6iqmej/JjOP
	 nd1tJRqfjHh8SQfcvTVk57lesDhTCgZcuEsIBePI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5C07F8015E;
	Mon, 17 Feb 2020 15:56:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7B85F80172; Mon, 17 Feb 2020 15:56:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_26, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 2069AF800C4
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 15:56:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2069AF800C4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E63430E;
 Mon, 17 Feb 2020 06:56:51 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E733B3F703;
 Mon, 17 Feb 2020 06:56:50 -0800 (PST)
Date: Mon, 17 Feb 2020 14:56:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Message-ID: <20200217145649.GF9304@sirena.org.uk>
References: <20200217064250.15516-1-samuel@sholland.org>
 <20200217064250.15516-4-samuel@sholland.org>
MIME-Version: 1.0
In-Reply-To: <20200217064250.15516-4-samuel@sholland.org>
X-Cookie: There was a phone call for you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@free-electrons.com>,
 stable@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [RFC PATCH 03/34] arm64: dts: allwinner: a64: Fix
 the audio codec compatible
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
Content-Type: multipart/mixed; boundary="===============2738316294787534022=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2738316294787534022==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xaMk4Io5JJdpkLEb"
Content-Disposition: inline


--xaMk4Io5JJdpkLEb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 17, 2020 at 12:42:19AM -0600, Samuel Holland wrote:

> Cc: stable@kernel.org
> Fixes: ec4a95409d5c ("arm64: dts: allwinner: a64: add nodes necessary for analog sound support")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

>  		codec: codec@1c22e00 {
>  			#sound-dai-cells = <0>;
> -			compatible = "allwinner,sun8i-a33-codec";
> +			compatible = "allwinner,sun50i-a64-codec";

This is an incompatible change in the ABI, it's going to break unless
it's applied at exactly the same time as the matching kernel update
adding the new compatible string.  That's not suitable for stable, you
need to keep the old compatible as a fallback.

--xaMk4Io5JJdpkLEb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5KqbAACgkQJNaLcl1U
h9CYUAf/ZCOyWpSkn3x5uej3JtTUW/4RmXdnFa/ZOH/PjJuGXBCc7m4ZbP2jo5t2
2XdicNuPW5JUz9kmdxNzfeyUOYprNoheZyy/5i1u8EM9Br/zyszZFkMoApsLKSdF
qPUhK51OvntU8eb4DFQAswJFw6HmKfGImygfRHvHSax37e5srjBSosR5ZeJv7lQO
ZyP3iUjWXb9b8P/akkgxhQRpGkugDsrqx4oXSzKCzsj3kMpw6rE7yWXS9rQSVoaw
amPYSjsE4prqOnOlHfR0/y+dU6HJGHfWIWZqeNIEXK+gf1flqLmqxlpwCNnFCtn0
8rreEBr8qPilxVdhA7LpTMvLOCE8Jw==
=uWDR
-----END PGP SIGNATURE-----

--xaMk4Io5JJdpkLEb--

--===============2738316294787534022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2738316294787534022==--
