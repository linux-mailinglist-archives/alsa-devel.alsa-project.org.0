Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 667DB6FBF23
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 08:17:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF60E1137;
	Tue,  9 May 2023 08:16:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF60E1137
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683613026;
	bh=llAnuXDIm4pH9ZvDqMflJwUg2cgdOHrcHdnD946tFIc=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r4noM3Dek6R5gn/ZciXfBnAiVwY7NKg1WJkuMk1rjslyEqK8CeOSggiMHbO3onePz
	 gEqL7QPSjqPwQhmUbOpXYLjerBfKAwHlT0IMcVhqqKr76+JrcXnxWGQBojpnNTa+GT
	 KmCCScSyR4yeo+pAnhjXlgzxGQk3yqYgj5ORMTe4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDFCDF8053B;
	Tue,  9 May 2023 08:15:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D054F8032D; Tue,  9 May 2023 08:14:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B24DF8014C
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 08:14:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B24DF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=A3mbAw8Z
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9659443fb56so828957666b.2
        for <alsa-devel@alsa-project.org>;
 Mon, 08 May 2023 23:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683612879; x=1686204879;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FGhf5+4AZLSx/aWkdnknlgjdTW0b2P9oXzfs5UXvz7k=;
        b=A3mbAw8ZEklFQGCEPeYe/NzI/Q3R4oVy8L2/Cq21L/IDlkT58DFOaqWQwp4Ld3Jiz/
         7FqmvITuFUjKIzTGhMRROM0OsDYf6jJPL4D7Qy193SSqtG5nd9hKUHbRu2oap62UioYv
         wkTFyGgQ5VXpWDl1twOPddgt1Wo7IvqyhDlraUZLKVDfaEvsz086FOPpp5vlz2IuTvV5
         RzC9Pv/2dkeZDYr7wvyWkBMIUkmaHRJYqu1v2EAlnHt4pO/PZoIjgXiC+g9nVWvOGDne
         9KBRMNndPLQzRWB/vnADOIMwWERPLDiW7sGhmXVwmRy6QqME+bLPxy+bkrftsoF4tOzi
         LrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683612879; x=1686204879;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FGhf5+4AZLSx/aWkdnknlgjdTW0b2P9oXzfs5UXvz7k=;
        b=gndvHUjWSeFbJeP9ghiRCRxlNdyUJlJ6rIq4eksEzrIarRoM6Hdah4oE5RXlQq58E8
         qdgkPbMWw9I/V5ujytTRYxqMkx2gRhZP46WVUBrVF/yCYirJNY05zqWMRKztYbmqoiEN
         BZceuyi2wMrp/WsSKjZUHSsdDB6SVFm2qPMU9Zkp2U5xrntn0lCo4QK4cFXAlqoo5SX7
         2IM3tm6Bky7o/5ktCjMW9Q6CbcldWe0D4IBaI+TMwb7LhBejEbiLzlwyg1Wo5j2/t19c
         dte2a8aAgW74HC9/6ehkn1yeq4NGQlA0/apk45sSsOxarEcLtfMPWYMpMQx/dNtzyH3q
         efbQ==
X-Gm-Message-State: AC+VfDy2sovVkhw63boTx1Gq9tYr4IB237gl0fCLFIdcWkpNrAHo2RH1
	7Mq1wLG4rYICJiry/k+B2h40uA==
X-Google-Smtp-Source: 
 ACHHUZ4PzzYa6MUnO2P5nVTMxLeLhTrh/2WhQqar05N3QXEDNn0G3uR/Kj+VXuvHY19KuV+oclAjlA==
X-Received: by 2002:a17:907:97d0:b0:969:7739:2eb7 with SMTP id
 js16-20020a17090797d000b0096977392eb7mr3182670ejc.4.1683612879542;
        Mon, 08 May 2023 23:14:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76?
 ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id
 jl21-20020a17090775d500b00965b5540ad7sm911043ejc.17.2023.05.08.23.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 23:14:39 -0700 (PDT)
Message-ID: <cd5869e0-561a-0716-2deb-8a32acd03630@linaro.org>
Date: Tue, 9 May 2023 08:14:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/7] ASoC: dt-bindings: Add Google Chameleon v3 i2s
 device
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, =?UTF-8?Q?Pawe=c5=82_Anikiel?=
 <pan@semihalf.com>
References: <20230508113037.137627-1-pan@semihalf.com>
 <20230508113037.137627-4-pan@semihalf.com>
 <168354885743.927427.9242565928327424252.robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <168354885743.927427.9242565928327424252.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4ZO432LSOHB6HASS6VGF7H75OL7QSOZL
X-Message-ID-Hash: 4ZO432LSOHB6HASS6VGF7H75OL7QSOZL
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4ZO432LSOHB6HASS6VGF7H75OL7QSOZL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/05/2023 14:27, Rob Herring wrote:
> 
> On Mon, 08 May 2023 13:30:33 +0200, Paweł Anikiel wrote:
>> Add binding for google,chv3-i2s device.
>>
>> Signed-off-by: Paweł Anikiel <pan@semihalf.com>
>> ---
>>  .../bindings/sound/google,chv3-i2s.yaml       | 44 +++++++++++++++++++
>>  1 file changed, 44 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.example.dtb: camera-sensor@3c: port:endpoint:data-lanes: [[1]] is too short
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/rockchip-isp1.example.dtb: camera@3c: port:endpoint:data-lanes: [[1]] is too short
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.example.dtb: pcie-ep@33800000: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml
> 
> doc reference errors (make refcheckdocs):
> Documentation/usb/gadget_uvc.rst: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
> MAINTAINERS: Documentation/devicetree/bindings/pwm/pwm-apple.yaml

These errors can be ignored.

Best regards,
Krzysztof

