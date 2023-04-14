Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD036E2A2B
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 20:39:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0FD1DF5;
	Fri, 14 Apr 2023 20:38:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0FD1DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681497539;
	bh=huU+6cS0d5gxJNBOqN6BIbjV8bvsOO+1eP7mTqfC9BE=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QzykA0Y1Xn0QqMt7OznJaSt3Q0wBla1tTTG8MXxVMYzMlsmQ/GJmH3oW0/QytfGf8
	 tJpL58RjQlBP2Mn8y7mTAE0+l/fmMyyaN2apEuen4OgWX5CAxxUM6SDlQHmX0j6NyZ
	 arq0jZXLZatcJuhwye4pWBedrq5Pf2EcdIESsOzs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD10CF8025E;
	Fri, 14 Apr 2023 20:38:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1853AF80448; Fri, 14 Apr 2023 20:38:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56408F8023A
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 20:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56408F8023A
Received: by mail-oi1-f179.google.com with SMTP id d1so2615744oiw.13
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Apr 2023 11:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681497479; x=1684089479;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fKT6fiDg+2MVo2sXkICVAywOZ2rL0RJkCUkl74gbvUU=;
        b=FApBwZ2gWLxAokWjrCeWSX5ulohCs+s5cbNH29z0NjcsAZl8bcXeVbT3HlL9bfPUfF
         QKB9zdhTud9WxXvi8MAyESiRaUAz0y0MaFEWitEWizeuR/CBVd1rK++m61YfEGWIhpAk
         sSuVRFFvP+VmgDM1lK8ArrIfejUqaorNA02Faom/VfF6k8D28OlSNdw+gSB6B4yYByov
         OFuwz291NejjM68OknV9tdZUe72vp/XW2ftjuJgY9EiPFmzi0f57yu43WjRCVR409JtQ
         XEYwoBoA9weskK661UcXvk0RNpOp0UomRdrfdEA83OfJgl3q4uI/iJdJK6APA1K24A4t
         XK2A==
X-Gm-Message-State: AAQBX9eHkUhC2/VlG5EO715I05ot/xXqoXWyGlOwpqCz8XI1j2KQ9ynk
	/bf9fWF8vZizJeDOoBNLcg==
X-Google-Smtp-Source: 
 AKy350Zoe9qiArU40t8/OyBlNnywucXp5OyCvHFhVTS+SwpAkAjFup7HKFaIVtM7kS2mjA+10j1MhQ==
X-Received: by 2002:aca:d09:0:b0:37f:87fb:cdc3 with SMTP id
 9-20020aca0d09000000b0037f87fbcdc3mr2137346oin.17.1681497479256;
        Fri, 14 Apr 2023 11:37:59 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 r67-20020acac146000000b0038c36edc51dsm1077392oif.24.2023.04.14.11.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 11:37:58 -0700 (PDT)
Received: (nullmailer pid 105413 invoked by uid 1000);
	Fri, 14 Apr 2023 18:37:55 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
In-Reply-To: <20230414140203.707729-4-pan@semihalf.com>
References: <20230414140203.707729-1-pan@semihalf.com>
 <20230414140203.707729-4-pan@semihalf.com>
Message-Id: <168149743035.103868.7729505155994277946.robh@kernel.org>
Subject: Re: [PATCH 3/9] dt-bindings: ASoC: Add chv3-audio
Date: Fri, 14 Apr 2023 13:37:55 -0500
Message-ID-Hash: QG2AEYQRWERQJQ3VLP53ULI42YNZWS4C
X-Message-ID-Hash: QG2AEYQRWERQJQ3VLP53ULI42YNZWS4C
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, broonie@kernel.org, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nuno.sa@analog.com,
 krzysztof.kozlowski+dt@linaro.org, dinguyen@kernel.org,
 upstream@semihalf.com, tiwai@suse.com, lars@metafoo.de, lgirdwood@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QG2AEYQRWERQJQ3VLP53ULI42YNZWS4C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 14 Apr 2023 16:01:57 +0200, Paweł Anikiel wrote:
> Add binding for chv3-audio device.
> 
> Signed-off-by: Paweł Anikiel <pan@semihalf.com>
> ---
>  .../bindings/sound/google,chv3-audio.yaml     | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/google,chv3-audio.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/google,chv3-audio.yaml:34:23: [error] empty value in block mapping (empty-values)
./Documentation/devicetree/bindings/sound/google,chv3-audio.yaml:35:25: [error] empty value in block mapping (empty-values)
./Documentation/devicetree/bindings/sound/google,chv3-audio.yaml:36:23: [error] empty value in block mapping (empty-values)
./Documentation/devicetree/bindings/sound/google,chv3-audio.yaml:37:25: [error] empty value in block mapping (empty-values)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/google,chv3-audio.yaml: required:1: {'google,audio-cpu0': None} is not of type 'string'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/google,chv3-audio.yaml: required:2: {'google,audio-codec0': None} is not of type 'string'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/google,chv3-audio.yaml: required:3: {'google,audio-cpu1': None} is not of type 'string'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/google,chv3-audio.yaml: required:4: {'google,audio-codec1': None} is not of type 'string'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/google,chv3-audio.yaml: ignoring, error in schema: required: 1
Documentation/devicetree/bindings/sound/google,chv3-audio.example.dtb: /example-0/sound: failed to match any schema with compatible: ['google,chv3-audio']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230414140203.707729-4-pan@semihalf.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

