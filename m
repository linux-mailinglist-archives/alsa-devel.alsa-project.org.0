Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 746D369A396
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 02:51:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 629BEEC3;
	Fri, 17 Feb 2023 02:50:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 629BEEC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676598682;
	bh=/KrhUL+4wIiRbYE4o9s7QsJp1TAnufLzsQ5ur0U5Ka8=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LtuIKwMtufvT356qVugDCpq9SY9gku5SB6GxT/Cchf95d2zcTj1P8lAkeaBJw7oHe
	 mSsZ14K6/hWDnawafe0oyvf3GR57gA0EqNm/rLCmmumua6AUffAkK0Iyu6+FJ0XDDl
	 q2iSszvCx9ecT5a7IGlQVfXYnvP2WrEQ8TxiV84I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91E27F800E4;
	Fri, 17 Feb 2023 02:50:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A0F0F80171; Fri, 17 Feb 2023 02:50:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7535F80083
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 02:50:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7535F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kqEDbH+a
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7A177611F0;
	Fri, 17 Feb 2023 01:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B985C433D2;
	Fri, 17 Feb 2023 01:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676598620;
	bh=/KrhUL+4wIiRbYE4o9s7QsJp1TAnufLzsQ5ur0U5Ka8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kqEDbH+ahi82OcLzQWO0Hb9Fe4tsL4C81nZJmwh01TK68Cs/OqWFHyj4p9BFDDdNO
	 dSSUBhNj+k09445yr9AS3t7HGn5kVoIHpekgyOlNmJ10n7JGV4iov7p/nOedob1611
	 i+3rkn/gIdplY7+JT+eknH4/ENN+PTdhqvuGiwEgCMzO5Rbb9Oai4t/oUzA0SMiwxy
	 X4QSPHsMDb+R+GGH1mq+MXX7+m3KOjY9O45pYdDy8be0ZfDInR73nAx+lkweqbT40t
	 M4iBn5oh2oiu7fxEvNwJ2GuDcS6r1wtZwiA3hQ7/h/pcUHro6OKwpCIstUnCh0F4tz
	 UKKNGo41ZvuIQ==
Date: Fri, 17 Feb 2023 01:50:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH -next] ASoC: soc-ac97: fix wrong pointer pass to PTR_ERR()
Message-ID: <Y+7dWRbyf+AWK/EW@sirena.org.uk>
References: <20230217013702.4009448-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="78jUowrUp01kHwqA"
Content-Disposition: inline
In-Reply-To: <20230217013702.4009448-1-yangyingliang@huawei.com>
X-Cookie: Serving suggestion.
Message-ID-Hash: YMHZCXHBNDLWKXPSW6WN2JLU6MJ3I2BY
X-Message-ID-Hash: YMHZCXHBNDLWKXPSW6WN2JLU6MJ3I2BY
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 andriy.shevchenko@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YMHZCXHBNDLWKXPSW6WN2JLU6MJ3I2BY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--78jUowrUp01kHwqA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 17, 2023 at 09:37:02AM +0800, Yang Yingliang wrote:
> Fix wrong pointer pass to PTR_ERR() if devm_gpiod_get_index() fails.

This was already fixed by Andy, thanks.

--78jUowrUp01kHwqA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPu3VkACgkQJNaLcl1U
h9AuYQgAheOBmAWCgsE89CDaslubYxqI3pQfbbPIiu2BLuF+tvhNX8mi1SIs55sw
xTDl2UOso1h7Y/rfDk0ADEZOCCEoJknp3J9C+iau+hRqGIDSks7fADrCh7iLTOk4
laKbdTVN9fKDwg1Qkq89c981BvWKmhJH1l2ZiUfvPM0PRwNoCKpBNx61CHU61RYj
H3ySYdRZiUJQLdFmlrZKYbDQK0KkJ2hLEcuexn7bOcnlEcow9kUeokPs+d5nJxJF
Rc16tPJTi+7b9IsK5fNDHg+0XQwnRFLGHHhRSUboC9Pa1W6xXsY+v2NNGm8wbPZt
oN9HrQkObWYC5CppwRjbnU2fEt+CfA==
=+Kv7
-----END PGP SIGNATURE-----

--78jUowrUp01kHwqA--
