Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 605257CB492
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Oct 2023 22:23:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFE98823;
	Mon, 16 Oct 2023 22:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFE98823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697487788;
	bh=bSmdHrG3bhRAyum9Je5fAbE8VOKLZwWPcGLEs9vgOVQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kn4LVHUp37QtgvlF++IsF3XKf+3eDT6uhCP22MkrwqsFKf4UMJGCy4HCW8+PrHxyO
	 NLmh8tqwnJoAu1+WaoqJNC5aOQameQybDmiBqeqRXYehqJlovQsv3/pmJ4xG+KuECK
	 kFCDFVO9TBwUXojGocad43jAMXrYPJJexFSkendw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74988F8024E; Mon, 16 Oct 2023 22:22:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26774F8024E;
	Mon, 16 Oct 2023 22:22:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA11EF8025F; Mon, 16 Oct 2023 22:22:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01926F800C9
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 22:22:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01926F800C9
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-57bbb38d5d4so2774061eaf.2
        for <alsa-devel@alsa-project.org>;
 Mon, 16 Oct 2023 13:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697487722; x=1698092522;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n8Ejd5Pa0+899H+ST1facS1EVWLpMPKF/gO5qmwkR4w=;
        b=Ahwh0vzneWxLCF/6aRYjtED6z22FYHGgfzLSlP421Pl35ZKZmHE6zIdubDZktKmfAd
         Jf5b9zuoRPgTfSJYaUsY0zCEzNOcFb7LNEaQlznvJl4GOcATI3Y0IXHDx+wQHdtfGRkX
         06jJ5osBnMJJZgz/KVGy2LIRv2XS3Yazk5Q5bAYH/oaBwQ9V+gw+RIYDOnqkVcTQkv5s
         1w0Jui6/Wv0r/5EFniDUb5KefcQ01MH854VX01dVKadtJcSIkeEptAajseRvLxblARsX
         f7QBTCag7jcYavEZjaGk35DaOD7v41dY3EoCD15pkSiGGNVuLeeEEsJYFm6ljBio13hY
         NdxA==
X-Gm-Message-State: AOJu0YxQcWm4+MAQwHJiMhVtqK/oRCTknRCD8pf0xDMruUaAJDXQrvtA
	BpaoL4ZOQYWZU5kEAscyFw==
X-Google-Smtp-Source: 
 AGHT+IGEYagCHsUBCuyxmcGOPHRUwWB7THaDN4+NC/pbptGn33Manj5wy9VEGgn9ovwHhqVg4gR47g==
X-Received: by 2002:a4a:4245:0:b0:57b:469d:8af6 with SMTP id
 i5-20020a4a4245000000b0057b469d8af6mr112518ooj.4.1697487722620;
        Mon, 16 Oct 2023 13:22:02 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 o10-20020a9d718a000000b006c4e71a022bsm1199otj.52.2023.10.16.13.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 13:22:01 -0700 (PDT)
Received: (nullmailer pid 3615546 invoked by uid 1000);
	Mon, 16 Oct 2023 20:22:01 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 kernel@collabora.com, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
In-Reply-To: <20231016151553.5336-1-eugen.hristev@collabora.com>
References: <20231016151553.5336-1-eugen.hristev@collabora.com>
Message-Id: <169748772099.3615502.6790888257320558610.robh@kernel.org>
Subject: Re: [PATCH v6] dt-bindings: arm: mediatek: convert audsys and
 mt2701-afe-pcm to yaml
Date: Mon, 16 Oct 2023 15:22:01 -0500
Message-ID-Hash: 3QJHKNUZMFD642BQDT54MPFIWZJ5ST3R
X-Message-ID-Hash: 3QJHKNUZMFD642BQDT54MPFIWZJ5ST3R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3QJHKNUZMFD642BQDT54MPFIWZJ5ST3R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 16 Oct 2023 18:15:53 +0300, Eugen Hristev wrote:
> Convert the mediatek,audsys binding to YAML, together with the associated
> binding bindings/sound/mt2701-afe-pcm.yaml .
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes in v6:
> - renamed mt2701-audio.yaml to mediatek,mt2701-audio.yaml
> - add Rb Rob Herring
> 
> Changes in v5:
> - removed example for mt2701-audio
> - renamed mt2701-afe-pcm to mt2701-audio
> - added clock cells as required, removed reg from required, in audsys binding
> - removed reference comment in mt2701-audio
> - removed assigned clocks from mt2701-audio
> 
> Changes in v4:
> - fix error reported by Rob's bot :
> ./Documentation/devicetree/bindings/sound/mt2701-afe-pcm.yaml:11:4: [error] missing starting space in comment (comments)
> 
> Changes in v3:
> - not added Rb Conor Dooley since the patch was changed in a big essence
> - As per review by Krzysztof, also convert the mt2701-afe-pcm and reference
> the correct schema in the audsys binding.
> 
> Changes in v2:
> - remove comment reference to inexistent binding
> 
> 
> 
>  .../bindings/arm/mediatek/mediatek,audsys.txt |  39 -----
>  .../arm/mediatek/mediatek,audsys.yaml         | 153 ++++++++++++++++++
>  .../bindings/sound/mediatek,mt2701-audio.yaml | 117 ++++++++++++++
>  .../bindings/sound/mt2701-afe-pcm.txt         | 146 -----------------
>  4 files changed, 270 insertions(+), 185 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/mt2701-afe-pcm.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml:
Error in referenced schema matching $id: http://devicetree.org/schemas/sound/mt2701-audio.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/sound/mt2701-audio.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231016151553.5336-1-eugen.hristev@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

