Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B67AD587179
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 21:32:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10F741F7;
	Mon,  1 Aug 2022 21:31:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10F741F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659382318;
	bh=E/VUtNEBhyfy+YBLuVEOrFseULBpU9wAeh1FYhiYqQU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m4qJF2Nt2QcwJnCF4vWy+n50VJrpYgg7pRiDHDe54/x7/1nbFuS2YTI4B+BF7bka2
	 7m23i05apJ86uBpY40MamF1eZLZp4ZOpbYn1buah1qNjwjTQz+Z/gK1O9TXkAjh4dC
	 GFQI8gwS3yig1x+j96lA9l3tKQCFzH8rYCp4Y2r0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6772EF80246;
	Mon,  1 Aug 2022 21:31:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B4F5F8023B; Mon,  1 Aug 2022 21:30:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A482F8013D
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 21:30:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A482F8013D
Received: by mail-il1-f172.google.com with SMTP id w16so6052843ilh.0
 for <alsa-devel@alsa-project.org>; Mon, 01 Aug 2022 12:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc;
 bh=68X4qWbGtTFIeTpRkrQqYh3V9U2RdglpeJ/XvuTio2M=;
 b=2HgAd1lUeJ8fuXycSmhKDpCr04l2/U+pUnuLJiSU8oHDYpUxFdFbB+hNtprWu7GlgL
 uE6+tC8+EbWTnTEOnFpo6FHQjkaF7mubiIQrk+7bRm9yLkHGF8bk9DH13+Uc+3ESj/m/
 +5ewE4lcbESe+k20GJEHTw28C+RrKyoZf+6h0EkkjeCK2a89D3GOb0BwyzFAb1FVbVSG
 hxUPSiRCTcrVpWUew1wmY9z2DVbS1EQOBDrF5ZWrp9EYTnHszMG6Td7+V9iSzbqCR601
 IrsqX2aJOiSX0catw5SD351oneSEDHCX6FfUpne0AhLicJdw0/sRTbMYdzrZmR0/U0L1
 fCqA==
X-Gm-Message-State: AJIora+NQgDCi0GrDLUFT1EJOQULOX/at3KFrhncV3SpWwmOTOdxr9Ep
 4tq3ugTa9LZfuGjGNckMiw==
X-Google-Smtp-Source: AGRyM1tQNi5twR+ViPskLi6NNiVfaZlNIANTIuqKhF5Nl5YIUD1ubx9Pi6G6HuZVS9nvyPZ5GIuC1g==
X-Received: by 2002:a92:d752:0:b0:2dd:d885:82f2 with SMTP id
 e18-20020a92d752000000b002ddd88582f2mr6615271ilq.50.1659382249905; 
 Mon, 01 Aug 2022 12:30:49 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a92c688000000b002dcf9e17a29sm5021974ilg.76.2022.08.01.12.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 12:30:49 -0700 (PDT)
Received: (nullmailer pid 1380282 invoked by uid 1000);
 Mon, 01 Aug 2022 19:30:47 -0000
From: Rob Herring <robh@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
In-Reply-To: <1659370052-18966-2-git-send-email-spujar@nvidia.com>
References: <1659370052-18966-1-git-send-email-spujar@nvidia.com>
 <1659370052-18966-2-git-send-email-spujar@nvidia.com>
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: Add schema for common DAI params
Date: Mon, 01 Aug 2022 13:30:47 -0600
Message-Id: <1659382247.124005.1380281.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
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

