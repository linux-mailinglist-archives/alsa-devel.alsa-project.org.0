Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C86AEA1F7F
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:44:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D62D16C5;
	Thu, 29 Aug 2019 17:43:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D62D16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567093483;
	bh=GezAT/nWeUIZhjAdRjLKAXai5LG/1tYY9oIjaZBui1g=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=theW4lJx08rHR1rwwpXLnCxbTW1sSJkuOZ5plEfME3cGfj0PppCdGJpmyLkZoS+o7
	 pgtCjoYK60Ikiizq5T+QQQ6Ur21MXFhVjiQrxJWp4bS78RkU5y9s8xgqGvW4fl/bUr
	 pTDbul9olbDrN3pv12x0ckkAiv/jnIuGBTNV09pE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44375F801ED;
	Thu, 29 Aug 2019 17:42:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D375CF80142; Thu, 29 Aug 2019 17:42:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E52E4F80096
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 17:42:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E52E4F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vzJZPgiD"
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B3F72166E
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 15:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567093370;
 bh=DxWOdTfJDyMTvRtm9hgWK6xzF49v9zdddJc0Ul0OHxY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vzJZPgiDkWKkP+NaPPxauJ+fKFwPvLGB8/KdLTohOjj/xVgXAESpMcyDxLKvgC9FL
 4ds2R9TlkDRR/vh+2bQOe0y3+DDbXYkzBMHs913aiDG10CTXtcEJX0TITe/ya+q4ot
 Mt/Cil3GMNqnHFH52WvFb2OkSak1IHnGLTgP3aq0=
Received: by mail-qt1-f179.google.com with SMTP id y26so4176669qto.4
 for <alsa-devel@alsa-project.org>; Thu, 29 Aug 2019 08:42:50 -0700 (PDT)
X-Gm-Message-State: APjAAAXjM3+yoQ8fQtUHJ34H85FsWlrCzTjNDzTyzYz6aUfhDqM/gh/9
 e7cakhG3h17mrRajad6sI4gT5isODcGxoaSY8w==
X-Google-Smtp-Source: APXvYqzic6Dz5pyl8Zhym2cQiIYya/v+IE6KIzVsJARvSoJSziaqBB5AVnV348vxKKPJBjtqCYdf51FhEHiBWnPYbek=
X-Received: by 2002:ad4:4050:: with SMTP id r16mr6931395qvp.200.1567093369577; 
 Thu, 29 Aug 2019 08:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190829144442.6210-1-srinivas.kandagatla@linaro.org>
 <20190829144442.6210-2-srinivas.kandagatla@linaro.org>
In-Reply-To: <20190829144442.6210-2-srinivas.kandagatla@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 29 Aug 2019 10:42:37 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLwbz5eiBEw8PmXsJrxzXffNc7rRON-wQ0KviVW8JVv5A@mail.gmail.com>
Message-ID: <CAL_JsqLwbz5eiBEw8PmXsJrxzXffNc7rRON-wQ0KviVW8JVv5A@mail.gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, spapothi@codeaurora.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v5 1/4] dt-bindings: soundwire: add slave
	bindings
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Aug 29, 2019 at 9:45 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> This patch adds bindings for Soundwire Slave devices that includes how
> SoundWire enumeration address and Link ID are used to represented in
> SoundWire slave device tree nodes.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../soundwire/soundwire-controller.yaml       | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
>
> diff --git a/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
> new file mode 100644
> index 000000000000..449b6130ce63
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soundwire/soundwire-controller.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: GPL-2.0

(GPL-2.0-only OR BSD-2-Clause) for new bindings.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soundwire/soundwire-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SoundWire Controller Generic Binding
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +  - Vinod Koul <vkoul@kernel.org>
> +
> +description: |
> +  SoundWire busses can be described with a node for the SoundWire controller
> +  device and a set of child nodes for each SoundWire slave on the bus.
> +
> +properties:
> +  $nodename:
> +    pattern: "^soundwire(@.*)?$"
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^.*@[0-9a-f],[0-9a-f]$":
> +    type: object
> +
> +    properties:
> +      compatible:
> +        pattern: "^sdw[0-9a-f]{1}[0-9a-f]{4}[0-9a-f]{4}[0-9a-f]{2}$"
> +        description: Is the textual representation of SoundWire Enumeration
> +          address. compatible string should contain SoundWire Version ID,
> +          Manufacturer ID, Part ID and Class ID in order and shall be in
> +          lower-case hexadecimal with leading zeroes.
> +          Valid sizes of these fields are
> +          Version ID is 1 nibble, number '0x1' represents SoundWire 1.0
> +          and '0x2' represents SoundWire 1.1 and so on.
> +          MFD is 4 nibbles
> +          PID is 4 nibbles
> +          CID is 2 nibbles
> +          More Information on detail of encoding of these fields can be
> +          found in MIPI Alliance DisCo & SoundWire 1.0 Specifications.
> +
> +      reg:
> +        maxItems: 1
> +        description:
> +          Link ID followed by Instance ID of SoundWire Device Address.
> +
> +    additionalProperties: false

I'm pretty sure you'll want nodes with other properties. If not, then
why are they in DT? So drop this.

Both the controller and child nodes need to list required properties.

> +
> +examples:
> +  - |
> +    soundwire@c2d0000 {
> +        #address-cells = <2>;
> +        #size-cells = <0>;
> +        reg = <0x0c2d0000 0x2000>;
> +
> +        speaker@0,1 {
> +            compatible = "sdw10217201000";
> +            reg = <0 1>;
> +        };
> +
> +        speaker@0,2 {
> +            compatible = "sdw10217201000";
> +            reg = <0 2>;
> +        };
> +    };
> +
> +...
> --
> 2.21.0
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
