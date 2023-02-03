Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5154068A5CF
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 23:09:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 721F26C0;
	Fri,  3 Feb 2023 23:09:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 721F26C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675462190;
	bh=YnK0/mEUqPjE++ELY0lQiZHTBuGxPrcrtXAlH2O0W00=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hWXKlnI948q8NNHYToRak82bgxZ2pgVXDdj5Q61Fr0JM2XePMBUPMAV761p53Wy58
	 Ksr3Q+UItaVYN7GLM4CqAtNC3ut+linSk8/Kzg5o5Vcctg6f2UB/zRso9EnJYDyvNA
	 j8Rd4BC5ivYaT9YNJRb/LbwFMoZZHbm/z2rMZ4O4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70E4EF80022;
	Fri,  3 Feb 2023 23:08:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DC04F80254; Fri,  3 Feb 2023 23:08:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
 version=3.4.6
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F5D2F800E3
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 23:08:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F5D2F800E3
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-1685cf2003aso8270901fac.12
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 14:08:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fw6PdFuIKHRtNujVdzDiLXE+QWd5QhNLUNrYUFzLxWI=;
 b=MuRwRrC0bSV46EM8W3dVy4bw1dUAiZ4UuXInhf/sB9xyBi5Nj1ZGyklFJFzavN3NhV
 iBdd3gmDG9CwAOlRZLgAGzOxhCpbdv9cN8q51pCM5TR/oGLBHIh2QfA25/tf9vjdrZC0
 DHAth5oOLvWDWAjtt5i04rKtDgAwhgsIoOeO+d6c6blZN6MggDVx5OdxyxC9WS4sGMNS
 wwYXWD0SGwJkdPjs2KNstgx+cRbHt+QXI/3jbOkqDK9te9K9QfmVlsqSAA6jaTSaJ/tO
 7tqYOuHhwbX5TeKKOmBP4GAw9q2jXKLKEc6EyELpTDqS/CiJ4rTbovfP4DY1CLtHxhx2
 thfg==
X-Gm-Message-State: AO0yUKWteiay0yGl/kvkhLsNpvPjJ/5FWjEut4x3weZc++Zf1/zl+ljy
 1+icjaGFtNmUOtdJwdQ5vw==
X-Google-Smtp-Source: AK7set+FUHHTZB3BEZz2tOg2sXyUbAQ0yGNVCYMUkcQxtdquZlVLxAI6lNIJ6COfA7ceDlJ/QUpg5A==
X-Received: by 2002:a05:6870:2192:b0:169:de47:db82 with SMTP id
 l18-20020a056870219200b00169de47db82mr4237685oae.24.1675462125484; 
 Fri, 03 Feb 2023 14:08:45 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j22-20020a056870531600b00160323101efsm1264189oan.42.2023.02.03.14.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 14:08:45 -0800 (PST)
Received: (nullmailer pid 962653 invoked by uid 1000);
 Fri, 03 Feb 2023 22:08:44 -0000
Date: Fri, 3 Feb 2023 16:08:44 -0600
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 1/3] dt-bindings: sound: Add the Renesas X9250
 potentiometers
Message-ID: <20230203220844.GA955510-robh@kernel.org>
References: <20230203111422.142479-1-herve.codina@bootlin.com>
 <20230203111422.142479-2-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203111422.142479-2-herve.codina@bootlin.com>
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Feb 03, 2023 at 12:14:20PM +0100, Herve Codina wrote:
> The Renesas X9250 is a quad digitally controlled potentiometers.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/sound/renesas,x9250.yaml         | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/renesas,x9250.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,x9250.yaml b/Documentation/devicetree/bindings/sound/renesas,x9250.yaml
> new file mode 100644
> index 000000000000..ad29ef465a18
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/renesas,x9250.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/renesas,x9250.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas X9250 quad potentiometers
> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description: |
> +  The Renesas X9250 is a quad digitally controlled potentiometers.

...is a chip with quad...

> +
> +  In the audio path, it can be present on amplifiers designs and it can be used
> +  in ALSA as an auxiliary audio device to control these amplifiers.

ALSA? Linux details should not be in bindings.

> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: renesas,x9250
> +
> +  reg:
> +    description:
> +      SPI device address.
> +    maxItems: 1
> +
> +  spi-max-frequency:
> +    maximum: 2000000
> +
> +patternProperties:
> +  "^renesas,cmd[0-3]-invert$":
> +    description:
> +      The related command is inverted meaning that the minimum command value
> +      set the wiper to Rh and the maximum command value set the wiper to Rl.
> +      Without this property, the minimum command value set the wiper to Rl and
> +      the maximum to Rh.
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        x9250@0 {
> +            compatible = "renesas,x9250";
> +            reg = <0>;
> +            spi-max-frequency = <2000000>;
> +            renesas,cmd3-invert;
> +        };
> +    };
> -- 
> 2.39.0
> 
