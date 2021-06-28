Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D553B5E5D
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Jun 2021 14:48:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 902191678;
	Mon, 28 Jun 2021 14:47:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 902191678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624884497;
	bh=OkFQR8+tjy+05Z4MH67IOZwB+3xRzj16FoRW1YyJU8Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UCBSUT5RFSxH5F7fAPaBUxTZRdmJX6Gcwyf0LzIdYv+14qa72Z92CZIXcOZjvJs+U
	 RyfqmYO8KgmTLA28VD/G+vQlxvMsMaR5Pxg6u6HU/QLoViSYq+wARxsW6VkuKZkV5X
	 cbUEglIaIP8iQliMkUkS/Armc+ZFqczqHnFB8dyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EED3DF80257;
	Mon, 28 Jun 2021 14:46:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54977F80229; Mon, 28 Jun 2021 14:46:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 471F3F8012A
 for <alsa-devel@alsa-project.org>; Mon, 28 Jun 2021 14:46:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 471F3F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="XjUIgoto"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="TH3R+UNm"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9569E58073B;
 Mon, 28 Jun 2021 08:46:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 28 Jun 2021 08:46:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=FGZcwoZwyPYceIqBEn/JL4z0fxH
 5zp8oJcvt5w3ABb4=; b=XjUIgotobppm/S2dYlC7NoZCJ/kNNH0oSeeon95yHoB
 H9MShuY7w68ElblP8T8S1w7sEfRA1EYmMBGLD9ukAEbNEHH6ba24/RfkjfqvUK7t
 XOvKskUlGp3k1hsJWVZv75Tt/rhYAm/vj2itcFPiLNuxQxTn5EZAzuxW25krnkQU
 oLmlnh4qwobducCXpO/lpEtO2QE62N0wLGWGeJdo0nAasd5UJJ4gOIgI2nTR3xoh
 zkC1xOcEiT7rq6mcEgWaIIy0yPpnRQQSDb5SVhnWWKJE+UmS60lBV3xv4p1XNfuk
 +QqFIMhz4Osbcgi8du6Mt8NQq7k8PcSjQoKMnI8MqqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=FGZcwo
 ZwyPYceIqBEn/JL4z0fxH5zp8oJcvt5w3ABb4=; b=TH3R+UNmoK5PEOZO0SEp/9
 NiyHWqi6Z9WkqJHlk3iZ9Cyatb64kvA42MRX1STlR8cAvlQKHFiBD4grIKs8nGUM
 KCHQK9IgD0RfvIo85eYwgwJ9EfW2C1rT3Khb+iVOUp+sSILxN2cQYSxxcyHleXzd
 6YpI04UCgALJtfoBE4Pk/nkld56HRobKfYY0xrEOWPffHrkzuWbu808Cl6IGo23l
 OgTtd8+lwfgAEgWnLLv+zY/8UkAJKEPwBhiUdUQFUugLsomXRB7fEL7OI+LRbSoC
 JaVhxa04zZkRyQE+aTlfEnySfIJGwVD+YJImqofDcG5OeYtpINcbOKCiKGowlpzQ
 ==
X-ME-Sender: <xms:rMTZYNrL03vBsHOo3OnkaqUrKRFqdzTYB4grOdmd7_FsquwcESGZrQ>
 <xme:rMTZYPrDQUOQVbOzEHOCU4-g2seksclyIhrHZONtneskB8E64z4chmq8HR_M3TgDx
 dmt-OvTYtwCWs90tbw>
X-ME-Received: <xmr:rMTZYKNl6yZmXyuEOp8Ge0mErhQByV9xGdDoHezsfL_K9SHAVKI6UPBXcmBVvkQNf_ZZtuwrVoftuexjFxXPBdtzK0EVvIAFJEqN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtvdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvgestggv
 rhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeffteetveeijeetuefhffegkeetgf
 fhieelheehtdduudethffhjedtvddtudelvdenucffohhmrghinhepuggvvhhitggvthhr
 vggvrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:rMTZYI4ksmDYF0Rqye_Zjemx9NMc4sjt7Iy8dfpcV8lyxsrHNhmvHA>
 <xmx:rMTZYM7o3EswVER0tS5OmjiQjoxAOty1lqHhNhB-SA8mE7iCoWwb7w>
 <xmx:rMTZYAjQBolGbcWO8EhD2KMFPdodZd2yvUyB-_GoPb9i5EledZ6Hcw>
 <xmx:rcTZYNGE8d4nF2MgHBficmLTRao3CglHH2dy2cEygBcZwSngR1G96g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 08:46:36 -0400 (EDT)
Date: Mon, 28 Jun 2021 14:46:34 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: fengzheng923@gmail.com
Subject: Re: [PATCH v4 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings
 for DMIC controller
Message-ID: <20210628124634.radw3ywstfdl2fqw@gilmour>
References: <20210625090721.6183-1-fengzheng923@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ersryph7t25vlhha"
Content-Disposition: inline
In-Reply-To: <20210625090721.6183-1-fengzheng923@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, wens@csie.org, broonie@kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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


--ersryph7t25vlhha
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 25, 2021 at 05:07:21AM -0400, fengzheng923@gmail.com wrote:
> From: Ban Tao <fengzheng923@gmail.com>
>=20
> DT binding documentation for this new ASoC driver.
>=20
> Signed-off-by: Ban Tao <fengzheng923@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
>=20
> ---
> v1->v2:
> 1.Fix some build errors.
> ---
> v2->v3:
> 1.Fix some build errors.
> ---
> v3->v4:
> 1.None.
> ---
>  .../sound/allwinner,sun50i-h6-dmic.yaml       | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/allwinner,sun=
50i-h6-dmic.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-=
dmic.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmi=
c.yaml
> new file mode 100644
> index 000000000000..d9107685b78d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.ya=
ml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/allwinner,sun50i-h6-dmic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Allwinner H6 DMIC Device Tree Bindings
> +
> +maintainers:
> +  - Ban Tao <fengzheng923@gmail.com>
> +
> +properties:
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  compatible:
> +    const: allwinner,sun50i-h6-dmic
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Bus Clock
> +      - description: Module Clock
> +
> +  clock-names:
> +    items:
> +      - const: bus
> +      - const: mod
> +
> +  dmas:
> +    items:
> +      - description: RX DMA Channel
> +
> +  dma-names:
> +    items:
> +      - const: rx
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - "#sound-dai-cells"
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - dmas
> +  - dma-names
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dmic: dmic@5095000 {
> +      #sound-dai-cells =3D <0>;
> +      compatible =3D "allwinner,sun50i-h6-dmic";
> +      reg =3D <0x05095000 0x400>;
> +      clocks =3D <&ccu 101>, <&ccu 100>;
> +      clock-names =3D "bus", "mod";
> +      dmas =3D <&dma 7>;
> +      dma-names =3D "rx";
> +      resets =3D <&ccu 42>;
> +    };

You can keep the clock and reset indices, it's more readable that way,
you just have to add the headers dt-bindings/clock/sun50i-h6-ccu.h and
dt-bindings/reset/sun50i-h6-ccu.h like what
Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml
is doing.

Also, this controller has an interrupt. Even if the driver doesn't use
it it should be in the binding.

Maxime

--ersryph7t25vlhha
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYNnEqgAKCRDj7w1vZxhR
xae2AP4qPv9ltkegaT6Rdk9GGRXJUgBLvDbFtsYo+bDb8jTrGwD/S+Pb9PvRC7ey
moBzsqtqHcl2FG/ce2wg5N3rQ9f7EwU=
=c0fk
-----END PGP SIGNATURE-----

--ersryph7t25vlhha--
