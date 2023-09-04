Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 005DD791A1C
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 16:56:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FC2A7F1;
	Mon,  4 Sep 2023 16:55:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FC2A7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693839360;
	bh=kHX+GKJ0chj021Ft9S2U3HGs7VV1HiFyRZsq0upjaBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ABLWxT2LhsTWA2g3dIUNGwCUVyFoe3/76t8lj/ijkeYvOgHXsnoxWGHgXJUlCg8El
	 g80KP+WDbQ5Qi/EDi10T5+V65OKqDxr61XwjFigtCHSW2eKKYdr1qkh6bI/c9J8GaZ
	 dYMgpZdrQRcMKO1PKR/I2Vhed+34vcb/GFoA+pk8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5CF9F80551; Mon,  4 Sep 2023 16:55:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38B0AF80431;
	Mon,  4 Sep 2023 16:55:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6731BF8047D; Mon,  4 Sep 2023 16:55:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 24D3BF800AA
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 16:54:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24D3BF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=c7/JM1sw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8D6DEB80DB3;
	Mon,  4 Sep 2023 14:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E72C433C9;
	Mon,  4 Sep 2023 14:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693839291;
	bh=kHX+GKJ0chj021Ft9S2U3HGs7VV1HiFyRZsq0upjaBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c7/JM1sw3c98d2Cl7C8gF3IuKdInMaXcKdOIJMDNJ0hJ0KNQZ26VFDPfFieI5sU3m
	 aoHsUDZEOv/8Smm+30xrzsN/hfkyLgx2FuiEPukvQ9NNrEkU+JEPJ4VZ4jWvZ3Y+SI
	 Db47yf8vPwhwpoEbH383W15rf8SN4nSjJOxHErTT/1rEdWGzMkUqo/9BNSVZEOabB9
	 0YjOmHHU8tFisYOh+twdBu0jPtnB7bw1qoECvbsV48TbzaUb1+s1dCrPbStGTjbD60
	 kzvhngj0goghdB7JVxQT5D3WlxgR0Gf4Xga0ZXfn5oX8DtD0aiC+MChZ1tcF09yEb1
	 aYKtSeaZ3TEXQ==
Date: Mon, 4 Sep 2023 15:54:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: wangweidong.a@awinic.com, lgirdwood@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	perex@perex.cz, tiwai@suse.com, rf@opensource.cirrus.com,
	herve.codina@bootlin.com, shumingf@realtek.com,
	rdunlap@infradead.org, 13916275206@139.com, ryans.lee@analog.com,
	linus.walleij@linaro.org, ckeepax@opensource.cirrus.com,
	yijiangtao@awinic.com, liweilei@awinic.com, colin.i.king@gmail.com,
	trix@redhat.com, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	zhangjianming@awinic.com
Subject: Re: [PATCH V1 3/3] ASoC: codecs: Add aw87390 amplifier driver
Message-ID: <1f2c1824-8f25-4cca-bce9-412efdc7e4ba@sirena.org.uk>
References: <20230904114621.4457-1-wangweidong.a@awinic.com>
 <20230904114621.4457-4-wangweidong.a@awinic.com>
 <5ea76d3f-c9dd-10f5-4f9a-7b32b535ab5c@linaro.org>
 <598febde-429e-4319-98d4-4306a7f8bfe8@sirena.org.uk>
 <0360d279-b535-f3f2-9651-07dff2df2e37@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gMB7pEBWQ6glURkN"
Content-Disposition: inline
In-Reply-To: <0360d279-b535-f3f2-9651-07dff2df2e37@linaro.org>
X-Cookie: Immanuel doesn't pun, he Kant.
Message-ID-Hash: K4E6EIRF6OO3SPSFOWC4WFBZBKASA6SE
X-Message-ID-Hash: K4E6EIRF6OO3SPSFOWC4WFBZBKASA6SE
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K4E6EIRF6OO3SPSFOWC4WFBZBKASA6SE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--gMB7pEBWQ6glURkN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 04, 2023 at 03:02:31PM +0200, Krzysztof Kozlowski wrote:
> On 04/09/2023 14:30, Mark Brown wrote:

> > This is very common good practice, as well as validating communication

> No, it is neither common nor good. The kernel's job is not to verify the
> supplied DTS. Rob also made here a point:

It's certainly a common practice, even if you disagree that it's good. =20

> https://lore.kernel.org/all/CAL_Jsq+wcrOjh7+0c=3Dmrg+Qz6dbhOUE-VEeQ4FoWC3=
Y7ENoyfQ@mail.gmail.com/

That's a very different kind of error, I'm not clear how we expect
schema checks to identify a mismatch with schematics...

--gMB7pEBWQ6glURkN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmT177IACgkQJNaLcl1U
h9Aepwf9HfnVU+/68EF3o8tS7Kx2TTa0iMeCySpOvl8DvuC4yLC1+fPBUxmXNiOi
PH8aoyOoHHVsn7tNKbTv5y4IpCdHjuXIjIMrwlW7uVQl98nrsF41vEaprzv04HoD
kb+D99FNTWw67CRfFC1jWYCF0Mysv8RblG9cNmPRXbDH9bvN62nsreq+cpyPdYBV
Ze8eYmDKjJ6/UlebNAnzQ54DRDzFXaySqLixI5dApIb5w8QIJbGw4juO5GEDpZzR
IlTLTzQpcpxUZT6qk+ocxqdHCn993JBy+XjSXXRjMFFSkvP1U4GtEA3GHnWBuwRO
QwyeK3YSY2PbI5oAAa/aiizr3nF5dw==
=4I8V
-----END PGP SIGNATURE-----

--gMB7pEBWQ6glURkN--
