Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD6E2957D9
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Oct 2020 07:21:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 106B11781;
	Thu, 22 Oct 2020 07:20:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 106B11781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603344100;
	bh=N3qXBIpjPylAcUcBxVxLVkmSoJtzHb7m3f8vs9/Gp1o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DpmghBrgKAi3KKDh7e84MNtOR0hX3LvCgoxeKWMKcHNNo8970ZlBMvojzkAqS9VqP
	 ipq6onTSiD/WyfNvYzBsaXvG+jBIg8jCFnJVXdLo+2SPoNgbMKa2OoveBWkxT0+/YJ
	 7zwK4x4yrAJdX0zRA5ZfuVQHQty1ngo0o1sGm5dM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2156BF804AA;
	Thu, 22 Oct 2020 07:20:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 079E7F804A9; Thu, 22 Oct 2020 07:20:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 223B0F800CE
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 07:19:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 223B0F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="UXbIIDNC"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f91161b0000>; Wed, 21 Oct 2020 22:18:19 -0700
Received: from [10.25.102.106] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 22 Oct
 2020 05:19:48 +0000
Subject: Re: [PATCH v3 1/3] ASoC: dt-bindings: audio-graph-card: switch to
 yaml base Documentation
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>
References: <87a6wfay7t.wl-kuninori.morimoto.gx@renesas.com>
 <878sbzay6u.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <75ca7528-3177-46cb-73c5-46e32e63ad44@nvidia.com>
Date: Thu, 22 Oct 2020 10:49:43 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <878sbzay6u.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1603343899; bh=4ga9u9EaTXgZqZYV9Tg6o4laYNM9aVw6ALQdX3oH9TM=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=UXbIIDNC6MgtL/Ip2uBR5+o9PLCTRcTd9dQE9ABEA6eKGefH+7Z1aFh66kUntwatf
 2KeMs4oBjtmW+yvHkgj5YF/SQWnyh0haCkBFzIt9Wal9NKK2VtLvtVu2dOU0Mu/0IW
 cKalLe7UPbwPwneJTPLPc1piSiqc8aoAkwZ3EoF/7Asj5WhBVOmtMI65PikdvzmhTx
 9IEdt/uw/OYCdyalqZX64qXSDKtAUTXEaCXQNsBduRswzPCJTv2tCR7AGQ47EMbhoZ
 5UczD0CMjUkAfp6T63f2ezfUOOIqD/nJs8b7ag0tvLMm+x7DgZKDgWsECFURzbMyWN
 gNCzU5sV0gxRQ==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org
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

Hi Morimoto-san,

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch switches from .txt base to .yaml base Document.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   .../bindings/sound/audio-graph-card.txt       | 337 ------------------
>   .../bindings/sound/audio-graph-card.yaml      | 165 +++++++++
>   .../devicetree/bindings/vendor-prefixes.yaml  |   2 +-
>   3 files changed, 166 insertions(+), 338 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/sound/audio-graph-card.txt
>   create mode 100644 Documentation/devicetree/bindings/sound/audio-graph-card.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card.txt b/Documentation/devicetree/bindings/sound/audio-graph-card.txt
> deleted file mode 100644
> index d5f6919a2d69..000000000000
> --- a/Documentation/devicetree/bindings/sound/audio-graph-card.txt
> +++ /dev/null
> @@ -1,337 +0,0 @@
...
> diff --git a/Documentation/devicetree/bindings/sound/audio-graph-card.yaml b/Documentation/devicetree/bindings/sound/audio-graph-card.yaml
> new file mode 100644
> index 000000000000..9ccffbda86a8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/audio-graph-card.yaml
> @@ -0,0 +1,165 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/audio-graph-card.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Audio Graph Card Driver Device Tree Bindings
> +
> +maintainers:
> +  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> +

> +properties:
> +  compatible:
> +    enum:
> +      - audio-graph-card
> +      - audio-graph-scu-card

Since I am trying to re-use most of audio-graph for Tegra, can 
'compatible' be moved to a separate schema?
For example,
audio-graph.yaml -> defines all the common stuff
audio-graph-card.yaml -> audio-graph.yaml + 'compatible' property
Similarly, tegra-audio-graph-card.yaml -> audio-graph.yaml + Tegra 
'compatible' property

