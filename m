Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 237B4588476
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Aug 2022 00:39:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0071E0E;
	Wed,  3 Aug 2022 00:38:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0071E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659479986;
	bh=6NKKV47gVd92vEQ0awvvAHKXeyEi2UVu3H81F8dqh6M=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fdr2gZ2KcBngWkRIsKkjSsX2IatMEZTrYIb8QBwSTUqCTxtAvcOdmoq/T/5sBDIAx
	 Vqy2wuWZ3ma2P3uCOZYGO+2cWPGDdOR+m+zBgrGLk01ZpINnr0K60cJJ0qAB1R0LMx
	 puwCSEUZiiujxLuezzvr4aHmuUsSHz8ybUxHke1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 143F7F8013D;
	Wed,  3 Aug 2022 00:38:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 852FEF8026A; Wed,  3 Aug 2022 00:38:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED369F8013D
 for <alsa-devel@alsa-project.org>; Wed,  3 Aug 2022 00:38:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED369F8013D
Received: by mail-io1-f52.google.com with SMTP id 125so11758654iou.6
 for <alsa-devel@alsa-project.org>; Tue, 02 Aug 2022 15:38:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc;
 bh=xc7pVcgM8oggfYYoDi+YgFJKASpGtHTVPBIB9MLasi0=;
 b=ExNn74QzMZl075QoENjnJn6jAMwyJzjC9qNicVCMfvO/pRQcXB+oK1oHh08xR+csz7
 YmAcyQxm0Rhb9V9oxIyzXXN8WDKU9gALe8+iaLAZKFmgJgj9r2DfJlHkFLOHbqQ9AtSa
 sSYW828f3EVSzRTu2KI5HAPPD1pwc1brDnOALWUWKaens1jm2MqhbAsx6l5jdsrQwb4b
 Pduw13/TSxziP+Ip8Ob2yajIFXnjoNkNQhD+alALhuk0U1cAUPq813aZyV8/gsSxqKIL
 +uTuPpA3yYCDkT+gRVvN3/2Z9XD7hZbLZyjBocTSMGLtdeETkTjfnk0mDYB9dgpQtwuw
 zZHQ==
X-Gm-Message-State: AJIora8RIs+18NuGM0qWHk2RWR6njVHt7SBt8F9z2FUigDmXcY2qpKRr
 lXnedcBurdsxxxazLRM1lQ==
X-Google-Smtp-Source: AGRyM1uvjDnbb8GnFfjBfYlQ83bdSSQK2oBX9P0LrOPi4jW/MSL2a2C/PDhZtFJlJhS9j6J7oaGaYQ==
X-Received: by 2002:a02:9046:0:b0:341:af23:4bb5 with SMTP id
 y6-20020a029046000000b00341af234bb5mr8385992jaf.44.1659479911950; 
 Tue, 02 Aug 2022 15:38:31 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 d191-20020a0262c8000000b00341927a1e0dsm7109249jac.72.2022.08.02.15.38.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 15:38:31 -0700 (PDT)
Received: (nullmailer pid 758799 invoked by uid 1000);
 Tue, 02 Aug 2022 22:38:27 -0000
From: Rob Herring <robh@kernel.org>
To: Jai Luthra <j-luthra@ti.com>
In-Reply-To: <20220802214811.29033-1-j-luthra@ti.com>
References: <20220802214811.29033-1-j-luthra@ti.com>
Subject: Re: [PATCH] dt-bindings: sound: tlv320aic3x: Convert to dtschema
Date: Tue, 02 Aug 2022 16:38:27 -0600
Message-Id: <1659479907.575212.758797.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

On Tue, 02 Aug 2022 16:48:11 -0500, Jai Luthra wrote:
> Convert bindings for TI's TLV320AIC3x audio codecs to dtschema.
> 
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
>  .../devicetree/bindings/sound/tlv320aic3x.txt |  97 ------------
>  .../bindings/sound/tlv320aic3x.yaml           | 145 ++++++++++++++++++
>  2 files changed, 145 insertions(+), 97 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/tlv320aic3x.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/tlv320aic3x.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/tlv320aic3x.yaml: properties:ai3x-gpio-func:maxItems: False schema does not allow 3
	hint: Scalar properties should not have array keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/tlv320aic3x.yaml: properties:ai3x-gpio-func:minItems: False schema does not allow 3
	hint: Scalar properties should not have array keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/tlv320aic3x.yaml: ignoring, error in schema: properties: ai3x-gpio-func: maxItems
Documentation/devicetree/bindings/sound/tlv320aic3x.example.dtb:0:0: /example-0/i2c/tlv320aic3x@1b: failed to match any schema with compatible: ['ti,tlv320aic3x']
Documentation/devicetree/bindings/sound/tlv320aic3x.example.dtb:0:0: /example-1/spi/codec@0: failed to match any schema with compatible: ['ti,tlv320aic3x']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

