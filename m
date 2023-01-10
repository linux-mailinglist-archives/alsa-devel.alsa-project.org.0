Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B35663A7F
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jan 2023 09:08:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06B72DB85;
	Tue, 10 Jan 2023 09:07:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06B72DB85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673338080;
	bh=5GTi7+RPVgkRxMgzw1d9Z/gZXCJ0yFSZeXCQR2MvDtE=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=g7C317uaIsqF97g8O8VlanG8pDRKGwi1zAtJz2ymNLBAJHqa7qiahQg5g+2s9eTvl
	 au1P3SYc9BQlghn2Qcg/soRJg6GEReiROtaWJfV/Sv0zF4L733oKFZ8tNUqjMMmUoM
	 X/V4Iji+20UhhiPEIPHxBIdn9QovvYm8mQeSXSGo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C04F0F8019B;
	Tue, 10 Jan 2023 09:07:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A0E6F804C1; Tue, 10 Jan 2023 09:06:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6E2DF8019B
 for <alsa-devel@alsa-project.org>; Tue, 10 Jan 2023 09:06:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6E2DF8019B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O1Opaji6
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3D5F824000B;
 Tue, 10 Jan 2023 08:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1673338015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7tanCnt41dmd3a1gqbCEA0TYYO9/oTjI6yAv4OQDOAo=;
 b=O1Opaji665s44TE1LAeK3X1D4fYZJDuZSpYGeI1q8gABik0Z1kaEh03swno0937SJj0yue
 74GZCclMht4rcz4psoZvlBrAchwISnRoslZZufPnjF5IrvTUhHz2LldITerMDLfGFUgTms
 vHXaY1Ki1l23UicholMhpxt39CFMdnggwaNe0ljcsOiKVXKdvXP2KpthwiBLx9AG+xADXI
 wI6theO2IKhw2keeah0YYzKanAJEVpCPQbhCl2DFoZDmnrFIHdKhbfqupQ7yd24kqen1xf
 RUnZhIVGv4EnLnguFl4GNBxmLEakSSnAOCuv1ahzmgXZYkitFZFF9fqzE/f3GA==
Date: Tue, 10 Jan 2023 09:06:50 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 05/10] dt-bindings: soc: fsl: cpm_qe: Add QMC controller
Message-ID: <20230110090650.2138edf0@bootlin.com>
In-Reply-To: <76077f5f-fbda-800b-b8d8-6a3f6600f4d1@linaro.org>
References: <20230106163746.439717-1-herve.codina@bootlin.com>
 <20230106163746.439717-6-herve.codina@bootlin.com>
 <76077f5f-fbda-800b-b8d8-6a3f6600f4d1@linaro.org>
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

On Sun, 8 Jan 2023 16:14:47 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

[...]
> > +
> > +  interrupts:
> > +    description: SCC interrupt line in the CPM interrupt controller =20
>=20
> Missing constraints.

'maxItems: 1' will be added in v3

>=20
> > +
> > +  fsl,cpm-command:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Cf. soc/fsl/cpm_qe/cpm.txt =20
>=20
> Missing description.

'fsl,cpm-command' will be removed in v3.
The value needed is determined based on other information.
This is not needed in the DT.

>=20
> > +
> > +  tsa:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle to the TSA =20
>=20
> Missing vendor prefix. Does not look like a generic property.

Will be be changed to 'fsl,tsa'
and also 'tsa-cell-id' will be changed to 'fsl,tsa-cell-id'

>=20
[...]
> > +
> > +patternProperties:
> > +  "^channel@([0-9]|[1-5][0-9]|6[0-3])$":
> > +    description:
> > +      A channel managed by this controller
> > +    type: object
> > +
> > +    properties:
> > +      reg:
> > +        minimum: 0
> > +        maximum: 63
> > +        description:
> > +          The channel number
> > +
> > +      fsl,mode:
> > +        $ref: /schemas/types.yaml#/definitions/string
> > +        enum: [transparent, hdlc]
> > +        default: transparent
> > +        description: Operational mode =20
>=20
> And what do they mean?

I will change with
  description: |
    The channel operational mode
     - hdlc: The channel handles HDLC frames
     - transparent: The channel handles raw data without any processing

>=20
> > +
> > +      fsl,reverse-data:
> > +        $ref: /schemas/types.yaml#/definitions/flag
> > +        description:
> > +          The bit order as seen on the channels is reversed,
> > +          transmitting/receiving the MSB of each octet first.
> > +          This flag is used only in 'transparent' mode.
> > +
> > +      tx-ts-mask: =20
>=20
> Missing vendor prefix.

Will be added, also on rx-ts-mask.

>=20
> > +        $ref: /schemas/types.yaml#/definitions/uint64
> > +        description:
> > +          Channel assigned Tx time-slots within the Tx time-slots rout=
ed
> > +          by the TSA to this cell.
> > +
> > +      rx-ts-mask:
> > +        $ref: /schemas/types.yaml#/definitions/uint64
> > +        description:
> > +          Channel assigned Rx time-slots within the Rx time-slots rout=
ed
> > +          by the TSA to this cell.
> > +
> > +    required:
> > +      - reg
> > +      - tx-ts-mask
> > +      - rx-ts-mask
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - interrupts
> > +  - tsa
> > +  - tsa-cell-id
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +  - '#chan-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/soc/fsl-tsa.h>
> > +
> > +    scc_qmc@a60 { =20
>=20
> No underscores in node names.
>=20
> Node names should be generic.
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-device=
tree-basics.html#generic-names-recommendation

Will be changed to qmc@a60

>=20
> > +        compatible =3D "fsl,mpc885-scc-qmc", "fsl,cpm1-scc-qmc";
> > +        reg =3D <0xa60 0x20>,
> > +              <0x3f00 0xc0>,
> > +              <0x2000 0x1000>;
> > +        reg-names =3D "scc_regs", "scc_pram", "dpram";
> > +        interrupts =3D <27>;
> > +        interrupt-parent =3D <&CPM_PIC>;
> > +        fsl,cpm-command =3D <0xc0>;
> > +
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +        #chan-cells =3D <1>;
> > +
> > +        tsa =3D <&tsa>;
> > +        tsa-cell-id =3D <FSL_CPM_TSA_SCC4>;
> > +
> > +        channel@16 {
> > +            /* Ch16 : First 4 even TS from all routed from TSA */
> > +            reg =3D <16>;
> > +            fsl,mode =3D "transparent";
> > +            fsl,reverse-data;
> > +            tx-ts-mask =3D <0x00000000 0x000000AA>;
> > +            rx-ts-mask =3D <0x00000000 0x000000AA>; =20
>=20
> Keep case consistent. lower-case hex.

Will be fixed

>=20
> Best regards,
> Krzysztof
>=20

Thanks for the review,

Best regards,
Herv=C3=A9

--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
