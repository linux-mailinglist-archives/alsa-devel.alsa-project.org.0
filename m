Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB635BFABE
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 11:22:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E708C857;
	Wed, 21 Sep 2022 11:21:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E708C857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663752163;
	bh=ghhup3/B33nB7XHNALzYmfqCgWnUt8vhwwrgQftoRt0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D+FpMte+FQVUTJaL5foPSXpqRRSDZXyhXSc4uECSmlWrgozH2A1bup/ekL0p22efA
	 uSvpaFVINWOWDcFanGeHUEDeJoIOPgIJ3V5LRZfj19Yn8/+orwDMcBHG+xhRnQ0eBd
	 p9rFTE3qDEGccxeTTPR9u55fqYpZHPZwBAhFXgiU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D08BF80425;
	Wed, 21 Sep 2022 11:21:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F5CBF80256; Wed, 21 Sep 2022 11:21:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF3C3F800C9
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 11:21:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF3C3F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tYhYyzrm"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9529CB81D21;
 Wed, 21 Sep 2022 09:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2F7C433D7;
 Wed, 21 Sep 2022 09:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663752098;
 bh=ghhup3/B33nB7XHNALzYmfqCgWnUt8vhwwrgQftoRt0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tYhYyzrm0VHW+MfmapEys3j4BHoD14XINUSa8Uz1hJC/X7I+dpNnIQ0QDDoZarsvz
 BrRj+WN5FWczzkpUmkwycd9k1qHNcXDMPeIRrBW1LCh6uH7pV8AvSYgJxUToUeoIY4
 IcQx47LzutgbbXZDioACXXTRBRoNtWza3EsGQYPrG6iZ4hTt02ieS3Fs4Ft4bnjDe5
 HZhSjEU0+TAR8dXr+EsFv0ZVY9yG7GBUMYnZgvYjyzbPhnzakFp2rR/zhkXAFJqdmU
 USAi0bUnAoZRWddFKbrYfzvoKl05hv86xhdc4LIoLrUIH+INbmzOGjcGDmELrrOvpQ
 EmkNX8bStD9VQ==
Date: Wed, 21 Sep 2022 10:21:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Astrid Rost <astrid.rost@axis.com>
Subject: Re: [PATCH v4 0/3] ASoC: ts3a227e control debounce times
Message-ID: <YyrXiJSrc2hX+Zda@sirena.org.uk>
References: <20220921081834.22009-1-astrid.rost@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nUgNn9n5bNnHT0gi"
Content-Disposition: inline
In-Reply-To: <20220921081834.22009-1-astrid.rost@axis.com>
X-Cookie: One FISHWICH coming up!!
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, kernel@axis.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Astrid Rost <astridr@axis.com>
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


--nUgNn9n5bNnHT0gi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 21, 2022 at 10:18:31AM +0200, Astrid Rost wrote:

> Astrid Rost (3):
>   dt-bindings: sound: ti,ts3a227e: convert to yaml
>   dt-bindings: sound: ti,ts3a227e: add control of debounce

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--nUgNn9n5bNnHT0gi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMq14cACgkQJNaLcl1U
h9D+nAf/cbWjVFNQ9zdyz4yBV+FoDfeZZT/vG96TkBti0z0I99CMGo7Ew0DDqpSG
xGw8ajcJpP7KE5K4HGBVccMX88JMwkVJUqJ62UElk+7phlw1ERM8yV+Ooo+DQaLV
VUjublu1emWixadN7Mbq5yt/sITKCvP1zruib8clUPvVswuotz+54R2PhONoTJKp
7ETB9I/1RS7Du/hgmDmLJjws6en0St+MsCuNAs50SBJC+w3ejequUabPyZlRq3sd
YMc+dUyGifNaAXRzyjJ3kPFwloBzYNgbMvz9yUP1tGYXSkPD7u7IpNa9aFgNu/EO
Xg0o9p43HQSIidOgLbpcPuOr9YUXbg==
=XH6B
-----END PGP SIGNATURE-----

--nUgNn9n5bNnHT0gi--
