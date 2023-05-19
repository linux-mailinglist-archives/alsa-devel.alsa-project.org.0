Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD384709800
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 15:13:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E98081FE;
	Fri, 19 May 2023 15:12:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E98081FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684501981;
	bh=v1r0gkCrrTU6g3cAA+Cei5Y3vKCC6lB4xTy+3dGEcEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r5BwqDPdyOXyVNXP3OQVj69U83jNiuqRVWh0/+NiEMT89fmI9hZnwlXuEB6zOUiV1
	 SbDlq2ZEkX2Qx3I+MskchOqhiqwHREuOJaWOxASCNHARTlVQtoH2TVuyEE8zbNTaIv
	 FLoqgxGFZycccRgmQ7Mzn9DCgZviwRU+Ff6ctdT4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77AC3F80548; Fri, 19 May 2023 15:11:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC176F8025A;
	Fri, 19 May 2023 15:11:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A412F80272; Fri, 19 May 2023 15:11:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82110F80087
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 15:11:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82110F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VKIuJ+Yk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C3E546172B;
	Fri, 19 May 2023 13:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B023AC433EF;
	Fri, 19 May 2023 13:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684501896;
	bh=v1r0gkCrrTU6g3cAA+Cei5Y3vKCC6lB4xTy+3dGEcEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VKIuJ+Yk/FPlF7dJQZW3Vz73Vv8xyLUPBQariSReOHBLxmTL6jvSvOLPvCv6jSf1c
	 oEbjWOqpwobRD1koqPXXWsD/oVdZ0uBl8KxuDX3XNWAD0xWvB48J5l1DakqIRHfEtb
	 7CAecvJJPUW78ydUE33P5pJ+04Qotz9OKrPe9aYHVeJ5XpiwMmzwl2zcZJ3gg8RF1c
	 zGO28dnJ3k7jgxi1jhCl+N0lta/f8o1dUIo8Y/+9/B7r52IheQrvip6GsdwhdIODDO
	 ZNI92z2GNQuUcj2Haa8MIRyp3v7Jwcx8zPPwsNFFAJEv1uKrbuCrCjzfRErjZl0Tcf
	 3dNa5pgE7AzYA==
Date: Fri, 19 May 2023 22:11:33 +0900
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH 00/12] ASoC: codecs: do not store status in state
 containe
Message-ID: <ZGd1hZSO4zdO8gdD@finisterre.sirena.org.uk>
References: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
 <ZGX8v3qjkmfMf+J1@finisterre.sirena.org.uk>
 <cc4109d6-3125-0738-537d-34f9fa2c2fa1@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yt+Eq0IulzcknXCj"
Content-Disposition: inline
In-Reply-To: <cc4109d6-3125-0738-537d-34f9fa2c2fa1@linaro.org>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: 2XN3VHK4VVEX7KT3OWS3HVNU7T4RC7QX
X-Message-ID-Hash: 2XN3VHK4VVEX7KT3OWS3HVNU7T4RC7QX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2XN3VHK4VVEX7KT3OWS3HVNU7T4RC7QX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--yt+Eq0IulzcknXCj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 18, 2023 at 12:33:17PM +0200, Krzysztof Kozlowski wrote:
> On 18/05/2023 12:23, Mark Brown wrote:

> > Please write proper cover letters, but don't resend for this.  You
> > constantly raise small review errors in other people's submissions...

> Since you asked for a cover letter and you did not apply the patchset (I
> checked in your tree), that seemed like a feedback for something you
> want me to fix.

> If you want to give feedback which person should not immediately fix,
> please state it explicitly or through applying patches.

> If you give imprecise messages, don't be surprised you receive different
> results.

I should not need to explain to you that a cover letter should have some
useful description of the patch series it is a cover letter for, there's
a degree of obviousnes one should expect to be understood especially by
someone who is clearly very aware of kernel processes.

--yt+Eq0IulzcknXCj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRndYQACgkQJNaLcl1U
h9AyMgf/WmqY17FrUpqZnaDAXyTwfGznPp86Z6f5ThcJoY1/vTjabJm7/9ymvIzc
qmVqQ3nwFrAMToRZrA6iurFTB9t8udktqK123v/7fjj4WIfN4sbvizrj/vZPIZJW
Fa7MVT0uh1stw50px5PqenQRkqUrLrM95GPtyowTv6YWDFJVCI0J3LXrwe57j9e8
9ncBcMeGxafKBz0k4VM3k8dnz4hH6mDBhTa0e04iSoxpC3VV9xW67LauJSWbSXMR
56evNWwrD8SeWLUDI+1JtNRjUMkhuRjq9u54zfeZ329BBfOu9/Cb/uitNnzEMspL
aMQhL23uF3uLQi+lGmjIK2xztRY6BQ==
=v8Cm
-----END PGP SIGNATURE-----

--yt+Eq0IulzcknXCj--
