Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B29785D23
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 18:20:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 317F583B;
	Wed, 23 Aug 2023 18:19:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 317F583B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692807639;
	bh=bFYohTZLR0gcEeBGh4PZIKSG/8Ft4hkvb5dBN06rVxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mRgrzAH5ai7Ky89QRvqQuL5M5MoJIlTlSwXLZJJzmpg0KOicnMY8lvObUWDoonsQx
	 nrInzFuwBBLmRJ0cNmrdd0D7/ynJNBCo7BfpzlV6VJJp5eIcVfJK9m1WO9G1uT87hX
	 zHdVeO+CFqpTzRixalddgDOT26TPTZ8PSWf1FF7Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3EB0F800F5; Wed, 23 Aug 2023 18:19:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49A5CF800F5;
	Wed, 23 Aug 2023 18:19:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DDE8F80158; Wed, 23 Aug 2023 18:19:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76829F800F5
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 18:19:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76829F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hvbq7HFx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7F1256196E;
	Wed, 23 Aug 2023 16:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F88C433C7;
	Wed, 23 Aug 2023 16:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692807575;
	bh=bFYohTZLR0gcEeBGh4PZIKSG/8Ft4hkvb5dBN06rVxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hvbq7HFxf0HmkMTgwQfCloZYcNii9IRLnHZ+MZCGbUU+g0+zSXwUYA5SvUJwRTgHs
	 jL5b8//S8sdpAd7f/3bS6Nui5MSgw0kDrO+P4VLtpw+h0OB48lJahS0F/8WIGd1fKj
	 5tDXt+YwXnuGrRTr55ns8wuTpvpLa0APheUy62HVpFEMcuD/zppfXtN5jaFNCHSFR/
	 2v5Muq0KF4qbT1dGNwOKFdwY+BbDyemqeSRWrh5H4dPVzk+cNZHiSA5+DO9Hbs/PLZ
	 kwm5XFmLzRHkp8ak1fV0j8oZfJ1LPLe2VQ2qbGo7a9J0xPVRF+NRktybbT3Z9bduj2
	 BBGBagIdi231A==
Date: Wed, 23 Aug 2023 17:19:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, lgirdwood@gmail.com,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: soc-pcm: Shrink stack frame for __soc_pcm_hw_params
Message-ID: <df2be4c7-f3ae-41dc-b2c2-3128a1ecc684@sirena.org.uk>
References: <20230823092113.788514-1-ckeepax@opensource.cirrus.com>
 <20230823154958.GF103419@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CN0I9PoqvHKPEWf0"
Content-Disposition: inline
In-Reply-To: <20230823154958.GF103419@ediswmail.ad.cirrus.com>
X-Cookie: Some optional equipment shown.
Message-ID-Hash: 467CODBCJTNFOXUQ36XAFJWPI4GC5YK5
X-Message-ID-Hash: 467CODBCJTNFOXUQ36XAFJWPI4GC5YK5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/467CODBCJTNFOXUQ36XAFJWPI4GC5YK5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--CN0I9PoqvHKPEWf0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 23, 2023 at 03:49:58PM +0000, Charles Keepax wrote:
> On Wed, Aug 23, 2023 at 10:21:13AM +0100, Charles Keepax wrote:
> > Commit ac950278b087 ("ASoC: add N cpus to M codecs dai link support")
> > added an additional local params in __soc_pmc_hw_params, for the
> > CPU side of the DAI. The snd_pcm_hw_params struct is pretty large (604
> > bytes) and keeping two local copies of it makes the stack frame for
> > __soc_pcm_hw_params really large. As the two copies are only used
> > sequentially combine these into a single local variable to shrink the
> > stack frame.

> Hmm... this might need a little more thought its not clear why this
> should change the frame size and it only seems to change the frame
> size on the ARM cross compiler I am using, not x86.

Isn't that just going to be a function of the compiler being smart
enough to work out that there aren't overlapping uses of the two
variables and they can share stack space?  There's no reason not to help
it figure that out.

--CN0I9PoqvHKPEWf0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTmMZIACgkQJNaLcl1U
h9B0Bgf+POrkau9foZfK3OE8zRQ8cvfby5GZ4GBI7gL8FE2W+RSgeebO8VjVcjaz
x/HJiXUGmPxSA44ibC6s/bQoC4kIFt1vWsSWaNPdNZ1KGgbg4KNhkz0MDNFJXsAJ
I0IaXJQaz3sKoVEVWzzVJ3llcVVjj+ML6gMxB+S/lJ1h9f+4Vx4Xl2RuoJA47yhU
Ho7hqrfHV1vti6ES+3PIjkQ8wdodxQF/FLIAT83NRXt4MXZ6mmW1/AtXQ3ibSc/1
HG352b02g3ysd/M7k9LREtd+I07blQmvNW6zzBXefKya2W9A+86PPhEBPmAaBECD
7HYkPGx6ewa++e1D+hU8utOuONINXQ==
=w0N4
-----END PGP SIGNATURE-----

--CN0I9PoqvHKPEWf0--
