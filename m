Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A716A6205
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Feb 2023 22:59:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F52574C;
	Tue, 28 Feb 2023 22:59:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F52574C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677621598;
	bh=EApezt/xrKSUqcwtPB/lYFfV3ScYq2GN1UtJeJ9Yc+c=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=myCjhdzAbWJ5Elae2b1k8fH33NfqyrxLDw5397Y4uEuQMuC8bTRZ6btEASdZhdvkd
	 ObMhAipr/E6i+Mh98fqcZhkLQJTjYOrxkUYrrMMnylA2K8KeV2/iuDAxyZOw62T5DI
	 X9kWFPAS+0Z47i+dtprt9sEqQWcoetqMIAbEOb2k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67634F802BE;
	Tue, 28 Feb 2023 22:59:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3421F8049C; Tue, 28 Feb 2023 22:59:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CE84F800BA
	for <alsa-devel@alsa-project.org>; Tue, 28 Feb 2023 22:59:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CE84F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cUYRfMKe
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 33EEC611F4;
	Tue, 28 Feb 2023 21:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB95C4339B;
	Tue, 28 Feb 2023 21:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677621538;
	bh=EApezt/xrKSUqcwtPB/lYFfV3ScYq2GN1UtJeJ9Yc+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cUYRfMKeK+p4AXiL2yRjGGOTvS01vXKugWnhKFkzYTZRH2viq9VagyHHpn9RYO06E
	 7161gTVDpaIwYbqDcrlmVPN0o/cugLq/+gDN1auuBxF/uZPh9OpMPhpNLHF+53h7/f
	 DoT1TtdWlebJgWhfw4OQoDjoiCvi0XiuNGbnLek0xsWC1Yu/OVJnYFJLHZprcXRPiC
	 7v5WbvF/tLxYWQO6MfSWwUmY8KP3GIJ8Wrz1RAHaWryhlvgwMlV6ERJb7McemY4aKl
	 vDe/gg3FPRtgYCN2VZVVoHhp+1BFL8FRLCFU2j+s5qzK8bnhmFkzpbIMlP6wDedOvJ
	 P7W07HuSh0APg==
Date: Tue, 28 Feb 2023 21:58:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix SPI and I2C bus node names in examples
Message-ID: <Y/55H2lZZf7a3Xbu@sirena.org.uk>
References: <20230228215433.3944508-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MyLQObbLmZa89Gv8"
Content-Disposition: inline
In-Reply-To: <20230228215433.3944508-1-robh@kernel.org>
X-Cookie: Single tasking: Just Say No.
Message-ID-Hash: 7BK5WYTCNWLVQ3QTHLCGADCO5BSQCF7X
X-Message-ID-Hash: 7BK5WYTCNWLVQ3QTHLCGADCO5BSQCF7X
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Stephen Boyd <sboyd@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Wolfgang Grandegger <wg@grandegger.com>, Kalle Valo <kvalo@kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-can@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-pm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7BK5WYTCNWLVQ3QTHLCGADCO5BSQCF7X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--MyLQObbLmZa89Gv8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 28, 2023 at 03:54:33PM -0600, Rob Herring wrote:
> SPI and I2C bus node names are expected to be "spi" or "i2c",
> respectively, with nothing else, a unit-address, or a '-N' index. A
> pattern of 'spi0' or 'i2c0' or similar has crept in. Fix all these
> cases. Mostly scripted with the following commands:

Acked-by: Mark Brown <broonie@kernel.org>

--MyLQObbLmZa89Gv8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP+eR4ACgkQJNaLcl1U
h9DqWQf/fzAqwVcR5vEvDlZIOyeJ93q74mz/Rl0dA1kXgtn8VCrgOTQv1BlYjrCE
YSIOVaCA5NiKGfDp99bOWw61eY5vrMwgY1dL8JB2fdMVGhAnk4dN0ewMN2lc2Zxs
/aZeYDxjeMRJOEv+9UinuEKROblNzSwDJFxyTFoOddlrYg7leB2icMBQRsd3m5+h
Thr8sNClvv0OyNBx5LchcIvla+hu2AAQSAvLHe/Q0aUCOGooYIUsdfDeNqNJa6vF
7wjeN3etYc7wp/PyeJKwrO9AhmkCXzazy4OwW4esqLUxQEO88PTJxkHJjNW+tvu3
lFl5XDtQUMJ9ACGlaRM0sEP28dPf5w==
=8se/
-----END PGP SIGNATURE-----

--MyLQObbLmZa89Gv8--
