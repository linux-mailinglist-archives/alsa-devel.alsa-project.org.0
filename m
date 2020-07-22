Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA272294E2
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 11:27:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADDB81663;
	Wed, 22 Jul 2020 11:27:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADDB81663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595410077;
	bh=xQWvDdTTV18G1hTc+M9D2ew67gcMK6dRwR660J+wuyk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B/cBHUr5GPVdfH+D3mL1RanaIsBEHXzJCCXgN++WupO4zE+t2yAOZU9KJRFbx2GgO
	 vT8ZEYHH9UMha0bUhLSsKcjglpTXKUylDYaGfEVdfojV418OmNkhsxGLe8C/fUGsVH
	 xIiYue4r0sFCvsEt/oNHIxQr/t3KKESgItze6asQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A127F801F5;
	Wed, 22 Jul 2020 11:25:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E660F80161; Wed, 22 Jul 2020 11:25:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8C66F80087
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 11:25:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8C66F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="g1ZsFxEh"
Received: by mail-wr1-x444.google.com with SMTP id r12so1157557wrj.13
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 02:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S6Nwi+XiUVd0OOIyZo0IP6xJ55suQgOnuZqnCWRgVZw=;
 b=g1ZsFxEhiRXbNG+ztNk0WYGgRisSQvFLGa/yPUpQjUqSBDBtusq0mYFHBpClTnZlfz
 56HUtteXZqUm44MRLvY1L9j2rJ6v6PhQxzGnPS7TrogZ8ctKQ0DqEynZRzaZRUANmizK
 Ou2NqUoa7f7xz03hrMTUnLNpOuAuUUyEsS4MhQ4X0jviUtTffEi60gMVhYrzY8w3tqNV
 OFeT2GOSmEL/FljwbYGBsndvTZi0Zec9Tf9HUzj9SqZY3nudj2vUHe8Uy/S724+gp5U5
 8wXaGZFKnGxOw1Np9U+SUy5OMBrXlJaKsqQCsDkyX1k/Ub/YSrAUI0lwFha/l+QCS/AW
 kyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S6Nwi+XiUVd0OOIyZo0IP6xJ55suQgOnuZqnCWRgVZw=;
 b=oJVSqkrQ0qvmG4JnNGnVronukcKrsVc8XgOio+sDwjYElUbHJ2qpuKAPk81cbfLNgY
 WBbwiW1HliO74hV0Ehh9j2HkDwWAMkpaJXH3IBfVvY0T4jS7DN+KiFGOsl2zxVywk9V+
 tnjYqhVAyYGM8gyHH1CL8ZhH/wnnhQlNJtm/HceckpOHJEVqt1X0ANdNPNCAkYInATPE
 C65QxubMD09iMLKroP8axRxzy4JxOqqbqAN/bgykrmGcHJ2ERSSc7enKLjgB5dJeKHir
 AGQ4r6IMvf+GH3mRp5tdOeOFMCZMSMbbWXlaw/ubsLxZ4gBsIV9JCyajXahnjnOiuIoD
 ptZw==
X-Gm-Message-State: AOAM530cCfssebttqASF9az/OzgDStjsnp+2bkITiI9tWcfUwVzGVroQ
 eN9D+0nVCh4zLpmOqz6rYVxQzQ==
X-Google-Smtp-Source: ABdhPJxa2U+7moUvkrSiQntHeegnCBrblh3LM+LX5eVN9hCBMBrL1WonkQ67UXjlNdOw+x5Ykmp2fA==
X-Received: by 2002:adf:b1cf:: with SMTP id r15mr32484484wra.118.1595409923974; 
 Wed, 22 Jul 2020 02:25:23 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id x204sm3761989wmg.2.2020.07.22.02.25.22
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Jul 2020 02:25:23 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To: Cheng-Yi Chiang <cychiang@chromium.org>, linux-kernel@vger.kernel.org
References: <20200721104422.369368-1-cychiang@chromium.org>
 <20200721104422.369368-2-cychiang@chromium.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c270a068-c96b-63ae-a5ca-ec2081924dac@linaro.org>
