Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ACFB7865
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Sep 2019 13:24:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9861F166C;
	Thu, 19 Sep 2019 13:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9861F166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568892275;
	bh=Pm8gaJpC9F65kRG/B5qA0rF4F9wbx7mvGAD5k5Ca6ek=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=up8FZgKBKnvvq9qfiUxXxihlKPdua5UmtwDSX2W2FHLR8OAV5ksjzRZ4FZ7O7UxKs
	 gzRDdIP29RGa82jEaKe92eNzEHesc5JjkUlpVFY/rf5C1R3hexTIOJSo6Yq7P/WkBU
	 gaUCvDYzL8kZ//YEvKYUX8UJtdy8BaCFrf6eSKJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DE9FF8048E;
	Thu, 19 Sep 2019 13:22:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21A12F80361; Thu, 19 Sep 2019 13:22:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F14CF80090
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 13:22:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F14CF80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="DOLQKcTa"
Received: by mail-wm1-x342.google.com with SMTP id y21so3540419wmi.0
 for <alsa-devel@alsa-project.org>; Thu, 19 Sep 2019 04:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=L/z7HqNsHflGQAbfR3vmMZA79Q4P41CqUalbXCPqdL4=;
 b=DOLQKcTa6DvDnKAxXNjTbyJ/UeL95KDBH6zVylwU+sMxSJJU0wkL4mdw8D5Z/N9t6j
 Btxi/ziR8aabLIaf9+xTlTKlOoD0X7wfyjm3hE84FrzWC0nZU7OPFat0OSWRyJrE5xbw
 ftTT1mu0jKgPUWzkHfoN8cm9nQCtgBUqORV+jYEHWywYCGKIJE1nN+a39/C8sX5qJzln
 2441htdnt/tab0cAGYxZC8MpPlh45AfIbT1Neu6dSbEILiraHU4jBVlEVLURGMn+4Mhj
 j7R1vzhFCvLLAa2+6iE+P2jdQmofOfWrplWcqWpWvlI4P9DNB+enAkV52RmVWXiPv3bs
 CP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L/z7HqNsHflGQAbfR3vmMZA79Q4P41CqUalbXCPqdL4=;
 b=aJVk3wg+SrAH50JbNSW+/RD5TYqe1UUffUrk10z+KZ4tdGyj7goC0g6go5l9lbJ1l5
 b/KIzCXfdhdinL+XmAHBEQmlNMzlA1ZFJRxCE9XJj74HlvdIbv8K9OnSwWYVxvfiGrDO
 FXvXx8EQYZ7HDlGxgjiTuLHW3ZTKWKEKuZgcCKJa92+/o+xWFXLN9oatiwsfy5sA/6Te
 N1zfa6JoVwlblCe2G6CR2dvcXUgQVciboJhnkHQ1+7tmDeJTRQQXYAXXUz9njNnljCyq
 NyHJmCR9Hi3H04LxsUsqe0dFFsAq1WCb9uoy7WiRmWhxeC7NtLp0op/zYxTJszZqzZu1
 RJtw==
X-Gm-Message-State: APjAAAXVYa6m8N3VfKEDW8IkzR8QXmKPrslzZfbr5VTz0xsoJPLKdJXX
 f0UoaHcZysUYkYYsPPzUsDnNCBrzAOM=
X-Google-Smtp-Source: APXvYqy2mqc1xRSA6U/tXepOzf4zA4ahtXymq3ZbLKy64+rCf2R+XjoTC4eA68T2fhVOwbifGx/Gww==
X-Received: by 2002:a05:600c:22da:: with SMTP id
 26mr2283972wmg.177.1568892165840; 
 Thu, 19 Sep 2019 04:22:45 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id
 g185sm11071560wme.10.2019.09.19.04.22.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Sep 2019 04:22:44 -0700 (PDT)
To: broonie@kernel.org, robh+dt@kernel.org, vkoul@kernel.org
References: <20190829163514.11221-1-srinivas.kandagatla@linaro.org>
 <20190829163514.11221-4-srinivas.kandagatla@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <f488e01f-7ce9-09dd-676d-a476e7b00b46@linaro.org>
Date: Thu, 19 Sep 2019 12:22:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829163514.11221-4-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v6 3/4] dt-bindings: ASoC: Add WSA881x
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Mark,

On 29/08/2019 17:35, Srinivas Kandagatla wrote:
> This patch adds bindings for WSA8810/WSA8815 Class-D Smart Speaker
> Amplifier. This Amplifier also has a simple thermal sensor for
> over temperature and speaker protection.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Bindings for the codec have been Acked by Rob, SoundWire depended 
patches are already applied for 5.4 and codec driver is Acked by Pierre.

Do you want me to resend these two patches separately?


thanks,
srini

> ---
>   .../bindings/sound/qcom,wsa881x.yaml          | 62 +++++++++++++++++++
>   1 file changed, 62 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
> new file mode 100644
> index 000000000000..faa90966a33a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
> @@ -0,0 +1,62 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
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
> +description: |
> +  WSA8810 is a class-D smart speaker amplifier and WSA8815
> +  is a high-output power class-D smart speaker amplifier.
> +  Their primary operating mode uses a SoundWire digital audio
> +  interface. This binding is for SoundWire interface.
> +
> +properties:
> +  compatible:
> +    const: sdw10217201000
> +
> +  reg:
> +    maxItems: 1
> +
> +  powerdown-gpios:
> +    description: GPIO spec for Powerdown/Shutdown line to use
> +    maxItems: 1
> +
> +  '#thermal-sensor-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - powerdown-gpios
> +  - "#thermal-sensor-cells"
> +
> +additionalProperties: false
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
> +            powerdown-gpios = <&wcdpinctrl 2 0>;
> +            #thermal-sensor-cells = <0>;
> +        };
> +
> +        speaker@0,2 {
> +            compatible = "sdw10217201000";
> +            reg = <0 2>;
> +            powerdown-gpios = <&wcdpinctrl 2 0>;
> +            #thermal-sensor-cells = <0>;
> +        };
> +    };
> +
> +...
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
