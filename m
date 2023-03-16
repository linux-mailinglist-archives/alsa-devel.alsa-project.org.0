Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4D16BD189
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Mar 2023 14:54:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98E3010EA;
	Thu, 16 Mar 2023 14:53:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98E3010EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678974879;
	bh=BsqVId2MsUfW25kEqjL4KfAxHxXR7ZjjNkvHpT1/7Ks=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WHHxslSqgKADf99SOVmUvSMbKuAjy2LTvnMom9SoZc6S6zMzmGyvAZC1bC4tp5mAC
	 JYsShrBGdOnyRFUP45B9UqIoPtuY/fpBIwxm1MRwlkpiB4YAu84yipGHuYvukLjFLv
	 SnHSNvq76JLEpyvKzEdSofKTQY+18vlnRgYjTzOw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14469F8032D;
	Thu, 16 Mar 2023 14:53:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D86D5F80423; Thu, 16 Mar 2023 14:53:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A92CF80272
	for <alsa-devel@alsa-project.org>; Thu, 16 Mar 2023 14:53:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A92CF80272
Received: by mail-io1-f52.google.com with SMTP id bf15so806750iob.7
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Mar 2023 06:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678974821;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j2tFiBfDR3sqBGyTts2F0hCCIX1073H/hBiuonmjick=;
        b=iGPRgZkZpipyYgPK6uqfBDHAhQDTXExZQxpAxRvuMt0f4i+Cpm0Lk3y6s3IBYDUsmw
         r0fzT3t1w9oMus/Fq2O7LxN9lNOCtxSgS1zDJRJIFpZ7xESsgVGIhkfgJVIWADLVPyhp
         WwHG3tmYzgBRlbMcWMhpQL5syHHxwK+BU2dKa/krPcD1r2K4xUJLRxFvC+GBd+AXARqF
         wJXL33ZI6BFuQokqAEv9qwDYBl+OSBR0feC63hLg00qu3GDllagrbDdsDppTmPdCfDYw
         MnnKNtJCCAQgOF+Z3dHZPVTFbwsPaDXO/eoE+qlcB3jg5jCKlNRvrvbRZrhxWTWX6HIb
         uxzA==
X-Gm-Message-State: AO0yUKUVIDCMEdaQOF/1GiQiZvUKj55mTLIhkPxn5C60m80PYm1OJfH7
	k1SGpdtXiscibRQV9HdiRQ==
X-Google-Smtp-Source: 
 AK7set8juC5NrSRSkGIE3mqMOYX3XEILn2QkGMLTFLQt3sdO7GSVXBIFLYoCNLWf9Cu5K7tqy7WHdw==
X-Received: by 2002:a5e:9508:0:b0:752:e9a2:1c5b with SMTP id
 r8-20020a5e9508000000b00752e9a21c5bmr4351255ioj.14.1678974820771;
        Thu, 16 Mar 2023 06:53:40 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id
 z13-20020a02cead000000b003a53692d6dbsm2524462jaq.124.2023.03.16.06.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 06:53:40 -0700 (PDT)
Received: (nullmailer pid 2744944 invoked by uid 1000);
	Thu, 16 Mar 2023 13:53:34 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Vijaya Anand <sunrockers8@gmail.com>
In-Reply-To: <20230315231055.3067-1-sunrockers8@gmail.com>
References: <20230315231055.3067-1-sunrockers8@gmail.com>
Message-Id: <167897435177.2729678.7747291818682080828.robh@kernel.org>
Subject: Re: [PATCH v2] ASoC: dt-bindings: adi,adau17x1: Convert to DT
 schema
Date: Thu, 16 Mar 2023 08:53:34 -0500
Message-ID-Hash: G7XUGR57WVCNQQTZGFDAUF5LN6LUBOLJ
X-Message-ID-Hash: G7XUGR57WVCNQQTZGFDAUF5LN6LUBOLJ
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: broonie@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 robh+dt@kernel.org, lgirdwood@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G7XUGR57WVCNQQTZGFDAUF5LN6LUBOLJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu, 16 Mar 2023 04:40:55 +0530, Vijaya Anand wrote:
> Convert the binding document for adi,adau17x1 from txt to yaml
> so one could validate dt-entries correctly and any future additions
> can go into yaml format. Add address and size cells to example to
> prevent errors regarding reg format.
> 
> Signed-off-by: Vijaya Anand <sunrockers8@gmail.com>
> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> ---
> Changes since v1:
> - added 'Codec' in title to clarify type of devices
> - put compatible devices in lexographic order
> - changed description of clocks
> - changed 'unevaluatedProperties' to 'additionalProperties'
> - changed node names to be generic
> 
> ---
>  .../bindings/sound/adi,adau17x1.txt           | 32 ------------
>  .../bindings/sound/adi,adau17x1.yaml          | 52 +++++++++++++++++++
>  2 files changed, 52 insertions(+), 32 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/adi,adau17x1.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/adi,adau17x1.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/adi,adau17x1.yaml:8:2: [warning] wrong indentation: expected 2 but found 1 (indentation)

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/sound/adi,adau17x1.example.dts:29.3-30.1 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/sound/adi,adau17x1.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1512: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230315231055.3067-1-sunrockers8@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

