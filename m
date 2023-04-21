Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B406EB363
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 23:10:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 066F8EA4;
	Fri, 21 Apr 2023 23:09:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 066F8EA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682111449;
	bh=RVERPZ9E3/KfeUrjNSBB64d1FKaCRd76R3MxDIY2ES4=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fHHRAaJp8LjTxu3CsEVKemXiJlmbj2ea7m9Rxi+r14+ReSE8Wuqnuu8LqAyZN04hl
	 m79+tIHx1rpnb+uqbPGptDcDoPdUbdgC4AqJNYiZatYlEaOzs2ITxnflcOBfv03Uyv
	 S/wwih9+KQ4BW4aR5OrikpwPpWqasFZgYbKKFdx0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 314C3F80149;
	Fri, 21 Apr 2023 23:09:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AEAD3F80155; Fri, 21 Apr 2023 23:09:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01360F800F8
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 23:09:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01360F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XoZ3l4Mg
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E739B60E95;
	Fri, 21 Apr 2023 21:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54102C433EF;
	Fri, 21 Apr 2023 21:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682111388;
	bh=RVERPZ9E3/KfeUrjNSBB64d1FKaCRd76R3MxDIY2ES4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XoZ3l4Mg7IXJFTT8/jmZ89ZEVWwis+zPuTHwY+f6eR/mpz7nqC989fCKe/gvNcZcB
	 rFgg/TK5RImC+SKAMQXoL9wAZthhSW2AtDTUSowEHLcZhw36bcv2V/uD9Ck1eePmnH
	 di89SvUP+G/XLgccFKMWKeBrH30pDPSLnRdHYHCEFefBiKeq/U7zQebwQprrYA/Cyx
	 +cWvIEDx5Ig0uDU6A3b4azipTa7tKpTsddLznMrsLn5kdxL8PRClGO6koDEy5mqYMi
	 n2XROr4yVdMxj0AkxgyzOTkxoYOWVlWbBuWBt+GK5qzBLQzrOKUtDN0u+z0cOnW8rw
	 b7irPUa+XFz/w==
Date: Fri, 21 Apr 2023 22:09:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: max98088: make it selectable
Message-ID: <0a9847d0-7bf2-4646-86f7-25ad4ebd9238@sirena.org.uk>
References: <20230421200127.16234-1-fido_max@inbox.ru>
 <aa022833-2380-6a6f-6d7e-47b0098ae18d@linaro.org>
 <444ed682-9c5a-4d5b-8ba2-f1954c7719c5@sirena.org.uk>
 <03bcdcfd-3007-5124-428e-7be92d3aa8b2@linaro.org>
 <4bd2b8f9-0b1b-7494-7d55-ba646a6046f6@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L4GF9xQYKFLmwUL4"
Content-Disposition: inline
In-Reply-To: <4bd2b8f9-0b1b-7494-7d55-ba646a6046f6@linaro.org>
X-Cookie: Hailing frequencies open, Captain.
Message-ID-Hash: WKFUZH6CVKG5NP4H7IP5IVBXY2OO3KVV
X-Message-ID-Hash: WKFUZH6CVKG5NP4H7IP5IVBXY2OO3KVV
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Maxim Kochetkov <fido_max@inbox.ru>, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 rf@opensource.cirrus.com, ckeepax@opensource.cirrus.com,
 shumingf@realtek.com, ryans.lee@analog.com, herve.codina@bootlin.com,
 wangweidong.a@awinic.com, ajye_huang@compal.corp-partner.google.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WKFUZH6CVKG5NP4H7IP5IVBXY2OO3KVV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--L4GF9xQYKFLmwUL4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 21, 2023 at 10:57:31PM +0200, Krzysztof Kozlowski wrote:
> On 21/04/2023 22:54, Krzysztof Kozlowski wrote:

> > This one so far is not used in any generic card, so I wonder...

> I found one generic user - at least one board (Odroid XU) uses it with
> generic simple audio card, so probably this makes sense.

One can also imagine that someone who was contemplating building a board
might upstream before the board was available as part of enablement.
Since the audio signals tend to be brought out to expansion connectors
you also often see the CODECs added on plugin modules, this would
generally mean an overlay which isn't something that's upstreamable at
the minute, things like the HiFiBerry boards for example.

--L4GF9xQYKFLmwUL4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRC+5UACgkQJNaLcl1U
h9DeIwf/fms6GPXgYdiDX+2m75bDDYsE66u/SDD7BGwyrvrdlyLC7RJlBxxbdat5
EoWFVuqDBcS9PH/TtslPV+uyPir9Fgm07TPlG1gwdq3V9IDJBfOf84ib5Hgr5Ix4
BV/0/kN7pTzo9udxVRdmCmF+zFoSlU+qFY6ZngVGY2w2TWvF5ZTqzqgHxYmkmew/
7QyeyZkSY7sYnT1QuVIdcNdt2y0mzxF4u00Z0ZtemW1op7LjHRZfuL088PuX4fUW
uH07JZafAWnm+qoqN2GyYf2ALtWtM6m9OYH45CxpOY9r0qApILnY9b/NTXW5zbp0
ERXiAz3x8xZPqbQbTpyszBYb9TrUNw==
=Vc7N
-----END PGP SIGNATURE-----

--L4GF9xQYKFLmwUL4--
