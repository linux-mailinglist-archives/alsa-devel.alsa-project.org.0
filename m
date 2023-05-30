Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C478716485
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 16:41:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC4CE20C;
	Tue, 30 May 2023 16:40:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC4CE20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685457700;
	bh=OaazuDP+ske2BHqqq390QWC0IaMvbNwxukB9h2ItmDA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OGCaz6Y2E4a7C6xXU8bEt9xz6+RC2FZemnqDS0MywOMuAO1FraVYkdvi2hRUqIQQA
	 DvOIXiGzzb8RKG3GAr+U0xeuLZ8UnyZeNGq6wj6NIczNSyyFEwkAzOO/9o34780S9J
	 +eSyY9TXGe2ebzBwEkaQ/vc4XPHgwExa1gK7Ai0A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCDB8F8042F; Tue, 30 May 2023 16:40:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B517AF800DF;
	Tue, 30 May 2023 16:40:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86CA6F8042F; Tue, 30 May 2023 16:40:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 50EFAF8016B
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 16:40:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50EFAF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Plsb8fik
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-96fbc74fbf1so845703166b.1
        for <alsa-devel@alsa-project.org>;
 Tue, 30 May 2023 07:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685457621; x=1688049621;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xe6HK9Kb35n4rfCfNWtBuecD+uDUu7lqn2KbidhEueY=;
        b=Plsb8fika+/zh+L/6FO0YtwBdpqBVezJiZNWFl1VRMvGSMEhCLKcxWhOraKns36TDF
         uqdpMfUTfAhBc2/OkGK3xDCAmrng9gbAF9Z7hmf8ywWHpeBSoNUfCuFHIHkFfYhNFY96
         ABDuCIcXn8HEA/RE6fhbKDjbQ8nMbpvdiA3CqiK8g+MUEm+JgasKDXesrpPNrUftMAI/
         dARy6NLOm2X2M/OywmrqVCytL4CNoOk2hJAUZ+bjveYeC/zmXcmSU72Jtk6nZ9eeVUlF
         EnXr6CimLZR8/UXu+JKsudTXoQhrmE9IA7sxOad2ae2PP3I9d1nqxJc7juXUhwEPUd6V
         sGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685457621; x=1688049621;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xe6HK9Kb35n4rfCfNWtBuecD+uDUu7lqn2KbidhEueY=;
        b=d9G6AUvhVbWOq5bGor3zRqHFr6fZYHcVTxja86/2o2hvh6uHRaC1HDaNZjTp+JflGT
         0nQ1V/i3S/xODyhNlt7OvWHjTzOPXwiwKIFjcwHHM9m4zEWFk/lJQNqQHe/R2Y0InP7B
         ERhsbIdW+RlZuKLgAjlPv+F1uY1H8p2tkLDnZbF0maDMKfbZbzSieGZpd+U3LSoplhU8
         He/yLHyvx2oqzK8FxcdJBwME1YopQurHNId4EtBZnqdkp3rKTrp/ge3gRfvf2IE4mdYK
         EW4/HH/sLIP/On5nvpEpUsoEJnbt5ELRcG5mGRMwPbf48X/P+XzI4x6JlZa6U8p4W/mg
         go2w==
X-Gm-Message-State: AC+VfDxu9IOsuKxfB/bn6CkNcG6mZbsRLZbqpOKOSNUOQjH1SBPCN3sr
	Z00pDkKLb1iLI1HeFdobnqDQYw==
X-Google-Smtp-Source: 
 ACHHUZ5Ta7S9kKaVrAx84G6ObMgsg+WsFPS9nY9M8aUCa8bxlB3xzf4hXlb1WcyJ4QEO+vwXrQsD+w==
X-Received: by 2002:a17:907:7d90:b0:94a:8291:a1e3 with SMTP id
 oz16-20020a1709077d9000b0094a8291a1e3mr2573651ejc.74.1685457621030;
        Tue, 30 May 2023 07:40:21 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id
 d7-20020a170906c20700b0096f55247570sm7412780ejz.0.2023.05.30.07.40.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 07:40:20 -0700 (PDT)
