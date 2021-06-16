Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 948AB3A9A9D
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Jun 2021 14:40:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 277A31673;
	Wed, 16 Jun 2021 14:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 277A31673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623847240;
	bh=BqQs5ky3xD/FTxyCNFJmG1IA32q+vNq1bB2BY9ZJ04w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nd8hqtmc76KiZpfU7rqMin/U5w+QqmKh26dGi4dIu9ojNzu1p4C1PNCE4Or9bXlmw
	 43k9WrRhJ/eucy4YuPKoQguT25Tf6abLa2o2q4ijU5OSLjGYn7wRVPydWsbtcyXWJU
	 NXtk8JEFheQ5ip9UlDzdXlf+Q/kd5lSqaLvFRFq8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 947B2F80423;
	Wed, 16 Jun 2021 14:39:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0FF3F80423; Wed, 16 Jun 2021 14:39:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE2D5F80165
 for <alsa-devel@alsa-project.org>; Wed, 16 Jun 2021 14:39:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE2D5F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="OjMviC7J"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="NsJGbmOW"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id A791A5805A6;
 Wed, 16 Jun 2021 08:38:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 16 Jun 2021 08:38:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=4iau2WjkU1IOCCwO+rrQYEUN9wa
 FEVc6uwqNfTtIcMw=; b=OjMviC7JjCmwYjaNv82zVecjIS5ou592RSvCz9gQAuy
 aEm4eM9snzxNA2bxaTQ5xltJhvsTUBmqY8N50SNNNsPMWTVWF+rsr30KUBEdlsOJ
 CLuWt7xudfw1gKNCG8xCPrWgpjlYoh5AOPGcv9QrMreUWXAAzwTFuK3nG3HeozEf
 lVFwiHxaogIr1jWBP/VJsApb+bob3pN6hF0pz1RsmzyGY7PONEr498njiUS+sAAf
 Jkf82n75GOHRgVc3DALPq6atgceWdY8DHXS8xSY6Ybcvj6lj0UMWCiBobAOjYy4B
 EsSW9ElJiJvDIjCty8m6ELw0JGd4md7jmIKco7buBkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4iau2W
 jkU1IOCCwO+rrQYEUN9waFEVc6uwqNfTtIcMw=; b=NsJGbmOWw7S6XMeGTgI3Z4
 qWq4CCDQPYyOR7LbqKwNXre6NUQvDQ0FpEB9yBzrOQ7uzj/LpvWWdulIFgEjgFsY
 lBA3ZO1W2bO+L9Dgqjfg8A3DsFM0AxkbXoyqvtwLr+Mn7wKEeXWj0lNOt5UytL2Y
 AqbGWIgpcfdPBfbAup2OF7umZG1EVaQWpfAIzgh7zKSjejkNF0JgOltlKSHaBbOe
 ETXhsKYATgi5ALFXWmBOxsOdynk6IBVtBk7wqFcJh6hAXpe/StVZmKNJJmkgtAx6
 dL2QYdNzxv2uz99VE4tMbdk3C+s9yy/eENpboVJolZv5Z9nP4IUNbBiCWS/9R+bg
 ==
X-ME-Sender: <xms:4fDJYJj_2ydGzMxgKaXnynTSSKDMU4tvbtLhjmwipbLPK0cdmWWaww>
 <xme:4fDJYOB_ZFiaA7zZI76JtTgKceSTp6IZjWmmfRxxGqZHtx8hN99eR_ooL6c2WYB36
 UDN7lYhbj5dAEDIkLk>
X-ME-Received: <xmr:4fDJYJEKjgcnSt5uFdqf_1p7xxLgzH8IUKFbhKL9Mj4Giv71FCQj6Fq35_kC-tD5AS7zMgupFCyicKoehoOtJ7-CQo5SDr0-bNQG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvledgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvgestggv
 rhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeeigfdtteffhefhfffhkeetvdeige
 dvfeeijedttdevveeiudejgeduvdehvddujeenucffohhmrghinhepuggvvhhitggvthhr
 vggvrdhorhhgpdihrghmlhdrshhonecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:4fDJYOQxiJVaK64Nu2RFZISR_OEYmOfuqK8g-x8zGUKJ5W7zfnvPHA>
 <xmx:4fDJYGzaQ_pqDSZc16pQyJJf2PO5nD-xpJfWuXGleabIY6xRee23ZQ>
 <xmx:4fDJYE6klwl8K2xRqmvM7jU-P0sdseUlO-G9UDd8ltRf7_tlcwOtAA>
 <xmx:4vDJYKeTXUDHOhd4phbfxvOBwXaqn8fU0EPT9moXDd1GTeNOXePPSQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Jun 2021 08:38:57 -0400 (EDT)
