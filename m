Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1556165975C
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Dec 2022 11:36:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12AB01861;
	Fri, 30 Dec 2022 11:35:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12AB01861
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672396565;
	bh=7TQhC+3wi411T97AQsLUT9FU/bhtleQNYxWFqTO+7AY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fYYzALmYf/fxVF1mqw/9vr1TmkQ1KIqqIQAvP0EAZLRcZNCtv/Vbmvh8wA0ypV5iI
	 BAkSKtYi0gVLWWYZhkM/0sIE0dHE09hQkZfyD3U8Z5WW47keM5yUDuL+CQfjQZOsE7
	 ZwfCZGiwZmtlU6X7p54AbsClD7XqaoMkPCMD9RQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A235F8023B;
	Fri, 30 Dec 2022 11:35:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 436DAF80310; Fri, 30 Dec 2022 11:35:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34D66F80424
 for <alsa-devel@alsa-project.org>; Fri, 30 Dec 2022 11:34:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34D66F80424
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZieVv/Xa
Received: by mail-lj1-x236.google.com with SMTP id q2so21763156ljp.6
 for <alsa-devel@alsa-project.org>; Fri, 30 Dec 2022 02:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4gZZiGQ+xFONbkR4CIrEsTxT504WgQCnXV2mN31jYnM=;
 b=ZieVv/XajF8WcLke51z9UL9xLXnO6yPGYeZ1sAnknxajcy8CtxONvzg71hHfrWp1VF
 afe/qJvMx53OPPDBTLU+KBPdyZXvlC99rmPZR2vPt8e1gg1SE0Au+XN1LUtoSI+XcZOe
 TKBZQbK5tglBFbUT0Av8/WlLY3OWQctjym6STjgeUVvXtHQSYHHlrG1+TTiyejHLxyg+
 E0fAKenwqhoqV06lFIGt4kBVIs4UewJhQPSq8PgOYt/QQZrsPPyjLu0gID6xXCU62fPe
 gjriEDf99TKGTpSz9GcVP8qHRHhGxvQ3l1vAyIkkhbgxdua1T6SYhEz/jLqttY67XPiF
 KK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4gZZiGQ+xFONbkR4CIrEsTxT504WgQCnXV2mN31jYnM=;
 b=Bq1YfioXlWmCurle/8gH06E7F45Smiz4a91y5RiwMlHlfgUiVAYemrjim3YJyiE2cp
 2t2Al0QA3LTeJ2QaRwquwDAbz9DmrPrxxHPL1M11hnP/foyo1BNvPqCpemDqRxDr1RlZ
 bBop+Kv8I8WHI8QhPzJ78/dhmOYsbPYfFIIr0oWCfjN7ycZ4yri08O0/Fb8vqZyGy7tV
 gDaGIGxiWipf1AS/4nHtchJf5UsFjC1wd8NTTfPiWr8xoPP2k/odZnV1P2JIuNHTcXwa
 TbQ/QQZgctP9QESUvereJip2q5uhMjIzSPTqPsbB2A2/n2VUgM6TlnjIuwdGb+/HQpGX
 9A3A==
X-Gm-Message-State: AFqh2kp1Vci8tRiaFKH/J8XBZCHJChkJRPMx31+m9V84H3zHT9ALCIWc
 4KxRwj2azFqZOsa78CJMgyVO7A==
X-Google-Smtp-Source: AMrXdXvzF8oYbHVC+IVUBfdVwMBkjkv7OIATsoaATU44WqsdaR+oea3Fo0kgBAOv9WJknPjgOyGm0Q==
X-Received: by 2002:a2e:553:0:b0:27e:521c:92c8 with SMTP id
 80-20020a2e0553000000b0027e521c92c8mr9407978ljf.7.1672396496325; 
 Fri, 30 Dec 2022 02:34:56 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 q18-20020a2eb4b2000000b0027713ef5360sm2579821ljm.71.2022.12.30.02.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Dec 2022 02:34:55 -0800 (PST)
Message-ID: <aa0de3c8-d783-f8cc-42a9-7988acd6ab87@linaro.org>
Date: Fri, 30 Dec 2022 11:34:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V8 5/5] ASoC: dt-bindings: Add schema for "awinic, aw883xx"
To: wangweidong.a@awinic.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, perex@perex.cz,
 tiwai@suse.com, ckeepax@opensource.cirrus.com, rf@opensource.cirrus.com,
 povik+lin@cutebit.org, pierre-louis.bossart@linux.intel.com,
 james.schulman@cirrus.com, flatmax@flatmax.com, cezary.rojewski@intel.com,
 srinivas.kandagatla@linaro.org, tanureal@opensource.cirrus.com,
 steve@sk2.org, stephan@gerhold.net, zhuning0077@gmail.com,
 shumingf@realtek.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221230093454.190579-1-wangweidong.a@awinic.com>
 <20221230093454.190579-6-wangweidong.a@awinic.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221230093454.190579-6-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: yijiangtao@awinic.com, duanyibo@awinic.com, zhaolei@awinic.com,
 liweilei@awinic.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 30/12/2022 10:34, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> Add a DT schema for describing Awinic AW883xx audio amplifiers. They are
> controlled using I2C.
> 
> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
> ---
>  .../bindings/sound/awinic,aw883xx.yaml        | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
> new file mode 100644
> index 000000000000..b677427ebcd1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/awinic,aw883xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Awinic AW883xx Smart Audio Amplifier
> +
> +maintainers:
> +  - Stephan Weidong Wang <wangweidong.a@awinic.com>
> +
> +description:
> +  The Awinic AW883XX is an I2S/TDM input, high efficiency
> +  digital Smart K audio amplifier with an integrated 10.25V
> +  smart boost convert.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: awinic,aw883xx

Now the question what does "xx" stand for? I cannot find such product on
awinic website:
https://www.awinic.com/En/Index/queryAll/wd/aw883xx.html

> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +

Why there is no sound-dai-cells?


> +  sound-name-prefix: true

Drop it.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +
> +additionalProperties: false

Instead:
unevaluatedProperties: false

unless this is not a codec and sound-dai-cells cannot be used?

> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        audio-codec@34 {
> +            compatible = "awinic,aw883xx";
> +            reg = <0x34>;
> +            reset-gpios = <&gpio 10 GPIO_ACTIVE_LOW>;

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

Best regards,
Krzysztof