Message-ID: <cd4177b1-d418-58fc-9643-d013b7aa7ec4@linaro.org>
Date: Tue, 30 May 2023 16:40:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 6/6] ASoC: dt-bindings: Add tas2781 amplifier
Content-Language: en-US
To: Shenghao Ding <13916275206@139.com>, broonie@kernel.org,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
 pierre-louis.bossart@linux.intel.com
Cc: kevin-lu@ti.com, shenghao-ding@ti.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, x1077012@ti.com, peeyush@ti.com,
 navada@ti.com, gentuser@gmail.com, Ryan_Chu@wistron.com, Sam_Wu@wistron.com,
 tiwai@suse.de
References: <20230527223632.11781-1-13916275206@139.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230527223632.11781-1-13916275206@139.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DM43E63Z7L2FKWCO54HYEZDURHZQVCCQ
X-Message-ID-Hash: DM43E63Z7L2FKWCO54HYEZDURHZQVCCQ
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DM43E63Z7L2FKWCO54HYEZDURHZQVCCQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/05/2023 00:36, Shenghao Ding wrote:
> Create tas2781.yaml for tas2781 driver.
> 
> Signed-off-by: Shenghao Ding <13916275206@139.com>
> 
> ---
> Changes in v4:
>  - remove '\t' in the file

Keep the rest of the changelog.

>  Changes to be committed:
> 	new file:   Documentation/devicetree/bindings/sound/ti,tas2781.yaml

This is useless, drop.

Your mail threading is still broken. This breaks usage with b4, so I
cannot easily make diffs or apply it easily (e.g. via any message ID). I
already mentioned this and no improvements at v4.



> ---
>  .../devicetree/bindings/sound/ti,tas2781.yaml | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> new file mode 100644
> index 000000000000..b3dcd7b18f5d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2022 - 2023 Texas Instruments Incorporated
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments TAS2781 SmartAMP
> +
> +maintainers:
> +  - Shenghao Ding <shenghao-ding@ti.com>
> +
> +description:
> +  The TAS2781 is a mono, digital input Class-D audio amplifier
> +  optimized for efficiently driving high peak power into small
> +  loudspeakers. Integrated an on-chip DSP supports Texas Instruments
> +  Smart Amp speaker protection algorithm. The integrated speaker
> +  voltage and current sense provides for real time
> +  monitoring of loudspeaker behavior.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  '#address-cells':
> +    const: 1
> +  '#size-cells':
> +    const: 0

Put compatible first. What's more I don't understand why added it. Your
changelog does not explain it - you wrote there is only one change, fix
of tab.

> +
> +  compatible:
> +    enum:
> +      - ti,tas2781
> +
> +  reg:
> +    description:
> +      I2C address, in multiple tas2781s case, all the i2c address
> +      aggreate as one Audio Device to support multiple audio slots.
> +    maxItems: 4
> +    items:
> +      minimum: 0x38
> +      maximum: 0x3f
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ti,broadcast-addr:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Generic I2C address for all the tas2781 devices in
> +      purpose of I2C broadcast during the multi-device
> +      writes, useless in mono case or remove this item to
> +      disable broadcast mode.
> +
> +  '#sound-dai-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +   #include <dt-bindings/gpio/gpio.h>
> +   i2c {
> +     /* example with quad support, such as tablet or pad device */
> +     #address-cells = <1>;
> +     #size-cells = <0>;
> +     quad: codec@38 {
> +       compatible = "ti,tas2781";
> +       reg = < 0x38 /* Audio slot 0 */
> +               0x3a /* Audio slot 1 */
> +               0x39 /* Audio slot 2 */
> +               0x3b /* Audio slot 3 */

These should be four items, right? <0x38>, <0x3a> etc. Drop spaces
around <>, that's not DTS syntax.


> +               >;
> +       #sound-dai-cells = <1>;
> +       reset-gpios = < &gpio1 10 GPIO_ACTIVE_HIGH >;

Drop redundant white space.



Best regards,
Krzysztof

