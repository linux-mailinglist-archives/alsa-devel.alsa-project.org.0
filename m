Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46837A1D73
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:44:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D554116BF;
	Thu, 29 Aug 2019 16:43:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D554116BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567089880;
	bh=AZAlYOIMfp2jHpX15HJrWBHBMMqspYsm2z6OdWNGPIY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BpPxjZQj5JOmE+9dnPCcKPCmfRLayQeYIbJi27oEZmWh8I+uzT30RgwxSgmqadaqZ
	 TLglW1QL4nk85TeOVTbWFqTTX55yUr6mZRHar8wPSkzzPlWdrFKb2SM8qdyusK9ev6
	 QZrvOp19lDUAvlSSQNP2CGTrwJ/VzBXkq/EIbIf8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4C7CF8078F;
	Tue, 27 Aug 2019 22:25:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABED9F8077D; Tue, 27 Aug 2019 22:25:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42F34F80774
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 22:25:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42F34F80774
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="M3G4Y3h4"
Received: by mail-wr1-x442.google.com with SMTP id z1so101062wru.13
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 13:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z2ACtSe6Yiw1+YbjAjRq/giYtTA4VS+c+Zl+5oYIiXY=;
 b=M3G4Y3h42bkVq/9crq1VzDHEGrLQc0rjs9gPpAzbIP/UbZna8LkFJy34RTWoq/YD3y
 L//flOHT9MxTy0DixdqaCDt5j90xIg0Qu1edv8Z96TmRZhgr0YVEeW4sT6iSvHtXaRbL
 5JPpzH44Kpii6B5L2PwOGZMKmFyqesbaXfoFfGiNmMrlbB7fwqJuzwoAJf+rxQ5Ni+QS
 q2R6YLyw0zZWdRFnh0ez0geQui90mQIvjsTNYyb9p4042lKSlqlDKx1FHGsuC2Iq5aGu
 O+u4szumPoIF4XBmwLADecXc1QSAfSHTPekC+nzGKT354vm41lpBItQD1cF/IJnkCopL
 p4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z2ACtSe6Yiw1+YbjAjRq/giYtTA4VS+c+Zl+5oYIiXY=;
 b=fGZj8dUtT26Q4u+BsF1htkhjlpsWTfUeH75dJVMqPXdL/conmWM+ak15dOKG1gtSDC
 WdVyzymcwpxWf5b8cKGZOj0058393Ex+dyzG9NQrsZvKRhCJlosDgY6itgENZ3OWITft
 vapwMswTZfQGX1iWIvNzAKF1T11X5HQqYhcRfeNof4SORA4nFIKPWATY1zuIoq3PQh1I
 9WffM3etJFboeU2S5+RyIOn33027XHuqBKBPm/DkwsRlCiwy1JW+VEMBsxSSQIwUdGHW
 QUccD5CP+OBr/3g08baKQWQp91vapTXvxUVj7DCC+/n7/UzQifrjhGrdwKKuPf2UH8YO
 2WeA==
X-Gm-Message-State: APjAAAUuDLi6qyvn/J1aAxRbNTyhYUVHCs1IOdfT0LokbLRCpofgGzVY
 uLzwBNix4gjdPwRBbW9eTyn9Aw==
X-Google-Smtp-Source: APXvYqyHpC6GdfK/HOCjnBJXEVM8YLHpWnP6P2IknR138f8AEZoNrRpK/Q0KA/Y/KqjK4k3jrZPmZQ==
X-Received: by 2002:adf:f507:: with SMTP id q7mr66707wro.210.1566937522099;
 Tue, 27 Aug 2019 13:25:22 -0700 (PDT)
Received: from [192.168.86.29]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id e11sm292024wrc.4.2019.08.27.13.25.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Aug 2019 13:25:21 -0700 (PDT)
To: Rob Herring <robh+dt@kernel.org>
References: <20190822233759.12663-1-srinivas.kandagatla@linaro.org>
 <20190822233759.12663-4-srinivas.kandagatla@linaro.org>
 <CAL_JsqLjgOy3TKrpuNYYkRxy-Ln+3FOoKVE9KweS0ycTxriWMQ@mail.gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <81888350-9296-7db1-01b5-4594a3bd5d60@linaro.org>
Date: Tue, 27 Aug 2019 21:25:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLjgOy3TKrpuNYYkRxy-Ln+3FOoKVE9KweS0ycTxriWMQ@mail.gmail.com>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Thanks for taking time to review!

On 27/08/2019 13:20, Rob Herring wrote:
> On Thu, Aug 22, 2019 at 6:38 PM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>> This patch adds bindings for WSA8810/WSA8815 Class-D Smart Speaker
>> Amplifier. This Amplifier also has a simple thermal sensor for
>> over temperature and speaker protection.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   .../bindings/sound/qcom,wsa881x.yaml          | 44 +++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
>> new file mode 100644
>> index 000000000000..ad718d75c660
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
>> @@ -0,0 +1,44 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/qcom,wsa881x.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Bindings for Qualcomm WSA8810/WSA8815 Class-D Smart Speaker Amplifier
>> +
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> +
>> +allOf:
>> +  - $ref: "soundwire-controller.yaml#"
> 
> This is not the controller, so this should not be included here. You
> should get lots of warnings from doing so. You did run 'make
> dt_binding_check', right?

no, I was not aware of this command! will run that before sending next 
version.


> 
>> +
>> +properties:
>> +  compatible:
>> +    const: sdw10217201000
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  pd-gpios:
> 
> powerdown-gpios is the standard name.
> 
sounds good to me, will change this in next version!

>> +    description: GPIO spec for Powerdown/Shutdown line to use
>> +    maxItems: 1
>> +
>> +  "#thermal-sensor-cells":
>> +    const: 0
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - pd-gpios
>> +  - #thermal-sensor-cells
>> +
>> +examples:
>> +  - |
>> +    efuse@1c23800 {
>> +        compatible = "allwinner,sun4i-a10-sid";
> 
> Huh?

Opps! copy paste bugs!!! :-)

> 
>> +        reg = <0x01c23800 0x10>;
>> +        pd-gpios = <&wcdpinctrl 2 0>;
>> +        #thermal-sensor-cells = <0>;
>> +    };
>> +
>> +...
>> --
>> 2.21.0
>>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
