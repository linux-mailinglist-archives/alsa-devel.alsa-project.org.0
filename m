Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1763401C8
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 10:19:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C9F61693;
	Thu, 18 Mar 2021 10:18:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C9F61693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616059155;
	bh=wG29cqpTFwh1U5z1wLV7rQaOMjdg76t/emDgukbgGPA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eISs3NhMgPeramSdJH1Z7ItQz66dxPz6VvNKPMJTvfobRnUKQUOjbKpTqNZsMSw6h
	 EFewRenDKEeUf7JVP/KA6bATr1kLOXkrl6zUlJ8TVvDDHkt+KTzTeEN+yqEatRQ+eW
	 WKkU+EjxlaMfXUhZ5qD5DRvKRi9Zp0liZKVW/XSs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB985F80430;
	Thu, 18 Mar 2021 10:16:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37BC8F80163; Tue, 16 Mar 2021 21:51:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52D6CF80148
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 21:51:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52D6CF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AlNQS3sI"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13BFE64F39;
 Tue, 16 Mar 2021 20:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615927857;
 bh=wG29cqpTFwh1U5z1wLV7rQaOMjdg76t/emDgukbgGPA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AlNQS3sIaueBa+aw2xmovMe1PfQpQm5qijVCOSGd8xp7M9iazzG1IUStwNGO5HeZC
 Woi/Dph3BYZAmC56XBt3kJr3bwnkvQj2aDY7UFFx2ivsYFJiciyKe45BxGDwaT8ehe
 M0RbWE1Y+H1S9cTONIecNzYWWaFu6v7xEZwQ5IfXL37A72SR2GKjPp8X/L5w1LVpxF
 ZFE26OAbbS/bVvfHkrxmrxSLnzqy6F/HxXLzSm9He8VegAzfrTEaUHv0/VaoXBnSZ1
 sovrSnWFj5M9cWzbaEB1C/kMkolcauJuX24Lxy1SVfPoCHZ39NRwxtVJ25aNatAnbG
 n7tMgcmC+O2Hg==
Date: Tue, 16 Mar 2021 20:50:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop type references on common properties
Message-ID: <20210316205054.GE4309@sirena.org.uk>
References: <20210316194858.3527845-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hwvH6HDNit2nSK4j"
Content-Disposition: inline
In-Reply-To: <20210316194858.3527845-1-robh@kernel.org>
X-Cookie: Results vary by individual.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 18 Mar 2021 10:16:09 +0100
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-remoteproc@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Suman Anna <s-anna@ti.com>, Cheng-Yi Chiang <cychiang@chromium.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Odelu Kukatla <okukatla@codeaurora.org>, linux-pm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Benson Leung <bleung@chromium.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>,
 netdev@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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


--hwvH6HDNit2nSK4j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 16, 2021 at 01:48:58PM -0600, Rob Herring wrote:
> Users of common properties shouldn't have a type definition as the
> common schemas already have one. Drop all the unnecessary type
> references in the tree.

Acked-by: Mark Brown <broonie@kernel.org>

--hwvH6HDNit2nSK4j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBRGi0ACgkQJNaLcl1U
h9Bd6wf8CLasn7HPb9h3JBOHpH6rnzMDSD3qxnwn0mb6TNjjFgQqLvwZXfWTvJiz
gkxGMMc+CwnV2uwRzJZLMaI25wo8z//d9xmFX/CVHiti3FZ45EooKQJ41a+CoHl7
l2J+X1NiGe7EoOgJDvfrHK0+1OuZXN3hnBeNrx8gjqOoBtnbQbvsVhcjnUnN+i3s
XMZwu0IJQ4MIFscfo3TlaXHt7MeWB4xg8uS/bU+6/OfuTIQmJ14midFU/YqJ6kSl
QXBZ0oYXIheB+dwso+WQgBRJ3p2r8ob2yZfVwQLkZps30q6VurGqNeDSdRILHbz1
IaOFXt46ttiq2cAG29TuJxNbVa8KzA==
=BRod
-----END PGP SIGNATURE-----

--hwvH6HDNit2nSK4j--
