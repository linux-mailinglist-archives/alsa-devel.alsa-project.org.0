Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B2968BE6F
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 14:38:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E9CC844;
	Mon,  6 Feb 2023 14:37:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E9CC844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675690719;
	bh=fVoN383x5fo4GW5Kt7ix9aHqlndXQoz/9IvjaczLSvY=;
	h=From:To:Subject:Date:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AE7T33IiJOR0joUh3e46JtdNUsKRYYo3sDHaT5wW/EFoYTCEKAdNvfoDBMEEWtU/P
	 rcGbH4pS/YOiJRGNw5uRD6Et+mef8iazk3Hwgz039Frl6yhRIPtg3bwuTN/232uDBi
	 GANXBwz8M9iwcfL9LWnzS4jxHvqWR+wRyRieBkgw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 212E2F8057F;
	Mon,  6 Feb 2023 14:35:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 503EEF804AA; Sun,  5 Feb 2023 13:33:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14987F8001D
 for <alsa-devel@alsa-project.org>; Sun,  5 Feb 2023 13:32:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14987F8001D
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=nBndfUAE
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 315CWlu4112097;
 Sun, 5 Feb 2023 06:32:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1675600367;
 bh=QnYw+4j+c0tSorkl20tTL9KSqtvcV9iclc90eBc99JU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=nBndfUAEM0EQLOULmoKyEV5XFqSV7L6X11ZJa+aDwFCs6qWaXHHIJ+8HFHnE4vrry
 S/WalWjDzsV6k14spUO5j5jHV30jPyjGnxjib7vICCaU7U+CjYsI+0J/tlNTRiFJHs
 kiDGhDkZ8yj9J9+JrZ0DftuE8iI4EAbFJu2P/S6I=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 315CWlWu010899
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Sun, 5 Feb 2023 06:32:47 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Sun, 5
 Feb 2023 06:32:47 -0600
Received: from DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c]) by
 DLEE101.ent.ti.com ([fe80::91ee:60bc:bfb7:851c%18]) with mapi id
 15.01.2507.016; Sun, 5 Feb 2023 06:32:47 -0600
From: "Ding, Shenghao" <shenghao-ding@ti.com>
To: Rob Herring <robh@kernel.org>, Shenghao Ding <13916275206@139.com>
Subject: RE: [EXTERNAL] Re: [PATCH v5] ASoC: dt-bindings: Add tas2781 amplifier
Thread-Topic: [EXTERNAL] Re: [PATCH v5] ASoC: dt-bindings: Add tas2781
 amplifier
Thread-Index: AQHZOBqB7tvoGVc4E0OYTlg50DrTvq7AQ5CQ
Date: Sun, 5 Feb 2023 12:32:47 +0000
Message-ID: <857038e20b2944e89ef433097374041d@ti.com>
References: <20230203040115.27321-1-13916275206@139.com>
 <20230203215724.GA938713-robh@kernel.org>
In-Reply-To: <20230203215724.GA938713-robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.160.107]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Feb 2023 14:35:04 +0100
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Lu,
 Kevin" <kevin-lu@ti.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Rob=20
Thanks for your review comments. My answers are inline
with prefix [DING]

-----Original Message-----
From: Rob Herring <robh@kernel.org>=20
Sent: Saturday, February 4, 2023 5:57 AM
To: Shenghao Ding <13916275206@139.com>
Cc: krzysztof.kozlowski+dt@linaro.org; broonie@kernel.org; lgirdwood@gmail.=
com; Lu, Kevin <kevin-lu@ti.com>; Ding, Shenghao <shenghao-ding@ti.com>; al=
sa-devel@alsa-project.org; devicetree@vger.kernel.org; linux-kernel@vger.ke=
rnel.org
Subject: [EXTERNAL] Re: [PATCH v5] ASoC: dt-bindings: Add tas2781 amplifier

