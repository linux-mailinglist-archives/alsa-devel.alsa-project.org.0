Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C36B258D26
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 13:05:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0810C179C;
	Tue,  1 Sep 2020 13:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0810C179C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598958330;
	bh=1N5PyhS/BGmBx0JVBHF8LvbFm146xKOPgQ9iDyG+GRI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dej5WksRYDCCDT0TtboaqAXkv6yhZv2tb7K+hss3ucfmIL/HpJr1lvzB7tz8CUkLh
	 jRjSEoX+6wvvozPbuBPH2IsKpxn9DaxlRYlQw0WPHdXLbngHU8SWnBCzlco78qHXMp
	 0TN+zJEANl8Y3I/t/cHecdYvIeFRl/SaXXJjsyHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F245F802DB;
	Tue,  1 Sep 2020 13:03:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 940C0F8020D; Tue,  1 Sep 2020 13:03:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF70AF801EB
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 13:03:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF70AF801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vc83uoqy"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 49511207BC;
 Tue,  1 Sep 2020 11:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598958178;
 bh=1N5PyhS/BGmBx0JVBHF8LvbFm146xKOPgQ9iDyG+GRI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vc83uoqyyYpxRXnZZUNdhPSjgXFp3bmeg0HH91zalFcOkes6cpjHR86F2AUiZz5FD
 HcMMll5sC76UJLCgtJB1US8Luvp5+D4tD7U6RVEZXs4/yWpsZGT1R1f/C2eRNpeu7r
 4onqUOEFmyEZYEkJdoM6vqlwv+qeWRpwJomWiRdU=
Date: Tue, 1 Sep 2020 12:02:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 06/10] dt-bindings: sound: samsung-i2s: Use
 unevaluatedProperties
Message-ID: <20200901110219.GB6262@sirena.org.uk>
References: <20200829142501.31478-1-krzk@kernel.org>
 <20200829142501.31478-6-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Content-Disposition: inline
In-Reply-To: <20200829142501.31478-6-krzk@kernel.org>
X-Cookie: Equal bytes for women.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Inki Dae <inki.dae@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Gleixner <tglx@linutronix.de>,
 Sylwester Nawrocki <snawrocki@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
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


--bCsyhTFzCvuiizWE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 29, 2020 at 04:24:57PM +0200, Krzysztof Kozlowski wrote:
> Additional properties actually might appear (e.g. power-domains) so use
> unevaluatedProperties to fix dtbs_check warnings like:

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9OKjoACgkQJNaLcl1U
h9AQ3wf+PZ7EGqA0jy8GWulN+OYy/3M5viE3hsFSmvsxU6gKIElo5Yp2d+q/tEKE
mY+huCPYgKRGZqeCspctFfblzr1P+IpvZVnBZYqUGey6GbrfX+3dB0VcIC83wrDu
jIgbmH9ulAuvwJbEbREZwppvlEta7EuUSGXgW5WxLoroXxrIwaRik6n1yNKTGOkD
Pd9Kldslbup1tA58JcajT+CTEnZ1tqunjbbTbXBcrLdqD6c9r+9JoPmGPHk+DtjR
Vs6qrJu07VpQiXkerzeabkqDg2RGK5w61vu+omdj83xmjMXVShEyBUHyjLRZLOgS
LzSfzV0ezqWLFBoNYJLctbW5mvzD4A==
=rivD
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--
