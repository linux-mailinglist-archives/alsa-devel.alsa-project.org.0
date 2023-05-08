Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CDC6FA368
	for <lists+alsa-devel@lfdr.de>; Mon,  8 May 2023 11:33:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCC4D1299;
	Mon,  8 May 2023 11:33:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCC4D1299
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683538432;
	bh=BUiTF445WKprmiPoqtMo0Jeg0gLKQqKsT7/XgTQvkJc=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mY82XlrG3zF2iWCAaRWNrz3yCiy3mMX+v/mMaJ/C1sLe92Vfj7yHa0Nrxkpyk9hmi
	 zD8n+p8eTCgV40Gkk3zklsNUr+RKigrnGAJucK7GTYcwRz8hRtQqm16B4BsG3q5grL
	 w+7fu492pjQCKmfcAeL5j+zupelqkF/cK4X17Skc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB022F80310;
	Mon,  8 May 2023 11:33:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95200F8032D; Mon,  8 May 2023 11:32:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 364CBF802E8
	for <alsa-devel@alsa-project.org>; Mon,  8 May 2023 11:32:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 364CBF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=r8xKe2ue
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-965fc25f009so479830666b.3
        for <alsa-devel@alsa-project.org>;
 Mon, 08 May 2023 02:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683538343; x=1686130343;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jaIOfIKT6cUzQnXA2pY8MBVw5AuuF4DUG96T6VN7SUU=;
        b=r8xKe2ueE6qpZ5q7fx2Jr8j9y8jdvbEl/dJ9MSBywzTaJGn2c/IQr9fhngQwzv+eK8
         3dKMmSF6g6nSseCp2P2WS3jBDXpqlFLuLSrkAk2YV+myVAs7Aqp/C43Spb3zAe+2Lbs5
         Wt8RhC2uDN5NrFDxdf6XL5LnzmSxdtpnNvX1jDwngbIY5QuvpurFg0dPfQh7q2v8r7mP
         tnlzEa9dQfEC9d6v+YdVnGvkRNA19kacCMnSAOKdGIxlmq9ZbzonSHap2R3pxlaEyAUN
         vBvZyBx30LY5A2TJmL4fkoSn57rXbp1tm4YmcYLRoSxpUO0YYG3HCpauLVXCXCoH9thZ
         J+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683538343; x=1686130343;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jaIOfIKT6cUzQnXA2pY8MBVw5AuuF4DUG96T6VN7SUU=;
        b=P/1wa7wpAUMswF5OFCLCqq9K1Qq6XdHktxUpNcVGyxEXcIoywaFzatEC0RSlNQHRa5
         DzjOCQiSvzSxCJAWEYvYp60wPVjWZkJdxmcnWKjdgTMRX7l41pkGartg3FgQ0luplw5h
         cQ/ZuRQETmY2Iy83FhWfJ0TGxxT2amtRd9OFXNtCiWcBTTn33D9rZpBi2Fmd2ZN/DeWt
         85UUutiGxMzL8zgarWP3uDtGxJm3kWgd/M1Jh3nigxcYNMnrEhqWx2HUV4AB0o8jErsV
         puWawZkVfXFD9nYxsX55oe/yVlMqV9i2vxUxA5J/4y7Fm0kr5Wry/4N/9+DvLRtT1tgd
         f7Zg==
X-Gm-Message-State: AC+VfDyCOuwhNZ4XD/LF7a4rNxNWkeLoRbemdO4PJlsmsirtyj3NH/o/
	uCi5pETSrQhMD2kOPhxX4WJOZQ==
X-Google-Smtp-Source: 
 ACHHUZ7wCYtUf+7LVo6j+oVxWM1xFUqc13NehBZU/lO5rS1cti0ZTm6SDm50E98ky0UvdHVluWukHQ==
X-Received: by 2002:a17:907:1b24:b0:94e:5c28:1c19 with SMTP id
 mp36-20020a1709071b2400b0094e5c281c19mr9319621ejc.5.1683538343137;
        Mon, 08 May 2023 02:32:23 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:50e0:ebdf:b755:b300?
 ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id
 hw6-20020a170907a0c600b0096602a5ab25sm3629254ejc.92.2023.05.08.02.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 02:32:22 -0700 (PDT)
Message-ID: <228ebc9d-f70f-3f12-381f-1ef6f24f2f28@linaro.org>
Date: Mon, 8 May 2023 11:32:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/5] ASoC: dt-bindings: Add tas2781 amplifier
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Shenghao Ding <13916275206@139.com>
References: <20230508054512.719-1-13916275206@139.com>
 <168352721271.213340.3578983696891383785.robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <168352721271.213340.3578983696891383785.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5J36WJGHGV3HRXJBYGFTN2DWBJXKGR6H
X-Message-ID-Hash: 5J36WJGHGV3HRXJBYGFTN2DWBJXKGR6H
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5J36WJGHGV3HRXJBYGFTN2DWBJXKGR6H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/05/2023 08:26, Rob Herring wrote:
> 
> On Mon, 08 May 2023 13:45:12 +0800, Shenghao Ding wrote:
>> Create tas2781.yaml for tas2781 driver.
>>
>> Signed-off-by: Shenghao Ding <13916275206@139.com>
>>
>> ---
>> Changes in v7:
>>  - Submit together with tas2781 codec driver code
>>  - Add more detail description for ti,audio-slots
>>  - Keep consistent for "I2C"
>>  - remove reset-gpios description
>>  - For reg, express as constraints instead
>>  - remove unnecessary '|'
>>  Changes to be committed:
>> 	new file:   Documentation/devicetree/bindings/sound/ti,tas2781.yaml
>> ---
>>  .../devicetree/bindings/sound/ti,tas2781.yaml | 90 +++++++++++++++++++
>>  1 file changed, 90 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2781.yaml
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/rockchip-isp1.example.dtb: camera@3c: port:endpoint:data-lanes: [[1]] is too short
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.example.dtb: camera-sensor@3c: port:endpoint:data-lanes: [[1]] is too short
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.example.dtb: pcie-ep@33800000: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml
> 
> doc reference errors (make refcheckdocs):
> Documentation/usb/gadget_uvc.rst: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
> MAINTAINERS: Documentation/devicetree/bindings/pwm/pwm-apple.yaml
> 

Ignore failures.

Best regards,
Krzysztof

