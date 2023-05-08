Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 950336F9FD8
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 08:28:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12DA411C0;
	Mon,  8 May 2023 08:27:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12DA411C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683527281;
	bh=2N7NjTH2VlqAsqbaUR/4INqfOxbZgYbmhjjcV1pq71k=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j+XsvFUFi7BJ0T4d4gECtB2wONZEAXuC+sZ2rqRiaWN5p34j7UTB9Au7Pfb6yFcv+
	 PKew0bgenatA9kR+SfPK5SN47/p9HCAYGOpEQ9f6+XkDhDZePwienuL8Uv98k+gwGD
	 WCfk5May/IbsMrcv47bCFiTfG4+iEDikZAqoNQEI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53B88F80310;
	Mon,  8 May 2023 08:27:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0465F8032D; Mon,  8 May 2023 08:27:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9FE7F802E8
	for <alsa-devel@alsa-project.org>; Mon,  8 May 2023 08:27:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9FE7F802E8
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-1928860f63eso2677437fac.0
        for <alsa-devel@alsa-project.org>;
 Sun, 07 May 2023 23:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683527220; x=1686119220;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=witHYv1Hkh138s1daDFZMrxf1YGkxRazduMe4ExLmyE=;
        b=hKE2y38OVXjX2z+uw4YnUbVPFAdx32tvr25XJ1to1sExGG9DdaxUOPVODHvnTkjrHN
         gn/CKW5aVBQRggyzWcEA9CV1kNDQ+jtg2dUezM/hcqf+9HbKbWLRoVxmmk51YGk/X9by
         WdSXZPgARGpROT12RV4qEA0//UWL+10Lo68bvYuZPrASmFZfw+QVCO/OPwzhPn4XvhMh
         cbFBTNVR0fMWt8gRN4CvHgXCqk0vYY43r3zn45GbMs1L2hAm3tVpjEQ60/41R8JpdAS0
         bRVP+NQMAKN6WkXLehRJd5sJRuidOQ+zYrhZeaOedhO9EbdTWbRcEdrydABvIhqAm5EY
         xxZQ==
X-Gm-Message-State: AC+VfDwOnXj7C/HrZmel4nz0JRr6n8cTm4LXhQDd8JEF++WGJB/HcARA
	+vkvKIuf7LAustRu2Mtang==
X-Google-Smtp-Source: 
 ACHHUZ4IPcRapdZOKJCWtWLeNloyjZMFnl+3ZMAIwpbyb4CfDyFLDZldO69cTTbbsAhM+OmRQZ8ojg==
X-Received: by 2002:a05:6870:36c6:b0:17f:17a3:6a53 with SMTP id
 u6-20020a05687036c600b0017f17a36a53mr4261981oak.53.1683527220047;
        Sun, 07 May 2023 23:27:00 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 n3-20020a056870034300b00176d49bb898sm4575083oaf.44.2023.05.07.23.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 23:26:59 -0700 (PDT)
Received: (nullmailer pid 213415 invoked by uid 1000);
	Mon, 08 May 2023 06:26:53 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Shenghao Ding <13916275206@139.com>
In-Reply-To: <20230508054512.719-1-13916275206@139.com>
References: <20230508054512.719-1-13916275206@139.com>
Message-Id: <168352721271.213340.3578983696891383785.robh@kernel.org>
Subject: Re: [PATCH v2 2/5] ASoC: dt-bindings: Add tas2781 amplifier
Date: Mon, 08 May 2023 01:26:53 -0500
Message-ID-Hash: 6UOANV57JKEJOC3EANW2O6VESD6SCHTK
X-Message-ID-Hash: 6UOANV57JKEJOC3EANW2O6VESD6SCHTK
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Ryan_Chu@wistron.com, navada@ti.com, gentuser@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, shenghao-ding@ti.com, Sam_Wu@wistron.com,
 lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org, x1077012@ti.com,
 broonie@kernel.org, kevin-lu@ti.com, devicetree@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, peeyush@ti.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6UOANV57JKEJOC3EANW2O6VESD6SCHTK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 08 May 2023 13:45:12 +0800, Shenghao Ding wrote:
> Create tas2781.yaml for tas2781 driver.
> 
> Signed-off-by: Shenghao Ding <13916275206@139.com>
> 
> ---
> Changes in v7:
>  - Submit together with tas2781 codec driver code
>  - Add more detail description for ti,audio-slots
>  - Keep consistent for "I2C"
>  - remove reset-gpios description
>  - For reg, express as constraints instead
>  - remove unnecessary '|'
>  Changes to be committed:
> 	new file:   Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> ---
>  .../devicetree/bindings/sound/ti,tas2781.yaml | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/rockchip-isp1.example.dtb: camera@3c: port:endpoint:data-lanes: [[1]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.example.dtb: camera-sensor@3c: port:endpoint:data-lanes: [[1]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.example.dtb: pcie-ep@33800000: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml

doc reference errors (make refcheckdocs):
Documentation/usb/gadget_uvc.rst: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
MAINTAINERS: Documentation/devicetree/bindings/pwm/pwm-apple.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230508054512.719-1-13916275206@139.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

