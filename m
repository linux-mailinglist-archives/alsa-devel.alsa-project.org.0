Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E587092EE
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:24:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B309E201;
	Fri, 19 May 2023 11:23:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B309E201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684488242;
	bh=1IxhoW+1gq2ZmL3OilwXqwjttBixy8ngNOilcxiR0hU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nUQWBvfEQYnj/d4tj+XUCtUFmlIw6XNBq3jTvkVYt7D1SilLdpcy6eFnV0sXQGoBb
	 ZVNcQzU3BZfJTDO+C4d4J6EOLkpgMD4ry6Oz7eQWvt8s/zMVc3KHUiflDwRDJ2xLyi
	 nh4OFnti/wn/117h3ModIBtTGA0crR6Wqh4lPnfw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BDADF80272; Fri, 19 May 2023 11:23:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 948D3F8025A;
	Fri, 19 May 2023 11:23:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E19BDF80272; Fri, 19 May 2023 11:23:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55880F80087
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55880F80087
Received: by mail-oi1-f173.google.com with SMTP id
 5614622812f47-38ea3f8e413so1673197b6e.2
        for <alsa-devel@alsa-project.org>;
 Fri, 19 May 2023 02:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684488184; x=1687080184;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3UraE6X1bGQBbaM/niZUO5TV7tVH+NhZ8DOXB03Zfqk=;
        b=Su2AtdYq/uojDk9XM/p/Q06Q/1Jx7Sg6ettBZtFB2dBBaQxjLDOUTPETBcJR7qj7wh
         OUgyfkBulTcgVhinBzPVMP+622oB5P71fjyOf3yAIZ31++WRe6kyQRj0w2btrGagH1d7
         lzh94GveeGrbEu2NvBkOPsXcM3tjE9IeCXEejotZ8MbX865Soqdyo6KnjdiRa02JgsNT
         OT/ca+21phGZ0xH0eMnp0d31ZeMl+HUTZVD/oLIPLD5okG7B3wmGQQV9LcTqAa5bWf9l
         K3Ej5Z/k3csIxGY5oa38pOxu9Edr15XQn6iAXittomybAJ+dj9lNDK/aiAYY2arpk5/i
         KL1Q==
X-Gm-Message-State: AC+VfDx0Kla3moIN5W5ZKc3mlYMc6vIMyCXPG5FOYPDzX04oEpC5C2BR
	7BnDbYmtowvFJxSTdC3Q3g==
X-Google-Smtp-Source: 
 ACHHUZ7mE/rmaqPh2pkd3JAot4Zv0jCYiATZb5CADq/aILvohgmA9artxd1r9SoE5HpO3+ucAQ8JAw==
X-Received: by 2002:a54:408a:0:b0:38e:8d7f:c07e with SMTP id
 i10-20020a54408a000000b0038e8d7fc07emr676449oii.52.1684488184181;
        Fri, 19 May 2023 02:23:04 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 c24-20020aca1c18000000b00397c03854edsm837927oic.17.2023.05.19.02.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 02:23:03 -0700 (PDT)
Received: (nullmailer pid 3014363 invoked by uid 1000);
	Fri, 19 May 2023 09:23:02 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Shenghao Ding <13916275206@139.com>
Cc: x1077012@ti.com, Ryan_Chu@wistron.com, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, peeyush@ti.com,
 devicetree@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 Sam_Wu@wistron.com, linux-kernel@vger.kernel.org, shenghao-ding@ti.com,
 robh+dt@kernel.org, navada@ti.com, kevin-lu@ti.com, gentuser@gmail.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz
In-Reply-To: <20230519080245.20243-1-13916275206@139.com>
References: <20230519080245.20243-1-13916275206@139.com>
Message-Id: <168448818168.3014319.8544192762874121053.robh@kernel.org>
Subject: Re: [PATCH v3 5/5] ASoC: dt-bindings: Add tas2781 amplifier
Date: Fri, 19 May 2023 04:23:02 -0500
Message-ID-Hash: MWIORMUDBRJWN2VBRIRQDMZBZ5I3LNXM
X-Message-ID-Hash: MWIORMUDBRJWN2VBRIRQDMZBZ5I3LNXM
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MWIORMUDBRJWN2VBRIRQDMZBZ5I3LNXM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 19 May 2023 16:02:45 +0800, Shenghao Ding wrote:
> Create tas2781.yaml for tas2781 driver.
> 
> Signed-off-by: Shenghao Ding <13916275206@139.com>
> 
> ---
> Changes in v3:
>  - Add allOf with ref to saound-dai-common
>  - remove audio-slots, put all the i2c address into <reg>
>  - Add more description on broadcast-addr item
>  Changes to be committed:
> 	new file:   Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> ---
>  .../devicetree/bindings/sound/ti,tas2781.yaml | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/ti,tas2781.yaml:71:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/sound/ti,tas2781.example.dts'
Documentation/devicetree/bindings/sound/ti,tas2781.yaml:71:1: found character '\t' that cannot start any token
make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/sound/ti,tas2781.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/sound/ti,tas2781.yaml:71:1: found character '\t' that cannot start any token
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/ti,tas2781.yaml: ignoring, error parsing file
make: *** [Makefile:1512: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230519080245.20243-1-13916275206@139.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

