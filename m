Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1038653B558
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 10:46:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5B6B1741;
	Thu,  2 Jun 2022 10:45:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5B6B1741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654159564;
	bh=0h2Sm/0Z2dpAMlCpmJN2KxDi24zphL1biGO/AhqrQQY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bw0XNVvBR50LvS9SJFYa5UZkNnzeNr4Gxm23xUQ3gXwJjtA7ba9T3/+ehobScmf2k
	 8CHqI4pa3Rl8HYguEt8KEmd6mJayjkXc9vvotDGsD8Mh0ONtVFqBt9Yukeav5growm
	 B2w97ItS3b1foizSsPtYwdPH6ZDk3nHWRU8gz/u4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18CF0F8025E;
	Thu,  2 Jun 2022 10:45:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14D87F80236; Thu,  2 Jun 2022 10:45:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B14CCF80149
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 10:45:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B14CCF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="E0bNzj+q"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4AFF7B81E95;
 Thu,  2 Jun 2022 08:45:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A2AC385A5;
 Thu,  2 Jun 2022 08:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654159500;
 bh=0h2Sm/0Z2dpAMlCpmJN2KxDi24zphL1biGO/AhqrQQY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E0bNzj+q/H+8foQaTpuqWkCxi2+FY+7whY9JgrLY560mshnPP4X7EqtE6Srwdpwld
 nEEm9rW56tdyoSUxqzpHqXUiJ6ihn+tulH4vN0Yp3PnZVYn5InUJ+X8bJ3ueWNo7p/
 oMVS9SYs6tNRN6RpzrgWp3sQoZmiIedFVHH4i56ZJK8iyB6g3SA6aYFGr4gPMeff76
 7YTNnUphWuinTSO02imtCSFd9AMqv2YS40bcIjioKMsoIqv538gmKEiBKaFeNrkxu2
 gtGF77OCCkW71moIJ7/dlHPmy5ya5QjRLVEAWeQEuponOcAgkcxDccjpzed44cY7Ky
 vnNxsjKYQasXQ==
Date: Thu, 2 Jun 2022 10:44:57 +0200
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: Semantics for _SX controls
Message-ID: <Yph4ideoluyk+mHP@sirena.org.uk>
References: <YpeElAslQxfajbdq@sirena.org.uk>
 <6adf0ba3-485e-fc73-7f86-6a063a373b68@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pXl/mX5Vv+8kl4YI"
Content-Disposition: inline
In-Reply-To: <6adf0ba3-485e-fc73-7f86-6a063a373b68@linaro.org>
X-Cookie: May your camel be as swift as the wind.
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, patches@opensource.cirrus.com,
 James Schulman <james.schulman@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Tan =?utf-8?B?TmF5xLFy?= <tannayir@gmail.com>,
 David Rhodes <david.rhodes@cirrus.com>
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


--pXl/mX5Vv+8kl4YI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 01, 2022 at 06:14:47PM +0100, Srinivas Kandagatla wrote:

> From Qualcomm codecs side of it usage of SOC_SINGLE_SX_TLV should be moved
> to SOC_SINGLE_S8_TLV() in sound/soc/codecs/msm8916-wcd-digital.c and
> sound/soc/codecs/wcd9335.c. using SOC_SINGLE_SX_TLV() will result in
> incorrect volume settings.

> All of these gains have signed 7th bit in 8 bit register with gain range
> from -84dB to +40dB in 1dB steps.

> Other WCD Codecs seems to have done correctly using S8_TLV.

> I can send a patch to fix these.

Sounds good, thanks for checking.

--pXl/mX5Vv+8kl4YI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKYeIkACgkQJNaLcl1U
h9D0kAf7Bg2NsQtVVcdvktyi7p/k+RSyIOoLJ3/TbY9T9SWiivRXbWwc4c+eLzXg
xn6HSJTESseQtGLiDM840TsRT7QmvLa+p8uxqStTmn6D2bsdA/85pn2XR34w79zi
pKJhM7PlkDUwfb0iQF+JIjo1YI9fRhaM/+3kAQ5ycjMwtoq8bH5IhVuZx8ZN/6Nm
boyTQVNX1dHlIycCr8YKAFNrQo4Amq8R6aDB4+bPke/MdIAA+ZnqpENgYgb9GGrj
TEwXKJF8aqy7rOx471e7KJ1AFVtzfpw8xjS6lfNCC7eA45cEr5ENnN14wHL/8tjY
D7VEjR7njW1hZjtkpCY/nx8zboCQ8g==
=W7xh
-----END PGP SIGNATURE-----

--pXl/mX5Vv+8kl4YI--
