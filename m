Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE9C315972
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Feb 2021 23:31:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8B0016BF;
	Tue,  9 Feb 2021 23:30:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8B0016BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612909880;
	bh=WZ9k9WJXx0HWXnNybpXPhu1jzt1lIJ8l+QmwrKR3WgI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S4+d/3lATHxA21LrXLnWYzCAjIYmBGe3pGuFXKudcW7QfuUVNYxsF4Q+0qPwI+Nyv
	 n2NIUchJQJFQh220H67zzfrE/z76I8EXw0H4iTQ5tEmJvsYDOoOAp7u6M3jScqTlDI
	 HZZLi156PHbBRWlpycStRSGUnHuokJRRxRAJvL8w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E940F80107;
	Tue,  9 Feb 2021 23:29:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8910AF801D5; Tue,  9 Feb 2021 23:29:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5662F80107
 for <alsa-devel@alsa-project.org>; Tue,  9 Feb 2021 23:29:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5662F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="egI7JzL+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B5CD64DD5;
 Tue,  9 Feb 2021 22:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612909759;
 bh=WZ9k9WJXx0HWXnNybpXPhu1jzt1lIJ8l+QmwrKR3WgI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=egI7JzL+OpEux4lDpojzN34Xxcr219cGvh7tVkTr4aMY811/LAQr7PwEO5iO005ia
 lsjIoINpYU13szelLLGAdkr9TRlClfyyc77gJRu+UHo+zYYqU1eIZYH/qqFCNGWJnr
 AIEKZ+Jpo7txoJ2NevlMl308hB4sEMXUwP2klHFZ4SV1M0xW9iM868RjLSbiUeAeqf
 PXi4x1RgZM2IPbKIfWwLZyyolZiMX3slazpaqmMaPb1CcZPQt42Jk6DEOjko7nXw+N
 CKhj2Ogy8dGQXwgLuXbJtRT6ekHELllkxmyGUwffhafPnZGCeoixIwI+T2NseFNqBw
 gwqtoTRXO5ayg==
Date: Tue, 9 Feb 2021 22:28:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt1316: Add RT1316 SDCA vendor-specific driver
Message-ID: <20210209222826.GE4916@sirena.org.uk>
References: <20210208090432.1078-1-shumingf@realtek.com>
 <20210208122337.GE8645@sirena.org.uk>
 <9eff4f09-b127-5912-f62f-ed1e48db2e36@linux.intel.com>
 <20210208175228.GJ8645@sirena.org.uk>
 <6b30d40f0eff42748fba7bec65baeaab@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4Epv4kl9IRBfg3rk"
Content-Disposition: inline
In-Reply-To: <6b30d40f0eff42748fba7bec65baeaab@realtek.com>
X-Cookie: Put your trust in those who are worthy.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>,
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


--4Epv4kl9IRBfg3rk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 01:34:24AM +0000, Shuming [=E8=8C=83=E6=9B=B8=E9=8A=
=98] wrote:

> > Right, this was my expectation for how this would work - dynamic contro=
l at
> > runtime so you can do stuff like that rather than a more static setup l=
ike slot
> > assignment is normally..

> Actually, the "RX Channel Select" control could select the channel.
> This control could select the different channels to output dynamically.
> However, could I keep the rt1316_sdw_set_tdm_slot() here?
> There will be more options to set this configuration.

If there's a control to override it at runtime then duplicating that
with set_tdm_slot() seems like it's going to be a route to confusion if
people change it?

--4Epv4kl9IRBfg3rk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAjDIkACgkQJNaLcl1U
h9DcWQf/fLo6ITLkNWq1aSFfqKJMwGPvTXJuQnh99wHHEWw08NIr3OScNqqk9kLF
FOB9desBPrViGSVOBbXlTFmoKjNBCSwJIpLlRmxp1HkLq8kw65CuBKf+F3fggshz
ifh1+w2qStBBwbcxsZ66x/KrY4+rqrqrkubqs3Culk/lnNFXKK7AS6kzRg4JD+GB
oSYzfB8Y1h3Z1wbQRkRQa1t50FUonGCwMpYjyYI6UqeU5cJY9djxIaQZl9oMoZYU
GbnZD9QXifgGVKFRsla72ax9FxkPVGkIp+qQ5V2ssrL2pifWqajmi0WorYlYiFSe
p5W1b+swy9FIggHs2IcGVmXUG5FFxg==
=d7Mh
-----END PGP SIGNATURE-----

--4Epv4kl9IRBfg3rk--
