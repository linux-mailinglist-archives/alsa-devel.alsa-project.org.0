Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 257319E7C6
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 14:22:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B14B6166B;
	Tue, 27 Aug 2019 14:21:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B14B6166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566908549;
	bh=+Qc1mumG0d+d/vLzTNMuQJ8hU0NgBcGVWTMKyvVHGoY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kw37QLcFgrgWVaj3TbjxJWHjM48+uswQ2ClVTrZCGRLrzZNPpV/6S4EEeT6wCPHMl
	 tEvEepzeZUE20aJOc6q9/FjIVcnf0p6thNqDYhRMlPEakGqERRuHCaxykY1LT7YdS6
	 fuwMpRa8/aHLXdjs1KaaWlffbg7Pw3MdA0UhZGPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7C52F802A1;
	Tue, 27 Aug 2019 14:20:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81D12F80274; Tue, 27 Aug 2019 14:20:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B05CF80142
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 14:20:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B05CF80142
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hiSjrNzN"
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F146A21872
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 12:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566908434;
 bh=10BPMi7ogBKEVUWUCp+OlUh6tWIYmElWTtO/pbCLCfE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hiSjrNzN9O29H/jZozkaXJ1RY7B2iPUnmPqzXqXAfbEHqvCNs2qwYPYjz+fe0bIVP
 3OWIUxGwCDw0ICc9roj00pPsDU+tYy6PMcG/TCSw0YwM5ErWb8psm8Fm/gJJGcB7wT
 Gdyvjxn2TXOQ9wvf0rvh4w1k9UfLYSxEan4/ebTw=
Received: by mail-qt1-f174.google.com with SMTP id a13so248082qtj.1
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 05:20:33 -0700 (PDT)
X-Gm-Message-State: APjAAAUvu/SJs5IZLsgZL5RfW6jQ46ybTVjbVQHKciHOm1XbJW//k2lC
 ngW9qi+3Tf1TZGsZKGFxXzCof83pzdhKCflziA==
X-Google-Smtp-Source: APXvYqwMqxGiTa7rYYydtko9BqUul5ihk660b1Rd0cPJHim/fp9+Uq5BxXYH75v80lYawW9Ve2rEL384NDhcnbTwKFM=
X-Received: by 2002:a05:6214:10e1:: with SMTP id
 q1mr19735401qvt.148.1566908433096; 
 Tue, 27 Aug 2019 05:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190822233759.12663-1-srinivas.kandagatla@linaro.org>
 <20190822233759.12663-4-srinivas.kandagatla@linaro.org>
In-Reply-To: <20190822233759.12663-4-srinivas.kandagatla@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 27 Aug 2019 07:20:21 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLjgOy3TKrpuNYYkRxy-Ln+3FOoKVE9KweS0ycTxriWMQ@mail.gmail.com>
Message-ID: <CAL_JsqLjgOy3TKrpuNYYkRxy-Ln+3FOoKVE9KweS0ycTxriWMQ@mail.gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, spapothi@codeaurora.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Vinod <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [RESEND PATCH v4 3/4] dt-bindings: ASoC: Add
	WSA881x bindings
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

On Thu, Aug 22, 2019 at 6:38 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
> This patch adds bindings for WSA8810/WSA8815 Class-D Smart Speaker
> Amplifier. This Amplifier also has a simple thermal sensor for
> over temperature and speaker protection.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/sound/qcom,wsa881x.yaml          | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
> new file mode 100644
> index 000000000000..ad718d75c660
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,wsa881x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Bindings for Qualcomm WSA8810/WSA8815 Class-D Smart Speaker Amplifier
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +allOf:
> +  - $ref: "soundwire-controller.yaml#"

This is not the controller, so this should not be included here. You
should get lots of warnings from doing so. You did run 'make
dt_binding_check', right?

> +
> +properties:
> +  compatible:
> +    const: sdw10217201000
> +
> +  reg:
> +    maxItems: 1
> +
> +  pd-gpios:

powerdown-gpios is the standard name.

> +    description: GPIO spec for Powerdown/Shutdown line to use
> +    maxItems: 1
> +
> +  "#thermal-sensor-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - pd-gpios
> +  - #thermal-sensor-cells
> +
> +examples:
> +  - |
> +    efuse@1c23800 {
> +        compatible = "allwinner,sun4i-a10-sid";

Huh?

> +        reg = <0x01c23800 0x10>;
> +        pd-gpios = <&wcdpinctrl 2 0>;
> +        #thermal-sensor-cells = <0>;
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
