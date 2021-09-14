Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A5240B093
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Sep 2021 16:25:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 788A3181D;
	Tue, 14 Sep 2021 16:24:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 788A3181D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631629512;
	bh=P9nZSfohkj11S8msZ1i9F3wFuFJ2RgZone2kTgyQdZI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jV3hDcJ7CR9hZbXhaNEKwEdx5WL3ZTyYnvfWjpkKeL3ln5KjQdWwaOPIOZFNX2GvP
	 XPIAt3Xr6J02euPUzQaER592j+Q/5LVGhs2xmh928RnZ/mVfygyCEbQ+M/pnpVkk7p
	 4moUp8hXvkhB/exJV8lQvwnSdlD3b8IvC7VqnlnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F08F2F80132;
	Tue, 14 Sep 2021 16:23:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC89BF8025E; Tue, 14 Sep 2021 16:23:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9609F80132
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 16:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9609F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dT7divK9"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 332A560FDA;
 Tue, 14 Sep 2021 14:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631629421;
 bh=P9nZSfohkj11S8msZ1i9F3wFuFJ2RgZone2kTgyQdZI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dT7divK9iaunjAa3aElu5KGA7gnf7TPq0CHDN2+woKhTjdYFzzhLiK/wXtl8hLEFY
 JYxxmlidmoBvr72c+30qArphPYMBZURiCJUT2LudKdI7Je88dpu4s/eyj7rjbqJtG6
 Dx+ZZLzPS6rDF7e0o8D6vTDXfbu/wbywh9jeen8cIe4GmBzw5hvj6fXYaCtL+tLT7O
 Z4LwjtUe2/sGkMjOp0hoSKpW4NAZEsAZ6rYpRBWeVVu7dZQ5r1Q4u2Dg5Qg5gRtdru
 fSCrzHnhQbrAh7zdGu084VH16tr9mh3aCt6HZdiE1XhMtFXlrBfhZjUDPuhWpBT83J
 SYw47ye59gWHA==
Date: Tue, 14 Sep 2021 15:23:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 6/6] ASoC: cs35l41: Fix a bunch of trivial code
 formating/style issues
Message-ID: <20210914142301.GF4434@sirena.org.uk>
References: <20210914141349.30218-1-ckeepax@opensource.cirrus.com>
 <20210914141349.30218-6-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="m1UC1K4AOz1Ywdkx"
Content-Disposition: inline
In-Reply-To: <20210914141349.30218-6-ckeepax@opensource.cirrus.com>
X-Cookie: This space intentionally left blank.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 james.schulman@cirrus.com, lgirdwood@gmail.com, david.rhodes@cirrus.com
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


--m1UC1K4AOz1Ywdkx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 14, 2021 at 03:13:49PM +0100, Charles Keepax wrote:
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  sound/soc/codecs/cs35l41-i2c.c    |   5 +-
>  sound/soc/codecs/cs35l41-spi.c    |  13 +-
>  sound/soc/codecs/cs35l41-tables.c | 477 +++++++++++++++++++-------------------
>  sound/soc/codecs/cs35l41.c        | 387 +++++++++++++++----------------
>  sound/soc/codecs/cs35l41.h        |  81 ++++---

This was upstreamed with your review a week ago :/

--m1UC1K4AOz1Ywdkx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFAsEUACgkQJNaLcl1U
h9A6vgf/fB5qSYhQmEdZbDL800q65LE/C6ESG8YIAVOArASY2m5bVTl/EMPDwyIH
Y5+5GvBY6fYvaESA2mT1U+t2Qlrilk1MPYtQ4w9hZVVDk8IHK2JL+TGC4NYvQlHr
rLu3BYdWjVAOqZBc5n4hI72fuUrbcIPy9aa2BEmhy70tufxO2zWnlVsU8ulnZlJ0
uPALuITIclSdd+dpc+dtp+7PoZuxMFdMgqqsgkATHnRRpvkcoTPMfzVmzQnW1WvF
51MgNYJ6VECvt3M0UDWX5FQ+bEJrEGtKc+BQAKgBwgYVQxdFapTCuJLONpbv/jaZ
JbW4rgYyigJKXJ4MdIRQtFuhJ6xEIw==
=ccwd
-----END PGP SIGNATURE-----

--m1UC1K4AOz1Ywdkx--