> +
> +  dais:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +  label:
> +    maxItems: 1
> +  prefix:
> +    description: "device name prefix"
> +    $ref: /schemas/types.yaml#/definitions/string
> +  "audio-graph-card,prefix":
> +    description: "device name prefix"
> +    $ref: /schemas/types.yaml#/definitions/string
> +  routing:
> +    description: |
> +      A list of the connections between audio components.
> +      Each entry is a pair of strings, the first being the
> +      connection's sink, the second being the connection's source.
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +  widgets:
> +    description: User specified audio sound widgets.
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +  convert-rate:
> +    description: CPU to Codec rate convert.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +  "audio-graph-card,convert-rate":
> +    description: CPU to Codec rate convert.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +  convert-channels:
> +    description: CPU to Codec rate channels.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +  "audio-graph-card,convert-channels":
> +    description: CPU to Codec rate channels.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +  pa-gpios:
> +    maxItems: 1
> +  hp-det-gpio:
> +    maxItems: 1
> +  mic-det-gpio:
> +    maxItems: 1
> +

> +  endpoint:
> +    type: object
> +    properties:
> +      remote-endpoint:
> +        maxItems: 1
> +      mclk-fs:
> +        description: |
> +          Multiplication factor between stream rate and codec mclk.
> +          When defined, mclk-fs property defined in dai-link sub nodes are ignored.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      frame-inversion:
> +        description: dai-link uses frame clock inversion
> +        $ref: /schemas/types.yaml#/definitions/flag
> +      bitclock-inversion:
> +        description: dai-link uses bit clock inversion
> +        $ref: /schemas/types.yaml#/definitions/flag
> +      frame-master:
> +        description: Indicates dai-link frame master.
> +        $ref: /schemas/types.yaml#/definitions/phandle-array
> +        maxItems: 1
> +      bitclock-master:
> +        description: Indicates dai-link bit clock master
> +        $ref: /schemas/types.yaml#/definitions/phandle-array
> +        maxItems: 1
> +      dai-format:
> +        description: audio format.
> +        items:
> +          enum:
> +            - i2s
> +            - right_j
> +            - left_j
> +            - dsp_a
> +            - dsp_b
> +            - ac97
> +            - pdm
> +            - msb
> +            - lsb
> +      convert-rate:
> +        description: CPU to Codec rate convert.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      convert-channels:
> +        description: CPU to Codec rate channels.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +    required:
> +      - remote-endpoint

Is it possible to have endpoint without port nodes?

> +
> +  port:
> +    description: single OF-Graph subnode
> +    type: object
> +    properties:
> +      reg:
> +        maxItems: 1
> +      prefix:
> +        description: "device name prefix"
> +        $ref: /schemas/types.yaml#/definitions/string
> +      convert-rate:
> +        description: CPU to Codec rate convert.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +      convert-channels:
> +        description: CPU to Codec rate channels.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +    patternProperties:
> +      "^endpoint(@[0-9a-f]+)?":
> +        $ref: "#/properties/endpoint"
> +
> +  ports:
> +    description: multi OF-Graph subnode
> +    type: object
> +    patternProperties:
> +      "^port(@[0-9a-f]+)?":
> +        $ref: "#/properties/port"
> +
> +required:
> +  - compatible
> +  - dais
> +

> +additionalProperties: false
> +

This needs to be true when other files want to reference this schema 
and/or define some additional properties.

> +examples:
> +  - |
> +    sound {
> +        compatible = "audio-graph-card";
> +
> +        dais = <&cpu_port_a>;
> +    };
> +
> +    cpu {
> +        /*
> +         * dai-controller own settings
> +         */
> +
> +        port {
> +            cpu_endpoint: endpoint {
> +                remote-endpoint = <&codec_endpoint>;
> +                dai-format = "left_j";
> +            };
> +        };
> +    };
> +
> +    codec {
> +        /*
> +         * codec own settings
> +         */
> +
> +        port {
> +            codec_endpoint: endpoint {
> +                remote-endpoint = <&cpu_endpoint>;
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 63996ab03521..5ada35ddac7e 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -20,7 +20,7 @@ patternProperties:
>     "^(keypad|m25p|max8952|max8997|max8998|mpmc),.*": true
>     "^(pinctrl-single|#pinctrl-single|PowerPC),.*": true
>     "^(pl022|pxa-mmc|rcar_sound|rotary-encoder|s5m8767|sdhci),.*": true
> -  "^(simple-audio-card|st-plgpio|st-spics|ts),.*": true
> +  "^(simple-audio-card|audio-graph-card|st-plgpio|st-spics|ts),.*": true
>
>     # Keep list in alphabetical order.
>     "^70mai,.*":
> --
> 2.25.1
>

