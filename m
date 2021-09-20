Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F52341151E
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 14:58:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0327016A4;
	Mon, 20 Sep 2021 14:58:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0327016A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632142733;
	bh=3Y4gQvacVMDsvloS8gj8JrRb56U+3j+/P9qgEmbnLxQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lkla06XUchlDKYTsbV5vQcpcxYlcFAwG0DWetukjpKh7lCH9hADQ86RzMK32ICdxJ
	 89au21qhAIyIhk0LvLDxDPMQsjKFB2eGDK3vkyjTUBT1tIfqTLfKzVmSPFwti/zUSh
	 wXLIdgsw9GICXAAFdtxZkptqUv/7vdij5I/R+850=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FF6FF80246;
	Mon, 20 Sep 2021 14:57:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33616F8025D; Mon, 20 Sep 2021 14:57:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53CDDF80129
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 14:57:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53CDDF80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="t1/6VbpW"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3853C610A0
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 12:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632142645;
 bh=3Y4gQvacVMDsvloS8gj8JrRb56U+3j+/P9qgEmbnLxQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=t1/6VbpWrRN93zO/7PLoh+fho0IqhrImeOpjdU4IY33UR2RAo7KLD276fmnMAqpg8
 jCF6414qDCbijwCEbh81qJABpbSW3o1mSNMt+CitGM2rzApfyMATlyU3QFE4BoEArv
 R6FKYy/zO//2UHZgqUlfWafI78znpa+tbcapZu+vLR/lfXcqteI6kLj2ANMBlncaW5
 Ui37uFBr0wFioz20MQzDVrJnIAhTN7NUMZFYBt0mWrniRdWQWCeEW2OzX9EHbyW7x7
 TZWwQjqDLn81DMH9k4YnT/5wVaC+QtBcwDo6qwbQ7VO56O2zlqYW3UlhGkFhwOpyJn
 S1Hl8sOxy1YNQ==
Received: by mail-ed1-f51.google.com with SMTP id g8so61139616edt.7
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 05:57:25 -0700 (PDT)
X-Gm-Message-State: AOAM530NeVYAu4CdY9qxxR2TbUfPvMmhN2Wdzp1zf7u5KT0bEHZID3i8
 30mk2sLAWnlhkPLVNmaPeEZbAhCkSxcZsjdOtA==
X-Google-Smtp-Source: ABdhPJwxl4M7JwIYLhEMizLmntOnoBCcnFt6nsvNmWy/WrfKk4jbby+1tLrXqVYlYpjSu+es0W80TyrsSkRSdBrRY+s=
X-Received: by 2002:a50:e004:: with SMTP id e4mr29223066edl.164.1632142643564; 
 Mon, 20 Sep 2021 05:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <1630686919-19495-1-git-send-email-spujar@nvidia.com>
 <1630686919-19495-3-git-send-email-spujar@nvidia.com>
In-Reply-To: <1630686919-19495-3-git-send-email-spujar@nvidia.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 20 Sep 2021 07:57:12 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJbbDiOAr5-3_JwVMWxdkeGRoPYZuc_8fHp_iGEvH7AWA@mail.gmail.com>
Message-ID: <CAL_JsqJbbDiOAr5-3_JwVMWxdkeGRoPYZuc_8fHp_iGEvH7AWA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] ASoC: Use schema reference for sound-name-prefix
To: Sameer Pujar <spujar@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
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

On Fri, Sep 3, 2021 at 11:36 AM Sameer Pujar <spujar@nvidia.com> wrote:
>
> Use schema reference for 'sound-name-prefix' property wherever
> necessary.
>
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

[...]

> diff --git a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
> index ffb8fcf..68e5ad2 100644
> --- a/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
> +++ b/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
> @@ -9,6 +9,9 @@ title: NXP/Goodix TFA989X (TFA1) Audio Amplifiers
>  maintainers:
>    - Stephan Gerhold <stephan@gerhold.net>
>
> +allOf:
> +  - $ref: name-prefix.yaml#
> +
>  properties:
>    compatible:
>      enum:
> @@ -21,12 +24,6 @@ properties:
>    '#sound-dai-cells':
>      const: 0
>
> -  sound-name-prefix:

You can't remove the property. This is now a warning in linux-next:

Documentation/devicetree/bindings/sound/nxp,tfa989x.example.dt.yaml:
audio-codec@34: 'sound-name-prefix' does not match any of the regexes:
'pinctrl-[0-9]+'
 From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml
Documentation/devicetree/bindings/sound/nxp,tfa989x.example.dt.yaml:
audio-codec@36: 'sound-name-prefix' does not match any of the regexes:
'pinctrl-[0-9]+'
 From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml


Just 'sound-name-prefix: true' is fine

> -    $ref: /schemas/types.yaml#/definitions/string
> -    description:
> -      Used as prefix for sink/source names of the component. Must be a
> -      unique string among multiple instances of the same component.
> -
>    vddd-supply:
>      description: regulator phandle for the VDDD power supply.
>
> diff --git a/Documentation/devicetree/bindings/sound/rt5659.txt b/Documentation/devicetree/bindings/sound/rt5659.txt
> index c473df5..013f534 100644
> --- a/Documentation/devicetree/bindings/sound/rt5659.txt
> +++ b/Documentation/devicetree/bindings/sound/rt5659.txt
> @@ -42,7 +42,7 @@ Optional properties:
>  - realtek,ldo1-en-gpios : The GPIO that controls the CODEC's LDO1_EN pin.
>  - realtek,reset-gpios : The GPIO that controls the CODEC's RESET pin.
>
> -- sound-name-prefix: Please refer to name-prefix.txt
> +- sound-name-prefix: Please refer to name-prefix.yaml
>
>  - ports: A Codec may have a single or multiple I2S interfaces. These
>    interfaces on Codec side can be described under 'ports' or 'port'.
> diff --git a/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml b/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
> index 5986d1f..c597d9d 100644
> --- a/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
> +++ b/Documentation/devicetree/bindings/sound/simple-audio-mux.yaml
> @@ -13,6 +13,9 @@ description: |
>    Simple audio multiplexers are driven using gpios, allowing to select which of
>    their input line is connected to the output line.
>
> +allOf:
> +  - $ref: name-prefix.yaml#
> +
>  properties:
>    compatible:
>      const: simple-audio-mux
> @@ -21,12 +24,6 @@ properties:
>      description: |
>        GPIOs used to select the input line.
>
> -  sound-name-prefix:

Here too, but I guess we don't have any example to throw a warning?
