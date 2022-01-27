Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0331249DD4F
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jan 2022 10:06:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D4E31B27;
	Thu, 27 Jan 2022 10:06:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D4E31B27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643274414;
	bh=TTOdCV6Vj6HPhhzyPvBhUfXA8WuaTC9HKs3FqRXOYFc=;
	h=References:From:To:Subject:Date:In-reply-to:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VTT3rAze24f/KLXtWmP6hfHL6ERfEEdtYuDQr0iJDusl+tYlZFOwbS7y7JPH7dCOr
	 4L59RmXjCGXvppdlpAK9HTa9uRnIGNatKhV49mdreE00rlnWPEpfsi4+4dsxDGdUao
	 kbuzawbCk9rdHXin72jH3L5XYw2mFB8ErzkXl2N8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD1DFF800C9;
	Thu, 27 Jan 2022 10:05:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1E6EF800C9; Thu, 27 Jan 2022 10:05:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF083F800C9
 for <alsa-devel@alsa-project.org>; Thu, 27 Jan 2022 10:05:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF083F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="RINGYWmd"
Received: by mail-wr1-x42e.google.com with SMTP id c23so3444031wrb.5
 for <alsa-devel@alsa-project.org>; Thu, 27 Jan 2022 01:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=rjtR56dfdnTjyM6bjm66t58wWtukpooj/ecEV7qKFFU=;
 b=RINGYWmdOJjRmzG/N3Nc3K8o+ujsn7QBQ5I5V9tMGZRL5nET7TcPqyT9oOIOrZGDgA
 yjEdEZtN0UlnVj9CLMpEXhXrKEI2nbsOW6QV/zKK0aLY8mCp3fYA72DSBBdLxKzSrw6M
 qsw0avSCZ5aQY66yJBw3HZZ6E3iTNkLLFNwlroAXGsNcKwrO8uYutF9EscY1Dw8WB8lj
 7rHCojLlMQ05VcA5jovZImiweY2YVDzKumB2r8gZB/PSSkNIp7zbiPnIywND0RKO4YvU
 YlRcyxCQEvjKxIQheHHNM4q5JRrRXDmqF+y04W756RgsaelM0vNFX2Yqny+wvSTdRC7g
 qJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=rjtR56dfdnTjyM6bjm66t58wWtukpooj/ecEV7qKFFU=;
 b=gup8ntKbFpB5jn7dR5dxkV3SXjMdk9AW9GuNxqalxPrpxK6pAunbXbq908/oW7D/LI
 38YZg5goTuT16DT1quWSo7nJau2g1sBjTs6F9EExYargV7AtK6bjf3B16qXfHfbCAzeW
 AxIzMX/zapMEDRVOx7rlkFf571MXVoqSqytKKMlEMXPwd1CWd0QApRYkSY+ZdslU7JvN
 sH4LnVIYSctwA3JXiYOEv5Z28hQryfnBd+Fwic4VmQPxGMVWJjrR5brLsYmdIhOW+DiY
 axb5xbkX7cvYFN3yB32XBw/3lZYC8Y3Lc2oanFDF8c4L64xt4yZwUH/Vsrvm9QbcAEA5
 EhXQ==
X-Gm-Message-State: AOAM533LQbTguZXOTEpDa0FDMXVJvQfXM6SVm1rCFmG4yRkB5S3f5w4U
 tngxLhHhMAqfokgVjRmvpzqDaQ==
X-Google-Smtp-Source: ABdhPJwPXj2TGvVrDtoZmyvAc/oT6t1ERUujcirvOS6XEJszUThggTk+2eO5mXwRJ/mazVI3JS/s+A==
X-Received: by 2002:a5d:660b:: with SMTP id n11mr2162313wru.78.1643274335733; 
 Thu, 27 Jan 2022 01:05:35 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id g5sm2022495wri.108.2022.01.27.01.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 01:05:35 -0800 (PST)
References: <20220126231427.1638089-1-robh@kernel.org>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Rohit kumar <rohitkr@codeaurora.org>, Cheng-Yi
 Chiang <cychiang@chromium.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Jonathan Bakker
 <xc-racer2@live.ca>
Subject: Re: [PATCH] ASoC: dt-bindings: Centralize the 'sound-dai' definition
Date: Thu, 27 Jan 2022 10:00:53 +0100
In-reply-to: <20220126231427.1638089-1-robh@kernel.org>
Message-ID: <1jtudp1rc1.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org
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


On Wed 26 Jan 2022 at 17:14, Rob Herring <robh@kernel.org> wrote:

