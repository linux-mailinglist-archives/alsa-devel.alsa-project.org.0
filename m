Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DCF665C82
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 14:30:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2747E79F;
	Wed, 11 Jan 2023 14:29:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2747E79F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673443813;
	bh=una5oRyRbPIcKrt1hYeISUW/DKq9iiXHn6eQlzEJjMs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pYWAXbUXVvmSxlzrMsVADsInLOwpvw0l5uHVkdAUUsqrb7AwI6JlMYAtywxUYomNY
	 GJJusdqr7mNYH3sUAh8kY0c5szQiZ/cyrE42TTs9CDH/qOP3WtdRg0ikY2ajSLCvU/
	 i/byP1oL3f7UpilgLiATAeSlKWBWbt6Wl+2RfhZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A95BF8016E;
	Wed, 11 Jan 2023 14:29:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41296F803DC; Wed, 11 Jan 2023 14:29:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DBE6F8026A
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 14:29:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DBE6F8026A
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-15bb8ec196aso3743386fac.3
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 05:29:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wfcyeKV+jmJfxwF7NRjV8Nnjqq+j+TtjFkaEsE2MxJg=;
 b=xdnggaIfA3AfCX41Hhlryex4Iid7svHMZOhb5eqOxBrC3X1Sm643lSThJlR9CRZt+i
 YzzftbnsigISnmDJWJGz2QCxwe8S42uJqro+hf/g3fZhZwyJ7b5asc7npmWDax8XzczA
 xuxwvlfmNefUxfPdCtvggPxA40wQcaXKFc4kPmWwTUHzp3MjMYGjEl4nbHCZWJ0B4v2h
 vlpPJ5ZVQF2po6GRV8x1ngpNenOcXIDizW823EFlcJ0ql7xbUWlI/2EClLP9a5Pt01Qc
 +gQbTqyloqOKnfvsOvUAx3FHYpO+c4X9y5y70tvO/GXDaduKf6HrwqHVgd+ZwfYatnI5
 6gqw==
X-Gm-Message-State: AFqh2kqPivqcI+k9OJDCO3nCFcvdvJwR0I/tMaF1Tz5dVUaZx9P78oJZ
 ux1b8th+di2zyGhGgRUjhQ==
X-Google-Smtp-Source: AMrXdXurr2Fkt7xIiSGu2+v4jLMmjbG5iQyzQgObyqO+r+3rDohu/0qojG9+9uV23VV7Y4jPZu7Hpw==
X-Received: by 2002:a05:6870:390e:b0:14b:e944:ac13 with SMTP id
 b14-20020a056870390e00b0014be944ac13mr34453421oap.15.1673443752372; 
 Wed, 11 Jan 2023 05:29:12 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x19-20020a056870331300b00143cfb377b4sm7306519oae.6.2023.01.11.05.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 05:29:12 -0800 (PST)
Received: (nullmailer pid 408838 invoked by uid 1000);
 Wed, 11 Jan 2023 13:29:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r0w1ho26.wl-kuninori.morimoto.gx@renesas.com>
References: <87358hj2ub.wl-kuninori.morimoto.gx@renesas.com>
 <87r0w1ho26.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <167344317928.394453.14105689826645262807.robh@kernel.org>
Subject: Re: [PATCH v2 08/10] ASoC: dt-bindings: renesas,rsnd: add missing
 playback/capture
Date: Wed, 11 Jan 2023 07:29:11 -0600
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
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Wed, 11 Jan 2023 01:12:18 +0000, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> renesas,rsnd.yaml is possible to use ports/port/endpoint if it is using
> Audio Graph Card/Card2 for sound. The schema is defined under
> audio-graph-port.yaml.
> 
> rsnd driver needs "playback/capture" property under endpoint, but it is not
> defined in audio-graph-port.yaml. This patch adds missing "playback/capture"
> properties under endpoint.
> 
> Without this patch, we will get below warning
> 
> ${LINUX}/arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dtb: sound@ec500000: ports:port@0:endpoint: Unevaluated properties are not allowed ('playback', 'capture' were unexpected)
> 	From schema: ${LINUX}/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../bindings/sound/renesas,rsnd.yaml          | 25 ++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/renesas,rsnd.example.dtb: sound@ec500000: Unevaluated properties are not allowed ('rcar_sound,src' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/87r0w1ho26.wl-kuninori.morimoto.gx@renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

