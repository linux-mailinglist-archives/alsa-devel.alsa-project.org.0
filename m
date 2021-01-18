Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C8A2FA059
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 13:50:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC95B17F6;
	Mon, 18 Jan 2021 13:49:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC95B17F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610974208;
	bh=q0FH4FunpIzIAVQK8v4yM3g5TtdkKMgOk5kdtyHxQ/A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MIl8fBjgSrz2xufXxJwv+CNz1XdQQCUqg3wlM+uv8gSw8/6jiRAnmYa8o+EfFTCPh
	 J5d8+0PG+IAOr8Wkp6RqkzYDMHYYXM6B66ql0lTyVIIoPsa9yQ2f7dVmsWC4SaXkjN
	 5M+TNwMeuuzdof+JGGx8hpYdPepD1orpANuh8qgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 179CAF800E7;
	Mon, 18 Jan 2021 13:48:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4326F8016E; Mon, 18 Jan 2021 13:48:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67A99F800E7
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 13:48:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67A99F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vR7Q2xtf"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 12A4B22286;
 Mon, 18 Jan 2021 12:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610974104;
 bh=q0FH4FunpIzIAVQK8v4yM3g5TtdkKMgOk5kdtyHxQ/A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vR7Q2xtf3xWcFlY1axP6Oa7VeqZiURML4gqOREJ+FYznmnRlvZvzNenSq8UlWnEKc
 EZuV84FpaVypn8QMaLxmaFnu6l01ydC6x4MkV0aQsasBgwSFCeEUz6m0y3X4lVk4mO
 dPlglUQWKoIXn26qGZqgwT474lYmKksg+jGM4T5az15k5poNjEfN+Ps5bSMo1J/GEX
 MBqGkC3gllNPYrklHYfB5BHcTBV3Pni7wd87dN9l9WvwnHMwJo9nhvAa6GCsRdIXjd
 N5kt7vlIFrcuFpeRu2K93JLuSQnRQTeoq8ccm3acHYlfaFBndgp5sXYjFhhYlHF+jV
 swU2Ii4BG7WSw==
Date: Mon, 18 Jan 2021 12:47:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 03/12] ASoC: arizona-jack: Fix some issues when HPDET
 IRQ fires after the jack has been unplugged
Message-ID: <20210118124747.GH4455@sirena.org.uk>
References: <20210117160555.78376-1-hdegoede@redhat.com>
 <20210117160555.78376-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="X1xGqyAVbSpAWs5A"
Content-Disposition: inline
In-Reply-To: <20210117160555.78376-4-hdegoede@redhat.com>
X-Cookie: Huh?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Lee Jones <lee.jones@linaro.org>
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


--X1xGqyAVbSpAWs5A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 17, 2021 at 05:05:46PM +0100, Hans de Goede wrote:
> When the jack is partially inserted and then removed again it may be
> removed while the hpdet code is running. In this case the following
> may happen:

Fixes like this should be sent at the start of the series (prior to
things like the move) so they can go to stable as bug fixes.

--X1xGqyAVbSpAWs5A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAFg3IACgkQJNaLcl1U
h9AIhgf+M++EG4ZowJPSdgTXzjQZ5XKVxiSCsCPaQVSYZETswc7j/jtwajvwFP2z
tOsloeQSInfvPYa/MPjAsZG8Xtg5m6GbVdZPaVZeynjZUMi1sCWgyhbXGZTQoQ0C
nbaQcdM7cCVi6vqF6Ehf4cgECmHubN7Rc8D66XdN4NDpKLFfgk5tWvo/5XoGyZNo
srsv5x2hrg1zPhf0/0/abLtpR49dgLsai0wwHbW5dM7vTQPs3ZwViIPPpMM3G1ek
F28wNcC9xBfuahVDvfdBCJFnHdoPBQ10GCCs8BdOCdmEgWSCwI79H5p1i6p27t73
KLy5NcqJTQOFoK+D54xJlYB7dajKYw==
=Xw3f
-----END PGP SIGNATURE-----

--X1xGqyAVbSpAWs5A--