> 'sound-dai' is a common property, but has duplicate type definitions.
> Create a new common definition to define the type and then update all
> the other occurrences to just define how many entries there are just
> like other phandle+arg properties.
>
> The constraints on the number of entries is based on the examples and
> could be wrong.
>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Please ack, this depends on commit abf0fee97313 ("dt-bindings: Improve
> phandle-array schemas") in my tree.
> ---
>  .../bindings/sound/amlogic,gx-sound-card.yaml |  4 ++--
>  .../bindings/sound/google,sc7180-trogdor.yaml |  6 ++++--
>  .../bindings/sound/imx-audio-card.yaml        |  7 +++++--
>  .../bindings/sound/qcom,sm8250.yaml           | 10 +++++++---
>  .../bindings/sound/samsung,aries-wm8994.yaml  |  5 +----
>  .../bindings/sound/samsung,midas-audio.yaml   |  2 --
>  .../bindings/sound/samsung,odroid.yaml        |  9 +++------
>  .../devicetree/bindings/sound/sound-dai.yaml  | 20 +++++++++++++++++++
>  8 files changed, 42 insertions(+), 21 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/sound-dai.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> index 2e35aeaa8781..8b5be4b92f35 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> @@ -57,7 +57,7 @@ patternProperties:
>            rate
>  
>        sound-dai:
> -        $ref: /schemas/types.yaml#/definitions/phandle-array
> +        maxItems: 1
>          description: phandle of the CPU DAI
>  
>      patternProperties:
> @@ -71,7 +71,7 @@ patternProperties:
>  
>          properties:
>            sound-dai:
> -            $ref: /schemas/types.yaml#/definitions/phandle-array
> +            maxItems: 1

No min or max here. Links may have more than one codec.

Ex:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts#n158

>              description: phandle of the codec DAI
>  
>          required:
> diff --git a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> index 837e3faa63a9..233caa0ade87 100644
> --- a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> +++ b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> @@ -62,13 +62,15 @@ patternProperties:
>          description: Holds subnode which indicates cpu dai.
>          type: object
>          properties:
> -          sound-dai: true
> +          sound-dai:
> +            maxItems: 1
>  
>        codec:
>          description: Holds subnode which indicates codec dai.
>          type: object
>          properties:
> -          sound-dai: true
> +          sound-dai:
> +            maxItems: 1
>  
>      required:
>        - link-name
> diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> index d1816dd061cf..bb3a435722c7 100644
> --- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
> @@ -59,13 +59,16 @@ patternProperties:
>          description: Holds subnode which indicates cpu dai.
>          type: object
>          properties:
> -          sound-dai: true
> +          sound-dai:
> +            maxItems: 1
>  
>        codec:
>          description: Holds subnode which indicates codec dai.
>          type: object
>          properties:
> -          sound-dai: true
> +          sound-dai:
> +            minItems: 1
> +            maxItems: 2
>  
>        fsl,mclk-equal-bclk:
>          description: Indicates mclk can be equal to bclk, especially for sai interface
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 4bfda04b4608..4ecd4080bb96 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -69,19 +69,23 @@ patternProperties:
>          description: Holds subnode which indicates cpu dai.
>          type: object
>          properties:
> -          sound-dai: true
> +          sound-dai:
> +            maxItems: 1
>  
>        platform:
>          description: Holds subnode which indicates platform dai.
>          type: object
>          properties:
> -          sound-dai: true
> +          sound-dai:
> +            maxItems: 1
>  
>        codec:
>          description: Holds subnode which indicates codec dai.
>          type: object
>          properties:
> -          sound-dai: true
> +          sound-dai:
> +            minItems: 1
> +            maxItems: 4
>  
>      required:
>        - link-name
> diff --git a/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml b/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
> index eb487ed3ca3b..4ffa275b3c49 100644
> --- a/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
> +++ b/Documentation/devicetree/bindings/sound/samsung,aries-wm8994.yaml
> @@ -27,9 +27,6 @@ properties:
>        sound-dai:
>          minItems: 2
>          maxItems: 2
> -        items:
> -          maxItems: 1
> -        $ref: /schemas/types.yaml#/definitions/phandle-array
>          description: |
>            phandles to the I2S controller and bluetooth codec,
>            in that order
> @@ -38,7 +35,7 @@ properties:
>      type: object
>      properties:
>        sound-dai:
> -        $ref: /schemas/types.yaml#/definitions/phandle-array
> +        maxItems: 1
>          description: phandle to the WM8994 CODEC
>  
>    samsung,audio-routing:
> diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
> index 095775c598fa..ec50bcb4af5f 100644
> --- a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
> +++ b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
> @@ -21,7 +21,6 @@ properties:
>      type: object
>      properties:
>        sound-dai:
> -        $ref: /schemas/types.yaml#/definitions/phandle-array
>          maxItems: 1
>          description: phandle to the I2S controller
>      required:
> @@ -31,7 +30,6 @@ properties:
>      type: object
>      properties:
>        sound-dai:
> -        $ref: /schemas/types.yaml#/definitions/phandle-array
>          maxItems: 1
>          description: phandle to the WM1811 CODEC
>      required:
> diff --git a/Documentation/devicetree/bindings/sound/samsung,odroid.yaml b/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
> index e8122bc87362..db2513f3e168 100644
> --- a/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
> +++ b/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
> @@ -37,18 +37,15 @@ properties:
>      type: object
>      properties:
>        sound-dai:
> -        $ref: /schemas/types.yaml#/definitions/phandle-array
>          description: phandles to the I2S controllers
>  
>    codec:
>      type: object
>      properties:
>        sound-dai:
> -        $ref: /schemas/types.yaml#/definitions/phandle-array
> -        description: |
> -          List of phandles to the CODEC nodes,
> -          first entry must be corresponding to the MAX98090 CODEC and
> -          the second entry must be the phandle of the HDMI IP block node.
> +        items:
> +          - description: phandle of the MAX98090 CODEC
> +          - description: phandle of the HDMI IP block node
>  
>    samsung,audio-routing:
>      $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> diff --git a/Documentation/devicetree/bindings/sound/sound-dai.yaml b/Documentation/devicetree/bindings/sound/sound-dai.yaml
> new file mode 100644
> index 000000000000..61c6f7abc4e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/sound-dai.yaml
> @@ -0,0 +1,20 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/sound-dai.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Digital Audio Interface consumer Device Tree Bindings
> +
> +maintainers:
> +  - Rob Herring <robh@kernel.org>
> +
> +select: true
> +
> +properties:
> +  sound-dai:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: A phandle plus args to digital audio interface provider(s)
> +
> +additionalProperties: true
> +...