Date: Wed, 22 Jul 2020 10:25:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200721104422.369368-2-cychiang@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
 tzungbi@chromium.org, Banajit Goswami <bgoswami@codeaurora.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, Mark Brown <broonie@kernel.org>,
 dianders@chromium.org, dgreid@chromium.org,
 pierre-louis.bossart@linux.intel.com, linux-arm-kernel@lists.infradead.org
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



On 21/07/2020 11:44, Cheng-Yi Chiang wrote:
> Add devicetree bindings documentation file for sc7180 sound card.
> 
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> ---
>   .../bindings/sound/qcom,sc7180.yaml           | 130 ++++++++++++++++++
>   1 file changed, 130 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> new file mode 100644
> index 000000000000..82f9483276eb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,sc7180.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies Inc. SC7180 ASoC sound card driver
> +
> +maintainers:
> +  - Rohit kumar <rohitkr@codeaurora.org>
> +  - Cheng-Yi Chiang <cychiang@chromium.org>
> +
> +description:
> +  This binding describes the SC7180 sound card which uses LPASS for audio.
> +
> +definitions:
> +
> +  dai:
> +    type: object
> +    properties:
> +      sound-dai:
> +        maxItems: 1
> +        $ref: /schemas/types.yaml#/definitions/phandle-array
> +        description: phandle array of the codec or CPU DAI
> +
> +    required:
> +      - sound-dai
> +
> +properties:
> +  compatible:
> +    contains:
> +      const: qcom,sc7180-sndcard
> +
> +  audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description:
> +      A list of the connections between audio components. Each entry is a
> +      pair of strings, the first being the connection's sink, the second
> +      being the connection's source.
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User specified audio sound card name
> +
> +  aux-dev:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle of the codec for headset detection


Why do we need this? You should be able to set the jack for codec 
snd_soc_component_set_jack()?


> +
> +patternProperties:
> +  "^dai-link(@[0-9]+)?$":
> +    description:
> +      Each subnode represents a dai link. Subnodes of each dai links would be
> +      cpu/codec dais.
> +
> +    type: object
> +
> +    properties:
> +      link-name:
> +        description: Indicates dai-link name and PCM stream name.
> +        $ref: /schemas/types.yaml#/definitions/string
> +        maxItems: 1
> +
> +      reg:
> +        description: dai link address.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        maxItems: 1

Why do we need this?? I have not seen the parsing code using this.


> +
> +      playback-only:
> +        description: Specify that the dai link is only for playback.
> +        $ref: /schemas/types.yaml#/definitions/flag
> +
> +      capture-only:
> +        description: Specify that the dai link is only for capture.
> +        $ref: /schemas/types.yaml#/definitions/flag
> +

Are these because the cpu/codec dais are single directional?

If so you can extend snd_soc_dai_link_set_capabilities() and use this 
function.


--srini

> +      cpu:
> +        $ref: "#/definitions/dai"
> +
> +      codec:
> +        $ref: "#/definitions/dai"
> +
> +    required:
> +      - link-name
> +      - reg
> +      - cpu
> +      - codec
> +
> +    additionalProperties: false
> +
> +examples:
> +
> +  - |
> +    sound {
> +        compatible = "qcom,sc7180-sndcard";
> +        model = "sc7180-snd-card";
> +
> +        audio-routing =
> +                    "Headphone Jack", "HPOL",
> +                    "Headphone Jack", "HPOR";
> +
> +        aux-dev = <&alc5682>;
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        dai-link@0 {
> +            reg = <0>;
> +            link-name = "MultiMedia0";
> +            cpu {
> +                sound-dai = <&lpass_cpu 0>;
> +            };
> +
> +            codec {
> +                sound-dai = <&alc5682 0>;
> +            };
> +        };
> +
> +        dai-link@1 {
> +            reg = <1>;
> +            link-name = "MultiMedia1";
> +            playback-only;
> +            cpu {
> +                sound-dai = <&lpass_cpu 1>;
> +            };
> +
> +            codec {
> +                sound-dai = <&max98357a>;
> +            };
> +        };
> +    };
> 
