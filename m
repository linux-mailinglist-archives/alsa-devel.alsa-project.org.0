Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE675045A3
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Apr 2022 00:18:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29BA216EE;
	Sun, 17 Apr 2022 00:18:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29BA216EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650147532;
	bh=h5kYpRXW9JER7VD1Iw37OOpJiTZlhgQVvL05Qdg9vw4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E8yIauIYCzMjSA6jUyxBSCrPdN5KcypHWyqaqSXdLANt61azAhADXwHPpQw0hEm8G
	 eOCMr51olljkoGtlDni5N4s3xocWtd17i32/I046vVEmU3FnMILljy3AF5xMTni+Z0
	 +IQBt9+r9HIBh0dul9NyVVZsCVgqhTeuj4kIfGr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1D77F800FB;
	Sun, 17 Apr 2022 00:17:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99B11F800FB; Sun, 17 Apr 2022 00:17:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90E56F800FB
 for <alsa-devel@alsa-project.org>; Sun, 17 Apr 2022 00:17:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90E56F800FB
Received: by mail-oi1-f177.google.com with SMTP id z8so11492868oix.3
 for <alsa-devel@alsa-project.org>; Sat, 16 Apr 2022 15:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=2JYEwuCKMkvFE9bkQV/NNaX/hW3Szh4RVLF5Mm1ed8o=;
 b=JrBi4f+PmfRuLTKPlAN07Z0uGFW5i652WebRdLZ/VHZ9a41Ft3N7g8vpcsRXuV0nES
 uESEUYlbEaCEkF2CEiA7UuZ8TjM5vynq+bW940Cq4U0rmlETDjdzvSRmjYrEkx1Splaa
 3einbOlLyIn+VtlwMznd5zlVqoRgEQ3pohywE2NE9C1k28MzcvmBSCBU8Q+wstbH9Rax
 tfNW6ABu+TegGGsEJs59r9jOiXEiQT8LtxPDAxw5eFCHYH/DPhTWn7y8veBYZfk5aF9C
 nzL6xtJmRcoYLT1K91SzSeEEwvc+6JnPZ18JuFLfzmcy+ufdhFvmyrvyWyBaSzCT4EEh
 jkaw==
X-Gm-Message-State: AOAM531F+f99+uMYJijKEHQwY+r3xZ6wZq3XnjCftfxPf/VSaCRyLvQV
 WT2qFw6ouAA7ZSTHkDSJkA==
X-Google-Smtp-Source: ABdhPJz4+/8mYxiNK3mwYOHKuPzb6694BbLOqA73ZnWVlKMwCgLmz169CflDFMxVO4+zStw4dfiEKw==
X-Received: by 2002:a05:6808:13d0:b0:2fa:72dc:6159 with SMTP id
 d16-20020a05680813d000b002fa72dc6159mr2248703oiw.224.1650147461895; 
 Sat, 16 Apr 2022 15:17:41 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o7-20020a056871078700b000e29ff467dcsm2875635oap.50.2022.04.16.15.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Apr 2022 15:17:41 -0700 (PDT)
Received: (nullmailer pid 3544949 invoked by uid 1000);
 Sat, 16 Apr 2022 22:17:39 -0000
From: Rob Herring <robh@kernel.org>
To: Ryan Lee <ryan.lee.analog@gmail.com>
In-Reply-To: <20220416004024.210418-1-ryan.lee.analog@gmail.com>
References: <20220416004024.210418-1-ryan.lee.analog@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: max98396: add amplifier driver
Date: Sat, 16 Apr 2022 17:17:39 -0500
Message-Id: <1650147459.157752.3544948.nullmailer@robh.at.kernel.org>
Cc: drhodes@opensource.cirrus.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 ckeepax@opensource.cirrus.com, stephan@gerhold.net,
 tanureal@opensource.cirrus.com, hdegoede@redhat.com, ryans.lee@analog.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 pierre-louis.bossart@linux.intel.com, cy_huang@richtek.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, pbrobinson@gmail.com, lukas.bulwahn@gmail.com,
 krzk+dt@kernel.org, arnd@arndb.de
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

On Fri, 15 Apr 2022 17:40:23 -0700, Ryan Lee wrote:
> From: Ryan Lee <ryans.lee@analog.com>
> 
> This patch adds dt-bindings information for Analog Devices MAX98396
> and MAX98397 Smart Amplifier.
> 
> Signed-off-by: Ryan Lee <ryans.lee@analog.com>
> ---
>  .../bindings/sound/adi,max98396.yaml          | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/adi,max98396.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/adi,max98396.yaml:49:111: [warning] line too long (121 > 110 characters) (line-length)

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/adi,max98396.yaml: properties:adi,spkfb-slot-no: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('maximum', 'default', 'minimum' were unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/adi,max98396.yaml: properties:adi,spkfb-slot-no: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/adi,max98396.yaml: properties:adi,spkfb-slot-no: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/adi,max98396.yaml: properties:adi,interleave-mode: 'oneOf' conditional failed, one must be fixed:
	Additional properties are not allowed ('default' was unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/adi,max98396.yaml: properties:adi,interleave-mode: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	Additional properties are not allowed ('type', 'default' were unexpected)
		hint: A vendor string property with exact values has an implicit type
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/adi,max98396.yaml: properties:adi,interleave-mode: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/adi,max98396.yaml: properties:adi,vmon-slot-no: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('maximum', 'default', 'minimum' were unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/adi,max98396.yaml: properties:adi,vmon-slot-no: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/adi,max98396.yaml: properties:adi,vmon-slot-no: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/adi,max98396.yaml: properties:adi,imon-slot-no: 'oneOf' conditional failed, one must be fixed:
	'type' is a required property
		hint: A vendor boolean property can use "type: boolean"
	Additional properties are not allowed ('maximum', 'default', 'minimum' were unexpected)
		hint: A vendor boolean property can use "type: boolean"
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/adi,max98396.yaml: properties:adi,imon-slot-no: 'oneOf' conditional failed, one must be fixed:
		'enum' is a required property
		'const' is a required property
		hint: A vendor string property with exact values has an implicit type
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/adi,max98396.yaml: properties:adi,imon-slot-no: 'oneOf' conditional failed, one must be fixed:
		'$ref' is a required property
		'allOf' is a required property
		hint: A vendor property needs a $ref to types.yaml
		from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
	hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
	from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/adi,max98396.yaml: ignoring, error in schema: properties: adi,spkfb-slot-no
Documentation/devicetree/bindings/sound/adi,max98396.example.dtb:0:0: /example-0/i2c/amplifier@39: failed to match any schema with compatible: ['adi,max98396']
Documentation/devicetree/bindings/sound/adi,max98396.example.dtb:0:0: /example-0/i2c/amplifier@3c: failed to match any schema with compatible: ['adi,max98397']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

