Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06102D332E
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 23:10:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 753561671;
	Thu, 10 Oct 2019 23:09:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 753561671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570741845;
	bh=OK1XlSxloqT2Pj42KjWp0WQNsVgWvT9+8YnJzCPKz5g=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KW+NqPW0vBWIvg3sp/aPdDmo4dm7KMyNDfW6sEA5fNzC+sUojOrYGP8xa1cCSr0/H
	 dvszBHrGD2uqkuYXd4AK79tnl8pURagG7NDdVdXjlDPQ7Wy4xoMu9NRQv07esg3G6i
	 RADLcuoy04zMxmb+zlUy5nLSMDbQgsEOM5kp35IA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9420F8038F;
	Thu, 10 Oct 2019 23:09:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6755F8038F; Thu, 10 Oct 2019 23:08:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24A80F80113
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 23:08:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24A80F80113
Received: by mail-oi1-f196.google.com with SMTP id w144so6187117oia.6
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 14:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=l54FjJ8z4HLKOcYQ7YxhdU7HViL2A0HU+e+F64cnpis=;
 b=EuF18Q5L1+1tAAiEaNFvJ3VZuWUw2ljiSmim8djCS1+fJoe1DDzBUf4dgqzMOdFiKm
 VhQIZwcqlRQZ8MnxHnVZvVFE0yQMRLtBncTi5NM6P7t/on1Ub34tm0gakV9eV9U3J5Td
 aTos978cWzuiWNt+xxLYdeiruDW+1LIapCBHIf0iB8DXJuRLnKfpJ92+7Fq1wbNy2o9G
 cFoy/lf3R1TbfXF/KcfqNqIIq3hhsnAvOj+RexAT8nwtQBzN3gvrn1+7HuXsDXuJE4mG
 B+Rgw6FLfJmsMIyqyBKa/utrH2mAOgd0lX4Wph9sTE746gMv54pP8IK/MWsREEXVHmlm
 JYpw==
X-Gm-Message-State: APjAAAVTLjFlQAWPcoykJ9qZX07xXtjsiL4H+z7F2UvWKUgqBoIRlJrS
 uKBzdTkr8Mw16xBgXl84fA==
X-Google-Smtp-Source: APXvYqyAnPiRORQxzBSx4Evevv+Ogz9cws69r0XAcEZx/YFfaDPSWCbKEzN1ut/DXUCLYFFaw/QpDg==
X-Received: by 2002:aca:bd08:: with SMTP id n8mr9758386oif.107.1570741732015; 
 Thu, 10 Oct 2019 14:08:52 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 38sm2145141otw.28.2019.10.10.14.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 14:08:51 -0700 (PDT)
Date: Thu, 10 Oct 2019 16:08:50 -0500
From: Rob Herring <robh@kernel.org>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Message-ID: <20191010210850.GA20184@bogus>
References: <20191010074234.7344-1-nuno.sa@analog.com>
 <20191010074234.7344-2-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191010074234.7344-2-nuno.sa@analog.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v3 2/2] dt-bindings: asoc: Add ADAU7118
	documentation
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Oct 10, 2019 at 09:42:34AM +0200, Nuno S=E1 wrote:
> Document the ADAU7118 8 channel PDM to I2S/TDM converter devicetree
> bindings.
> =

> Signed-off-by: Nuno S=E1 <nuno.sa@analog.com>
> ---
> Changes in v2:
>  * List regulators as required;
> =

> Changes in v3:
>  * Set the correct license for new bindings.
> =

>  .../bindings/sound/adi,adau7118.yaml          | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/adi,adau7118.=
yaml
> =

> diff --git a/Documentation/devicetree/bindings/sound/adi,adau7118.yaml b/=
Documentation/devicetree/bindings/sound/adi,adau7118.yaml
> new file mode 100644
> index 000000000000..cfcef602b3d9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/adi,adau7118.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/adi,adau7118.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +
> +title: Analog Devices ADAU7118 8 Channel PDM to I2S/TDM Converter
> +
> +maintainers:
> +  - Nuno S=E1 <nuno.sa@analog.com>
> +
> +description: |
> +  Analog Devices ADAU7118 8 Channel PDM to I2S/TDM Converter over I2C or=
 HW
> +  standalone mode.
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/AD=
AU7118.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,adau7118
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 0
> +
> +  IOVDD-supply:

Use lowercase please.

> +    description: Digital Input/Output Power Supply.
> +    $ref: "/schemas/types.yaml#/definitions/phandle"

*-supply already has a type, so just a description is enough.

> +
> +  DVDD-supply:
> +    description: Internal Core Digital Power Supply.
> +    $ref: "/schemas/types.yaml#/definitions/phandle"

Same here.

> +
> +  adi,decimation-ratio:
> +    description: |
> +      This property set's the decimation ratio of PDM to PCM audio data.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [64, 32, 16]
> +        default: 64
> +
> +  adi,pdm-clk-map:
> +    description: |
> +      The ADAU7118 has two PDM clocks for the four Inputs. Each input mu=
st be
> +      assigned to one of these two clocks. This property set's the mappi=
ng
> +      between the clocks and the inputs.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> +      - minItems: 4
> +        maxItems: 4
> +        items:
> +          maximum: 1
> +        default: [0, 0, 1, 1]
> +
> +required:
> +  - "#sound-dai-cells"
> +  - compatible
> +  - IOVDD-supply
> +  - DVDD-supply
> +
> +examples:
> +  - |
> +    i2c0 {

i2c {

> +        /* example with i2c support */
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        status =3D "okay";

Don't show status in examples.

> +        adau7118_codec: adau7118-codec@14 {

audio-codec@14

> +                compatible =3D "adi,adau7118";
> +                reg =3D <14>;
> +                #sound-dai-cells =3D <0>;
> +                status =3D "okay";
> +                IOVDD-supply =3D <&supply>;
> +                DVDD-supply =3D <&supply>;
> +                adi,pdm-clk-map =3D <1 1 0 0>;
> +                adi,decimation-ratio =3D <16>;
> +        };
> +    };
> +
> +    /* example with hw standalone mode */
> +    adau7118_codec_hw: adau7118-codec-hw {
> +            compatible =3D "adi,adau7118";
> +            #sound-dai-cells =3D <0>;
> +            status =3D "okay";
> +            IOVDD-supply =3D <&supply>;
> +            DVDD-supply =3D <&supply>;
> +    };
> -- =

> 2.23.0
> =

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
