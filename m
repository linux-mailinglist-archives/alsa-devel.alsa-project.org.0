Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2F36FAFFF
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 14:29:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95DF01249;
	Mon,  8 May 2023 14:28:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95DF01249
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683548971;
	bh=WMAepcdYvkpMIuhMUTHh7+4TkQTf2tHEDY0izeOfpI0=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EDqho37Z5MBHz+KaMDzSZ1XuYugnvMUbT3Qoz3WVam4ypuLDN4h3EUKUim1X6bUtZ
	 9D3GygQ+NWRXvIlRkdukKNsI8QXSmhse7T7MwIeg87aZvgbVzcnelkOzFAqsUkn0ZZ
	 enrUc1uzuirhdhUnXumKk62dhz6L1pgxLryedmIY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A3FDF80534;
	Mon,  8 May 2023 14:27:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 044B9F8032D; Mon,  8 May 2023 14:27:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91984F802E8
	for <alsa-devel@alsa-project.org>; Mon,  8 May 2023 14:27:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91984F802E8
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-18f4a6d2822so31032109fac.1
        for <alsa-devel@alsa-project.org>;
 Mon, 08 May 2023 05:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683548864; x=1686140864;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N1qNtZkOJFNMLIG5NF8YsKtv7JnAcb6X8FfPa3NPMEY=;
        b=SMwXIaMoHy0zCAIzbxDaxhaWbbrzdsZePMa9i7Lr9mI43JVkJwiMUkf0yuv/Haquj+
         IRgS2fJpPVIRKWTC13f9Z0C1R7kIkfkNMoWm5yL0y1FW9Vfyz/lIfbhbyUVXZrUSMnTr
         vYZmKE/lJ5Hkl8F8xr1C2lGmxMtHuAtXu6XpB6L8QwJDA0+yZCWHPz/7Dh9c4EWE7R7J
         32nLbN/fjpzx8FUCeO+zeQcEMx34f0kw9MuRL5cSlMWN6uid7f9YfLq4kl7BG91P3B8n
         +q4YChxKQOnEqP+6J7OiRW4dq0uWHrJI1R8Aj2Gv+KNlM3E/vM1/FzH/i3dnvvju8BoK
         dAKw==
X-Gm-Message-State: AC+VfDyBYUE0dJQTOXmH6+4gCzBTAb7Urs68dW1u0cqwz0uMkj17OA2v
	2Ub1RP69gRXKlgmt7gTerg==
X-Google-Smtp-Source: 
 ACHHUZ54sbYEhdOQ6Gn29dzpKoxCe6JDKsc00jIVM5oE77IUFpoRMfoW/91rxlvOQEnkp1gVgTLrMg==
X-Received: by 2002:a05:6830:1da8:b0:6a5:d9eb:c529 with SMTP id
 z8-20020a0568301da800b006a5d9ebc529mr4623587oti.8.1683548864263;
        Mon, 08 May 2023 05:27:44 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 z26-20020a0568301dba00b006a2cc609ddasm4038745oti.2.2023.05.08.05.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 05:27:43 -0700 (PDT)
Received: (nullmailer pid 927520 invoked by uid 1000);
	Mon, 08 May 2023 12:27:38 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Pawe=C5=82_Anikiel?= <pan@semihalf.com>
In-Reply-To: <20230508113037.137627-4-pan@semihalf.com>
References: <20230508113037.137627-1-pan@semihalf.com>
 <20230508113037.137627-4-pan@semihalf.com>
Message-Id: <168354885743.927427.9242565928327424252.robh@kernel.org>
Subject: Re: [PATCH v2 3/7] ASoC: dt-bindings: Add Google Chameleon v3 i2s
 device
Date: Mon, 08 May 2023 07:27:38 -0500
Message-ID-Hash: UO3X4QUMWOTGEJUZ3QJTIS5KUPLEBHUP
X-Message-ID-Hash: UO3X4QUMWOTGEJUZ3QJTIS5KUPLEBHUP
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 dinguyen@kernel.org, broonie@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 lgirdwood@gmail.com, tiwai@suse.com, upstream@semihalf.com,
 alsa-devel@alsa-project.org, amstan@chromium.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UO3X4QUMWOTGEJUZ3QJTIS5KUPLEBHUP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon, 08 May 2023 13:30:33 +0200, Paweł Anikiel wrote:
> Add binding for google,chv3-i2s device.
> 
> Signed-off-by: Paweł Anikiel <pan@semihalf.com>
> ---
>  .../bindings/sound/google,chv3-i2s.yaml       | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.example.dtb: camera-sensor@3c: port:endpoint:data-lanes: [[1]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/rockchip-isp1.example.dtb: camera@3c: port:endpoint:data-lanes: [[1]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.example.dtb: pcie-ep@33800000: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml

doc reference errors (make refcheckdocs):
Documentation/usb/gadget_uvc.rst: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
MAINTAINERS: Documentation/devicetree/bindings/pwm/pwm-apple.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230508113037.137627-4-pan@semihalf.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

