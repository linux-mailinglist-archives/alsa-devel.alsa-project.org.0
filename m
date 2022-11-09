Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB27062357B
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 22:11:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78FB71633;
	Wed,  9 Nov 2022 22:10:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78FB71633
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668028264;
	bh=IlXhKEpCDbHDliT1x9tL8wjdjlAeOIiFInDRnd5utQA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UJVlL4ehirvbXGIbfEHxX9huLWWObAm+DE/Xn0AlEqNZQwpH8DyLS7dSMKhukeKwu
	 lCSWGRdN7kYMkAbyVg+VJE8IMotU9DbftlpcIXE3jp4I26tpnH47voCLnHQ1svApsd
	 OAq0lhZg6eMmYIkYhdfNqsXJ5GW6tkF5RCco52TE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D29B7F8055C;
	Wed,  9 Nov 2022 22:09:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75E51F8055B; Wed,  9 Nov 2022 22:09:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5744F80166
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 22:09:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5744F80166
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-13b6c1c89bdso128034fac.13
 for <alsa-devel@alsa-project.org>; Wed, 09 Nov 2022 13:09:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=69ynaJZ0vfSiU5Z7REHN/yVn0+I4DGU0vC88AAV66eU=;
 b=v59hLJ/rFVb4gA0wYL0CHnUEQjiuBtZSL8vCklxgh335KHzbI12tnd/2DrN5vq5DFd
 g+crQff1xXhon8CHMJBZR8ramn+meThXZWpY8RfHFOJ0rJXogdK2FI1ExooQelW1j8JD
 ogNylK5gX4YBu60JmnHTWWWXoHWbDojLWia1VopT5BJKxPCo2rG14q1uOAFxI/n+65bO
 BFr3KopxRCDen4ozLDI2P2iWGhfgHCqJxpTv30uRacsW8vbWHgzPiDXlVJ+Om0KN0Zm1
 K/2UzSrsz09xhgUepq3ikq3892lMELHDY4EI0UADZloMvz3e9f7Xg3JTlYf646IhSD4A
 bWyQ==
X-Gm-Message-State: ANoB5pkUdgWEo7HGe0IgCvTzbfl/MoJt39rxyBQfShTdMtT4w+N7fHND
 oqtSRSwpk3ATt35ml5lGOA==
X-Google-Smtp-Source: AA0mqf7uijbXxM1V5E4YDTZSWH4fX4tkDBL3BOD5z9wGdyYsxPQIhx2cbf5ym35wl8Y+779wpe7d8g==
X-Received: by 2002:a05:6870:888c:b0:12c:55d6:968 with SMTP id
 m12-20020a056870888c00b0012c55d60968mr11226996oam.244.1668028151442; 
 Wed, 09 Nov 2022 13:09:11 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r198-20020a4a37cf000000b0049be423151asm4572127oor.34.2022.11.09.13.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 13:09:10 -0800 (PST)
Received: (nullmailer pid 2868046 invoked by uid 1000);
 Wed, 09 Nov 2022 21:09:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20221109165331.29332-2-rf@opensource.cirrus.com>
References: <20221109165331.29332-1-rf@opensource.cirrus.com>
 <20221109165331.29332-2-rf@opensource.cirrus.com>
Message-Id: <166802788268.2833081.8250615552136903141.robh@kernel.org>
Subject: Re: [PATCH 01/12] dt-bindings: mfd: Add Cirrus Logic CS48L32 audio
 codec
Date: Wed, 09 Nov 2022 15:09:10 -0600
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linus.walleij@linaro.org, lee@kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-gpio@vger.kernel.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org, maz@kernel.org,
 tglx@linutronix.de
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


On Wed, 09 Nov 2022 16:53:20 +0000, Richard Fitzgerald wrote:
> The CS48L32 has multiple digital and analog audio I/O, a
> high-performance low-power programmable audio DSP, and a variety of
> power-efficient fixed-function audio processors, with digital
> mixing and routing.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
>  .../bindings/mfd/cirrus,cs48l32.yaml          | 166 ++++++++++++++++++
>  1 file changed, 166 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/cirrus,cs48l32.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/mfd/cirrus,cs48l32.yaml:107:7: [warning] wrong indentation: expected 4 but found 6 (indentation)
./Documentation/devicetree/bindings/mfd/cirrus,cs48l32.yaml:108:7: [warning] wrong indentation: expected 8 but found 6 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/cirrus,cs48l32.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/cirrus,cs48l32.yaml: properties:clocks: 'anyOf' conditional failed, one must be fixed:
		'minItems' is not one of ['maxItems', 'description', 'deprecated']
			hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
		'minItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
		'maxItems' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
		1 is less than the minimum of 2
			hint: Arrays must be described with a combination of minItems/maxItems/items
		hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
		from schema $id: http://devicetree.org/meta-schemas/clocks.yaml#
	'minItems' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'allOf', 'anyOf', 'oneOf', '$ref']
	'maxItems' is not one of ['type', 'description', 'dependencies', 'dependentRequired', 'dependentSchemas', 'properties', 'patternProperties', 'additionalProperties', 'unevaluatedProperties', 'deprecated', 'required', 'allOf', 'anyOf', 'oneOf', '$ref']
	'type' is a required property
		hint: DT nodes ("object" type in schemas) can only use a subset of json-schema keywords
	from schema $id: http://devicetree.org/meta-schemas/clocks.yaml#
./Documentation/devicetree/bindings/mfd/cirrus,cs48l32.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/pinctrl/cirrus,cs48l32.yaml
Documentation/devicetree/bindings/mfd/cirrus,cs48l32.example.dts:21:18: fatal error: dt-bindings/sound/cs48l32.h: No such file or directory
   21 |         #include <dt-bindings/sound/cs48l32.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/mfd/cirrus,cs48l32.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

