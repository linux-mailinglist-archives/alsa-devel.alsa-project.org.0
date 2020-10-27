Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4519E29A914
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 11:09:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 903EE169D;
	Tue, 27 Oct 2020 11:08:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 903EE169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603793380;
	bh=PL3fRGq5DTiIJk0AffhUmYDU+VcQdZ9qa/lf+eoS57E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OhLyO+sLlLYKZ/FVoZax6zcWEYPmFDygGUBGdYR7M8ZLKkR0RbnUCSWLYqb1uSHqK
	 Fb2TPd6n8Ana8FnID4TPRKO2uzmNmM83qGYNEzKztMABkisUpO7eRHZ4YxsJBeJE4V
	 5t3Zvv0B2fEbeGhGrTTedLPTgM7MBvxczFPrE7oA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8FFEAF80217;
	Tue, 27 Oct 2020 11:08:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37DF2F8020D; Tue, 27 Oct 2020 11:08:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8ABE9F800FF
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 11:08:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ABE9F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vwX17LkF"
Received: by mail-wr1-x444.google.com with SMTP id t9so1154465wrq.11
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 03:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ei3u24rIHuUlXFN659f6wxEdLp7W3x7O+DS6Q5fs7ws=;
 b=vwX17LkFQN9VmSk/zsSEQ9SxEJQDJ1JMaJs+RIlkwFQEf8BtkIDogxkC8/t6kyWU0v
 /CwB8tyGJ6i4O6Xem4VotrXV/uNJawEstv4Yn2RYmspGd7zL1sf1sbngmLvxDXxB8GQ1
 dtrfpW8+AzdqfUXI4E/LTFGw1dQmg0GgzOeWnygoEs3Sdoom7CGu3hxhcghgadqPNvwD
 jeyx1ag8UrJgIFlbvVhaX9CYZgHMI92OB1w/7xtexYykY6E4+pPFpPqjD9ej1lPlinLJ
 rmzy62ttsrCoHyo/5DD84nM7F2/B/ApC/Vpu3uB8JuY3ziXSFdGxLSlaUqTUmHq19ESa
 FcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ei3u24rIHuUlXFN659f6wxEdLp7W3x7O+DS6Q5fs7ws=;
 b=BEvP/epN24YCN27zStEB4CAxJiGZgFhFKBg4Zqi4XunKhHZWq/N7jYwzq7qiz9tF1s
 PDfruPnhzKjzt5GlTw729DG3XMkJ4YEyKbyFkmyuv1Iu+HDtMZTeTycgNUG4/TXq7iZ2
 sAxUrWqp2A66Q0QlCMX9LSdEktOor93ruKMhZ2GuqP+wVOqoez5q3RHOo278eLWzVuDX
 ZlsGIvCIrCFkMxuv/4I/TMjTdXpkAWlCuFS3p+hP9tbInUHJXrwGTf8p0YksCiRqSY18
 LgbS42gyH8i2ntwmJtxGlKd3qeIfdIcDDKHBgxuBkbT3O4y+ouGenNvhvzRv/8YhumNK
 AzVg==
X-Gm-Message-State: AOAM532UaEIvVuFsv4I+BCROxs68pYtWggBYfti6Ck2rF5HYr0vxtbYa
 OARFeTrnt/jXUTain4Nj7yTOD0pC3fIaYQ==
X-Google-Smtp-Source: ABdhPJzc7V2HgcIEkvba+6199zd1BCJe8hFyMd14K8tTvw55Goq1lfkLy50L41t3mH0cpHB5Sr7eWQ==
X-Received: by 2002:adf:e751:: with SMTP id c17mr1229850wrn.345.1603793277117; 
 Tue, 27 Oct 2020 03:07:57 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id i33sm1463259wri.79.2020.10.27.03.07.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2020 03:07:56 -0700 (PDT)
Subject: Re: [PATCH v12 1/2] ASoC: google: dt-bindings: Add sc7180-trogdor
 machine bindings
To: Cheng-Yi Chiang <cychiang@chromium.org>, linux-kernel@vger.kernel.org
References: <20201027032234.1705835-1-cychiang@chromium.org>
 <20201027032234.1705835-2-cychiang@chromium.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <1f5f9ee9-f77c-7142-efe4-7e845fe54953@linaro.org>
Date: Tue, 27 Oct 2020 10:07:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20201027032234.1705835-2-cychiang@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Rohit kumar <rohitkr@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Patrick Lai <plai@codeaurora.org>, Andy Gross <agross@kernel.org>,
 dgreid@chromium.org, devicetree@vger.kernel.org, tzungbi@chromium.org,
 Srinivasa Rao <srivasam@codeaurora.org>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 Takashi Iwai <tiwai@suse.com>, xuyuqing@huaqin.corp-partner.google.com,
 Mark Brown <broonie@kernel.org>
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

Thanks for doing this!




On 27/10/2020 03:22, Cheng-Yi Chiang wrote:
> Add devicetree bindings documentation file for sc7180 sound card.
> 
> Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>

Looks good to me!

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


> ---
> Changes from v11 to v12
> - Documentation:
>   - Change the file and title name for new compatible string google,sc7180-trogdor.
>   - Change the example of model name.
> 
>   .../bindings/sound/google,sc7180-trogdor.yaml | 130 ++++++++++++++++++
>   1 file changed, 130 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> new file mode 100644
> index 000000000000..efc34689d6b5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/google,sc7180-trogdor.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Google SC7180-Trogdor ASoC sound card driver
> +
> +maintainers:
> +  - Rohit kumar <rohitkr@codeaurora.org>
> +  - Cheng-Yi Chiang <cychiang@chromium.org>
> +
> +description:
> +  This binding describes the SC7180 sound card which uses LPASS for audio.
> +
> +properties:
> +  compatible:
> +    const: google,sc7180-trogdor
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
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^dai-link(@[0-9])?$":
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
> +
> +      cpu:
> +        description: Holds subnode which indicates cpu dai.
> +        type: object
> +        properties:
> +          sound-dai: true
> +
> +      codec:
> +        description: Holds subnode which indicates codec dai.
> +        type: object
> +        properties:
> +          sound-dai: true
> +
> +    required:
> +      - link-name
> +      - cpu
> +      - codec
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - model
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +
> +  - |
> +    sound {
> +        compatible = "google,sc7180-trogdor";
> +        model = "sc7180-rt5682-max98357a-1mic";
> +
> +        audio-routing =
> +                    "Headphone Jack", "HPOL",
> +                    "Headphone Jack", "HPOR";
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        dai-link@0 {
> +            link-name = "MultiMedia0";
> +            reg = <0>;
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
> +            link-name = "MultiMedia1";
> +            reg = <1>;
> +            cpu {
> +                sound-dai = <&lpass_cpu 1>;
> +            };
> +
> +            codec {
> +                sound-dai = <&max98357a>;
> +            };
> +        };
> +
> +        dai-link@2 {
> +            link-name = "MultiMedia2";
> +            reg = <2>;
> +            cpu {
> +                sound-dai = <&lpass_hdmi 0>;
> +            };
> +
> +            codec {
> +                sound-dai = <&msm_dp>;
> +            };
> +        };
> +    };
> 
