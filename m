Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D783A5EF714
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 16:02:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85C6715C3;
	Thu, 29 Sep 2022 16:02:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85C6715C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664460179;
	bh=NbQBK0K88I2R53On1jgQPc/QM3SMeQ/eMk4dHm80OcQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aSP54Xk+wt1toIUiKGcRv+mgtodlMMCxnj8Tspx2jTvxJzO/Yq95rsO8cHFzUejZH
	 oM4/F2Pmkb04Jqukbbu9Ie5m4Ne9j2Ax6z2INurcmT4mYG52WqswJbDMSeA/cbAG7I
	 A3oGkr/LsxNGL1zp8QQ7jbrfjhUNCjp0lJb85kdM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1088FF800AA;
	Thu, 29 Sep 2022 16:02:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76348F80109; Thu, 29 Sep 2022 16:02:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3710EF8016D
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 16:01:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3710EF8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gmTbcvC1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2692CB824A9;
 Thu, 29 Sep 2022 14:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D65C433D6;
 Thu, 29 Sep 2022 14:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664460117;
 bh=NbQBK0K88I2R53On1jgQPc/QM3SMeQ/eMk4dHm80OcQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gmTbcvC1yEmw7F1GRoHapSzLYj+IdmomGJ9jUk7Jl8mdnbYj+Dm3ElgvlF0dA/jWb
 Svrd/TMipM3+QYV7JkG62nFhywTSSJmdSz2fZmVlKMZwHM95FaFw/pARM+5J/b0LKw
 MAGMKL+5ywEvTN4waqtEaf+3qJsNdBAbS5BswiOI/O7l8JizhSmMsRFgo3Le4V0wSt
 0/Uct1OMyKAuIUo31E1sLbPdqyIGvDYKFXfR322owxrU83lW4fGVETV2CBXM0VA/t7
 /7JdEZbyIZyui75PabnkE1VD21g+weqdYESr1JfN1KIpHXpi1CZM/eYyHZGFDQm0zO
 Gp6A25qEFK/kg==
Date: Thu, 29 Sep 2022 15:01:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: wcd-mbhc-v2: Revert "ASoC: wcd-mbhc-v2: use
 pm_runtime_resume_and_get()"
Message-ID: <YzWlT11jj0ES0Alv@sirena.org.uk>
References: <20220929131528.217502-1-krzysztof.kozlowski@linaro.org>
 <YzWgescSJMKzYTAo@sirena.org.uk>
 <88035bdd-3aeb-640e-c001-8823013e5929@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Ri3zr+BP8FJRoKsl"
Content-Disposition: inline
In-Reply-To: <88035bdd-3aeb-640e-c001-8823013e5929@linaro.org>
X-Cookie: Last week's pet, this week's special.
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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


--Ri3zr+BP8FJRoKsl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 29, 2022 at 04:00:26PM +0200, Krzysztof Kozlowski wrote:
> On 29/09/2022 15:41, Mark Brown wrote:
> > On Thu, Sep 29, 2022 at 03:15:28PM +0200, Krzysztof Kozlowski wrote:
> >=20
> >> Cc: <stable@vger.kernel.org>
> >> Fixes: ddea4bbf287b ("ASoC: wcd-mbhc-v2: use pm_runtime_resume_and_get=
()")
> >=20
> > That commit isn't in a released kernel.
>=20
> Oh, indeed, thanks. I'll send a v2 without it.

It's fine.

--Ri3zr+BP8FJRoKsl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmM1pU8ACgkQJNaLcl1U
h9CMAAf9Fc6oFeIp3nEEwGKdOHM5vdwkRlxMVNCluVg7AYY64AweWItcTH5zClZA
mBq8cw1B5aHq+4P8XPgXpfIxw32ITy2mHSIp2B71RAc6RU3mf3ZTFQWCf6WACEl5
/CcBVxTBFthM2OGUWLjlut3BI6X0bC3V25KQCll3B285BYnE5hZdD52Eq8RO5/e4
zJ/B7ltFz9EHIIFvtdYbJsz8JQLKlNGgwNQwAovvgT6JdW/P4QlPad8ZQEzA0hNk
tLn0cC650U9ju/qb9nvVBhkdBt+Hfc+moyjp8obA6JJrC29Ce+hRserfZZlQaj+m
UetNBjR8IsIrJhMffTaNUTPiJRJXaQ==
=PNpT
-----END PGP SIGNATURE-----

--Ri3zr+BP8FJRoKsl--
