Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D2A6524D6
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Dec 2022 17:42:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF525174B;
	Tue, 20 Dec 2022 17:41:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF525174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671554526;
	bh=iuUX7KcS4olYngXplEb1r/iHgQBSBuVDcIvSqDsr0xM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=S1F5likTWgr8CMSoyVVThzwQCGpmP3R9a5U7tbi1IvSFRH2ijw3SMmohplCtq3nXx
	 UzgRwIV/csxwMVAhvSxNaVZRjfGF6e+FMVe92UTxm6xqtdojCQIK4Pmz78vxoHR1Gh
	 NI2tkFMvT/XjHpimQjORO8swHHrgwOTzPVqYKp30=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A726F80022;
	Tue, 20 Dec 2022 17:41:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D511EF8025E; Tue, 20 Dec 2022 17:41:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B73CBF80022
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 17:41:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B73CBF80022
Received: by mail-oi1-f180.google.com with SMTP id r205so10115421oib.9
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 08:41:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UY+Y318S+0GC8+l3K6oMYhoO0DtBzjj8FaFxQfnBzhU=;
 b=TvOJXtvX2yjGiAN93OsI5EYnic2eUz8Ld4b/qOVGxDUgLi24IvMpQpi82a1p09u1y1
 aSUedbVXrNSfbMHI/PD0XtYSf3vJBeAzdoBwomGZ9Q9QA6uxAd2VBsfcHfKmz5oYfsFl
 hcX0+pDbFuFniAyKve4OVkw1EKqlXMCh9Exrj7i+99GlqWbMERbS4u7VqkaEGzv05oP6
 DaXJOwxNUYNTAezrlUzcZeMcl/tXIzrEPgwYEm0id2kGe2/+SRVJxWo/85NSDWrUTSVE
 KI0BNP9fjOQOJ+4AahRAo3xZ1JuDebq01MvQdZHxoqxUHft3/nBlPpr6Lk0LpsSHgGCK
 Ipxw==
X-Gm-Message-State: AFqh2kr8HJPokN6S+jqGv3zQZk8mQBzQ9XMLBFyADPm6KpUWYC5HR3BU
 pncia8dcosPXrGjZ7D1xYw==
X-Google-Smtp-Source: AMrXdXsSdPfupRURBPcosH2gmACRMO8G7/u6yz1Jl6zoTYgYploE8g7Bl7rwKSb3o29A+AmWsqZdnA==
X-Received: by 2002:a05:6808:150b:b0:361:1a1:316 with SMTP id
 u11-20020a056808150b00b0036101a10316mr3680113oiw.33.1671554460478; 
 Tue, 20 Dec 2022 08:41:00 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 s8-20020acaa908000000b00354d8589a15sm5638397oie.45.2022.12.20.08.40.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 08:40:59 -0800 (PST)
Received: (nullmailer pid 709598 invoked by uid 1000);
 Tue, 20 Dec 2022 16:40:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Kevin Lu <luminlong@139.com>
In-Reply-To: <20221220144114.2137-1-luminlong@139.com>
References: <20221220144114.2137-1-luminlong@139.com>
Message-Id: <167155420934.690140.217916297367066741.robh@kernel.org>
Subject: Re: [PATCH] New yaml file: tas2781
Date: Tue, 20 Dec 2022 10:40:56 -0600
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, navada@ti.com,
 broonie@kernel.org, lgirdwood@gmail.com, shenghao-ding@ti.com,
 linux-kernel@vger.kernel.org, kevin-lu@ti.com, robh+dt@kernel.org,
 peeyush@ti.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Tue, 20 Dec 2022 22:41:14 +0800, Kevin Lu wrote:
> Add DTS discription for tas2781 driver code
> 
> Signed-off-by: Kevin Lu <luminlong@139.com>
> ---
>  .../devicetree/bindings/sound/tas2781.yaml    | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/tas2781.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tas2781.yaml: properties:ti,bottomright-channel: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	'description' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('maxItems' was unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tas2781.yaml: properties:ti,bottomright-channel: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tas2781.yaml: properties:ti,bottomright-channel: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tas2781.yaml: properties:ti,topleft-channel: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('maxItems' was unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tas2781.yaml: properties:ti,topleft-channel: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tas2781.yaml: properties:ti,topleft-channel: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tas2781.yaml: properties:ti,bottomleft-channel: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	'description' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('maxItems' was unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tas2781.yaml: properties:ti,bottomleft-channel: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tas2781.yaml: properties:ti,bottomleft-channel: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tas2781.yaml: properties:ti,topright-channel: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	'description' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('maxItems' was unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tas2781.yaml: properties:ti,topright-channel: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tas2781.yaml: properties:ti,topright-channel: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tas2781.yaml: properties:ti,global-address: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('maxItems' was unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tas2781.yaml: properties:ti,global-address: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tas2781.yaml: properties:ti,global-address: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
Documentation/devicetree/bindings/sound/tas2781.example.dts:28.13-45: ERROR (duplicate_property_names): /example-0/i2c0/codec@38:ti,bottomright-channel: Duplicate property name
ERROR: Input tree has errors, aborting (use -f to force output)
make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/sound/tas2781.example.dtb] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221220144114.2137-1-luminlong@139.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

