Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECFB6C7D49
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 12:37:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95641E84;
	Fri, 24 Mar 2023 12:37:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95641E84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679657875;
	bh=zjXwYwd8qoiZ7mnB8pg/zzoGYD8y0Gt+z0lRJby1z18=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=bup7TN0UT94zT3md3vMWOf2u4ob+sOSxb/TDpQ9UUTmvp6l6XzCWj+0bgW8dlEB91
	 GPWw8pb4TETf0HTaKHX+udBwb2Vaz9hkxJd3DZieJPCdLRDOl+Ez5UCCH0o0sMlo5z
	 alFw0m+/XrwaBfEz9nGduA102PWtJ1/q0QULZMDA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C762FF8027B;
	Fri, 24 Mar 2023 12:37:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D6A4F802E8; Fri, 24 Mar 2023 12:37:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4137FF800C9
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 12:36:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4137FF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hmJq3ncf
Received: by mail-ed1-x52d.google.com with SMTP id w9so6814991edc.3
        for <alsa-devel@alsa-project.org>;
 Fri, 24 Mar 2023 04:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679657810;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vlkMAwkSL6A+6l6qhyo9+I+btfsSVV+jS0eHZv1Cz/4=;
        b=hmJq3ncfz9zmAyQlRRCODWQq2YRZTe4STlK+rTkj4KcWTlJJXIMOdQUmKLUfJGSvBY
         95//pT1vXhXjch/H4B2NfkMcZMwjhBHPY1hnC5sSJtwgEOl9YHV1EcLoZlUxLYjfxY2q
         /Rw23+XrtJZIRGCYUcuoi7r9xMHOb6hRZ+DWfTvwZBRm6btkbfLHOOVtFjtQdnjWmdNv
         iKGTrF2iOdWhZgXzBHMok4rKqvsszdLusl05KRAwx9gyQ5FA5nHZ8QYDI/gg7WH+n6br
         6TFjnIWR+3TpXQNRjQv9gMQsq4jQf5Sys/ZYEDJ31obzKBmaj+CuZsWdZ3lk7Nyrv9Vi
         fsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679657810;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vlkMAwkSL6A+6l6qhyo9+I+btfsSVV+jS0eHZv1Cz/4=;
        b=jfm0rZnKQ0f2shbMd1z4/Yau8WxC3GmrIPxQgOCjmraAKZfD2778Zd+QPCibyPOykf
         B0wGBwswhKAX/HPGlgpqhJOZ8rfNPEKDY2kIw2Bcfk31JJBontY7J37AGMeT8juGQraq
         OphdjmsjgnT2Ov67Kq/FJvWjReMQ0Udnh0Ni06EWWngGUvfMJpLtNxjdOZ3xWCCsgOgw
         6GWWr5+6zqClUwxm8P0LswpiBi89J4S4ldrRnnEXYsD2vQER/asgXAebVXCeNCdP2rlM
         2DtZSs79Fn2zlTKNru3xSsFDs+4Xi154aIv8x5m1fXzie59vI40EZf4kqKi/XJBOHXEW
         ri1Q==
X-Gm-Message-State: AO0yUKWTRA73uCYk+gMc0No5wmgr3tHIYhCn6pB4Bjwg7dv+O0ErkKd6
	GcZiAzSGDdh53bj17CRMsMkJ6A==
X-Google-Smtp-Source: 
 AK7set8JifsJoxUHo/xqsd+naerD1nr5pkzdEbY1ebVhB0Uat3D1Hfe+F+ZknhKDRxIvYIT5MrNL/A==
X-Received: by 2002:a05:6402:1748:b0:4fb:223a:76e7 with SMTP id
 v8-20020a056402174800b004fb223a76e7mr8892025edx.18.1679657810234;
        Fri, 24 Mar 2023 04:36:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:3027:fb0b:ae08:588?
 ([2a02:810d:15c0:828:3027:fb0b:ae08:588])
        by smtp.gmail.com with ESMTPSA id
 m10-20020a50998a000000b004e48f8df7e2sm10688391edb.72.2023.03.24.04.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 04:36:49 -0700 (PDT)
Message-ID: <cbfbbfeb-8ce9-3908-9a61-58b7daa4e7d9@linaro.org>
Date: Fri, 24 Mar 2023 12:36:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH V3 2/2] ASoC: dt-bindings: max98363: add soundwire
 amplifier
Content-Language: en-US
To: =?UTF-8?B?4oCcUnlhbg==?= <ryan.lee.analog@gmail.com>,
 lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 rf@opensource.cirrus.com, ckeepax@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, herve.codina@bootlin.com,
 wangweidong.a@awinic.com, james.schulman@cirrus.com,
 ajye_huang@compal.corp-partner.google.com, shumingf@realtek.com,
 povik+lin@cutebit.org, flatmax@flatmax.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 ryans.lee@analog.com
References: <20230323175256.2606939-1-ryan.lee.analog@gmail.com>
 <20230323175256.2606939-2-ryan.lee.analog@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230323175256.2606939-2-ryan.lee.analog@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BYKBOAXXPHMHQHZCQA6NXQXKWU3WQLCQ
X-Message-ID-Hash: BYKBOAXXPHMHQHZCQA6NXQXKWU3WQLCQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BYKBOAXXPHMHQHZCQA6NXQXKWU3WQLCQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/03/2023 18:52, “Ryan wrote:
> From: Ryan Lee <ryans.lee@analog.com>
> 
> This patch adds dt-bindings information for Analog Devices MAX98363
> SoundWire Amplifier.

No improvements here. So reminding:

Do not use "This commit/patch", but imperative mood. See:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> 
> Signed-off-by: Ryan Lee <ryans.lee@analog.com>
> ---
> Changes from v1:
>   Fixed a syntax error for the 'dt_binding_check' build.
>   Removed unnecessary properties.
>   Added description about SoundWire device ID of MAX98363
> Changes from v2:
>   Removed the legacy from i2c/i2s driver and added SoundWire device ID info.
>   Added missing information about DAI.
> 
>  .../bindings/sound/adi,max98363.yaml          | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/adi,max98363.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/adi,max98363.yaml b/Documentation/devicetree/bindings/sound/adi,max98363.yaml
> new file mode 100644
> index 000000000000..92352a23e1cb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/adi,max98363.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/adi,max98363.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices MAX98363 SoundWire Amplifier
> +
> +maintainers:
> +  - Ryan Lee <ryans.lee@analog.com>
> +
> +description:
> +  The MAX98363 is a SoundWire input Class D mono amplifier that
> +  supports MIPI SoundWire v1.2-compatible digital interface for
> +  audio and control data.
> +  SoundWire peripheral device ID of MAX98363 is 0x3X019F836300

lowercase hex

> +  where X is the peripheral device unique ID decoded from pin.
> +  It supports up to 10 peripheral devices(0x0 to 0x9).
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: sdw3019F836300

lowercase hex (also in example)

> +
> +  reg:
> +    maxItems: 1
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +  sound-name-prefix: true

Drop this.

> +
> +required:
> +  - compatible
> +  - reg
> +  - "#sound-dai-cells"
> +
> +additionalProperties: false

Instead:
unevaluatedProperties: false

Best regards,
Krzysztof

