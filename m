Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 984915F21DC
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Oct 2022 10:07:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1F3E2A1A;
	Sun,  2 Oct 2022 10:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1F3E2A1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664698058;
	bh=EJ/YQM4QZdLLOs8HJ2hfuMvDQNLL3AkiVwI0zELLAbg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BmX769uAqgcELl2+0AWoL4NwBBFRpFeTwuL8fygMPpxBKh9G1i4HlRHsq0dP5Kb33
	 UTx+gkR6uIQJ/EKALy4uit04Op7FqgqoLjfB378a8UymDYun5cjzj/oB/CRiUp6VwQ
	 hN5tFMv/SUY9uJbex2PiGOlJtMmkN6pBGTrhs1Vc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BA33F802DB;
	Sun,  2 Oct 2022 10:06:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 100BEF80246; Sun,  2 Oct 2022 10:06:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 060A3F800A7
 for <alsa-devel@alsa-project.org>; Sun,  2 Oct 2022 10:06:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 060A3F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Q3tr2avw"
Received: by mail-lf1-x129.google.com with SMTP id c2so6295925lfb.10
 for <alsa-devel@alsa-project.org>; Sun, 02 Oct 2022 01:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Ih52Hlx+eX56tVspyaU7zHlpharxBn/SjHWmXDB6OKk=;
 b=Q3tr2avwURfk+SpVFC96h+4s6UEMfxTfFM4X1ZCQ6OVt4cWO0uTH53x9EFrf6POj5M
 j9CbhhELYz5WkjY8dabptdCLh4HFHDLoVYWlxH1F+/phJ7I8GzQKY3nyZKQstLc39Cyo
 wQdjmt7InEpVv713co5gUtvRGxpjJiYoBvLZAj3fyPU8XfRfZzUnzvFrZ91+JivwQsTa
 w9ZWUdq/7ofLWUBMxfwk+9wSfWcUXMW6jp6zzHZNeQuD2xJlzeloQxkRD6FrnFVt2DtC
 Ju3tMt4FtKr46BcFoa49APPR7O5qrGLAlczuh2U8XDwhGxENFvg8jMp64RyeGZC+eNGb
 /5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Ih52Hlx+eX56tVspyaU7zHlpharxBn/SjHWmXDB6OKk=;
 b=zUsLDvejnZQJWmeVcMaRJbc6GJPXTzA7uyL6SNUQMkAcKURmSjY7XlHK8NlrzGmkcz
 MdY7OVvHr736/HFdcavNC4DtzqqojJMR3Gjr0LeVRIHEGeAB80Xemrx6qUB8L/oUS+82
 alcV67k2yovjoOuCtCiGKpqSYulUQI9BdSFbQaQgN0VN6Bws15gOv+HiChwYFx7MpjPc
 MAN95vDd8TizqzJxmSxHY5ht18h1h6g0ogZ03j7lGTXuBp9Fz77q0aD51St4eIEO/D2J
 8AD3YFS/v6TnJ8w7lv3KQI/e072JvAA9Q258jU6srOjF6Emn8uyDVCcojKUIvjEAHTxt
 McFQ==
X-Gm-Message-State: ACrzQf0uLi6gDTAxTJNxUIYah5zo/aaQRfJUmz5/gNdZ7cL0oxZYFkOP
 ED4GBTRVIO754zKbVFYPdM6mkA==
X-Google-Smtp-Source: AMsMyM5OYdz5lO107vNdyJJf2kCeIrP4T47B3QliEARnAsvn/uTGZmx2R2gLTJ212FHyB/Ar0wsGSQ==
X-Received: by 2002:a05:6512:533:b0:4a2:f36:bba5 with SMTP id
 o19-20020a056512053300b004a20f36bba5mr4015391lfc.224.1664697992837; 
 Sun, 02 Oct 2022 01:06:32 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 a18-20020a05651c031200b0026c5579c64csm579375ljp.89.2022.10.02.01.06.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Oct 2022 01:06:32 -0700 (PDT)
Message-ID: <dc2f73e4-5c8a-5018-f507-8e04d86fc6d5@linaro.org>
Date: Sun, 2 Oct 2022 10:06:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: add schema for WM8961
Content-Language: en-US
To: Doug Brown <doug@schmorgal.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
References: <20221001200039.21049-1-doug@schmorgal.com>
 <20221001200039.21049-2-doug@schmorgal.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221001200039.21049-2-doug@schmorgal.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 01/10/2022 22:00, Doug Brown wrote:
> Create a simple DT schema for the existing Wolfson WM8961 driver so that
> DT support can be added to the driver.
> 
> Signed-off-by: Doug Brown <doug@schmorgal.com>
> ---
>  .../devicetree/bindings/sound/wlf,wm8961.yaml | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8961.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8961.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8961.yaml
> new file mode 100644
> index 000000000000..73166cf0fdcf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/wlf,wm8961.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/wlf,wm8961.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Wolfson WM8961 Ultra-Low Power Stereo CODEC
> +
> +maintainers:
> +  - patches@opensource.cirrus.com
> +
> +properties:
> +  '#sound-dai-cells':
> +    const: 0
> +
> +  compatible:
> +    const: wlf,wm8961

Please put compatible first in list of properties (and follow same order
in "required"). It's the most important piece, so we want it to be the
first to see. It also follows the convention of DTS, where compatible is
expected to be first.

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - '#sound-dai-cells'
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          wm8961: codec@4a {
> +                  #sound-dai-cells = <0>;
> +                  compatible = "wlf,wm8961";

Here compatible first, reg second, then the rest.

> +                  reg = <0x4a>;
> +          };
> +    };

Best regards,
Krzysztof

