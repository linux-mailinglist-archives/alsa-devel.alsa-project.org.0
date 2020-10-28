Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EAE29D083
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 16:03:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA13415E2;
	Wed, 28 Oct 2020 16:02:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA13415E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603897398;
	bh=wGirN1FSMqT3EbyTWUdyKtc4UwcyWyLcEsPuOAFkAy4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TtsadrYMaH+FDZbgX1MvylemTmZ3b0eoByPAq2Wfw9+D/Yn14XNE7uVPM38Ln/bfW
	 zEwBAI5LDNlQgu6eJ4jZxIVS8YGb40bmMRUon+TD1cDG0SxzMQJsTTyM5fXLlmO5Tj
	 T6rp1A0Ks8KDqtjuqQ/5HnTOO6O5brwmPKjd497U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3688BF801D5;
	Wed, 28 Oct 2020 16:01:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2410EF80212; Wed, 28 Oct 2020 16:01:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EA75F800FF
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 16:01:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EA75F800FF
Received: by mail-ot1-f66.google.com with SMTP id k3so4494315otp.1
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 08:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jFWruS4jAbgpHsSb84mve5tvyN8/BLFegHagqaHN86o=;
 b=rXhB1xkm28Kb6/mwcxekiiHEQ2yGf3rybVrx6kyfRpjE7kbb+9Wdt0bu4HbwL7VEKH
 0183pVriPo/Tm5W6O/o3dhVBrtGGHRe/JLAg7+W3IblgpHQkepxAgGxIWMJyyCCdpw72
 7fPb/cEQksrYtmDWg2u1MRLNabPjP38zjH1RwSK7ObRshBnqn7QITBfZ6wI/8Gu5pEcJ
 dIHdyZVmkgYIu5BMAN0ag/yqncG0fuZK8wx7urt7CnPGL9SoHK0gldMjPwIrrP7sQrUb
 kOlazux5uOxHWDWrVHecznhiujw2dVilSsOlmNmiYWKMw/HX5+7usTkYVijSQJ/sr6uW
 aeCA==
X-Gm-Message-State: AOAM5321y29/y385h9YFPVofvaZ6MVFtBQHfwzP+CgWwEruOH4sB+gpe
 IbAIj2oFN6d0y0/2WxPkJA==
X-Google-Smtp-Source: ABdhPJwCGedzAvc27qqgnJl9SLORsqUAG2LV5KTP74KknCizklsAYM4Aqfav0f5ZaTJKU/TlqJpZRQ==
X-Received: by 2002:a05:6830:17d6:: with SMTP id
 p22mr5770084ota.154.1603897297590; 
 Wed, 28 Oct 2020 08:01:37 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t27sm2091803otc.14.2020.10.28.08.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 08:01:36 -0700 (PDT)
Received: (nullmailer pid 4021016 invoked by uid 1000);
 Wed, 28 Oct 2020 15:01:35 -0000
Date: Wed, 28 Oct 2020 10:01:35 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v1 1/2] ASoC: qcom: dt-bindings: Add SM8250 sound card
 bindings
Message-ID: <20201028150135.GA4009047@bogus>
References: <20201026170947.10567-1-srinivas.kandagatla@linaro.org>
 <20201026170947.10567-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026170947.10567-2-srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 plai@codeaurora.org
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

On Mon, Oct 26, 2020 at 05:09:46PM +0000, Srinivas Kandagatla wrote:
> This patch adds bindings required for SM8250 based soundcards
> for example Qualcomm Robotics RB5 Development Kit which makes
> use of ADSP and Internal LPASS codec.

You didn't send to DT list...

> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/sound/qcom,sm8250.yaml           | 161 ++++++++++++++++++
>  1 file changed, 161 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> new file mode 100644
> index 000000000000..b8f97fe6e92c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -0,0 +1,161 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,sm8250.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies Inc. SM8250 ASoC sound card driver
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description:
> +  This bindings describes SC8250 SoC based sound cards
> +  which uses LPASS internal codec for audio.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,qrb5165-rb5
> +      - items:
> +        - const: qcom,sm8250

This collides with the top level SoC compatible resulting in: 

