Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDE1663A82
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jan 2023 09:08:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EB99DB8F;
	Tue, 10 Jan 2023 09:07:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EB99DB8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673338116;
	bh=h4ANQNaGsH08Jgn0Mm4rergXT4JVzFRkOUTF86L6lIk=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=A3mSVCaHgEnZ9QtQWh61XJr9UqdIgadWiycOifbhbqRSsorSM+Z/28YIoRZhifeKi
	 IEeLv1ZY1CiMvD7bbMFQ2Rx0RhgLa3+jjVY4VxEE1E1ed8Yz0N0/zlNKfz7ZMfJfLU
	 U7sUNriTzyfuA+FCGGAa7W+uT9lmYUjhBQcoDyLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16F3FF804DD;
	Tue, 10 Jan 2023 09:07:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98399F804DC; Tue, 10 Jan 2023 09:07:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 457A2F8026A
 for <alsa-devel@alsa-project.org>; Tue, 10 Jan 2023 09:07:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 457A2F8026A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Ys6OT1+2
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E6D8C100002;
 Tue, 10 Jan 2023 08:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1673338056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZgsA3blZRkDhqGMnNA0R6u5EyqOGZtYvAT+Wv5NomZg=;
 b=Ys6OT1+2bp2JYHo9mPYmhymzvJZTYOD3fMVHRIhU3ImPlylTaTP7MZa3uFgOrz/CvgzjQ/
 1770lhQoUVCHCn6xm1iLySNLgGab8ZMbMBPrT0Tf7XEAWvlCyjIs7qirDks6ATZh0a9YW+
 SnMEN1s7lQrmNRTdKOhgPXLHBVDJRmy/u5Ckqs0h+snkD02n7c/E/4kW86C7QvebMmpVRJ
 flMpdVvpFa9DDU074ocMpMNQ8oL1KzCJCLr9FgSCoSe0oflZ0zwZ7U+NvwaPZnxhccaYnd
 my4L007gwd/5XXRVFJlvE483mkgyDZofuuUDwZGPggBYVPuPUXQ7PzpEhXpK8w==
Date: Tue, 10 Jan 2023 09:07:28 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 08/10] dt-bindings: sound: Add support for QMC audio
Message-ID: <20230110090728.2024b5eb@bootlin.com>
In-Reply-To: <c393e532-d466-366b-a390-65de47c58b6a@linaro.org>
References: <20230106163746.439717-1-herve.codina@bootlin.com>
 <20230106163746.439717-9-herve.codina@bootlin.com>
 <c393e532-d466-366b-a390-65de47c58b6a@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Takashi Iwai <tiwai@suse.com>, Nicholas Piggin <npiggin@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Li Yang <leoyang.li@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Mark Brown <broonie@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Krzysztof,

On Sun, 8 Jan 2023 16:16:24 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 06/01/2023 17:37, Herve Codina wrote:
> > The QMC (QUICC mutichannel controller) is a controller
> > present in some PowerQUICC SoC such as MPC885.
> > The QMC audio is an ASoC component that uses the QMC
> > controller to transfer the audio data.
> >=20
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---
> >  .../bindings/sound/fsl,qmc-audio.yaml         | 110 ++++++++++++++++++
> >  1 file changed, 110 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/fsl,qmc-aud=
io.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml=
 b/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
> > new file mode 100644
> > index 000000000000..b3774be36c19
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
> > @@ -0,0 +1,110 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/fsl,qmc-audio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: QMC audio
> > +
> > +maintainers:
> > +  - Herve Codina <herve.codina@bootlin.com>
> > +
> > +description: |
> > +  The QMC audio is an ASoC component which uses QMC (QUICC Multichannel
> > +  Controller) channels to transfer the audio data.
> > +  It provides as many DAI as the number of QMC channel used.
> > +
> > +properties:
> > +  compatible:
> > +    items: =20
>=20
> Drop items.

Will be dropped.

>=20
> > +      - const: fsl,qmc-audio
> > +
> > +  '#address-cells':
> > +    const: 1
> > +  '#size-cells':
> > +    const: 0
> > +  '#sound-dai-cells':
> > +    const: 1
> > +
> > +patternProperties:
> > +  "^dai@([0-9]|[1-5][0-9]|6[0-3])$":
> > +    description:
> > +      A DAI managed by this controller
> > +    type: object
> > +
> > +    properties:
> > +      reg:
> > +        minimum: 0
> > +        maximum: 63
> > +        description:
> > +          The DAI number
> > +
> > +      qmc-chan: =20
>=20
> Missing vendor prefix.

Will be changed to 'fsl,qmc-chan'

>=20
> > +        $ref: /schemas/types.yaml#/definitions/phandle-array =20
>=20
> Why this is not a phandle?

I have try '$ref: /schemas/types.yaml#/definitions/phandle'

I have an error from make dt_binding_check:=20
  dai@16:fsl,qmc-chan:0: [4294967295, 16] is too long

I need a phandle with an argument ie <&qmc 16>.
Is there an alternative to phandle-array to handle this case ?

>=20
> > +        description: phandle to the QMC channel> +        maxItems: 1
> > +
> > +    required:
> > +      - reg
> > +      - qmc-chan
> > +
> > +required:
> > +  - compatible
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +  - '#sound-dai-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    qmc_audio: qmc_audio { =20
>=20
> Same problem as in previous patch.

Changed to 'audio-controller'.

>=20
> > +        compatible =3D "fsl,qmc-audio";
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +        #sound-dai-cells =3D <1>;
> > +        dai@16 {
> > +            reg =3D <16>;
> > +            qmc-chan =3D <&scc_qmc 16>;
> > +        };
> > +        dai@17 {
> > +            reg =3D <17>;
> > +            qmc-chan =3D <&scc_qmc 17>;
> > +        };
> > +    }; =20
>=20
> Best regards,
> Krzysztof
>=20

Thanks for the review.

Best regards,
Herv=C3=A9

--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
