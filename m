Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EDBF1369
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 11:09:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 004B416AA;
	Wed,  6 Nov 2019 11:09:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 004B416AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573034996;
	bh=ZYKBXku1hXdMknLwi0wKh4YqHQcVEnx+hwblSFh0RbE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iOmUaZIuWIK0aVYH57VPBleVrKKX4yAAqNoWWKrv33Lv+Saz+QsgYSDf/Mg8O+14K
	 L4Ts+iRPaZfaXGGFtpccY7qQpqQ1v4w5iGUfubVTfcsxVo5F9cFGstGukKoamxmwl0
	 yw6ew/Hs5thuBH9DmLB3MgE8+6QLl1e3SkTaIQdg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C358F8045F;
	Wed,  6 Nov 2019 11:08:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23983F803D0; Wed,  6 Nov 2019 11:08:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 845D7F800F3
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 11:08:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 845D7F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vO6giWxh"
Received: by mail-wr1-x42c.google.com with SMTP id i10so4298186wrs.7
 for <alsa-devel@alsa-project.org>; Wed, 06 Nov 2019 02:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RfazqxK++NUeQGibGNsb/xwtl2AjqHTLxKqC49MTjR4=;
 b=vO6giWxhl3D8Ew4bBQphqLy0x5vLotCBC10MctFCYaF30IL9VTV0hCx5csqFpfbOac
 OZ+Fne3LnI3q7YyZNNK7WVZHqdOHesj+x30hKRu+5ukVHog2AS/HmQx7UX4immTCHhGU
 HyUxdJTeevWpRa2LDfBK4du66HGutnLI35hwOza2cemUrgrV0paJ8JOBRoVL3G/iHWZw
 juCb2ZkL8PUFtj23OtQoX9s5Bm+pawpiO3+qDAf7JwrV/UoSqRv6+/pzdRko3aLKx28K
 EjmAbxeqoeGpQV9Ls40nkMIV8mcfuP7a2kuAIdaXoGPpajOc8YLylilehZiPOPu/1IVw
 eINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RfazqxK++NUeQGibGNsb/xwtl2AjqHTLxKqC49MTjR4=;
 b=cH+SH+2qzrdH55l16wLpMvWEHubZPzO6WvDHOFhfmAIvz4KNPL72QKurOfLPXYyc6C
 F5nxZer0h5YKJ0/Xbbc+WZF9KJAWx3MDSn/iuKrD+XunBXsrYNNUT4CBVeUnyVMxC/si
 TA1TjJoVsCt4Jot0QBVi5EtfR1H/po2U8jfm6A/DcSFOghVBtwux0Au7A/JtJBXqvEDj
 sKVVsGJ/eNYDC7H6UgrMkvOaCHOOUrX6aWNP5TO1Xsz8tm7G8ZipccDNHGpRxM7Ts94B
 XXCf5y6BsFFoChBKiB9qfgG4XPwdDXoXuRoMiqGT3VCBbb2+xa+jMy60bSRR0wqLI0nc
 vCNw==
X-Gm-Message-State: APjAAAWDMbCl6VKB/Chd3BWFfzKgZFp6Bjqv/XCtOWEBb1bcrftvbBRa
 JhA6mIom1M9NzlurfBSXZEaBsg==
X-Google-Smtp-Source: APXvYqxLATsv0dpIOklFV3PCz8dC70Zj2vsSWYi/3P2nLGCV6B+BbAH7mLeIYbgJgVf1KaSE2F/j2A==
X-Received: by 2002:adf:b608:: with SMTP id f8mr1716914wre.99.1573034884360;
 Wed, 06 Nov 2019 02:08:04 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id j3sm15897267wrs.70.2019.11.06.02.08.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 Nov 2019 02:08:03 -0800 (PST)
To: Rob Herring <robh@kernel.org>
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
 <20191029112700.14548-2-srinivas.kandagatla@linaro.org>
 <20191105193100.GB4709@bogus>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <315fd1f8-b6b5-5df7-604d-4ca92b31772c@linaro.org>
Date: Wed, 6 Nov 2019 10:08:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191105193100.GB4709@bogus>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, vinod.koul@linaro.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, broonie@kernel.org,
 lee.jones@linaro.org, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v3 01/11] ASoC: dt-bindings: add dt
 bindings for WCD9340/WCD9341 audio codec
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



On 05/11/2019 19:31, Rob Herring wrote:
>> +  vdd-micbias-supply:
>> +    description: A reference to the micbias supply
>> +
>> +  qcom,micbias1-microvolts:
> The standard unit is 'microvolt', not 'microvolts'.
> 
I started with microvolt but dt_bindings_check reported errors.

looking at 
https://github.com/devicetree-org/dt-schema/blob/master/meta-schemas/vendor-props.yaml#L19 
  suggested microvolts should be used on vendor properties.

Is this a typo in dt-schema ?

thanks,
--srini
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