On Mon, 01 Aug 2022 21:37:30 +0530, Sameer Pujar wrote:
> The "convert-channels" and "convert-rate" bindings are provided for both
> simple-card and audio-graph-card. However these are separately defined in
> their respective schemas. For any new binding addition, which is common to
> both, there will be duplication.
> 
> Introduce a new schema to have common DAI params properties and these can
> be re-used in other schemas wherever applicable.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../bindings/sound/audio-graph-port.yaml           | 13 ++++------
>  .../devicetree/bindings/sound/audio-graph.yaml     |  7 +++---
>  .../devicetree/bindings/sound/dai-params.yaml      | 28 ++++++++++++++++++++++
>  .../devicetree/bindings/sound/simple-card.yaml     | 16 ++++---------
>  4 files changed, 40 insertions(+), 24 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/dai-params.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/simple-card.yaml: properties:simple-audio-card,convert-rate: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	'description' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('$ref' was unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/simple-card.yaml: properties:simple-audio-card,convert-rate: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	'/schemas/sound/dai-params.yaml#/properties/dai-sample-rate' does not match 'types.yaml#/definitions/'
		hint: A vendor property needs a $ref to types.yaml
	'/schemas/sound/dai-params.yaml#/properties/dai-sample-rate' does not match '^#/(definitions|\\$defs)/'
		hint: A vendor property can have a $ref to a a $defs schema
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/simple-card.yaml: properties:simple-audio-card,convert-channels: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	'description' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('$ref' was unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/simple-card.yaml: properties:simple-audio-card,convert-channels: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	'/schemas/sound/dai-params.yaml#/properties/dai-channels' does not match 'types.yaml#/definitions/'
		hint: A vendor property needs a $ref to types.yaml
	'/schemas/sound/dai-params.yaml#/properties/dai-channels' does not match '^#/(definitions|\\$defs)/'
		hint: A vendor property can have a $ref to a a $defs schema
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
./Documentation/devicetree/bindings/sound/simple-card.yaml: Error in referenced schema matching $id: http://devicetree.org/schemas/sound/simple-card.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/simple-card.yaml: ignoring, error in schema: properties: simple-audio-card,convert-channels
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/simple-card.example.dtb: sound: simple-audio-card,widgets: b'Microphone\x00Microphone Jack\x00Headphone\x00Headphone Jack\x00Speaker\x00External Speaker\x00' is not of type 'object', 'array', 'boolean', 'null'
	From schema: /usr/local/lib/python3.10/dist-packages/dtschema/schemas/dt-core.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/simple-card.example.dtb: sound: simple-audio-card,routing: b'MIC_IN\x00Microphone Jack\x00Headphone Jack\x00HP_OUT\x00External Speaker\x00LINE_OUT\x00' is not of type 'object', 'array', 'boolean', 'null'
	From schema: /usr/local/lib/python3.10/dist-packages/dtschema/schemas/dt-core.yaml
Documentation/devicetree/bindings/sound/simple-card.example.dtb:0:0: /example-0/sound: failed to match any schema with compatible: ['simple-audio-card']
Documentation/devicetree/bindings/sound/simple-card.example.dtb:0:0: /example-1/sound: failed to match any schema with compatible: ['simple-audio-card']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/simple-card.example.dtb: sound: simple-audio-card,widgets: b'Headphone\x00Headphone Jack\x00' is not of type 'object', 'array', 'boolean', 'null'
	From schema: /usr/local/lib/python3.10/dist-packages/dtschema/schemas/dt-core.yaml
Documentation/devicetree/bindings/sound/simple-card.example.dtb:0:0: /example-2/sound: failed to match any schema with compatible: ['simple-audio-card']
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/simple-card.example.dtb: sound: simple-audio-card,routing: b'ak4642 Playback\x00DAI0 Playback\x00DAI0 Capture\x00ak4642 Capture\x00' is not of type 'object', 'array', 'boolean', 'null'
	From schema: /usr/local/lib/python3.10/dist-packages/dtschema/schemas/dt-core.yaml
Documentation/devicetree/bindings/sound/simple-card.example.dtb:0:0: /example-3/sound: failed to match any schema with compatible: ['simple-audio-card']
Documentation/devicetree/bindings/sound/simple-card.example.dtb:0:0: /example-4/sound: failed to match any schema with compatible: ['simple-audio-card']
Documentation/devicetree/bindings/sound/simple-card.example.dtb:0:0: /example-5/sound: failed to match any schema with compatible: ['simple-audio-card']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

