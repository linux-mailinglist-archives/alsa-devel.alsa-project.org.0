Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B81F585103
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 15:39:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B243FF3;
	Fri, 29 Jul 2022 15:38:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B243FF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659101983;
	bh=NIkglie6hxxhcv3y49k4LXSzNUnTcBbs9SfKRPc5n30=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XwkiMZDzzIu1bvVUiwtXsNibkGH7jGhNrtt4VWY+6NYshPsH9DIT+p/rRwF3wyTic
	 yz7RCXgyrtqdRQDHamCyfObdKfYrfbhKxz2mQPNBo9WXEu+CzL2mUkFO+TBG5wHDAM
	 gDPKMLzae4aUGht9dct64ve210ZZYqR1I69rjMlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B356F800BD;
	Fri, 29 Jul 2022 15:38:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93BE9F8049C; Fri, 29 Jul 2022 15:38:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB933F80224
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 15:38:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB933F80224
Received: by mail-io1-f47.google.com with SMTP id l24so3594869ion.13
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 06:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc;
 bh=IVEhYZW7pVuVNX7N8DIrmuV9luqyf17twFjiGQBjaSI=;
 b=75s5GX4BVLo9SFbAhfkfkC0AlWcHFeFaCV9XXJEr8LPNdZ6gp6y//B/eJlC5Mlw4g+
 Nkcrwx5cfblr2aj7PmANDcIzjzqh04OgYB6evdGYTRDtVqgeVFLMzpBT1excwZDGnQMV
 Q1HKTakcFoZCoWwdxtSGIFHI8lCzvG6ice3bS6EWwcBrqbsMvi6fXT5RZW6zTvYzqXDl
 oEv6bfHRnoZjkAjz5eNyoJz8Ve0QJQZJwXKpf4tWMn7h6fnF0XrLNw9YeBgV6aRTDtjv
 dz1UB8degxVH83yEsS5L8NKvfENHUtiAWGCvEz02wRrgmYExUlKnb7TmY8C0iVaddp64
 HjpA==
X-Gm-Message-State: AJIora87CwVPoYnpy49bj0XLR1GQgXSjXL0FP4oB/6uETfagDQjUvXkx
 AkbEXe2X9JsRAfchdZA1XQ==
X-Google-Smtp-Source: AGRyM1s/kppGnaM8HYOtHmwqEE1QPpJwVG7cKuy6k01IF42KCve7/7DB+xbtvTEgnc2xIp8MMD93aw==
X-Received: by 2002:a02:3f11:0:b0:33f:5d4c:179e with SMTP id
 d17-20020a023f11000000b0033f5d4c179emr1477525jaa.23.1659101914025; 
 Fri, 29 Jul 2022 06:38:34 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a02848f000000b0033f3435955dsm1621909jai.102.2022.07.29.06.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 06:38:33 -0700 (PDT)
Received: (nullmailer pid 3271160 invoked by uid 1000);
 Fri, 29 Jul 2022 13:38:31 -0000
From: Rob Herring <robh@kernel.org>
To: Zhu Ning <zhuning0077@gmail.com>
In-Reply-To: <20220729090857.579785-2-zhuning0077@gmail.com>
References: <20220729090857.579785-1-zhuning0077@gmail.com>
 <20220729090857.579785-2-zhuning0077@gmail.com>
Subject: Re: [PATCH v4 2/2] ASoC: dt-bindings: Add Everest ES8326 audio CODEC
Date: Fri, 29 Jul 2022 07:38:31 -0600
Message-Id: <1659101911.665574.3271159.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, broonie@kernel.org,
 Zhu Ning <zhuning@everest-semi.com>, David Yang <yangxiaohua@everest-semi.com>
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

On Fri, 29 Jul 2022 17:08:57 +0800, Zhu Ning wrote:
> Add device tree binding documentation for Everest ES8326
> 
> Signed-off-by: David Yang <yangxiaohua@everest-semi.com>
> Signed-off-by: Zhu Ning <zhuning@everest-semi.com>
> ----
> v4 add properity for reg58 and reg59
> ---
>  .../bindings/sound/everest,es8326.yaml        | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/sound/everest,es8326.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/everest,es8326.yaml:76:4: [warning] wrong indentation: expected 4 but found 3 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/everest,es8326.yaml: properties:$ref: '/schemas/types.yaml#/definitions/uint8' is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/everest,es8326.yaml: properties:maximum: 127 is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/everest,es8326.yaml: properties:default: 69 is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/everest,es8326.yaml: properties:minimum: 0 is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/everest,es8326.yaml: properties:everest,interrupt-clk: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/everest,es8326.yaml: properties:everest,interrupt-clk: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/everest,es8326.yaml: properties:everest,interrupt-clk: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/everest,es8326.yaml: ignoring, error in schema: properties: default
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/everest,es8326.example.dtb: codec@19: everest,mic1-src: b'"' is not of type 'object', 'array', 'boolean', 'null'
	From schema: /usr/local/lib/python3.10/dist-packages/dtschema/schemas/dt-core.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/everest,es8326.example.dtb: codec@19: everest,mic2-src: b'D' is not of type 'object', 'array', 'boolean', 'null'
	From schema: /usr/local/lib/python3.10/dist-packages/dtschema/schemas/dt-core.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/everest,es8326.example.dtb: codec@19: everest,jack-pol: b'\x0e' is not of type 'object', 'array', 'boolean', 'null'
	From schema: /usr/local/lib/python3.10/dist-packages/dtschema/schemas/dt-core.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/everest,es8326.example.dtb: codec@19: everest,interrupt-src: b'\x08' is not of type 'object', 'array', 'boolean', 'null'
	From schema: /usr/local/lib/python3.10/dist-packages/dtschema/schemas/dt-core.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/everest,es8326.example.dtb: codec@19: everest,interrupt-clk: b'E' is not of type 'object', 'array', 'boolean', 'null'
	From schema: /usr/local/lib/python3.10/dist-packages/dtschema/schemas/dt-core.yaml
Documentation/devicetree/bindings/sound/everest,es8326.example.dtb:0:0: /example-0/i2c/codec@19: failed to match any schema with compatible: ['everest,es8326']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

