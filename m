Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 293B0362090
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Apr 2021 15:09:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEFBB1692;
	Fri, 16 Apr 2021 15:08:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEFBB1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618578584;
	bh=UTAhMDefpPwTNtTdGhAFmEmBU4bzX4WrC/sk0G+g9/I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iB978gbc6JbxNQm9kYWySUDNef+3wN+TvruaN+cCcgB00hVIliGtFi532PdOTbFu8
	 jOlvJzDOY2h/NcdBiEodABj75Ev4dLnJlg17+iePlrth9LxvOFmLQmR5DrKLT2lXW/
	 cB+bDZ9BOBBFTFPtjoryrREiZw/cjL/+TYhwWHhk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED528F800FF;
	Fri, 16 Apr 2021 15:08:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2935BF8025B; Fri, 16 Apr 2021 15:08:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07A5DF80128
 for <alsa-devel@alsa-project.org>; Fri, 16 Apr 2021 15:08:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07A5DF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B9YHXZ0I"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6847161107;
 Fri, 16 Apr 2021 13:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618578483;
 bh=UTAhMDefpPwTNtTdGhAFmEmBU4bzX4WrC/sk0G+g9/I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B9YHXZ0IpPuCaFb4kax+qXqdxLlHQQzZ5vCwLWxdUlBAvV0zdPXZWlGqIC1Px1EBo
 69rZKY3ibk2LP5/yKuPiXWn9SutEpowhsOMiKHD/Dl+YDODLOkZZKr6om4CD7I2/MB
 RglbL6CtxRy0wkJJAjhAAXFovBeqUNOan8JpGFGWWlkSCelSTB91w9YoQevTe3mXaz
 ICp+46n3QhZvfhYZzebUPw16U/u4OBf8aBAhuoV737Y8AjrhiYF8vLEj1coIhrANcg
 +R8dt3NdKM7nOlkUsY+DySy+pnNMzw7v4edQr3Nm5malzACy4eVyc8itsOXRFVCMkD
 7niYEkRIEm0BQ==
Date: Fri, 16 Apr 2021 14:07:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 2/3] ASoC: rt715: remove kcontrols which no longer be
 used
Message-ID: <20210416130738.GB5560@sirena.org.uk>
References: <5c314f5512654aca9fff0195f77264de@realtek.com>
 <20210330170915.GH4976@sirena.org.uk>
 <cb29ed5c-44b1-c1ce-b704-8b93ac9f7a43@perex.cz>
 <3102f11c-d2bc-c53e-ac68-60628b990515@linux.intel.com>
 <5292be30-7e2d-c2f2-85ed-a1a609feb6c6@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="H1spWtNR+x+ondvy"
Content-Disposition: inline
In-Reply-To: <5292be30-7e2d-c2f2-85ed-a1a609feb6c6@linux.intel.com>
X-Cookie: Snow Day -- stay home.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>,
 Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>,
 "pierre-louis.bossart@intel.com" <pierre-louis.bossart@intel.com>
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


--H1spWtNR+x+ondvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 15, 2021 at 04:35:14PM -0500, Pierre-Louis Bossart wrote:

> Was there any sustained objection to this change? Mark and Jaroslav?

> I would really like to fix the UCM files so that the mute and volume are
> handled at the codec driver level, and not at the SOF level as it's
> currently the case.

Well, you seemed to be objecting because it broke the UCM files and Jack
didn't reply so as far as I understand it it'll break userspace.

--H1spWtNR+x+ondvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB5jBoACgkQJNaLcl1U
h9B12Af+KRD0beWTLIp8I6aMPpy8Tze3mB5t3m//adcL1GfnMgDATXn+/wojjuM3
cWWdNjWkjUqtL0HWwqj5HU14qOT9v6xZ1Ipg1BFmrxS8oFH9Y6SLTVYBOzGga3oX
fJM2FNdslyYGhWXHHaDBfoIaJrbxIjkJlpsdilej6ZYOcu7iTkMiKqNu7pNWj0WK
YcJ4/ZRhZ8J9buoU6fKTjk/lJftWvK2d5qx7VVCqz4HRkzhjZPszEnhozc289kRZ
BuWxG9CWHcSxW4rXozRm+zAsWtKv+l3Vv4kd/m9WpE9+ofq1negUWLzqWrY+HfF3
y5tVpjRJHunQUoNqL3ygkkwA5WneKg==
=PF4/
-----END PGP SIGNATURE-----

--H1spWtNR+x+ondvy--
