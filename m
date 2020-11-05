Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BFD2A864F
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 19:45:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DD481686;
	Thu,  5 Nov 2020 19:44:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DD481686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604601933;
	bh=o3ONg8+YCLhZnfQkMehE6eSQ+Kt7FbvRfsyP63raEnc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZwBiKXOXIsZsmDfCKKyHuKZXhMo0Xx5gJi+ilQtk+i6CWUywGJqLy5Vh9osQnZlTS
	 oUv0QNm7V/IXl7ZHqMcgj6P6uZ29s3TnXAx45cKMkpNGmDzqH3WNF8DMCVlNXyu/fj
	 hvruSZhzkKVFwoJ7qxwIfZE3LPla63cf3wbyo6WA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DF82F80245;
	Thu,  5 Nov 2020 19:44:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 591FBF80171; Thu,  5 Nov 2020 19:43:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65486F80150
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 19:43:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65486F80150
Received: by mail-oi1-f193.google.com with SMTP id m143so2718113oig.7
 for <alsa-devel@alsa-project.org>; Thu, 05 Nov 2020 10:43:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=d5oADnBeNIpIvCSojwrBHVdlvDCR/O5IS/nZKIy1ndA=;
 b=cC5z5o2o759j7En2uOLzWXKF1WgdVKA+pU8HdRpDxEpIh5DpQ+zhGcodXIUlhEpmHM
 TjLaeTBoUxlHKWcFoqCGsjvbt9QVlKlSZaVXTzmfdx+AK9rB5XAhBpiXzNjIfgJQ8Vus
 s4QnGyK1cJrd7HsY+0qbKoQbZOCO9zRbuskLBtHCTCCW/SzIEkheWOwbtGv9McsCrOVz
 fjMNBeAnyFnIgx6BDFM2bYIcx0CuDHdpHjNqsq7yTUherXJq/6KGQ5u5YJ+daqR9EUGj
 lqv1kHfBnJ/iybCniOboy4fZRSA7TW7ejaeLW4ehxzaPMAAGCKXloehLKJGqc/k0LAqY
 jbOg==
X-Gm-Message-State: AOAM530bt+LdEMeqxuRyD5W5kpJkdFDTzt1RP+Qq/GbMimN2EftBWZi3
 Sd9igArzgoFBtTqjxhEr2A==
X-Google-Smtp-Source: ABdhPJyYXmS7UjH4bUE7XXBl0KWexDWJQoYRb48zVqEn7FRn3jqT1JFDBgJKqsHgp8p6dVQEG+M/+Q==
X-Received: by 2002:aca:c084:: with SMTP id q126mr506299oif.129.1604601832353; 
 Thu, 05 Nov 2020 10:43:52 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k10sm497430otb.81.2020.11.05.10.43.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 10:43:51 -0800 (PST)
Received: (nullmailer pid 1613991 invoked by uid 1000);
 Thu, 05 Nov 2020 18:43:50 -0000
Date: Thu, 5 Nov 2020 12:43:50 -0600
From: Rob Herring <robh@kernel.org>
To: Ajye Huang <ajye.huang@gmail.com>
Subject: Re: [PATCH v5 1/2] ASoC: google: dt-bindings: modify machine
 bindings for two MICs case
Message-ID: <20201105184350.GA1611477@bogus>
References: <20201103103051.34553-1-ajye_huang@compal.corp-partner.google.com>
 <20201103103051.34553-2-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103103051.34553-2-ajye_huang@compal.corp-partner.google.com>
Cc: dianders@chromium.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, tzungbi@chromium.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, Andy Gross <agross@kernel.org>,
 srinivas.kandagatla@linaro.org, linux-arm-kernel@lists.infradead.org,
 cychiang@chromium.org
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

On Tue, Nov 03, 2020 at 06:30:50PM +0800, Ajye Huang wrote:
> Add a property "dmic-gpios" for switching between two MICs.
> 
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
>  .../bindings/sound/google,sc7180-trogdor.yaml | 58 +++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> index efc34689d6b5..9e0505467e57 100644
> --- a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> +++ b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> @@ -34,6 +34,9 @@ properties:
>    "#size-cells":
>      const: 0
>  
> +  dmic-gpios:
> +    description: GPIO for switching between DMICs

Need to define how many (maxItems: 1).

> +
>  patternProperties:
>    "^dai-link(@[0-9])?$":
>      description:
> @@ -81,6 +84,7 @@ additionalProperties: false
>  examples:
>  
>    - |
> +    //Example 1
>      sound {
>          compatible = "google,sc7180-trogdor";
>          model = "sc7180-rt5682-max98357a-1mic";
> @@ -128,3 +132,57 @@ examples:
>              };
>          };
>      };
> +
> +  - |
> +    //Example 2 (2mic case)
> +    sound {
> +        compatible = "google,sc7180-trogdor";
> +        model = "sc7180-rt5682-max98357a-2mic";
> +
> +        audio-routing =
> +                    "Headphone Jack", "HPOL",
> +                    "Headphone Jack", "HPOR";
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        dmic-gpios = <&tlmm 86 0>;

Do we really need another example for this? Can't you just add it to the 
existing example?

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
> +
> +...
> -- 
> 2.25.1
> 
