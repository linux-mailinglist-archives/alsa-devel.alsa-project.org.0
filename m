Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F113523ECF5
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 13:53:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AD1E15F9;
	Fri,  7 Aug 2020 13:52:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AD1E15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596801226;
	bh=cKfNzVoedQVmKvHvqaEn1VyOBUd+uYh5+G/kG05O8i0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jCHRrn8akreYOG0nFIXgSZwETDT1ckyfRjF44eUwBZVtjTCUjJDfH/MPIF6ADjqYO
	 vPVTPNsZ3P30uPl1m5KcvqQX+3gLuoqEr2f+IuaVanNf71poFzhvtg+oWk+IAzvLLn
	 BeIYQOi5mOctfxMakx+12fdPzurB9/RC94HBKAoc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 975D3F801F7;
	Fri,  7 Aug 2020 13:52:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B16EBF80218; Fri,  7 Aug 2020 13:52:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93887F801F7
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 13:51:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93887F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HEftQRvX"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1BDB2075D;
 Fri,  7 Aug 2020 11:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596801110;
 bh=cKfNzVoedQVmKvHvqaEn1VyOBUd+uYh5+G/kG05O8i0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HEftQRvX29huLFXq9+TWsNE8Qe8nvmo3X6O+cCG15qzk3KbIHm1/xYVzzdOQOTNAb
 /NrTFQqRiYzNbASVAiDemSygf9K4zF/2u8pqVJIEv4GdrdxciPSEbYj6D0ZpgueVAF
 sxeWJt2cvD2K9Qo6/01yY0iBndmuMSPXg2ZVlPVA=
Date: Fri, 7 Aug 2020 12:51:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 28/41] ARM: s3c24xx: move iis pinctrl config into boards
Message-ID: <20200807115125.GG5435@sirena.org.uk>
References: <20200806181932.2253-1-krzk@kernel.org>
 <20200806182059.2431-28-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5L6AZ1aJH5mDrqCQ"
Content-Disposition: inline
In-Reply-To: <20200806182059.2431-28-krzk@kernel.org>
X-Cookie: Disposable, use only once.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Sangbeom Kim <sbkim73@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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


--5L6AZ1aJH5mDrqCQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2020 at 08:20:45PM +0200, Krzysztof Kozlowski wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The s3c_gpio_cfgall_range() function is an internal interface of the
> samsung gpio driver and should not be called directly by drivers, so
> move the iis pin initialization into the boards.

Well, it is now - that wasn't the case at the time.

Acked-by: Mark Brown <broonie@kernel.org>

--5L6AZ1aJH5mDrqCQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8tQD0ACgkQJNaLcl1U
h9CqCwf+JA5FnrUTEVVBDbW47geQe42Qnc9Xm8NStwfOPmjgajYfUNeCXBA/hmac
FXu0yRKfw64NF52gC92PURaKRq+ZVG+3zWYf+jfKxABUiS5FZGLgQjQ7pUEtrZMc
FxspnPqX4H57ZJXAg+q3Eq76iR132c4eX7s20jBiHJrEfEnIc86n4R5+aZ+F1HSM
kYVzZacjdpEzter1onhkgDbwAR+HT9RdPsyefvCKxtrdgW1h28TvjI9s2XgNHgAz
J5BNRa7ohL/qZnXYd9Z041846uXa6CQcoU51hejVbDSkXk9hprkwVwsrkGCBar2n
58ZhRIsY5a+CLanhjLZCZoMPR6GFAQ==
=U67M
-----END PGP SIGNATURE-----

--5L6AZ1aJH5mDrqCQ--
