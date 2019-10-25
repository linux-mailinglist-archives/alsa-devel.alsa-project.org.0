Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9919E5596
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 23:02:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30D1818A6;
	Fri, 25 Oct 2019 23:01:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30D1818A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572037334;
	bh=47eYZ8fiA0/ljo0URikT3QjZpOX9DGUIgDwtJZAf224=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XraTaq+A1hyye1F2uW1n1zetpbJCUkj3mWB5NpLPpqKr9IFuuD0iO20GDa98Pjjtb
	 7cTxTEjF9YxRChCDAxpvtAk9giTtuIInwADuFeAd5ebuD53ipYyxNQevrwBaNBu5F6
	 qByJdMq+FusahqZnw8+/Kh7RFUS4c4oURn1+en2w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAA78F803A6;
	Fri, 25 Oct 2019 23:00:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18358F8036F; Fri, 25 Oct 2019 23:00:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56BE8F80112
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 23:00:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56BE8F80112
Received: by mail-ot1-f68.google.com with SMTP id s22so2978167otr.6
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 14:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PIdw2OR1Wc5vcgtc2S6a52CrxT11Bed11+whBzjKQXQ=;
 b=YXUllJSS8j9gcuLQgDs+CPh9bPhmYk0d58yXWz3ZruBfkcVcXhbd7+KDHkaw8vhifb
 939nJ/U8TQxECLkEDkgrvueXfTegJiu4bwYVX1qTIKzdUu4HC/RP2WblegMKGi0zxhVH
 6IqZRk/X6oAnm2WfTldQKeI27UA6q2K6Krpub+BZ3qAhOSNNCvJOU3aVDR2bC3h6GQFC
 Sbuqmqjp0j07OBvPzQBkUQ0bce7TnCNSKZJzc6TXWvzXm89fUfQWYexuR2LcEz/jC5oz
 Mv3RIBzv1DSehTDgamP373yVHj64IYE6vBewoHY4jTLnGT+NhBbLEZf12RybBozIKC+c
 FQug==
X-Gm-Message-State: APjAAAVoOu+RAXmUr7X0MB9I8+ixaGscXnOJ7U+aDy/bSmdiYNJyOrXd
 QMO2q2L9D8sLcaZzX1mmtg==
X-Google-Smtp-Source: APXvYqwgx8LVN5ZVNBUTcYENC8p5D3he0cebxVqtC+8b/u08CP9bM4qBdYUNb5YGdUAkXXj3FWf51A==
X-Received: by 2002:a9d:5e12:: with SMTP id d18mr4451844oti.220.1572037223231; 
 Fri, 25 Oct 2019 14:00:23 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l19sm863516oie.22.2019.10.25.14.00.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 14:00:22 -0700 (PDT)
Date: Fri, 25 Oct 2019 16:00:21 -0500
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20191025210021.GA12751@bogus>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-9-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191018001849.27205-9-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vinod.koul@linaro.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org,
 lee.jones@linaro.org, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 08/11] dt-bindings: pinctrl:
 qcom-wcd934x: Add bindings for gpio
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

On Fri, Oct 18, 2019 at 01:18:46AM +0100, Srinivas Kandagatla wrote:
> Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
> gpio controller to control 5 gpios on the chip. This patch adds
> required device tree bindings for it.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../pinctrl/qcom,wcd934x-pinctrl.yaml         | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,wcd934x-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,wcd934x-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,wcd934x-pinctrl.yaml
> new file mode 100644
> index 000000000000..c8a36cbc4935
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,wcd934x-pinctrl.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,wcd934x-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: WCD9340/WCD9341 GPIO Pin controller
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description: |
> +  Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
> +  gpio controller to control 5 gpios on the chip.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,wcd9340-pinctrl
> +      - qcom,wcd9341-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - gpio-ranges
> +  - "#gpio-cells"

additionalProperties: false

> +
> +
> +examples:
> +  - |
> +    wcdpinctrl: wcdpinctrl@42 {

pinctrl@42

> +        compatible = "qcom,wcd9340-pinctrl";
> +        reg = <0x042 0x2>;
> +        gpio-controller;
> +        gpio-ranges = <&wcdpinctrl 0 0 5>;
> +        #gpio-cells = <2>;
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
