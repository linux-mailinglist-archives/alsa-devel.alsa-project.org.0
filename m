Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CA36899E7
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 14:38:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 745471D6;
	Fri,  3 Feb 2023 14:37:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 745471D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675431512;
	bh=unIYp8TTE723ciZu0oNaexw40yoC6GI+uvWw+r5E8/4=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MsJa7sSMd0l2pZqCAZgcm2DO5Es4jjoRHaGRPhgUtNG/lqHgsKw7Bhn9StSzPqlee
	 NwWSB3wm/l4vqmS9HjtECBJptYWdYihuhIq2dHlWI/FX3orxKs2a+vGJ15hfna/pO7
	 GDvll/jf+dV+6cTYgLn0rzJcbyLYl1y5izbiZGrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB670F800E3;
	Fri,  3 Feb 2023 14:37:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 235B8F8032B; Fri,  3 Feb 2023 14:37:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D5D8F800E3
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 14:37:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D5D8F800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NH+8wi0c
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 2793ACE2FC4;
 Fri,  3 Feb 2023 13:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7AB1C433EF;
 Fri,  3 Feb 2023 13:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675431438;
 bh=unIYp8TTE723ciZu0oNaexw40yoC6GI+uvWw+r5E8/4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NH+8wi0cH0SroieKSfjKxRAG17IFzTDDe/ecV2yk9TBDodw31G45d8EDqJZm+hu+M
 29QxYPufaZv+Jdeybi0FaIbsKzi/3M4MaqMa8Rk3c2++tGC4DWp4EoV2zaLOC69i4r
 nq+/QJc6AQbb00G7x30Ietzfodg65ZmqrxN+8PZpRkyyI00lgRdvpFNU+bAncV9dDN
 aCC5CZ2UWMUdptzDcEeoTaHaF1aV2tCF4xTnq/WBgmwZ3RKMEvY6qNsBwbsyrze83Q
 oBUyGVQKtApllvVxI2edPvhq8AtbLJEv+RkC6hRkKTKY5tMUFNBNJ7FwuY0KrnB8n/
 RinCyGhvm2QZQ==
Date: Fri, 3 Feb 2023 13:37:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Kiseok Jo <kiseok.jo@irondevice.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: irondevice,sma1303: Rework
 binding and add missing properties
Message-ID: <Y90OCX002gLuf+Jx@sirena.org.uk>
References: <20230203094239.25700-1-kiseok.jo@irondevice.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="N+stlK+T/xtXLQ+R"
Content-Disposition: inline
In-Reply-To: <20230203094239.25700-1-kiseok.jo@irondevice.com>
X-Cookie: No animals were injured.
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
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--N+stlK+T/xtXLQ+R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 03, 2023 at 09:42:37AM +0000, Kiseok Jo wrote:

> +  sys-clk-id:
> +    description:
> +      select the using system clock.
> +      0 = External Clock 19.2MHz
> +      1 = External Clock 24.576MHz
> +      2 = Using PLL in MCLK
> +      3 = Using PLL in BCLK
> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> +    maximum: 3
> +    default: 3

We really shouldn't have this as a custom property, we should be using
a combination of the clock bindings.

In the driver this would turn into using clk_get() to get the MCLK, then
we can query the rate with clk_get_rate() and use option 0 or 1 if the
rate matches, or the PLL otherwise.  If we fail to get MCLK then we can
fall back to using BCLK.

--N+stlK+T/xtXLQ+R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPdDgkACgkQJNaLcl1U
h9B8LQf8DFGH+a04ycoUUBFk1KB8KTcpcsg9bxqAEV3wXSQAVXXcXmni+9egtWxY
HAB9/+P+RG2wlQvJeWipCc43kH583d8RFlQazZRbQIi0ZuLdurHxIvnkFMZTFMLY
/+S9khQK8N0IkOg3dmiji8E6LtxULO7zRM0yRfBkQekQ+1qdjotJaI/Zyt5j4USP
coO7Zws3z8zFSzEIXK7Puv+8XoUe4UjI2sHdGmad9THE9AJKkmuxMoZ6jn/qG3oa
XSu9rd2iaisjhIzM3V3+02YvKxQCHveFmJgEFgHVJk3aZCTgad4GysPWxsADIO9p
kyoTjhxgHmxicvrCVvJaPHs88CR1Qw==
=k4Fw
-----END PGP SIGNATURE-----

--N+stlK+T/xtXLQ+R--