/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: $nodename:0: '/' was expected
	From schema: /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/arm/qcom.yaml
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible: ['qcom,qrb5165-rb5'] is not valid under any of the given schemas (Possible causes of the failure):
	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible: ['qcom,qrb5165-rb5'] is too short
	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['qcom,apq8016-sbc']
	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['qcom,apq8064-cm-qs600', 'qcom,apq8064-ifc6410']
	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['qcom,apq8074-dragonboard']
	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['qcom,apq8060-dragonboard', 'qcom,msm8660-surf']
	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['qcom,apq8084-mtp', 'qcom,apq8084-sbc']
	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['qcom,msm8960-cdp']
	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['fairphone,fp2', 'lge,hammerhead', 'sony,xperia-amami', 'sony,xperia-castor', 'sony,xperia-honami']
	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,msm8916-mtp/1' was expected
	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['longcheer,l8150', 'samsung,a3u-eur', 'samsung,a5u-eur']
	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,msm8996-mtp' was expected
	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['qcom,ipq4019-ap-dk04.1-c3', 'qcom,ipq4019-ap-dk07.1-c1', 'qcom,ipq4019-ap-dk07.1-c2', 'qcom,ipq4019-dk04.1-c1']
	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['qcom,ipq8064-ap148']
	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['qcom,ipq8074-hk01', 'qcom,ipq8074-hk10-c1', 'qcom,ipq8074-hk10-c2']
	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['qcom,sc7180-idp']
	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['xiaomi,lavender']
	/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/sound/qcom,sm8250.example.dt.yaml: sound: compatible:0: 'qcom,qrb5165-rb5' is not one of ['qcom,ipq6018-cp01-c1']

	From schema: /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/arm/qcom.yaml

Also, the indentation is off:
./Documentation/devicetree/bindings/sound/qcom,sm8250.yaml:21:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

> +        - const: qcom,qrb5165-rb5
> +
> +  audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description:
> +      A list of the connections between audio components. Each entry is a
> +      pair of strings, the first being the connection's sink, the second
> +      being the connection's source. Valid names could be power supplies,
> +      MicBias of codec and the jacks on the board.
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User visible long sound card name
> +
> +patternProperties:
> +  ".*-dai-link$":

'.*' at the beginning is not necessary.

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
> +      cpu:
> +        description: Holds subnode which indicates cpu dai.
> +        type: object
> +        properties:
> +          sound-dai: true
> +
> +      platform:
> +        description: Holds subnode which indicates platform dai.
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
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - model
> +
> +additionalProperties: false
> +
> +examples:
> +
> +  - |
> +    #include <dt-bindings/sound/qcom,q6afe.h>
> +    #include <dt-bindings/sound/qcom,q6asm.h>
> +    sound {
> +        compatible = "qcom,qrb5165-rb5";
> +        model = "Qualcomm-qrb5165-RB5-WSA8815-Speakers-DMIC0";
> +        audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
> +                    "SpkrRight IN", "WSA_SPK2 OUT",
> +                    "VA DMIC0", "vdd-micb",
> +                    "VA DMIC1", "vdd-micb",
> +                    "MM_DL1",  "MultiMedia1 Playback",
> +                    "MM_DL2",  "MultiMedia2 Playback",
> +                    "MultiMedia3 Capture", "MM_UL3";
> +
> +        mm1-dai-link {
> +            link-name = "MultiMedia0";
> +            cpu {
> +                sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA1>;
> +            };
> +        };
> +
> +        mm2-dai-link {
> +            link-name = "MultiMedia2";
> +            cpu {
> +                sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA2>;
> +            };
> +        };
> +
> +        mm3-dai-link {
> +            link-name = "MultiMedia3";
> +            cpu {
> +                sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA3>;
> +            };
> +        };
> +
> +        hdmi-dai-link {
> +            link-name = "HDMI Playback";
> +            cpu {
> +                sound-dai = <&q6afedai TERTIARY_MI2S_RX>;
> +            };
> +
> +            platform {
> +                sound-dai = <&q6routing>;
> +            };
> +
> +            codec {
> +                sound-dai = <&lt9611_codec 0>;
> +            };
> +        };
> +
> +        wsa-dai-link {
> +            link-name = "WSA Playback";
> +            cpu {
> +                sound-dai = <&q6afedai WSA_CODEC_DMA_RX_0>;
> +            };
> +
> +            platform {
> +                sound-dai = <&q6routing>;
> +            };
> +
> +            codec {
> +                sound-dai = <&left_spkr>, <&right_spkr>, <&swr0 0>, <&wsamacro>;
> +            };
> +        };
> +
> +        va-dai-link {
> +            link-name = "VA Capture";
> +            cpu {
> +                sound-dai = <&q6afedai VA_CODEC_DMA_TX_0>;
> +            };
> +
> +            platform {
> +                sound-dai = <&q6routing>;
> +            };
> +
> +            codec {
> +                sound-dai = <&vamacro 0>;
> +            };
> +        };
> +    };
> -- 
> 2.21.0
> 
