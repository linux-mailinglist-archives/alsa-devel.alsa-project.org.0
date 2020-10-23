Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1585C2970ED
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Oct 2020 15:54:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A30B317D0;
	Fri, 23 Oct 2020 15:53:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A30B317D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603461278;
	bh=jv4MuJaRSuru7OfrrobLfOHTFqoGNcccRzp1YvB7Q9Y=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pe9svOUJ3x/FG06lJHZKwytjuCNLExJkE20SZ1JE4yoWB5YZE/viEPARhkXRBNmFX
	 Xa5sOQJYBxPLJQuWy3DjFu9r7OJIyGlsLhgkTfOGajq7RJIovZAP+lxTK6J2RhvWFT
	 gctH9Mv85Ic78oKbd/uDt2i/WlA8Xk6/RwMcGdWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 215FCF800BD;
	Fri, 23 Oct 2020 15:53:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20620F80253; Fri, 23 Oct 2020 15:53:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8839F800BD
 for <alsa-devel@alsa-project.org>; Fri, 23 Oct 2020 15:52:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8839F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="kLDgSUqM"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f92e0050000>; Fri, 23 Oct 2020 06:52:06 -0700
Received: from [10.25.102.106] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 23 Oct
 2020 13:52:51 +0000
Subject: Re: [PATCH v3 1/3] ASoC: dt-bindings: audio-graph-card: switch to
 yaml base Documentation
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>
References: <87a6wfay7t.wl-kuninori.morimoto.gx@renesas.com>
 <878sbzay6u.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <92de1324-7845-a0ee-7962-aa297c0dced7@nvidia.com>
Date: Fri, 23 Oct 2020 19:22:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <878sbzay6u.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1603461126; bh=ZPDgPLTUKaq3JJ4tj2Ik48+/DmklB6SRRUM9ywC7jcE=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 Content-Language:X-Originating-IP:X-ClientProxiedBy;
 b=kLDgSUqMQ1b5hea13RYJQ+lwwlmiXIUaQeOmmRXc+P3NPwKWbZawwzXPN4EL5suyM
 5PGDpUYcOD+BsqL40x4qNuo9dyqj2pPp+rT+4hJ83QuMEkMP0j35uxs9uoG233JXip
 prBJ7UeIszZVSbhAN59Hkq2+QRibl1W0Hdd1QvpP2gC+8GSVLXatm5Aw8EXJpoQecS
 jgOxmOuZrBNV8cDXy9Um9Z3ZjzBNdY97/BajAZ7pQ8rYg8z+XqbADz72IQxjwB0P6h
 hkIcdCkZN41HVKtBBFkbH9VR7drlMQdB5VqndKWU1mEJhrPrFevqJFW7UlTG5xCN57
 ZEek+r/CVPnKA==
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

...

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

Can these be referenced from graph.yaml (port and ports properties) and 
only additonal properties (specific to audio-graph) could be populated here?

...

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

