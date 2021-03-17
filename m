Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D063401D7
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 10:20:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3420F16B0;
	Thu, 18 Mar 2021 10:20:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3420F16B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616059257;
	bh=0BP8cAWztylqalmk4/OoD2Cy3lwqhFZyUP90THNtZ1g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X6OmyyiERvGjVo0ceyMFKYvk7aOcnkMe4/gCUn4o20GIpnINOnLy6uQMTtx1/nkpD
	 kRI2X7/9rMmhshljOuR5fHjTGC1NVhqrOZ6q8ggb2Cu0vcqW/hMx+iJkD2DKUzPvpU
	 U1DBtn3xnp39mvXx/7VjWySHuccFUA5WSQ9qJGdk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61C57F804D9;
	Thu, 18 Mar 2021 10:16:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FB40F8021C; Wed, 17 Mar 2021 10:44:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C315F8013F
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 10:44:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C315F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="cAeuP0qb"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="srtYkEJc"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 42DB95804A4;
 Wed, 17 Mar 2021 05:44:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 17 Mar 2021 05:44:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=0BP8cAWztylqalmk4/OoD2Cy3lw
 qhFZyUP90THNtZ1g=; b=cAeuP0qbO4eJljrqIMiebUowfsB/GxgB0fgTHUeF5Yo
 +dFTnomigRMKK9PRko4dMH1zdWY+F8CZlLyyxbotj7dX6MhNo0ZdCfBIYlKvh+/Q
 d3gw0kvUlYz+vN963+21XhyNQAmvwJjVEJA+avi6mYRcwb/KVLdURvi1B7dODlEU
 qwo0pQOkSpU56PPi4NYkSD3fDTg0e80FKnqzVVH4HrLSduY507MOGgRp94x8tow8
 C9HfLeh5qs5U1GUDOdKhbybH8VweO9ZHI/Nfv3WQtBMysN51MQalqCy7G6KdFGe4
 mf58Y/uLDUegOKYAI0UMYq6LPHm6VBPkmbHqO3+RurQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0BP8cA
 Wztylqalmk4/OoD2Cy3lwqhFZyUP90THNtZ1g=; b=srtYkEJcS4huqv80LlbbSG
 Fi8pxOzOhws71OZtEdfvdz4enBpQRhE0iI6Werq9aNVPnUT1M8U+utcOXh5XVeKQ
 FokaGwGP35MMAOOqtri0m/vNjHo7TKirpcMZ/5W9e2L9Q2AF3sm0/WG+GT0NJggk
 x83KKGNn2DhU8Bd9sU4Sgt1j3dm5XQtFyacw9sqD5kjEFms6c7sxEkUtKUvv63MW
 qCQbrdMZ3s7LT10cwkeBrK/9NP5d5HvxG2zKV+2c3gCChb+8ufEt4coS7G9P7gdm
 afb8Huog5c6refVYER6q+O7lbAN3g/n8yJC7Tc4bejsE73cF9Z1jUXn4fpW2Lq4Q
 ==
X-ME-Sender: <xms:ec9RYK39Y_a4zSfTwUaRQx1LJtTowhZfqZ55tBkolaY3hmRBQTPI7Q>
 <xme:ec9RYNGM7ueV86Apfa1zFhVwr_eYaKeWpNprnytd5VORSYUGMtqFf5JVwUDGqEq2i
 aqHVVd170LHaeJKjA4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ec9RYC4TIhkXMH2jEndCl15t4aT4tnjEM-i5V5FzoBn8t6HtdaEwrw>
 <xmx:ec9RYL3qCCj83UuidkPt_WjshQ4_zjIBrTcOs3V7XXAW0QPplWZljQ>
 <xmx:ec9RYNGEMZcMZqGZqtAf8jav8BKADI6fd14OggVtOw4i_pnVvBSC-w>
 <xmx:fM9RYDRuhS2ysirc2Y7YeQnTiJcpzjxydTqzDoyqpnbGWb-Av1ZQ0w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 21F05108005C;
 Wed, 17 Mar 2021 05:44:25 -0400 (EDT)
Date: Wed, 17 Mar 2021 10:44:22 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop type references on common properties
Message-ID: <20210317094422.tlzbuvfanfwxenps@gilmour>
References: <20210316194858.3527845-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lj6yx5qimtjaxe7l"
Content-Disposition: inline
In-Reply-To: <20210316194858.3527845-1-robh@kernel.org>
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
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
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


--lj6yx5qimtjaxe7l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 01:48:58PM -0600, Rob Herring wrote:
> Users of common properties shouldn't have a type definition as the
> common schemas already have one. Drop all the unnecessary type
> references in the tree.
>=20
> A meta-schema update to catch these is pending.
>=20
> Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Ohad Ben-Cohen <ohad@wizery.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Cheng-Yi Chiang <cychiang@chromium.org>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Stefan Wahren <wahrenst@gmx.net>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Odelu Kukatla <okukatla@codeaurora.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: Suman Anna <s-anna@ti.com>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-can@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: linux-remoteproc@vger.kernel.org
> Cc: alsa-devel@alsa-project.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Thanks!
Maxiem

--lj6yx5qimtjaxe7l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYFHPdgAKCRDj7w1vZxhR
xQMxAQCrXmT5FCI3eJYBXW/EUFlqbCTwnoDOAEjWcGLbj2XTCgEAxkEyHVxsELxK
YT52x5rpTHartnwQ86HMToeCxMjKlAc=
=93nZ
-----END PGP SIGNATURE-----

--lj6yx5qimtjaxe7l--
