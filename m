Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C48B6480C2
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 11:16:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9231420BA;
	Fri,  9 Dec 2022 11:15:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9231420BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670581004;
	bh=nIHVQM2qp1ERx5s4gJOxPizYJbsLmfYwUvMVobnSSgw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dPuVsB81iDCmvnSXRLmFnJUSRWlpXihWl1t3oWhskaySZi8lAnB2niitVqYyzAxbO
	 KthRvgrpY1JXmZA3N0vgcy2V1+OELBn0mX0yQuhjP7mBN1rvPWAtiO3KErQo8LeKUE
	 qM5JczULENGNWv4JKHviuFYZkesfYZAKC0eCUHJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E31CF800F8;
	Fri,  9 Dec 2022 11:15:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2428CF8022D; Fri,  9 Dec 2022 11:15:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2CB4CF800F8
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 11:15:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CB4CF800F8
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=iB4EZnlR
Received: by mail-lf1-x132.google.com with SMTP id b13so6307423lfo.3
 for <alsa-devel@alsa-project.org>; Fri, 09 Dec 2022 02:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BlvfkF2ZFYuFQpxBnIpN0aFK4kWr5DwTIlUFg1Sxm10=;
 b=iB4EZnlRNYR9XsnIqBEIPTBPZ2s9ORP0ZU5q5t8qP0qfsE1V1SD5UJIlwcXU5e4BFm
 hjg7dt4F/HGMUh1zYORVDvLvPrIp/6gj8VRMgbyztp9Az9iX1Ai5mGFp2w0jGh3YGAJO
 F8Pxd+pYMnHp6HwgbBk50hJtPrL0eMR6xW9Sz3tun7+qq7RXyM5F3z1Py3XYMwUC/s+F
 cSn2n099UHSkGl9tfbf81M/Kde3wmliN5v1T8ZtIhVfoYl5Zmu0VZmd7tI5vllaz/xPF
 AcF4lNgNIeUKyfuNLO8SiBLRDSFz0bjaGezpNvxlk0M8xzw2u4pp012hc0iPN/6r5bi3
 rPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BlvfkF2ZFYuFQpxBnIpN0aFK4kWr5DwTIlUFg1Sxm10=;
 b=CbfzGT4b3DMCU0G+NUgxpWF0h4Ufhu0a4g/w+MiHSvEK9hTaXdKUQMIX123g/gXIcw
 pn2ge/PhV+WaFGXPg2t6UN45TVUdIC9L0w80QK3J+IgT7dkb+VyBM1xO/lGPQj5jbgMO
 xateGuOpznlClY+PlJR8m9VX6E46s5UV3wePJhs/++TQ5dHCFZg8nm/MKI0bK6zl+YDe
 iClaM8Y3eOCuzPlJD/3UNH+9zm7+i/f9S1LE4HYxEcwDRLepTo1v44dvkuJECFrGCngE
 8V+P9Zzm6cEIbMFfED+mxA18wRR5PV26jgNTs71FqOhryQi+67evwP9ioRNesWoAF37G
 S2AQ==
X-Gm-Message-State: ANoB5pls4psrHv2jx4l34iGMyZxglfJlwiDX5nbmeQWeV+3IND1rZsD0
 jh8kTQ31F9xJppc5GHxuBRh4pg==
X-Google-Smtp-Source: AA0mqf4PV54SFqHCdc0zs8HGqB2QDXjAeslsLxGBJT/SW25dK9NlvFl04szs2leJ2cSdPYldgZKSqg==
X-Received: by 2002:a05:6512:10c3:b0:4b5:34c4:78a4 with SMTP id
 k3-20020a05651210c300b004b534c478a4mr1695393lfg.30.1670580939515; 
 Fri, 09 Dec 2022 02:15:39 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 a19-20020ac25053000000b004b5789ecdd7sm191371lfm.274.2022.12.09.02.15.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 02:15:39 -0800 (PST)
Message-ID: <d7d9f3c7-b3e3-1e13-a80f-c7bf7b38a5b1@linaro.org>
Date: Fri, 9 Dec 2022 11:15:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 10/12] dt-bindings: mediatek: mt8188: add audio afe
 document
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
References: <20221208033148.21866-1-trevor.wu@mediatek.com>
 <20221208033148.21866-11-trevor.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208033148.21866-11-trevor.wu@mediatek.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 08/12/2022 04:31, Trevor Wu wrote:
> Add mt8188 audio afe document.

Use subject prefixes matching the subsystem (git log --oneline -- ...).

> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../devicetree/bindings/sound/mt8188-afe.yaml | 196 ++++++++++++++++++
>  1 file changed, 196 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8188-afe.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8188-afe.yaml b/Documentation/devicetree/bindings/sound/mt8188-afe.yaml
> new file mode 100644
> index 000000000000..6ab26494d924
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt8188-afe.yaml


This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Comment was about filename matching compatible, so with vendor prefix.

> @@ -0,0 +1,196 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt8188-afe.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek AFE PCM controller for mt8188
> +
> +maintainers:
> +  - Trevor Wu <trevor.wu@mediatek.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8188-afe
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: audiosys
> +
> +  mediatek,topckgen:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the mediatek topckgen controller
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: 26M clock
> +      - description: audio pll1 clock
> +      - description: audio pll2 clock
> +      - description: clock divider for i2si1_mck
> +      - description: clock divider for i2si2_mck
> +      - description: clock divider for i2so1_mck
> +      - description: clock divider for i2so2_mck
> +      - description: clock divider for dptx_mck
> +      - description: a1sys hoping clock
> +      - description: audio intbus clock
> +      - description: audio hires clock
> +      - description: audio local bus clock
> +      - description: mux for dptx_mck
> +      - description: mux for i2so1_mck
> +      - description: mux for i2so2_mck
> +      - description: mux for i2si1_mck
> +      - description: mux for i2si2_mck
> +      - description: audio 26m clock
> +
> +  clock-names:
> +    items:
> +      - const: clk26m
> +      - const: apll1_ck
> +      - const: apll2_ck
> +      - const: apll12_div0
> +      - const: apll12_div1
> +      - const: apll12_div2
> +      - const: apll12_div3
> +      - const: apll12_div9
> +      - const: a1sys_hp_sel
> +      - const: aud_intbus_sel
> +      - const: audio_h_sel
> +      - const: audio_local_bus_sel
> +      - const: dptx_m_sel
> +      - const: i2so1_m_sel
> +      - const: i2so2_m_sel
> +      - const: i2si1_m_sel
> +      - const: i2si2_m_sel
> +      - const: adsp_audio_26m
> +
> +patternProperties:
> +  "^mediatek,etdm-in[1-2]-chn-disabled$":
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    minItems: 1
> +    maxItems: 16
> +    description:
> +      By default, all data received from ETDM pins will be outputed to
> +      memory. etdm in supports disable_out in direct mode(w/o interconn).
> +      User can specify the channel ID which they hope dropping and then
> +      the specified channel won't be seen on memory.

So we know what are the IDs but it's a mystery what are the values.
Especially with unique values - how any of these should case that
channel "won't be seen in memory"?

> +    uniqueItems: true
> +    items:
> +      minimum: 0
> +      maximum: 15
> +
> +  "^mediatek,etdm-in[1-2]-mclk-always-on-rate-hz$":
> +    description: Specify etdm in mclk output rate for always on case.

How is it different than assigned-clock-rates?

> +
> +  "^mediatek,etdm-out[1-3]-mclk-always-on-rate-hz$":
> +    description: Specify etdm out mclk output rate for always on case.
> +
> +  "^mediatek,etdm-in[1-2]-multi-pin-mode$":
> +    type: boolean
> +    description: if present, the etdm data mode is I2S.
> +
> +  "^mediatek,etdm-out[1-3]-multi-pin-mode$":
> +    type: boolean
> +    description: if present, the etdm data mode is I2S.
> +
> +  "^mediatek,etdm-in[1-2]-cowork-source$":
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      etdm modules can share the same external clock pin. Specify
> +      which etdm clock source is required by this etdm in moudule.

typo: module

> +    enum:
> +      - 0 # etdm1_in
> +      - 1 # etdm2_in
> +      - 2 # etdm1_out

I don't get. This suggests that etdm1_out can be clock source of
etdm-in1. Or etdm1_in can be clock source of etdm-in1... It does not
make sense...

> +      - 3 # etdm2_out
> +
> +  "^mediatek,etdm-out[1-2]-cowork-source$":
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      etdm modules can share the same external clock pin. Specify
> +      which etdm clock source is required by this etdm out moudule.
> +    enum:
> +      - 0 # etdm1_in
> +      - 1 # etdm2_in
> +      - 2 # etdm1_out
> +      - 3 # etdm2_out
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - resets
> +  - reset-names
> +  - mediatek,topckgen
> +  - power-domains
> +  - clocks
> +  - clock-names
> +
Best regards,
Krzysztof

