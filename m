Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AFE52EAE7
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 13:35:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63133176B;
	Fri, 20 May 2022 13:34:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63133176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653046511;
	bh=SvQDWvHaw/Ro4+sDEA3LzYO4ioj59uSH1d5BBRvD684=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SSS3OtCTGpcrZSv3pb/w8xElIWZKaK20UduxyRqWuM7f3jiKjI2VIBKidKyKnp7Ny
	 00aQ7jvOS3RuDz3skckEkN78PfjWnajF1c9rV9/CeySfqcIx/QqqhP0cqy/h5Tk9Ng
	 34wDDc8Mzsn/hEbVhluY5OJW8YYUdp+nFTUFjsKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75AC6F80520;
	Fri, 20 May 2022 13:33:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB6F1F8025D; Thu, 19 May 2022 23:20:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CADFF800D1
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 23:20:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CADFF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lZPvgxQ/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8BB9761D2A;
 Thu, 19 May 2022 21:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C6FC385AA;
 Thu, 19 May 2022 21:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652995205;
 bh=SvQDWvHaw/Ro4+sDEA3LzYO4ioj59uSH1d5BBRvD684=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lZPvgxQ/0GEOJbdI/RsIgFr7yLZfcUJvpqzkwIfYr6DnYL+2Rhom2zrrp9ZJYTqpF
 2BbR9KFYoHbcXxtwZrm5jEIxoonOr6uHesOrfW2SzdnjGAFe7wRyLtBeOLomEHF142
 GyhjeqDrl/+/XblALv6RzMdFZz//uCum30g8tGHTm+Jh2eHBkWU+fpxNxNOYIVKpdO
 Yz+zapxuT0saXPNbmmikHL5VGRFl3k5i/okcNGRFGOcWY43CajAV5gIwlk5K91/tPl
 FY3nh2Cq1LMWd9FJmk7x7tKje3C8gCWlhNIHrrazJdMY61SXsJMc302TGt3KV0Bc7z
 VYeES8NTlFwKw==
Date: Thu, 19 May 2022 22:19:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Fix properties without any type
Message-ID: <Yoa0egr9vhTHcxjp@sirena.org.uk>
References: <20220519211411.2200720-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eXFy+XxgE7404o6q"
Content-Disposition: inline
In-Reply-To: <20220519211411.2200720-1-robh@kernel.org>
X-Cookie: Some restrictions may apply.
X-Mailman-Approved-At: Fri, 20 May 2022 13:33:12 +0200
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 linux-pci@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Guenter Roeck <groeck@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 chrome-platform@lists.linux.dev, Herbert Xu <herbert@gondor.apana.org.au>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-gpio@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Peter Rosin <peda@axentia.se>,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
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


--eXFy+XxgE7404o6q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 19, 2022 at 04:14:11PM -0500, Rob Herring wrote:
> Now that the schema tools can extract type information for all
> properties (in order to decode dtb files), finding properties missing
> any type definition is fairly trivial though not yet automated.
>=20
> Fix the various property schemas which are missing a type. Most of these
> tend to be device specific properties which don't have a vendor prefix.
> A vendor prefix is how we normally ensure a type is defined.

Acked-by: Mark Brown <broonie@kernel.org>

--eXFy+XxgE7404o6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKGtHkACgkQJNaLcl1U
h9CTcgf/YrxaonL9unlOXD9rVNzVh2gBFZV2wTefQuNDSwkIM40MNQLcoafgcXo5
gFwpnXnCULN4HW9E4gsxeDnj3lcvR/bPgnNtrHetwyPKH/I99KJSgtm6605GyKWF
4d5cVzASF5iCk9z6tn51f2x6jCCLVkVoAOOohCc3nYr1YbXRtQSnKKS8vYaNyqVq
/sELkTEEdwMdl9AML+9S0amyFoPS92ZdcFlFWZIjjzPmidXQxZuL7tGvs9O56vj+
QUESokWc4u2ziIcTQT9X0XXb9dDJjhXWaFiHNc38F7o+ad3kBXAhgzzBzMC/6fLI
/352XipOMFDBOV9MMA03nK4kEtXQBA==
=MbOe
-----END PGP SIGNATURE-----

--eXFy+XxgE7404o6q--