On Fri, Feb 03, 2023 at 12:01:15PM +0800, Shenghao Ding wrote:
> Create tas2781.yaml for tas2781 driver.
>=20
> Signed-off-by: Shenghao Ding <13916275206@139.com>
>=20
> ---
> Changes in v5:
>  - Drop the full stop in the Subject.
>  - Drop the reset-gpios reference to gpio.txt.
>  - Add Changelog.
>  Changes to be committed:
> 	new file:   Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> ---
>  .../devicetree/bindings/sound/ti,tas2781.yaml | 87=20
> +++++++++++++++++++
>  1 file changed, 87 insertions(+)
>  create mode 100644=20
> Documentation/devicetree/bindings/sound/ti,tas2781.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml=20
> b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> new file mode 100644
> index 000000000000..8af44792a904
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) # Copyright=20
> +(C) 2022 - 2023 Texas Instruments Incorporated %YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments TAS2781 SmartAMP
> +
> +maintainers:
> +  - Shenghao Ding <shenghao-ding@ti.com>
> +  - Kevin Lu <kevin-lu@ti.com>
> +
> +description: |

Don't need '|' unless you need line endings preserved. Wrap lines at 80 cha=
rs.
[DING] Accept this comment. I will remove all the "|" after "description:"
> +  The TAS2781 is a mono, digital input Class-D audio amplifier =20
> + optimized for efficiently driving high peak power into small =20
> + loudspeakers. Integrated an on-chip DSP supports Texas Instruments =20
> + Smart Amp speaker protection algorithm. The integrated speaker =20
> + voltage and current sense provides for real time  monitoring of=20
> + loudspeaker behavior.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,tas2781
> +
> +  reg:
> +    maxItems: 1
> +    description: |
> +      I2C address of the device can be in range from 0x38 to 0x40.

Express as constraints instead:

items:
  minimum: 0x38
  maximum: 0x40
[DING] Accept this comment.
Or was this the range of the slot addresses?
[DING] Yes.
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: |
> +      A GPIO line handling reset of the chip. As the line is active high=
,
> +      it should be marked GPIO_ACTIVE_HIGH.

The description doesn't add anything. Drop.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ti,audio-slots:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 4
> +    description: |
> +      I2c address of the device for different audio slots,

I2C

> +      useless in mono case.
> +
> +  ti,broadcast-addr:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Generic i2c address for all the tas2781 devices in

I2C

Be consistent.
[DING] Accept this comment.
> +      purpose of I2C broadcast during the multi-device
> +      writes, useless in mono case.
> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +   #include <dt-bindings/gpio/gpio.h>
> +   i2c {
> +     /* example with quad support, such as tablet or pad device */
> +     #address-cells =3D <1>;
> +     #size-cells =3D <0>;
> +     quad: codec@38 {
> +       compatible =3D "ti,tas2781";
> +       reg =3D <0x38>;
> +       #sound-dai-cells =3D <1>;
> +       reset-gpios =3D < &gpio1 10 GPIO_ACTIVE_HIGH >;
> +       interrupt-parent =3D <&gpio1>;
> +       interrupts =3D <15>;
> +       ti,audio-slots =3D < 0x38 /* topleft-channel */
> +                          0x39 /* topright-channel */
> +                          0x3a /* bottomleft-channel */
> +                          0x3b /* bottomright-channel */

Do these vary? Or the slot addresses are fixed and which slots are used var=
ies?=20
[DING] Yes, these will vary with different projects. In some projects there=
're two addresses,=20
in some there're six addresses, in others the I2C addresses may be out of o=
rder.=20
> +                        >;
> +       ti,broadcast-addr =3D <0x40>;

I tend to think the I2C addresses should all be in 'reg'.
[DING] broadcast-addr item is used in multiple tas2781s case to enable the=
=20
broadcast mode to download dsp fw  simultaneously. Without this item,=20
broadcast mode will be disabled, and downloading dsp fw will be one by one.
As you know, not all project will enable the broadcast feature, so we have =
to=20
add this item. As to reg item, it is only stored the primary tas2781 I2C ad=
dr.
> +     };
> +   };
> +...
> --
> 2.34.1
>=20
>=20
