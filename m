Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 617E55A2E9E
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Aug 2022 20:37:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1B111638;
	Fri, 26 Aug 2022 20:36:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1B111638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661539023;
	bh=xF0KNsI2IlIUzyH8YZ8MnRxmK+IVlETUPKl64/0iTl0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mUKAoDFqFpgMI4o2VR1vB68O+Gfs/4v5i3oyKyyI1KD9zalopfE5oQ3gTBhvEiMqO
	 SdVhDJF6s8uusxOIzH97k+6AGmrlU3iX0M478BKzVJNEks5dMvz2/8wy4ZmuoAfhZZ
	 Gk+mLt1ZdcrFfu0nnfsXS6hZaJPqUer/dlbBIK9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60253F8032D;
	Fri, 26 Aug 2022 20:36:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEFC5F80238; Fri, 26 Aug 2022 20:36:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 910B2F80134
 for <alsa-devel@alsa-project.org>; Fri, 26 Aug 2022 20:35:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 910B2F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="L7r7Mev+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6831561DB3;
 Fri, 26 Aug 2022 18:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5828AC433D6;
 Fri, 26 Aug 2022 18:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661538956;
 bh=xF0KNsI2IlIUzyH8YZ8MnRxmK+IVlETUPKl64/0iTl0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L7r7Mev+tcF/CzzQZyLFUkE0G5aCB0QtF3sHVUe1axvDI+WFx91pZSYGU0YCpYsHa
 feJKZL5yk8GtR5XZnW+TWZXZzbT0gF7rbMubqvM6DhtFC/wpwb+DFJ6gpEDo2rXUGw
 NnoqPlpot8EvakJ0pOS/T6K3RlKUBocJb5JwKSCjQBX0Z3duSRI39Ss6gbYyB1XzUB
 Ws6A2d5QlI+74cLb/3GfWth2VAB6l8kC2WbVZeM5EwL22PDMtLobY8XifgtEPNf4A/
 4hUPEvMysFBkYwClzhqphc0a6rlCsCitx6/IQIL7/+MUWToJRSveMC4JmeqrbvyYzt
 ryrNSNHAq03xA==
Date: Fri, 26 Aug 2022 19:35:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: codecs: allow compile testing without MFD drivers
Message-ID: <YwkSi1IIRsW2Hc/u@sirena.org.uk>
References: <20220826093659.1059276-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="c/r7lq7RHI8JSL7A"
Content-Disposition: inline
In-Reply-To: <20220826093659.1059276-1-krzysztof.kozlowski@linaro.org>
X-Cookie: Necessity is a mother.
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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


--c/r7lq7RHI8JSL7A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Aug 26, 2022 at 12:36:59PM +0300, Krzysztof Kozlowski wrote:
> Motorola CPCAP, Lochnagar Sound, Rockchip RK817 and Qualcomm
> WCD9340/WCD9341 do not depend on parent MFD driver in build time and can
> be compile tested without respective MFD part for increased build
> coverage.

Although generally it's easy enough to just turn on the MFDs
themselves, it's not the same base platform issue as the firmware
interfaces can be.

--c/r7lq7RHI8JSL7A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMJEooACgkQJNaLcl1U
h9BjFAf/TBEERO4EdaYIfc9zPGIPzPZihH1I2Kf9uMcL/8bbjjUTFTTD6EZjThN8
AJJNvvlU8K+vJ21+mULAtPZ7V2438t/yjHDHbntubmY4hzcFhDZx30jMUb413+S7
MOFbRePQljnUEkVo62082YtgQxquZ3dAxXv+CB/thTOh6Br+1VoQ7wupKc81uCZa
RuIdpGyXbtKjYEuPJGLaOoUVw25IKocp/hULjpb01sQljTc4ge+a1IGk96oeQNGO
P9qerPHtrEMA7lp0/WeAuZurTNfqu1Z4p+cyrQ10e+CctMGVTqgTgETxMrjVlJRe
ml870sq3S6bw+QmHaqiKZaSwz4vusQ==
=ft5I
-----END PGP SIGNATURE-----

--c/r7lq7RHI8JSL7A--
