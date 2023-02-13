Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F37F9694604
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 13:38:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FF0E201;
	Mon, 13 Feb 2023 13:37:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FF0E201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676291924;
	bh=uBHjrTWQKkfaPwze/tEkM/PBOCV8FGkdpjBjVEqbGic=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eq1IdP1NQEapw6p2w5OwGHgQVqZgGYiKI6n2MNLwTdfJ7DIsiRQ1xpeQyZf7PP8q6
	 vXMi4mTjOIvK3FV7KZ1u72FdMm2b0lzebT9v/tYw/GogF1waThr/jdz3HYWrdk/JtA
	 ObvrX9aGxFs2PDtTwtWYvtyrGO1rU/uDw4CI4JIM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58A18F804B0;
	Mon, 13 Feb 2023 13:37:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D93EF804B4; Mon, 13 Feb 2023 13:37:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E192CF800B0
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 13:37:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E192CF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jiwrzEwr
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BBD4CB811B1;
	Mon, 13 Feb 2023 12:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1122CC4339B;
	Mon, 13 Feb 2023 12:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676291858;
	bh=uBHjrTWQKkfaPwze/tEkM/PBOCV8FGkdpjBjVEqbGic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jiwrzEwrU2PFdlUVdVzzWTVdEqD6IhKKf5TLMYAJgikO90BhA6kETslVbsYVLlE7M
	 UkLhfirCj4SLItq8VgwVeIdscYboRy53D2CnkqpQhZXAXBrrloDKk4JMD5NztaBkRC
	 aUsC0UPHm2o1PekgC9katxXe+z9TYbAsq/JyH2TLgepyo3LgfzEc02OI/+o/s5LVtL
	 YoOgP/uxfGacHbegdtVB6jISNO1Koiqp7vbQ8NE8E86tfHcijsymTDFLUlQ9ajQvPT
	 F0pdJBhyKUpANdwuQDsA2Ch/L1HQxYGt6ZAzOft1MYZtNIT3OrEClZfy6Ww5qAOafO
	 6SSa53TOqQpTA==
Date: Mon, 13 Feb 2023 12:37:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Janne Grunau <j@jannau.net>
Subject: Re: [PATCH 14/17] dt-bindings: sound: apple,mca: Add t8112-mca
 compatible
Message-ID: <Y+ovEeS5KSkiHHQ1@sirena.org.uk>
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
 <20230202-asahi-t8112-dt-v1-14-cb5442d1c229@jannau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hLckiemEQMgkNtNC"
Content-Disposition: inline
In-Reply-To: <20230202-asahi-t8112-dt-v1-14-cb5442d1c229@jannau.net>
X-Cookie: Serving suggestion.
Message-ID-Hash: 2Z73EIWJQAWLLV6XJKDJPVU6MBMFNXXC
X-Message-ID-Hash: 2Z73EIWJQAWLLV6XJKDJPVU6MBMFNXXC
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>,
 Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2Z73EIWJQAWLLV6XJKDJPVU6MBMFNXXC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--hLckiemEQMgkNtNC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 12, 2023 at 04:41:24PM +0100, Janne Grunau wrote:

> This trivial dt-bindings update should be merged through the asahi-soc
> tree to ensure validation of the Apple M2 (t8112) devicetrees in this
> series.

Given that we're at -rc8 it seems like it would be more sensible
to just merge this now so it's in -rc1, it doesn't seem likely
that everything will get sorted prior to the merge window?

--hLckiemEQMgkNtNC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPqLw0ACgkQJNaLcl1U
h9Cusgf+KHIMbGjZ94f/3Md7bYbHGXWVbYeqzBW/6+lEkfiiRKOh1voFts8mMAgR
mq955EflP3IhKLBUuoGwSSLqT51rnR5O/pkjilihYcqhc4WE/GgOm7AI3kopomWN
FclT/xp6xwg7YIb9J3LcY0CsrpHDyP6xlAdG+Lt2etc++xyp0EA0Hkv+i/QlZDw6
nomffp+VkEKSYZFPh8KAPWs9yz3MKDLgrUFsOwdLYYT6B4eRcT7c6Vq52E91jxY8
TW55W285X2sfvt27ZeWL6kou1HHDoySqBO+mfp/ejw4llMuOWngRjqYKrh+E/JJH
dKHCW35kvUwwnjMsMGTaBK4tfrlC9A==
=h6Bg
-----END PGP SIGNATURE-----

--hLckiemEQMgkNtNC--