Date: Wed, 16 Jun 2021 14:38:54 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?54+t5rab?= <fengzheng923@gmail.com>
Subject: Re: [PATCH 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings for
 DMIC controller
Message-ID: <20210616123854.hcdlpqc6owyqn3fu@gilmour>
References: <20210615130737.2098-1-fengzheng923@gmail.com>
 <20210616084920.y6yjic4sau6ungv5@gilmour>
 <CAE=m619_52DDC_up=QqRXkF88uJR6CcAJqentnBzb=pxL7LhxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hi7zosja6vhzuga5"
Content-Disposition: inline
In-Reply-To: <CAE=m619_52DDC_up=QqRXkF88uJR6CcAJqentnBzb=pxL7LhxA@mail.gmail.com>
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


--hi7zosja6vhzuga5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 16, 2021 at 06:56:25PM +0800, =E7=8F=AD=E6=B6=9B wrote:
> Hi,
>=20
> Maxime Ripard <maxime@cerno.tech> =E4=BA=8E2021=E5=B9=B46=E6=9C=8816=E6=
=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=884:49=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Hi,
> >
> > On Tue, Jun 15, 2021 at 09:07:37PM +0800, Ban Tao wrote:
> > > The Allwinner SoCs feature an I2S controller across multiple SoC
> > > generations.
> >
> > Which SoC generations?
> >
> > > Signed-off-by: Ban Tao <fengzheng923@gmail.com>
> > > ---
> > >  .../sound/allwinner,sun50i-h6-dmic.yaml       | 66 +++++++++++++++++=
++
> > >  1 file changed, 66 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/sound/allwinner=
,sun50i-h6-dmic.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun50i=
-h6-dmic.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6=
-dmic.yaml
> > > new file mode 100644
> > > index 000000000000..81d40c374e44
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmi=
c.yaml
> > > @@ -0,0 +1,66 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/sound/allwinner,sun50i-h6-dmic.ya=
ml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Allwinner H6 DMIC Controller Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Ban Tao <fengzheng923@gmail.com>
> > > +
> > > +properties:
> > > +  "#sound-dai-cells":
> > > +    const: 0
> > > +
> > > +  compatible:
> > > +    const: allwinner,sun50i-h6-dmic
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: Bus Clock
> > > +      - description: Module Clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: apb
> > > +      - const: dmic
> >
> > The convention we use is bus and mod
> >
> > > +
> > > +  dmas:
> > > +    maxItems: 1
> > > +
> > > +  dma-names:
> > > +    const: rx
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +required:
> > > +  - "#sound-dai-cells"
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - dmas
> > > +  - dma-names
> > > +  - resets
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    spdif: spdif@5095000 {
> >
> > The label and node name seems wrong?
> >
> Yes, in fact, I don=E2=80=99t know much about yaml format files.
> The allwinner,sun50i-h6-dmic.yaml file is based on
> allwinner,sun4i-a10-spdif.yaml.
>
> So, How do i convert txt file to yaml file, for example:
> ---------------------------------------------
> Required properties:
>=20
>   - compatible         : should be one of the following:
>     - "allwinner,sun50i-h6-dmic": for the Allwinner H6 SoC
>=20
>   - reg                        : physical base address of the
> controller and length of memory mapped region.
>=20
>   - dmas               : Generic dma devicetree binding as described in
>                          Documentation/devicetree/bindings/dma/dma.txt.
>=20
>   - dma-names          : DMA have to be defined, "rx".
>=20
>   - clocks             : Contains an entry for each entry in clock-names.
>=20
>   - clock-names                : Includes the following entries:
>        "apb"             clock for the dmic bus.
>        "dmic"           clock for dmic controller.
>=20
>   - resets             : reset specifier for the ahb reset
>=20
> Example:
>=20
> dmic: dmic@5095000 {
>         #sound-dai-cells =3D <0>;
>         compatible =3D "allwinner,sun50i-h6-dmic";
>         reg =3D <0x05095000 0x400>;
>         clocks =3D <&ccu CLK_BUS_DMIC>, <&ccu CLK_DMIC>;
>         clock-names =3D "apb", "dmic";
>         dmas =3D <&dma 7>;
>         dma-names =3D "rx";
>         resets =3D <&ccu RST_BUS_DMIC>;
> };
> ---------------------------------------------

Just like you already did :)

Aside from the few comments, what you did is spot on. Just remember to
run make dt_binding_check after you wrote your schema

Maxime

--hi7zosja6vhzuga5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYMnw3gAKCRDj7w1vZxhR
xa8zAP9aN57ypYMSpS8opiH1Ou8RZBFJXFHjtm70c9SstASQUwD/TH9k2r8KZW88
mj/U7b8kdsCLrj8AkyMev6jhXIG3PgI=
=tDFN
-----END PGP SIGNATURE-----

--hi7zosja6vhzuga5--
