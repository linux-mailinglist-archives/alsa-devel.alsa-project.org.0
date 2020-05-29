Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A701E7987
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 11:36:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2035217B7;
	Fri, 29 May 2020 11:36:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2035217B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590745014;
	bh=QAGM17q25jdznqfG57f6WsEbjdirWE3/v6uR6xZIyOk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Uv07oBUINBRJyPwLB2jsW7EonaG+3pvOHQbcUIEdgW35n01BpawKx8AlcMyZNEWIF
	 BFw2BRe46Z+pZ0dG/pdNRyB9A9Tk7xbLFGlbJckuM3F0K2QHdGFB6s36Ycv3gJiU+A
	 YXGyh0slvRMIsbWrXcakX0AD/WVBQ4ozmIiC4oSs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43C2CF80149;
	Fri, 29 May 2020 11:35:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89988F8014E; Fri, 29 May 2020 11:35:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67BE7F800FF
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 11:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67BE7F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Sdqin9fv"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F22972074D;
 Fri, 29 May 2020 09:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590744906;
 bh=QAGM17q25jdznqfG57f6WsEbjdirWE3/v6uR6xZIyOk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sdqin9fvcAIdjhXJ3j9o7aHJiJjxpPqYGIrs0fE0920khxyeoJgzm0MUF/V/jgcCd
 Z2Y4WExdoK0Rcji0sf2rH9oK9aziOX/ZhaCeuPsqKrbmByP8UcOPdnl+lIBwOBiCfI
 5EOgPqt6MuO1Fu9HRau4Y0ooqlB96yRkxTKkfZkU=
Date: Fri, 29 May 2020 10:35:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Steve Lee <steves.lee.maxim@gmail.com>
Subject: Re: [V6 PATCH 2/2] ASoC: max98390: Added Amplifier Driver
Message-ID: <20200529093502.GA4610@sirena.org.uk>
References: <20200528103942.17432-1-steves.lee@maximintegrated.com>
 <20200528115408.GA15800@sirena.org.uk>
 <CABff4NSc6oW9dt-2VbdKUnk=+8Tc52m8f2irr1P4_cGyXNq41A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline
In-Reply-To: <CABff4NSc6oW9dt-2VbdKUnk=+8Tc52m8f2irr1P4_cGyXNq41A@mail.gmail.com>
X-Cookie: The Killer Ducks are coming!!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jack.yu@realtek.com, ALSA development <alsa-devel@alsa-project.org>,
 ryan.lee.maxim@gmail.com, ckeepax@opensource.cirrus.com,
 ryans.lee@maximintegrated.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, nuno.sa@analog.com,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, geert@linux-m68k.org,
 dmurphy@ti.com, Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 Steve Lee <steves.lee@maximintegrated.com>, rf@opensource.wolfsonmicro.com
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


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 29, 2020 at 05:04:36PM +0900, Steve Lee wrote:
> On Thu, May 28, 2020 at 8:54 PM Mark Brown <broonie@kernel.org> wrote:

> > > Reported-by: kbuild test robot <lkp@intel.com>

> > Don't think the lkp bot asked for this driver! :P

>   Thanks, I will send split patch for this.

No, just don't add the line when it's a new driver.

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7Q10MACgkQJNaLcl1U
h9B/Mgf/Y4jlBsGTeWfaJs2t7T3Lu7AXT7PuHgmifzYCl2GJ9lJ93OBdV353D+dT
g1AmR8FetIEQICND9qh8CYsMVQK7QCIDORenKsqC36XWMbGNn7Bde11Mev3xE0+r
4ttOzAk1UNt5iW2iNzmkz40WN7tmhDkjqEW9+KZ8mQ4YzJ12XPcf4ZT1Zqlt3zi+
mVeH90cBIJQWKGq/zrs3TLc/IuuqaxOOjBKJkKVSEbsZgwZ3W7EM53HNlf9/tpjm
2eo0/q6puVpUWOkfI5N7CDSqnUwB6eYXCSaEO5WT0mXdXOk/6YSZpajZW7XXgnAm
udaLl5zvnCkHFpffFyIf2LDcyZFvIg==
=0HNV
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
