Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1F06E2A2E
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 20:39:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B141E76;
	Fri, 14 Apr 2023 20:39:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B141E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681497590;
	bh=1MqqJ5YcfcMqWaGniq4ziF4L1cIZOuli6OcnWa0jSNo=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J2+ibhnG3wGp2fYNTzHqI0k+aPjgex7tP4ltD69UHcxi8Tw6xaeD2HjaDzTNi7zd8
	 sbvAGuFc2pB19ziCFdZM8n+m1lyW6gioOu1zheYft2XAoHp2nvDZLtxgbD8Y7Iwhv+
	 up1t7sWWv6slmS31qHfW2n0nwotAcqEEsfT13LeY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53AF3F804F2;
	Fri, 14 Apr 2023 20:38:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CEEEF8025E; Fri, 14 Apr 2023 20:38:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CECD6F80149
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 20:37:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CECD6F80149
Received: by mail-oi1-f173.google.com with SMTP id bp4so776050oib.11
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Apr 2023 11:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681497478; x=1684089478;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M3HtHA0gVZkFMXo90iAJK1D4kK0Vnqrx23dVYZa9s6Q=;
        b=c9ARXTWXtRn6oH1QEh/zubbdLKZAgxUj2RiZ6L8v5iSifWrcT59l4zexgvJb44r2Aw
         G+paivJTVimykvwAwSGlVjx5SkMgZ6cJw7DJevk6DddlgfEVRaeDmXGe+tkfCedKmQ05
         TBXIDneZabVGtRXl+xulG5f1Vwv65Mtuz6QpOuqivCpSM4X7zVJmP5+1itfAj3VGe8Hj
         gWlkgRd51X8ysJXdNVb4dAGkqHnTvne84tQpXFVVrhJY5Q1ClOoA1yAfINkQRx0idZ1K
         FTGTnZeRMVFWyOWjq2SBVM6rV8kknh1+h2n9mCoWigTFx+Dfi/8dsqfZeM0iwo2irVPn
         70/g==
X-Gm-Message-State: AAQBX9cE5J9Ltu0A0STXoVUoqe1HUbb2pyZivYKKgPN9i8E9ggTpC4HK
	DbKHtyt++5pZKp5TLxxB1g==
X-Google-Smtp-Source: 
 AKy350aOPgK8kpqO4eMGv1waB/ROvTGlRtF8RlxNVHmhkcDxYzOjt+oaUAnaLIndFYo7Rze9I1Uajg==
X-Received: by 2002:aca:190c:0:b0:388:f4de:1ed7 with SMTP id
 l12-20020aca190c000000b00388f4de1ed7mr3023405oii.1.1681497477774;
        Fri, 14 Apr 2023 11:37:57 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 bg15-20020a056808178f00b003896f132821sm1937199oib.41.2023.04.14.11.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 11:37:57 -0700 (PDT)
Received: (nullmailer pid 105415 invoked by uid 1000);
	Fri, 14 Apr 2023 18:37:55 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
In-Reply-To: <20230414140203.707729-5-pan@semihalf.com>
References: <20230414140203.707729-1-pan@semihalf.com>
 <20230414140203.707729-5-pan@semihalf.com>
Message-Id: <168149743096.103906.17176550514603692086.robh@kernel.org>
Subject: Re: [PATCH 4/9] dt-bindings: ASoC: Add it68051
Date: Fri, 14 Apr 2023 13:37:55 -0500
Message-ID-Hash: EWOFFVD2K5SRS2SOHMINP6YMEDYD24HQ
X-Message-ID-Hash: EWOFFVD2K5SRS2SOHMINP6YMEDYD24HQ
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: upstream@semihalf.com, robh+dt@kernel.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, lars@metafoo.de, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 nuno.sa@analog.com, tiwai@suse.com, lgirdwood@gmail.com, dinguyen@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EWOFFVD2K5SRS2SOHMINP6YMEDYD24HQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 14 Apr 2023 16:01:58 +0200, Paweł Anikiel wrote:
> Add binding for it68051 device.
> 
> Signed-off-by: Paweł Anikiel <pan@semihalf.com>
> ---
>  .../bindings/sound/ite,it68051.yaml           | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/ite,it68051.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/ite,it68051.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: Either unevaluatedProperties or additionalProperties must be present
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230414140203.707729-5-pan@semihalf.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

