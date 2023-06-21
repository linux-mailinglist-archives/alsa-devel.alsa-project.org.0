Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB81B7384C2
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Jun 2023 15:19:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D5126C1;
	Wed, 21 Jun 2023 15:18:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D5126C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687353579;
	bh=fNzgBv3S6Z9XVyqQGOlHUKzzBC7T0ZKsC6puwES5pQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=idbCZP0HMA+lEwdBtK8hWzNsHPyH+yNLKA8gdayf8phXFdyxiMolqbyW+A0mnf97g
	 4zV7LgnSC2KdIzbCTE08fFuW8wqt/dfwE6rrIgrCGEAbo9BX4h9bvxxmJsIiq4QWUQ
	 Gvx2IjWSxxnfFMSfVUCgsXsM0oY7e+09J1kUrerY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D67FF80163; Wed, 21 Jun 2023 15:18:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BCD0F80124;
	Wed, 21 Jun 2023 15:18:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33305F80141; Wed, 21 Jun 2023 15:18:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8370AF80093
	for <alsa-devel@alsa-project.org>; Wed, 21 Jun 2023 15:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8370AF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UzLCHXo4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4AC5861478;
	Wed, 21 Jun 2023 13:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BBDDC433C8;
	Wed, 21 Jun 2023 13:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687353518;
	bh=fNzgBv3S6Z9XVyqQGOlHUKzzBC7T0ZKsC6puwES5pQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UzLCHXo4e0aRFNPwG0rKmRZ9TVR7a7NN1lkXVYfd9yPfJU1E6Lg07Ar/4It34XzUV
	 g1835P2QVlAfUwL/EBQCqVeHkbXhGjyBlNGwelfSACYHzwFy7Lm3FcRlI4LPZHbVw/
	 E4aNvkzIJw9G3i9pY7BeuvjkXaqbqeJ6d1sfQR2qae8hDac/kQ4ZFDvTvaQg0vGn95
	 VTI/6/hHSiSDkYDP1YsdFRlzRboP3tpT06MS7rsrYtruEacD4hMjGcSJdwTxOVrQ0c
	 cFyvNY2pMQYoYxp7zeKAFsm13UEUxM3+4dwcBkSvvtm62vhXe2q8hYCrE6ECimHnei
	 a+dbmUfZ74W0Q==
Date: Wed, 21 Jun 2023 14:18:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] ASoC: codecs: max98090: Allow dsp_a mode
Message-ID: <b763d08e-f751-480c-96b6-339a53856768@sirena.org.uk>
References: <20230621115328.156457-1-fido_max@inbox.ru>
 <3805dc65-113f-453a-90a9-2ae6204004ba@sirena.org.uk>
 <e6be75f6-054f-6c3b-00b4-a5e112bcefc3@inbox.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7uVBzkQ09VJrlG8A"
Content-Disposition: inline
In-Reply-To: <e6be75f6-054f-6c3b-00b4-a5e112bcefc3@inbox.ru>
X-Cookie: When among apes, one must play the ape.
Message-ID-Hash: NT6HIVKHM76LT75V4USJOKJH3VL354AG
X-Message-ID-Hash: NT6HIVKHM76LT75V4USJOKJH3VL354AG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NT6HIVKHM76LT75V4USJOKJH3VL354AG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--7uVBzkQ09VJrlG8A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 21, 2023 at 04:02:34PM +0300, Maxim Kochetkov wrote:
> On 21.06.2023 15:26, Mark Brown wrote:

> > This is configuring DSP A identically to left justified mode, it looks
> > like the format configuration needs at least some interlock with the TDM
> > configuration.

> According to datasheet MAX98090 supports only DSP_A (L data MSB after FRM
> LRC) TDM mode. Allowing this mode will let us proper configure CPU audio
> node via DT. Actual TDM mode activation is performed in
> max98090_set_tdm_slot() via M98090_REG_TDM_FORMAT/M98090_REG_TDM_CONTROL
> registers.

I'm saying there should be some interlock between these two settings, if
nothing else setting DSP A mode should force TDM mode with automatically
configured slot sizes.

--7uVBzkQ09VJrlG8A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSS+KgACgkQJNaLcl1U
h9BaHgf+PmazZFiaoqkNhCaUKsZylWCGAFPo+cgvXRDHq5Knkow2MpiNkogFgGJf
I/9l7+LvZ8II/1BIxBVK4slt5eygq94wMkzA3q4UOVq0z0npBQZNfM3osCGXGOKW
P3h77NAS5OSyNhe4GcKMSmRyiG4cPc1QYp6/KDJSuUWXHUaQMXQG9nWNv718Fsxj
gtD96exbO3v2B5a/y8D0tGXhFCNU5xw9ZOlkXQULZtD/FD6oYL2loZ26os0Js7o5
qhmuoxz7ymH+ZLeLZZZxXNixaj8CcksYNiCWlWIj8VPxfEAmegLac3GzFWu7f8GW
VH52b6Q6SFn9Gu5bjcJZGj8M6ClZfw==
=1W9y
-----END PGP SIGNATURE-----

--7uVBzkQ09VJrlG8A--
