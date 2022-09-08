Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7E05B189E
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 11:25:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1330516C2;
	Thu,  8 Sep 2022 11:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1330516C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662629145;
	bh=K8QysTuNf/wONs7yZ7RlOX7ps0Xr9pSGRaFy9ZIJITM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IAnLmK9xx9ErrlkD+WtJDxpCZC7qBbCPJiLxhpHyxdxS6TMquLgQdDijEqeIUEdrl
	 qXuozu1iBu/QqQITd4Nccya/o3+2f1BpMpt6T9RNbiNx3a2niMul7RACn92pDSgnKz
	 ze+QjLkmXFSifMCbL5egAGgri8eSf+VaUZ6izZu8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F06FF804B3;
	Thu,  8 Sep 2022 11:23:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 77145F802A0; Thu,  8 Sep 2022 11:22:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_26,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 013D7F8011C
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 11:22:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 013D7F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FHf5Ic/n"
Received: by mail-lf1-x12f.google.com with SMTP id q7so26728381lfu.5
 for <alsa-devel@alsa-project.org>; Thu, 08 Sep 2022 02:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=dH3CbhVOQrBIzFdsMYEQAzEoE3B2m4SSznn5rAk+rYM=;
 b=FHf5Ic/nwRoqqtgsFHSSGFDXZc98X2hpVH5Ttn0/VY/T+Rl1xxX8eAP+p5gs+pa44G
 dqojHG/7TfSA3gOeWxAIl+UZh8PDFCPoea9kdGdQqDETSUMlihGsJQtxcvAzwkVOy9sT
 3fDJ01OAxnONes0Gle2gdPEa0FKu6zFZ/j+W9iF0qpfbRbL6px2LC8vg21uN+B1a+F6d
 U7OQShHt5p86KP5e2r9IZo+K/7ynXnUdLMF1xVA5svaLjFkS8ALinaYJ0yT0hTOm1z5y
 5k/Ar9Kn+1s6rjhMYGbHk8a9pG3X93HkuWGNY4axTv/+yed/0Q6jeQnF9lV+pUJTF328
 eDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=dH3CbhVOQrBIzFdsMYEQAzEoE3B2m4SSznn5rAk+rYM=;
 b=Lq8YfXd1LwNqkIXCa46tm2W4Lkqun1qNaMSdcyEdYEAQ42PDyD7wQJrhyekegNE+Qa
 WkP/cJq8+TKPaP83YcNCVPWKHmBGxeIQ8K8Cfe338JahkjaaGK9DF+cEi3HxLv7QVgKN
 w9XdHwjFrfuuMqUV79cCJsb0BJzKqBj9MnJvoHKNVsX6lPuqR/s7Ake550BgJzc7nnKf
 a5mUW37Qkgynqu79MsT27xUBGf3A4U13fuUACIHvCJZc12FIWoibfInC2x9NQphgrbT4
 LUv0FAofqNxi8klI0MbWrE7m3dkbMU1/22faw+Y5YTomOCeUQfsbAqLOdJXCQLrPxvBJ
 E+Ew==
X-Gm-Message-State: ACgBeo0BWX1EQ6kkBTvdsa3kVHMMmoa6F2rbud/QQp+PN2PoNQMJ0CN3
 ZOhifP2PEKVIwOhHw1GgJstL2w==
X-Google-Smtp-Source: AA6agR4x1bQbWHYoUICIygFzuOYuWPgfmCbP5o72xJn3+fJ+P+x9kq1cdfCrhlbhILkhk07z1Y2DaA==
X-Received: by 2002:a05:6512:1193:b0:492:7e33:870 with SMTP id
 g19-20020a056512119300b004927e330870mr2475777lfr.37.1662628970810; 
 Thu, 08 Sep 2022 02:22:50 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 bu13-20020a056512168d00b004947f8b6266sm175119lfb.203.2022.09.08.02.22.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 02:22:50 -0700 (PDT)
Message-ID: <0b8b2e01-5209-6437-c79e-3cff9b29bfcb@linaro.org>
Date: Thu, 8 Sep 2022 11:22:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v9 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings
 for DMIC controller
Content-Language: en-US
To: =?UTF-8?B?54+t5rab?= <fengzheng923@gmail.com>
References: <1661872039-40174-1-git-send-email-fengzheng923@gmail.com>
 <25072fba-64e2-df11-c8f0-a274037141f0@linaro.org>
 <CAE=m619qeaDYkWiB5kh50gY1Kndyrvo4oZuZjFKRCKK=j99K2w@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAE=m619qeaDYkWiB5kh50gY1Kndyrvo4oZuZjFKRCKK=j99K2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 samuel@sholland.org, lgirdwood@gmail.com, jernej.skrabec@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, wens@csie.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

On 07/09/2022 15:03, 班涛 wrote:
>>> +++
>> b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
>>> @@ -0,0 +1,79 @@
>>> +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/sound/allwinner,sun50i-h6-dmic.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Allwinner H6 DMIC Device Tree Bindings
>>
>> s/Device Tree Bindings//
>>
> 
> So, modify it to 'Allwinner H6 DMIC Devices Tree Bindings', sure?

You pasted the same message, so what is the modification? I wrote you a
 search&replace pattern.



Best regards,
Krzysztof
